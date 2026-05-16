<?php
// sync_massal.php
require __DIR__ . '/vendor/autoload.php';

// Set timeout biar tidak putus di tengah jalan karena datanya banyak
set_time_limit(300); 

echo "<h2>Proses Sinkronisasi Massal ke Google Calendar...</h2>";
echo "<p>Mohon jangan tutup tab ini sampai proses selesai.</p><hr>";

// 1. KONEKSI DATABASE
$host = 'localhost';
$user = 'root';
$pass = '';
$db   = 'kalender_db';

$conn = new mysqli($host, $user, $pass, $db);
if ($conn->connect_error) die("Koneksi DB Gagal");

// 2. SETUP GOOGLE CLIENT
function getGoogleClient() {
    $client = new Google_Client();
    $client->setAuthConfig('credentials.json');
    $client->addScope(Google_Service_Calendar::CALENDAR);
    $client->setAccessType('offline');

    if (file_exists('token.json')) {
        $accessToken = json_decode(file_get_contents('token.json'), true);
        $client->setAccessToken($accessToken);
    } else {
        die("❌ File token.json tidak ditemukan. Login dulu via oauth2callback.php!");
    }

    if ($client->isAccessTokenExpired()) {
        if ($client->getRefreshToken()) {
            $client->fetchAccessTokenWithRefreshToken($client->getRefreshToken());
            file_put_contents('token.json', json_encode($client->getAccessToken()));
        } else {
            die("❌ Token Expired dan tidak bisa refresh. Hapus token.json dan login ulang.");
        }
    }
    return $client;
}

// Fungsi konversi waktu
function toGoogleTime($datetime) {
    $dt = new DateTime($datetime, new DateTimeZone('Asia/Jakarta'));
    return $dt->format('c');
}

// 3. PROSES DATA
try {
    $client = getGoogleClient();
    $service = new Google_Service_Calendar($client);
    $calendarId = 'primary';

    // Ambil data yang BELUM punya ID Google (yang baru diinsert via SQL)
    $sql = "SELECT * FROM events WHERE google_event_id IS NULL OR google_event_id = ''";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $count = 0;
        echo "<ul>";
        
        while($row = $result->fetch_assoc()) {
            $id = $row['id'];
            $title = $row['title'];
            
            // Siapkan Data Google
            $googleEvent = new Google_Service_Calendar_Event([
                'summary' => $row['title'],
                'description' => $row['description'],
                'start' => ['dateTime' => toGoogleTime($row['start_date']), 'timeZone' => 'Asia/Jakarta'],
                'end' => ['dateTime' => toGoogleTime($row['end_date']), 'timeZone' => 'Asia/Jakarta'],
                'colorId' => '10' // Hijau
            ]);

            try {
                // Kirim ke Google
                $createdEvent = $service->events->insert($calendarId, $googleEvent);
                $googleId = $createdEvent->getId();

                // Update Database Lokal dengan ID Google
                $update = $conn->query("UPDATE events SET google_event_id='$googleId' WHERE id='$id'");

                echo "<li>✅ Sukses: <b>$title</b> (Tersinkron)</li>";
                $count++;

                // JEDA SEBENTAR (PENTING) agar tidak dianggap spam oleh Google
                usleep(250000); // Jeda 0.25 detik per data

            } catch (Exception $e) {
                echo "<li style='color:red'>❌ Gagal: <b>$title</b> - " . $e->getMessage() . "</li>";
            }
            
            // Flush output buffer agar tulisan muncul satu per satu di layar
            flush();
            ob_flush();
        }
        echo "</ul>";
        echo "<h3>🏁 Selesai! Total $count kegiatan berhasil disinkronkan.</h3>";
        
    } else {
        echo "<h3>✅ Tidak ada data baru yang perlu disinkronkan. Semua sudah aman.</h3>";
    }

} catch (Exception $e) {
    echo "ERROR UTAMA: " . $e->getMessage();
}
?>