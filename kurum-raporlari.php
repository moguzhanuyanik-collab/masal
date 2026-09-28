<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/kurum_yonetimi.php';
require __DIR__.'/src/yonetici_yetkileri.php';

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
if($grade<1||$grade>8) $grade=0;
$start=trim((string)($_GET['baslangic']??''));
$end=trim((string)($_GET['bitis']??''));
foreach([$start,$end] as $date){
    if($date!=='' && (!preg_match('/^20\d\d-\d\d-\d\d$/',$date) || !($parsed=DateTimeImmutable::createFromFormat('!Y-m-d',$date)) || $parsed->format('Y-m-d')!==$date)){
        http_response_code(400);
        echo 'Geçersiz tarih filtresi.';
        exit;
    }
}
if($start!=='' && $end!=='' && $start>$end){
    http_response_code(400);
    echo 'Başlangıç tarihi bitişten sonra olamaz.';
    exit;
}

$answerWhere=[];
$params=[];
if($start!==''){$answerWhere[]='cevap_tarihi >= ?';$params[]=$start.' 00:00:00';}
if($end!==''){$answerWhere[]='cevap_tarihi <= ?';$params[]=$end.' 23:59:59';}
$answerFilter=$answerWhere?'WHERE '.implode(' AND ',$answerWhere):'';
$sql="SELECT o.id,o.ad,o.sinif_seviyesi,
    COALESCE(c.yanit,0) yanit,COALESCE(c.dogru,0) dogru
    FROM kurum_kullanicilari kk
    INNER JOIN kullanicilar u ON u.id=kk.kullanici_id AND u.aktif=1
    INNER JOIN ogrenciler o ON o.kullanici_id=u.id AND o.aktif=1
    LEFT JOIN (
        SELECT ogrenci_id,COUNT(*) yanit,SUM(CASE WHEN dogru=1 THEN 1 ELSE 0 END) dogru
        FROM ogrenci_cevaplari {$answerFilter}
        GROUP BY ogrenci_id
    ) c ON c.ogrenci_id=o.id
    WHERE kk.kurum_id=? AND kk.kurum_rolu='ogrenci' AND kk.aktif=1";
$params[]=$institutionId;
if($grade>0){$sql.=' AND o.sinif_seviyesi=?';$params[]=$grade;}
$sql.=' ORDER BY o.sinif_seviyesi,o.ad,o.id';
try{
    $stmt=$pdo->prepare($sql);
    $stmt->execute($params);
    $rows=$stmt->fetchAll();
    $stmt->closeCursor();
}catch(Throwable){
    http_response_code(503);
    echo 'Kurum raporu şu anda okunamıyor.';
    exit;
}
$totals=['students'=>count($rows),'answers'=>0,'correct'=>0];
foreach($rows as $row){$totals['answers']+=(int)$row['yanit'];$totals['correct']+=(int)$row['dogru'];}
$isSuper=auth_user_has_role($user,'super_admin');
$back=$isSuper?'kurum-detay.php?kurum_id='.$institutionId:'yonetici-paneli.php?kurum_id='.$institutionId;
?><!doctype html><html lang="tr"><head>
<meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Kurum Raporları — İlkAdım</title><link rel="stylesheet" href="styles.css"><link rel="stylesheet" href="kurum.css?v=1.0.41">
</head><body class="role-page"><div class="role-shell">
<header class="role-topbar"><a class="role-icon" href="<?=ky_h($back)?>" aria-label="Geri dön">←</a><span class="role-brand"><span>📊</span><span><strong>Kurum Raporları</strong><small><?=ky_h((string)$institution['ad'])?></small></span></span></header>
<main class="role-content">
<section class="role-hero"><span class="eyeline">KURUM ÖZETİ</span><h1><?=ky_h((string)$institution['ad'])?></h1><p>Aktif öğrencilerin soru yanıtları ve doğruluk durumu. Tarih filtresi yanıtları sınırlar; öğrenci sayısı seçilen sınıfın güncel sayısıdır.</p></section>
<section class="role-section"><div class="role-section-head"><div><span class="eyeline">FİLTRELER</span><h2>Sınıf ve Tarih</h2></div></div>
<form class="role-form" method="get"><input type="hidden" name="kurum_id" value="<?=$institutionId?>">
<label for="sinif">Sınıf</label><select class="role-input" id="sinif" name="sinif"><option value="0">Tüm sınıflar</option><?php for($g=1;$g<=8;$g++):?><option value="<?=$g?>" <?=$grade===$g?'selected':''?>><?=$g?>. sınıf</option><?php endfor;?></select>
<label for="baslangic">Başlangıç</label><input class="role-input" type="date" id="baslangic" name="baslangic" value="<?=ky_h($start)?>">
<label for="bitis">Bitiş</label><input class="role-input" type="date" id="bitis" name="bitis" value="<?=ky_h($end)?>">
<button class="role-button" type="submit">Raporu Göster</button></form></section>
<section class="role-section"><div class="role-section-head"><div><span class="eyeline">TOPLAM</span><h2>Sonuçlar</h2></div></div><div class="role-stats">
<div class="role-stat"><span>🎒</span><strong><?=$totals['students']?></strong><small>Aktif öğrenci</small></div>
<div class="role-stat"><span>📝</span><strong><?=$totals['answers']?></strong><small>Yanıtlanan soru</small></div>
<div class="role-stat"><span>✅</span><strong><?=$totals['correct']?></strong><small>Doğru yanıt</small></div>
<div class="role-stat"><span>📈</span><strong><?=$totals['answers']>0?round($totals['correct']*100/$totals['answers']).'%':'—'?></strong><small>Doğruluk</small></div>
</div></section>
<section class="role-section"><div class="role-section-head"><div><span class="eyeline">ÖĞRENCİ BAZINDA</span><h2>Yanıt Özeti</h2></div></div><div class="role-list">
<?php if(!$rows):?><div class="role-empty">Bu filtrede aktif öğrenci bulunamadı.</div><?php endif;?>
<?php foreach($rows as $row):$answers=(int)$row['yanit'];$correct=(int)$row['dogru'];?>
<div class="role-row"><span>🎒</span><div><strong><?=ky_h((string)$row['ad'])?></strong><small><?=(int)$row['sinif_seviyesi']?>. sınıf · <?=$answers?> yanıt · <?=$correct?> doğru</small></div><span class="role-pill"><?=$answers>0?round($correct*100/$answers).'%':'—'?></span></div>
<?php endforeach;?></div></section>
</main><nav class="role-bottom"><a href="<?=ky_h($back)?>"><span>⌂</span>Panel</a><a href="kurum-detay.php?kurum_id=<?=$institutionId?>"><span>🏫</span>Kurum</a><a class="active" href="kurum-raporlari.php?kurum_id=<?=$institutionId?>"><span>📊</span>Raporlar</a><a href="hesap-guvenligi.php"><span>⚙️</span>Hesap</a></nav>
</div></body></html>
