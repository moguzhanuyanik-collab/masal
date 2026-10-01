<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/veli_icerikleri.php';
require __DIR__.'/src/odev_durumu.php';

$user=require_role('veli');
$pdo=db();

function vo_h(string $value): string {
    return htmlspecialchars($value,ENT_QUOTES,'UTF-8');
}
function vo_date(?string $value,string $empty='Süre yok'): string {
    $value=trim((string)$value);
    if($value==='') return $empty;
    try{return (new DateTimeImmutable($value))->format('d.m.Y H:i');}
    catch(Throwable){return $empty;}
}

try{
    $accessibleChildIds=auth_accessible_student_ids($pdo,(int)$user['id']);
    $children=[];
    if($accessibleChildIds!==[]){
        $placeholders=implode(',',array_fill(0,count($accessibleChildIds),'?'));
        $stmt=$pdo->prepare("SELECT o.id,o.ad,o.email,o.sinif_seviyesi
            FROM ogrenciler o
            INNER JOIN kullanicilar su ON su.id=o.kullanici_id AND su.aktif=1
            WHERE o.aktif=1 AND o.id IN ({$placeholders})
            ORDER BY o.ad,o.id");
        $stmt->execute($accessibleChildIds);
        $children=$stmt->fetchAll();
        $stmt->closeCursor();
    }
}catch(Throwable){
    http_response_code(503);
    echo 'Çocuk bilgileri şu anda okunamıyor.';
    exit;
}

$childIds=array_map('intval',array_column($children,'id'));
$childId=max(0,(int)($_GET['cocuk_id']??($childIds[0]??0)));
if(array_key_exists('cocuk_id',$_GET) && !in_array($childId,$childIds,true)){
    http_response_code(403);
    echo 'Bu öğrencinin ödevlerine erişim yetkiniz yok.';
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
    }catch(Throwable){
        http_response_code(503);
        echo 'Kurum bilgileri şu anda okunamıyor.';
        exit;
    }
}
$institutionIds=array_map('intval',array_column($institutions,'id'));
$institutionId=max(0,(int)($_GET['kurum_id']??0));
if($institutionId>0 && !in_array($institutionId,$institutionIds,true)){
    http_response_code(403);
    echo 'Bu kurum için çocuğunuzun ödevlerini görüntüleme yetkiniz yok.';
    exit;
}

$status=(string)($_GET['durum']??'tum');
if(!in_array($status,['tum','pending','overdue','completed'],true)) $status='tum';

$allHomeworks=[];
if($childId>0){
    try{
        $allHomeworks=vi_parent_contents($pdo,(int)$user['id'],$childId,$institutionId,'odev');
    }catch(Throwable){
        http_response_code(503);
        echo 'Ödevler şu anda okunamıyor.';
        exit;
    }
}
$summary=hw_summary($allHomeworks);
$homeworks=$status==='tum'?$allHomeworks:hw_filter($allHomeworks,$status);
?><!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Çocuğumun Ödevleri — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="veli.css?v=1.0.42">
<link rel="stylesheet" href="veli-odevleri.css?v=1.2.21">
</head>
<body class="role-page">
<div class="role-shell">
<header class="role-topbar">
<a class="role-icon" href="veli-paneli.php" aria-label="Veli paneline dön">←</a>
<span class="role-brand"><span>📝</span><span><strong>Ödevler</strong><small>VELİ ALANI</small></span></span>
</header>

<main class="role-content parent-homework-shell">
<section class="role-hero">
<span class="eyeline">ÇOCUĞUMUN ÖDEVLERİ</span>
<h1>Yayınlanan Çalışmalar</h1>
<p>Ödevleri kurum ve teslim durumuna göre takip et; geciken çalışmaları ayrı gör.</p>
<span class="role-hero-art">📝</span>
</section>

<?php if($children):?>
<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">FİLTRELER</span><h2>Çocuk, Kurum ve Durum</h2></div></div>
<form method="get" class="role-form parent-homework-filter">
<label for="cocuk">Çocuğum</label>
<select class="role-input" name="cocuk_id" id="cocuk">
<?php foreach($children as $child):?>
<option value="<?=(int)$child['id']?>" <?=((int)$child['id']===$childId?'selected':'')?>><?=vo_h((string)($child['ad']?:$child['email']))?></option>
<?php endforeach;?>
</select>

<label for="kurum">Kurum</label>
<select class="role-input" name="kurum_id" id="kurum">
<option value="0">Tüm yetkili kurumlar</option>
<?php foreach($institutions as $institution):?>
<option value="<?=(int)$institution['id']?>" <?=((int)$institution['id']===$institutionId?'selected':'')?>><?=vo_h((string)$institution['ad'])?></option>
<?php endforeach;?>
</select>

<label for="durum">Teslim durumu</label>
<select class="role-input" name="durum" id="durum">
<option value="tum" <?=$status==='tum'?'selected':''?>>Tümü</option>
<option value="pending" <?=$status==='pending'?'selected':''?>>Bekliyor</option>
<option value="overdue" <?=$status==='overdue'?'selected':''?>>Gecikti</option>
<option value="completed" <?=$status==='completed'?'selected':''?>>Tamamlandı</option>
</select>
<button class="role-button" type="submit">Ödevleri Göster</button>
</form>
</section>
<?php endif;?>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">TESLİM ÖZETİ</span><h2><?=vo_h((string)($selectedChild['ad']??'Ödevler'))?></h2></div></div>
<div class="parent-homework-stats">
<div class="role-stat"><span>📝</span><strong><?=$summary['total']?></strong><small>Toplam ödev</small></div>
<div class="role-stat"><span>⏳</span><strong><?=$summary['pending']?></strong><small>Bekliyor</small></div>
<div class="role-stat"><span>⏰</span><strong><?=$summary['overdue']?></strong><small>Gecikti</small></div>
<div class="role-stat"><span>✅</span><strong><?=$summary['completed']?></strong><small>Tamamlandı</small></div>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">ÖDEVLER</span><h2>Liste</h2></div><span class="role-pill"><?=count($homeworks)?></span></div>
<div class="parent-homework-list">
<?php if(!$children):?><div class="role-empty">Henüz hesabına öğrenci eşleştirilmedi.</div>
<?php elseif(!$homeworks):?><div class="role-empty">Bu filtrede ödev bulunamadı.</div><?php endif;?>

<?php foreach($homeworks as $homework):
    $itemStatus=hw_status($homework);
    $statusClass=$itemStatus==='completed'?'ok':($itemStatus==='overdue'?'warn':'off');
?>
<article class="parent-homework-card <?=$itemStatus?>">
<div class="parent-homework-head">
<span class="parent-homework-icon"><?=hw_status_icon($itemStatus)?></span>
<div>
<strong><?=vo_h((string)$homework['baslik'])?></strong>
<small><?=vo_h((string)$homework['kurum_adi'])?> · <?=vo_h((string)$homework['ders_adi'])?> · <?=vo_h((string)$homework['ogretmen_adi'])?></small>
</div>
<span class="role-pill <?=$statusClass?>"><?=vo_h(hw_status_label($itemStatus))?></span>
</div>
<?php if(trim((string)$homework['icerik_metni'])!==''):?><p><?=nl2br(vo_h((string)$homework['icerik_metni']))?></p><?php endif;?>
<div class="parent-homework-meta">
<span>⏰ Teslim: <?=vo_h(vo_date($homework['teslim_tarihi']??null))?></span>
<?php if($itemStatus==='completed' && !empty($homework['tamamlanma_tarihi'])):?><span>✅ Tamamlandı: <?=vo_h(vo_date((string)$homework['tamamlanma_tarihi'],'—'))?></span><?php endif;?>
<?php if($itemStatus==='overdue'):?><span>⚠️ Teslim tarihi geçti</span><?php endif;?>
</div>
</article>
<?php endforeach;?>
</div>
</section>

<div class="role-note"><span>ℹ️</span><p>“Gecikti” durumu teslim tarihi geçmiş ve öğrenci tarafından tamamlandı olarak işaretlenmemiş ödevleri gösterir. Tamamlama işlemi yalnız öğrencinin kendi hesabından yapılır.</p></div>
</main>

<nav class="role-bottom">
<a href="veli-paneli.php"><span>⌂</span>Panel</a>
<a href="veli-paneli.php#cocuklar"><span>🎒</span>Çocuklar</a>
<a class="active" href="veli-odevleri.php"><span>📝</span>Ödevler</a>
<a href="hesap-guvenligi.php"><span>⚙️</span>Hesap</a>
</nav>
</div>
</body>
</html>
