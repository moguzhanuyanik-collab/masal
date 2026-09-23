<?php
declare(strict_types=1);
require __DIR__ . '/src/bootstrap.php';
require __DIR__ . '/src/auth.php';

$user=require_login();
$pdo=db();
$roleHome=auth_role_home($user);
$message='';
$error='';

function h_sec(string $v): string { return htmlspecialchars($v,ENT_QUOTES,'UTF-8'); }

if ($_SERVER['REQUEST_METHOD']==='POST') {
    try {
        if (!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız.');
        $email=mb_strtolower(trim((string)($_POST['email']??'')));
        $current=(string)($_POST['current_password']??'');
        $new=(string)($_POST['new_password']??'');
        $repeat=(string)($_POST['new_password_repeat']??'');

        if (!filter_var($email,FILTER_VALIDATE_EMAIL)) throw new RuntimeException('Geçerli bir e-posta adresi yaz.');
        if ($current==='') throw new RuntimeException('Mevcut şifreni yaz.');

        $stmt=$pdo->prepare('SELECT sifre_hash FROM kullanicilar WHERE id=? AND aktif=1 LIMIT 1');
        $stmt->execute([(int)$user['id']]);
        $hash=(string)($stmt->fetchColumn()?:'');
        if ($hash===''||!password_verify($current,$hash)) throw new RuntimeException('Mevcut şifre doğru değil.');

        $dup=$pdo->prepare('SELECT id FROM kullanicilar WHERE email=? AND id<>? LIMIT 1');
        $dup->execute([$email,(int)$user['id']]);
        if ($dup->fetchColumn()) throw new RuntimeException('Bu e-posta başka bir kullanıcı hesabında kullanılıyor.');

        $newHash=null;
        if ($new!=='') {
            if (mb_strlen($new)<8) throw new RuntimeException('Yeni şifre en az 8 karakter olmalı.');
            if ($new!==$repeat) throw new RuntimeException('Yeni şifreler eşleşmiyor.');
            $newHash=password_hash($new,PASSWORD_DEFAULT);
            if (!is_string($newHash)||$newHash==='') throw new RuntimeException('Yeni şifre oluşturulamadı.');
        }

        $studentId=auth_student_id_for_user($pdo,(int)$user['id']);
        $pdo->beginTransaction();
        try {
            if ($newHash!==null) {
                $pdo->prepare('UPDATE kullanicilar SET email=?,sifre_hash=? WHERE id=?')->execute([$email,$newHash,(int)$user['id']]);
                if ($studentId!==null) $pdo->prepare('UPDATE ogrenciler SET email=?,sifre_hash=? WHERE id=?')->execute([$email,$newHash,$studentId]);
                $pdo->prepare('DELETE FROM kullanici_oturum_tokenlari WHERE kullanici_id=?')->execute([(int)$user['id']]);
                if ($studentId!==null && auth_runtime_table_exists($pdo,'ogrenci_oturum_tokenlari')) {
                    $pdo->prepare('DELETE FROM ogrenci_oturum_tokenlari WHERE ogrenci_id=?')->execute([$studentId]);
                }
            } else {
                $pdo->prepare('UPDATE kullanicilar SET email=? WHERE id=?')->execute([$email,(int)$user['id']]);
                if ($studentId!==null) $pdo->prepare('UPDATE ogrenciler SET email=? WHERE id=?')->execute([$email,$studentId]);
            }
            $pdo->commit();
        } catch (Throwable $e) {
            if ($pdo->inTransaction()) $pdo->rollBack();
            throw $e;
        }

        if ($newHash!==null) clear_remember_cookie($pdo);
        auth_audit($pdo,(int)$user['id'],(int)$user['id'],'hesap_guvenligi',$newHash!==null?'E-posta ve şifre güncellendi':'E-posta güncellendi');
        $user=auth_fetch_user($pdo,(int)$user['id'])??$user;
        $message=$newHash!==null?'E-posta ve şifre güncellendi.':'E-posta adresi güncellendi.';
    } catch (PDOException $e) {
        $error=$e->getCode()==='23000'?'Bu e-posta zaten kullanılıyor.':'Hesap bilgileri güncellenemedi.';
    } catch (Throwable $e) {
        $error=$e->getMessage();
    }
}
?><!DOCTYPE html>
<html lang="tr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,viewport-fit=cover">
<meta name="theme-color" content="#f8f7fc">
<title>Hesap Güvenliği — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="app-shell">
<header class="app-topbar">
<a class="icon-button" href="<?=h_sec($roleHome)?>" aria-label="Geri">←</a>
<span class="topbar-title">Hesap Güvenliği</span>
<a class="mini-avatar" href="logout.php" aria-label="Çıkış">🚪</a>
</header>
<main id="screen" tabindex="-1">
<div class="screen-content settings-screen">
<section class="subpage-intro">
<span>🔐</span><h1>Giriş Bilgilerim</h1><p>E-posta adresini ve şifreni güvenli biçimde güncelle.</p>
</section>
<?php if ($message!==''): ?><section class="settings-block local-data"><p><?=h_sec($message)?></p></section><?php endif; ?>
<?php if ($error!==''): ?><section class="settings-block local-data"><p><?=h_sec($error)?></p></section><?php endif; ?>

<form method="post" class="settings-block" autocomplete="on">
<input type="hidden" name="csrf" value="<?=h_sec(csrf_token())?>">
<label class="field-label">E-posta</label>
<input class="text-input" type="email" name="email" value="<?=h_sec((string)$user['email'])?>" required>
<label class="field-label">Mevcut şifre</label>
<input class="text-input" type="password" name="current_password" autocomplete="current-password" required>
<label class="field-label">Yeni şifre</label>
<input class="text-input" type="password" name="new_password" minlength="8" autocomplete="new-password" placeholder="Değiştirmeyeceksen boş bırak">
<label class="field-label">Yeni şifre tekrar</label>
<input class="text-input" type="password" name="new_password_repeat" minlength="8" autocomplete="new-password">
<button class="button primary full" type="submit">Giriş Bilgilerini Kaydet</button>
</form>
<a class="button soft full" href="<?=h_sec($roleHome)?>">Panelime Dön</a>
</div>
</main>
</div>
</body>
</html>
