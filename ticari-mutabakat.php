<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/ticari_finans.php';
require __DIR__.'/src/ticari_belgeler.php';
require __DIR__.'/src/ticari_mutabakat.php';

$user=require_role('super_admin');
$pdo=db();
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');

function tmh(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
function tmm(string|float|int $value): string { return number_format((float)$value,2,',','.'); }
function tm_status_class(string $status): string {
    return match($status){
        'hata'=>'danger',
        'eksik'=>'warning',
        'tam'=>'ok',
        default=>'',
    };
}

$ready=tm_tables_ready($pdo);
$filters=[
    'kurum_id'=>max(0,(int)($_GET['kurum_id']??0)),
    'para_birimi'=>(string)($_GET['para_birimi']??''),
    'mutabakat'=>(string)($_GET['mutabakat']??''),
    'q'=>(string)($_GET['q']??''),
];

$summary=$ready?tm_currency_summary($pdo):[];
$contracts=$ready?tm_contract_rows($pdo,$filters,800):[];
$openDocuments=$ready?tm_open_documents($pdo,$filters,120):[];
$unallocatedPayments=$ready?tm_unallocated_payments($pdo,$filters,120):[];
$issues=$ready?tm_integrity_issues($pdo,150):[];

$countStatus=['hata'=>0,'eksik'=>0,'tam'=>0];
foreach($contracts as $row){
    $status=(string)$row['mutabakat_durumu'];
    if(isset($countStatus[$status]))$countStatus[$status]++;
}
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Ticari Mutabakat & Kontrol Merkezi — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="ticari-mutabakat.css?v=1.2.58">
</head>
<body class="role-page sa-subpage">
<?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Ticari Mutabakat & Kontrol</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="ticari-dashboard.php" aria-label="Ticari Dashboard"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="ticari-belgeler.php" aria-label="Ticari Belgeler"><svg><use href="#sa-database"/></svg></a>
<a class="sa-page-action" href="ticari-finans.php" aria-label="Ticari Finans"><svg><use href="#sa-database"/></svg></a>
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>

<main class="role-content">
<section class="role-hero">
<span class="eyeline">TİCARİ KONTROL</span>
<h1>Sözleşme, Belge ve Tahsilat Mutabakat Merkezi</h1>
<p>Sözleşme borcu, aktif ticari belge, aktif tahsilat ve efektif belge–tahsilat eşlemelerini aynı para birimi ve aynı sözleşme sınırında karşılaştır; operasyon açıklarını veri bütünlüğü hatalarından ayır.</p>
<span class="role-hero-art">⚖️</span>
</section>

<div class="role-note"><span>ℹ️</span><p><strong>Operasyon Açığı</strong> normal süreçte tamamlanması gereken belgeleme/eşleme işidir. <strong>Veri Kontrolü Gerekli</strong> ise tutar limiti, kurum, sözleşme veya para birimi bütünlüğünde anomali bulunduğunu gösterir. Bu ekran hiçbir finansal kaydı değiştirmez.</p></div>

<?php if(!$ready):?>
<div class="role-note"><span>⚠️</span><p>Ticari Finans ve Ticari Belge tabloları hazır değil. 085 migration tamamlandığında bu salt-okunur merkez açılır.</p></div>
<?php else:?>

<section class="tm-counts">
<a href="ticari-mutabakat.php?mutabakat=hata"><strong><?=$countStatus['hata']?></strong><span>Veri kontrolü gerekli</span></a>
<a href="ticari-mutabakat.php?mutabakat=eksik"><strong><?=$countStatus['eksik']?></strong><span>Operasyon açığı</span></a>
<a href="ticari-mutabakat.php?mutabakat=tam"><strong><?=$countStatus['tam']?></strong><span>Mutabık sözleşme</span></a>
<a href="#acik-belgeler"><strong><?=count($openDocuments)?></strong><span>Açık belge</span></a>
<a href="#dagitilmamis-tahsilatlar"><strong><?=count($unallocatedPayments)?></strong><span>Dağıtılmamış tahsilat</span></a>
<a href="#butunluk"><strong><?=count($issues)?></strong><span>Bütünlük uyarısı</span></a>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">PARA BİRİMİ BAZINDA</span><h2>Mutabakat Özeti</h2></div><span class="role-pill">Salt okunur</span></div>
<?php if(!$summary):?><div class="role-empty"><span>—</span>Aktif veya tamamlanmış sözleşme bulunmuyor.</div><?php endif;?>
<div class="tm-summary-grid">
<?php foreach($summary as $item):?>
<article>
<div class="tm-summary-head"><strong><?=tmh((string)$item['para_birimi'])?></strong><span><?=(int)$item['tam_sayisi']?> mutabık · <?=(int)$item['eksik_sayisi']?> açık · <?=(int)$item['hata_sayisi']?> kontrol</span></div>
<div class="tm-summary-values">
<div><span>Sözleşme</span><strong><?=tmm($item['sozlesme_toplami'])?></strong></div>
<div><span>Belge</span><strong><?=tmm($item['belge_toplami'])?></strong></div>
<div><span>Tahsilat</span><strong><?=tmm($item['tahsilat_toplami'])?></strong></div>
<div><span>Eşlenen</span><strong><?=tmm($item['eslesen_tutar'])?></strong></div>
<div class="gap"><span>Belgesiz</span><strong><?=tmm($item['belgesiz_tutar'])?></strong></div>
<div class="gap"><span>Açık belge</span><strong><?=tmm($item['acik_belge_tutari'])?></strong></div>
<div class="gap"><span>Dağıtılmamış ödeme</span><strong><?=tmm($item['dagitilmamis_tahsilat'])?></strong></div>
</div>
</article>
<?php endforeach;?>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">SÖZLEŞME MUTABAKATI</span><h2>Kontrol Kuyruğu</h2></div><span class="role-pill"><?=count($contracts)?></span></div>

<form class="tm-filter" method="get">
<input type="search" name="q" value="<?=tmh((string)$filters['q'])?>" placeholder="Kurum, kod veya sözleşme">
<select name="para_birimi">
<option value="">Tüm para birimleri</option>
<?php foreach(['TRY','USD','EUR'] as $ccy):?><option value="<?=$ccy?>" <?=mb_strtoupper((string)$filters['para_birimi'],'UTF-8')===$ccy?'selected':''?>><?=$ccy?></option><?php endforeach;?>
</select>
<select name="mutabakat">
<option value="">Tüm durumlar</option>
<option value="hata" <?=$filters['mutabakat']==='hata'?'selected':''?>>Veri kontrolü gerekli</option>
<option value="eksik" <?=$filters['mutabakat']==='eksik'?'selected':''?>>Operasyon açığı</option>
<option value="tam" <?=$filters['mutabakat']==='tam'?'selected':''?>>Mutabık</option>
</select>
<?php if($filters['kurum_id']>0):?><input type="hidden" name="kurum_id" value="<?=(int)$filters['kurum_id']?>"><?php endif;?>
<button type="submit">Filtrele</button>
<a href="ticari-mutabakat.php">Temizle</a>
</form>

<div class="tm-table-wrap">
<table class="tm-table">
<thead><tr>
<th>Kurum / Sözleşme</th><th>PB</th><th>Sözleşme</th><th>Belge</th><th>Tahsilat</th><th>Eşlenen</th><th>Belgesiz</th><th>Açık Belge</th><th>Dağıtılmamış</th><th>Durum</th>
</tr></thead>
<tbody>
<?php if(!$contracts):?><tr><td colspan="10">Filtreye uyan sözleşme bulunamadı.</td></tr><?php endif;?>
<?php foreach($contracts as $row):?>
<tr>
<td>
<a href="kurum-ticari-360.php?kurum_id=<?=(int)$row['kurum_id']?>"><strong><?=tmh((string)$row['kurum_adi'])?></strong></a>
<a class="tm-sub-link" href="ticari-finans.php?sozlesme_id=<?=(int)$row['sozlesme_id']?>"><?=tmh((string)$row['sozlesme_no'])?> →</a>
</td>
<td><?=tmh((string)$row['para_birimi'])?></td>
<td><?=tmm($row['toplam_tutar'])?></td>
<td><?=tmm($row['belge_toplami'])?><small><?=(int)$row['belge_sayisi']?> belge</small></td>
<td><?=tmm($row['tahsilat_toplami'])?><small><?=(int)$row['tahsilat_sayisi']?> tahsilat</small></td>
<td><?=tmm($row['eslesen_tutar'])?><small><?=(int)$row['esleme_sayisi']?> eşleme</small></td>
<td><?=tmm($row['belgesiz_tutar'])?></td>
<td><?=tmm($row['acik_belge_tutari'])?></td>
<td><?=tmm($row['dagitilmamis_tahsilat'])?></td>
<td><span class="role-pill <?=tm_status_class((string)$row['mutabakat_durumu'])?>"><?=tmh((string)$row['mutabakat_etiketi'])?></span>
<?php if((float)$row['belge_asimi']>0.009 || (float)$row['belge_esleme_asimi']>0.009 || (float)$row['tahsilat_esleme_asimi']>0.009):?>
<small class="tm-error-note">Limit aşımı var</small>
<?php endif;?>
</td>
</tr>
<?php endforeach;?>
</tbody>
</table>
</div>
</section>

<section class="tm-two-col">
<section class="role-section" id="acik-belgeler">
<div class="role-section-head"><div><span class="eyeline">BELGE EŞLEME</span><h2>Açık Ticari Belgeler</h2></div><span class="role-pill"><?=count($openDocuments)?></span></div>
<div class="role-list tm-list">
<?php if(!$openDocuments):?><div class="role-empty"><span>✅</span>Aktif belgelerde açık eşleme tutarı yok.</div><?php endif;?>
<?php foreach($openDocuments as $row):?>
<a class="role-row" href="ticari-belgeler.php?belge_id=<?=(int)$row['belge_id']?>">
<span>🧾</span>
<div><strong><?=tmh((string)$row['kurum_adi'])?> · <?=tmh((string)$row['belge_no'])?></strong>
<small><?=tmh((string)$row['sozlesme_no'])?> · <?=tmh((string)$row['belge_tarihi'])?> · Eşlenen <?=tmm($row['eslesen_tutar'])?></small></div>
<span class="role-pill warning"><?=tmm($row['acik_tutar'])?> <?=tmh((string)$row['para_birimi'])?></span>
</a>
<?php endforeach;?>
</div>
</section>

<section class="role-section" id="dagitilmamis-tahsilatlar">
<div class="role-section-head"><div><span class="eyeline">TAHSİLAT EŞLEME</span><h2>Dağıtılmamış Tahsilatlar</h2></div><span class="role-pill"><?=count($unallocatedPayments)?></span></div>
<div class="role-list tm-list">
<?php if(!$unallocatedPayments):?><div class="role-empty"><span>✅</span>Aktif tahsilatlarda dağıtılmamış tutar yok.</div><?php endif;?>
<?php foreach($unallocatedPayments as $row):?>
<a class="role-row" href="ticari-belgeler.php?kurum_id=<?=(int)$row['kurum_id']?>">
<span>₺</span>
<div><strong><?=tmh((string)$row['kurum_adi'])?> · <?=tmh((string)$row['sozlesme_no'])?></strong>
<small><?=tmh((string)$row['tahsilat_tarihi'])?> · <?=tmh((string)$row['odeme_yontemi'])?><?php if((string)($row['referans_no']??'')!==''):?> · <?=tmh((string)$row['referans_no'])?><?php endif;?> · Eşlenen <?=tmm($row['eslesen_tutar'])?></small></div>
<span class="role-pill warning"><?=tmm($row['dagitilmamis_tutar'])?> <?=tmh((string)$row['para_birimi'])?></span>
</a>
<?php endforeach;?>
</div>
</section>
</section>

<section class="role-section" id="butunluk">
<div class="role-section-head"><div><span class="eyeline">VERİ BÜTÜNLÜĞÜ</span><h2>Gerçek Kontrol Uyarıları</h2></div><span class="role-pill <?=count($issues)?'danger':'ok'?>"><?=count($issues)?></span></div>
<?php if(!$issues):?><div class="role-empty"><span>✅</span>Kurum/sözleşme/para birimi veya eşleme kapasitesi açısından bütünlük hatası bulunmadı.</div><?php endif;?>
<div class="tm-issues">
<?php foreach($issues as $issue):?>
<article>
<div><strong><?=tmh((string)$issue['kod'])?></strong><span><?=tmh((string)($issue['para_birimi']?:'—'))?></span></div>
<p><?=tmh((string)$issue['aciklama'])?></p>
<small><?=tmh((string)$issue['referans'])?> · Sözleşme #<?=(int)$issue['sozlesme_id']?> · Kurum #<?=(int)$issue['kurum_id']?></small>
<div class="tm-issue-actions">
<?php if((int)$issue['kurum_id']>0):?><a href="kurum-ticari-360.php?kurum_id=<?=(int)$issue['kurum_id']?>">Kurum 360</a><?php endif;?>
<?php if((int)$issue['sozlesme_id']>0):?><a href="ticari-finans.php?sozlesme_id=<?=(int)$issue['sozlesme_id']?>">Sözleşme</a><?php endif;?>
<?php if((string)$issue['kod']==='belge_kimlik_uyumsuz' && (int)$issue['kayit_id']>0):?><a href="ticari-belgeler.php?belge_id=<?=(int)$issue['kayit_id']?>">Belge</a><?php endif;?>
</div>
</article>
<?php endforeach;?>
</div>
</section>

<div class="role-note"><span>🔒</span><p>Mutabakat merkezi yalnız teşhis ve yönlendirme yapar. Sözleşme, belge, tahsilat veya eşleme kaydını otomatik değiştirmez; hatalar ilgili kaynak modülde kontrollü olarak düzeltilir.</p></div>
<?php endif;?>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a href="ticari-dashboard.php"><span>📊</span>KPI</a>
<a class="active" href="ticari-mutabakat.php"><span>⚖️</span>Mutabakat</a>
<a href="ticari-belgeler.php"><span>🧾</span>Belgeler</a>
<a href="ticari-finans.php"><span>₺</span>Finans</a>
<a href="tahsilat-risk.php"><span>⚠️</span>Risk</a>
</nav>
</div>
</body>
</html>
