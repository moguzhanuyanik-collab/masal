<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/kurum_yonetimi.php';

$user=require_role(['yonetici','super_admin']);
$pdo=db();
$institutionId=(int)($_GET['kurum_id']??0);

try{
    $institution=ky_assert_manageable($pdo,$user,$institutionId);
}catch(Throwable){
    http_response_code(403);
    echo 'Bu kuruma erişim yetkin yok.';
    exit;
}

function kd_count(PDO $pdo,int $institutionId,string $role):int{
    try{
        $s=$pdo->prepare('SELECT COUNT(DISTINCT kullanici_id) FROM kurum_kullanicilari WHERE kurum_id=? AND kurum_rolu=? AND aktif=1');
        $s->execute([$institutionId,$role]);
        $v=(int)($s->fetchColumn()?:0);
        $s->closeCursor();
        return $v;
    }catch(Throwable){
        return 0;
    }
}

$counts=[
    'yonetici'=>kd_count($pdo,$institutionId,'yonetici'),
    'ogretmen'=>kd_count($pdo,$institutionId,'ogretmen'),
    'veli'=>kd_count($pdo,$institutionId,'veli'),
    'ogrenci'=>kd_count($pdo,$institutionId,'ogrenci'),
];
$isSuper=auth_user_has_role($user,'super_admin');
?><!doctype html><html lang="tr"><head>
<meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title><?=ky_h((string)$institution['ad'])?> — İlkAdım</title>
<link rel="stylesheet" href="styles.css"><link rel="stylesheet" href="kurum.css?v=1.0.41">
</head><body class="role-page"><div class="role-shell">
<header class="role-topbar">
<a class="role-icon" href="<?= $isSuper?'kurumlar.php':'yonetici-paneli.php?kurum_id='.$institutionId ?>">←</a>
<span class="role-brand"><span>🏫</span><span><strong><?=ky_h((string)$institution['ad'])?></strong><small>KURUM YÖNETİMİ</small></span></span>
<a class="role-icon" href="hesap-guvenligi.php">⚙️</a>
</header>
<main class="role-content">
<section class="role-hero">
<span class="eyeline"><?=ky_h(mb_strtoupper((string)$institution['tur'],'UTF-8'))?></span>
<h1><?=ky_h((string)$institution['ad'])?></h1>
<p>İçerik kaynağı: <?=ky_h((string)$institution['icerik_kaynagi'])?> · Kullanıcı türleri ayrı sayfalardan yönetilir.</p>
<span class="role-hero-art">🏫</span>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">KULLANICI YÖNETİMİ</span><h2>Ayrı Bölümler</h2></div></div>
<div class="role-modules">
<?php if($isSuper):?>
<a class="role-module" href="<?=$isSuper?'kurumlar.php?sekme=yoneticiler&amp;kurum_id='.$institutionId:'kurum-yoneticileri.php?kurum_id='.$institutionId?>"><span>🧑‍💼</span><div><strong>Yöneticiler</strong><small><?=$counts['yonetici']?> yönetici · Yönetici ekleme ve listeleme</small></div><b>→</b></a>
<?php endif;?>
<a class="role-module" href="<?=$isSuper?'kurumlar.php?sekme=ogretmenler&amp;kurum_id='.$institutionId:'kurum-ogretmenleri.php?kurum_id='.$institutionId?>"><span>👩‍🏫</span><div><strong>Öğretmenler</strong><small><?=$counts['ogretmen']?> öğretmen · Ayrı öğretmen sayfası</small></div><b>→</b></a>
<a class="role-module" href="<?=$isSuper?'kurumlar.php?sekme=veliler&amp;kurum_id='.$institutionId:'kurum-velileri.php?kurum_id='.$institutionId?>"><span>👪</span><div><strong>Veliler</strong><small><?=$counts['veli']?> veli · Ayrı veli sayfası</small></div><b>→</b></a>
<a class="role-module" href="<?=$isSuper?'kurumlar.php?sekme=ogrenciler&amp;kurum_id='.$institutionId:'kurum-ogrencileri.php?kurum_id='.$institutionId?>"><span>🎒</span><div><strong>Öğrenciler</strong><small><?=$counts['ogrenci']?> öğrenci · Ayrı öğrenci sayfası</small></div><b>→</b></a>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">KURUMA AİT BÖLÜMLER</span><h2>Sonraki Aşama</h2></div></div>
<div class="role-list">
<div class="role-row"><span>📚</span><div><strong>Dersler / İçerikler</strong><small>Kuruma özel içerik yönetimini daha sonra ayrı modül yapacağız.</small></div><span class="role-pill off">Sonra</span></div>
<div class="role-row"><span>🏷️</span><div><strong>Sınıflar / Gruplar</strong><small>Kurum sınıf ve grup yapısını daha sonra ekleyeceğiz.</small></div><span class="role-pill off">Sonra</span></div>
<div class="role-row"><span>📊</span><div><strong>Raporlar</strong><small>Kuruma özel toplu raporları daha sonra ayrı bölüm yapacağız.</small></div><span class="role-pill off">Sonra</span></div>
</div>
</section>
</main>
<nav class="role-bottom">
<a class="active" href="kurum-detay.php?kurum_id=<?=$institutionId?>"><span>⌂</span>Kurum</a>
<a href="<?=$isSuper?'kurumlar.php?sekme=ogretmenler&amp;kurum_id='.$institutionId:'kurum-ogretmenleri.php?kurum_id='.$institutionId?>"><span>👩‍🏫</span>Öğretmen</a>
<a href="<?=$isSuper?'kurumlar.php?sekme=veliler&amp;kurum_id='.$institutionId:'kurum-velileri.php?kurum_id='.$institutionId?>"><span>👪</span>Veli</a>
<a href="<?=$isSuper?'kurumlar.php?sekme=ogrenciler&amp;kurum_id='.$institutionId:'kurum-ogrencileri.php?kurum_id='.$institutionId?>"><span>🎒</span>Öğrenci</a>
</nav>
</div></body></html>