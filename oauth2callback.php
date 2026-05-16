<?php
require __DIR__ . '/vendor/autoload.php';

session_start();

$client = new Google_Client();
$client->setAuthConfig('credentials.json');
$client->addScope(Google_Service_Calendar::CALENDAR);
$client->setRedirectUri('http://localhost/e_calendar/oauth2callback.php');
$client->setAccessType('offline');
$client->setPrompt('select_account consent');

if (isset($_GET['code'])) {
    $token = $client->fetchAccessTokenWithAuthCode($_GET['code']);
    $client->setAccessToken($token);
    
    // Simpan token ke file agar bisa dipakai oleh api.php nanti
    file_put_contents('token.json', json_encode($client->getAccessToken()));
    echo "Sinkronisasi Berhasil! Token tersimpan. Silakan tutup tab ini.";
} else {
    $authUrl = $client->createAuthUrl();
    header('Location: ' . $authUrl);
}
?>