<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/ogretmen_icerik.php';
require __DIR__.'/src/ogretmen_soru_dashboard.php';

$user=require_role('ogretmen');
$pdo=db();

function osd_h(string $value): string {
    return htmlspecialchars($value,ENT_QUOTES,'UTF-8');
}
function osd_state_class(string $state): string {
    return match($state){
        'all_correct'=>'ok',
        'wrong'=>'warn',
        'no_target'=>'muted',
        default=>'off',
    };
}
function osd_state_icon(string $state): string {
    return match($state){
        'all_correct'=>'✅',
        'wrong'=>'⚠️',
        'no_target'=>'⚪',
        default=>'⏳',
    };
}

function osd_group_label(array $group,bool $showInstitution=false): string {
    $type=(string)($group['tur']??'sinif')==='grup'?'Grup':'Sınıf';
    $grade=$group['sinif_seviyesi']!==null?(int)$group['sinif_seviyesi']:0;
    $label=$type.' · '.(string)($group['ad']??'').($grade>0?' · '.$grade.'. sınıf':'');
    if($showInstitution && !empty($group['kurum_adi'])) $label=(string)$group['kurum_adi'].' · '.$label;
    return $label;
}

try{
    $teacher=oi_teacher_profile($pdo,(int)$user['id']);
    if(!$teacher){
        http_response_code(403);
        echo 'Öğretmen profili bulunamadı.';
        exit;
    }
    $institutions=oi_teacher_institutions($pdo,(int)$user['id']);
}catch(Throwable){
    http_response_code(503);
    echo 'Öğretmen bilgileri şu anda okunamıyor.';
    exit;
}

$institutionIds=array_map('intval',array_column($institutions,'id'));
$institutionId=max(0,(int)($_GET['kurum_id']??0));
if($institutionId>0 && !in_array($institutionId,$institutionIds,true)){
    http_response_code(403);
    echo 'Bu kurumun soru performansını görüntüleme yetkin yok.';
    exit;
}

$groups=oi_teacher_dashboard_target_groups($pdo,(int)$user['id'],$institutionId,'soru');
$groupIds=array_map('intval',array_column($groups,'id'));
$groupId=max(0,(int)($_GET['grup_id']??0));
if($groupId>0 && !in_array($groupId,$groupIds,true)){
    http_response_code(403);
    echo 'Bu sınıf / grup soru performansı kapsamında değil.';
    exit;
}

$publication=(string)($_GET['yayin']??'tum');
if(!in_array($publication,['tum','aktif','pasif'],true)) $publication='tum';

$performance=(string)($_GET['performans']??'tum');
if(!in_array($performance,['tum','waiting','wrong','all_correct','no_target'],true)) $performance='tum';

try{
    $allQuestions=tsd_teacher_questions($pdo,(int)$user['id'],$institutionId,$publication,$groupId);
}catch(Throwable $e){
    error_log('[IlkAdim][teacher-question-dashboard] '.$e->getMessage());
    http_response_code(503);
    echo 'Soru performansı şu anda okunamıyor.';
    exit;
}

$summary=tsd_dashboard_summary($allQuestions);
$questions=tsd_filter_questions($allQuestions,$performance);
?><!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Soru Performansı — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="ogretmen.css?v=1.0.42">
<link rel="stylesheet" href="ogretmen-sorulari.css?v=1.2.31">
</head>
<body class="role-page">
<div class="role-shell">
<header class="role-topbar">
<a class="role-icon" href="ogretmen-paneli.php" aria-label="Öğretmen paneline dön">←</a>
<span class="role-brand"><span>❓</span><span><strong>Soru Performansı</strong><small>ÖĞRETMEN ALANI</small></span></span>
</header>

<main class="role-content teacher-question-dashboard">
<section class="role-hero">
<span class="eyeline">SORU TAKİBİ</span>
<h1>Yayınladığın Soruların Performansı</h1>
<p>Hangi soruda cevap beklediğini, yanlışların yoğunlaştığı yerleri ve başarı oranlarını tek ekranda gör.</p>
<a class="role-primary" href="ogretmen-icerikleri.php">Yeni Soru / İçerik →</a>
<span class="role-hero-art">❓</span>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">ÖZET</span><h2>Soru Durumu</h2></div></div>
<div class="teacher-question-dashboard-stats">
<div class="role-stat"><span>❓</span><strong><?=$summary['total']?></strong><small>Toplam soru</small></div>
<div class="role-stat"><span>📢</span><strong><?=$summary['active']?></strong><small>Yayında</small></div>
<div class="role-stat"><span>🎯</span><strong><?=$summary['targets']?></strong><small>Hedef öğrenci</small></div>
<div class="role-stat"><span>💬</span><strong><?=$summary['answered']?></strong><small>Cevaplandı</small></div>
<div class="role-stat"><span>✅</span><strong><?=$summary['correct']?></strong><small>Doğru</small></div>
<div class="role-stat"><span>❌</span><strong><?=$summary['wrong']?></strong><small>Yanlış</small></div>
<div class="role-stat"><span>⏳</span><strong><?=$summary['waiting']?></strong><small>Bekliyor</small></div>
<div class="role-stat"><span>📈</span><strong>%<?=$summary['accuracy']?></strong><small>Doğruluk</small></div>
<div class="role-stat"><span>📨</span><strong>%<?=$summary['answer_rate']?></strong><small>Cevaplanma</small></div>
<div class="role-stat"><span>⭐</span><strong><?=$summary['reward_stars']?></strong><small>Dağıtılan yıldız</small></div>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">FİLTRELER</span><h2>Kurum, Sınıf/Grup, Yayın ve Performans</h2></div></div>
<form method="get" class="role-form teacher-question-dashboard-filter">
<label for="kurum">Kurum</label>
<select class="role-input" name="kurum_id" id="kurum">
<option value="0">Tüm kurumlarım</option>
<?php foreach($institutions as $institution):?>
<option value="<?=(int)$institution['id']?>" <?=((int)$institution['id']===$institutionId?'selected':'')?>><?=osd_h((string)$institution['ad'])?></option>
<?php endforeach;?>
</select>

<label for="grup">Sınıf / grup</label>
<select class="role-input" name="grup_id" id="grup">
<option value="0">Tüm sınıf / grup hedefleri</option>
<?php foreach($groups as $group):?>
<option value="<?=(int)$group['id']?>" <?=((int)$group['id']===$groupId?'selected':'')?>><?=osd_h(osd_group_label($group,$institutionId===0))?></option>
<?php endforeach;?>
</select>

<label for="yayin">Yayın durumu</label>
<select class="role-input" name="yayin" id="yayin">
<option value="tum" <?=$publication==='tum'?'selected':''?>>Tümü</option>
<option value="aktif" <?=$publication==='aktif'?'selected':''?>>Yayında</option>
<option value="pasif" <?=$publication==='pasif'?'selected':''?>>Pasif</option>
</select>

<label for="performans">Soru durumu</label>
<select class="role-input" name="performans" id="performans">
<option value="tum" <?=$performance==='tum'?'selected':''?>>Tümü</option>
<option value="waiting" <?=$performance==='waiting'?'selected':''?>>Cevap bekliyor</option>
<option value="wrong" <?=$performance==='wrong'?'selected':''?>>Yanlış cevap var</option>
<option value="all_correct" <?=$performance==='all_correct'?'selected':''?>>Tümü doğru</option>
<option value="no_target" <?=$performance==='no_target'?'selected':''?>>Hedef öğrenci yok</option>
</select>
<button class="role-button" type="submit">Soruları Göster</button>
</form>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">SORULAR</span><h2>Performans Listesi</h2></div><span class="role-pill"><?=count($questions)?></span></div>
<div class="teacher-question-dashboard-list">
<?php if(!$questions):?><div class="role-empty">Bu filtrede soru bulunamadı.</div><?php endif;?>

<?php foreach($questions as $question):
    $state=(string)$question['performans_durumu'];
?>
<a class="teacher-question-dashboard-card <?=$state?>" href="ogretmen-icerik-detay.php?id=<?=(int)$question['id']?><?=$groupId>0?'&amp;grup_id='.$groupId:''?>">
<div class="teacher-question-dashboard-head">
<span class="teacher-question-dashboard-icon"><?=osd_state_icon($state)?></span>
<div>
<strong><?=osd_h((string)$question['baslik'])?></strong>
<small><?=osd_h((string)$question['kurum_adi'])?> · <?=osd_h((string)$question['ders_adi'])?> / <?=osd_h((string)$question['konu_adi'])?></small>
</div>
<span class="role-pill <?=osd_state_class($state)?>"><?=osd_h(tsd_state_label($state))?></span>
</div>

<div class="teacher-question-dashboard-progress">
<span>🎯 <strong><?=(int)$question['hedef_sayisi']?></strong> hedef</span>
<span>💬 <strong><?=(int)$question['cevaplayan_sayisi']?></strong> cevapladı</span>
<span>✅ <strong><?=(int)$question['dogru_sayisi']?></strong> doğru</span>
<span>❌ <strong><?=(int)$question['yanlis_sayisi']?></strong> yanlış</span>
<span>⏳ <strong><?=(int)$question['bekleyen_sayisi']?></strong> bekliyor</span>
</div>

<div class="teacher-question-dashboard-rates">
<span>📨 Cevaplanma: <strong>%<?=(int)$question['cevaplanma_orani']?></strong></span>
<span>📈 Doğruluk: <strong>%<?=(int)$question['dogruluk_orani']?></strong></span>
<?php if((int)$question['yildiz_degeri']>0):?><span>⭐ Ödül: <strong><?=(int)$question['yildiz_degeri']?></strong> / dağıtılan <strong><?=(int)$question['dagitilan_yildiz']?></strong></span><?php endif;?>
</div>

<div class="teacher-question-dashboard-foot">
<span class="role-pill <?=((int)$question['aktif']===1?'ok':'off')?>"><?=((int)$question['aktif']===1?'Yayında':'Pasif')?></span>
<span>Öğrencileri tek tek gör →</span>
</div>
</a>
<?php endforeach;?>
</div>
</section>

<div class="role-note"><span>ℹ️</span><p>“Yanlış cevap var” en az bir hedef öğrencinin son çözümünün yanlış olduğunu; “Tümü doğru” ise geçerli hedef öğrencilerin tamamının soruyu doğru tamamladığını gösterir. Doğru tamamlanan öğrenci sonucu 1.2.25'ten itibaren geriye dönmez.</p></div>
</main>

<nav class="role-bottom">
<a href="ogretmen-paneli.php"><span>⌂</span>Panel</a>
<a href="ogretmen-ogrencilerim.php"><span>🎒</span>Öğrenciler</a>
<a class="active" href="ogretmen-sorulari.php"><span>❓</span>Sorular</a>
<a href="ogretmen-icerikleri.php"><span>⭐</span>İçeriklerim</a>
</nav>
</div>
</body>
</html>
