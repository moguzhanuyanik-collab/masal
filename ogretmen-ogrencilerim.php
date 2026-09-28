<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';

$user=require_role('ogretmen');
$pdo=db();
function to_h(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }

try{
    $stmt=$pdo->prepare("SELECT DISTINCT k.id,k.ad FROM kurum_kullanicilari kk
        INNER JOIN kurumlar k ON k.id=kk.kurum_id AND k.aktif=1
        WHERE kk.kullanici_id=? AND kk.kurum_rolu='ogretmen' AND kk.aktif=1
        ORDER BY k.ad,k.id");
    $stmt->execute([(int)$user['id']]);
    $institutions=$stmt->fetchAll();
    $stmt->closeCursor();
}catch(Throwable){
    http_response_code(503);
    echo 'Kurumlar şu anda okunamıyor.';
    exit;
}
$institutionIds=array_map('intval',array_column($institutions,'id'));
$institutionId=(int)($_GET['kurum_id']??($institutionIds[0]??0));
if($institutionId>0 && !in_array($institutionId,$institutionIds,true)){
    http_response_code(403);
    echo 'Bu kurumdaki öğrencileri görüntüleme yetkin yok.';
    exit;
}
$grade=(int)($_GET['sinif']??0);
if($grade<1 || $grade>8) $grade=0;
$students=[];
if($institutionId>0){
    try{
        $sql="SELECT DISTINCT o.id,o.ad,o.email,o.sinif_seviyesi
            FROM ogretmen_ogrenci oo
            INNER JOIN ogretmenler og ON og.id=oo.ogretmen_id AND og.aktif=1
            INNER JOIN ogrenciler o ON o.id=oo.ogrenci_id AND o.aktif=1
            INNER JOIN kullanicilar u ON u.id=o.kullanici_id AND u.aktif=1
            INNER JOIN kurum_kullanicilari kk ON kk.kullanici_id=u.id
                AND kk.kurum_id=? AND kk.kurum_rolu='ogrenci' AND kk.aktif=1
            WHERE og.kullanici_id=?";
        $params=[$institutionId,(int)$user['id']];
        if($grade>0){$sql.=' AND o.sinif_seviyesi=?';$params[]=$grade;}
        $sql.=' ORDER BY o.sinif_seviyesi,o.ad,o.id';
        $stmt=$pdo->prepare($sql);
        $stmt->execute($params);
        $students=$stmt->fetchAll();
        $stmt->closeCursor();
    }catch(Throwable){
        http_response_code(503);
        echo 'Öğrenciler şu anda okunamıyor.';
        exit;
    }
}
?><!doctype html><html lang="tr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Öğrencilerim — İlkAdım</title><link rel="stylesheet" href="styles.css"><link rel="stylesheet" href="ogretmen.css?v=1.0.42"></head>
<body class="role-page"><div class="role-shell">
<header class="role-topbar"><a class="role-icon" href="ogretmen-paneli.php" aria-label="Öğretmen paneline dön">←</a><span class="role-brand"><span>🎒</span><span><strong>Öğrencilerim</strong><small>ÖĞRETMEN ALANI</small></span></span></header>
<main class="role-content">
<section class="role-hero"><span class="eyeline">ÖĞRENCİ TAKİBİ</span><h1>Bağlı Öğrenciler</h1><p>Kurum ve sınıfa göre filtrele; öğrencinin ilerleme raporunu aç.</p><span class="role-hero-art">🎒</span></section>
<?php if($institutions):?><section class="role-section"><div class="role-section-head"><div><span class="eyeline">FİLTRELER</span><h2>Kurum ve Sınıf</h2></div></div>
<form class="role-form" method="get">
<label for="kurum">Kurum</label><select class="role-input" id="kurum" name="kurum_id"><?php foreach($institutions as $institution):?><option value="<?=(int)$institution['id']?>" <?=(int)$institution['id']===$institutionId?'selected':''?>><?=to_h((string)$institution['ad'])?></option><?php endforeach;?></select>
<label for="sinif">Sınıf</label><select class="role-input" id="sinif" name="sinif"><option value="0">Tüm sınıflar</option><?php for($g=1;$g<=8;$g++):?><option value="<?=$g?>" <?=$grade===$g?'selected':''?>><?=$g?>. sınıf</option><?php endfor;?></select>
<button class="role-button" type="submit">Öğrencileri Göster</button></form></section><?php endif;?>
<section class="role-section"><div class="role-section-head"><div><span class="eyeline">ÖĞRENCİLERİM</span><h2>Sonuçlar</h2></div><span class="role-pill"><?=count($students)?></span></div><div class="role-list">
<?php if(!$institutions):?><div class="role-empty">Henüz aktif bir kuruma öğretmen olarak bağlanmadın.</div>
<?php elseif(!$students):?><div class="role-empty">Bu filtrede sana bağlı öğrenci bulunamadı.</div><?php endif;?>
<?php foreach($students as $student):?>
<a class="role-row" href="ogrenci-raporu.php?id=<?=(int)$student['id']?>"><span>🎒</span><div><strong><?=to_h((string)($student['ad']?:$student['email']))?></strong><small><?=(int)$student['sinif_seviyesi']?>. sınıf · Raporu aç →</small></div><b>→</b></a>
<?php endforeach;?></div></section>
</main><nav class="role-bottom"><a href="ogretmen-paneli.php"><span>⌂</span>Panel</a><a class="active" href="ogretmen-ogrencilerim.php?kurum_id=<?=$institutionId?>"><span>🎒</span>Öğrenciler</a><a href="ogretmen-icerikleri.php"><span>⭐</span>İçeriklerim</a><a href="logout.php"><span>🚪</span>Çıkış</a></nav>
</div></body></html>
