<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';

$user=require_role('super_admin');
$pdo=db();

function sa_h(string $v): string { return htmlspecialchars($v,ENT_QUOTES,'UTF-8'); }
function sa_scalar(PDO $pdo,string $sql,array $params=[]): int {
    try {
        $s=$pdo->prepare($sql);$s->execute($params);$v=(int)($s->fetchColumn()?:0);$s->closeCursor();return $v;
    } catch(Throwable){ return 0; }
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
?><!doctype html><html lang="tr"><head>
<meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Süper Admin — İlkAdım</title>
<link rel="stylesheet" href="styles.css"><link rel="stylesheet" href="super-admin.css?v=1.0.41">
</head><body class="role-page"><div class="role-shell">
<header class="role-topbar">
<a class="role-brand" href="super-admin.php"><span>🌞</span><span><strong>İlkAdım</strong><small>SÜPER ADMIN</small></span></a>
<div class="role-actions"><a class="role-icon" href="rol-paneli.php">🛡️</a><a class="role-icon" href="hesap-guvenligi.php">👑</a></div>
</header>
<main class="role-content">
<section class="role-hero"><span class="eyeline">SİSTEM YÖNETİMİ</span><h1>Kurumlar ve kullanıcılar tek merkezde.</h1>
<p><?=sa_h((string)$user['ad_soyad'])?> · <?=sa_h((string)$user['email'])?></p>
<a class="role-primary" href="kurumlar.php">Kurumları Yönet →</a><span class="role-hero-art">🛡️</span></section>

<section class="role-section"><div class="role-section-head"><div><span class="eyeline">GENEL BAKIŞ</span><h2>Sistem Özeti</h2></div><span class="role-pill">v<?=sa_h(sa_version())?></span></div>
<div class="role-stats">
<div class="role-stat"><span>🏫</span><strong><?=$stats['kurum']?></strong><small>Aktif kurum</small></div>
<div class="role-stat"><span>👥</span><strong><?=$stats['kullanici']?></strong><small>Aktif kullanıcı</small></div>
<div class="role-stat"><span>🎒</span><strong><?=$stats['ogrenci']?></strong><small>Aktif öğrenci</small></div>
<div class="role-stat"><span>🧑‍💼</span><strong><?=$stats['yonetici']?></strong><small>Yönetici hesabı</small></div>
</div></section>

<section class="role-section"><div class="role-section-head"><div><span class="eyeline">HIZLI ERİŞİM</span><h2>Yönetim Modülleri</h2></div></div>
<div class="role-modules">
<a class="role-module" href="kurumlar.php"><span>🏫</span><div><strong>Kurumlar</strong><small>Okul ve kursları aç; her kurumu kendi detay sayfasından yönet.</small></div><b>→</b></a>
<a class="role-module" href="global-ogrenciler.php"><span>🎒</span><div><strong>Global Öğrenciler</strong><small>Kurum ve öğretmen bağı olmayan doğrudan öğrencileri yönet.</small></div><b>→</b></a>
<a class="role-module" href="global-veliler.php"><span>👪</span><div><strong>Global Veliler</strong><small>Kurumsuz veli hesabı aç ve global öğrenciyle eşleştir.</small></div><b>→</b></a>
<a class="role-module" href="yetkilendirme.php"><span>🛡️</span><div><strong>Sistem Rolleri</strong><small>Gelişmiş rol ve hesap yetkilerini yönet.</small></div><b>→</b></a>
<a class="role-module" href="guncelleme.php"><span>🔄</span><div><strong>Uygulama Güncelleme</strong><small>GitHub sürümünü kontrol et ve kur.</small></div><b>→</b></a>
</div></section>

<section class="role-section"><div class="role-section-head"><div><span class="eyeline">SİSTEM DURUMU</span><h2>Bağlantılar</h2></div></div>
<div class="role-list">
<div class="role-row"><span>🗄️</span><div><strong>MySQL</strong><small>Canlı veritabanı bağlantısı</small></div><span class="role-pill ok">Çalışıyor</span></div>
<div class="role-row"><span>📴</span><div><strong>PWA Eşitleme</strong><small><?=$syncCount?> eşitleme kaydı</small></div><span class="role-pill">Aktif</span></div>
<div class="role-row"><span>🧱</span><div><strong>Son başarılı güncelleme</strong><small><?=sa_h($lastUpdate!==''?$lastUpdate:'Henüz kayıt yok')?></small></div><span class="role-pill">v<?=sa_h(sa_version())?></span></div>
</div></section>

<div class="role-note"><span>💡</span><p><strong>İlkAdım</strong> kurumu doğrudan uygulama alan, okula bağlı olmayan kullanıcılar için merkez kurumdur. Bu kurumun içerik kaynağı <strong>Sistem</strong> olarak kalır.</p></div>
</main>
<nav class="role-bottom">
<a class="active" href="super-admin.php"><span>⌂</span>Panel</a>
<a href="kurumlar.php"><span>🏫</span>Kurumlar</a>
<a href="global-ogrenciler.php"><span>🎒</span>Öğrenciler</a>
<a href="global-veliler.php"><span>👪</span>Veliler</a>
</nav></div></body></html>