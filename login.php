<?php
declare(strict_types=1);
require __DIR__ . '/src/bootstrap.php';
require __DIR__ . '/src/auth.php';

app_session_start();
$existing=authenticated_user();
if ($existing) {
    header('Location: '.auth_post_login_url($existing));
    exit;
}

$error='';
$email='';
try {
    $pdo=db();

    if (!auth_accounts_ready($pdo)) {
        throw new RuntimeException('Henüz giriş yapılabilecek kullanıcı hesabı bulunmuyor.');
    }

    if ($_SERVER['REQUEST_METHOD']==='POST') {
        if (!verify_csrf($_POST['csrf']??null)) {
            throw new RuntimeException('Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar deneyin.');
        }

        $email=mb_strtolower(trim((string)($_POST['email']??'')));
        $password=(string)($_POST['password']??'');
        $remember=isset($_POST['remember']);

        if (!filter_var($email,FILTER_VALIDATE_EMAIL) || $password==='') {
            throw new RuntimeException('E-posta ve şifreyi kontrol edin.');
        }

        $user=null;
        if (auth_runtime_table_exists($pdo,'kullanicilar')) {
            $stmt=$pdo->prepare('SELECT id,email,sifre_hash,ad_soyad,ana_rol,aktif FROM kullanicilar WHERE email=? AND aktif=1 LIMIT 1');
            $stmt->execute([$email]);
            $user=$stmt->fetch();
        }

        // Eski öğrenci hesaplarını güncelleme sırasında koruyan uyumluluk yolu.
        if (!is_array($user)) {
            $stmt=$pdo->prepare('SELECT id,email,sifre_hash FROM ogrenciler WHERE email=? AND aktif=1 LIMIT 1');
            $stmt->execute([$email]);
            $legacy=$stmt->fetch();
            if (is_array($legacy) && !empty($legacy['sifre_hash']) && password_verify($password,(string)$legacy['sifre_hash'])) {
                $map=$pdo->prepare('SELECT kullanici_id FROM ogrenciler WHERE id=? LIMIT 1');
                $map->execute([(int)$legacy['id']]);
                $userId=(int)($map->fetchColumn()?:0);
                if ($userId>0) $user=auth_fetch_user($pdo,$userId);
            }
        }

        if (!is_array($user) || empty($user['sifre_hash']) || !password_verify($password,(string)$user['sifre_hash'])) {
            usleep(300000);
            throw new RuntimeException('E-posta veya şifre hatalı.');
        }

        $userId=(int)$user['id'];
        $sessionUser=auth_set_user_session($pdo,$userId,true);
        if (!$sessionUser) throw new RuntimeException('Kullanıcı oturumu açılamadı.');

        $ip=mb_substr((string)($_SERVER['REMOTE_ADDR']??''),0,45);
        $pdo->prepare('UPDATE kullanicilar SET son_giris_tarihi=NOW(),son_giris_ip=? WHERE id=?')
            ->execute([$ip!==''?$ip:null,$userId]);

        $studentId=auth_student_id_for_user($pdo,$userId);
        if ($studentId!==null) {
            try {
                $pdo->prepare('UPDATE ogrenciler SET son_giris_tarihi=NOW(),son_giris_ip=? WHERE id=?')
                    ->execute([$ip!==''?$ip:null,$studentId]);
            } catch (Throwable) {}
        }

        try {
            $pdo->prepare('DELETE FROM kullanici_oturum_tokenlari WHERE son_kullanma_tarihi<=NOW()')->execute();
        } catch (Throwable) {}

        if ($remember) {
            clear_remember_cookie($pdo);
            remember_user($pdo,$userId);
        }

        auth_audit($pdo,$userId,$userId,'giris','Başarılı kullanıcı girişi');
        header('Location: '.auth_post_login_url($sessionUser));
        exit;
    }
} catch (Throwable $e) {
    $error=$e->getMessage();
}

function h(string $v): string { return htmlspecialchars($v,ENT_QUOTES,'UTF-8'); }
?><!DOCTYPE html>
<html lang="tr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,viewport-fit=cover">
<meta name="theme-color" content="#f8f7fc">
<title>Giriş — İlkAdım</title>
<link rel="icon" href="ilkadim-logo.svg" type="image/svg+xml">
<link rel="apple-touch-icon" href="ilkadim-logo-192.png">
<link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="app-shell">
<main id="screen" tabindex="-1">
<div class="screen-content settings-screen">
<section class="subpage-intro">
<span>🌞</span>
<h1>Tekrar hoş geldin</h1>
<p>Öğrenci, veli, öğretmen ve yönetici hesapları aynı güvenli giriş ekranını kullanır.</p>
</section>

<?php if ($error!==''): ?>
<section class="settings-block local-data"><p><?=h($error)?></p></section>
<?php endif; ?>

<form method="post" class="settings-block" autocomplete="on">
<input type="hidden" name="csrf" value="<?=h(csrf_token())?>">
<h2>İlkAdım Girişi</h2>

<label class="field-label" for="email">E-posta</label>
<input class="text-input" type="email" id="email" name="email"
       value="<?=h($email)?>" autocomplete="username" inputmode="email" required autofocus>

<label class="field-label" for="password">Şifre</label>
<input class="text-input" type="password" id="password" name="password"
       autocomplete="current-password" required>

<label class="switch-row">
<span><strong>Beni hatırla</strong><small>Bu cihazda 30 gün açık kal</small></span>
<input type="checkbox" name="remember" value="1">
</label>

<button class="button primary full" type="submit">Giriş Yap →</button>
</form>
</div>
</main>
</div>
</body>
</html>
