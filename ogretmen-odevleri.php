<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';

$user=require_role('ogretmen');
$pdo=db();
function oo_h(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
try{
    $stmt=$pdo->prepare("SELECT og.id FROM ogretmenler og INNER JOIN kullanicilar u ON u.id=og.kullanici_id AND u.aktif=1 WHERE og.kullanici_id=? AND og.aktif=1 LIMIT 1");
    $stmt->execute([(int)$user['id']]);
    $teacherId=(int)($stmt->fetchColumn()?:0);
    $stmt->closeCursor();
    if($teacherId<=0){http_response_code(403);echo 'Öğretmen profili bulunamadı.';exit;}

    $stmt=$pdo->prepare("SELECT DISTINCT k.id,k.ad FROM kurum_kullanicilari kk
        INNER JOIN kurumlar k ON k.id=kk.kurum_id AND k.aktif=1
        WHERE kk.kullanici_id=? AND kk.kurum_rolu='ogretmen' AND kk.aktif=1
        ORDER BY k.ad,k.id");
    $stmt->execute([(int)$user['id']]);
    $institutions=$stmt->fetchAll();
    $stmt->closeCursor();
}catch(Throwable){
    http_response_code(503);
    echo 'Öğretmen bilgileri şu anda okunamıyor.';
    exit;
}
$institutionIds=array_map('intval',array_column($institutions,'id'));
$institutionId=(int)($_GET['kurum_id']??0);
if($institutionId>0 && !in_array($institutionId,$institutionIds,true)){
    http_response_code(403);
    echo 'Bu kurumun ödevlerini görüntüleme yetkin yok.';
    exit;
}
$status=(string)($_GET['durum']??'tum');
if(!in_array($status,['tum','aktif','pasif'],true)) $status='tum';
$sql="SELECT oi.id,oi.baslik,oi.icerik_metni,oi.hedef_turu,oi.teslim_tarihi,oi.aktif,oi.olusturulma_tarihi,
    k.ad kurum_adi,d.ad ders_adi,COUNT(DISTINCT h.ogrenci_id) secili_sayisi
    FROM ogretmen_icerikleri oi
    INNER JOIN kurumlar k ON k.id=oi.kurum_id AND k.aktif=1
    INNER JOIN dersler d ON d.id=oi.ders_id
    INNER JOIN kurum_kullanicilari kk ON kk.kurum_id=oi.kurum_id
      AND kk.kullanici_id=? AND kk.kurum_rolu='ogretmen' AND kk.aktif=1
    LEFT JOIN ogretmen_icerik_hedefleri h ON h.icerik_id=oi.id
    WHERE oi.ogretmen_id=? AND oi.icerik_turu='odev'";
$params=[(int)$user['id'],$teacherId];
if($institutionId>0){$sql.=' AND oi.kurum_id=?';$params[]=$institutionId;}
if($status!=='tum'){$sql.=' AND oi.aktif=?';$params[]=$status==='aktif'?1:0;}
$sql.=' GROUP BY oi.id,k.ad,d.ad ORDER BY oi.olusturulma_tarihi DESC,oi.id DESC';
try{
    $stmt=$pdo->prepare($sql);
    $stmt->execute($params);
    $homeworks=$stmt->fetchAll();
    $stmt->closeCursor();
}catch(Throwable){
    http_response_code(503);
    echo 'Ödevler şu anda okunamıyor.';
    exit;
}
?><!doctype html><html lang="tr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Ödevlerim — İlkAdım</title><link rel="stylesheet" href="styles.css"><link rel="stylesheet" href="ogretmen.css?v=1.0.42"></head>
<body class="role-page"><div class="role-shell">
<header class="role-topbar"><a class="role-icon" href="ogretmen-paneli.php" aria-label="Öğretmen paneline dön">←</a><span class="role-brand"><span>📝</span><span><strong>Ödevlerim</strong><small>ÖĞRETMEN ALANI</small></span></span></header>
<main class="role-content">
<section class="role-hero"><span class="eyeline">ÖDEV YÖNETİMİ</span><h1>Yayınladığın Ödevler</h1><p>Kurum ve yayın durumuna göre ödevlerini gör. Yeni ödev eklemek veya yayını değiştirmek için İçeriklerim bölümünü kullan.</p><a class="role-primary" href="ogretmen-icerikleri.php">Yeni Ödev / İçerik →</a></section>
<section class="role-section"><div class="role-section-head"><div><span class="eyeline">FİLTRELER</span><h2>Kurum ve Durum</h2></div></div>
<form method="get" class="role-form"><label for="kurum">Kurum</label><select class="role-input" name="kurum_id" id="kurum"><option value="0">Tüm kurumlarım</option><?php foreach($institutions as $institution):?><option value="<?=(int)$institution['id']?>" <?=(int)$institution['id']===$institutionId?'selected':''?>><?=oo_h((string)$institution['ad'])?></option><?php endforeach;?></select>
<label for="durum">Yayın durumu</label><select class="role-input" name="durum" id="durum"><option value="tum" <?=$status==='tum'?'selected':''?>>Tümü</option><option value="aktif" <?=$status==='aktif'?'selected':''?>>Yayında</option><option value="pasif" <?=$status==='pasif'?'selected':''?>>Pasif</option></select><button class="role-button" type="submit">Ödevleri Göster</button></form></section>
<section class="role-section"><div class="role-section-head"><div><span class="eyeline">ÖDEVLER</span><h2>Liste</h2></div><span class="role-pill"><?=count($homeworks)?></span></div><div class="role-list">
<?php if(!$homeworks):?><div class="role-empty">Bu filtrede ödev bulunamadı.</div><?php endif;?>
<?php foreach($homeworks as $homework):?>
<?php $dueText=!empty($homework['teslim_tarihi'])?date('d.m.Y H:i',strtotime((string)$homework['teslim_tarihi'])):'Süre yok'; ?>
<a class="role-row" href="ogretmen-odev-detay.php?id=<?=(int)$homework['id']?>"><span>📝</span><div><strong><?=oo_h((string)$homework['baslik'])?></strong><small><?=oo_h((string)$homework['kurum_adi'])?> · <?=oo_h((string)$homework['ders_adi'])?> · Teslim: <?=oo_h($dueText)?></small><small><?=(string)$homework['hedef_turu']==='tum_ogrenciler'?'Bu kurumda bağlı tüm öğrenciler':(int)$homework['secili_sayisi'].' seçili öğrenci'?> · Teslim durumlarını aç →</small></div><span class="role-pill <?=((int)$homework['aktif']===1?'ok':'off')?>"><?=((int)$homework['aktif']===1?'Yayında':'Pasif')?></span></a>
<?php endforeach;?>
</div></section>
<div class="role-note"><span>ℹ️</span><p>Ödev ayrıntısında hedef öğrencilerin tamamlandı, gecikti ve bekliyor durumlarını teslim zamanıyla birlikte takip edebilirsin.</p></div>
</main><nav class="role-bottom"><a href="ogretmen-paneli.php"><span>⌂</span>Panel</a><a href="ogretmen-ogrencilerim.php"><span>🎒</span>Öğrenciler</a><a class="active" href="ogretmen-odevleri.php"><span>📝</span>Ödevler</a><a href="ogretmen-icerikleri.php"><span>⭐</span>İçeriklerim</a></nav>
</div></body></html>
