<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/password_reset.php';

app_session_start();
header('Cache-Control: no-store, no-cache, must-revalidate, max-age=0');
header('Referrer-Policy: no-referrer');

$queryToken=trim((string)($_GET['token']??''));
if($queryToken!==''){
    if(preg_match('/^[a-f0-9]{64}$/D',$queryToken) && pr_token_is_valid(db(),$queryToken)){
        $_SESSION['password_reset_token']=$queryToken;
        header('Location: sifre-sifirla.php');
        exit;
    }
    unset($_SESSION['password_reset_token']);
}

$token=(string)($_SESSION['password_reset_token']??'');
$valid=$token!=='' && pr_token_is_valid(db(),$token);
$error='';

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar deneyin.');
        if(!$valid) throw new RuntimeException('Şifre sıfırlama bağlantısı geçersiz veya süresi dolmuş.');
        $password=(string)($_POST['password']??'');
        $repeat=(string)($_POST['password_repeat']??'');
        if($password!==$repeat) throw new RuntimeException('Yeni şifreler eşleşmiyor.');

        pr_reset_password(db(),$token,$password);

        unset(
            $_SESSION['password_reset_token'],
            $_SESSION['kullanici_id'],
            $_SESSION['ogrenci_id'],
            $_SESSION['aktif_rol'],
            $_SESSION['auth_version']
        );
        $_SESSION['csrf_token']=bin2hex(random_bytes(32));
        session_regenerate_id(true);

        header('Location: login.php?reset=1');
        exit;
    }catch(RuntimeException $e){
        $error=$e->getMessage();
        $valid=$token!=='' && pr_token_is_valid(db(),$token);
    }catch(Throwable $e){
        error_log('[IlkAdim][password-reset] reset_page_failed');
        $error='Şifre şu anda yenilenemedi. Lütfen yeni bir sıfırlama bağlantısı iste.';
        $valid=false;
    }
}

function prrh(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<meta name="robots" content="noindex,nofollow">
<title>Yeni Şifre — İlkAdım</title>
<link rel="icon" href="ilkadim-logo.svg" type="image/svg+xml">
<link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="app-shell">
<main id="screen" tabindex="-1">
<div class="screen-content settings-screen">
<section class="subpage-intro">
<span>🔑</span>
<h1>Yeni şifreni belirle</h1>
<p>Bağlantı tek kullanımlıktır. Şifre değiştiğinde diğer açık oturumlar ve beni hatırla bağlantıları geçersizleşir.</p>
</section>

<?php if($error!==''):?>
<section class="settings-block local-data"><p><?=prrh($error)?></p></section>
<?php endif;?>

<?php if(!$valid):?>
<section class="settings-block">
<h2>Bağlantı kullanılamıyor</h2>
<p>Bu bağlantının süresi dolmuş, daha önce kullanılmış veya iptal edilmiş olabilir.</p>
<a class="button primary full" href="sifremi-unuttum.php">Yeni bağlantı iste →</a>
<a class="button soft full" href="login.php">Giriş ekranına dön</a>
</section>
<?php else:?>
<form method="post" class="settings-block" autocomplete="off">
<input type="hidden" name="csrf" value="<?=prrh(csrf_token())?>">
<h2>Şifreyi Değiştir</h2>
<label class="field-label" for="password">Yeni şifre</label>
<input class="text-input" type="password" id="password" name="password" minlength="8" maxlength="128" autocomplete="new-password" required autofocus>
<label class="field-label" for="password_repeat">Yeni şifre tekrar</label>
<input class="text-input" type="password" id="password_repeat" name="password_repeat" minlength="8" maxlength="128" autocomplete="new-password" required>
<button class="button primary full" type="submit">Şifremi Yenile →</button>
</form>
<?php endif;?>
</div>
</main>
</div>
</body>
</html>
