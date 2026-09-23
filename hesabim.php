<?php
declare(strict_types=1);
require __DIR__ . '/src/bootstrap.php';
require __DIR__ . '/src/auth.php';

$studentId = require_student_login();
$pdo = db();
$error = '';
$success = '';

try {
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        if (!verify_csrf($_POST['csrf'] ?? null)) {
            throw new RuntimeException('Güvenlik doğrulaması başarısız.');
        }

        $action = (string)($_POST['action'] ?? 'account');

        if ($action === 'photo') {
            if (!isset($_FILES['profile_photo']) || !is_array($_FILES['profile_photo'])) {
                throw new RuntimeException('Bir fotoğraf seçin.');
            }
            $file = $_FILES['profile_photo'];
            if ((int)($file['error'] ?? UPLOAD_ERR_NO_FILE) !== UPLOAD_ERR_OK) {
                throw new RuntimeException('Fotoğraf yüklenemedi.');
            }
            $size = (int)($file['size'] ?? 0);
            if ($size <= 0 || $size > 5 * 1024 * 1024) {
                throw new RuntimeException('Fotoğraf 5 MB’tan küçük olmalıdır.');
            }

            $tmp = (string)($file['tmp_name'] ?? '');
            $info = @getimagesize($tmp);
            if (!is_array($info) || !in_array((int)$info[2], [IMAGETYPE_JPEG, IMAGETYPE_PNG, IMAGETYPE_WEBP], true)) {
                throw new RuntimeException('Yalnızca JPG, PNG veya WebP fotoğraf yükleyin.');
            }

            $mime = match ((int)$info[2]) {
                IMAGETYPE_JPEG => 'image/jpeg',
                IMAGETYPE_PNG => 'image/png',
                IMAGETYPE_WEBP => 'image/webp',
                default => throw new RuntimeException('Geçersiz fotoğraf.')
            };

            $bytes = file_get_contents($tmp);
            if (!is_string($bytes) || $bytes === '') {
                throw new RuntimeException('Fotoğraf okunamadı.');
            }

            $dataUri = 'data:' . $mime . ';base64,' . base64_encode($bytes);
            $pdo->prepare('UPDATE ogrenciler SET profil_fotografi=? WHERE id=?')
                ->execute([$dataUri, $studentId]);

            if (function_exists('load_student_state') && function_exists('save_student_state')) {
                try {
                    $state = load_student_state($pdo, $studentId);
                    $state['photo'] = $dataUri;
                    save_student_state($pdo, $studentId, $state);
                } catch (Throwable) {}
            }

            $success = 'Profil fotoğrafı güncellendi.';
        } elseif ($action === 'remove_photo') {
            $pdo->prepare('UPDATE ogrenciler SET profil_fotografi=NULL WHERE id=?')->execute([$studentId]);

            if (function_exists('load_student_state') && function_exists('save_student_state')) {
                try {
                    $state = load_student_state($pdo, $studentId);
                    $state['photo'] = '';
                    save_student_state($pdo, $studentId, $state);
                } catch (Throwable) {}
            }
            $success = 'Profil fotoğrafı kaldırıldı.';
        } else {
            $email = mb_strtolower(trim((string)($_POST['email'] ?? '')));
            $current = (string)($_POST['current_password'] ?? '');
            $new = (string)($_POST['new_password'] ?? '');
            $repeat = (string)($_POST['new_password_repeat'] ?? '');

            if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
                throw new RuntimeException('Geçerli bir e-posta adresi yazın.');
            }

            $stmt = $pdo->prepare('SELECT sifre_hash FROM ogrenciler WHERE id=? LIMIT 1');
            $stmt->execute([$studentId]);
            $hash = (string)($stmt->fetchColumn() ?: '');

            if ($hash === '' || !password_verify($current, $hash)) {
                throw new RuntimeException('Mevcut şifre doğru değil.');
            }

            $dup = $pdo->prepare('SELECT id FROM ogrenciler WHERE email=? AND id<>? LIMIT 1');
            $dup->execute([$email, $studentId]);
            if ($dup->fetchColumn()) {
                throw new RuntimeException('Bu e-posta başka bir öğrenci hesabında kullanılıyor.');
            }

            if ($new !== '') {
                if (mb_strlen($new) < 8) {
                    throw new RuntimeException('Yeni şifre en az 8 karakter olmalıdır.');
                }
                if ($new !== $repeat) {
                    throw new RuntimeException('Yeni şifreler eşleşmiyor.');
                }

                $newHash = password_hash($new, PASSWORD_DEFAULT);
                $pdo->prepare('UPDATE ogrenciler SET email=?, sifre_hash=? WHERE id=?')
                    ->execute([$email, $newHash, $studentId]);
                try {
                    $pdo->prepare('DELETE FROM ogrenci_oturum_tokenlari WHERE ogrenci_id=?')
                        ->execute([$studentId]);
                } catch (Throwable) {}
                clear_remember_cookie();
            } else {
                $pdo->prepare('UPDATE ogrenciler SET email=? WHERE id=?')
                    ->execute([$email, $studentId]);
            }

            $success = 'Hesap bilgileri güncellendi.';
        }
    }
} catch (Throwable $e) {
    $error = $e->getMessage();
}

$stmt = $pdo->prepare('SELECT ad,email,avatar,profil_fotografi,son_giris_tarihi FROM ogrenciler WHERE id=? LIMIT 1');
$stmt->execute([$studentId]);
$student = $stmt->fetch() ?: [];

function h(string $v): string { return htmlspecialchars($v, ENT_QUOTES, 'UTF-8'); }
?><!DOCTYPE html>
<html lang="tr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,viewport-fit=cover">
<meta name="theme-color" content="#f8f7fc">
<title>Hesabım — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="app-shell">
<header class="app-topbar">
<a class="icon-button" href="index.php#/profil" aria-label="Profile dön">←</a>
<div class="topbar-title">Hesabım</div>
<a class="mini-avatar" href="index.php#/profil" aria-label="Profil">
<?php if (!empty($student['profil_fotografi'])): ?>
<img class="avatar-photo" src="<?=h((string)$student['profil_fotografi'])?>" alt="Profil resmi">
<?php else: ?>
<span class="avatar-emoji"><?=h((string)($student['avatar'] ?? '🌞'))?></span>
<?php endif; ?>
</a>
</header>

<main id="screen"><div class="screen-content settings-screen">
<section class="subpage-intro">
<span>👤</span>
<h1><?=h((string)($student['ad'] ?? 'Öğrenci'))?></h1>
<p>E-posta, şifre ve profil fotoğrafını buradan yönetebilirsin.</p>
</section>

<?php if ($error !== ''): ?>
<section class="settings-block local-data"><p><?=h($error)?></p></section>
<?php endif; ?>

<?php if ($success !== ''): ?>
<section class="weekly-summary"><strong><?=h($success)?></strong></section>
<?php endif; ?>

<section class="settings-block">
<h2>Profil Fotoğrafı</h2>
<?php if (!empty($student['profil_fotografi'])): ?>
<div class="edit-avatar"><img class="avatar-photo" src="<?=h((string)$student['profil_fotografi'])?>" alt="Profil fotoğrafı"></div>
<?php else: ?>
<div class="edit-avatar"><span class="avatar-emoji"><?=h((string)($student['avatar'] ?? '🌞'))?></span></div>
<?php endif; ?>

<form method="post" enctype="multipart/form-data">
<input type="hidden" name="action" value="photo">
<input type="hidden" name="csrf" value="<?=h(csrf_token())?>">
<input class="text-input" type="file" name="profile_photo" accept="image/jpeg,image/png,image/webp" required>
<button class="button primary full" type="submit">Fotoğrafı Yükle</button>
</form>

<?php if (!empty($student['profil_fotografi'])): ?>
<form method="post">
<input type="hidden" name="action" value="remove_photo">
<input type="hidden" name="csrf" value="<?=h(csrf_token())?>">
<button class="button soft full" type="submit">Fotoğrafı Kaldır</button>
</form>
<?php endif; ?>
</section>

<form method="post" class="settings-block">
<input type="hidden" name="action" value="account">
<input type="hidden" name="csrf" value="<?=h(csrf_token())?>">
<h2>Giriş Bilgileri</h2>

<label class="field-label" for="email">E-posta</label>
<input class="text-input" type="email" id="email" name="email"
       value="<?=h((string)($student['email'] ?? ''))?>" autocomplete="username" required>

<label class="field-label" for="current_password">Mevcut şifre</label>
<input class="text-input" type="password" id="current_password" name="current_password"
       autocomplete="current-password" required>

<label class="field-label" for="new_password">Yeni şifre</label>
<input class="text-input" type="password" id="new_password" name="new_password"
       minlength="8" autocomplete="new-password" placeholder="Değiştirmeyeceksen boş bırak">

<label class="field-label" for="new_password_repeat">Yeni şifre tekrar</label>
<input class="text-input" type="password" id="new_password_repeat" name="new_password_repeat"
       minlength="8" autocomplete="new-password">

<button class="button primary full" type="submit">Bilgileri Kaydet</button>
</form>

<a class="button soft full" href="logout.php">Çıkış Yap</a>
<p class="little-note">Profil fotoğrafı öğrenci hesabına kaydedilir. JPG, PNG ve WebP desteklenir; en fazla 5 MB.</p>
</div></main>
</div>
</body>
</html>
