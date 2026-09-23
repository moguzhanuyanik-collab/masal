<?php
declare(strict_types=1);
require __DIR__ . '/src/bootstrap.php';
require __DIR__ . '/src/auth.php';

app_session_start();
try { clear_remember_cookie(db()); } catch (Throwable) { clear_remember_cookie(); }

$_SESSION = [];
if (ini_get('session.use_cookies')) {
    $params = session_get_cookie_params();
    setcookie(
        session_name(),
        '',
        time() - 42000,
        $params['path'] ?: '/',
        $params['domain'] ?? '',
        (bool)$params['secure'],
        (bool)$params['httponly']
    );
}
session_destroy();
?>
<!DOCTYPE html>
<html lang="tr"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Çıkış — İlkAdım</title></head>
<body>
<script>
try{localStorage.removeItem('ilk-adim-profile');}catch(e){}
location.replace('login.php');
</script>
<noscript><a href="login.php">Giriş ekranına dön</a></noscript>
</body></html>
