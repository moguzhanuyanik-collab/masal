<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/ogretmen_icerik.php';

$studentId=require_student_login();
$pdo=db();
$flash='';
$flashType='';

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız.');
        if((string)($_POST['action']??'')!=='homework_status') throw new RuntimeException('Geçersiz işlem.');
        $contentId=(int)($_POST['icerik_id']??0);
        $completed=(int)($_POST['tamamlandi']??0)===1;
        oi_set_homework_completed($pdo,$studentId,$contentId,$completed);
        $flash=$completed?'Harika! Ödevini tamamlandı olarak işaretledin. 🎉':'Ödev tekrar bekleyenlere alındı.';
        $flashType=$completed?'ok':'';
    }catch(RuntimeException $e){
        $flash=$e->getMessage();
        $flashType='bad';
    }catch(Throwable $e){
        error_log('[IlkAdim][student-homework] '.$e->getMessage());
        $flash='Ödev durumu şu anda kaydedilemedi. Lütfen tekrar dene.';
        $flashType='bad';
    }
}

$contents=oi_student_contents($pdo,$studentId);
$homeworks=array_values(array_filter(
    $contents,
    static fn(array $item): bool => (string)($item['icerik_turu']??'')==='odev'
));

usort($homeworks,static function(array $a,array $b): int {
    $ad=(int)($a['odev_tamamlandi']??0);
    $bd=(int)($b['odev_tamamlandi']??0);
    if($ad!==$bd) return $ad<=>$bd;
    $at=trim((string)($a['teslim_tarihi']??''));
    $bt=trim((string)($b['teslim_tarihi']??''));
    if($at==='' && $bt!=='') return 1;
    if($at!=='' && $bt==='') return -1;
    if($at!==$bt) return strcmp($at,$bt);
    return (int)$b['id']<=>(int)$a['id'];
});

function oh_h(string $value): string {
    return htmlspecialchars($value,ENT_QUOTES,'UTF-8');
}
function oh_due_label(?string $due): string {
    $due=trim((string)$due);
    return $due!==''?date('d.m.Y H:i',strtotime($due)):'Süre sınırı yok';
}
function oh_is_late(array $item): bool {
    $due=trim((string)($item['teslim_tarihi']??''));
    if($due==='' || (int)($item['odev_tamamlandi']??0)===1) return false;
    return strtotime($due)!==false && strtotime($due)<time();
}
?><!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,viewport-fit=cover">
<meta name="theme-color" content="#f8f7fc">
<title>Ödevlerim — İlkAdım</title>
<link rel="icon" href="ilkadim-logo.svg" type="image/svg+xml">
<link rel="apple-touch-icon" href="ilkadim-logo-192.png">
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="ogrenci-odevleri.css?v=1.2.7">
</head>
<body>
<svg class="icon-library" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
<symbol id="home" viewBox="0 0 24 24"><path d="m3 10 9-7 9 7v10h-6v-6H9v6H3Z"/></symbol>
<symbol id="book" viewBox="0 0 24 24"><path d="M12 5C8 2 3 3 3 3v16s5-1 9 2c4-3 9-2 9-2V3s-5-1-9 2Zm0 0v16"/></symbol>
<symbol id="star" viewBox="0 0 24 24"><path d="m12 3 3 6 7 1-5 5 1 7-6-3-6 3 1-7-5-5 7-1Z"/></symbol>
<symbol id="user" viewBox="0 0 24 24"><circle cx="12" cy="8" r="4"/><path d="M4 21v-2a8 8 0 0 1 16 0v2"/></symbol>
</svg>

<div class="app-shell">
<header class="app-topbar">
<a class="icon-button" href="index.php#/anasayfa" aria-label="Ana sayfaya dön">←</a>
<span class="topbar-title">Ödevlerim</span>
<a class="mini-avatar" href="index.php#/profil" aria-label="Profil">🌞</a>
</header>

<main id="screen" class="homework-page">
<section class="homework-hero">
<small>📝 ÖDEVLERİM</small>
<h1>Bugün neyi tamamlayacaksın?</h1>
<p>Öğretmenlerinin gönderdiği ödevleri ve teslim tarihlerini burada takip edebilirsin.</p>
<span class="homework-hero-art">✅</span>
</section>

<?php if($flash!==''):?>
<div class="homework-flash <?=$flashType==='bad'?'bad':''?>"><?=oh_h($flash)?></div>
<?php endif;?>

<?php if(!$homeworks):?>
<div class="homework-empty"><span>🎉</span><strong>Bekleyen ödevin yok.</strong><p>Yeni ödev geldiğinde burada görünecek.</p></div>
<?php else:?>
<div class="homework-list">
<?php foreach($homeworks as $item):
    $done=(int)($item['odev_tamamlandi']??0)===1;
    $late=oh_is_late($item);
?>
<article class="homework-card <?=$done?'done':($late?'late':'')?>">
<div class="homework-card-head">
<span class="homework-subject"><?=oh_h((string)($item['ders_emoji']??'📚'))?></span>
<div>
<small><?=oh_h((string)$item['ders_adi'])?> · <?=oh_h((string)$item['ogretmen_adi'])?></small>
<h2><?=oh_h((string)$item['baslik'])?></h2>
</div>
<span class="homework-status <?=$done?'done':($late?'late':'pending')?>"><?=$done?'Tamamlandı':($late?'Süresi geçti':'Bekliyor')?></span>
</div>

<?php if(!empty($item['icerik_metni'])):?><p class="homework-text"><?=nl2br(oh_h((string)$item['icerik_metni']))?></p><?php endif;?>

<div class="homework-meta">
<span>🏫 <?=oh_h((string)$item['kurum_adi'])?></span>
<span>⏰ <?=oh_h(oh_due_label($item['teslim_tarihi']??null))?></span>
<?php if($done && !empty($item['odev_tamamlanma_tarihi'])):?><span>✅ <?=oh_h(date('d.m.Y H:i',strtotime((string)$item['odev_tamamlanma_tarihi'])))?></span><?php endif;?>
</div>

<form method="post" class="homework-action">
<input type="hidden" name="csrf" value="<?=oh_h(csrf_token())?>">
<input type="hidden" name="action" value="homework_status">
<input type="hidden" name="icerik_id" value="<?=(int)$item['id']?>">
<input type="hidden" name="tamamlandi" value="<?=$done?0:1?>">
<button type="submit" class="<?=$done?'secondary':'primary'?>"><?=$done?'Tekrar bekliyor yap':'✓ Tamamladım'?></button>
</form>
</article>
<?php endforeach;?>
</div>
<?php endif;?>

<a class="homework-teacher-link" href="ogretmenim.php">⭐ Öğretmenimin diğer içeriklerini aç</a>
</main>

<nav class="app-nav app-nav-five" aria-label="Uygulama menüsü">
<a href="index.php#/anasayfa"><span><svg><use href="#home"/></svg></span>Anasayfa</a>
<a href="index.php#/dersler"><span><svg><use href="#book"/></svg></span>Dersler</a>
<a class="active" href="ogrenci-odevleri.php"><span>📝</span>Ödevler</a>
<a href="index.php#/etkinlikler"><span><svg><use href="#star"/></svg></span>Etkinlikler</a>
<a href="index.php#/profil"><span><svg><use href="#user"/></svg></span>Profil</a>
</nav>
</div>
</body>
</html>
