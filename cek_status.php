<?php
require __DIR__ . '/vendor/autoload.php';

echo "<h3>Diagnosa Sistem Kalender</h3>";

// 1. Cek Credentials
if (file_exists('credentials.json')) {
    echo "✅ File <b>credentials.json</b> DITEMUKAN.<br>";
} else {
    echo "❌ File <b>credentials.json</b> TIDAK ADA! Pastikan namanya benar dan ada di folder ini.<br>";
}

// 2. Cek Token
if (file_exists('token.json')) {
    echo "✅ File <b>token.json</b> DITEMUKAN.<br>";
    
    $tokenContent = file_get_contents('token.json');
    $token = json_decode($tokenContent, true);
    
    if (json_last_error() === JSON_ERROR_NONE && !empty($token)) {
        echo "✅ Format JSON Token VALID.<br>";
    } else {
        echo "❌ Format JSON Token RUSAK/KOSONG. Hapus file token.json dan login ulang.<br>";
    }
} else {
    echo "❌ File <b>token.json</b> TIDAK ADA! Silakan jalankan oauth2callback.php lagi.<br>";
}

// 3. Tes Koneksi Real
echo "<hr>Mencoba koneksi ke Google...<br>";
try {
    $client = new Google_Client();
    $client->setAuthConfig('credentials.json');
    $client->setAccessType('offline');
    
    if (file_exists('token.json')) {
        $client->setAccessToken(json_decode(file_get_contents('token.json'), true));
    }

    if ($client->isAccessTokenExpired()) {
        echo "⚠️ Token KADALUARSA. Mencoba refresh... ";
        if ($client->getRefreshToken()) {
            $client->fetchAccessTokenWithRefreshToken($client->getRefreshToken());
            echo "BERHASIL Refresh!<br>";
        } else {
            echo "GAGAL! Tidak ada Refresh Token. Hapus token.json dan login ulang.<br>";
            exit;
        }
    }

    $service = new Google_Service_Calendar($client);
    $calendarId = 'primary';
    $results = $service->events->listEvents($calendarId, ['maxResults' => 1]);
    echo "✅ <b>SUKSES!</b> Terhubung ke kalender: " . $results->getSummary();
    
} catch (Exception $e) {
    echo "❌ <b>ERROR GOOGLE:</b> " . $e->getMessage();
}
?>