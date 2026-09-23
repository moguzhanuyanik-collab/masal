<?php
declare(strict_types=1);
require __DIR__ . '/src/bootstrap.php';
require __DIR__ . '/src/auth.php';
require_student_login();
header('Location: index.php#/profil/ayarlar');
exit;
