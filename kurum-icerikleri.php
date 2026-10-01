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
    if(!yy_can($pdo,$user,'kurum_goruntule')) throw new RuntimeException('Kurum görüntüleme izni yok.');
}catch(Throwable){
    http_response_code(403);
    echo 'Bu kurumun içeriklerini görüntüleme yetkin yok.';
    exit;
}

function ki_h(string $value): string {
    return htmlspecialchars($value,ENT_QUOTES,'UTF-8');
}
function ki_type_label(string $type): string {
    return [
        'soru'=>'Soru',
        'tekrar'=>'Tekrar',
        'odev'=>'Ödev',
        'not'=>'Not',
        'diger'=>'Diğer',
    ][$type]??'Diğer';
}
function ki_type_icon(string $type): string {
    return [
        'soru'=>'❓',
        'tekrar'=>'🔁',
        'odev'=>'📝',
        'not'=>'💡',
        'diger'=>'📌',
    ][$type]??'📌';
}

$type=(string)($_GET['tur']??'tum');
$status=(string)($_GET['durum']??'tum');
$teacherId=(int)($_GET['ogretmen_id']??0);
$allowedTypes=['tum','soru','tekrar','odev','not','diger'];
if(!in_array($type,$allowedTypes,true)) $type='tum';
if(!in_array($status,['tum','aktif','pasif'],true)) $status='tum';

try{
    $teacherStmt=$pdo->prepare("SELECT DISTINCT og.id,
        COALESCE(NULLIF(TRIM(og.ad_soyad),''),u.ad_soyad) ad_soyad
        FROM kurum_kullanicilari kk
        INNER JOIN kullanicilar u ON u.id=kk.kullanici_id AND u.aktif=1
        INNER JOIN ogretmenler og ON og.kullanici_id=u.id AND og.aktif=1
        WHERE kk.kurum_id=? AND kk.kurum_rolu='ogretmen' AND kk.aktif=1
        ORDER BY ad_soyad,og.id");
    $teacherStmt->execute([$institutionId]);
    $teachers=$teacherStmt->fetchAll();
    $teacherStmt->closeCursor();
}catch(Throwable){
    http_response_code(503);
    echo 'Kurum öğretmenleri şu anda okunamıyor.';
    exit;
}

$teacherIds=array_map('intval',array_column($teachers,'id'));
if($teacherId>0 && !in_array($teacherId,$teacherIds,true)) $teacherId=0;

$where=["oi.kurum_id=?"];
$params=[$institutionId];
if($teacherId>0){$where[]='oi.ogretmen_id=?';$params[]=$teacherId;}
if($type!=='tum'){$where[]='oi.icerik_turu=?';$params[]=$type;}
if($status!=='tum'){$where[]='oi.aktif=?';$params[]=$status==='aktif'?1:0;}

$sql="SELECT oi.id,oi.ogretmen_id,oi.ders_id,oi.ders_modulu_id,oi.konu_basligi,
    oi.icerik_turu,oi.baslik,oi.icerik_metni,oi.soru,oi.hedef_turu,oi.teslim_tarihi,
    oi.aktif,oi.olusturulma_tarihi,
    COALESCE(NULLIF(TRIM(og.ad_soyad),''),u.ad_soyad) ogretmen_adi,
    d.ad ders_adi,d.emoji ders_emoji,
    COALESCE(dm.baslik,oi.konu_basligi,'Genel') konu_adi,
    COUNT(DISTINCT h.ogrenci_id) secili_hedef_sayisi,
    COUNT(DISTINCT c.ogrenci_id) cevap_ogrenci_sayisi,
    COUNT(DISTINCT CASE WHEN c.dogru=1 THEN c.ogrenci_id END) dogru_ogrenci_sayisi,
    COUNT(DISTINCT CASE WHEN od.tamamlandi=1 THEN od.ogrenci_id END) tamamlayan_ogrenci_sayisi,
    (
      SELECT COUNT(DISTINCT oo.ogrenci_id)
      FROM ogretmen_ogrenci oo
      INNER JOIN ogrenciler os ON os.id=oo.ogrenci_id AND os.aktif=1
      INNER JOIN kullanicilar su ON su.id=os.kullanici_id AND su.aktif=1
      INNER JOIN kurum_kullanicilari sk ON sk.kullanici_id=su.id
        AND sk.kurum_id=oi.kurum_id AND sk.kurum_rolu='ogrenci' AND sk.aktif=1
      WHERE oo.ogretmen_id=oi.ogretmen_id AND oo.kurum_id=oi.kurum_id
    ) bagli_ogrenci_sayisi
    FROM ogretmen_icerikleri oi
    INNER JOIN ogretmenler og ON og.id=oi.ogretmen_id AND og.aktif=1
    INNER JOIN kullanicilar u ON u.id=og.kullanici_id AND u.aktif=1
    INNER JOIN kurum_kullanicilari tk ON tk.kullanici_id=u.id
      AND tk.kurum_id=oi.kurum_id AND tk.kurum_rolu='ogretmen' AND tk.aktif=1
    INNER JOIN dersler d ON d.id=oi.ders_id
    LEFT JOIN ders_modulleri dm ON dm.id=oi.ders_modulu_id
    LEFT JOIN ogretmen_icerik_hedefleri h ON h.icerik_id=oi.id
    LEFT JOIN ogretmen_icerik_cevaplari c ON c.icerik_id=oi.id
    LEFT JOIN ogrenci_odev_durumlari od ON od.icerik_id=oi.id
    WHERE ".implode(' AND ',$where)."
    GROUP BY oi.id,oi.ogretmen_id,oi.ders_id,oi.ders_modulu_id,oi.konu_basligi,
      oi.icerik_turu,oi.baslik,oi.icerik_metni,oi.soru,oi.hedef_turu,oi.teslim_tarihi,
      oi.aktif,oi.olusturulma_tarihi,og.ad_soyad,u.ad_soyad,d.ad,d.emoji,dm.baslik
    ORDER BY oi.aktif DESC,oi.olusturulma_tarihi DESC,oi.id DESC";

try{
    $stmt=$pdo->prepare($sql);
    $stmt->execute($params);
    $contents=$stmt->fetchAll();
    $stmt->closeCursor();
}catch(Throwable $e){
    error_log('[IlkAdim][institution-content] '.$e->getMessage());
    http_response_code(503);
    echo 'Kurum içerikleri şu anda okunamıyor.';
    exit;
}

$stats=['all'=>count($contents),'active'=>0,'questions'=>0,'homeworks'=>0,'answers'=>0,'completed'=>0];
foreach($contents as $item){
    if((int)$item['aktif']===1)$stats['active']++;
    if((string)$item['icerik_turu']==='soru'){
        $stats['questions']++;
        $stats['answers']+=(int)$item['cevap_ogrenci_sayisi'];
    }
    if((string)$item['icerik_turu']==='odev'){
        $stats['homeworks']++;
        $stats['completed']+=(int)$item['tamamlayan_ogrenci_sayisi'];
    }
}

$isSuper=auth_user_has_role($user,'super_admin');
$back=$isSuper?'kurum-detay.php?kurum_id='.$institutionId:'yonetici-paneli.php?kurum_id='.$institutionId;
?><!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Kurum İçerikleri — <?=ki_h((string)$institution['ad'])?></title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="kurum.css?v=1.2.8">
<link rel="stylesheet" href="kurum-icerikleri.css?v=1.2.8">
</head>
<body class="role-page"><div class="role-shell">
<header class="role-topbar">
<a class="role-icon" href="<?=ki_h($back)?>" aria-label="Geri">←</a>
<span class="role-brand"><span>📚</span><span><strong>Kurum İçerikleri</strong><small><?=ki_h((string)$institution['ad'])?></small></span></span>
<a class="role-icon" href="hesap-guvenligi.php" aria-label="Hesap">⚙️</a>
</header>

<main class="role-content institution-content-shell">
<section class="role-hero">
<span class="eyeline">DERSLER / İÇERİKLER</span>
<h1>Öğretmen yayınlarını tek yerde izle.</h1>
<p><?=ki_h((string)$institution['ad'])?> · Aktif öğretmenlerin soru, tekrar, ödev ve not yayınlarını kurum seviyesinde görüntüle.</p>
<span class="role-hero-art">📚</span>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">ÖZET</span><h2>İçerik Durumu</h2></div></div>
<div class="role-stats content-stats">
<div class="role-stat"><span>📚</span><strong><?=$stats['all']?></strong><small>Filtredeki içerik</small></div>
<div class="role-stat"><span>✅</span><strong><?=$stats['active']?></strong><small>Aktif yayın</small></div>
<div class="role-stat"><span>❓</span><strong><?=$stats['questions']?></strong><small>Soru · <?=$stats['answers']?> öğrenci cevabı</small></div>
<div class="role-stat"><span>📝</span><strong><?=$stats['homeworks']?></strong><small>Ödev · <?=$stats['completed']?> tamamlama</small></div>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">FİLTRELER</span><h2>İçerikleri Daralt</h2></div></div>
<form class="role-form content-filter" method="get">
<input type="hidden" name="kurum_id" value="<?=$institutionId?>">
<label for="ogretmen">Öğretmen</label>
<select class="role-input" id="ogretmen" name="ogretmen_id">
<option value="0">Tüm öğretmenler</option>
<?php foreach($teachers as $teacher):?>
<option value="<?=(int)$teacher['id']?>" <?=((int)$teacher['id']===$teacherId?'selected':'')?>><?=ki_h((string)$teacher['ad_soyad'])?></option>
<?php endforeach;?>
</select>
<label for="tur">İçerik türü</label>
<select class="role-input" id="tur" name="tur">
<option value="tum" <?=$type==='tum'?'selected':''?>>Tüm türler</option>
<?php foreach(['soru','tekrar','odev','not','diger'] as $key):?>
<option value="<?=$key?>" <?=$type===$key?'selected':''?>><?=ki_h(ki_type_label($key))?></option>
<?php endforeach;?>
</select>
<label for="durum">Yayın durumu</label>
<select class="role-input" id="durum" name="durum">
<option value="tum" <?=$status==='tum'?'selected':''?>>Tümü</option>
<option value="aktif" <?=$status==='aktif'?'selected':''?>>Aktif</option>
<option value="pasif" <?=$status==='pasif'?'selected':''?>>Pasif</option>
</select>
<button class="role-button" type="submit">İçerikleri Göster</button>
</form>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">YAYINLAR</span><h2>Kurum Öğretmen İçerikleri</h2></div><span class="role-pill"><?=$stats['all']?></span></div>
<div class="institution-content-list">
<?php if(!$contents):?>
<div class="role-empty"><span>📚</span>Bu filtrede öğretmen içeriği bulunamadı.</div>
<?php else:foreach($contents as $item):
    $targetCount=(string)$item['hedef_turu']==='tum_ogrenciler'?(int)$item['bagli_ogrenci_sayisi']:(int)$item['secili_hedef_sayisi'];
    $contentText=trim((string)($item['icerik_turu']==='soru'?$item['soru']:$item['icerik_metni']));
?>
<article class="institution-content-card">
<div class="institution-content-head">
<span class="institution-content-icon"><?=ki_type_icon((string)$item['icerik_turu'])?></span>
<div>
<div class="institution-content-badges">
<span class="role-pill"><?=ki_h(ki_type_label((string)$item['icerik_turu']))?></span>
<span class="role-pill <?=((int)$item['aktif']===1?'ok':'off')?>"><?=((int)$item['aktif']===1?'Aktif':'Pasif')?></span>
</div>
<h3><?=ki_h((string)$item['baslik'])?></h3>
<small><?=ki_h((string)$item['ogretmen_adi'])?> · <?=ki_h((string)$item['ders_adi'])?> / <?=ki_h((string)$item['konu_adi'])?></small>
</div>
</div>

<?php if($contentText!==''):?><p class="institution-content-preview"><?=nl2br(ki_h($contentText))?></p><?php endif;?>

<div class="institution-content-meta">
<span>🎯 <?=$targetCount?> hedef öğrenci</span>
<?php if((string)$item['icerik_turu']==='soru'):?>
<span>💬 <?=(int)$item['cevap_ogrenci_sayisi']?> cevap</span>
<span>✅ <?=(int)$item['dogru_ogrenci_sayisi']?> doğru</span>
<?php elseif((string)$item['icerik_turu']==='odev'):?>
<span>✅ <?=(int)$item['tamamlayan_ogrenci_sayisi']?> tamamladı</span>
<span>⏰ <?=!empty($item['teslim_tarihi'])?ki_h(date('d.m.Y H:i',strtotime((string)$item['teslim_tarihi']))):'Süre yok'?></span>
<?php endif;?>
<span>🗓️ <?=ki_h(date('d.m.Y H:i',strtotime((string)$item['olusturulma_tarihi'])))?></span>
</div>
</article>
<?php endforeach;endif;?>
</div>
</section>

<div class="role-note"><span>ℹ️</span><p>Bu ekran kurum içeriğini denetlemek için salt okunurdur. Yayın oluşturma ve aktif/pasif değiştirme işlemleri ilgili öğretmenin İçeriklerim ekranından yapılır.</p></div>
</main>

<nav class="role-bottom">
<a href="kurum-detay.php?kurum_id=<?=$institutionId?>"><span>⌂</span>Kurum</a>
<a class="active" href="kurum-icerikleri.php?kurum_id=<?=$institutionId?>"><span>📚</span>İçerikler</a>
<a href="kurum-siniflari.php?kurum_id=<?=$institutionId?>"><span>🏷️</span>Sınıflar</a>
<a href="kurum-raporlari.php?kurum_id=<?=$institutionId?>"><span>📊</span>Raporlar</a>
</nav>
</div></body></html>
