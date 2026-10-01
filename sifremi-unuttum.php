<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/password_reset.php';

app_session_start();
header('Cache-Control: no-store, no-cache, must-revalidate, max-age=0');
header('Referrer-Policy: no-referrer');

$error='';
$sent=isset($_GET['durum']) && $_GET['durum']==='1';
$email='';

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar deneyin.');
        $email=pr_normalize_email((string)($_POST['email']??''));
        pr_request_reset(db(),$email,pr_client_ip());
        header('Location: sifremi-unuttum.php?durum=1');
        exit;
    }catch(RuntimeException $e){
        $error=$e->getMessage();
    }catch(Throwable $e){
        error_log('[IlkAdim][password-reset] request_page_failed');
        header('Location: sifremi-unuttum.php?durum=1');
        exit;
    }
}

function prh(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<meta name="robots" content="noindex,nofollow">
<title>Şifremi Unuttum — İlkAdım</title>
<link rel="icon" href="ilkadim-logo.svg" type="image/svg+xml">
<link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="app-shell">
<main id="screen" tabindex="-1">
<div class="screen-content settings-screen">
<section class="subpage-intro">
<span>🔐</span>
<h1>Şifreni yenile</h1>
<p>Hesabında kayıtlı e-posta adresini yaz. Uygunsa 30 dakika geçerli tek kullanımlık bağlantı gönderilir.</p>
</section>

<?php if($sent):?>
<section class="settings-block local-data">
<p>Eğer bu e-posta adresiyle eşleşen aktif bir hesap varsa şifre yenileme bağlantısı gönderildi. Gelen kutunu ve gereksiz/spam klasörünü kontrol et.</p>
</section>
<?php endif;?>

<?php if($error!==''):?>
<section class="settings-block local-data"><p><?=prh($error)?></p></section>
<?php endif;?>

<form method="post" class="settings-block" autocomplete="on">
<input type="hidden" name="csrf" value="<?=prh(csrf_token())?>">
<h2>Şifre Kurtarma</h2>
<label class="field-label" for="email">E-posta</label>
<input class="text-input" type="email" id="email" name="email" value="<?=prh($email)?>" autocomplete="email" inputmode="email" required autofocus>
<button class="button primary full" type="submit">Bağlantı Gönder →</button>
<a class="button soft full" href="login.php">Giriş ekranına dön</a>
</form>
</div>
</main>
</div>
</body>
</html>
