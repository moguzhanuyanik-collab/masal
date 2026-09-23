<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';

$user=require_role(['yonetici','super_admin']);
$pdo=db();
$manageable=auth_manageable_institution_ids($pdo,$user);
$institutionId=(int)($_REQUEST['kurum_id']??($manageable[0]??0));

if($institutionId<=0 || (!auth_user_has_role($user,'super_admin') && !in_array($institutionId,$manageable,true))){
    $institutionId=(int)($manageable[0]??0);
}

if($institutionId>0){
    header('Location: kurum-detay.php?kurum_id='.$institutionId);
    exit;
}

header('Location: '.(auth_user_has_role($user,'super_admin')?'kurumlar.php':'yonetici-paneli.php'));
exit;
