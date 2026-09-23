<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/kurum_yonetimi.php';
$actor=require_role('super_admin');$pdo=db();$message='';$error='';
$students=ky_global_students($pdo);$parents=ky_global_parents($pdo);
$studentNames=[];$parentNames=[];$parentProfiles=[];
foreach($students as $row)$studentNames[(int)$row['ogrenci_id']]=(string)($row['ad']?:$row['email']);
foreach($parents as $row){$parentNames[(int)$row['veli_id']]=(string)$row['ad_soyad'];$parentProfiles[(int)$row['veli_id']]=(int)$row['kullanici_id'];}
try {
    if($_SERVER['REQUEST_METHOD']==='POST'){
        if(!verify_csrf($_POST['csrf']??null))throw new RuntimeException('Güvenlik doğrulaması başarısız.');
        $action=(string)($_POST['action']??'');
        if($action==='link'){
            ky_link_global_parent_student($pdo,$actor,(int)($_POST['veli_kullanici_id']??0),(int)($_POST['ogrenci_id']??0));
            $message='Eşleştirme kaydedildi.';
        }elseif($action==='unlink'){
            $parentId=(int)($_POST['veli_id']??0);$studentId=(int)($_POST['ogrenci_id']??0);
            if(!isset($parentNames[$parentId],$studentNames[$studentId]))throw new RuntimeException('Global eşleştirme bulunamadı.');
            $stmt=$pdo->prepare('DELETE FROM veli_ogrenci WHERE veli_id=? AND ogrenci_id=?');
            $stmt->execute([$parentId,$studentId]);
            auth_audit($pdo,(int)$actor['id'],$parentProfiles[$parentId],'global_eslestirme_kaldir','Öğrenci: '.$studentId);
            $message='Eşleştirme kaldırıldı.';
        }else throw new RuntimeException('Geçersiz işlem.');
    }
}catch(Throwable $e){$error=$e->getMessage();}
$links=[];
try{
    $stmt=$pdo->query('SELECT veli_id,ogrenci_id FROM veli_ogrenci ORDER BY veli_id,ogrenci_id');
    foreach($stmt as $row){$pid=(int)$row['veli_id'];$sid=(int)$row['ogrenci_id'];if(isset($parentNames[$pid],$studentNames[$sid]))$links[]=[$pid,$sid];}
}catch(Throwable){$error='Eşleştirmeler okunamadı.';}
?><!doctype html><html lang="tr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover"><title>Global Eşleştirme — İlkAdım</title><link rel="stylesheet" href="super-admin-pages.css?v=1.0.72"></head>
<body class="sa-subpage"><?php require __DIR__.'/src/super_admin_icons.php'; ?><div class="app-shell">
<header class="app-topbar"><a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Yönetim Merkezi</small></span></a><div class="sa-page-actions"><a class="sa-page-action" href="super-admin-profil.php" aria-label="Profil"><svg><use href="#sa-user"/></svg></a></div></header>
<main id="screen"><div class="screen-content"><section class="subpage-intro"><span><svg><use href="#sa-link"/></svg></span><h1>Global Eşleştirme</h1><p>Kurumdan bağımsız öğrencilerle velilerini eşleştirin.</p></section>
<?php if($message):?><div class="role-note"><span><svg><use href="#sa-check"/></svg></span><p><?=ky_h($message)?></p></div><?php endif;?>
<?php if($error):?><div class="role-note"><span><svg><use href="#sa-alert"/></svg></span><p><?=ky_h($error)?></p></div><?php endif;?>
<section class="role-section"><div class="role-section-head"><div><span class="eyeline">YENİ BAĞLANTI</span><h2>Veli ve Öğrenci</h2></div></div>
<?php if($students && $parents):?><form method="post" class="role-form"><input type="hidden" name="csrf" value="<?=ky_h(csrf_token())?>"><input type="hidden" name="action" value="link"><label>Öğrenci</label><select class="role-input" name="ogrenci_id" required><?php foreach($students as $s):?><option value="<?=(int)$s['ogrenci_id']?>"><?=ky_h((string)($s['ad']?:$s['email']))?></option><?php endforeach;?></select><label>Veli</label><select class="role-input" name="veli_kullanici_id" required><?php foreach($parents as $p):?><option value="<?=(int)$p['kullanici_id']?>"><?=ky_h((string)$p['ad_soyad'])?></option><?php endforeach;?></select><button class="role-button" type="submit">Eşleştir</button></form>
<?php else:?><div class="role-empty">Eşleştirme için global öğrenci ve veli hesabı gerekir.</div><?php endif;?></section>
<section class="role-section"><div class="role-section-head"><div><span class="eyeline">AKTİF BAĞLANTILAR</span><h2>Eşleştirmeler</h2></div><span class="role-pill"><?=count($links)?></span></div><div class="role-list">
<?php if(!$links):?><div class="role-empty">Henüz eşleştirme yok.</div><?php endif;?>
<?php foreach($links as [$pid,$sid]):?><div class="role-row"><span><svg><use href="#sa-link"/></svg></span><div><strong><?=ky_h($studentNames[$sid])?></strong><small>Veli: <?=ky_h($parentNames[$pid])?></small></div><form method="post"><input type="hidden" name="csrf" value="<?=ky_h(csrf_token())?>"><input type="hidden" name="action" value="unlink"><input type="hidden" name="veli_id" value="<?=$pid?>"><input type="hidden" name="ogrenci_id" value="<?=$sid?>"><button class="yy-remove" type="submit" onclick="return confirm('Eşleştirme kaldırılsın mı?')">Kaldır</button></form></div><?php endforeach;?></div></section>
</div></main><nav class="app-nav" aria-label="Süper Admin menüsü"><a href="super-admin.php"><span><svg><use href="#sa-home"/></svg></span>Panel</a><a href="kurumlar.php"><span><svg><use href="#sa-building"/></svg></span>Kurumlar</a><a class="active" href="global.php"><span><svg><use href="#sa-users"/></svg></span>Global</a><a href="yonetici-yetkileri.php"><span><svg><use href="#sa-shield"/></svg></span>Yetkiler</a><a href="super-admin-profil.php"><span><svg><use href="#sa-user"/></svg></span>Profil</a></nav></div></body></html>
