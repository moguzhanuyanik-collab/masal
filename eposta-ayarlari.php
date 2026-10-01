<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/password_reset.php';
require __DIR__.'/src/mail_settings.php';

$user=require_role('super_admin');
$pdo=db();
header('Cache-Control: no-store, max-age=0');
header('Pragma: no-cache');
header('X-Content-Type-Options: nosniff');

function eah(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }

$message='';
$error='';
$form=[];
$settingsFile=ms_settings_file();
$config=require __DIR__.'/config/app.php';
$current=is_array($config)?$config:[];
$saved=ms_saved_settings();
$fingerprint=ms_settings_fingerprint($settingsFile);

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Oturum doğrulaması başarısız. Sayfayı yenileyip tekrar dene.');

        $form=[
            'base_url'=>(string)($_POST['base_url']??''),
            'transport'=>(string)($_POST['transport']??'disabled'),
            'from_email'=>(string)($_POST['from_email']??''),
            'from_name'=>(string)($_POST['from_name']??'İlkAdım'),
            'smtp_host'=>(string)($_POST['smtp_host']??''),
            'smtp_port'=>(string)($_POST['smtp_port']??'587'),
            'smtp_encryption'=>(string)($_POST['smtp_encryption']??'tls'),
            'smtp_username'=>(string)($_POST['smtp_username']??''),
            'smtp_timeout'=>(string)($_POST['smtp_timeout']??'10'),
            'test_email'=>(string)($_POST['test_email']??''),
        ];
        if(isset($_POST['clear_smtp_password'])) $form['clear_smtp_password']='1';
        if((string)($_POST['smtp_password']??'')!=='') $form['smtp_password']=(string)$_POST['smtp_password'];

        $candidate=ms_candidate($_POST,$current);
        $action=(string)($_POST['action']??'save');

        if($action==='test_connection'){
            $message=ms_test_connection($candidate);
        }elseif($action==='send_test'){
            $message=ms_send_test_email($candidate,(string)($_POST['test_email']??''));
        }elseif($action==='save'){
            ms_save($candidate,$fingerprint);
            $message='E-posta ayarları kaydedildi.';
            $form=[];
            $config=require __DIR__.'/config/app.php';
            $current=is_array($config)?$config:[];
            $saved=ms_saved_settings();
            $fingerprint=ms_settings_fingerprint($settingsFile);
            auth_audit($pdo,(int)$user['id'],(int)$user['id'],'eposta_ayarlari','E-posta ve şifre kurtarma ayarları güncellendi');
        }else{
            throw new RuntimeException('Geçersiz işlem.');
        }
    }catch(Throwable $e){
        $error=$e instanceof RuntimeException?$e->getMessage():'E-posta ayarları işlenemedi.';
        $config=require __DIR__.'/config/app.php';
        $current=is_array($config)?$config:[];
        $saved=ms_saved_settings();
        $fingerprint=ms_settings_fingerprint($settingsFile);
    }
}

$app=is_array($current['app']??null)?$current['app']:[];
$mail=is_array($current['mail']??null)?$current['mail']:[];
$smtp=is_array($mail['smtp']??null)?$mail['smtp']:[];
$ready=ms_readiness($pdo,$current);

$baseUrl=(string)($form['base_url']??$app['base_url']??'');
$transport=(string)($form['transport']??$mail['transport']??'disabled');
$fromEmail=(string)($form['from_email']??$mail['from_email']??'');
$fromName=(string)($form['from_name']??$mail['from_name']??'İlkAdım');
$smtpHost=(string)($form['smtp_host']??$smtp['host']??'');
$smtpPort=(string)($form['smtp_port']??$smtp['port']??587);
$smtpEncryption=(string)($form['smtp_encryption']??$smtp['encryption']??'tls');
$smtpUsername=(string)($form['smtp_username']??$smtp['username']??'');
$smtpTimeout=(string)($form['smtp_timeout']??$smtp['timeout_seconds']??10);
$passwordSaved=((string)($smtp['password']??''))!=='';
$testEmail=(string)($form['test_email']??$fromEmail);
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>E-posta Ayarları — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="kurum.css?v=1.0.41">
</head>
<body class="role-page sa-subpage"><?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>E-posta Ayarları</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>

<main class="role-content">
<section class="role-hero">
<span class="eyeline">SİSTEM İLETİŞİMİ</span>
<h1>E-posta & SMTP Merkezi</h1>
<p>Şifre kurtarma ve sistem e-postalarının teslim ayarlarını cPanel veya dosya düzenlemeden yönet.</p>
<span class="role-hero-art">✉️</span>
</section>

<?php if($message!==''):?><div class="role-note"><span>✅</span><p><?=eah($message)?></p></div><?php endif;?>
<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=eah($error)?></p></div><?php endif;?>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">ŞİFRE KURTARMA</span><h2>Sistem Durumu</h2></div><span class="role-pill <?=$ready['ready']?'ok':''?>"><?=$ready['ready']?'Hazır':'Eksik'?></span></div>
<div class="role-list">
<div class="role-row">
<span><?=$ready['ready']?'✅':'⚠️'?></span>
<div>
<strong><?=$ready['ready']?'Şifre kurtarma e-postaları yapılandırıldı':'Şifre kurtarma henüz tam hazır değil'?></strong>
<small><?=$ready['ready']?'Kullanıcılar şifre sıfırlama bağlantısı isteyebilir.':'Aşağıdaki eksikleri tamamla ve test e-postası gönder.'?></small>
</div>
</div>
<?php foreach($ready['issues'] as $issue):?>
<div class="role-row"><span>•</span><div><strong><?=eah((string)$issue)?></strong></div></div>
<?php endforeach;?>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">YAPILANDIRMA</span><h2>E-posta Teslim Ayarları</h2></div></div>
<form class="role-form" method="post" autocomplete="off">
<input type="hidden" name="csrf" value="<?=eah(csrf_token())?>">

<label>Uygulama dış adresi</label>
<input class="role-input" type="url" name="base_url" value="<?=eah($baseUrl)?>" placeholder="https://uygulama.example.com" required>
<small>Şifre sıfırlama bağlantıları bu adres üzerinden oluşturulur. Canlı sistemde HTTPS kullan.</small>

<label>Gönderim yöntemi</label>
<select class="role-input" name="transport" required>
<option value="disabled" <?=$transport==='disabled'?'selected':''?>>Kapalı</option>
<option value="smtp" <?=$transport==='smtp'?'selected':''?>>SMTP</option>
<option value="mail" <?=$transport==='mail'?'selected':''?>>PHP mail()</option>
</select>

<label>Gönderen e-posta</label>
<input class="role-input" type="email" name="from_email" value="<?=eah($fromEmail)?>" placeholder="noreply@example.com">

<label>Gönderen adı</label>
<input class="role-input" name="from_name" maxlength="120" value="<?=eah($fromName)?>" required>

<label>SMTP sunucusu</label>
<input class="role-input" name="smtp_host" maxlength="255" value="<?=eah($smtpHost)?>" placeholder="smtp.example.com">

<label>SMTP portu</label>
<input class="role-input" type="number" min="1" max="65535" name="smtp_port" value="<?=eah($smtpPort)?>">

<label>SMTP şifreleme</label>
<select class="role-input" name="smtp_encryption">
<option value="tls" <?=$smtpEncryption==='tls'?'selected':''?>>STARTTLS</option>
<option value="ssl" <?=$smtpEncryption==='ssl'?'selected':''?>>SSL/TLS</option>
<option value="none" <?=$smtpEncryption==='none'?'selected':''?>>Şifreleme yok</option>
</select>

<label>SMTP kullanıcı adı</label>
<input class="role-input" name="smtp_username" maxlength="255" value="<?=eah($smtpUsername)?>" autocomplete="username">

<label>SMTP şifresi</label>
<input class="role-input" type="password" name="smtp_password" maxlength="1024" value="" autocomplete="new-password"
       placeholder="<?=$passwordSaved?'Kayıtlı şifre korunacak':'SMTP şifresini gir'?>">
<small><?=$passwordSaved?'Kayıtlı bir SMTP şifresi var. Güvenlik nedeniyle ekranda gösterilmez. Boş bırakırsan korunur.':'Henüz kayıtlı SMTP şifresi yok.'?></small>
<?php if($passwordSaved):?><label><input type="checkbox" name="clear_smtp_password" value="1"> Kayıtlı SMTP şifresini temizle</label><?php endif;?>

<label>Bağlantı zaman aşımı</label>
<input class="role-input" type="number" min="3" max="30" name="smtp_timeout" value="<?=eah($smtpTimeout)?>">

<label>Test e-postası alıcısı</label>
<input class="role-input" type="email" name="test_email" value="<?=eah($testEmail)?>" placeholder="test@example.com">

<div class="role-actions">
<button class="role-button" type="submit" name="action" value="save">Ayarları Kaydet</button>
<button class="role-button secondary" type="submit" name="action" value="test_connection">Bağlantıyı Test Et</button>
<button class="role-button secondary" type="submit" name="action" value="send_test">Test E-postası Gönder</button>
</div>
</form>
</section>

<div class="role-note">
<span>🔒</span>
<p>SMTP şifresi hiçbir zaman forma geri yazılmaz. Ayarlar <code>storage/mail-settings.php</code> içinde 0600 dosya izniyle ve atomik yazımla saklanır; güncelleme sistemi <code>storage</code> klasörünü korur.</p>
</div>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a class="active" href="eposta-ayarlari.php"><span>✉️</span>E-posta</a>
<a href="adimbot-ayarlari.php"><span>🤖</span>AdımBot</a>
<a href="guncelleme.php"><span>↻</span>Güncelle</a>
</nav>
</div>
</body>
</html>
