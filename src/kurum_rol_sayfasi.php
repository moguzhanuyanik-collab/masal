<?php
declare(strict_types=1);
if(!isset($kyRole,$kyTitle,$kyIcon,$kyDescription)) throw new RuntimeException('Kurum rol sayfası yapılandırılmadı.');

require __DIR__.'/bootstrap.php';
require __DIR__.'/auth.php';
require __DIR__.'/kurum_yonetimi.php';

$user=require_role(['yonetici','super_admin']);
$pdo=db();
$isSuper=auth_user_has_role($user,'super_admin');
$institutionId=(int)($_REQUEST['kurum_id']??0);
$message='';$error='';

try{
    $institution=ky_assert_manageable($pdo,$user,$institutionId);
    if($kyRole==='yonetici' && !$isSuper){
        throw new RuntimeException('Kurum yöneticilerini yalnızca Süper Admin yönetebilir.');
    }
}catch(Throwable $e){
    http_response_code(403);
    echo 'Bu kurumu veya bölümü yönetme yetkin yok.';
    exit;
}

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız.');
        ky_create_user(
            $pdo,$user,$kyRole,
            (string)($_POST['ad_soyad']??''),
            (string)($_POST['email']??''),
            (string)($_POST['password']??''),
            $institutionId
        );
        $message=$kyTitle.' hesabı kuruma eklendi.';
    }catch(PDOException $e){
        $error=$e->getCode()==='23000'?'Bu e-posta zaten kullanılıyor.':'Veritabanı işlemi tamamlanamadı.';
    }catch(Throwable $e){
        $error=$e->getMessage();
    }
}

$members=ky_role_members($pdo,$institutionId,$kyRole);
?><!doctype html><html lang="tr"><head>
<meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title><?=ky_h($kyTitle)?> — <?=ky_h((string)$institution['ad'])?></title>
<link rel="stylesheet" href="styles.css"><link rel="stylesheet" href="kurum.css?v=1.0.41">
</head><body class="role-page"><div class="role-shell">
<header class="role-topbar">
<a class="role-icon" href="../kurum-detay.php?kurum_id=<?=$institutionId?>">←</a>
<span class="role-brand"><span><?=ky_h($kyIcon)?></span><span><strong><?=ky_h($kyTitle)?></strong><small><?=ky_h((string)$institution['ad'])?></small></span></span>
<a class="role-icon" href="../hesap-guvenligi.php">⚙️</a>
</header>
<main class="role-content">
<section class="role-hero"><span class="eyeline">KURUM YÖNETİMİ</span><h1><?=ky_h($kyTitle)?></h1><p><?=ky_h($kyDescription)?></p><span class="role-hero-art"><?=ky_h($kyIcon)?></span></section>

<?php if($message!==''):?><div class="role-note"><span>✅</span><p><?=ky_h($message)?></p></div><?php endif;?>
<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=ky_h($error)?></p></div><?php endif;?>

<section class="role-section"><div class="role-section-head"><div><span class="eyeline">YENİ HESAP</span><h2><?=ky_h($kyTitle)?> Ekle</h2></div></div>
<form class="role-form" method="post">
<input type="hidden" name="csrf" value="<?=ky_h(csrf_token())?>">
<input type="hidden" name="kurum_id" value="<?=$institutionId?>">
<label>Ad Soyad</label><input class="role-input" name="ad_soyad" required maxlength="190">
<label>E-posta</label><input class="role-input" type="email" name="email" required>
<label>Geçici şifre</label><input class="role-input" type="password" name="password" minlength="8" required>
<button class="role-button" type="submit"><?=ky_h($kyTitle)?> Hesabı Oluştur</button>
</form></section>

<section class="role-section"><div class="role-section-head"><div><span class="eyeline">KAYITLAR</span><h2><?=ky_h($kyTitle)?> Listesi</h2></div><span class="role-pill"><?=count($members)?></span></div>
<div class="role-list">
<?php if(!$members):?><div class="role-empty"><span><?=ky_h($kyIcon)?></span>Henüz kayıt yok.</div>
<?php else:foreach($members as $m):?><div class="role-row"><span><?=ky_h($kyIcon)?></span><div><strong><?=ky_h((string)($m['ad']?:$m['ad_soyad']))?></strong><small><?=ky_h((string)$m['email'])?></small></div><span class="role-pill <?=((int)$m['aktif']===1?'ok':'off')?>"><?=((int)$m['aktif']===1?'Aktif':'Pasif')?></span></div><?php endforeach;endif;?>
</div></section>
</main>
<nav class="role-bottom">
<a href="../kurum-detay.php?kurum_id=<?=$institutionId?>"><span>⌂</span>Kurum</a>
<a href="../kurum-ogretmenleri.php?kurum_id=<?=$institutionId?>"><span>👩‍🏫</span>Öğretmen</a>
<a href="../kurum-velileri.php?kurum_id=<?=$institutionId?>"><span>👪</span>Veli</a>
<a href="../kurum-ogrencileri.php?kurum_id=<?=$institutionId?>"><span>🎒</span>Öğrenci</a>
</nav></div></body></html>