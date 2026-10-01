<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/kurum_lisanslari.php';
require __DIR__.'/src/bildirimler.php';
require __DIR__.'/src/ticari_finans.php';
require __DIR__.'/src/lisans_yenileme.php';
require __DIR__.'/src/lisans_yenileme_ticari.php';
require __DIR__.'/src/tahsilat_risk.php';
require __DIR__.'/src/tahsilat_hatirlatma.php';
require __DIR__.'/src/ticari_dashboard.php';

$user=require_role('super_admin');
$pdo=db();
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');

function tdh(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
function tdm(string|float|int $value): string { return number_format((float)$value,2,',','.'); }
function tdp(float|int $value): string { return number_format((float)$value,1,',','.').'%'; }

$ready=td_tables_ready($pdo);
$currency=mb_strtoupper(trim((string)($_GET['para_birimi']??'')),'UTF-8');
if($currency!=='' && !in_array($currency,['TRY','USD','EUR'],true)) $currency='';
$query=trim((string)($_GET['q']??''));

$kpis=$ready?td_currency_kpis($pdo):[];
$monthly=$ready?td_monthly_collections($pdo,6):[];
$institutions=$ready?td_institution_rows($pdo,['para_birimi'=>$currency,'q'=>$query],400):[];
$recent=$ready?td_recent_payments($pdo,15):[];
$operations=$ready?td_operational_counts($pdo):[];

$trendMax=[];
foreach($monthly as $row){
    $ccy=(string)$row['para_birimi'];
    $amount=(float)$row['tahsilat_toplami'];
    $trendMax[$ccy]=max((float)($trendMax[$ccy]??0),$amount);
}
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Ticari Yönetim Dashboardu — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="ticari-dashboard.css?v=1.2.52">
</head>
<body class="role-page sa-subpage">
<?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Ticari Yönetim Dashboardu</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="ticari-finans.php" aria-label="Ticari Finans"><svg><use href="#sa-database"/></svg></a>
<a class="sa-page-action" href="tahsilat-risk.php" aria-label="Tahsilat Risk Merkezi"><svg><use href="#sa-alert"/></svg></a>
<a class="sa-page-action" href="lisans-yenilemeleri.php" aria-label="Lisans Yenilemeleri"><svg><use href="#sa-refresh"/></svg></a>
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>

<main class="role-content">
<section class="role-hero">
<span class="eyeline">TİCARİ YÖNETİM</span>
<h1>Gelir, Tahsilat ve Risk KPI Merkezi</h1>
<p>Sözleşme portföyünü, gerçek tahsilatları, açık ve gecikmiş bakiyeyi, yenileme gelirini ve kurum bazlı ticari performansı para birimlerini karıştırmadan tek ekranda izle.</p>
<span class="role-hero-art">📊</span>
</section>

<?php if(!$ready):?>
<div class="role-note"><span>⚠️</span><p>Ticari finans tabloları hazır değil. Ticari Finans migrationı kurulduğunda bu salt-okunur dashboard otomatik açılır.</p></div>
<?php else:?>

<section class="td-ops">
<a href="tahsilat-risk.php"><strong><?=(int)($operations['risk_open']??0)?></strong><span>Açık risk vakası</span></a>
<a href="tahsilat-risk.php?risk=31_plus"><strong><?=(int)($operations['risk_critical']??0)?></strong><span>31+ gün kritik</span></a>
<a href="tahsilat-risk.php"><strong><?=(int)($operations['risk_followup_due']??0)?></strong><span>Aksiyon zamanı geldi</span></a>
<a href="tahsilat-risk.php"><strong><?=(int)($operations['reminder_total']??0)?></strong><span>Gönderilmiş hatırlatma</span></a>
<a href="lisans-yenilemeleri.php?durum=open"><strong><?=(int)($operations['renewal_open']??0)?></strong><span>Açık yenileme vakası</span></a>
<a href="lisans-yenilemeleri.php"><strong><?=(int)($operations['renewal_commercial_gap']??0)?></strong><span>Yenileme ticari açığı</span></a>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">KPI</span><h2>Para Birimi Bazında Ticari Portföy</h2></div><span class="role-pill">Salt okunur</span></div>
<?php if(!$kpis):?><div class="role-empty"><span>—</span>Aktif veya tamamlanmış ticari sözleşme yok.</div><?php endif;?>
<div class="td-kpi-grid">
<?php foreach($kpis as $row):?>
<article class="td-kpi-card">
<div class="td-kpi-head"><strong><?=tdh((string)$row['para_birimi'])?></strong><span><?=tdp((float)$row['tahsilat_orani'])?> tahsilat</span></div>
<div class="td-kpi-primary">
<div><span>Aktif sözleşme değeri</span><strong><?=tdm($row['aktif_sozlesme_toplami'])?></strong></div>
<div><span>Ticari portföy</span><strong><?=tdm($row['sozlesme_toplami'])?></strong></div>
<div><span>Tahsil edilen</span><strong><?=tdm($row['tahsil_edilen'])?></strong></div>
<div><span>Açık bakiye</span><strong><?=tdm($row['kalan_tutar'])?></strong></div>
</div>
<div class="td-kpi-secondary">
<div><span>Gecikmiş bakiye</span><strong><?=tdm($row['gecikmis_bakiye'])?></strong></div>
<div><span>Gecikmiş sözleşme</span><strong><?=(int)$row['gecikmis_sozlesme']?></strong></div>
<div><span>Aktif / tamamlanan</span><strong><?=(int)$row['aktif_sozlesme']?> / <?=(int)$row['tamamlanan_sozlesme']?></strong></div>
<div><span>Kurum</span><strong><?=(int)$row['kurum_sayisi']?></strong></div>
</div>
<div class="td-renewal">
<span>Yenileme sözleşmeleri</span>
<strong><?=tdm($row['yenileme_tahsil_edilen'])?> / <?=tdm($row['yenileme_sozlesme_toplami'])?> <?=tdh((string)$row['para_birimi'])?></strong>
<small><?=(int)$row['yenileme_sozlesmesi']?> sözleşme · <?=tdp((float)$row['yenileme_tahsilat_orani'])?> tahsilat · Kalan <?=tdm($row['yenileme_kalan_tutar'])?></small>
</div>
</article>
<?php endforeach;?>
</div>
<div class="role-note"><span>ℹ️</span><p>Aktif sözleşme değeri yalnız <strong>aktif</strong> sözleşmeleri gösterir. Ticari portföy aktif + tamamlanmış sözleşmelerdir. Taslak ve iptal sözleşmeler KPI toplamına alınmaz. TRY, USD ve EUR birbirine çevrilmez.</p></div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">6 AYLIK TREND</span><h2>Gerçek Tahsilat Akışı</h2></div></div>
<?php if(!$monthly):?><div class="role-empty"><span>—</span>Son 6 ayda aktif tahsilat kaydı yok.</div><?php endif;?>
<div class="td-trend">
<?php foreach($monthly as $row):
$ccy=(string)$row['para_birimi'];
$max=(float)($trendMax[$ccy]??0);
$width=$max>0?max(3,min(100,((float)$row['tahsilat_toplami']/$max)*100)):0;
?>
<article>
<div class="td-trend-meta"><strong><?=tdh((string)$row['ay'])?> · <?=tdh($ccy)?></strong><span><?=tdm($row['tahsilat_toplami'])?> <?=tdh($ccy)?></span></div>
<div class="td-trend-bar"><i style="width:<?=number_format($width,2,'.','')?>%"></i></div>
<small><?=(int)$row['tahsilat_sayisi']?> tahsilat · <?=(int)$row['kurum_sayisi']?> kurum</small>
</article>
<?php endforeach;?>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">KURUM BAZLI</span><h2>Ticari Performans</h2></div><span class="role-pill"><?=count($institutions)?></span></div>
<form class="td-filter" method="get">
<input type="search" name="q" value="<?=tdh($query)?>" placeholder="Kurum adı veya kodu">
<select name="para_birimi">
<option value="">Tüm para birimleri</option>
<?php foreach(['TRY','USD','EUR'] as $ccy):?><option value="<?=$ccy?>" <?=$currency===$ccy?'selected':''?>><?=$ccy?></option><?php endforeach;?>
</select>
<button type="submit">Filtrele</button>
<a href="ticari-dashboard.php">Temizle</a>
</form>

<div class="td-table-wrap">
<table class="td-table">
<thead><tr>
<th>Kurum</th><th>PB</th><th>Sözleşme</th><th>Portföy</th><th>Tahsilat</th><th>Açık</th><th>Gecikmiş</th><th>Oran</th><th>Yenileme</th><th>Son tahsilat</th>
</tr></thead>
<tbody>
<?php if(!$institutions):?><tr><td colspan="10">Filtreye uyan ticari kurum kaydı yok.</td></tr><?php endif;?>
<?php foreach($institutions as $row):?>
<tr>
<td><a href="kurumlar.php?sekme=kurumlar&amp;kurum_id=<?=(int)$row['kurum_id']?>"><strong><?=tdh((string)$row['kurum_adi'])?></strong><small><?=tdh((string)$row['kurum_kodu'])?></small></a></td>
<td><?=tdh((string)$row['para_birimi'])?></td>
<td><?=(int)$row['sozlesme_sayisi']?> <small>(<?=(int)$row['aktif_sozlesme']?> aktif)</small></td>
<td><?=tdm($row['sozlesme_toplami'])?></td>
<td><?=tdm($row['tahsil_edilen'])?></td>
<td><?=tdm($row['kalan_tutar'])?></td>
<td class="<?=((float)$row['gecikmis_bakiye']>0?'td-danger':'')?>"><?=tdm($row['gecikmis_bakiye'])?><?php if((int)$row['gecikmis_sozlesme']>0):?><small><?=(int)$row['gecikmis_sozlesme']?> sözleşme</small><?php endif;?></td>
<td><span class="td-rate"><?=tdp((float)$row['tahsilat_orani'])?></span></td>
<td><?=(int)$row['yenileme_sozlesmesi']?></td>
<td><?=tdh((string)($row['son_tahsilat_tarihi']?:'—'))?></td>
</tr>
<?php endforeach;?>
</tbody>
</table>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">SON HAREKETLER</span><h2>Son Aktif Tahsilatlar</h2></div><a class="role-pill ok" href="ticari-finans.php">Ticari Finans →</a></div>
<div class="role-list td-payment-list">
<?php if(!$recent):?><div class="role-empty"><span>—</span>Aktif tahsilat kaydı yok.</div><?php endif;?>
<?php foreach($recent as $row):?>
<a class="role-row" href="ticari-finans.php?sozlesme_id=<?=(int)$row['sozlesme_id']?>">
<span>₺</span>
<div><strong><?=tdh((string)$row['kurum_adi'])?> · <?=tdh((string)$row['sozlesme_no'])?></strong>
<small><?=tdh((string)$row['tahsilat_tarihi'])?> · <?=tdh((string)$row['odeme_yontemi'])?><?php if((string)($row['referans_no']??'')!==''):?> · <?=tdh((string)$row['referans_no'])?><?php endif;?></small></div>
<span class="role-pill ok"><?=tdm($row['tutar'])?> <?=tdh((string)$row['para_birimi'])?></span>
</a>
<?php endforeach;?>
</div>
</section>

<div class="role-note"><span>🔒</span><p>Bu dashboard salt-okunurdur. Sözleşme veya tahsilat kaydı oluşturmaz, risk kuyruğunu senkronize etmez ve yönetici bildirimi göndermez. Operasyonel değişiklikler ilgili Ticari Finans, Tahsilat Risk ve Lisans Yenileme ekranlarında yapılır.</p></div>
<?php endif;?>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a class="active" href="ticari-dashboard.php"><span>📊</span>KPI</a>
<a href="ticari-finans.php"><span>₺</span>Finans</a>
<a href="tahsilat-risk.php"><span>⚠️</span>Risk</a>
<a href="lisans-yenilemeleri.php"><span>⏳</span>Yenileme</a>
</nav>
</div>
</body>
</html>
