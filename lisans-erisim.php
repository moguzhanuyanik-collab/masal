<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';

$user=require_login();
$pdo=db();
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');

function leh(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }

$summary=auth_operational_access_summary($pdo,$user);
$role=(string)($summary['role']??auth_effective_role($user)??'');
$institutions=is_array($summary['institutions']??null)?$summary['institutions']:[];
$restricted=(bool)($summary['restricted']??false);
$home=auth_role_home($user);

$roleLabel=match($role){
    'ogrenci'=>'Öğrenci',
    'veli'=>'Veli',
    'ogretmen'=>'Öğretmen',
    default=>'Kullanıcı',
};
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Lisans Erişimi — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="lisans-erisim.css?v=1.2.47">
</head>
<body class="role-page">
<div class="le-shell">
<header class="le-topbar">
<a class="le-brand" href="lisans-erisim.php"><span>İA</span><strong>İlkAdım <small>Lisans Erişimi</small></strong></a>
<a class="le-logout" href="logout.php">Çıkış yap</a>
</header>

<main class="le-main">
<section class="le-hero">
<div>
<span class="le-kicker"><?=$restricted?'ERİŞİM KISITLI':'LİSANS DURUMU'?></span>
<h1><?=$restricted?'Kurum erişimin geçici olarak kapalı.':'Kurum lisans durumun.'?></h1>
<p><?=leh((string)$user['ad_soyad'])?> · <?=leh($roleLabel)?></p>
</div>
<span class="le-hero-icon"><?=$restricted?'🔒':'🏫'?></span>
</section>

<?php if($restricted):?>
<div class="le-alert warn">
<strong>Eğitimsel ve operasyonel modüller şu anda kullanılamıyor.</strong>
<span>Bu durum hesabını silmez ve geçmiş verilerini kaldırmaz. Lisans tekrar kullanıma açıldığında erişim otomatik devam eder.</span>
</div>
<?php else:?>
<div class="le-alert ok">
<strong>En az bir bağlı kurum operasyonel kullanıma açık.</strong>
<span>Aktif kurumların üzerinden uygulamayı kullanmaya devam edebilirsin. Kısıtlı kurumlar eğitimsel veri kapsamına dahil edilmez.</span>
</div>
<?php endif;?>

<section class="le-card">
<div class="le-card-head"><div><span class="le-kicker">KURUMLAR</span><h2>Bağlı Kurum Durumları</h2></div><span class="le-pill"><?=count($institutions)?></span></div>
<div class="le-list">
<?php if(!$institutions):?>
<div class="le-empty">Kuruma bağlı olmayan doğrudan İlkAdım hesabı. Kurum lisans kısıtı uygulanmıyor.</div>
<?php endif;?>
<?php foreach($institutions as $institution):
$allowed=(bool)($institution['allowed']??false);
$reason=(string)($institution['reason']??'');
?>
<article class="le-row">
<span class="le-row-icon"><?=$allowed?'✅':'🔒'?></span>
<div>
<strong><?=leh((string)($institution['institution_name']?:('Kurum #'.(int)$institution['institution_id'])))?></strong>
<small>
<?=leh(auth_license_reason_label($reason))?>
<?php if((string)($institution['package_name']??'')!==''):?> · Paket: <?=leh((string)$institution['package_name'])?><?php endif;?>
<?php if(!empty($institution['start'])):?> · Başlangıç: <?=leh((string)$institution['start'])?><?php endif;?>
<?php if(!empty($institution['end'])):?> · Bitiş: <?=leh((string)$institution['end'])?><?php endif;?>
</small>
</div>
<span class="le-pill <?=$allowed?'ok':'off'?>"><?=$allowed?'Açık':'Kapalı'?></span>
</article>
<?php endforeach;?>
</div>
</section>

<section class="le-card">
<div class="le-card-head"><div><span class="le-kicker">NE YAPABİLİRSİN?</span><h2>Destek ve Hesap İşlemleri</h2></div></div>
<div class="le-actions">
<a href="destek.php"><span>🎧</span><strong>Destek Merkezi</strong><small>Lisans, paket veya kurum erişimi için talep aç.</small></a>
<a href="hesap-guvenligi.php"><span>🔐</span><strong>Hesap Güvenliği</strong><small>E-posta ve şifre ayarlarını yönet.</small></a>
<?php if(!$restricted):?><a href="<?=leh($home)?>"><span>→</span><strong>Panele Dön</strong><small>Operasyonel olarak açık kurumlarla devam et.</small></a><?php endif;?>
</div>
</section>

<div class="le-note">
<strong>Not:</strong> Öğrenci, veli ve öğretmen hesaplarında lisansı askıda, iptal, süresi dolmuş, henüz başlamamış veya pasif pakete bağlı kurumlar operasyonel kapsamdan çıkarılır. Süper Admin ve kurum yöneticisi lisans sorununu çözmek için yönetim/destek akışlarına erişebilir.
</div>
</main>
</div>
</body>
</html>
