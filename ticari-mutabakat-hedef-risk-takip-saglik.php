<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/ticari_belge.php';
require __DIR__.'/src/ticari_mutabakat.php';
require __DIR__.'/src/ticari_mutabakat_aksiyon.php';
require __DIR__.'/src/ticari_mutabakat_saglik.php';
require __DIR__.'/src/ticari_mutabakat_planlama.php';
require __DIR__.'/src/ticari_mutabakat_performans.php';
require __DIR__.'/src/ticari_mutabakat_hedef.php';
require __DIR__.'/src/ticari_mutabakat_hedef_risk.php';
require __DIR__.'/src/ticari_mutabakat_is_kutusu.php';
require __DIR__.'/src/bildirimler.php';
require __DIR__.'/src/ticari_mutabakat_hedef_risk_bildirim.php';
require __DIR__.'/src/ticari_mutabakat_hedef_risk_saglik.php';
require __DIR__.'/src/ticari_mutabakat_hedef_risk_takip.php';
require __DIR__.'/src/ticari_mutabakat_hedef_risk_takip_saglik.php';

$user=require_role('super_admin');
$pdo=db();
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');

function mrtsh(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
function mrts_state_class(string $state): string {
    return match($state){
        'owner_degisti','dongu_degisti','sinyal_degisti','bildirim_degisti'=>'stale',
        'aksiyon_gecikmis'=>'critical',
        'aksiyon_bugun','aksiyon_tarihi_yok'=>'warning',
        'planli_okunmadi'=>'active',
        'okundu','risk_cozuldu','vaka_kapandi'=>'ok',
        default=>'neutral',
    };
}

$ready=mrts_tables_ready($pdo);
$days=mrh_window_days($_GET['days']??30);
$filters=[
    'days'=>$days,
    'state'=>(string)($_GET['state']??''),
    'owner_id'=>(int)($_GET['owner_id']??0),
    'signal'=>(string)($_GET['signal']??''),
    'q'=>(string)($_GET['q']??''),
];

$rows=$ready?mrts_rows($pdo,$user,$filters,700):[];
$summary=$ready?mrts_summary($pdo,$user,$days):[];
$owners=$ready?mrts_owner_rows($pdo,$user,$days):[];
$ownerOptions=$ready?mrts_owner_options($pdo,$user,$days):[];
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Hedef-Risk Takip Planı Sağlığı — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="ticari-mutabakat-hedef-risk-takip-saglik.css?v=1.2.77">
</head>
<body class="role-page sa-subpage">
<?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Hedef-Risk Takip Planı Sağlığı</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="ticari-mutabakat-hedef-risk-takip.php" aria-label="Okunmamış Risk Takibi"><svg><use href="#sa-users"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-hedef-risk-takip-mudahale.php" aria-label="Takip Sağlığı Müdahale"><svg><use href="#sa-alert"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-hedef-risk-saglik.php" aria-label="Bildirim Sağlığı"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-is-kutusu.php" aria-label="Günlük İş Kutusu"><svg><use href="#sa-users"/></svg></a>
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>

<main class="role-content">
<section class="role-hero">
<span class="eyeline">TAKİP PLANI SAĞLIĞI</span>
<h1>Planlanan Okunmamış Risklerin Son Durumu</h1>
<p>Son hedef-risk takip planını bugünkü owner, reopen döngüsü, exact current signal, notification okunma durumu ve aksiyon tarihiyle karşılaştır.</p>
<span class="role-hero-art">🩺</span>
</section>

<div class="role-note"><span>🔒</span><p>Bu ekran salt-okunurdur. Bildirimi okundu yapmaz, owner veya aksiyon tarihi değiştirmez, yeni bildirim göndermez ve vaka state'ine yazmaz. Yalnız son <code>toplu_takip_planlama</code> olayını güncel bağlamla karşılaştırır.</p></div>

<?php if(!$ready):?>
<div class="role-note"><span>⚠️</span><p>Hedef-risk takip planı, bildirim sağlığı veya current notification resolver altyapısı henüz hazır değil.</p></div>
<?php else:?>

<section class="mrts-summary">
<div><strong><?=(int)($summary['total']??0)?></strong><span>Son takip planı</span></div>
<a href="?days=<?=$days?>&state=aksiyon_gecikmis"><strong><?=(int)($summary['overdue']??0)?></strong><span>Aksiyon gecikmiş</span></a>
<a href="?days=<?=$days?>&state=aksiyon_bugun"><strong><?=(int)($summary['today']??0)?></strong><span>Aksiyon bugün</span></a>
<a href="?days=<?=$days?>&state=aksiyon_tarihi_yok"><strong><?=(int)($summary['no_date']??0)?></strong><span>Aksiyon tarihi yok</span></a>
<div><strong><?=(int)($summary['active_unread']??0)?></strong><span>Aktif + okunmadı</span></div>
<a href="?days=<?=$days?>&state=okundu"><strong><?=(int)($summary['read']??0)?></strong><span>Okundu</span></a>
<div><strong><?=((int)($summary['owner_changed']??0)+(int)($summary['cycle_changed']??0)+(int)($summary['signal_changed']??0))?></strong><span>Bağlam değişti</span></div>
<div><strong><?=((int)($summary['resolved']??0)+(int)($summary['closed']??0))?></strong><span>Çözüldü / kapandı</span></div>
</section>

<section class="role-section">
<div class="role-section-head">
<div><span class="eyeline">FİLTRE</span><h2>Takip Planı Durumları</h2></div>
<div><a class="role-pill" href="ticari-mutabakat-hedef-risk-takip.php">Yeni Takip Planla →</a> <a class="role-pill" href="ticari-mutabakat-hedef-risk-takip-mudahale.php">Sağlık Müdahalesi →</a></div>
</div>
<form class="mrts-filter" method="get">
<select name="days">
<?php foreach([7,30,90,180,365] as $option):?><option value="<?=$option?>" <?=$days===$option?'selected':''?>>Son <?=$option?> gün</option><?php endforeach;?>
</select>
<select name="state">
<option value="">Tüm durumlar</option>
<?php foreach(mrts_state_labels() as $value=>$label):?><option value="<?=mrtsh($value)?>" <?=$filters['state']===$value?'selected':''?>><?=mrtsh($label)?></option><?php endforeach;?>
</select>
<select name="signal">
<option value="">Tüm plan sinyalleri</option>
<option value="hedef_75" <?=$filters['signal']==='hedef_75'?'selected':''?>>%75+</option>
<option value="hedef_disinda" <?=$filters['signal']==='hedef_disinda'?'selected':''?>>Hedef dışında</option>
</select>
<select name="owner_id">
<option value="0">Tüm güncel sorumlular</option>
<?php foreach($ownerOptions as $id=>$name):?><option value="<?=(int)$id?>" <?=(int)$filters['owner_id']===(int)$id?'selected':''?>><?=mrtsh($name)?></option><?php endforeach;?>
</select>
<input type="search" name="q" value="<?=mrtsh((string)$filters['q'])?>" placeholder="Kurum, sözleşme, owner, plan notu">
<button type="submit">Filtrele</button>
<a href="ticari-mutabakat-hedef-risk-takip-saglik.php">Temizle</a>
</form>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">OWNER GÖRÜNÜMÜ</span><h2>Güncel Sorumlu Bazlı Takip Yükü</h2></div><span class="role-pill"><?=count($owners)?> sorumlu</span></div>
<div class="mrts-owner-table-wrap">
<table class="mrts-owner-table">
<thead><tr><th>Sorumlu</th><th>Toplam plan</th><th>Dikkat</th><th>Aktif okunmadı</th><th>Gecikmiş</th><th>Bugün</th><th>Okundu</th><th>Bağlam değişti</th></tr></thead>
<tbody>
<?php if(!$owners):?><tr><td colspan="8">Seçilen pencerede takip planı yok.</td></tr><?php endif;?>
<?php foreach($owners as $owner):?>
<tr>
<td><?=mrtsh((string)$owner['owner_name'])?></td>
<td><?=(int)$owner['total']?></td>
<td><?=(int)$owner['attention']?></td>
<td><?=(int)$owner['active_unread']?></td>
<td><?=(int)$owner['overdue']?></td>
<td><?=(int)$owner['today']?></td>
<td><?=(int)$owner['read']?></td>
<td><?=(int)$owner['context_changed']?></td>
</tr>
<?php endforeach;?>
</tbody>
</table>
</div>
<div class="role-note"><span>ℹ️</span><p>Bu tablo çalışan puanı veya performans sıralaması değildir. Yalnız mevcut takip planlarının operasyon durumunu ve güncel sorumlu bağlamını gösterir.</p></div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">PLAN SAĞLIĞI</span><h2>Son Takip Planları</h2></div><span class="role-pill"><?=count($rows)?> görünür</span></div>
<div class="mrts-list">
<?php if(!$rows):?><div class="role-empty"><span>✅</span>Filtreye uyan hedef-risk takip planı yok.</div><?php endif;?>
<?php foreach($rows as $row):
$state=(string)$row['takip_durumu'];
$next=(string)($row['sonraki_aksiyon_tarihi']??'');
?>
<article class="mrts-row <?=mrtsh(mrts_state_class($state))?>">
<div class="mrts-row-icon"><?=in_array($state,['owner_degisti','dongu_degisti','sinyal_degisti','bildirim_degisti'],true)?'↻':($state==='aksiyon_gecikmis'?'🚨':($state==='okundu'?'✓':'🗓️'))?></div>
<div class="mrts-main">
<div class="mrts-title">
<strong><?=mrtsh((string)$row['kurum_adi'])?> · <?=mrtsh((string)$row['sozlesme_no'])?></strong>
<span class="role-pill <?=mrtsh(mrts_state_class($state))?>"><?=mrtsh((string)$row['takip_durumu_etiketi'])?></span>
</div>
<small>Planlayan <?=mrtsh((string)$row['planlayan_adi'])?> · <?=mrtsh(date('d.m.Y H:i',strtotime((string)$row['plan_tarihi'])))?> · Plan sinyali <?=mrtsh((string)($row['plan_esik_kodu']?:'—'))?></small>
<small>Plan alıcısı <?=mrtsh((string)$row['plan_alici_adi'])?> · Güncel owner <?=mrtsh((string)$row['guncel_sorumlu_adi'])?> · Sonraki aksiyon <?=mrtsh($next!==''?$next:'Yok')?></small>
<?php if((string)($row['guncel_hedef_risk_etiketi']??'')!==''):?><small>Güncel hedef-risk: <?=mrtsh((string)$row['guncel_hedef_risk_etiketi'])?> · Bildirim <?=mrtsh((string)($row['guncel_bildirim_durumu']?:'—'))?></small><?php endif;?>
<p><?=mrtsh((string)$row['takip_nedeni'])?></p>
<?php if((string)($row['plan_notu']??'')!==''):?><em><?=mrtsh((string)$row['plan_notu'])?></em><?php endif;?>
</div>
<div class="mrts-actions">
<a href="ticari-mutabakat-aksiyon.php?vaka_id=<?=(int)$row['vaka_id']?>">Vaka →</a>
<?php if(in_array($state,['owner_degisti','dongu_degisti','sinyal_degisti','bildirim_degisti'],true)):?>
<a href="ticari-mutabakat-is-kutusu.php">İş Kutusu →</a>
<?php elseif(in_array($state,['aksiyon_gecikmis','aksiyon_bugun','aksiyon_tarihi_yok','planli_okunmadi'],true)):?>
<a href="ticari-mutabakat-hedef-risk-takip.php">Takip →</a>
<?php else:?>
<a href="ticari-mutabakat-hedef-risk-saglik.php">Bildirim Sağlığı →</a>
<?php endif;?>
</div>
</article>
<?php endforeach;?>
</div>
</section>

<div class="role-note"><span>ℹ️</span><p>Bir planın <strong>Owner Değişti</strong>, <strong>Reopen Döngüsü Değişti</strong> veya <strong>Hedef-Risk Sinyali Değişti</strong> olması eski kaydı silmez. Bu durumlar yalnız eski takip planının artık current-case bağlamına uygulanmaması gerektiğini gösterir.</p></div>
<?php endif;?>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a href="ticari-mutabakat-is-kutusu.php"><span>📥</span>İş Kutusu</a>
<a href="ticari-mutabakat-hedef-risk-saglik.php"><span>📨</span>Bildirim</a>
<a href="ticari-mutabakat-hedef-risk-takip.php"><span>🗓️</span>Planla</a>
<a class="active" href="ticari-mutabakat-hedef-risk-takip-saglik.php"><span>🩺</span>Plan Sağlığı</a>
<a href="ticari-mutabakat-hedef-risk-takip-mudahale.php"><span>🛠️</span>Müdahale</a>
<a href="ticari-mutabakat-aksiyon.php"><span>🧭</span>Aksiyon</a>
</nav>
</div>
</body>
</html>
