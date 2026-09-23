<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';

$user=require_role(['yonetici','super_admin']);
$pdo=db();
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
?><!doctype html><html lang="tr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover"><title>Yönetici Paneli — İlkAdım</title>
<link rel="stylesheet" href="styles.css"><link rel="stylesheet" href="yonetici.css?v=1.0.41"></head>
<body class="role-page"><div class="role-shell">
<header class="role-topbar"><a class="role-brand" href="yonetici-paneli.php"><span>🧑‍💼</span><span><strong>Yönetici</strong><small>KURUM PANELİ</small></span></a><div class="role-actions"><?php if(auth_user_has_role($user,'super_admin')):?><a class="role-icon" href="super-admin.php">👑</a><?php endif;?><a class="role-icon" href="hesap-guvenligi.php">⚙️</a></div></header>
<main class="role-content">
<section class="role-hero"><span class="eyeline">KURUM YÖNETİMİ</span><h1><?=yp_h((string)($institution['ad']??'Kurum bulunamadı'))?></h1>
<p><?=yp_h((string)$user['ad_soyad'])?> · İçerik kaynağı: <?=yp_h((string)($institution['icerik_kaynagi']??'—'))?></p>
<?php if($institutionId>0):?><a class="role-primary" href="kurum-detay.php?kurum_id=<?=$institutionId?>">Kullanıcı Ekle →</a><?php endif;?><span class="role-hero-art">🏫</span></section>

<?php if(count($ids)>1):?><section class="role-section"><div class="role-section-head"><div><span class="eyeline">KURUMLARIM</span><h2>Kurum Değiştir</h2></div></div><div class="role-list">
<?php foreach($ids as $id): try{$s=$pdo->prepare('SELECT ad FROM kurumlar WHERE id=?');$s->execute([$id]);$name=(string)($s->fetchColumn()?:('Kurum #'.$id));$s->closeCursor();}catch(Throwable){$name='Kurum #'.$id;}?>
<a class="role-row" href="yonetici-paneli.php?kurum_id=<?=$id?>"><span>🏫</span><div><strong><?=yp_h($name)?></strong><small>Kurum panelini aç</small></div><?=($id===$institutionId?'<span class="role-pill ok">Seçili</span>':'')?></a>
<?php endforeach;?></div></section><?php endif;?>

<section class="role-section"><div class="role-section-head"><div><span class="eyeline">GENEL BAKIŞ</span><h2>Kurum Özeti</h2></div></div><div class="role-stats">
<div class="role-stat"><span>🎒</span><strong><?=$stats['ogrenci']?></strong><small>Öğrenci</small></div>
<div class="role-stat"><span>👪</span><strong><?=$stats['veli']?></strong><small>Veli</small></div>
<div class="role-stat"><span>👩‍🏫</span><strong><?=$stats['ogretmen']?></strong><small>Öğretmen</small></div>
<div class="role-stat"><span>🧑‍💼</span><strong><?=$stats['yonetici']?></strong><small>Yönetici</small></div>
</div></section>

<section class="role-section"><div class="role-section-head"><div><span class="eyeline">HIZLI ERİŞİM</span><h2>Yönetim İşlemleri</h2></div></div><div class="role-modules">
<a class="role-module" href="kurum-detay.php?kurum_id=<?=$institutionId?>"><span>🏫</span><div><strong>Kurum Yönetimi</strong><small>Öğretmen, veli ve öğrencileri ayrı sayfalardan yönet.</small></div><b>→</b></a>
<a class="role-module" href="rol-paneli.php"><span>🛡️</span><div><strong>Hesap ve Yetkiler</strong><small>Kendi rollerini ve erişimlerini görüntüle.</small></div><b>→</b></a>
<a class="role-module" href="hesap-guvenligi.php"><span>🔐</span><div><strong>Hesap Güvenliği</strong><small>E-posta ve şifre ayarlarını düzenle.</small></div><b>→</b></a>
</div></section>

<div class="role-note"><span>💡</span><p><?=($institution['icerik_kaynagi']??'sistem')==='sistem'?'Bu kurum İlkAdım sistem içeriklerini kullanır. Doğrudan/okulsuz öğrenciler için uygundur.':'Bu kurumun özel içerik kaynağı daha sonra öğretmen içerikleriyle etkinleştirilecek.'?></p></div>
</main>
<nav class="role-bottom"><a class="active" href="yonetici-paneli.php?kurum_id=<?=$institutionId?>"><span>⌂</span>Panel</a><a href="kurum-detay.php?kurum_id=<?=$institutionId?>"><span>👥</span>Kullanıcılar</a><a href="rol-paneli.php"><span>🛡️</span>Yetkiler</a><a href="logout.php"><span>🚪</span>Çıkış</a></nav>
</div></body></html>