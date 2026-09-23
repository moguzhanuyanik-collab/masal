<?php
declare(strict_types=1);
require __DIR__ . '/src/bootstrap.php';
require __DIR__ . '/src/auth.php';

$user=require_login();
if (auth_effective_role($user)==='ogrenci') {
    header('Location: index.php#/profil/ayarlar');
} else {
    header('Location: hesap-guvenligi.php');
}
exit;
