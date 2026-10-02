<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/ticari_mutabakat_hedef_risk_saglik.php';

$user=require_role('super_admin');
$pdo=db();
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');

function mrhh(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
function mrhp(float|int $value): string { return number_format((float)$value,1,',','.').'%'; }
function mrht(?float $minutes): string {
    if($minutes===null) return '—';
    if($minutes<60) return number_format($minutes,0,',','.').' dk';
    if($minutes<1440) return number_format($minutes/60,1,',','.').' sa';
    return number_format($minutes/1440,1,',','.').' gün';
}

$ready=mrh_tables_ready($pdo);
$days=mrh_window_days($_GET['days']??30);
$filters=[
    'days'=>$days,
    'signal'=>(string)($_GET['signal']??''),
    'read'=>(string)($_GET['read']??''),
    'state'=>(string)($_GET['state']??''),
    'owner_id'=>(int)($_GET['owner_id']??0),
];

$summary=$ready?mrh_summary($pdo,$days):[];
$owners=$ready?mrh_owner_rows($pdo,$days):[];
$policies=$ready?mrh_policy_rows($pdo,$days):[];
$ownerOptions=$ready?mrh_owner_options($pdo,$days):[];
$rows=$ready?mrh_rows($pdo,$filters,1200):[];
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Hedef Risk Bildirim Sağlığı — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="ticari-mutabakat-hedef-risk-saglik.css?v=1.2.70">
</head>
<body class="role-page sa-subpage">
<?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Hedef Risk Bildirim Sağlığı</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="ticari-mutabakat-hedef-risk-bildirim.php" aria-label="Hedef Risk Bildirimleri"><svg><use href="#sa-bell"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-hedef-risk.php" aria-label="Hedef Risk Kuyruğu"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-performans.php" aria-label="Performans"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>

<main class="role-content">
<section class="role-hero">
<span class="eyeline">BİLDİRİM SAĞLIĞI</span>
<h1>Hedef Risk Müdahale Dashboardu</h1>
<p>%75+ ve hedef dışı mutabakat sinyallerinin okunma durumunu, güncel açık döngüde devam eden vakaları, sorumlu yoğunluğunu ve tarihsel politika dağılımını salt-okunur olarak izle.</p>
<span class="role-hero-art">📨</span>
</section>

<div class="role-note"><span>ℹ️</span><p>Bu ekran bildirim göndermez. Gönderim 1.2.69 Hedef Risk Bildirimleri merkezinde açık POST + CSRF işlemiyle yapılır. Eski reopen döngülerine ait bildirimler tarihsel geçmiş olarak korunur ve bugünkü açık vaka KPI'larına katılmaz.</p></div>

<?php if(!$ready):?>
<div class="role-note"><span>⚠️</span><p>Hedef-risk bildirim, vaka, politika veya merkezi bildirim tabloları hazır değil.</p></div>
<?php else:?>

<form class="mrh-window" method="get">
<label>Dönem
<select name="days">
<?php foreach([7,30,90,180,365] as $option):?><option value="<?=$option?>" <?=$days===$option?'selected':''?>>Son <?=$option?> gün</option><?php endforeach;?>
</select>
</label>
<input type="hidden" name="signal" value="<?=mrhh((string)$filters['signal'])?>">
<input type="hidden" name="read" value="<?=mrhh((string)$filters['read'])?>">
<input type="hidden" name="state" value="<?=mrhh((string)$filters['state'])?>">
<input type="hidden" name="owner_id" value="<?=(int)$filters['owner_id']?>">
<button type="submit">Dönemi Uygula</button>
</form>

<section class="mrh-summary">
<div><strong><?=(int)($summary['total']??0)?></strong><span>Toplam bildirim</span></div>
<a href="?days=<?=$days?>&read=okundu"><strong><?=(int)($summary['read']??0)?></strong><span>Okundu · <?=mrhp((float)($summary['read_rate']??0))?></span></a>
<a href="?days=<?=$days?>&read=okunmadi"><strong><?=(int)($summary['unread']??0)?></strong><span>Okunmadı</span></a>
<a href="?days=<?=$days?>&state=guncel_acik"><strong><?=(int)($summary['current_open']??0)?></strong><span>Güncel döngü hâlâ açık</span></a>
<a href="?days=<?=$days?>&state=guncel_acik_okunmadi"><strong><?=(int)($summary['current_open_unread']??0)?></strong><span>Açık + okunmadı</span></a>
<a href="?days=<?=$days?>&state=guncel_hedef_disinda"><strong><?=(int)($summary['current_outside_open']??0)?></strong><span>Hedef dışı + açık</span></a>
<div><strong><?=mrht(isset($summary['avg_read_minutes'])?(float)$summary['avg_read_minutes']:null)?></strong><span>Ort. okunma süresi</span></div>
<div><strong><?=mrht(isset($summary['avg_close_minutes'])?(float)$summary['avg_close_minutes']:null)?></strong><span>Bildirim sonrası ort. kapanma</span></div>
</section>

<section class="role-section">
<div class="role-section-head">
<div><span class="eyeline">SORUMLU BAZLI</span><h2>Bildirim & Açık Vaka Yükü</h2></div>
<span class="role-pill"><?=count($owners)?> sorumlu</span>
</div>
<div class="mrh-owner-grid">
<?php if(!$owners):?><div class="role-empty">Seçilen dönemde hedef-risk bildirimi yok.</div><?php endif;?>
<?php foreach($owners as $owner):?>
<a href="?days=<?=$days?>&owner_id=<?=(int)$owner['alici_kullanici_id']?>">
<div><strong><?=mrhh((string)$owner['alici_adi'])?></strong><span><?=mrhp((float)$owner['okunma_orani'])?> okuma</span></div>
<small>
<?=(int)$owner['toplam']?> bildirim · <?=(int)$owner['okunmadi']?> okunmadı ·
<?=(int)$owner['guncel_acik']?> güncel açık ·
<?=(int)$owner['hedef_disinda_acik']?> hedef dışı açık
</small>
<?php if($owner['ortalama_okunma_dakika']!==null):?><em>Ort. okunma <?=mrht((float)$owner['ortalama_okunma_dakika'])?></em><?php endif;?>
</a>
<?php endforeach;?>
</div>
</section>

<section class="role-section">
<div class="role-section-head">
<div><span class="eyeline">POLİTİKA BAZLI</span><h2>Tarihsel Hedef Politikası Dağılımı</h2></div>
<span class="role-pill"><?=count($policies)?> politika</span>
</div>
<div class="mrh-policy-grid">
<?php if(!$policies):?><div class="role-empty">Seçilen dönemde politika bazlı gönderim yok.</div><?php endif;?>
<?php foreach($policies as $policy):?>
<article>
<div><strong>Politika #<?=(int)$policy['hedef_politika_id']?></strong><span><?=mrhh((string)$policy['politika_kapsami'])?></span></div>
<small>İlk müdahale <?=isset($policy['ilk_mudahale_saat'])?(int)$policy['ilk_mudahale_saat'].' sa':'—'?> · Çevrim <?=isset($policy['cevrim_gun'])?(int)$policy['cevrim_gun'].' gün':'—'?></small>
<div class="mrh-policy-stats">
<span><?=(int)$policy['toplam']?> toplam</span>
<span><?=(int)$policy['hedef_75']?> %75+</span>
<span><?=(int)$policy['hedef_disinda']?> hedef dışı</span>
<span><?=(int)$policy['guncel_acik']?> açık</span>
<span><?=mrhp((float)$policy['okunma_orani'])?> okuma</span>
</div>
</article>
<?php endforeach;?>
</div>
</section>

<section class="role-section">
<div class="role-section-head">
<div><span class="eyeline">GEÇMİŞ</span><h2>Hedef Risk Bildirimleri</h2></div>
<span class="role-pill"><?=count($rows)?></span>
</div>

<form class="mrh-filter" method="get">
<input type="hidden" name="days" value="<?=$days?>">
<select name="signal">
<option value="">Tüm sinyaller</option>
<option value="hedef_75" <?=$filters['signal']==='hedef_75'?'selected':''?>>%75+</option>
<option value="hedef_disinda" <?=$filters['signal']==='hedef_disinda'?'selected':''?>>Hedef dışında</option>
</select>
<select name="read">
<option value="">Okuma durumu</option>
<option value="okundu" <?=$filters['read']==='okundu'?'selected':''?>>Okundu</option>
<option value="okunmadi" <?=$filters['read']==='okunmadi'?'selected':''?>>Okunmadı</option>
</select>
<select name="state">
<option value="">Vaka/döngü durumu</option>
<option value="guncel_acik" <?=$filters['state']==='guncel_acik'?'selected':''?>>Güncel döngü açık</option>
<option value="guncel_acik_okunmadi" <?=$filters['state']==='guncel_acik_okunmadi'?'selected':''?>>Güncel açık + okunmadı</option>
<option value="guncel_hedef_disinda" <?=$filters['state']==='guncel_hedef_disinda'?'selected':''?>>Hedef dışı + açık</option>
<option value="kapali" <?=$filters['state']==='kapali'?'selected':''?>>Vaka kapalı</option>
<option value="eski_dongu" <?=$filters['state']==='eski_dongu'?'selected':''?>>Eski reopen döngüsü</option>
</select>
<select name="owner_id">
<option value="0">Tüm sorumlular</option>
<?php foreach($ownerOptions as $id=>$name):?><option value="<?=(int)$id?>" <?=(int)$filters['owner_id']===(int)$id?'selected':''?>><?=mrhh($name)?></option><?php endforeach;?>
</select>
<button type="submit">Filtrele</button>
<a href="ticari-mutabakat-hedef-risk-saglik.php?days=<?=$days?>">Temizle</a>
</form>

<div class="role-list mrh-list">
<?php if(!$rows):?><div class="role-empty"><span>—</span>Filtreye uyan hedef-risk bildirimi yok.</div><?php endif;?>
<?php foreach($rows as $row):
$read=!empty($row['okundu']);
$currentOpen=!empty($row['guncel_acik_vaka']);
$oldCycle=!empty($row['eski_dongu_bildirimi']);
$isOutside=(string)$row['esik_kodu']==='hedef_disinda';
?>
<a class="role-row mrh-row" href="ticari-mutabakat-aksiyon.php?vaka_id=<?=(int)$row['vaka_id']?>">
<span><?=$isOutside?'🚨':'🎯'?></span>
<div>
<strong><?=mrhh((string)$row['kurum_adi'])?> · <?=mrhh((string)$row['sozlesme_no'])?></strong>
<small>
<?=mrhh((string)$row['alici_adi'])?> · Politika #<?=(int)$row['hedef_politika_id']?> ·
<?=$isOutside?'Hedef dışında':'%75+'?> ·
<?=mrhh(date('d.m.Y H:i',strtotime((string)$row['olusturulma_tarihi'])))?>
<?php if($row['kullanim_orani']!==null):?> · %<?=number_format((float)$row['kullanim_orani'],1,',','.')?><?php endif;?>
</small>
</div>
<div class="mrh-tags">
<span class="role-pill <?=$read?'ok':'unread'?>"><?=$read?'Okundu':'Okunmadı'?></span>
<?php if($currentOpen):?><span class="role-pill <?=$isOutside?'outside':'open'?>">Güncel döngü açık</span>
<?php elseif($oldCycle):?><span class="role-pill old">Eski döngü</span>
<?php else:?><span class="role-pill closed">Kapalı</span><?php endif;?>
</div>
</a>
<?php endforeach;?>
</div>
</section>

<div class="role-note"><span>🔒</span><p>Bu dashboard salt-okunurdur. Bildirim göndermez, okundu durumunu değiştirmez, vakaya not eklemez ve hedef politikasını güncellemez. Müdahale gerekiyorsa ilgili vaka Aksiyon Merkezi'nde açılır.</p></div>
<?php endif;?>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a href="ticari-mutabakat-hedef-risk.php"><span>🎯</span>Risk</a>
<a href="ticari-mutabakat-hedef-risk-bildirim.php"><span>🔔</span>Gönderim</a>
<a class="active" href="ticari-mutabakat-hedef-risk-saglik.php"><span>📨</span>Sağlık</a>
<a href="ticari-mutabakat-aksiyon.php"><span>✓</span>Aksiyon</a>
</nav>
</div>
</body>
</html>
