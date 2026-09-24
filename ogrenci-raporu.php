<?php
declare(strict_types=1);
require __DIR__ . '/src/bootstrap.php';
require __DIR__ . '/src/auth.php';
require __DIR__ . '/src/normalized.php';

$user=require_login();
$pdo=db();
$roleHome=auth_role_home($user);
$studentId=(int)($_GET['id']??0);
if ($studentId<=0 || !can_access_student((int)$user['id'],$studentId)) {
    http_response_code(403);
    echo 'Bu öğrenci raporuna erişim yetkiniz yok.';
    exit;
}

$stmt=$pdo->prepare('SELECT id,email,sinif_seviyesi FROM ogrenciler WHERE id=? AND aktif=1 LIMIT 1');
$stmt->execute([$studentId]);
$student=$stmt->fetch();
if (!is_array($student)) {
    http_response_code(404);
    echo 'Öğrenci bulunamadı.';
    exit;
}

$summary=normalized_summary($pdo,$studentId);
$studentGrade=max(1,(int)($student['sinif_seviyesi']??1));
$lessonStmt=$pdo->prepare('SELECT d.kod,d.ad,COUNT(DISTINCT m.id) toplam_modul,(SELECT COUNT(*) FROM ogrenci_ilerleme oi WHERE oi.ogrenci_id=? AND oi.sinif_seviyesi=? AND oi.ders_kodu=d.kod AND oi.tamamlandi=1) tamamlanan_modul FROM dersler d INNER JOIN sinif_dersleri sd ON sd.ders_id=d.id AND sd.sinif_seviyesi=? AND sd.aktif=1 LEFT JOIN ders_modulleri m ON m.ders_id=d.id AND m.sinif_seviyesi=? AND m.aktif=1 WHERE d.aktif=1 GROUP BY d.id,d.kod,d.ad,sd.sira ORDER BY sd.sira,d.id');
$lessonStmt->execute([$studentId,$studentGrade,$studentGrade,$studentGrade]);
$lessons=$lessonStmt->fetchAll();

$badgeStmt=$pdo->prepare('SELECT r.ad,r.emoji,r.aciklama FROM ogrenci_rozetleri orr INNER JOIN rozetler r ON r.id=orr.rozet_id WHERE orr.ogrenci_id=? ORDER BY r.sira,r.id');
$badgeStmt->execute([$studentId]);
$badges=$badgeStmt->fetchAll();

function h_report(string $v): string { return htmlspecialchars($v,ENT_QUOTES,'UTF-8'); }
?><!DOCTYPE html>
<html lang="tr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,viewport-fit=cover">
<meta name="theme-color" content="#f8f7fc">
<title>Öğrenci Raporu — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
</head>
<body>
<div class="app-shell">
<header class="app-topbar">
<a class="icon-button" href="<?=h_report($roleHome)?>" aria-label="Geri">←</a>
<span class="topbar-title">Öğrenci Raporu</span>
<a class="mini-avatar" href="logout.php" aria-label="Çıkış">🚪</a>
</header>
<main id="screen" tabindex="-1">
<div class="screen-content settings-screen">
<section class="subpage-intro">
<span>📊</span>
<h1><?=h_report((string)($student['email']?:'Öğrenci #'.$studentId))?></h1>
<p><?=$studentGrade?>. sınıf · Bu rapor yalnızca hesabına yetkilendirilmiş öğrenci için görüntülenebilir.</p>
</section>

<section class="settings-block">
<h2>Genel durum</h2>
<div class="history-item"><span>📚</span><div><strong><?=$summary['completed_steps']?> ders adımı</strong><small>Tamamlanan öğrenme adımları</small></div></div>
<div class="history-item"><span>🎮</span><div><strong><?=$summary['games']?> oyun</strong><small>Tamamlanan etkinlikler</small></div></div>
<div class="history-item"><span>⭐</span><div><strong><?=$summary['stars']?> yıldız</strong><small>Toplam başarı yıldızı</small></div></div>
<div class="history-item"><span>🏅</span><div><strong><?=$summary['badges']?> rozet</strong><small>Kazanılan rozetler</small></div></div>
</section>

<section class="settings-block">
<h2>Ders ilerlemesi</h2>
<?php foreach ($lessons as $lesson):
$total=(int)$lesson['toplam_modul'];$done=(int)$lesson['tamamlanan_modul'];$percent=$total>0?(int)round($done/$total*100):0; ?>
<div class="history-item">
<span>📘</span>
<div><strong><?=h_report((string)$lesson['ad'])?></strong><small><?=$done?> / <?=$total?> konu · %<?=$percent?></small></div>
</div>
<?php endforeach; ?>
</section>

<section class="settings-block">
<h2>Rozetler</h2>
<?php if (!$badges): ?><p class="little-note">Henüz kazanılmış rozet yok.</p><?php endif; ?>
<?php foreach ($badges as $badge): ?>
<div class="history-item"><span><?=h_report((string)$badge['emoji'])?></span><div><strong><?=h_report((string)$badge['ad'])?></strong><small><?=h_report((string)$badge['aciklama'])?></small></div></div>
<?php endforeach; ?>
</section>

<a class="button soft full" href="<?=h_report($roleHome)?>">Panelime Dön</a>
</div>
</main>
</div>
</body>
</html>
