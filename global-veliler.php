<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/kurum_yonetimi.php';

$user=require_role('super_admin');
$pdo=db();
$message='';$error='';

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız.');
        ky_create_user(
            $pdo,$user,'veli',
            (string)($_POST['ad_soyad']??''),
            (string)($_POST['email']??''),
            (string)($_POST['password']??''),
            null
        );
        $message='Global veli oluşturuldu.';
    }catch(PDOException $e){
        $error=$e->getCode()==='23000'?'Bu e-posta zaten kullanılıyor.':'Veritabanı işlemi tamamlanamadı.';
    }catch(Throwable $e){
        $error=$e->getMessage();
    }
}
$parents=ky_global_parents($pdo);
?><!doctype html><html lang="tr"><head>
<meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Global Veliler — İlkAdım</title>
<link rel="stylesheet" href="styles.css"><link rel="stylesheet" href="super-admin.css?v=1.0.41">
</head><body class="role-page"><div class="role-shell">
<header class="role-topbar"><a class="role-icon" href="super-admin.php">←</a><span class="role-brand"><span>👪</span><span><strong>Global Veliler</strong><small>KURUMSUZ / OKULSUZ</small></span></span><a class="role-icon" href="global-ogrenciler.php">🎒</a></header>
<main class="role-content">
<section class="role-hero"><span class="eyeline">GLOBAL KULLANICILAR</span><h1>Kurumdan bağımsız veli hesapları.</h1><p>Global veli yalnızca kendisine eşleştirilen global öğrenciyi takip eder.</p><span class="role-hero-art">👪</span></section>
<?php if($message!==''):?><div class="role-note"><span>✅</span><p><?=ky_h($message)?></p></div><?php endif;?>
<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=ky_h($error)?></p></div><?php endif;?>

<section class="role-section"><div class="role-section-head"><div><span class="eyeline">YENİ VELİ</span><h2>Global Veli Ekle</h2></div></div>
<form class="role-form" method="post">
<input type="hidden" name="csrf" value="<?=ky_h(csrf_token())?>">
<label>Ad Soyad</label><input class="role-input" name="ad_soyad" required maxlength="190">
<label>E-posta</label><input class="role-input" type="email" name="email" required>
<label>Geçici şifre</label><input class="role-input" type="password" name="password" minlength="8" required>
<button class="role-button" type="submit">Global Veli Oluştur</button>
</form></section>

<section class="role-section"><div class="role-section-head"><div><span class="eyeline">VELİLER</span><h2>Global Veli Listesi</h2></div><span class="role-pill"><?=count($parents)?></span></div><div class="role-list">
<?php if(!$parents):?><div class="role-empty"><span>👪</span>Henüz global veli yok.</div>
<?php else:foreach($parents as $p):?><div class="role-row"><span>👪</span><div><strong><?=ky_h((string)$p['ad_soyad'])?></strong><small><?=ky_h((string)$p['email'])?> · Öğrenci: <?=ky_h((string)($p['ogrenci_adlari']?:'Bağlı değil'))?></small></div><span class="role-pill ok">Global</span></div><?php endforeach;endif;?>
</div></section>
</main>
<nav class="role-bottom"><a href="super-admin.php"><span>⌂</span>Panel</a><a href="global-ogrenciler.php"><span>🎒</span>Öğrenciler</a><a class="active" href="global-veliler.php"><span>👪</span>Veliler</a><a href="kurumlar.php"><span>🏫</span>Kurumlar</a></nav>
</div></body></html>