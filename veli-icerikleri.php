<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/veli_icerikleri.php';

$user=require_role('veli');
$pdo=db();

function vi_h(string $value): string {
    return htmlspecialchars($value,ENT_QUOTES,'UTF-8');
}
function vi_type_label(string $type): string {
    return [
        'soru'=>'Soru',
        'tekrar'=>'Tekrar',
        'odev'=>'Ödev',
        'not'=>'Not',
        'diger'=>'Diğer',
    ][$type]??'Diğer';
}
function vi_type_icon(string $type): string {
    return [
        'soru'=>'❓',
        'tekrar'=>'🔁',
        'odev'=>'📝',
        'not'=>'💡',
        'diger'=>'📌',
    ][$type]??'📌';
}
function vi_date(?string $value): string {
    $value=trim((string)$value);
    if($value==='') return '—';
    try{return (new DateTimeImmutable($value))->format('d.m.Y H:i');}
    catch(Throwable){return '—';}
}

try{
    $children=vi_parent_children($pdo,(int)$user['id']);
}catch(Throwable $e){
    error_log('[IlkAdim][parent-content-children] '.$e->getMessage());
    http_response_code(503);
    echo 'Çocuk bilgileri şu anda okunamıyor.';
    exit;
}

$childIds=array_map('intval',array_column($children,'id'));
$childId=max(0,(int)($_GET['cocuk_id']??($childIds[0]??0)));
if(array_key_exists('cocuk_id',$_GET) && !in_array($childId,$childIds,true)){
    http_response_code(403);
    echo 'Bu öğrencinin öğretmen içeriklerine erişim yetkiniz yok.';
    exit;
}

$selectedChild=null;
foreach($children as $child){
    if((int)$child['id']===$childId){$selectedChild=$child;break;}
}

$institutions=[];
if($childId>0){
    try{
        $institutions=vi_parent_child_institutions($pdo,(int)$user['id'],$childId);
    }catch(Throwable $e){
        error_log('[IlkAdim][parent-content-institutions] '.$e->getMessage());
        http_response_code(503);
        echo 'Kurum bilgileri şu anda okunamıyor.';
        exit;
    }
}

$institutionIds=array_map('intval',array_column($institutions,'id'));
$institutionId=max(0,(int)($_GET['kurum_id']??0));
if($institutionId>0 && !in_array($institutionId,$institutionIds,true)){
    http_response_code(403);
    echo 'Bu kurum için öğretmen içeriklerine erişim yetkiniz yok.';
    exit;
}

$type=(string)($_GET['tur']??'tum');
$allowedTypes=['tum','soru','tekrar','odev','not','diger'];
if(!in_array($type,$allowedTypes,true)) $type='tum';

$contents=[];
if($childId>0){
    try{
        $contents=vi_parent_contents($pdo,(int)$user['id'],$childId,$institutionId,$type);
    }catch(Throwable $e){
        error_log('[IlkAdim][parent-content-list] '.$e->getMessage());
        http_response_code(503);
        echo 'Öğretmen içerikleri şu anda okunamıyor.';
        exit;
    }
}

$summary=vi_parent_summary($contents);
$questionRate=$summary['answered']>0?(int)round($summary['correct']*100/$summary['answered']):null;
$homeworkRate=$summary['homeworks']>0?(int)round($summary['completed']*100/$summary['homeworks']):null;
$reportInstitutionId=$institutionId>0?$institutionId:(count($institutions)===1?(int)$institutions[0]['id']:0);
?><!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Öğretmen İçerikleri — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="veli.css?v=1.0.42">
<link rel="stylesheet" href="veli-icerikleri.css?v=1.2.17">
</head>
<body class="role-page">
<div class="role-shell">
<header class="role-topbar">
<a class="role-icon" href="veli-paneli.php" aria-label="Veli paneline dön">←</a>
<span class="role-brand"><span>⭐</span><span><strong>Öğretmen İçerikleri</strong><small>VELİ ALANI</small></span></span>
<a class="role-icon" href="hesap-guvenligi.php">⚙️</a>
</header>

<main class="role-content parent-content-shell">
<section class="role-hero">
<span class="eyeline">ÇOCUK TAKİBİ</span>
<h1>Öğretmenin gönderdiği içerikleri izle.</h1>
<p>Soru, tekrar, ödev ve notları; çocuğunun cevap ve tamamlama durumuyla birlikte görüntüle.</p>
<span class="role-hero-art">⭐</span>
</section>

<?php if($children):?>
<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">FİLTRELER</span><h2>Çocuk, Kurum ve Tür</h2></div></div>
<form class="role-form parent-content-filter" method="get">
<label for="cocuk">Çocuğum</label>
<select class="role-input" name="cocuk_id" id="cocuk">
<?php foreach($children as $child):?>
<option value="<?=(int)$child['id']?>" <?=((int)$child['id']===$childId?'selected':'')?>><?=vi_h((string)($child['ad']?:$child['email']))?></option>
<?php endforeach;?>
</select>

<label for="kurum">Kurum</label>
<select class="role-input" name="kurum_id" id="kurum">
<option value="0">Tüm bağlı kurumlar</option>
<?php foreach($institutions as $institution):?>
<option value="<?=(int)$institution['id']?>" <?=((int)$institution['id']===$institutionId?'selected':'')?>><?=vi_h((string)$institution['ad'])?></option>
<?php endforeach;?>
</select>

<label for="tur">İçerik türü</label>
<select class="role-input" name="tur" id="tur">
<option value="tum" <?=$type==='tum'?'selected':''?>>Tüm içerikler</option>
<?php foreach(['soru','tekrar','odev','not','diger'] as $key):?>
<option value="<?=$key?>" <?=$type===$key?'selected':''?>><?=vi_h(vi_type_label($key))?></option>
<?php endforeach;?>
</select>
<button class="role-button" type="submit">İçerikleri Göster</button>
</form>
</section>
<?php endif;?>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">ÖZET</span><h2><?=vi_h((string)($selectedChild['ad']??'İçerik Durumu'))?></h2></div></div>
<div class="parent-content-stats">
<div class="role-stat"><span>📚</span><strong><?=$summary['all']?></strong><small>Aktif içerik</small></div>
<div class="role-stat"><span>❓</span><strong><?=$summary['answered']?> / <?=$summary['questions']?></strong><small>Yanıtlanan soru</small></div>
<div class="role-stat"><span>📈</span><strong><?=$questionRate!==null?$questionRate.'%':'—'?></strong><small>Soru doğruluğu</small></div>
<div class="role-stat"><span>📝</span><strong><?=$summary['completed']?> / <?=$summary['homeworks']?></strong><small>Tamamlanan ödev</small></div>
<div class="role-stat"><span>✅</span><strong><?=$homeworkRate!==null?$homeworkRate.'%':'—'?></strong><small>Ödev tamamlama</small></div>
<div class="role-stat"><span>⏰</span><strong><?=$summary['overdue']?></strong><small>Geciken ödev</small></div>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">YAYINLAR</span><h2>Öğretmen İçerikleri</h2></div><span class="role-pill"><?=count($contents)?></span></div>
<div class="parent-content-list">
<?php if(!$children):?>
<div class="role-empty"><span>🎒</span>Henüz kurum kapsamında bağlı öğrenci bulunmuyor.</div>
<?php elseif(!$contents):?>
<div class="role-empty"><span>⭐</span>Bu filtrede aktif öğretmen içeriği bulunamadı.</div>
<?php endif;?>

<?php foreach($contents as $item):
    $itemType=(string)$item['icerik_turu'];
    $status='Yayınlandı';
    $statusClass='';
    $detail='';

    if($itemType==='soru'){
        if($item['secilen_cevap_indeksi']===null){
            $status='Bekliyor';
            $detail='Henüz cevap vermedi.';
        }elseif((int)$item['cevap_dogru']===1){
            $status='Doğru';
            $statusClass='ok';
            $detail=(int)($item['deneme_sayisi']??1).' deneme · '.vi_date((string)($item['cevap_tarihi']??''));
        }else{
            $status='Yanlış';
            $statusClass='warn';
            $detail=(int)($item['deneme_sayisi']??1).' deneme · '.vi_date((string)($item['cevap_tarihi']??''));
        }
    }elseif($itemType==='odev'){
        $done=(int)($item['odev_tamamlandi']??0)===1;
        $late=false;
        if(!$done && !empty($item['teslim_tarihi'])){
            try{$late=(new DateTimeImmutable((string)$item['teslim_tarihi']))<new DateTimeImmutable('now');}catch(Throwable){}
        }
        if($done){
            $status='Tamamlandı';
            $statusClass='ok';
            $detail='Tamamlanma: '.vi_date((string)($item['tamamlanma_tarihi']??''));
        }elseif($late){
            $status='Gecikti';
            $statusClass='warn';
            $detail='Teslim: '.vi_date((string)$item['teslim_tarihi']);
        }else{
            $status='Bekliyor';
            $detail='Teslim: '.vi_date((string)($item['teslim_tarihi']??''));
        }
    }else{
        $detail='Yayın: '.vi_date((string)$item['olusturulma_tarihi']);
    }
?>
<article class="parent-content-card">
<div class="parent-content-head">
<span class="parent-content-icon"><?=vi_type_icon($itemType)?></span>
<div>
<div class="parent-content-badges">
<span class="role-pill"><?=vi_h(vi_type_label($itemType))?></span>
<span class="parent-content-status <?=$statusClass?>"><?=vi_h($status)?></span>
</div>
<h3><?=vi_h((string)$item['baslik'])?></h3>
<small><?=vi_h((string)$item['kurum_adi'])?> · <?=vi_h((string)$item['ders_adi'])?> / <?=vi_h((string)$item['konu_adi'])?> · <?=vi_h((string)$item['ogretmen_adi'])?></small>
</div>
</div>

<?php
$preview=trim((string)($itemType==='soru'?$item['soru']:$item['icerik_metni']));
if($preview!==''):
?>
<p class="parent-content-preview"><?=nl2br(vi_h($preview))?></p>
<?php endif;?>

<div class="parent-content-meta">
<span>🗓️ <?=vi_h(vi_date((string)$item['olusturulma_tarihi']))?></span>
<?php if($detail!==''):?><span>📌 <?=vi_h($detail)?></span><?php endif;?>
</div>
</article>
<?php endforeach;?>
</div>
</section>

<?php if($selectedChild):?>
<div class="parent-content-actions">
<a class="button soft full" href="ogrenci-raporu.php?id=<?=$childId?><?=$reportInstitutionId>0?'&amp;kurum_id='.$reportInstitutionId:''?>">📊 Çocuğumun Raporunu Aç</a>
<a class="button soft full" href="veli-odevleri.php?cocuk_id=<?=$childId?>">📝 Yalnız Ödevleri Aç</a>
</div>
<?php endif;?>

<div class="role-note"><span>ℹ️</span><p>Bu ekran salt okunurdur. Soru cevaplama ve ödev tamamlama işlemleri öğrencinin kendi hesabından yapılır. Veli yalnız kendi kurum eşleştirmesi bulunan çocuğun içeriklerini görebilir.</p></div>
</main>

<nav class="role-bottom">
<a href="veli-paneli.php"><span>⌂</span>Panel</a>
<a href="veli-paneli.php#cocuklar"><span>🎒</span>Çocuklar</a>
<a class="active" href="veli-icerikleri.php"><span>⭐</span>İçerikler</a>
<a href="hesap-guvenligi.php"><span>⚙️</span>Hesap</a>
</nav>
</div>
</body>
</html>
