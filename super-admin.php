<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';

$user=require_role('super_admin');
$pdo=db();

function sa_h(string $v): string { return htmlspecialchars($v,ENT_QUOTES,'UTF-8'); }
function sa_scalar(PDO $pdo,string $sql,array $params=[]): int {
    try {$s=$pdo->prepare($sql);$s->execute($params);$v=(int)($s->fetchColumn()?:0);$s->closeCursor();return $v;} catch(Throwable){return 0;}
}
function sa_value(PDO $pdo,string $sql): string {
    try {$s=$pdo->query($sql);$v=(string)($s?$s->fetchColumn():'');if($s)$s->closeCursor();return $v;}catch(Throwable){return '';}
}
function sa_version(): string {
    $p=__DIR__.'/version.json'; if(!is_file($p))return '—';
    $j=json_decode((string)file_get_contents($p),true); return is_array($j)?(string)($j['version']??'—'):'—';
}
$stats=[
 'kurum'=>auth_runtime_table_exists($pdo,'kurumlar')?sa_scalar($pdo,'SELECT COUNT(*) FROM kurumlar WHERE aktif=1'):0,
 'kullanici'=>auth_runtime_table_exists($pdo,'kullanicilar')?sa_scalar($pdo,'SELECT COUNT(*) FROM kullanicilar WHERE aktif=1'):0,
 'ogrenci'=>auth_runtime_table_exists($pdo,'ogrenciler')?sa_scalar($pdo,'SELECT COUNT(*) FROM ogrenciler WHERE aktif=1'):0,
 'yonetici'=>auth_runtime_table_exists($pdo,'kullanici_rolleri')?sa_scalar($pdo,"SELECT COUNT(DISTINCT kullanici_id) FROM kullanici_rolleri WHERE rol='yonetici'"):0,
];
$lastUpdate=auth_runtime_table_exists($pdo,'guncelleme_gecmisi')?sa_value($pdo,"SELECT COALESCE(MAX(bitis_tarihi),'') FROM guncelleme_gecmisi WHERE durum='basarili'"):'';
$syncCount=auth_runtime_table_exists($pdo,'pwa_sync_islemleri')?sa_scalar($pdo,'SELECT COUNT(*) FROM pwa_sync_islemleri'):0;
?><!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<meta name="theme-color" content="#f8f7fc">
<title>Süper Admin — İlkAdım</title>
<link rel="stylesheet" href="super-admin.css?v=1.0.55">
</head>
<body class="sa-page">
<div class="sa-shell">
<header class="sa-topbar">
  <a class="sa-brand" href="super-admin.php"><span class="sa-logo">🌞</span><span><strong>İlkAdım</strong><small>Süper Admin</small></span></a>
  <div class="sa-top-actions"><a href="guncelleme.php" aria-label="Güncellemeler">🔔</a><a href="hesap-guvenligi.php" aria-label="Hesabım">👤</a></div>
</header>

<main class="sa-content">
<section class="sa-welcome">
  <div><small>MERHABA 👋</small><h1><?=sa_h((string)$user['ad_soyad'])?></h1><p>İlkAdım yönetim merkezine hoş geldin.</p></div>
  <span class="sa-welcome-art">🛡️</span>
</section>

<section class="sa-section">
 <div class="sa-section-title"><div><small>GENEL BAKIŞ</small><h2>Bugün İlkAdım</h2></div><span class="sa-version">v<?=sa_h(sa_version())?></span></div>
 <div class="sa-cards">
  <a href="kurumlar.php" class="sa-card"><span>🏫</span><strong><?=$stats['kurum']?></strong><small>Aktif Kurum</small></a>
  <div class="sa-card"><span>👥</span><strong><?=$stats['kullanici']?></strong><small>Aktif Kullanıcı</small></div>
  <a href="global-ogrenciler.php" class="sa-card"><span>🎒</span><strong><?=$stats['ogrenci']?></strong><small>Öğrenci</small></a>
  <a href="yetkilendirme.php" class="sa-card"><span>🧑‍💼</span><strong><?=$stats['yonetici']?></strong><small>Yönetici</small></a>
 </div>
</section>

<section class="sa-section">
 <div class="sa-section-title"><div><small>HIZLI ERİŞİM</small><h2>Yönetim Alanları</h2></div></div>
 <div class="sa-menu-grid">
  <a href="kurumlar.php"><span class="sa-menu-icon">🏫</span><strong>Kurumlar</strong><small>Kurumları yönet</small></a>
  <a href="global-ogrenciler.php"><span class="sa-menu-icon">🎒</span><strong>Öğrenciler</strong><small>Öğrencileri yönet</small></a>
  <a href="global-veliler.php"><span class="sa-menu-icon">👪</span><strong>Veliler</strong><small>Velileri yönet</small></a>
  <a href="yetkilendirme.php"><span class="sa-menu-icon">🛡️</span><strong>Yetkiler</strong><small>Rolleri yönet</small></a>
  <a href="guncelleme.php"><span class="sa-menu-icon">🔄</span><strong>Güncelleme</strong><small>Yeni sürümleri kontrol et</small></a>
  <a href="hesap-guvenligi.php"><span class="sa-menu-icon">⚙️</span><strong>Ayarlar</strong><small>Hesap ve güvenlik</small></a>
 </div>
</section>

<section class="sa-section">
 <div class="sa-section-title"><div><small>SİSTEM</small><h2>Sistem Durumu</h2></div></div>
 <div class="sa-status-list">
  <div><span>🗄️</span><p><strong>MySQL</strong><small>Canlı veritabanı bağlantısı</small></p><b>Aktif</b></div>
  <div><span>📴</span><p><strong>PWA Eşitleme</strong><small><?=$syncCount?> eşitleme kaydı</small></p><b>Aktif</b></div>
  <div><span>🔄</span><p><strong>Son Güncelleme</strong><small><?=sa_h($lastUpdate!==''?$lastUpdate:'Henüz kayıt yok')?></small></p><em>v<?=sa_h(sa_version())?></em></div>
 </div>
</section>
</main>

<nav class="sa-bottom" aria-label="Süper Admin menüsü">
 <a class="active" href="super-admin.php"><span>⌂</span>Panel</a>
 <a href="kurumlar.php"><span>🏫</span>Kurumlar</a>
 <a href="global-ogrenciler.php"><span>🎒</span>Öğrenciler</a>
 <a href="global-veliler.php"><span>👪</span>Veliler</a>
 <a href="hesap-guvenligi.php"><span>👤</span>Profil</a>
</nav>
</div>
</body>
</html>