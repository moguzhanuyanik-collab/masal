<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/kurum_yonetimi.php';
require __DIR__.'/src/yonetici_yetkileri.php';
require __DIR__.'/src/kurum_icerik_dashboard.php';

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
$publication=(string)($_GET['durum']??'tum');
$performance=(string)($_GET['performans']??'tum');
$teacherId=(int)($_GET['ogretmen_id']??0);
$allowedTypes=['tum','soru','tekrar','odev','not','diger'];
if(!in_array($type,$allowedTypes,true)) $type='tum';
if(!in_array($publication,['tum','aktif','pasif'],true)) $publication='tum';
if(!in_array($performance,['tum','attention','waiting','completed','no_target','info'],true)) $performance='tum';

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

try{
    $allContents=kic_contents($pdo,$institutionId,$teacherId,$type,$publication);
    $contents=kic_filter_performance($allContents,$performance);
    $stats=kic_summary($contents);
}catch(Throwable $e){
    error_log('[IlkAdim][institution-content-dashboard] '.$e->getMessage());
    http_response_code(503);
    echo 'Kurum içerik performansı şu anda okunamıyor.';
    exit;
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
<link rel="stylesheet" href="kurum-icerikleri.css?v=1.2.16">
<link rel="stylesheet" href="kurum-icerikleri-dashboard.css?v=1.2.28">
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
<div class="role-stats content-stats institution-performance-stats">
<div class="role-stat"><span>📚</span><strong><?=$stats['total']?></strong><small>Filtredeki içerik</small></div>
<div class="role-stat"><span>✅</span><strong><?=$stats['active']?></strong><small>Aktif yayın</small></div>
<div class="role-stat"><span>🎯</span><strong><?=$stats['target_assignments']?></strong><small>Toplam hedef atama</small></div>
<div class="role-stat"><span>⚠️</span><strong><?=$stats['attention_contents']?></strong><small>Dikkat gereken yayın</small></div>
<div class="role-stat"><span>❌</span><strong><?=$stats['question_wrong']?></strong><small>Yanlış öğrenci cevabı</small></div>
<div class="role-stat"><span>⏰</span><strong><?=$stats['homework_overdue']?></strong><small>Geciken öğrenci ödevi</small></div>
<div class="role-stat"><span>📈</span><strong><?=$stats['question_accuracy']?>%</strong><small>Soru doğruluğu</small></div>
<div class="role-stat"><span>📝</span><strong><?=$stats['homework_completion']?>%</strong><small>Ödev tamamlama</small></div>
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
<option value="tum" <?=$publication==='tum'?'selected':''?>>Tümü</option>
<option value="aktif" <?=$publication==='aktif'?'selected':''?>>Aktif</option>
<option value="pasif" <?=$publication==='pasif'?'selected':''?>>Pasif</option>
</select>
<label for="performans">Performans durumu</label>
<select class="role-input" id="performans" name="performans">
<option value="tum" <?=$performance==='tum'?'selected':''?>>Tümü</option>
<option value="attention" <?=$performance==='attention'?'selected':''?>>Dikkat gerekiyor</option>
<option value="waiting" <?=$performance==='waiting'?'selected':''?>>Bekliyor</option>
<option value="completed" <?=$performance==='completed'?'selected':''?>>Tümü tamamlandı</option>
<option value="no_target" <?=$performance==='no_target'?'selected':''?>>Hedef öğrenci yok</option>
<option value="info" <?=$performance==='info'?'selected':''?>>Bilgi içerikleri</option>
</select>
<button class="role-button" type="submit">İçerikleri Göster</button>
</form>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">YAYINLAR</span><h2>Kurum Öğretmen İçerikleri</h2></div><span class="role-pill"><?=$stats['total']?></span></div>
<div class="institution-content-list">
<?php if(!$contents):?>
<div class="role-empty"><span>📚</span>Bu filtrede öğretmen içeriği bulunamadı.</div>
<?php else:foreach($contents as $item):
    $contentText=trim((string)($item['icerik_turu']==='soru'?$item['soru']:$item['icerik_metni']));
?>
<article class="institution-content-card">
<div class="institution-content-head">
<span class="institution-content-icon"><?=ki_type_icon((string)$item['icerik_turu'])?></span>
<div>
<div class="institution-content-badges">
<span class="role-pill"><?=ki_h(ki_type_label((string)$item['icerik_turu']))?></span>
<span class="role-pill <?=((int)$item['aktif']===1?'ok':'off')?>"><?=((int)$item['aktif']===1?'Aktif':'Pasif')?></span>
<span class="institution-performance-badge <?=ki_h((string)$item['performans_durumu'])?>"><?=ki_h(kic_performance_label((string)$item['performans_durumu']))?></span>
</div>
<h3><?=ki_h((string)$item['baslik'])?></h3>
<small><?=ki_h((string)$item['ogretmen_adi'])?> · <?=ki_h((string)$item['ders_adi'])?> / <?=ki_h((string)$item['konu_adi'])?></small>
</div>
</div>

<?php if($contentText!==''):?><p class="institution-content-preview"><?=nl2br(ki_h($contentText))?></p><?php endif;?>

<div class="institution-content-meta">
<a class="institution-content-detail-link" href="kurum-icerik-detay.php?kurum_id=<?=$institutionId?>&amp;id=<?=(int)$item['id']?>">Detay</a>
<span>🎯 <?=(int)$item['hedef_sayisi']?> hedef</span>
<?php if((string)$item['icerik_turu']==='soru'):?>
<span>💬 <?=(int)$item['cevaplayan_sayisi']?> cevap</span>
<span>✅ <?=(int)$item['dogru_sayisi']?> doğru</span>
<span>❌ <?=(int)$item['yanlis_sayisi']?> yanlış</span>
<span>⏳ <?=(int)$item['bekleyen_sayisi']?> bekleyen</span>
<span>📈 %<?=(int)$item['performans_orani']?> doğruluk</span>
<?php elseif((string)$item['icerik_turu']==='odev'):?>
<span>✅ <?=(int)$item['tamamlayan_sayisi']?> tamamladı</span>
<span>⏰ <?=(int)$item['geciken_sayisi']?> gecikti</span>
<span>⏳ <?=(int)$item['bekleyen_sayisi']?> bekleyen</span>
<span>📈 %<?=(int)$item['performans_orani']?> tamamlama</span>
<span>📅 <?=!empty($item['teslim_tarihi'])?ki_h(date('d.m.Y H:i',strtotime((string)$item['teslim_tarihi']))):'Süre yok'?></span>
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
