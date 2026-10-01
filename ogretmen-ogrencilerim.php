<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/ogretmen_ogrenci_listesi.php';

$user=require_role('ogretmen');
$pdo=db();

function to_h(string $value): string {
    return htmlspecialchars($value,ENT_QUOTES,'UTF-8');
}
function to_group_label(array $group): string {
    $type=(string)($group['tur']??'sinif')==='grup'?'Grup':'Sınıf';
    $grade=$group['sinif_seviyesi']!==null?(int)$group['sinif_seviyesi']:0;
    return $type.' · '.(string)($group['ad']??'').($grade>0?' · '.$grade.'. sınıf':'');
}

try{
    $institutions=tol_teacher_institutions($pdo,(int)$user['id']);
}catch(Throwable){
    http_response_code(503);
    echo 'Kurumlar şu anda okunamıyor.';
    exit;
}

$institutionIds=array_map('intval',array_column($institutions,'id'));
$institutionId=max(0,(int)($_GET['kurum_id']??($institutionIds[0]??0)));
if($institutionId>0 && !in_array($institutionId,$institutionIds,true)){
    http_response_code(403);
    echo 'Bu kurumdaki öğrencileri görüntüleme yetkin yok.';
    exit;
}

$grade=(int)($_GET['sinif']??0);
if($grade<1 || $grade>8) $grade=0;

$groups=[];
if($institutionId>0){
    try{
        $groups=tol_teacher_groups($pdo,(int)$user['id'],$institutionId);
    }catch(Throwable){
        http_response_code(503);
        echo 'Sınıf / grup bilgileri şu anda okunamıyor.';
        exit;
    }
}
$groupIds=array_map('intval',array_column($groups,'id'));
$groupId=max(0,(int)($_GET['grup_id']??0));
if($groupId>0 && !in_array($groupId,$groupIds,true)){
    http_response_code(403);
    echo 'Bu sınıf / grup sana bağlı aktif öğrenciler kapsamında değil.';
    exit;
}

$students=[];
$studentGroups=[];
if($institutionId>0){
    try{
        $students=tol_teacher_students($pdo,(int)$user['id'],$institutionId,$grade,$groupId);
        $studentGroups=tol_student_group_map($pdo,$institutionId,array_map('intval',array_column($students,'id')));
    }catch(RuntimeException $e){
        http_response_code(400);
        echo to_h($e->getMessage());
        exit;
    }catch(Throwable){
        http_response_code(503);
        echo 'Öğrenciler şu anda okunamıyor.';
        exit;
    }
}
?><!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Öğrencilerim — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="ogretmen.css?v=1.0.42">
<link rel="stylesheet" href="ogretmen-ogrencilerim.css?v=1.2.18">
</head>
<body class="role-page">
<div class="role-shell">
<header class="role-topbar">
<a class="role-icon" href="ogretmen-paneli.php" aria-label="Öğretmen paneline dön">←</a>
<span class="role-brand"><span>🎒</span><span><strong>Öğrencilerim</strong><small>ÖĞRETMEN ALANI</small></span></span>
</header>

<main class="role-content">
<section class="role-hero">
<span class="eyeline">ÖĞRENCİ TAKİBİ</span>
<h1>Bağlı Öğrenciler</h1>
<p>Kurum, sınıf seviyesi ve kurum sınıfı/grubuna göre filtrele; öğrencinin ilerleme raporunu aç.</p>
<span class="role-hero-art">🎒</span>
</section>

<?php if($institutions):?>
<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">FİLTRELER</span><h2>Kurum, Sınıf ve Grup</h2></div></div>
<form class="role-form teacher-student-filter" method="get">
<label for="kurum">Kurum</label>
<select class="role-input" id="kurum" name="kurum_id">
<?php foreach($institutions as $institution):?>
<option value="<?=(int)$institution['id']?>" <?=((int)$institution['id']===$institutionId?'selected':'')?>><?=to_h((string)$institution['ad'])?></option>
<?php endforeach;?>
</select>

<label for="sinif">Sınıf seviyesi</label>
<select class="role-input" id="sinif" name="sinif">
<option value="0">Tüm sınıflar</option>
<?php for($g=1;$g<=8;$g++):?><option value="<?=$g?>" <?=$grade===$g?'selected':''?>><?=$g?>. sınıf</option><?php endfor;?>
</select>

<label for="grup">Kurum sınıfı / grubu</label>
<select class="role-input" id="grup" name="grup_id">
<option value="0">Tüm sınıf ve gruplar</option>
<?php foreach($groups as $group):?>
<option value="<?=(int)$group['id']?>" <?=((int)$group['id']===$groupId?'selected':'')?>><?=to_h(to_group_label($group))?></option>
<?php endforeach;?>
</select>

<button class="role-button" type="submit">Öğrencileri Göster</button>
</form>
</section>
<?php endif;?>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">ÖĞRENCİLERİM</span><h2>Sonuçlar</h2></div><span class="role-pill"><?=count($students)?></span></div>
<div class="role-list teacher-student-list">
<?php if(!$institutions):?><div class="role-empty">Henüz aktif bir kuruma öğretmen olarak bağlanmadın.</div>
<?php elseif(!$students):?><div class="role-empty">Bu filtrede sana bağlı öğrenci bulunamadı.</div><?php endif;?>

<?php foreach($students as $student):
    $sid=(int)$student['id'];
    $memberships=$studentGroups[$sid]??[];
?>
<a class="role-row teacher-student-row" href="ogrenci-raporu.php?id=<?=$sid?>&amp;kurum_id=<?=$institutionId?>">
<span>🎒</span>
<div>
<strong><?=to_h((string)($student['ad']?:$student['email']))?></strong>
<small><?=(int)$student['sinif_seviyesi']?>. sınıf · Raporu aç →</small>
<?php if($memberships):?>
<div class="teacher-student-groups">
<?php foreach($memberships as $membership):?><span>🏷️ <?=to_h(to_group_label($membership))?></span><?php endforeach;?>
</div>
<?php endif;?>
</div>
<b>→</b>
</a>
<?php endforeach;?>
</div>
</section>

<div class="role-note"><span>ℹ️</span><p>Sınıf / grup filtresinde yalnız bu kurumda sana bağlı aktif öğrencilerin bulunduğu gruplar gösterilir. Öğrenci raporuna girdiğinde kurum bağlamı doğrulanarak geri dönüş Öğrencilerim ekranına yapılır.</p></div>
</main>

<nav class="role-bottom">
<a href="ogretmen-paneli.php"><span>⌂</span>Panel</a>
<a class="active" href="ogretmen-ogrencilerim.php?kurum_id=<?=$institutionId?>"><span>🎒</span>Öğrenciler</a>
<a href="ogretmen-icerikleri.php"><span>⭐</span>İçeriklerim</a>
<a href="logout.php"><span>🚪</span>Çıkış</a>
</nav>
</div>
</body>
</html>
