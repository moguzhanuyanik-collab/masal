<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
$user=require_role('super_admin');
$base=__DIR__.'/storage/profil/'.(int)$user['id'];
$path=is_file($base.'.webp')?$base.'.webp':(is_file($base.'.jpg')?$base.'.jpg':'');
if($path===''){http_response_code(404);exit;}
header('Content-Type: '.(str_ends_with($path,'.webp')?'image/webp':'image/jpeg'));
header('Cache-Control: private, max-age=300');
header('X-Content-Type-Options: nosniff');
readfile($path);
