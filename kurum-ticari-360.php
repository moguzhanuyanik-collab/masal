<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/ticari_finans.php';
require __DIR__.'/src/ticari_taksit.php';
require __DIR__.'/src/kurum_ticari_360.php';

$user=require_role('super_admin');
$pdo=db();
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');

function k360h(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
function k360m(string|float|int $value): string { return number_format((float)$value,2,',','.'); }
function k360p(float|int $value): string { return number_format((float)$value,1,',','.').'%'; }
function k360_contract_status(string $value): string {
    return match($value){
        'taslak'=>'Taslak',
        'aktif'=>'Aktif',
        'tamamlandi'=>'Tamamlandı',
        'iptal'=>'İptal',
        default=>$value,
    };
}
function k360_payment_status(string $value): string {
    return match($value){
        'aktif'=>'Aktif',
        'iptal'=>'İptal',
        default=>$value,
    };
}
function k360_renewal_status(string $value): string {
    return match($value){
        'acik'=>'Açık',
        'temas'=>'Temas Edildi',
        'teklif'=>'Teklif / Görüşme',
        'yenilendi'=>'Yenilendi',
        'yenilenmedi'=>'Yenilenmedi',
        default=>$value,
    };
}

$institutionId=max(0,(int)($_GET['kurum_id']??0));
$ready=kt360_ready($pdo);
$institution=$ready&&$institutionId>0?kt360_institution($pdo,$institutionId):null;

$summary=$institution?kt360_currency_summary($pdo,$institutionId):[];
$contracts=$institution?kt360_contract_rows($pdo,$institutionId):[];
$payments=$institution?kt360_payment_rows($pdo,$institutionId,300):[];
$renewals=$institution?kt360_renewal_rows($pdo,$institutionId,150):[];
$reminders=$institution?kt360_reminder_rows($pdo,$institutionId,150):[];
$counts=$institution?kt360_counts($pdo,$institutionId):[];

$statementError='';
$statementFilters=kt360_statement_filters([]);
$statement=['summary'=>[],'rows'=>[],'truncated'=>false];
if($institution){
    try{
        $statementFilters=kt360_statement_filters($_GET);
        $statement=kt360_statement($pdo,$institutionId,$statementFilters,500);
    }catch(Throwable $e){
        $statementError=$e->getMessage();
        $statementFilters=kt360_statement_filters([]);
        $statement=kt360_statement($pdo,$institutionId,$statementFilters,500);
    }
}
$statementQuery=http_build_query([
    'kurum_id'=>$institutionId,
    'baslangic'=>$statementFilters['baslangic'],
    'bitis'=>$statementFilters['bitis'],
    'para_birimi'=>$statementFilters['para_birimi'],
    'hareket_turu'=>$statementFilters['hareket_turu'],
]);
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Kurum Ticari 360 — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="kurum-ticari-360.css?v=1.2.55">
</head>
<body class="role-page sa-subpage">
<?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="ticari-dashboard.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Kurum Ticari 360</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="ticari-dashboard.php" aria-label="Ticari Dashboard"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="ticari-finans.php" aria-label="Ticari Finans"><svg><use href="#sa-database"/></svg></a>
<?php if($institutionId>0):?><a class="sa-page-action" href="ticari-belgeler.php?kurum_id=<?=$institutionId?>" aria-label="Ticari Belgeler"><svg><use href="#sa-database"/></svg></a><?php endif;?>
<a class="sa-page-action" href="tahsilat-risk.php" aria-label="Tahsilat Risk Merkezi"><svg><use href="#sa-alert"/></svg></a>
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>

<main class="role-content">
<?php if(!$ready):?>
<div class="role-note"><span>⚠️</span><p>Ticari finans tabloları hazır değil. Ticari Finans migrationı kurulduğunda Kurum Ticari 360 kullanılabilir.</p></div>
<?php elseif(!$institution):?>
<section class="role-hero">
<span class="eyeline">TİCARİ 360</span>
<h1>Kurum bulunamadı</h1>
<p>Geçerli bir kurum seçilmedi veya kurum kaydı bulunamadı.</p>
<span class="role-hero-art">🔎</span>
</section>
<a class="role-button" href="ticari-dashboard.php">Ticari Dashboard'a Dön</a>
<?php else:?>

<section class="role-hero">
<span class="eyeline">KURUM TİCARİ 360 · #<?=(int)$institution['id']?></span>
<h1><?=k360h((string)$institution['ad'])?></h1>
<p><?=k360h((string)$institution['kod'])?> · <?=((int)$institution['aktif']===1?'Aktif kurum':'Pasif kurum')?> · Sözleşme, tahsilat, risk, yenileme ve yönetici hatırlatma geçmişi.</p>
<span class="role-hero-art">360°</span>
</section>

<div class="k360-links">
<a class="role-pill ok" href="ticari-finans.php">Ticari Finans →</a>
<a class="role-pill" href="ticari-belgeler.php?kurum_id=<?=$institutionId?>">Ticari Belgeler →</a>
<a class="role-pill" href="tahsilat-risk.php">Tahsilat Risk →</a>
<a class="role-pill" href="lisans-yenilemeleri.php">Lisans Yenilemeleri →</a>
<a class="role-pill" href="kurumlar.php?sekme=kurumlar&amp;kurum_id=<?=$institutionId?>">Kurum Yönetimi →</a>
</div>

<section class="k360-counts">
<div><strong><?=(int)($counts['sozlesme']??0)?></strong><span>Sözleşme</span></div>
<div><strong><?=(int)($counts['aktif_sozlesme']??0)?></strong><span>Aktif sözleşme</span></div>
<div><strong><?=(int)($counts['gecikmis_sozlesme']??0)?></strong><span>Gecikmiş sözleşme</span></div>
<div><strong><?=(int)($counts['risk_acik']??0)?></strong><span>Açık risk</span></div>
<div><strong><?=(int)($counts['aktif_tahsilat']??0)?></strong><span>Aktif tahsilat</span></div>
<div><strong><?=(int)($counts['iptal_tahsilat']??0)?></strong><span>İptal tahsilat</span></div>
<div><strong><?=(int)($counts['yenileme']??0)?></strong><span>Yenileme vakası</span></div>
<div><strong><?=(int)($counts['hatirlatma']??0)?></strong><span>Hatırlatma</span></div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">FİNANSAL ÖZET</span><h2>Para Birimi Bazında Kurum Portföyü</h2></div><span class="role-pill">Salt okunur</span></div>
<?php if(!$summary):?><div class="role-empty"><span>—</span>Aktif veya tamamlanmış ticari sözleşme yok.</div><?php endif;?>
<div class="k360-summary">
<?php foreach($summary as $row):?>
<article>
<div class="k360-summary-head"><strong><?=k360h((string)$row['para_birimi'])?></strong><span><?=k360p((float)$row['tahsilat_orani'])?> tahsilat</span></div>
<div class="k360-summary-grid">
<div><span>Aktif sözleşme değeri</span><strong><?=k360m($row['aktif_sozlesme_toplami'])?></strong></div>
<div><span>Portföy</span><strong><?=k360m($row['portfoy_toplami'])?></strong></div>
<div><span>Tahsil edilen</span><strong><?=k360m($row['tahsil_edilen'])?></strong></div>
<div><span>Açık bakiye</span><strong><?=k360m($row['kalan_tutar'])?></strong></div>
<div><span>Gecikmiş bakiye</span><strong><?=k360m($row['gecikmis_bakiye'])?></strong></div>
<div><span>Yenileme sözleşmesi</span><strong><?=(int)$row['yenileme_sozlesmesi']?></strong></div>
</div>
</article>
<?php endforeach;?>
</div>
</section>

<section class="role-section">
<div class="role-section-head">
<div><span class="eyeline">HESAP EKSTRESİ</span><h2>Dönemsel Ticari Hareketler</h2></div>
<a class="role-pill ok" href="kurum-ticari-ekstre-csv.php?<?=k360h($statementQuery)?>">CSV / Excel'e Aktar ↓</a>
</div>

<?php if($statementError!==''):?><div class="role-note"><span>⚠️</span><p><?=k360h($statementError)?> Varsayılan dönem gösteriliyor.</p></div><?php endif;?>

<form class="k360-statement-filter" method="get">
<input type="hidden" name="kurum_id" value="<?=$institutionId?>">
<label>Başlangıç
<input type="date" name="baslangic" value="<?=k360h((string)$statementFilters['baslangic'])?>" required>
</label>
<label>Bitiş
<input type="date" name="bitis" value="<?=k360h((string)$statementFilters['bitis'])?>" required>
</label>
<label>Para Birimi
<select name="para_birimi">
<option value="">Tümü</option>
<?php foreach(['TRY','USD','EUR'] as $ccy):?><option value="<?=$ccy?>" <?=$statementFilters['para_birimi']===$ccy?'selected':''?>><?=$ccy?></option><?php endforeach;?>
</select>
</label>
<label>Hareket
<select name="hareket_turu">
<option value="tum" <?=$statementFilters['hareket_turu']==='tum'?'selected':''?>>Tüm hareketler</option>
<option value="sozlesme" <?=$statementFilters['hareket_turu']==='sozlesme'?'selected':''?>>Sözleşme borçları</option>
<option value="tahsilat" <?=$statementFilters['hareket_turu']==='tahsilat'?'selected':''?>>Tahsilatlar</option>
</select>
</label>
<button type="submit">Ekstreyi Getir</button>
<a href="kurum-ticari-360.php?kurum_id=<?=$institutionId?>">Bu Yıl</a>
</form>

<div class="k360-statement-summary">
<?php if(!$statement['summary']):?><div class="role-empty">Seçilen dönem için finansal hareket yok.</div><?php endif;?>
<?php foreach($statement['summary'] as $row):?>
<article>
<div><strong><?=k360h((string)$row['para_birimi'])?></strong><span><?=k360h((string)$statementFilters['baslangic'])?> → <?=k360h((string)$statementFilters['bitis'])?></span></div>
<div class="k360-statement-summary-grid">
<div><span>Açılış</span><strong><?=k360m($row['acilis_bakiyesi'])?></strong></div>
<div><span>Dönem Borcu</span><strong><?=k360m($row['donem_borcu'])?></strong></div>
<div><span>Dönem Tahsilatı</span><strong><?=k360m($row['donem_tahsilati'])?></strong></div>
<div><span>Kapanış</span><strong><?=k360m($row['kapanis_bakiyesi'])?></strong></div>
</div>
</article>
<?php endforeach;?>
</div>

<div class="k360-statement-wrap">
<table class="k360-statement-table">
<thead><tr>
<th>Tarih</th><th>Tür</th><th>Referans</th><th>Açıklama</th><th>PB</th><th>Borç</th><th>Tahsilat</th><th>Bakiye</th>
</tr></thead>
<tbody>
<?php if(!$statement['rows']):?><tr><td colspan="8">Seçilen filtreye uyan finansal hareket yok.</td></tr><?php endif;?>
<?php foreach($statement['rows'] as $row):?>
<tr>
<td><?=k360h((string)$row['hareket_tarihi'])?></td>
<td><span class="role-pill <?=$row['hareket_turu']==='tahsilat'?'ok':''?>"><?=$row['hareket_turu']==='sozlesme'?'Sözleşme':'Tahsilat'?></span></td>
<td><?=k360h((string)$row['referans'])?></td>
<td><?=k360h((string)$row['aciklama'])?><?php if((string)($row['odeme_yontemi']??'')!==''):?><small><?=k360h((string)$row['odeme_yontemi'])?></small><?php endif;?></td>
<td><?=k360h((string)$row['para_birimi'])?></td>
<td><?=((float)$row['borc']!==0.0?k360m($row['borc']):'—')?></td>
<td><?=((float)$row['tahsilat']!==0.0?k360m($row['tahsilat']):'—')?></td>
<td><strong><?=k360m($row['bakiye'])?></strong></td>
</tr>
<?php endforeach;?>
</tbody>
</table>
</div>
<?php if(!empty($statement['truncated'])):?><div class="role-note"><span>ℹ️</span><p>Ekran ilk 500 hareketi gösteriyor. CSV dışa aktarımı 10.000 harekete kadar destekler; daha geniş kayıt için tarih aralığını daralt.</p></div><?php endif;?>
<div class="role-note"><span>ℹ️</span><p>Ekstre bakiyesi yalnız aktif/tamamlanmış sözleşme borçları ile aktif tahsilatlardan hesaplanır. İptal tahsilatlar finansal bakiyeyi değiştirmez; audit geçmişinde aşağıdaki “Aktif & İptal Tahsilat Geçmişi” bölümünde korunur.</p></div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">SÖZLEŞMELER</span><h2>Tüm Ticari Sözleşmeler</h2></div><span class="role-pill"><?=count($contracts)?></span></div>
<div class="k360-table-wrap">
<table class="k360-table">
<thead><tr>
<th>Sözleşme</th><th>Paket</th><th>Durum</th><th>Dönem</th><th>Vade</th><th>Taksit Planı</th><th>Toplam</th><th>Tahsilat</th><th>Açık</th><th>Risk</th><th>Yenileme</th><th>Hatırlatma</th>
</tr></thead>
<tbody>
<?php if(!$contracts):?><tr><td colspan="12">Kurum için sözleşme kaydı yok.</td></tr><?php endif;?>
<?php foreach($contracts as $row):?>
<tr class="<?=!empty($row['gecikmis'])?'k360-overdue':''?>">
<td><a href="ticari-finans.php?sozlesme_id=<?=(int)$row['id']?>"><strong><?=k360h((string)$row['sozlesme_no'])?></strong><small>#<?=(int)$row['id']?></small></a></td>
<td><?=k360h((string)($row['paket_adi']?:'—'))?></td>
<td><span class="role-pill"><?=k360h(k360_contract_status((string)$row['durum']))?></span></td>
<td><?=k360h((string)$row['baslangic_tarihi'])?><small><?=k360h((string)($row['bitis_tarihi']?:'Süresiz'))?></small></td>
<td><?php if(!empty($row['taksit_plani_aktif']) && !empty($row['taksit_sonraki_vade'])):?><?=k360h((string)$row['taksit_sonraki_vade'])?><small>Sonraki taksit</small><?php else:?><?=k360h((string)($row['vade_tarihi']?:'—'))?><?php endif;?><?php if(!empty($row['gecikmis'])):?><small class="k360-danger">Gecikmiş</small><?php endif;?></td>
<td><?php if((string)($row['taksit_plan_durumu']??'')!==''):?><a class="role-pill <?=!empty($row['taksit_plani_aktif'])?'ok':''?>" href="ticari-finans.php?sozlesme_id=<?=(int)$row['id']?>"><?=k360h((string)$row['taksit_plan_durumu'])?> · <?=(int)($row['taksit_sayisi']??0)?></a><?php if((float)($row['taksit_gecikmis_tutar']??0)>0):?><small class="k360-danger"><?=k360m($row['taksit_gecikmis_tutar'])?> <?=k360h((string)$row['para_birimi'])?> gecikmiş</small><?php endif;?><?php else:?>—<?php endif;?></td>
<td><?=k360m($row['toplam_tutar'])?> <?=k360h((string)$row['para_birimi'])?></td>
<td><?=k360m($row['tahsil_edilen'])?> <?=k360h((string)$row['para_birimi'])?><small><?=(int)$row['aktif_tahsilat_sayisi']?> aktif / <?=(int)$row['tahsilat_gecmisi']?> geçmiş</small></td>
<td><?=k360m($row['kalan_tutar'])?> <?=k360h((string)$row['para_birimi'])?></td>
<td><?php if((string)($row['risk_durumu']??'')!==''):?><a class="role-pill" href="tahsilat-risk.php?sozlesme_id=<?=(int)$row['id']?>"><?=k360h((string)$row['risk_durumu'])?></a><?php else:?>—<?php endif;?></td>
<td><?php if((int)($row['yenileme_id']??0)>0):?><a class="role-pill" href="lisans-yenilemeleri.php?yenileme_id=<?=(int)$row['yenileme_id']?>">#<?=(int)$row['yenileme_id']?></a><?php else:?>—<?php endif;?></td>
<td><?=(int)$row['hatirlatma_sayisi']?><?php if((string)($row['son_hatirlatma_tarihi']??'')!==''):?><small><?=k360h(date('d.m.Y',strtotime((string)$row['son_hatirlatma_tarihi'])))?></small><?php endif;?></td>
</tr>
<?php endforeach;?>
</tbody>
</table>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">TAHSİLAT HAREKETLERİ</span><h2>Aktif & İptal Tahsilat Geçmişi</h2></div><span class="role-pill"><?=count($payments)?></span></div>
<div class="role-list k360-payments">
<?php if(!$payments):?><div class="role-empty"><span>—</span>Tahsilat hareketi yok.</div><?php endif;?>
<?php foreach($payments as $row):?>
<a class="role-row <?=$row['durum']==='iptal'?'k360-cancelled':''?>" href="ticari-finans.php?sozlesme_id=<?=(int)$row['sozlesme_id']?>">
<span><?=$row['durum']==='iptal'?'↩':'₺'?></span>
<div>
<strong><?=k360h((string)($row['sozlesme_no']?:'#'.$row['sozlesme_id']))?> · <?=k360h((string)$row['tahsilat_tarihi'])?></strong>
<small><?=k360h((string)$row['odeme_yontemi'])?>
<?php if((string)($row['referans_no']??'')!==''):?> · <?=k360h((string)$row['referans_no'])?><?php endif;?>
<?php if($row['durum']==='iptal' && (string)($row['iptal_nedeni']??'')!==''):?> · İptal: <?=k360h((string)$row['iptal_nedeni'])?><?php endif;?>
</small>
</div>
<span class="role-pill <?=$row['durum']==='aktif'?'ok':''?>"><?=k360h(k360_payment_status((string)$row['durum']))?> · <?=k360m($row['tutar'])?> <?=k360h((string)$row['para_birimi'])?></span>
</a>
<?php endforeach;?>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">LİSANS YENİLEME</span><h2>Yenileme Geçmişi</h2></div><span class="role-pill"><?=count($renewals)?></span></div>
<div class="role-list">
<?php if(!$renewals):?><div class="role-empty"><span>—</span>Bu kurum için yenileme vakası yok.</div><?php endif;?>
<?php foreach($renewals as $row):?>
<a class="role-row" href="lisans-yenilemeleri.php?yenileme_id=<?=(int)$row['id']?>">
<span><?=((string)$row['durum']==='yenilendi'?'✅':((string)$row['durum']==='yenilenmedi'?'❌':'⏳'))?></span>
<div><strong>Yenileme #<?=(int)$row['id']?> · <?=k360h(k360_renewal_status((string)$row['durum']))?></strong>
<small>Hedef <?=k360h((string)$row['hedef_bitis_tarihi'])?>
<?php if((string)($row['sonuc_bitis_tarihi']??'')!==''):?> · Sonuç <?=k360h((string)$row['sonuc_bitis_tarihi'])?><?php endif;?>
<?php if((string)($row['sonuc_paket_adi']??'')!==''):?> · <?=k360h((string)$row['sonuc_paket_adi'])?><?php endif;?>
<?php if((int)($row['sozlesme_id']??0)>0):?> · Sözleşme #<?=(int)$row['sozlesme_id']?><?php endif;?>
</small></div>
<span class="role-pill"><?=k360h(k360_renewal_status((string)$row['durum']))?></span>
</a>
<?php endforeach;?>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">YÖNETİCİ BİLDİRİMLERİ</span><h2>Tahsilat Hatırlatma Geçmişi</h2></div><span class="role-pill"><?=count($reminders)?></span></div>
<div class="k360-reminders">
<?php if(!$reminders):?><div class="role-empty">Bu kurum için gönderilmiş tahsilat hatırlatması yok.</div><?php endif;?>
<?php foreach($reminders as $row):?>
<article>
<div><strong><?=k360h((string)($row['sozlesme_no']?:'#'.$row['sozlesme_id']))?> · <?=k360h((string)$row['esik_kodu'])?></strong><span><?=k360h(date('d.m.Y H:i',strtotime((string)$row['olusturulma_tarihi'])))?></span></div>
<small>Vade <?=k360h((string)$row['vade_tarihi'])?> · Snapshot <?=k360m($row['acik_tutar'])?> <?=k360h((string)$row['para_birimi'])?> · <?=(int)$row['alici_sayisi']?> yönetici</small>
</article>
<?php endforeach;?>
</div>
</section>

<div class="role-note"><span>🔒</span><p>Kurum Ticari 360 salt-okunurdur. Finansal durum mevcut sözleşme/tahsilat kayıtlarından hesaplanır; bu ekran sözleşme, ödeme, risk, yenileme veya bildirim kaydı değiştirmez.</p></div>
<?php endif;?>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a href="ticari-dashboard.php"><span>📊</span>KPI</a>
<a class="active" href="#"><span>360°</span>Kurum 360</a>
<a href="ticari-belgeler.php?kurum_id=<?=$institutionId?>"><span>🧾</span>Belgeler</a>
<a href="ticari-finans.php"><span>₺</span>Finans</a>
<a href="tahsilat-risk.php"><span>⚠️</span>Risk</a>
</nav>
</div>
</body>
</html>
