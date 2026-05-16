<?php
// api.php
require __DIR__ . '/vendor/autoload.php'; // WAJIB: Load Library Google

header('Content-Type: application/json');

// --- 1. KONFIGURASI DATABASE ---
$host = 'localhost';
$user = 'root'; 
$pass = ''; 
$db   = 'kalender_db';

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) {
    die(json_encode(["error" => "Koneksi gagal: " . $conn->connect_error]));
}

// --- 2. FUNGSI BANTUAN GOOGLE (PENTING) ---
function getGoogleClient() {
    $client = new Google_Client();
    $client->setAuthConfig('credentials.json');
    $client->addScope(Google_Service_Calendar::CALENDAR);
    $client->setAccessType('offline');

    // Load token yang sudah kamu dapatkan sebelumnya
    if (file_exists('token.json')) {
        $accessToken = json_decode(file_get_contents('token.json'), true);
        $client->setAccessToken($accessToken);
    } else {
        return null; // Token hilang
    }

    // Auto-Refresh Token jika expired
    if ($client->isAccessTokenExpired()) {
        if ($client->getRefreshToken()) {
            $client->fetchAccessTokenWithRefreshToken($client->getRefreshToken());
            // Simpan token baru
            file_put_contents('token.json', json_encode($client->getAccessToken()));
        } else {
            return null; // Harus login ulang
        }
    }
    return $client;
}

// Fungsi ubah format waktu ke standar Google
function toGoogleTime($datetime) {
    $dt = new DateTime($datetime, new DateTimeZone('Asia/Jakarta'));
    return $dt->format('c');
}

$action = isset($_GET['action']) ? $_GET['action'] : '';

// --- 3. LOGIKA READ (Sama seperti dulu) ---
if ($action == 'fetch') {
    $result = $conn->query("SELECT * FROM events ORDER BY start_date ASC");
    $data = [];
    while ($row = $result->fetch_assoc()) {
        $data[] = [
            'id' => $row['id'],
            'title' => $row['title'],
            'text' => $row['description'],
            'start' => $row['start_date'],
            'end' => $row['end_date'],
            'class' => $row['category']
        ];
    }
    echo json_encode($data);
}

// --- 4. LOGIKA SAVE (SINKRONISASI GOOGLE ADA DI SINI) ---
if ($action == 'save') {
    $title = $_POST['title'];
    $desc  = $_POST['description'];
    $start = date('Y-m-d H:i:s', strtotime($_POST['start_date']));
    $end   = date('Y-m-d H:i:s', strtotime($_POST['end_date']));
    $cat   = $_POST['category'];
    $id    = isset($_POST['id']) ? $_POST['id'] : '';

    // Siapkan Koneksi ke Google
    $client = getGoogleClient();
    $service = ($client) ? new Google_Service_Calendar($client) : null;
    $calendarId = 'primary';
    $googleEventId = null;

    // Data Event untuk Google
    $googleEventData = new Google_Service_Calendar_Event([
        'summary' => $title,
        'description' => $desc,
        'start' => ['dateTime' => toGoogleTime($start), 'timeZone' => 'Asia/Jakarta'],
        'end' => ['dateTime' => toGoogleTime($end), 'timeZone' => 'Asia/Jakarta'],
        'colorId' => '10' // Default hijau (opsional)
    ]);

    try {
        if (!empty($id)) {
            // === UPDATE EVENT ===
            
            // 1. Ambil ID Google lama dari database
            $q = $conn->query("SELECT google_event_id FROM events WHERE id=$id");
            $oldData = $q->fetch_assoc();
            $existingGoogleId = $oldData['google_event_id'];

            // 2. Update di Database Lokal
            $stmt = $conn->prepare("UPDATE events SET title=?, description=?, start_date=?, end_date=?, category=? WHERE id=?");
            $stmt->bind_param("sssssi", $title, $desc, $start, $end, $cat, $id);
            $stmt->execute();

            // 3. Update di Google Calendar (Jika ada koneksi & ID)
            if ($service && $existingGoogleId) {
                $service->events->update($calendarId, $existingGoogleId, $googleEventData);
            }

        } else {
            // === INSERT BARU ===

            // 1. Kirim ke Google DULU untuk dapat ID-nya
            if ($service) {
                $createdEvent = $service->events->insert($calendarId, $googleEventData);
                $googleEventId = $createdEvent->getId(); // Dapatkan ID unik Google (contoh: 74p0...)
            }

            // 2. Simpan ke Database Lokal (Beserta ID Google-nya)
            $stmt = $conn->prepare("INSERT INTO events (title, description, start_date, end_date, category, google_event_id) VALUES (?, ?, ?, ?, ?, ?)");
            $stmt->bind_param("ssssss", $title, $desc, $start, $end, $cat, $googleEventId);
            $stmt->execute();
        }

        echo json_encode(['status' => 'success']);

    } catch (Exception $e) {
        // Jika Google Error, simpan pesan errornya tapi jangan matikan aplikasi
        echo json_encode(['status' => 'success_local', 'msg' => 'Disimpan lokal, Google skip: ' . $e->getMessage()]);
    }
}

// --- 5. LOGIKA DELETE (SINKRONISASI GOOGLE) ---
if ($action == 'delete') {
    $id = $_POST['id'];

    // Ambil Google ID dulu sebelum dihapus
    $q = $conn->query("SELECT google_event_id FROM events WHERE id=$id");
    $row = $q->fetch_assoc();
    $googleId = $row['google_event_id'];

    // Hapus dari Google Calendar
    $client = getGoogleClient();
    if ($client && $googleId) {
        try {
            $service = new Google_Service_Calendar($client);
            $service->events->delete('primary', $googleId);
        } catch (Exception $e) {
            // Abaikan jika tidak ketemu di Google
        }
    }

    // Hapus dari Database Lokal
    $stmt = $conn->prepare("DELETE FROM events WHERE id=?");
    $stmt->bind_param("i", $id);
    if ($stmt->execute()) {
        echo json_encode(['status' => 'success']);
    } else {
        echo json_encode(['status' => 'error']);
    }
}

$conn->close();
?>