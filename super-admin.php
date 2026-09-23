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
function sa_rows(PDO $pdo,string $sql): array {
    try {$s=$pdo->query($sql);$rows=$s?$s->fetchAll(PDO::FETCH_ASSOC):[];if($s)$s->closeCursor();return is_array($rows)?$rows:[];} catch(Throwable){return [];}
}
function sa_version(): string {
    $p=__DIR__.'/version.json'; if(!is_file($p))return '—';
    $j=json_decode((string)file_get_contents($p),true); return is_array($j)?(string)($j['version']??'—'):'—';
}
$stats=[
 'kurum'=>auth_runtime_table_exists($pdo,'kurumlar')?sa_scalar($pdo,'SELECT COUNT(*) FROM kurumlar WHERE aktif=1'):0,
 'ogrenci'=>auth_runtime_table_exists($pdo,'ogrenciler')?sa_scalar($pdo,'SELECT COUNT(*) FROM ogrenciler WHERE aktif=1'):0,
 'ogretmen'=>auth_runtime_table_exists($pdo,'ogretmenler')?sa_scalar($pdo,'SELECT COUNT(*) FROM ogretmenler WHERE aktif=1'):0,
 'veli'=>auth_runtime_table_exists($pdo,'veliler')?sa_scalar($pdo,'SELECT COUNT(*) FROM veliler WHERE aktif=1'):0,
];
$lastUpdate=auth_runtime_table_exists($pdo,'guncelleme_gecmisi')?sa_value($pdo,"SELECT COALESCE(MAX(bitis_tarihi),'') FROM guncelleme_gecmisi WHERE durum='basarili'"):'';
$syncCount=auth_runtime_table_exists($pdo,'pwa_sync_islemleri')?sa_scalar($pdo,'SELECT COUNT(*) FROM pwa_sync_islemleri'):0;
$institutionRows=auth_runtime_table_exists($pdo,'kurumlar')?sa_rows($pdo,'SELECT id,ad,kod,tur,aktif FROM kurumlar ORDER BY aktif DESC,id DESC LIMIT 5'):[];
$photoBase=__DIR__.'/storage/profil/'.(int)$user['id'];
$profilePhoto=is_file($photoBase.'.webp')?$photoBase.'.webp':(is_file($photoBase.'.jpg')?$photoBase.'.jpg':'');
?><!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<meta name="theme-color" content="#f7f7fb">
<title>Süper Admin — İlkAdım</title>
<link rel="stylesheet" href="super-admin.css?v=1.0.62">
</head>
<body class="sa-page">
<svg class="sa-icon-library" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
  <symbol id="sa-home" viewBox="0 0 24 24"><path d="M3 10.8 12 3l9 7.8v9.2a1 1 0 0 1-1 1h-5v-6H9v6H4a1 1 0 0 1-1-1z"/></symbol>
  <symbol id="sa-building" viewBox="0 0 24 24"><path d="M4 21V5a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v16M8 7h4M8 11h4M8 15h4M16 9h2a2 2 0 0 1 2 2v10M3 21h18"/></symbol>
  <symbol id="sa-users" viewBox="0 0 24 24"><path d="M16 21v-2a4 4 0 0 0-4-4H6a4 4 0 0 0-4 4v2M9 11a4 4 0 1 0 0-8 4 4 0 0 0 0 8ZM22 21v-2a4 4 0 0 0-3-3.87M16 3.13a4 4 0 0 1 0 7.75"/></symbol>
  <symbol id="sa-student" viewBox="0 0 24 24"><path d="m2 9 10-5 10 5-10 5zM6 11.5V16c0 1.8 2.7 3.5 6 3.5s6-1.7 6-3.5v-4.5M22 9v6"/></symbol>
  <symbol id="sa-shield" viewBox="0 0 24 24"><path d="M12 3 5 6v5c0 4.7 2.8 8.7 7 10 4.2-1.3 7-5.3 7-10V6zM9 12l2 2 4-5"/></symbol>
  <symbol id="sa-refresh" viewBox="0 0 24 24"><path d="M20 7v5h-5M4 17v-5h5M6.1 8A7 7 0 0 1 18 6l2 1M18 16a7 7 0 0 1-11.9 2L4 17"/></symbol>
  <symbol id="sa-settings" viewBox="0 0 24 24"><path d="M12 15.5A3.5 3.5 0 1 0 12 8a3.5 3.5 0 0 0 0 7.5ZM19.4 15a1.7 1.7 0 0 0 .34 1.88l.06.06-2.86 2.86-.06-.06A1.7 1.7 0 0 0 15 19.4a1.7 1.7 0 0 0-1 .6 1.7 1.7 0 0 0-.4 1.1V21H9.6v-.1a1.7 1.7 0 0 0-1.1-1.5 1.7 1.7 0 0 0-1.88.34l-.06.06-2.86-2.86.06-.06A1.7 1.7 0 0 0 4.1 15a1.7 1.7 0 0 0-.6-1 1.7 1.7 0 0 0-1.1-.4H2v-4h.4A1.7 1.7 0 0 0 4 8.5a1.7 1.7 0 0 0-.34-1.88L3.6 6.56 6.46 3.7l.06.06A1.7 1.7 0 0 0 8.4 4.1a1.7 1.7 0 0 0 1-.6A1.7 1.7 0 0 0 9.8 2.4V2h4v.4A1.7 1.7 0 0 0 14.9 4a1.7 1.7 0 0 0 1.88-.34l.06-.06 2.86 2.86-.06.06A1.7 1.7 0 0 0 19.3 8.4a1.7 1.7 0 0 0 .6 1 1.7 1.7 0 0 0 1.1.4h.4v4H21a1.7 1.7 0 0 0-1.6 1.2Z"/></symbol>
  <symbol id="sa-user" viewBox="0 0 24 24"><circle cx="12" cy="8" r="4"/><path d="M4 21v-2a8 8 0 0 1 16 0v2"/></symbol>
  <symbol id="sa-bell" viewBox="0 0 24 24"><path d="M5 17h14l-2-3V9a5 5 0 0 0-10 0v5zM10 21h4"/></symbol>
  <symbol id="sa-database" viewBox="0 0 24 24"><ellipse cx="12" cy="5" rx="8" ry="3"/><path d="M4 5v6c0 1.7 3.6 3 8 3s8-1.3 8-3V5M4 11v6c0 1.7 3.6 3 8 3s8-1.3 8-3v-6"/></symbol>
  <symbol id="sa-cloud" viewBox="0 0 24 24"><path d="M7 18h10a4 4 0 0 0 .7-7.94A6 6 0 0 0 6.3 8.4 4.5 4.5 0 0 0 7 18Z"/></symbol>
  <symbol id="sa-arrow" viewBox="0 0 24 24"><path d="m9 5 7 7-7 7"/></symbol>
  <symbol id="sa-link" viewBox="0 0 24 24"><path d="M10 13a5 5 0 0 0 7.1 0l2.1-2.1a5 5 0 0 0-7.1-7.1L10 6M14 11a5 5 0 0 0-7.1 0l-2.1 2.1a5 5 0 0 0 7.1 7.1L14 18"/></symbol>
</svg>

<div class="sa-shell">
<aside class="sa-sidebar" aria-label="Süper Admin gezinme">
  <a class="sa-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Yönetim Merkezi</small></span></a>
  <p class="sa-sidebar-label">ÇALIŞMA ALANI</p>
  <a class="active" href="super-admin.php"><svg><use href="#sa-home"/></svg>Genel Bakış</a>
  <a href="kurumlar.php"><svg><use href="#sa-building"/></svg>Kurum Yönetimi</a>
  <a href="kurumlar.php?sekme=yoneticiler"><svg><use href="#sa-shield"/></svg>Kurum Yöneticileri</a>
  <a href="kurumlar.php?sekme=ogretmenler"><svg><use href="#sa-users"/></svg>Öğretmenler</a>
  <a href="kurumlar.php?sekme=veliler"><svg><use href="#sa-users"/></svg>Veliler</a>
  <p class="sa-sidebar-label">GLOBAL</p>
  <a href="global-ogrenciler.php"><svg><use href="#sa-student"/></svg>Global Öğrenciler</a>
  <a href="global-veliler.php"><svg><use href="#sa-users"/></svg>Global Veliler</a>
  <a href="global-eslestirme.php"><svg><use href="#sa-link"/></svg>Eşleştirme</a>
  <p class="sa-sidebar-label">YETKİLENDİRME</p>
  <a href="yonetici-yetkileri.php"><svg><use href="#sa-shield"/></svg>Yönetici Yetkileri</a>
  <p class="sa-sidebar-label">SİSTEM</p>
  <a href="guncelleme.php"><svg><use href="#sa-refresh"/></svg>Güncellemeler</a>
  <a href="super-admin-profil.php"><svg><use href="#sa-user"/></svg>Profilim</a>
</aside>
<div class="sa-workspace">
<header class="sa-topbar">
  <a class="sa-brand" href="super-admin.php">
    <span class="sa-brand-mark">İA</span>
    <span><strong>İlkAdım</strong><small>Yönetim Merkezi</small></span>
  </a>
  <div class="sa-top-actions">
    <a href="guncelleme.php" aria-label="Güncellemeler"><svg><use href="#sa-bell"/></svg></a>
    <a href="super-admin-profil.php" aria-label="Profilim"><?php if($profilePhoto):?><img class="sa-avatar" src="profil-foto.php?v=<?=filemtime($profilePhoto)?>" width="35" height="35" alt=""><?php else:?><svg><use href="#sa-user"/></svg><?php endif;?></a>
  </div>
</header>

<main class="sa-content">
<section class="sa-welcome sa-welcome-compact">
  <div class="sa-welcome-copy">
    <span class="sa-kicker">SÜPER ADMİN · GENEL BAKIŞ</span>
    <h1>Hoş geldiniz, <?=sa_h((string)$user['ad_soyad'])?></h1>
    <p>Önemli bilgileri tek bakışta görün; ayrıntılı işlemleri menülerden yönetin.</p>
    <div class="sa-welcome-meta"><span><i></i>Sistem aktif</span><span>v<?=sa_h(sa_version())?></span></div>
  </div>
  <div class="sa-welcome-mark"><svg><use href="#sa-shield"/></svg></div>
</section>

<section class="sa-section sa-summary-section">
 <div class="sa-section-title"><div><small>GENEL BAKIŞ</small><h2>Sistem Özeti</h2></div><span class="sa-section-note">Canlı veriler</span></div>
 <div class="sa-cards">
  <a href="kurumlar.php" class="sa-card">
    <span class="sa-stat-icon"><svg><use href="#sa-building"/></svg></span>
    <div><strong><?=$stats['kurum']?></strong><small>Aktif Kurum</small></div>
    <span class="sa-card-arrow"><svg><use href="#sa-arrow"/></svg></span>
  </a>
  <a href="global-ogrenciler.php" class="sa-card">
    <span class="sa-stat-icon"><svg><use href="#sa-student"/></svg></span>
    <div><strong><?=$stats['ogrenci']?></strong><small>Öğrenci</small></div>
    <span class="sa-card-arrow"><svg><use href="#sa-arrow"/></svg></span>
  </a>
  <a href="kurumlar.php?sekme=ogretmenler" class="sa-card">
    <span class="sa-stat-icon"><svg><use href="#sa-users"/></svg></span>
    <div><strong><?=$stats['ogretmen']?></strong><small>Öğretmen</small></div>
    <span class="sa-card-arrow"><svg><use href="#sa-arrow"/></svg></span>
  </a>
  <a href="kurumlar.php?sekme=veliler" class="sa-card">
    <span class="sa-stat-icon"><svg><use href="#sa-users"/></svg></span>
    <div><strong><?=$stats['veli']?></strong><small>Veli</small></div>
    <span class="sa-card-arrow"><svg><use href="#sa-arrow"/></svg></span>
  </a>
 </div>
</section>

<section class="sa-simple-grid" aria-label="Süper Admin özeti">
  <section class="sa-section">
   <div class="sa-section-title"><div><small>KURUMLAR</small><h2>Son Kurumlar</h2></div><a class="sa-section-link" href="kurumlar.php">Tümünü Gör <svg><use href="#sa-arrow"/></svg></a></div>
   <div class="sa-institution-list">
    <?php if(!$institutionRows): ?><p class="sa-empty">Henüz kurum kaydı yok. Kurumlar bölümünden ilk kurumu ekleyebilirsiniz.</p><?php endif; ?>
    <?php foreach($institutionRows as $institution): ?>
    <a href="kurumlar.php?sekme=kurumlar&amp;kurum_id=<?=(int)$institution['id']?>">
      <span class="sa-menu-icon"><svg><use href="#sa-building"/></svg></span>
      <span class="sa-institution-name"><strong><?=sa_h((string)$institution['ad'])?></strong><small><?=sa_h((string)($institution['tur']?:$institution['kod']))?></small></span>
      <span class="sa-institution-state <?=$institution['aktif']?'is-active':'is-inactive'?>"><?=$institution['aktif']?'Aktif':'Pasif'?></span>
      <svg class="sa-row-arrow"><use href="#sa-arrow"/></svg>
    </a>
    <?php endforeach; ?>
   </div>
  </section>

  <section class="sa-section">
   <div class="sa-section-title"><div><small>SİSTEM</small><h2>Durum</h2></div></div>
   <div class="sa-status-list">
    <div><span class="sa-status-icon"><svg><use href="#sa-database"/></svg></span><p><strong>MySQL</strong><small>Veritabanı bağlantısı</small></p><b><i></i>Çalışıyor</b></div>
    <div><span class="sa-status-icon"><svg><use href="#sa-cloud"/></svg></span><p><strong>PWA Eşitleme</strong><small><?=$syncCount?> eşitleme kaydı</small></p><b><i></i>Aktif</b></div>
    <div><span class="sa-status-icon"><svg><use href="#sa-refresh"/></svg></span><p><strong>Güncelleme</strong><small><?=sa_h($lastUpdate!==''?$lastUpdate:'Henüz kayıt yok')?></small></p><em>v<?=sa_h(sa_version())?></em></div>
   </div>
  </section>
</section>
</main>

<nav class="sa-bottom" aria-label="Süper Admin menüsü">
 <a class="active" href="super-admin.php"><span><svg><use href="#sa-home"/></svg></span>Panel</a>
 <a href="kurumlar.php"><span><svg><use href="#sa-building"/></svg></span>Kurumlar</a>
 <a href="global.php"><span><svg><use href="#sa-users"/></svg></span>Global</a>
 <a href="yonetici-yetkileri.php"><span><svg><use href="#sa-shield"/></svg></span>Yetkiler</a>
 <a href="super-admin-profil.php"><span><svg><use href="#sa-user"/></svg></span>Profil</a>
</nav>
</div>
</div>
</body>
</html>
