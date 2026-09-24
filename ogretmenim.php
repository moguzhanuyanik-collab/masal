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
        if((string)($_POST['action']??'')==='answer'){
            $contentId=(int)($_POST['icerik_id']??0);
            $selected=(int)($_POST['secenek']??-1);
            $correct=oi_answer_question($pdo,$studentId,$contentId,$selected);
            $flash=$correct?'Harika! Doğru cevap. ⭐':'Tekrar deneyebilirsin. Öğretmenin açıklamasına göz at.';
            $flashType=$correct?'ok':'bad';
        }
    }catch(Throwable $e){
        $flash=$e->getMessage();
        $flashType='bad';
    }
}

$teachers=oi_student_teachers($pdo,$studentId);
$contents=oi_student_contents($pdo,$studentId);
$types=oi_content_types();

$byTeacher=[];
foreach($contents as $item){
    $key=(int)$item['ogretmen_id'].'-'.(int)$item['kurum_id'];
    $lessonKey=(int)$item['ders_id'];
    $topic=(string)($item['konu_adi']??'Genel');

    if(!isset($byTeacher[$key])) $byTeacher[$key]=[];
    if(!isset($byTeacher[$key][$lessonKey])){
        $byTeacher[$key][$lessonKey]=[
            'name'=>(string)$item['ders_adi'],
            'emoji'=>(string)$item['ders_emoji'],
            'topics'=>[]
        ];
    }
    if(!isset($byTeacher[$key][$lessonKey]['topics'][$topic])) $byTeacher[$key][$lessonKey]['topics'][$topic]=[];
    $byTeacher[$key][$lessonKey]['topics'][$topic][]=$item;
}

function ois_icon(string $type): string {
    return match($type){
        'soru'=>'❓',
        'tekrar'=>'🔁',
        'odev'=>'📝',
        'not'=>'💡',
        default=>'📌'
    };
}
?><!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,viewport-fit=cover">
<meta name="theme-color" content="#f8f7fc">
<title>Öğretmenim — İlkAdım</title>
<link rel="icon" href="ilkadim-logo.svg" type="image/svg+xml">
<link rel="apple-touch-icon" href="ilkadim-logo-192.png">
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="ogretmenim.css?v=1.0.48">
<link rel="stylesheet" href="adimbot-student.css?v=1.0.85">
<script src="adimbot-student.js?v=1.0.86" defer></script>
<script src="global-audio-feedback.js?v=1.0.86" defer></script>
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
<span class="topbar-title">Öğretmenim</span>
<a class="mini-avatar" href="index.php#/profil" aria-label="Profil">🌞</a>
</header>

<main id="screen" class="teacher-page">
<section class="teacher-hero">
<small>⭐ ÖĞRETMENİMDEN</small>
<h1>Öğretmenim</h1>
<p>Öğretmenin senin için hazırladığı soru, tekrar, ödev ve özel çalışmaları burada bulabilirsin.</p>
<span class="teacher-star">⭐</span>
</section>

<?php if($flash!==''):?>
<div class="teacher-flash"><?=oi_h($flash)?></div>
<?php endif;?>

<?php if(!$teachers):?>
<div class="teacher-empty"><span>👩‍🏫</span><strong>Henüz öğretmenin bağlanmadı.</strong><br>Öğretmen eşleştirildiğinde özel içerikleri burada göreceksin.</div>
<?php else:?>
<div class="teacher-groups">
<?php foreach($teachers as $index=>$teacher):
    $key=(int)$teacher['id'].'-'.(int)$teacher['kurum_id'];
    $teacherLessons=$byTeacher[$key]??[];
?>
<details class="teacher-group" <?=$index===0?'open':''?>>
<summary class="teacher-group-head">
<span class="teacher-avatar">👩‍🏫</span>
<div>
<strong><?=oi_h((string)$teacher['ad_soyad'])?></strong>
<small><?=oi_h((string)$teacher['kurum_adi'])?> · <?=count($teacherLessons)?> ders</small>
</div>
<b>⌄</b>
</summary>
<div class="teacher-group-body">

<?php if(!$teacherLessons):?>
<div class="teacher-empty"><span>⭐</span>Öğretmenin henüz sana özel içerik yayınlamadı.</div>
<?php else:foreach($teacherLessons as $lesson):?>
<details class="teacher-lesson" open>
<summary><span><?=oi_h((string)$lesson['emoji'])?></span><span><?=oi_h((string)$lesson['name'])?></span></summary>

<?php foreach($lesson['topics'] as $topicName=>$items):?>
<details class="teacher-topic" open>
<summary>📌 <?=oi_h((string)$topicName)?> · <?=count($items)?> içerik</summary>
<div class="teacher-topic-body">

<?php foreach($items as $item):
    $type=(string)$item['icerik_turu'];
    $options=json_decode((string)($item['secenekler_json']??''),true);
    if(!is_array($options)) $options=[];
    $hasAnswer=$item['secilen_cevap_indeksi']!==null;
    $answerCorrect=(int)($item['cevap_dogru']??0)===1;
?>
<article class="teacher-content-card">
<div class="teacher-content-badges">
<span class="teacher-from">⭐ <?=oi_h((string)$item['ogretmen_adi'])?>'den</span>
<span class="teacher-type"><?=ois_icon($type)?> <?=oi_h($types[$type]??'İçerik')?></span>
</div>
<h3><?=oi_h((string)$item['baslik'])?></h3>
<?php if(!empty($item['icerik_metni'])):?><p><?=nl2br(oi_h((string)$item['icerik_metni']))?></p><?php endif;?>

<?php if($type==='soru' && !empty($item['soru'])):?>
<div class="teacher-question">
<strong><?=oi_h((string)$item['soru'])?></strong>
<form method="post">
<input type="hidden" name="csrf" value="<?=oi_h(csrf_token())?>">
<input type="hidden" name="action" value="answer">
<input type="hidden" name="icerik_id" value="<?=(int)$item['id']?>">
<?php foreach($options as $optionIndex=>$option):?>
<label class="teacher-option">
<input type="radio" name="secenek" value="<?=(int)$optionIndex?>" <?=$hasAnswer && (int)$item['secilen_cevap_indeksi']===(int)$optionIndex?'checked':''?> required>
<span><?=oi_h((string)$option)?></span>
</label>
<?php endforeach;?>
<button class="teacher-answer-button" type="submit">Cevabımı Kontrol Et</button>
</form>

<?php if($hasAnswer):?>
<div class="teacher-answer-status <?=$answerCorrect?'ok':'bad'?>"><?=$answerCorrect?'✓ Doğru cevap verdin.':'↻ Son cevabın doğru değildi, yeniden deneyebilirsin.'?></div>
<?php if(!empty($item['aciklama'])):?><div class="teacher-explanation"><?=nl2br(oi_h((string)$item['aciklama']))?></div><?php endif;?>
<?php endif;?>
</div>
<?php elseif(!empty($item['aciklama'])):?>
<div class="teacher-explanation"><?=nl2br(oi_h((string)$item['aciklama']))?></div>
<?php endif;?>
</article>
<?php endforeach;?>

</div>
</details>
<?php endforeach;?>
</details>
<?php endforeach;endif;?>

</div>
</details>
<?php endforeach;?>
</div>
<?php endif;?>
</main>

<nav class="app-nav app-nav-five" aria-label="Uygulama menüsü">
<a href="index.php#/anasayfa"><span><svg><use href="#home"/></svg></span>Anasayfa</a>
<a href="index.php#/dersler"><span><svg><use href="#book"/></svg></span>Dersler</a>
<a class="active" href="ogretmenim.php"><span>⭐</span>Öğretmenim</a>
<a href="index.php#/etkinlikler"><span><svg><use href="#star"/></svg></span>Etkinlikler</a>
<a href="index.php#/profil"><span><svg><use href="#user"/></svg></span>Profil</a>
</nav>
</div>
<div class="adb-student-widget" data-adimbot-student aria-label="AdımBot öğrenci yardımcısı">
  <div class="adb-bubble" data-adimbot-bubble aria-live="polite">Merhaba! Ben AdımBot 👋</div>
  <div class="adb-stage" data-adimbot-stage role="button" tabindex="0" aria-label="AdımBot'u sürükle veya konuştur">
    <button class="adb-close" type="button" data-adimbot-close aria-label="AdımBot'u kapat">×</button>
    <span class="adb-pulse" aria-hidden="true"></span>
    <div class="adb-visual" aria-hidden="true">
      <div class="adb-robot-canvas">
        <span class="adb-sprite adb-arm-leftview"></span>
        <span class="adb-sprite adb-arm-rightview"></span>
        <span class="adb-sprite adb-body"></span>
        <span class="adb-lid adb-lid-left"></span>
        <span class="adb-lid adb-lid-right"></span>
        <span class="adb-sprite adb-mouth-open"></span>
      </div>
      <span class="adb-drag-chip">Sürükle</span>
    </div>
  </div>
</div>

</body>
</html>
