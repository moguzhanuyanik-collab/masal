<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/ogretmen_icerik.php';
require __DIR__.'/src/odev_durumu.php';
require __DIR__.'/src/ogrenci_odev_dashboard.php';

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

try{
    $contents=oi_student_contents($pdo,$studentId);
}catch(Throwable){
    http_response_code(503);
    echo 'Ödevler şu anda okunamıyor.';
    exit;
}

$allHomeworks=sod_homeworks($contents);
$institutions=sod_institutions($allHomeworks);
$institutionIds=array_map('intval',array_column($institutions,'id'));

$institutionId=max(0,(int)($_GET['kurum_id']??0));
if($institutionId>0 && !in_array($institutionId,$institutionIds,true)){
    http_response_code(403);
    echo 'Bu kurum için aktif ödev erişimin yok.';
    exit;
}

$status=(string)($_GET['durum']??'tum');
if(!in_array($status,['tum','pending','overdue','completed'],true)) $status='tum';

$institutionHomeworks=sod_filter($allHomeworks,$institutionId,'tum');
$summary=sod_summary($institutionHomeworks);
$homeworks=sod_filter($allHomeworks,$institutionId,$status);

function oh_h(string $value): string {
    return htmlspecialchars($value,ENT_QUOTES,'UTF-8');
}
function oh_due_label(?string $due): string {
    $due=trim((string)$due);
    if($due==='') return 'Süre sınırı yok';
    try{return (new DateTimeImmutable($due))->format('d.m.Y H:i');}
    catch(Throwable){return 'Süre sınırı yok';}
}
function oh_status_class(string $status): string {
    return match($status){
        'completed'=>'done',
        'overdue'=>'late',
        default=>'pending',
    };
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
<link rel="stylesheet" href="ogrenci-odevleri.css?v=1.2.24">
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
<h1>Önceliğini gör, ödevini tamamla.</h1>
<p>Gecikenleri, bekleyenleri ve tamamladıklarını ayrı takip et. En acil ödevler listenin üstünde.</p>
<span class="homework-hero-art">✅</span>
</section>

<?php if($flash!==''):?>
<div class="homework-flash <?=$flashType==='bad'?'bad':''?>"><?=oh_h($flash)?></div>
<?php endif;?>

<section class="homework-dashboard">
<div class="homework-dashboard-head">
<div><small>TESLİM ÖZETİ</small><strong>Ödev Durumum</strong></div>
<?php if($summary['next_due'] instanceof DateTimeImmutable):?>
<span>⏰ Sıradaki: <?=oh_h($summary['next_due']->format('d.m.Y H:i'))?></span>
<?php endif;?>
</div>
<div class="homework-stats">
<div class="homework-stat"><span>📝</span><strong><?=$summary['total']?></strong><small>Toplam</small></div>
<div class="homework-stat"><span>⏳</span><strong><?=$summary['pending']?></strong><small>Bekliyor</small></div>
<div class="homework-stat"><span>⏰</span><strong><?=$summary['overdue']?></strong><small>Gecikti</small></div>
<div class="homework-stat"><span>✅</span><strong><?=$summary['completed']?></strong><small>Tamamlandı</small></div>
<div class="homework-stat homework-stat-wide"><span>📈</span><strong>%<?=$summary['completion_rate']?></strong><small>Tamamlama oranı</small></div>
</div>
</section>

<?php if($allHomeworks):?>
<section class="homework-filter-section">
<div class="homework-filter-title"><small>FİLTRELER</small><strong>Kurum ve Durum</strong></div>
<form method="get" class="homework-filter">
<label for="kurum">Kurum</label>
<select id="kurum" name="kurum_id">
<option value="0">Tüm kurumlarım</option>
<?php foreach($institutions as $institution):?>
<option value="<?=(int)$institution['id']?>" <?=((int)$institution['id']===$institutionId?'selected':'')?>><?=oh_h((string)$institution['ad'])?></option>
<?php endforeach;?>
</select>

<label for="durum">Teslim durumu</label>
<select id="durum" name="durum">
<option value="tum" <?=$status==='tum'?'selected':''?>>Tümü</option>
<option value="overdue" <?=$status==='overdue'?'selected':''?>>Gecikenler</option>
<option value="pending" <?=$status==='pending'?'selected':''?>>Bekleyenler</option>
<option value="completed" <?=$status==='completed'?'selected':''?>>Tamamladıklarım</option>
</select>

<button type="submit">Ödevleri Göster</button>
</form>
</section>
<?php endif;?>

<?php if(!$allHomeworks):?>
<div class="homework-empty"><span>🎉</span><strong>Aktif ödevin yok.</strong><p>Yeni ödev geldiğinde burada görünecek.</p></div>
<?php elseif(!$homeworks):?>
<div class="homework-empty"><span>🔎</span><strong>Bu filtrede ödev yok.</strong><p>Farklı kurum veya teslim durumu seçebilirsin.</p></div>
<?php else:?>
<div class="homework-list">
<?php foreach($homeworks as $item):
    $itemStatus=hw_status($item);
    $done=$itemStatus==='completed';
?>
<article class="homework-card <?=oh_status_class($itemStatus)?>">
<div class="homework-card-head">
<span class="homework-subject"><?=oh_h((string)($item['ders_emoji']??'📚'))?></span>
<div>
<small><?=oh_h((string)$item['ders_adi'])?> · <?=oh_h((string)$item['ogretmen_adi'])?></small>
<h2><?=oh_h((string)$item['baslik'])?></h2>
</div>
<span class="homework-status <?=oh_status_class($itemStatus)?>"><?=oh_h(hw_status_label($itemStatus))?></span>
</div>

<?php if(!empty($item['icerik_metni'])):?><p class="homework-text"><?=nl2br(oh_h((string)$item['icerik_metni']))?></p><?php endif;?>

<div class="homework-meta">
<span>🏫 <?=oh_h((string)$item['kurum_adi'])?></span>
<span>📌 <?=oh_h((string)($item['konu_adi']??'Genel'))?></span>
<span>⏰ <?=oh_h(oh_due_label($item['teslim_tarihi']??null))?></span>
<?php if($done && !empty($item['odev_tamamlanma_tarihi'])):?><span>✅ <?=oh_h(oh_due_label((string)$item['odev_tamamlanma_tarihi']))?></span><?php endif;?>
</div>

<?php if($itemStatus==='overdue'):?>
<div class="homework-warning">⚠️ Teslim tarihi geçti. Tamamladıysan aşağıdaki butonla durumunu güncelleyebilirsin.</div>
<?php endif;?>

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
