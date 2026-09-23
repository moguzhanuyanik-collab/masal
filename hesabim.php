<?php
declare(strict_types=1);
require __DIR__ . '/src/bootstrap.php';
require __DIR__ . '/src/auth.php';

$user=require_login();
if (auth_user_has_role($user,'ogrenci') && (string)($user['ana_rol']??'')==='ogrenci') {
    header('Location: index.php#/profil/ayarlar');
} else {
    header('Location: rol-paneli.php#hesap');
}
exit;
