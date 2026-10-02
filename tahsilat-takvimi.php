<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/kurum_lisanslari.php';
require __DIR__.'/src/ticari_finans.php';
require __DIR__.'/src/ticari_taksit.php';
require __DIR__.'/src/tahsilat_takvimi.php';

$user=require_role('super_admin');
$pdo=db();
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');

function ttkh(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
function ttkm(string|float|int $value): string { return number_format((float)$value,2,',','.'); }
function ttk_status_class(string $code): string {
    return match($code){
        'gecikmis'=>'danger',
        'bugun'=>'today',
        'vadesiz'=>'nodue',
        default=>'future',
    };
}

$error='';
$today=date('Y-m-d');
$defaultEnd=(new DateTimeImmutable('today'))->modify('+90 days')->format('Y-m-d');

$filters=[
    'baslangic'=>(string)($_GET['baslangic']??$today),
    'bitis'=>(string)($_GET['bitis']??$defaultEnd),
    'para_birimi'=>(string)($_GET['para_birimi']??''),
    'q'=>(string)($_GET['q']??''),
    'gecikmis'=>isset($_GET['apply'])?(isset($_GET['gecikmis'])?'1':'0'):'1',
    'vadesiz'=>isset($_GET['apply'])?(isset($_GET['vadesiz'])?'1':'0'):'1',
];

$ready=ttk_tables_ready($pdo);
$window=['baslangic'=>$today,'bitis'=>$defaultEnd];
$summary=[];
$forecast=[];
$rows=[];

if($ready){
    try{
        $window=ttk_window($filters['baslangic'],$filters['bitis']);
        $filters['baslangic']=$window['baslangic'];
        $filters['bitis']=$window['bitis'];
        $summary=ttk_summary($pdo);
        $forecast=ttk_monthly_forecast($pdo,6);
        $rows=ttk_filter_rows($pdo,$filters);
    }catch(Throwable $e){
        $error=$e->getMessage();
        $filters['baslangic']=$today;
        $filters['bitis']=$defaultEnd;
        $window=ttk_window($today,$defaultEnd);
        $summary=ttk_summary($pdo);
        $forecast=ttk_monthly_forecast($pdo,6);
        $rows=ttk_filter_rows($pdo,[
            'baslangic'=>$today,'bitis'=>$defaultEnd,'para_birimi'=>'','q'=>'','gecikmis'=>'1','vadesiz'=>'1'
        ]);
    }
}

$forecastMax=[];
foreach($forecast as $item){
    $ccy=(string)$item['para_birimi'];
    $forecastMax[$ccy]=max((float)($forecastMax[$ccy]??0),(float)$item['beklenen_tutar']);
}
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Tahsilat Takvimi — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="tahsilat-takvimi.css?v=1.2.56">
</head>
<body class="role-page sa-subpage">
<?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Tahsilat Takvimi</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="ticari-dashboard.php" aria-label="Ticari Dashboard"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="ticari-finans.php" aria-label="Ticari Finans"><svg><use href="#sa-database"/></svg></a>
<a class="sa-page-action" href="tahsilat-risk.php" aria-label="Tahsilat Risk Merkezi"><svg><use href="#sa-alert"/></svg></a>
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>

<main class="role-content">
<section class="role-hero">
<span class="eyeline">NAKİT AKIŞ GÖRÜNÜRLÜĞÜ</span>
<h1>Tahsilat Takvimi & Beklenen Nakit Akışı</h1>
<p>Aktif taksit planlarının FIFO sonrası açık taksitlerini ve eski tek-vadeli sözleşmeleri aynı takvimde izle. Tahsil edilmiş tutarlar beklenen nakit akışına ikinci kez yazılmaz.</p>
<span class="role-hero-art">🗓️</span>
</section>

<?php if(!$ready):?>
<div class="role-note"><span>⚠️</span><p>Ticari Finans tabloları hazır değil. Bu salt-okunur takvim mevcut finans verisi hazır olduğunda otomatik açılır.</p></div>
<?php else:?>
<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=ttkh($error)?> Varsayılan 90 günlük dönem gösteriliyor.</p></div><?php endif;?>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">VADE FOTOĞRAFI</span><h2>Para Birimi Bazında Açık Tahsilat</h2></div><span class="role-pill">Salt okunur</span></div>
<?php if(!$summary):?><div class="role-empty"><span>✅</span>Açık tahsilat yükümlülüğü bulunmuyor.</div><?php endif;?>
<div class="ttk-summary">
<?php foreach($summary as $item):?>
<article>
<div class="ttk-summary-head"><strong><?=ttkh((string)$item['para_birimi'])?></strong><span><?=(int)$item['gecikmis_adet']?> gecikmiş · <?=(int)$item['yaklasan_adet']?> yaklaşan</span></div>
<div class="ttk-summary-grid">
<div class="danger"><span>Gecikmiş</span><strong><?=ttkm($item['gecikmis'])?></strong></div>
<div class="today"><span>Bugün</span><strong><?=ttkm($item['bugun'])?></strong></div>
<div><span>1–7 gün</span><strong><?=ttkm($item['gun_1_7'])?></strong></div>
<div><span>8–30 gün</span><strong><?=ttkm($item['gun_8_30'])?></strong></div>
<div><span>31–60 gün</span><strong><?=ttkm($item['gun_31_60'])?></strong></div>
<div><span>61–90 gün</span><strong><?=ttkm($item['gun_61_90'])?></strong></div>
<div><span>90+ gün</span><strong><?=ttkm($item['gun_90_plus'])?></strong></div>
<div class="nodue"><span>Vadesiz</span><strong><?=ttkm($item['vadesiz'])?></strong><small><?=(int)$item['vadesiz_adet']?> kalem</small></div>
</div>
</article>
<?php endforeach;?>
</div>
<div class="role-note"><span>ℹ️</span><p>Taksit planı aktifse bu özet sözleşmenin ana vadesini değil FIFO sonrası açık taksit vadelerini kullanır. Planı olmayan sözleşmeler mevcut tek vade davranışıyla hesaplanır. TRY, USD ve EUR birbirine eklenmez.</p></div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">6 AYLIK BEKLENTİ</span><h2>Planlanan Tahsilat Akışı</h2></div></div>
<?php if(!$forecast):?><div class="role-empty"><span>—</span>Önümüzdeki 6 ayda tarihli açık tahsilat bulunmuyor.</div><?php endif;?>
<div class="ttk-forecast">
<?php foreach($forecast as $item):
$ccy=(string)$item['para_birimi'];
$max=(float)($forecastMax[$ccy]??0);
$width=$max>0?max(3,min(100,((float)$item['beklenen_tutar']/$max)*100)):0;
?>
<article>
<div><strong><?=ttkh((string)$item['ay'])?> · <?=ttkh($ccy)?></strong><span><?=ttkm($item['beklenen_tutar'])?> <?=ttkh($ccy)?></span></div>
<div class="ttk-bar"><i style="width:<?=number_format($width,2,'.','')?>%"></i></div>
<small><?=(int)$item['kalem_sayisi']?> açık vade kalemi</small>
</article>
<?php endforeach;?>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">TAKVİM</span><h2>Açık Vade Kalemleri</h2></div><span class="role-pill"><?=count($rows)?></span></div>

<form class="ttk-filter" method="get">
<input type="hidden" name="apply" value="1">
<label>Başlangıç<input type="date" name="baslangic" value="<?=ttkh((string)$filters['baslangic'])?>"></label>
<label>Bitiş<input type="date" name="bitis" value="<?=ttkh((string)$filters['bitis'])?>"></label>
<label>Para Birimi<select name="para_birimi">
<option value="">Tümü</option>
<?php foreach(['TRY','USD','EUR'] as $ccy):?><option value="<?=$ccy?>" <?=mb_strtoupper((string)$filters['para_birimi'],'UTF-8')===$ccy?'selected':''?>><?=$ccy?></option><?php endforeach;?>
</select></label>
<label>Kurum / Sözleşme<input type="search" name="q" value="<?=ttkh((string)$filters['q'])?>" placeholder="Kurum adı, kod veya sözleşme no"></label>
<label class="ttk-check"><input type="checkbox" name="gecikmis" value="1" <?=$filters['gecikmis']==='1'?'checked':''?>> Gecikmişleri dahil et</label>
<label class="ttk-check"><input type="checkbox" name="vadesiz" value="1" <?=$filters['vadesiz']==='1'?'checked':''?>> Vadesizleri dahil et</label>
<button type="submit">Uygula</button>
<a href="tahsilat-takvimi.php">Sıfırla</a>
</form>

<div class="role-list ttk-list">
<?php if(!$rows):?><div class="role-empty"><span>✅</span>Seçilen aralık ve filtrelerde açık vade kalemi yok.</div><?php endif;?>
<?php foreach($rows as $row):?>
<a class="role-row ttk-row" href="ticari-finans.php?sozlesme_id=<?=(int)$row['sozlesme_id']?>">
<span><?=($row['durum_kodu']==='gecikmis'?'🚨':($row['durum_kodu']==='bugun'?'⏰':($row['durum_kodu']==='vadesiz'?'❔':'🗓️')))?></span>
<div>
<strong><?=ttkh((string)$row['kurum_adi'])?> · <?=ttkh((string)$row['sozlesme_no'])?></strong>
<small>
<?=($row['kaynak']==='taksit'?'Taksit #'.(int)$row['taksit_sira']:'Tek vade')?>
<?php if($row['vade_tarihi']!==null):?> · <?=ttkh((string)$row['vade_tarihi'])?><?php endif;?>
<?php if((string)$row['paket_adi']!==''):?> · <?=ttkh((string)$row['paket_adi'])?><?php endif;?>
<?php if((string)$row['aciklama']!==''):?> · <?=ttkh((string)$row['aciklama'])?><?php endif;?>
</small>
</div>
<div class="ttk-row-end">
<strong><?=ttkm($row['kalan_tutar'])?> <?=ttkh((string)$row['para_birimi'])?></strong>
<span class="role-pill <?=ttk_status_class((string)$row['durum_kodu'])?>"><?=ttkh((string)$row['durum_etiketi'])?></span>
</div>
</a>
<?php endforeach;?>
</div>
</section>

<div class="role-note"><span>🔒</span><p>Bu takvim salt-okunurdur. Sözleşme, taksit planı veya tahsilat kaydı değiştirmez; risk kuyruğunu senkronize etmez ve bildirim göndermez. Operasyonel işlemler Ticari Finans ve Tahsilat Risk Merkezi üzerinden yapılır.</p></div>
<?php endif;?>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a href="ticari-dashboard.php"><span>📊</span>KPI</a>
<a class="active" href="tahsilat-takvimi.php"><span>🗓️</span>Takvim</a>
<a href="ticari-finans.php"><span>₺</span>Finans</a>
<a href="tahsilat-risk.php"><span>⚠️</span>Risk</a>
</nav>
</div>
</body>
</html>
