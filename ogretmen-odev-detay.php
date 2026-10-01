<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/ogretmen_icerik.php';
require __DIR__.'/src/odev_durumu.php';

$user=require_role('ogretmen');
$pdo=db();

function od_h(string $value): string {
    return htmlspecialchars($value,ENT_QUOTES,'UTF-8');
}
function od_date(?string $value,string $empty='Süre sınırı yok'): string {
    $value=trim((string)$value);
    if($value==='') return $empty;
    try{return (new DateTimeImmutable($value))->format('d.m.Y H:i');}
    catch(Throwable){return $empty;}
}

function od_group_label(?array $group): string {
    if(!is_array($group)) return '';
    $type=(string)($group['grup_turu']??'sinif')==='grup'?'Grup':'Sınıf';
    $grade=$group['sinif_seviyesi']!==null?(int)$group['sinif_seviyesi']:0;
    return $type.' · '.(string)($group['grup_adi']??'').($grade>0?' · '.$grade.'. sınıf':'');
}

$homeworkId=filter_input(INPUT_GET,'id',FILTER_VALIDATE_INT);
$groupId=max(0,(int)($_GET['grup_id']??0));
if(!$homeworkId || $homeworkId<1){
    http_response_code(404);
    echo 'Ödev bulunamadı.';
    exit;
}

try{
    $stmt=$pdo->prepare("SELECT oi.id,oi.kurum_id,oi.baslik,oi.icerik_metni,oi.hedef_turu,oi.teslim_tarihi,oi.aktif,oi.olusturulma_tarihi,
        k.ad kurum_adi,d.ad ders_adi
        FROM ogretmen_icerikleri oi
        INNER JOIN ogretmenler og ON og.id=oi.ogretmen_id AND og.aktif=1 AND og.kullanici_id=?
        INNER JOIN kullanicilar ku ON ku.id=og.kullanici_id AND ku.aktif=1
        INNER JOIN kurumlar k ON k.id=oi.kurum_id AND k.aktif=1
        INNER JOIN dersler d ON d.id=oi.ders_id
        INNER JOIN kurum_kullanicilari kk ON kk.kurum_id=oi.kurum_id AND kk.kullanici_id=og.kullanici_id
            AND kk.kurum_rolu='ogretmen' AND kk.aktif=1
        WHERE oi.id=? AND oi.icerik_turu='odev' LIMIT 1");
    $stmt->execute([(int)$user['id'],$homeworkId]);
    $homework=$stmt->fetch();
    $stmt->closeCursor();
    if(!$homework){
        http_response_code(404);
        echo 'Ödev bulunamadı.';
        exit;
    }

    $groupContext=null;
    $groupStudentCondition='';
    if($groupId>0){
        if(!oi_table_exists($pdo,'ogretmen_icerik_hedef_gruplari')){
            http_response_code(404);
            echo 'Sınıf / grup hedef bilgisi bulunamadı.';
            exit;
        }
        $groupStmt=$pdo->prepare("SELECT kurum_sinif_id,kurum_id,grup_adi,grup_turu,sinif_seviyesi
            FROM ogretmen_icerik_hedef_gruplari
            WHERE icerik_id=? AND kurum_sinif_id=? AND kurum_id=?
            ORDER BY ogrenci_id
            LIMIT 1");
        $groupStmt->execute([$homeworkId,$groupId,(int)$homework['kurum_id']]);
        $groupContext=$groupStmt->fetch();
        $groupStmt->closeCursor();
        if(!is_array($groupContext)){
            http_response_code(404);
            echo 'Bu ödev için seçilen sınıf / grup hedefi bulunamadı.';
            exit;
        }
        $groupStudentCondition=" AND EXISTS (
            SELECT 1 FROM ogretmen_icerik_hedef_gruplari ghs
            WHERE ghs.icerik_id={$homeworkId}
              AND ghs.kurum_sinif_id={$groupId}
              AND ghs.ogrenci_id=os.id
        )";
    }

    $stmt=$pdo->prepare("SELECT DISTINCT os.id,os.ad,os.email,os.sinif_seviyesi,
            COALESCE(od.tamamlandi,0) tamamlandi,od.tamamlanma_tarihi
        FROM ogretmen_ogrenci oo
        INNER JOIN ogrenciler os ON os.id=oo.ogrenci_id AND os.aktif=1
        INNER JOIN kullanicilar su ON su.id=os.kullanici_id AND su.aktif=1
        INNER JOIN kurum_kullanicilari sk ON sk.kullanici_id=su.id AND sk.kurum_id=?
            AND sk.kurum_rolu='ogrenci' AND sk.aktif=1
        LEFT JOIN ogretmen_icerik_hedefleri h ON h.icerik_id=? AND h.ogrenci_id=os.id
        LEFT JOIN ogrenci_odev_durumlari od ON od.icerik_id=? AND od.ogrenci_id=os.id
        WHERE oo.ogretmen_id=(SELECT ogretmen_id FROM ogretmen_icerikleri WHERE id=?)
            AND oo.kurum_id=?
            AND (?='tum_ogrenciler' OR h.ogrenci_id IS NOT NULL)
            {$groupStudentCondition}
        ORDER BY os.sinif_seviyesi,os.ad,os.id");
    $stmt->execute([
        (int)$homework['kurum_id'],
        $homeworkId,
        $homeworkId,
        $homeworkId,
        (int)$homework['kurum_id'],
        (string)$homework['hedef_turu']
    ]);
    $students=$stmt->fetchAll();
    $stmt->closeCursor();
}catch(Throwable){
    http_response_code(503);
    echo 'Ödev bilgileri şu anda okunamıyor.';
    exit;
}

$summary=hw_summary($students,null,(string)($homework['teslim_tarihi']??''));
$dueText=od_date($homework['teslim_tarihi']??null);
$returnUrl='ogretmen-odevleri.php?kurum_id='.(int)$homework['kurum_id'].($groupId>0?'&grup_id='.$groupId:'');
?><!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Ödev Ayrıntısı — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="ogretmen.css?v=1.0.42">
<link rel="stylesheet" href="ogretmen-odev-detay.css?v=1.2.31">
</head>
<body class="role-page">
<div class="role-shell">
<header class="role-topbar">
<a class="role-icon" href="<?=od_h($returnUrl)?>" aria-label="Ödev listesine dön">←</a>
<span class="role-brand"><span>📝</span><span><strong>Ödev Ayrıntısı</strong><small>ÖĞRETMEN ALANI</small></span></span>
</header>

<main class="role-content teacher-homework-detail-shell">
<section class="role-hero">
<span class="eyeline">ÖDEV</span>
<h1><?=od_h((string)$homework['baslik'])?></h1>
<p><?=od_h((string)$homework['kurum_adi'])?> · <?=od_h((string)$homework['ders_adi'])?> · <?=((int)$homework['aktif']===1?'Yayında':'Pasif')?><?php if($groupContext):?> · <?=od_h(od_group_label($groupContext))?><?php endif;?></p>
<span class="role-hero-art">📝</span>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">İÇERİK</span><h2>Ödev Metni</h2></div></div>
<?php if(trim((string)$homework['icerik_metni'])!==''):?><p class="teacher-homework-text"><?=nl2br(od_h((string)$homework['icerik_metni']))?></p><?php endif;?>
<div class="role-note"><span>⏰</span><p><strong>Teslim:</strong> <?=od_h($dueText)?></p></div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">TESLİM ÖZETİ</span><h2>İlerleme</h2></div></div>
<div class="teacher-homework-stats">
<div class="role-stat"><span>🎯</span><strong><?=$summary['total']?></strong><small>Hedef öğrenci</small></div>
<div class="role-stat"><span>✅</span><strong><?=$summary['completed']?></strong><small>Tamamladı</small></div>
<div class="role-stat"><span>⏰</span><strong><?=$summary['overdue']?></strong><small>Gecikti</small></div>
<div class="role-stat"><span>⏳</span><strong><?=$summary['pending']?></strong><small>Bekliyor</small></div>
</div>
</section>

<section class="role-section">
<div class="role-section-head">
<div><span class="eyeline">HEDEF ÖĞRENCİLER</span><h2><?=((string)$homework['hedef_turu']==='tum_ogrenciler'?'Bağlı Öğrenciler':'Seçili Öğrenciler')?></h2></div>
<span class="role-pill"><?=count($students)?></span>
</div>
<div class="teacher-homework-student-list">
<?php if(!$students):?><div class="role-empty">Bu kurumda şu anda ödevin hedef koşullarına uyan aktif öğrenci bulunamadı.</div><?php endif;?>

<?php foreach($students as $student):
    $studentStatus=hw_status($student,null,(string)($homework['teslim_tarihi']??''));
    $statusClass=$studentStatus==='completed'?'ok':($studentStatus==='overdue'?'warn':'off');
    $detailText=$studentStatus==='completed' && !empty($student['tamamlanma_tarihi'])
        ?'Tamamlandı: '.od_date((string)$student['tamamlanma_tarihi'],'—')
        :($studentStatus==='overdue'?'Teslim tarihi geçti.':'Henüz tamamlamadı.');
?>
<a class="role-row teacher-homework-student" href="ogrenci-raporu.php?id=<?=(int)$student['id']?>&amp;kurum_id=<?=(int)$homework['kurum_id']?>">
<span><?=hw_status_icon($studentStatus)?></span>
<div>
<strong><?=od_h((string)($student['ad']?:$student['email']))?></strong>
<small><?=(int)$student['sinif_seviyesi']?>. sınıf · <?=od_h($detailText)?></small>
</div>
<span class="role-pill <?=$statusClass?>"><?=od_h(hw_status_label($studentStatus))?></span>
</a>
<?php endforeach;?>
</div>
</section>

<div class="role-note"><span>ℹ️</span><p>“Bekliyor” yalnız teslim süresi dolmamış tamamlanmamış ödevleri; “Gecikti” ise teslim tarihi geçmiş tamamlanmamış ödevleri gösterir. Öğrenci satırından kurum kapsamındaki raporuna geçebilirsin.</p></div>
</main>

<nav class="role-bottom">
<a href="ogretmen-paneli.php"><span>⌂</span>Panel</a>
<a href="ogretmen-ogrencilerim.php"><span>🎒</span>Öğrenciler</a>
<a class="active" href="<?=od_h($returnUrl)?>"><span>📝</span>Ödevler</a>
<a href="ogretmen-icerikleri.php"><span>⭐</span>İçeriklerim</a>
</nav>
</div>
</body>
</html>
