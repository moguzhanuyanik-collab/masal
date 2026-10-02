<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/ogretmen_icerik.php';
require __DIR__.'/src/ogretmen_odev_dashboard.php';

$user=require_role('ogretmen');
$pdo=db();

function oo_h(string $value): string {
    return htmlspecialchars($value,ENT_QUOTES,'UTF-8');
}
function oo_due(?string $value): string {
    $value=trim((string)$value);
    if($value==='') return 'Süre yok';
    try{return (new DateTimeImmutable($value))->format('d.m.Y H:i');}
    catch(Throwable){return 'Süre yok';}
}

function oo_group_label(array $group,bool $showInstitution=false): string {
    $type=(string)($group['tur']??'sinif')==='grup'?'Grup':'Sınıf';
    $grade=$group['sinif_seviyesi']!==null?(int)$group['sinif_seviyesi']:0;
    $label=$type.' · '.(string)($group['ad']??'').($grade>0?' · '.$grade.'. sınıf':'');
    if($showInstitution && !empty($group['kurum_adi'])) $label=(string)$group['kurum_adi'].' · '.$label;
    return $label;
}

try{
    $teacherId=thd_teacher_profile_id($pdo,(int)$user['id']);
    if($teacherId<=0){
        http_response_code(403);
        echo 'Öğretmen profili bulunamadı.';
        exit;
    }
    $institutions=thd_teacher_institutions($pdo,(int)$user['id']);
}catch(Throwable){
    http_response_code(503);
    echo 'Öğretmen bilgileri şu anda okunamıyor.';
    exit;
}

$institutionIds=array_map('intval',array_column($institutions,'id'));
$institutionId=max(0,(int)($_GET['kurum_id']??0));
if($institutionId>0 && !in_array($institutionId,$institutionIds,true)){
    http_response_code(403);
    echo 'Bu kurumun ödevlerini görüntüleme yetkin yok.';
    exit;
}

$groups=[];
try{
    $groups=oi_teacher_dashboard_target_groups($pdo,(int)$user['id'],$institutionId,'odev');
}catch(Throwable $e){
    error_log('[IlkAdim][teacher-homework-groups] '.$e->getMessage());
}
$groupIds=array_map('intval',array_column($groups,'id'));
$groupId=max(0,(int)($_GET['grup_id']??0));
if($groupId>0 && !in_array($groupId,$groupIds,true)){
    http_response_code(403);
    echo 'Bu sınıf / grup ödev performansı kapsamında değil.';
    exit;
}

$publication=(string)($_GET['yayin']??$_GET['durum']??'tum');
if(!in_array($publication,['tum','aktif','pasif'],true)) $publication='tum';

$delivery=(string)($_GET['teslim']??'tum');
if(!in_array($delivery,['tum','pending','overdue','completed','no_target'],true)) $delivery='tum';

try{
    $allHomeworks=thd_teacher_homeworks($pdo,(int)$user['id'],$institutionId,$publication,'tum',$groupId);
}catch(Throwable){
    http_response_code(503);
    echo 'Ödevler şu anda okunamıyor.';
    exit;
}
$summary=thd_dashboard_summary($allHomeworks);
$homeworks=thd_filter_homeworks($allHomeworks,$delivery);

function oo_state_class(string $state): string {
    return match($state){
        'completed'=>'ok',
        'overdue'=>'warn',
        'no_target'=>'muted',
        default=>'off',
    };
}
function oo_state_icon(string $state): string {
    return match($state){
        'completed'=>'✅',
        'overdue'=>'⏰',
        'no_target'=>'⚪',
        default=>'📝',
    };
}
?><!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Ödevlerim — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="ogretmen.css?v=1.0.42">
<link rel="stylesheet" href="ogretmen-odevleri.css?v=1.2.31">
</head>
<body class="role-page">
<div class="role-shell">
<header class="role-topbar">
<a class="role-icon" href="ogretmen-paneli.php" aria-label="Öğretmen paneline dön">←</a>
<span class="role-brand"><span>📝</span><span><strong>Ödevlerim</strong><small>ÖĞRETMEN ALANI</small></span></span>
</header>

<main class="role-content teacher-homework-dashboard">
<section class="role-hero">
<span class="eyeline">ÖDEV YÖNETİMİ</span>
<h1>Yayınladığın Ödevler</h1>
<p>Ödevleri yalnız yayın durumuna göre değil, öğrencilerin teslim performansına göre de takip et.</p>
<a class="role-primary" href="ogretmen-icerikleri.php">Yeni Ödev / İçerik →</a>
<span class="role-hero-art">📝</span>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">ÖZET</span><h2>Ödev Durumu</h2></div></div>
<div class="teacher-homework-dashboard-stats">
<div class="role-stat"><span>📝</span><strong><?=$summary['total']?></strong><small>Toplam ödev</small></div>
<div class="role-stat"><span>📢</span><strong><?=$summary['active']?></strong><small>Yayında</small></div>
<div class="role-stat"><span>✅</span><strong><?=$summary['completed']?></strong><small>Tümü tamamlandı</small></div>
<div class="role-stat"><span>⏰</span><strong><?=$summary['overdue']?></strong><small>Gecikme var</small></div>
<div class="role-stat"><span>⏳</span><strong><?=$summary['pending']?></strong><small>Devam ediyor</small></div>
<div class="role-stat"><span>⚪</span><strong><?=$summary['no_target']?></strong><small>Hedef yok</small></div>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">FİLTRELER</span><h2>Kurum, Sınıf/Grup, Yayın ve Teslim</h2></div></div>
<form method="get" class="role-form teacher-homework-dashboard-filter">
<label for="kurum">Kurum</label>
<select class="role-input" name="kurum_id" id="kurum">
<option value="0">Tüm kurumlarım</option>
<?php foreach($institutions as $institution):?>
<option value="<?=(int)$institution['id']?>" <?=((int)$institution['id']===$institutionId?'selected':'')?>><?=oo_h((string)$institution['ad'])?></option>
<?php endforeach;?>
</select>

<label for="grup">Sınıf / grup</label>
<select class="role-input" name="grup_id" id="grup">
<option value="0">Tüm sınıf / grup hedefleri</option>
<?php foreach($groups as $group):?>
<option value="<?=(int)$group['id']?>" <?=((int)$group['id']===$groupId?'selected':'')?>><?=oo_h(oo_group_label($group,$institutionId===0))?></option>
<?php endforeach;?>
</select>

<label for="yayin">Yayın durumu</label>
<select class="role-input" name="yayin" id="yayin">
<option value="tum" <?=$publication==='tum'?'selected':''?>>Tümü</option>
<option value="aktif" <?=$publication==='aktif'?'selected':''?>>Yayında</option>
<option value="pasif" <?=$publication==='pasif'?'selected':''?>>Pasif</option>
</select>

<label for="teslim">Teslim performansı</label>
<select class="role-input" name="teslim" id="teslim">
<option value="tum" <?=$delivery==='tum'?'selected':''?>>Tümü</option>
<option value="pending" <?=$delivery==='pending'?'selected':''?>>Devam ediyor</option>
<option value="overdue" <?=$delivery==='overdue'?'selected':''?>>Gecikme var</option>
<option value="completed" <?=$delivery==='completed'?'selected':''?>>Tümü tamamlandı</option>
<option value="no_target" <?=$delivery==='no_target'?'selected':''?>>Hedef öğrenci yok</option>
</select>
<button class="role-button" type="submit">Ödevleri Göster</button>
</form>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">ÖDEVLER</span><h2>Liste</h2></div><span class="role-pill"><?=count($homeworks)?></span></div>
<div class="teacher-homework-dashboard-list">
<?php if(!$homeworks):?><div class="role-empty">Bu filtrede ödev bulunamadı.</div><?php endif;?>

<?php foreach($homeworks as $homework):
    $state=(string)$homework['teslim_durumu'];
    $target=(int)$homework['hedef_sayisi'];
    $completed=(int)$homework['tamamlanan_sayisi'];
    $overdue=(int)$homework['geciken_sayisi'];
    $pending=(int)$homework['bekleyen_sayisi'];
?>
<a class="teacher-homework-dashboard-card <?=$state?>" href="ogretmen-odev-detay.php?id=<?=(int)$homework['id']?><?=$groupId>0?'&amp;grup_id='.$groupId:''?>">
<div class="teacher-homework-dashboard-head">
<span class="teacher-homework-dashboard-icon"><?=oo_state_icon($state)?></span>
<div>
<strong><?=oo_h((string)$homework['baslik'])?></strong>
<small><?=oo_h((string)$homework['kurum_adi'])?> · <?=oo_h((string)$homework['ders_adi'])?> · Teslim: <?=oo_h(oo_due($homework['teslim_tarihi']??null))?></small>
</div>
<span class="role-pill <?=oo_state_class($state)?>"><?=oo_h(thd_homework_progress_label($state))?></span>
</div>

<div class="teacher-homework-progress">
<span>🎯 <strong><?=$target?></strong> hedef</span>
<span>✅ <strong><?=$completed?></strong> tamamladı</span>
<span>⏰ <strong><?=$overdue?></strong> gecikti</span>
<span>⏳ <strong><?=$pending?></strong> bekliyor</span>
</div>

<div class="teacher-homework-dashboard-foot">
<span class="role-pill <?=((int)$homework['aktif']===1?'ok':'off')?>"><?=((int)$homework['aktif']===1?'Yayında':'Pasif')?></span>
<span>Detayı aç →</span>
</div>
</a>
<?php endforeach;?>
</div>
</section>

<div class="role-note"><span>ℹ️</span><p>“Gecikme var” en az bir hedef öğrencinin teslim tarihini geçirdiğini; “Tümü tamamlandı” ise aktif hedef öğrencilerin tamamının ödevi bitirdiğini gösterir. Ayrıntıda öğrencileri tek tek görebilirsin.</p></div>
</main>

<nav class="role-bottom">
<a href="ogretmen-paneli.php"><span>⌂</span>Panel</a>
<a href="ogretmen-ogrencilerim.php"><span>🎒</span>Öğrenciler</a>
<a class="active" href="ogretmen-odevleri.php"><span>📝</span>Ödevler</a>
<a href="ogretmen-icerikleri.php"><span>⭐</span>İçeriklerim</a>
</nav>
</div>
</body>
</html>
