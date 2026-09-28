<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';

$user=require_role('ogretmen');
$pdo=db();
function od_h(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
$homeworkId=filter_input(INPUT_GET,'id',FILTER_VALIDATE_INT);
if(!$homeworkId || $homeworkId<1){http_response_code(404);echo 'Ödev bulunamadı.';exit;}

try{
    $stmt=$pdo->prepare("SELECT oi.id,oi.kurum_id,oi.baslik,oi.icerik_metni,oi.hedef_turu,oi.aktif,oi.olusturulma_tarihi,
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
    if(!$homework){http_response_code(404);echo 'Ödev bulunamadı.';exit;}

    $stmt=$pdo->prepare("SELECT DISTINCT os.id,os.ad,os.sinif_seviyesi
        FROM ogretmen_ogrenci oo
        INNER JOIN ogrenciler os ON os.id=oo.ogrenci_id AND os.aktif=1
        INNER JOIN kullanicilar su ON su.id=os.kullanici_id AND su.aktif=1
        INNER JOIN kurum_kullanicilari sk ON sk.kullanici_id=su.id AND sk.kurum_id=?
            AND sk.kurum_rolu='ogrenci' AND sk.aktif=1
        LEFT JOIN ogretmen_icerik_hedefleri h ON h.icerik_id=? AND h.ogrenci_id=os.id
        WHERE oo.ogretmen_id=(SELECT ogretmen_id FROM ogretmen_icerikleri WHERE id=?)
            AND (?='tum_ogrenciler' OR h.ogrenci_id IS NOT NULL)
        ORDER BY os.sinif_seviyesi,os.ad,os.id");
    $stmt->execute([(int)$homework['kurum_id'],$homeworkId,$homeworkId,(string)$homework['hedef_turu']]);
    $students=$stmt->fetchAll();
    $stmt->closeCursor();
}catch(Throwable){
    http_response_code(503);
    echo 'Ödev bilgileri şu anda okunamıyor.';
    exit;
}
?><!doctype html><html lang="tr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Ödev Ayrıntısı — İlkAdım</title><link rel="stylesheet" href="styles.css"><link rel="stylesheet" href="ogretmen.css?v=1.0.42"></head>
<body class="role-page"><div class="role-shell">
<header class="role-topbar"><a class="role-icon" href="ogretmen-odevleri.php" aria-label="Ödev listesine dön">←</a><span class="role-brand"><span>📝</span><span><strong>Ödev Ayrıntısı</strong><small>ÖĞRETMEN ALANI</small></span></span></header>
<main class="role-content"><section class="role-hero"><span class="eyeline">ÖDEV</span><h1><?=od_h((string)$homework['baslik'])?></h1><p><?=od_h((string)$homework['kurum_adi'])?> · <?=od_h((string)$homework['ders_adi'])?> · <?=((int)$homework['aktif']===1?'Yayında':'Pasif')?></p></section>
<section class="role-section"><div class="role-section-head"><div><span class="eyeline">İÇERİK</span><h2>Ödev Metni</h2></div></div><p><?=nl2br(od_h((string)$homework['icerik_metni']))?></p></section>
<section class="role-section"><div class="role-section-head"><div><span class="eyeline">HEDEF ÖĞRENCİLER</span><h2><?=((string)$homework['hedef_turu']==='tum_ogrenciler'?'Bağlı Öğrenciler':'Seçili Öğrenciler')?></h2></div><span class="role-pill"><?=count($students)?></span></div><div class="role-list">
<?php if(!$students):?><div class="role-empty">Bu kurumda şu anda ödevin hedef koşullarına uyan aktif öğrenci bulunamadı.</div><?php endif;?>
<?php foreach($students as $student):?><div class="role-row"><span>🎒</span><div><strong><?=od_h((string)$student['ad'])?></strong><small><?=(int)$student['sinif_seviyesi']?>. sınıf</small></div></div><?php endforeach;?>
</div></section><div class="role-note"><span>ℹ️</span><p>Liste, mevcut kurum üyeliği ve öğretmen eşleştirmesine göre gösterilir. Öğrencilerin tamamlama durumu ve teslim tarihi henüz kaydedilmiyor.</p></div>
</main><nav class="role-bottom"><a href="ogretmen-paneli.php"><span>⌂</span>Panel</a><a href="ogretmen-ogrencilerim.php"><span>🎒</span>Öğrenciler</a><a class="active" href="ogretmen-odevleri.php"><span>📝</span>Ödevler</a><a href="ogretmen-icerikleri.php"><span>⭐</span>İçeriklerim</a></nav></div></body></html>
