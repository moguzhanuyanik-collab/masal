<?php
declare(strict_types=1);

require __DIR__ . '/src/bootstrap.php';
require __DIR__ . '/src/auth.php';
require __DIR__ . '/src/normalized.php';
require __DIR__ . '/src/ogretmen_icerik.php';
require __DIR__ . '/src/ogrenci_rapor_detay.php';
require __DIR__ . '/src/ogretmen_ogrenci_listesi.php';
require __DIR__ . '/src/veli_icerikleri.php';

$user=require_login();
$pdo=db();
$roleHome=auth_role_home($user);
$studentId=(int)($_GET['id']??0);

if($studentId<=0 || !can_access_student((int)$user['id'],$studentId)){
    http_response_code(403);
    echo 'Bu öğrenci raporuna erişim yetkiniz yok.';
    exit;
}

$stmt=$pdo->prepare('SELECT id,ad,email,egitim_kademesi,sinif_seviyesi,kullanici_id FROM ogrenciler WHERE id=? AND aktif=1 LIMIT 1');
$stmt->execute([$studentId]);
$student=$stmt->fetch();
$stmt->closeCursor();
if(!is_array($student)){
    http_response_code(404);
    echo 'Öğrenci bulunamadı.';
    exit;
}

$reportInstitutionId=max(0,(int)($_GET['kurum_id']??0));
$reportInstitutionScoped=false;
$reportInstitutionName='';
$reportBack=$roleHome;
$reportBackLabel='Panelime Dön';
$parentInstitutionChoices=[];

$effectiveRole=auth_effective_role($user);
if($reportInstitutionId>0 && in_array($effectiveRole,['yonetici','super_admin'],true)){
    try{
        $scope=$pdo->prepare("SELECT k.ad
            FROM kurum_kullanicilari kk
            INNER JOIN kurumlar k ON k.id=kk.kurum_id AND k.aktif=1
            WHERE kk.kurum_id=?
              AND kk.kullanici_id=?
              AND kk.kurum_rolu='ogrenci'
              AND kk.aktif=1
            LIMIT 1");
        $scope->execute([$reportInstitutionId,(int)$student['kullanici_id']]);
        $institutionName=$scope->fetchColumn();
        $scope->closeCursor();
        if(is_string($institutionName) && $institutionName!==''){
            $reportInstitutionScoped=true;
            $reportInstitutionName=$institutionName;
            $reportBack='kurum-raporlari.php?kurum_id='.$reportInstitutionId;
            $reportBackLabel='Kurum Raporuna Dön';
        }
    }catch(Throwable){}
}elseif($reportInstitutionId>0 && $effectiveRole==='ogretmen'){
    try{
        $teacherContext=tol_teacher_report_context($pdo,(int)$user['id'],$studentId,$reportInstitutionId);
        if(is_array($teacherContext)){
            $reportInstitutionScoped=true;
            $reportInstitutionName=(string)$teacherContext['institution_name'];
            $reportBack=(string)$teacherContext['back'];
            $reportBackLabel='Öğrencilerime Dön';
        }
    }catch(Throwable){}
}elseif($effectiveRole==='veli'){
    try{
        $parentInstitutionChoices=vi_parent_child_institutions($pdo,(int)$user['id'],$studentId);

        if($reportInstitutionId>0){
            $parentContext=vi_parent_report_context($pdo,(int)$user['id'],$studentId,$reportInstitutionId);
            if(!is_array($parentContext)){
                http_response_code(403);
                echo 'Bu kurum için öğrenci raporuna erişim yetkiniz yok.';
                exit;
            }
            $reportInstitutionScoped=true;
            $reportInstitutionName=(string)$parentContext['institution_name'];
            $reportBack=(string)$parentContext['back'];
            $reportBackLabel=(string)$parentContext['back_label'];
        }elseif(count($parentInstitutionChoices)===1){
            $reportInstitutionId=(int)$parentInstitutionChoices[0]['id'];
            $parentContext=vi_parent_report_context($pdo,(int)$user['id'],$studentId,$reportInstitutionId);
            if(is_array($parentContext)){
                $reportInstitutionScoped=true;
                $reportInstitutionName=(string)$parentContext['institution_name'];
                $reportBack=(string)$parentContext['back'];
                $reportBackLabel=(string)$parentContext['back_label'];
            }
        }elseif(count($parentInstitutionChoices)>1){
            ?><!doctype html>
            <html lang="tr">
            <head>
            <meta charset="utf-8">
            <meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
            <title>Rapor Kurumu Seç — İlkAdım</title>
            <link rel="stylesheet" href="styles.css">
            <link rel="stylesheet" href="veli.css?v=1.0.42">
            <link rel="stylesheet" href="ogrenci-raporu.css?v=1.2.19">
            </head>
            <body class="role-page">
            <div class="role-shell">
            <header class="role-topbar">
            <a class="role-icon" href="veli-paneli.php#cocuklar">←</a>
            <span class="role-brand"><span>📊</span><span><strong>Öğrenci Raporu</strong><small>KURUM SEÇİMİ</small></span></span>
            </header>
            <main class="role-content">
            <section class="role-hero">
            <span class="eyeline">ÇOCUK RAPORU</span>
            <h1><?=htmlspecialchars((string)($student['ad']?:$student['email']),ENT_QUOTES,'UTF-8')?></h1>
            <p>Bu öğrenci için birden fazla yetkili kurum bağlantın var. Öğretmen soru ve ödevlerinin karışmaması için raporu hangi kurum kapsamında açacağını seç.</p>
            <span class="role-hero-art">🏫</span>
            </section>
            <section class="role-section">
            <div class="role-section-head"><div><span class="eyeline">YETKİLİ KURUMLAR</span><h2>Rapor Kurumu</h2></div></div>
            <div class="role-list">
            <?php foreach($parentInstitutionChoices as $choice):?>
            <a class="role-row" href="ogrenci-raporu.php?id=<?=$studentId?>&amp;kurum_id=<?=(int)$choice['id']?>">
            <span>🏫</span>
            <div><strong><?=htmlspecialchars((string)$choice['ad'],ENT_QUOTES,'UTF-8')?></strong><small>Bu kurumun öğretmen içerikleriyle raporu aç →</small></div>
            <b>→</b>
            </a>
            <?php endforeach;?>
            </div>
            </section>
            </main>
            </div>
            </body>
            </html><?php
            exit;
        }
    }catch(Throwable $e){
        error_log('[IlkAdim][parent-report-context] '.$e->getMessage());
        http_response_code(503);
        echo 'Veli rapor kapsamı şu anda doğrulanamıyor.';
        exit;
    }
}

$summary=normalized_summary($pdo,$studentId);
$studentGrade=min(8,max(1,(int)($student['sinif_seviyesi']??1)));
$educationStage=(string)($student['egitim_kademesi']??'temel_egitim');
if($educationStage!=='temel_egitim')$educationStage='temel_egitim';

$lessonStmt=$pdo->prepare('SELECT d.kod,d.ad,COUNT(DISTINCT m.id) toplam_modul,(SELECT COUNT(*) FROM ogrenci_ilerleme oi WHERE oi.ogrenci_id=? AND oi.sinif_seviyesi=? AND oi.ders_kodu=d.kod AND oi.tamamlandi=1) tamamlanan_modul FROM dersler d INNER JOIN sinif_dersleri sd ON sd.ders_id=d.id AND sd.kademe_kodu=? AND sd.sinif_seviyesi=? AND sd.aktif=1 LEFT JOIN ders_modulleri m ON m.ders_id=d.id AND m.kademe_kodu=? AND m.sinif_seviyesi=? AND m.aktif=1 WHERE d.aktif=1 GROUP BY d.id,d.kod,d.ad,sd.sira ORDER BY sd.sira,d.id');
$lessonStmt->execute([$studentId,$studentGrade,$educationStage,$studentGrade,$educationStage,$studentGrade]);
$lessons=$lessonStmt->fetchAll();
$lessonStmt->closeCursor();

$badgeStmt=$pdo->prepare('SELECT r.ad,r.emoji,r.aciklama FROM ogrenci_rozetleri orr INNER JOIN rozetler r ON r.id=orr.rozet_id WHERE orr.ogrenci_id=? ORDER BY r.sira,r.id');
$badgeStmt->execute([$studentId]);
$badges=$badgeStmt->fetchAll();
$badgeStmt->closeCursor();

$teacherContents=oi_student_contents($pdo,$studentId);
if($reportInstitutionScoped){
    $teacherContents=ord_scope_teacher_contents($teacherContents,$reportInstitutionId);
}
$teacherSummary=ord_teacher_content_summary($teacherContents);
$recentHomeworks=ord_recent_homeworks($teacherContents,8);
$recentQuestions=ord_recent_questions($teacherContents,8);

$groupMemberships=[];
if($reportInstitutionScoped){
    try{
        $groupStmt=$pdo->prepare("SELECT ks.id,ks.ad,ks.tur,ks.sinif_seviyesi
            FROM kurum_sinif_ogrencileri kso
            INNER JOIN kurum_siniflari ks
              ON ks.id=kso.kurum_sinif_id
             AND ks.kurum_id=kso.kurum_id
             AND ks.aktif=1
            WHERE kso.kurum_id=? AND kso.ogrenci_id=?
            ORDER BY COALESCE(ks.sinif_seviyesi,99),ks.tur,ks.ad,ks.id");
        $groupStmt->execute([$reportInstitutionId,$studentId]);
        $groupMemberships=$groupStmt->fetchAll();
        $groupStmt->closeCursor();
    }catch(Throwable){
        $groupMemberships=[];
    }
}

$teacherQuestionRate=$teacherSummary['questions_answered']>0
    ?(int)round($teacherSummary['questions_correct']*100/$teacherSummary['questions_answered'])
    :null;
$homeworkRate=$teacherSummary['homeworks']>0
    ?(int)round($teacherSummary['homeworks_completed']*100/$teacherSummary['homeworks'])
    :null;

function h_report(string $v): string {
    return htmlspecialchars($v,ENT_QUOTES,'UTF-8');
}
function or_date(?string $value): string {
    $value=trim((string)$value);
    if($value==='') return '—';
    try{
        return (new DateTimeImmutable($value))->format('d.m.Y H:i');
    }catch(Throwable){
        return '—';
    }
}
function or_group_label(array $group): string {
    $type=(string)($group['tur']??'sinif')==='grup'?'Grup':'Sınıf';
    $grade=$group['sinif_seviyesi']!==null?(int)$group['sinif_seviyesi']:0;
    return $type.' · '.(string)($group['ad']??'').($grade>0?' · '.$grade.'. sınıf':'');
}
?><!DOCTYPE html>
<html lang="tr">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width,initial-scale=1.0,viewport-fit=cover">
<meta name="theme-color" content="#f8f7fc">
<title>Öğrenci Raporu — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="ogrenci-raporu.css?v=1.2.19">
</head>
<body>
<div class="app-shell">
<header class="app-topbar">
<a class="icon-button" href="<?=h_report($reportBack)?>" aria-label="Geri">←</a>
<span class="topbar-title">Öğrenci Raporu</span>
<a class="mini-avatar" href="logout.php" aria-label="Çıkış">🚪</a>
</header>

<main id="screen" tabindex="-1">
<div class="screen-content settings-screen student-report-screen">
<section class="subpage-intro student-report-intro">
<span>📊</span>
<h1><?=h_report((string)($student['ad']?:$student['email']?:'Öğrenci #'.$studentId))?></h1>
<p>Temel Eğitim · <?=$studentGrade?>. sınıf<?=($reportInstitutionScoped?' · '.h_report($reportInstitutionName):'')?> · Bu rapor yalnızca hesabına yetkilendirilmiş öğrenci için görüntülenebilir.</p>
</section>

<?php if($reportInstitutionScoped && $groupMemberships):?>
<section class="settings-block student-report-groups">
<h2>Kurum sınıfı / grupları</h2>
<div class="student-report-chip-list">
<?php foreach($groupMemberships as $group):?><span>🏷️ <?=h_report(or_group_label($group))?></span><?php endforeach;?>
</div>
</section>
<?php endif;?>

<section class="settings-block">
<h2>Genel durum</h2>
<div class="student-report-grid">
<div class="student-report-stat"><span>📚</span><strong><?=$summary['completed_steps']?></strong><small>Ders adımı</small></div>
<div class="student-report-stat"><span>🧠</span><strong><?=$summary['answers']?></strong><small>Sistem yanıtı</small></div>
<div class="student-report-stat"><span>✅</span><strong><?=$summary['correct_answers']?></strong><small>Sistem doğru</small></div>
<div class="student-report-stat"><span>🎮</span><strong><?=$summary['games']?></strong><small>Oyun</small></div>
<div class="student-report-stat"><span>⭐</span><strong><?=$summary['stars']?></strong><small>Yıldız</small></div>
<div class="student-report-stat"><span>🏅</span><strong><?=$summary['badges']?></strong><small>Rozet</small></div>
</div>
</section>

<section class="settings-block">
<h2>Öğretmen içerikleri</h2>
<div class="student-report-grid">
<div class="student-report-stat"><span>❓</span><strong><?=$teacherSummary['questions_answered']?> / <?=$teacherSummary['questions']?></strong><small>Yanıtlanan soru</small></div>
<div class="student-report-stat"><span>📈</span><strong><?=$teacherQuestionRate!==null?$teacherQuestionRate.'%':'—'?></strong><small>Öğretmen sorusu doğruluk</small></div>
<div class="student-report-stat"><span>📝</span><strong><?=$teacherSummary['homeworks_completed']?> / <?=$teacherSummary['homeworks']?></strong><small>Tamamlanan ödev</small></div>
<div class="student-report-stat"><span>✅</span><strong><?=$homeworkRate!==null?$homeworkRate.'%':'—'?></strong><small>Ödev tamamlama</small></div>
<div class="student-report-stat"><span>⏰</span><strong><?=$teacherSummary['homeworks_overdue']?></strong><small>Süresi geçmiş bekleyen</small></div>
</div>
</section>

<section class="settings-block">
<h2>Ders ilerlemesi</h2>
<?php if(!$lessons):?><p class="little-note">Bu sınıf seviyesi için ders ilerlemesi bulunamadı.</p><?php endif;?>
<?php foreach($lessons as $lesson):
$total=(int)$lesson['toplam_modul'];
$done=(int)$lesson['tamamlanan_modul'];
$percent=$total>0?(int)round($done/$total*100):0;
?>
<div class="history-item">
<span>📘</span>
<div><strong><?=h_report((string)$lesson['ad'])?></strong><small><?=$done?> / <?=$total?> konu · %<?=$percent?></small></div>
</div>
<?php endforeach;?>
</section>

<section class="settings-block">
<h2>Ödev durumu</h2>
<?php if(!$recentHomeworks):?><p class="little-note">Aktif öğretmen ödevi bulunmuyor.</p><?php endif;?>
<?php foreach($recentHomeworks as $homework):
    $completed=(int)($homework['odev_tamamlandi']??0)===1;
    $dueRaw=trim((string)($homework['teslim_tarihi']??''));
    $overdue=false;
    if(!$completed && $dueRaw!==''){
        try{$overdue=(new DateTimeImmutable($dueRaw))<new DateTimeImmutable('now');}catch(Throwable){}
    }
    $status=$completed?'Tamamlandı':($overdue?'Süresi geçti':'Bekliyor');
?>
<div class="student-report-detail-card">
<div class="student-report-detail-head">
<span>📝</span>
<div><strong><?=h_report((string)$homework['baslik'])?></strong><small><?=h_report((string)$homework['ders_adi'])?> · <?=h_report((string)$homework['ogretmen_adi'])?></small></div>
<span class="student-report-status <?=$completed?'ok':($overdue?'warn':'')?>"><?=h_report($status)?></span>
</div>
<div class="student-report-detail-meta">
<span>📅 Yayın: <?=h_report(or_date((string)($homework['olusturulma_tarihi']??'')))?></span>
<span>⏰ Teslim: <?=h_report(or_date((string)($homework['teslim_tarihi']??'')))?></span>
<?php if($completed):?><span>✅ Tamamlandı: <?=h_report(or_date((string)($homework['odev_tamamlanma_tarihi']??'')))?></span><?php endif;?>
<?php if(!$reportInstitutionScoped):?><span>🏫 <?=h_report((string)$homework['kurum_adi'])?></span><?php endif;?>
</div>
</div>
<?php endforeach;?>
</section>

<section class="settings-block">
<h2>Öğretmen soruları</h2>
<?php if(!$recentQuestions):?><p class="little-note">Aktif öğretmen sorusu bulunmuyor.</p><?php endif;?>
<?php foreach($recentQuestions as $question):
    $answered=array_key_exists('secilen_cevap_indeksi',$question) && $question['secilen_cevap_indeksi']!==null;
    $correct=$answered && (int)($question['cevap_dogru']??0)===1;
    $status=$answered?($correct?'Doğru':'Yanlış'):'Bekliyor';
?>
<div class="student-report-detail-card">
<div class="student-report-detail-head">
<span>❓</span>
<div><strong><?=h_report((string)$question['baslik'])?></strong><small><?=h_report((string)$question['ders_adi'])?> · <?=h_report((string)$question['ogretmen_adi'])?></small></div>
<span class="student-report-status <?=$correct?'ok':($answered?'warn':'')?>"><?=h_report($status)?></span>
</div>
<div class="student-report-detail-meta">
<span>🗓️ <?=h_report(or_date((string)($question['olusturulma_tarihi']??'')))?></span>
<?php if($answered):?><span>🔁 <?=(int)($question['deneme_sayisi']??1)?> deneme</span><?php endif;?>
<?php if(!$reportInstitutionScoped):?><span>🏫 <?=h_report((string)$question['kurum_adi'])?></span><?php endif;?>
</div>
</div>
<?php endforeach;?>
</section>

<section class="settings-block">
<h2>Rozetler</h2>
<?php if(!$badges):?><p class="little-note">Henüz kazanılmış rozet yok.</p><?php endif;?>
<?php foreach($badges as $badge):?>
<div class="history-item"><span><?=h_report((string)$badge['emoji'])?></span><div><strong><?=h_report((string)$badge['ad'])?></strong><small><?=h_report((string)$badge['aciklama'])?></small></div></div>
<?php endforeach;?>
</section>

<a class="button soft full" href="<?=h_report($reportBack)?>"><?=h_report($reportBackLabel)?></a>
</div>
</main>
</div>
</body>
</html>
