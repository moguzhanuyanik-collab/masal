<?php
declare(strict_types=1);
require __DIR__ . '/src/bootstrap.php';
require __DIR__ . '/src/auth.php';
require __DIR__ . '/src/normalized.php';

$user=require_login();
$pdo=db();
$message='';
$error='';

function h_role(string $v): string { return htmlspecialchars($v,ENT_QUOTES,'UTF-8'); }
function role_labels(array $roles): string {
    $map=['ogrenci'=>'Öğrenci','veli'=>'Veli','ogretmen'=>'Öğretmen','yonetici'=>'Yönetici','super_admin'=>'Süper Admin'];
    $out=[];
    foreach ($roles as $role) if (isset($map[$role])) $out[]=$map[$role];
    return implode(' · ',$out);
}

$superAdminCount=0;
$activeUserCount=0;
try {
    $superAdminCount=(int)$pdo->query("SELECT COUNT(DISTINCT k.id) FROM kullanicilar k INNER JOIN kullanici_rolleri r ON r.kullanici_id=k.id AND r.rol='super_admin' WHERE k.aktif=1")->fetchColumn();
    $activeUserCount=(int)$pdo->query("SELECT COUNT(*) FROM kullanicilar WHERE aktif=1")->fetchColumn();
} catch (Throwable) {}

if ($_SERVER['REQUEST_METHOD']==='POST' && (string)($_POST['action']??'')==='bootstrap_super_admin') {
    try {
        if (!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız.');
        if ($superAdminCount!==0 || $activeUserCount!==1) throw new RuntimeException('Otomatik sistem sahibi etkinleştirmesi bu kurulumda kullanılamaz.');
        $password=(string)($_POST['password']??'');
        $stmt=$pdo->prepare('SELECT sifre_hash FROM kullanicilar WHERE id=? AND aktif=1 LIMIT 1');
        $stmt->execute([(int)$user['id']]);
        $hash=(string)($stmt->fetchColumn()?:'');
        if ($hash==='' || !password_verify($password,$hash)) throw new RuntimeException('Mevcut şifre doğru değil.');

        $pdo->prepare("INSERT IGNORE INTO kullanici_rolleri (kullanici_id,rol) VALUES (?,'super_admin')")
            ->execute([(int)$user['id']]);
        auth_audit($pdo,(int)$user['id'],(int)$user['id'],'ilk_super_admin','Tek aktif hesap doğrulanarak ilk süper admin rolü etkinleştirildi');
        $user=auth_fetch_user($pdo,(int)$user['id'])??$user;
        $superAdminCount=1;
        $message='Sistem sahibi yetkisi etkinleştirildi. Artık kullanıcı ve eşleştirmeleri yönetebilirsin.';
    } catch (Throwable $e) {
        $error=$e->getMessage();
    }
}

$studentIds=auth_accessible_student_ids($pdo,(int)$user['id']);
$students=[];
if ($studentIds) {
    $placeholders=implode(',',array_fill(0,count($studentIds),'?'));
    $stmt=$pdo->prepare("SELECT id,email FROM ogrenciler WHERE id IN ({$placeholders}) AND aktif=1 ORDER BY id");
    $stmt->execute($studentIds);
    foreach ($stmt->fetchAll() as $row) {
        $sid=(int)$row['id'];
        $students[]=[
            'id'=>$sid,
            'email'=>(string)($row['email']??''),
            'summary'=>normalized_summary($pdo,$sid)
        ];
    }
}
$canManage=auth_user_has_role($user,['yonetici','super_admin']);
?><!DOCTYPE html>
<html lang="tr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,viewport-fit=cover">
<meta name="theme-color" content="#f8f7fc">
<title>Yetki Merkezi — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="app-shell">
<header class="app-topbar">
<a class="icon-button" href="<?=auth_user_has_role($user,'ogrenci')?'index.php#/profil':'logout.php'?>" aria-label="Geri">←</a>
<span class="topbar-title">Yetki Merkezi</span>
<a class="mini-avatar" href="logout.php" aria-label="Çıkış">🚪</a>
</header>
<main id="screen" tabindex="-1">
<div class="screen-content settings-screen">
<section class="subpage-intro">
<span>🛡️</span>
<h1>Hesabım ve Yetkilerim</h1>
<p><?=h_role((string)$user['email'])?> · <?=h_role(role_labels((array)$user['roles']))?></p>
</section>

<?php if ($message!==''): ?><section class="settings-block local-data"><p><?=h_role($message)?></p></section><?php endif; ?>
<?php if ($error!==''): ?><section class="settings-block local-data"><p><?=h_role($error)?></p></section><?php endif; ?>

<?php if ($superAdminCount===0 && $activeUserCount===1): ?>
<form method="post" class="settings-block">
<input type="hidden" name="action" value="bootstrap_super_admin">
<input type="hidden" name="csrf" value="<?=h_role(csrf_token())?>">
<h2>🔐 Sistem sahibini etkinleştir</h2>
<p class="little-note">Bu kurulumda yalnızca bir aktif hesap bulunduğu için ilk Süper Admin yetkisini kendi hesabına güvenli biçimde verebilirsin.</p>
<label class="field-label" for="bootstrap-password">Mevcut şifren</label>
<input class="text-input" id="bootstrap-password" type="password" name="password" autocomplete="current-password" required>
<button class="button primary full" type="submit">Sistem Sahibi Yetkisini Etkinleştir</button>
</form>
<?php elseif ($superAdminCount===0): ?>
<section class="settings-block">
<h2>⚠️ İlk yönetici gerekli</h2>
<p class="little-note">Birden fazla mevcut hesap olduğu için güvenlik amacıyla otomatik yönetici seçilmiyor. İlk Süper Admin rolü veritabanından bir kez atanmalı.</p>
</section>
<?php endif; ?>

<?php if ($canManage): ?>
<section class="settings-block">
<h2>👥 Kullanıcı Yönetimi</h2>
<p class="little-note">Veli, öğretmen ve yönetici hesaplarını oluştur; öğrencilerle güvenli eşleştirme yap.</p>
<a class="button primary full" href="yetkilendirme.php">Kullanıcı ve Eşleştirmeleri Yönet</a>
</section>
<?php endif; ?>

<section class="settings-block">
<h2>🎓 Erişebildiğim Öğrenciler</h2>
<?php if (!$students): ?>
<p class="little-note">Bu hesaba bağlı öğrenci bulunmuyor.</p>
<?php else: foreach ($students as $student): $s=$student['summary']; ?>
<div class="history-item">
<span>🎒</span>
<div>
<strong><?=h_role($student['email']!==''?$student['email']:'Öğrenci #'.$student['id'])?></strong>
<small>
<?=$s['completed_steps']?> ders adımı · <?=$s['games']?> oyun · <?=$s['stars']?> yıldız
</small>
</div>
<a href="ogrenci-raporu.php?id=<?=$student['id']?>" aria-label="Raporu aç">→</a>
</div>
<?php endforeach; endif; ?>
</section>

<?php if (auth_user_has_role($user,'ogrenci')): ?>
<a class="button soft full" href="index.php">Öğrenci Uygulamasına Dön</a>
<?php endif; ?>
<a class="button soft full" href="logout.php">Çıkış Yap</a>
</div>
</main>
</div>
</body>
</html>
