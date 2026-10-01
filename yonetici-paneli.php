<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/yonetici_yetkileri.php';
require __DIR__.'/src/kurum_hazirlik.php';
require __DIR__.'/src/bildirimler.php';

$user=require_role('yonetici');
$pdo=db();
$notificationUnread=bd_unread_count($pdo,(int)$user['id']);
$ids=auth_manageable_institution_ids($pdo,$user);
$institutionId=(int)($_GET['kurum_id']??($ids[0]??0));
if($institutionId<=0 || (!auth_user_has_role($user,'super_admin') && !in_array($institutionId,$ids,true))){
    $institutionId=(int)($ids[0]??0);
}
$institution=null;
if($institutionId>0){
    try{$s=$pdo->prepare('SELECT * FROM kurumlar WHERE id=? AND aktif=1 LIMIT 1');$s->execute([$institutionId]);$institution=$s->fetch();$s->closeCursor();}catch(Throwable){}
}
function yp_h(string $v):string{return htmlspecialchars($v,ENT_QUOTES,'UTF-8');}
function yp_count(PDO $pdo,string $role,int $institutionId):int{
    try{$s=$pdo->prepare('SELECT COUNT(DISTINCT kullanici_id) FROM kurum_kullanicilari WHERE kurum_id=? AND kurum_rolu=? AND aktif=1');$s->execute([$institutionId,$role]);$v=(int)($s->fetchColumn()?:0);$s->closeCursor();return $v;}catch(Throwable){return 0;}
}
$stats=['ogrenci'=>0,'veli'=>0,'ogretmen'=>0,'yonetici'=>0];
if($institutionId>0)foreach(array_keys($stats) as $r)$stats[$r]=yp_count($pdo,$r,$institutionId);
$canView=yy_can($pdo,$user,'kurum_goruntule');
$hasInstitution=$institutionId>0 && is_array($institution);
$licenseAccess=$hasInstitution
    ?auth_institution_license_access($pdo,$institutionId)
    :['allowed'=>true,'reason'=>'institution_missing','package_name'=>'','start'=>null,'end'=>null];
$operationalOpen=(bool)($licenseAccess['allowed']??true);
$canOperate=$canView && $hasInstitution && $operationalOpen;
$canManageTeachers=yy_can($pdo,$user,'ogretmen_yonet') && $operationalOpen;
$canManageParents=yy_can($pdo,$user,'veli_yonet') && $operationalOpen;
$canManageStudents=yy_can($pdo,$user,'ogrenci_yonet') && $operationalOpen;
$readiness=$canOperate?kh_status($pdo,$institutionId):['percent'=>0,'done'=>0,'total'=>6,'items'=>[],'metrics'=>[]];

?><!doctype html><html lang="tr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover"><title>Yönetici Paneli — İlkAdım</title>
<link rel="stylesheet" href="styles.css"><link rel="stylesheet" href="yonetici.css?v=1.0.42"></head>
<body class="role-page"><div class="role-shell">
<header class="role-topbar"><a class="role-brand" href="yonetici-paneli.php"><span>🧑‍💼</span><span><strong>Yönetici</strong><small>KURUM PANELİ</small></span></a><div class="role-actions"><a class="role-icon" href="yonetici-paneli.php">🏫</a><a class="role-icon" href="bildirimler.php" title="Bildirimler">🔔<?=$notificationUnread>0?' '.$notificationUnread:''?></a><a class="role-icon" href="destek.php" title="Destek">🎧</a><a class="role-icon" href="hesap-guvenligi.php">⚙️</a></div></header>
<main class="role-content">
<section class="role-hero"><span class="eyeline">KURUM YÖNETİMİ</span><h1><?=yp_h((string)($institution['ad']??'Kurum bulunamadı'))?></h1>
<p><?=yp_h((string)$user['ad_soyad'])?> · İçerik kaynağı: <?=yp_h((string)($institution['icerik_kaynagi']??'—'))?></p>
<?php if($canOperate):?><a class="role-primary" href="kurum-detay.php?kurum_id=<?=$institutionId?>">Kurum Bölümlerini Aç →</a><?php endif;?><span class="role-hero-art">🏫</span></section>

<?php if($hasInstitution && !$operationalOpen):?>
<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">LİSANS ERİŞİMİ</span><h2>Operasyonel Modüller Geçici Olarak Kapalı</h2></div><span class="role-pill"><?=yp_h(auth_license_reason_label((string)($licenseAccess['reason']??'')))?></span></div>
<div class="role-note"><span>🔒</span><p>
<?=yp_h((string)$institution['ad'])?> için öğrenci, veli, öğretmen, içerik, sınıf, rapor ve duyuru işlemleri lisans tekrar kullanıma açılana kadar durduruldu.
<?php if((string)($licenseAccess['package_name']??'')!==''):?> Paket: <?=yp_h((string)$licenseAccess['package_name'])?>.<?php endif;?>
<?php if(!empty($licenseAccess['end'])):?> Lisans bitişi: <?=yp_h((string)$licenseAccess['end'])?>.<?php endif;?>
Destek merkezi ve hesap güvenliği açık kalır.
</p></div>
<div class="role-modules">
<a class="role-module" href="destek.php"><span>🎧</span><div><strong>Destek Talebi Aç</strong><small>Paket, yenileme veya lisans durumunu destek ekibine ilet.</small></div><b>→</b></a>
<a class="role-module" href="hesap-guvenligi.php"><span>🔐</span><div><strong>Hesap Güvenliği</strong><small>Hesap ve şifre işlemlerine devam et.</small></div><b>→</b></a>
</div>
</section>
<?php endif;?>

<?php if(count($ids)>1):?><section class="role-section"><div class="role-section-head"><div><span class="eyeline">KURUMLARIM</span><h2>Kurum Değiştir</h2></div></div><div class="role-list">
<?php foreach($ids as $id): try{$s=$pdo->prepare('SELECT ad FROM kurumlar WHERE id=?');$s->execute([$id]);$name=(string)($s->fetchColumn()?:('Kurum #'.$id));$s->closeCursor();}catch(Throwable){$name='Kurum #'.$id;}$switchAccess=auth_institution_license_access($pdo,(int)$id);?>
<a class="role-row" href="yonetici-paneli.php?kurum_id=<?=$id?>"><span>🏫</span><div><strong><?=yp_h($name)?></strong><small><?=($switchAccess['allowed']??false)?'Operasyonel kullanıma açık':yp_h(auth_license_reason_label((string)($switchAccess['reason']??'')))?></small></div><span class="role-pill <?=($switchAccess['allowed']??false)?'ok':''?>"><?=($id===$institutionId?'Seçili · ':'')?><?=($switchAccess['allowed']??false)?'Aktif':'Kısıtlı'?></span></a>
<?php endforeach;?></div></section><?php endif;?>

<?php if($canOperate):?><section class="role-section">
<div class="role-section-head"><div><span class="eyeline">KURULUM DURUMU</span><h2>Kurum Hazırlık</h2></div><span class="role-pill <?=$readiness['percent']===100?'ok':''?>"><?=$readiness['percent']?>%</span></div>
<div class="role-list">
<?php foreach($readiness['items'] as $item):
    $href='kurum-detay.php?kurum_id='.$institutionId;
    if($item['key']==='ogretmen' && $canManageTeachers) $href='kurum-ogretmenleri.php?kurum_id='.$institutionId;
    elseif($item['key']==='ogrenci' && $canManageStudents) $href='kurum-ogrencileri.php?kurum_id='.$institutionId;
    elseif($item['key']==='veli' && $canManageParents) $href='kurum-velileri.php?kurum_id='.$institutionId;
    elseif(in_array($item['key'],['sinif','sinif_ogrenci'],true)) $href='kurum-siniflari.php?kurum_id='.$institutionId;
    elseif($item['key']==='icerik') $href='kurum-icerikleri.php?kurum_id='.$institutionId;
?>
<a class="role-row" href="<?=yp_h($href)?>"><span><?=$item['ready']?'✅':'○'?></span><div><strong><?=yp_h((string)$item['label'])?></strong><small><?=yp_h((string)$item['description'])?></small></div><span class="role-pill <?=$item['ready']?'ok':''?>"><?=$item['ready']?'Tamam':'Eksik'?></span></a>
<?php endforeach;?>
</div>
<div class="role-note"><span>ℹ️</span><p><?=$readiness['done']?> / <?=$readiness['total']?> temel kurulum adımı tamamlandı. Bu gösterge salt okunurdur; mevcut kullanıcı veya içerik kayıtlarını değiştirmez.</p></div>
</section><?php endif;?>

<?php if($canOperate):?><section class="role-section"><div class="role-section-head"><div><span class="eyeline">GENEL BAKIŞ</span><h2>Kurum Özeti</h2></div></div><div class="role-stats">
<?php if($canManageStudents):?><a class="role-stat" href="kurum-ogrencileri.php?kurum_id=<?=$institutionId?>"><span>🎒</span><strong><?=$stats['ogrenci']?></strong><small>Öğrencileri aç →</small></a><?php endif;?>
<?php if($canManageParents):?><a class="role-stat" href="kurum-velileri.php?kurum_id=<?=$institutionId?>"><span>👪</span><strong><?=$stats['veli']?></strong><small>Velileri aç →</small></a><?php endif;?>
<?php if($canManageTeachers):?><a class="role-stat" href="kurum-ogretmenleri.php?kurum_id=<?=$institutionId?>"><span>👩‍🏫</span><strong><?=$stats['ogretmen']?></strong><small>Öğretmenleri aç →</small></a><?php endif;?>
<a class="role-stat" href="kurum-detay.php?kurum_id=<?=$institutionId?>"><span>🏫</span><strong><?=$stats['yonetici']?></strong><small>Kurum bölümlerini aç →</small></a>
</div></section><?php endif;?>

<section class="role-section"><div class="role-section-head"><div><span class="eyeline">HIZLI ERİŞİM</span><h2>Yönetim İşlemleri</h2></div></div><div class="role-modules">
<?php if($canOperate):?><a class="role-module" href="kurum-detay.php?kurum_id=<?=$institutionId?>"><span>🏫</span><div><strong>Kurum Yönetimi</strong><small>İzin verilen kurum bölümlerini görüntüle.</small></div><b>→</b></a><?php endif;?>
<?php if($hasInstitution && $canManageTeachers):?><a class="role-module" href="kurum-ogretmenleri.php?kurum_id=<?=$institutionId?>"><span>👩‍🏫</span><div><strong>Öğretmenler</strong><small>Kurum öğretmenlerini görüntüle ve ekle.</small></div><b>→</b></a><?php endif;?>
<?php if($hasInstitution && $canManageParents):?><a class="role-module" href="kurum-velileri.php?kurum_id=<?=$institutionId?>"><span>👪</span><div><strong>Veliler</strong><small>Kurum velilerini görüntüle ve ekle.</small></div><b>→</b></a><?php endif;?>
<?php if($hasInstitution && $canManageStudents):?><a class="role-module" href="kurum-ogrencileri.php?kurum_id=<?=$institutionId?>"><span>🎒</span><div><strong>Öğrenciler</strong><small>Kurum öğrencilerini görüntüle ve ekle.</small></div><b>→</b></a><?php endif;?>
<?php if($canOperate && $canManageStudents && $canManageParents && $canManageTeachers):?><a class="role-module" href="kurum-eslestirmeleri.php?kurum_id=<?=$institutionId?>"><span>🔗</span><div><strong>Eşleştirmeler</strong><small>Öğrencilere veli ve öğretmen bağla.</small></div><b>→</b></a><?php endif;?>
<?php if($canOperate):?><a class="role-module" href="kurum-icerikleri.php?kurum_id=<?=$institutionId?>"><span>📚</span><div><strong>Kurum İçerikleri</strong><small>Öğretmenlerin yayınladığı içerik ve ödevleri kurum seviyesinde izle.</small></div><b>→</b></a><?php endif;?>
<?php if($canOperate):?><a class="role-module" href="kurum-siniflari.php?kurum_id=<?=$institutionId?>"><span>🏷️</span><div><strong>Sınıflar / Gruplar</strong><small>Kurum sınıflarını ve çalışma gruplarını düzenle.</small></div><b>→</b></a><?php endif;?>
<?php if($canOperate):?><a class="role-module" href="kurum-raporlari.php?kurum_id=<?=$institutionId?>"><span>📊</span><div><strong>Kurum Raporları</strong><small>Sınıf ve tarihe göre yanıtları incele.</small></div><b>→</b></a><?php endif;?>
<?php if($operationalOpen):?><a class="role-module" href="bildirimler.php"><span>🔔</span><div><strong>Bildirim & Duyurular</strong><small><?=$notificationUnread?> okunmamış · Kuruma duyuru gönder ve okunma durumunu izle.</small></div><b>→</b></a><?php endif;?>
<a class="role-module" href="destek.php"><span>🎧</span><div><strong>Destek Merkezi</strong><small>Teknik, hesap, içerik veya paket konularında destek talebi aç.</small></div><b>→</b></a>
<a class="role-module" href="hesap-guvenligi.php"><span>🔐</span><div><strong>Hesap Güvenliği</strong><small>E-posta ve şifre ayarlarını düzenle.</small></div><b>→</b></a>
</div></section>

<?php if($operationalOpen):?><div class="role-note"><span>💡</span><p><?=($institution['icerik_kaynagi']??'sistem')==='sistem'?'Bu kurum İlkAdım sistem içeriklerini kullanır. Öğretmenlerin özel yayınları Kurum İçerikleri bölümünden ayrıca izlenebilir.':'Bu kurumun öğretmen yayınları Kurum İçerikleri bölümünde kurum bazında izlenebilir; öğrenciler aktif yayınları Öğretmenim alanında görür.'?></p></div><?php endif;?>
</main>
<nav class="role-bottom"><a class="active" href="yonetici-paneli.php?kurum_id=<?=$institutionId?>"><span>⌂</span>Panel</a><?php if($canOperate):?><a href="kurum-detay.php?kurum_id=<?=$institutionId?>"><span>👥</span>Kullanıcılar</a><?php endif;?><a href="hesap-guvenligi.php"><span>⚙️</span>Hesap</a><a href="logout.php"><span>🚪</span>Çıkış</a></nav>
</div></body></html>
