<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/kurum_yonetimi.php';
require __DIR__.'/src/yonetici_yetkileri.php';
require __DIR__.'/src/kurum_raporlari.php';

$user=require_role(['yonetici','super_admin']);
$pdo=db();
$institutionId=(int)($_GET['kurum_id']??0);

try{
    $institution=ky_assert_manageable($pdo,$user,$institutionId);
    if(!yy_can($pdo,$user,'kurum_goruntule')) throw new RuntimeException('Yetki yok.');
}catch(Throwable){
    http_response_code(403);
    echo 'Bu kurumun raporlarına erişim yetkin yok.';
    exit;
}

$grade=(int)($_GET['sinif']??0);
if($grade<1 || $grade>8) $grade=0;
$groupId=max(0,(int)($_GET['grup_id']??0));
$start=trim((string)($_GET['baslangic']??''));
$end=trim((string)($_GET['bitis']??''));

try{
    $start=kr_validate_date($start);
    $end=kr_validate_date($end);
    if($start!=='' && $end!=='' && $start>$end) throw new RuntimeException('Başlangıç tarihi bitişten sonra olamaz.');

    $groups=kr_active_groups($pdo,$institutionId);
    $selectedGroup=kr_resolve_group($pdo,$institutionId,$groupId);
    $rows=kr_report_rows($pdo,$institutionId,$grade,$groupId,$start,$end);
    $totals=kr_totals($rows);
}catch(RuntimeException $e){
    http_response_code(400);
    echo ky_h($e->getMessage());
    exit;
}catch(Throwable $e){
    error_log('[IlkAdim][institution-report] '.$e->getMessage());
    http_response_code(503);
    echo 'Kurum raporu şu anda okunamıyor.';
    exit;
}

$answerRate=$totals['answers']>0?(int)round($totals['correct']*100/$totals['answers']):null;
$homeworkRate=$totals['homework_assigned']>0?(int)round($totals['homework_completed']*100/$totals['homework_assigned']):null;
$isSuper=auth_user_has_role($user,'super_admin');
$back=$isSuper?'kurum-detay.php?kurum_id='.$institutionId:'yonetici-paneli.php?kurum_id='.$institutionId;

function krh(string $value): string {
    return htmlspecialchars($value,ENT_QUOTES,'UTF-8');
}
function kr_group_label(array $group): string {
    $type=(string)($group['tur']??'sinif')==='grup'?'Grup':'Sınıf';
    $grade=$group['sinif_seviyesi']!==null?(int)$group['sinif_seviyesi']:0;
    return $type.' · '.(string)($group['ad']??'').($grade>0?' · '.$grade.'. sınıf':'');
}
?><!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Kurum Raporları — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="kurum.css?v=1.2.12">
<link rel="stylesheet" href="kurum-raporlari.css?v=1.2.12">
</head>
<body class="role-page"><div class="role-shell">
<header class="role-topbar">
<a class="role-icon" href="<?=krh($back)?>" aria-label="Geri dön">←</a>
<span class="role-brand"><span>📊</span><span><strong>Kurum Raporları</strong><small><?=krh((string)$institution['ad'])?></small></span></span>
<a class="role-icon" href="hesap-guvenligi.php" aria-label="Hesap">⚙️</a>
</header>

<main class="role-content institution-report-shell">
<section class="role-hero">
<span class="eyeline">KURUM PERFORMANSI</span>
<h1><?=krh((string)$institution['ad'])?></h1>
<p>Sistem soruları, öğretmen soruları ve ödev durumunu sınıf, kurum grubu ve tarih aralığıyla birlikte incele.</p>
<span class="role-hero-art">📊</span>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">FİLTRELER</span><h2>Sınıf, Grup ve Tarih</h2></div></div>
<form class="role-form institution-report-filter" method="get">
<input type="hidden" name="kurum_id" value="<?=$institutionId?>">

<label for="sinif">Sınıf seviyesi</label>
<select class="role-input" id="sinif" name="sinif">
<option value="0">Tüm sınıf seviyeleri</option>
<?php for($g=1;$g<=8;$g++):?><option value="<?=$g?>" <?=$grade===$g?'selected':''?>><?=$g?>. sınıf</option><?php endfor;?>
</select>

<label for="grup">Kurum sınıfı / grubu</label>
<select class="role-input" id="grup" name="grup_id">
<option value="0">Tüm sınıf ve gruplar</option>
<?php foreach($groups as $group):?>
<option value="<?=(int)$group['id']?>" <?=((int)$group['id']===$groupId?'selected':'')?>><?=krh(kr_group_label($group))?></option>
<?php endforeach;?>
</select>

<label for="baslangic">Başlangıç</label>
<input class="role-input" type="date" id="baslangic" name="baslangic" value="<?=krh($start)?>">

<label for="bitis">Bitiş</label>
<input class="role-input" type="date" id="bitis" name="bitis" value="<?=krh($end)?>">

<div class="institution-report-filter-actions">
<button class="role-button" type="submit">Raporu Göster</button>
<a class="institution-report-reset" href="kurum-raporlari.php?kurum_id=<?=$institutionId?>">Filtreleri temizle</a>
</div>
</form>
<?php if(is_array($selectedGroup)):?>
<div class="institution-report-scope"><span>🏷️</span><p><strong>Seçili grup:</strong> <?=krh(kr_group_label($selectedGroup))?></p></div>
<?php endif;?>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">ÖZET</span><h2>Performans Göstergeleri</h2></div></div>
<div class="institution-report-stats">
<div class="role-stat"><span>🎒</span><strong><?=$totals['students']?></strong><small>Aktif öğrenci</small></div>
<div class="role-stat"><span>🧠</span><strong><?=$totals['system_answers']?></strong><small>Sistem sorusu yanıtı</small></div>
<div class="role-stat"><span>👩‍🏫</span><strong><?=$totals['teacher_answers']?></strong><small>Öğretmen sorusu yanıtı</small></div>
<div class="role-stat"><span>📈</span><strong><?=$answerRate!==null?$answerRate.'%':'—'?></strong><small>Toplam doğruluk</small></div>
<div class="role-stat"><span>📝</span><strong><?=$totals['homework_completed']?> / <?=$totals['homework_assigned']?></strong><small>Tamamlanan ödev</small></div>
<div class="role-stat"><span>⏰</span><strong><?=$totals['homework_overdue']?></strong><small>Süresi geçmiş bekleyen</small></div>
<div class="role-stat"><span>✅</span><strong><?=$homeworkRate!==null?$homeworkRate.'%':'—'?></strong><small>Ödev tamamlama</small></div>
</div>
</section>

<section class="role-section">
<div class="role-section-head">
<div><span class="eyeline">ÖĞRENCİ BAZINDA</span><h2>Performans Özeti</h2></div>
<span class="role-pill"><?=count($rows)?></span>
</div>
<div class="institution-report-list">
<?php if(!$rows):?><div class="role-empty"><span>📊</span>Bu filtrede aktif öğrenci bulunamadı.</div><?php endif;?>
<?php foreach($rows as $row):
    $systemAnswers=(int)$row['sistem_yanit'];
    $systemCorrect=(int)$row['sistem_dogru'];
    $teacherAnswers=(int)$row['ogretmen_yanit'];
    $teacherCorrect=(int)$row['ogretmen_dogru'];
    $answers=$systemAnswers+$teacherAnswers;
    $correct=$systemCorrect+$teacherCorrect;
    $accuracy=$answers>0?(int)round($correct*100/$answers):null;
    $assigned=(int)$row['odev_atanan'];
    $completed=(int)$row['odev_tamamlanan'];
    $overdue=(int)$row['odev_geciken'];
    $homeworkPercent=$assigned>0?(int)round($completed*100/$assigned):null;
?>
<a class="institution-report-student" href="ogrenci-raporu.php?id=<?=(int)$row['id']?>&amp;kurum_id=<?=$institutionId?>">
<div class="institution-report-student-head">
<span class="institution-report-avatar">🎒</span>
<div>
<strong><?=krh((string)($row['ad']?:$row['email']))?></strong>
<small><?=(int)$row['sinif_seviyesi']?>. sınıf</small>
</div>
<span class="institution-report-arrow">→</span>
</div>
<div class="institution-report-metrics">
<span>🧠 <?=$systemAnswers?> sistem / <?=$systemCorrect?> doğru</span>
<span>👩‍🏫 <?=$teacherAnswers?> öğretmen / <?=$teacherCorrect?> doğru</span>
<span>📈 <?=$accuracy!==null?$accuracy.'%':'—'?> doğruluk</span>
<span>📝 <?=$completed?> / <?=$assigned?> ödev</span>
<span>✅ <?=$homeworkPercent!==null?$homeworkPercent.'%':'—'?> tamamlama</span>
<?php if($overdue>0):?><span class="warn">⏰ <?=$overdue?> geciken</span><?php endif;?>
</div>
</a>
<?php endforeach;?>
</div>
</section>

<div class="role-note">
<span>ℹ️</span>
<p>Tarih filtresi soru performansında cevap tarihini, ödevlerde yayın tarihini sınırlar. “Süresi geçmiş bekleyen” değeri rapor görüntülendiği andaki mevcut ödev durumunu gösterir.</p>
</div>
</main>

<nav class="role-bottom">
<a href="kurum-detay.php?kurum_id=<?=$institutionId?>"><span>🏫</span>Kurum</a>
<a href="kurum-icerikleri.php?kurum_id=<?=$institutionId?>"><span>📚</span>İçerikler</a>
<a href="kurum-siniflari.php?kurum_id=<?=$institutionId?>"><span>🏷️</span>Sınıflar</a>
<a class="active" href="kurum-raporlari.php?kurum_id=<?=$institutionId?>"><span>📊</span>Raporlar</a>
</nav>
</div></body></html>
