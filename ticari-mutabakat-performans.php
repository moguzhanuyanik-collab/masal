<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/ticari_finans.php';
require __DIR__.'/src/ticari_belgeler.php';
require __DIR__.'/src/ticari_mutabakat.php';
require __DIR__.'/src/ticari_mutabakat_aksiyon.php';
require __DIR__.'/src/ticari_mutabakat_saglik.php';
require __DIR__.'/src/ticari_mutabakat_performans.php';
require __DIR__.'/src/ticari_mutabakat_hedef.php';

$user=require_role('super_admin');
$pdo=db();
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');

function mph(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
function mpf(float|int $value,int $precision=1): string {
    return number_format((float)$value,$precision,',','.');
}
function mp_issue_label(string $type): string {
    return $type==='butunluk'?'Veri Bütünlüğü':'Operasyon Açığı';
}

$days=mp_window_days($_GET['gun']??30);
$ready=mp_tables_ready($pdo);

$summary=$ready?mp_summary($pdo,$days):[];
$owners=$ready?mp_owner_rows($pdo,$days,100):[];
$issues=$ready?mp_issue_rows($pdo,$days):[];
$monthly=$ready?mp_monthly_closed($pdo,6):[];
$recent=$ready?mp_recent_closed_rows($pdo,$days,40):[];
$targetReady=$ready&&mh_tables_ready($pdo);
$targetClosed=$targetReady?mh_closed_target_summary($pdo,$days):[];
$targetIssues=$targetReady?mh_issue_target_summary($pdo,$days):[];

$monthMax=0;
foreach($monthly as $row)$monthMax=max($monthMax,(int)$row['closed_count']);
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Mutabakat Operasyon Performansı — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="ticari-mutabakat-performans.css?v=1.2.67">
</head>
<body class="role-page sa-subpage">
<?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Mutabakat Operasyon Performansı</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="ticari-mutabakat-hedefleri.php" aria-label="Operasyon Hedefleri"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-hedef-risk.php" aria-label="Hedef Risk Kuyruğu"><svg><use href="#sa-alert"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-saglik.php" aria-label="Aksiyon Sağlığı"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-is-kutusu.php" aria-label="Günlük İş Kutusu"><svg><use href="#sa-card"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-eskalasyon.php" aria-label="Operasyon Eskalasyonu"><svg><use href="#sa-alert"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat.php" aria-label="Mutabakat Kontrol"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>

<main class="role-content">
<section class="role-hero">
<span class="eyeline">OPERASYON ANALİTİĞİ</span>
<h1>Mutabakat Performans & Çevrim Dashboardu</h1>
<p>Açık yükü geçmiş kapanış döngüleriyle birlikte ölç; ilk müdahale, çevrim süresi, yeniden açılma, hatırlatma ve eskalasyon hacmini append-only operasyon geçmişinden izle.</p>
<span class="role-hero-art">📈</span>
</section>

<div class="role-note"><span>ℹ️</span><p>Bu ekran çalışan puanı, başarı notu veya sözleşmesel SLA üretmez. 1.2.67 hedef politikaları mevcutsa yalnız iç operasyon hedef uyumunu ayrıca gösterir; eskalasyon eşiklerini veya kullanıcı yetkilerini değiştirmez.</p></div>

<?php if(!$ready):?>
<div class="role-note"><span>⚠️</span><p>Mutabakat aksiyon tabloları hazır değil. 086 migration kurulduğunda performans görünümü otomatik açılır.</p></div>
<?php else:?>

<section class="mp-window">
<div><strong>Rapor Penceresi</strong><span>Kapanış ve bildirim metriklerinin tarih aralığı</span></div>
<nav>
<?php foreach([7,30,90] as $window):?>
<a class="<?=$days===$window?'active':''?>" href="ticari-mutabakat-performans.php?gun=<?=$window?>"><?=$window?> Gün</a>
<?php endforeach;?>
</nav>
</section>

<section class="mp-summary">
<div><strong><?=(int)($summary['open']??0)?></strong><span>Mevcut açık vaka</span></div>
<div><strong><?=(int)($summary['closed']??0)?></strong><span><?=$days?> günde kapanan</span></div>
<div><strong><?=mpf((float)($summary['avg_cycle_days']??0))?></strong><span>Ort. çevrim günü</span></div>
<div><strong><?=mpf((float)($summary['avg_first_response_hours']??0))?></strong><span>Ort. ilk müdahale saati</span></div>
<div><strong><?=mpf((float)($summary['reopen_rate']??0))?>%</strong><span>Reopen oranı</span></div>
<div><strong><?=(int)($summary['open_age_8_plus']??0)?></strong><span>8+ gün açık</span></div>
<div><strong><?=(int)($summary['reminders']??0)?></strong><span>Hatırlatma</span></div>
<div><strong><?=(int)($summary['escalations']??0)?></strong><span>Eskalasyon</span></div>
</section>

<?php if($targetReady):?>
<section class="role-section">
<div class="role-section-head">
<div><span class="eyeline">OPERASYON HEDEFLERİ</span><h2><?=$days?> Günlük Hedef Uyum Görünümü</h2></div>
<a class="role-pill ok" href="ticari-mutabakat-hedefleri.php">Hedef Politikaları →</a>
</div>
<div class="mp-target-summary">
<div><strong><?=(int)($targetClosed['policy_evaluable']??0)?></strong><span>Politika ile değerlendirilen</span></div>
<div><strong><?=mpf((float)($targetClosed['cycle_within_rate']??0))?>%</strong><span>Çevrim hedef içi</span></div>
<div><strong><?=mpf((float)($targetClosed['first_within_rate']??0))?>%</strong><span>İlk müdahale hedef içi</span></div>
<div><strong><?=(int)($targetClosed['cycle_outside']??0)?></strong><span>Çevrim hedef dışı</span></div>
<div><strong><?=(int)($targetClosed['first_outside']??0)?></strong><span>İlk müdahale hedef dışı</span></div>
<div><strong><?=(int)($targetClosed['no_policy']??0)?></strong><span>Politika öncesi</span></div>
</div>
<div class="mp-target-issues">
<?php foreach($targetIssues as $row):?>
<article>
<strong><?=mph(mp_issue_label((string)$row['sorun_turu']))?></strong>
<span><?=(int)$row['eligible']?> değerlendirilen kapanış</span>
<small>Çevrim <?=mpf((float)$row['cycle_rate'])?>% · İlk müdahale <?=mpf((float)$row['first_rate'])?>%</small>
</article>
<?php endforeach;?>
</div>
<div class="role-note"><span>🕓</span><p>Her kapanış döngüsü, döngü başladığı anda geçerli olan politika versiyonuyla ölçülür. Sonradan yayınlanan hedefler geçmiş sonuçları geriye dönük değiştirmez.</p></div>
</section>
<?php endif;?>

<section class="role-section">
<div class="role-section-head">
<div><span class="eyeline"><?=$days?> GÜNLÜK ÇEVRİM</span><h2>Kapanış & Müdahale Göstergeleri</h2></div>
<span class="role-pill"><?=(int)($summary['opened_cycles']??0)?> açılan/reopen döngüsü</span>
</div>
<div class="mp-cycle-grid">
<div><span>Kapanan döngü</span><strong><?=(int)($summary['closed']??0)?></strong></div>
<div><span>Ort. çevrim</span><strong><?=mpf((float)($summary['avg_cycle_days']??0))?> gün</strong></div>
<div><span>En uzun çevrim</span><strong><?=(int)($summary['max_cycle_days']??0)?> gün</strong></div>
<div><span>İlk müdahale yapılan</span><strong><?=(int)($summary['responded_closed']??0)?></strong></div>
<div><span>Ort. ilk müdahale</span><strong><?=mpf((float)($summary['avg_first_response_hours']??0))?> saat</strong></div>
<div><span>En uzun ilk müdahale</span><strong><?=mpf((float)($summary['max_first_response_hours']??0))?> saat</strong></div>
<div><span>Reopen sonrası kapanan</span><strong><?=(int)($summary['reopened_closed']??0)?></strong></div>
<div><span>Açık gecikmiş aksiyon</span><strong><?=(int)($summary['open_overdue_action']??0)?></strong></div>
<div><span>Açık ilk müdahale yok</span><strong><?=(int)($summary['open_no_first_intervention']??0)?></strong></div>
</div>
<div class="role-note"><span>↻</span><p>Kapanıp yeniden açılan vakalarda çevrim başlangıcı ilk kayıt tarihi değil, mevcut/son açık döngünün <strong>vaka_yeniden_acildi</strong> zamanıdır.</p></div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">SORUN TÜRÜ</span><h2>Operasyon / Bütünlük Kırılımı</h2></div></div>
<div class="mp-issue-grid">
<?php if(!$issues):?><div class="role-empty">Raporlanacak mutabakat vakası yok.</div><?php endif;?>
<?php foreach($issues as $row):?>
<article>
<div><strong><?=mph(mp_issue_label((string)$row['sorun_turu']))?></strong><span><?=(int)$row['open_count']?> açık</span></div>
<div class="mp-issue-values">
<span><b><?=(int)$row['closed_count']?></b> kapanan</span>
<span><b><?=mpf((float)$row['avg_cycle_days'])?></b> gün çevrim</span>
<span><b><?=mpf((float)$row['avg_first_response_hours'])?></b> saat ilk müdahale</span>
<span><b><?=(int)$row['reopened_closed']?></b> reopen</span>
</div>
</article>
<?php endforeach;?>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">SORUMLU BAZLI</span><h2>Objektif Operasyon Göstergeleri</h2></div><span class="role-pill"><?=count($owners)?></span></div>
<div class="mp-table-wrap">
<table class="mp-table">
<thead><tr>
<th>Sorumlu</th><th>Açık</th><th>Gecikmiş</th><th>8+ Gün</th><th>Kapanan</th><th>Ort. Çevrim</th><th>Ort. İlk Müdahale</th><th>Reopen</th><th>Hatırlatma</th><th>Eskalasyon</th>
</tr></thead>
<tbody>
<?php if(!$owners):?><tr><td colspan="10">Bu pencerede sorumlu bazlı operasyon verisi yok.</td></tr><?php endif;?>
<?php foreach($owners as $row):
$ownerId=(int)$row['sorumlu_kullanici_id'];
?>
<tr>
<td>
<?php if($ownerId>0):?><a href="ticari-mutabakat-saglik.php?sorumlu_kullanici_id=<?=$ownerId?>"><strong><?=mph((string)$row['sorumlu_adi'])?></strong></a>
<?php else:?><a href="ticari-mutabakat-devir.php?sorumlu_durumu=sahipsiz"><strong><?=mph((string)$row['sorumlu_adi'])?></strong></a><?php endif;?>
</td>
<td><?=(int)$row['open_count']?></td>
<td class="<?=((int)$row['overdue_action']>0?'mp-danger':'')?>"><?=(int)$row['overdue_action']?></td>
<td><?=(int)$row['age_8_plus']?></td>
<td><?=(int)$row['closed_count']?></td>
<td><?=mpf((float)$row['avg_cycle_days'])?> gün</td>
<td><?=mpf((float)$row['avg_first_response_hours'])?> saat</td>
<td><?=(int)$row['reopened_closed']?></td>
<td><?=(int)$row['reminders']?></td>
<td><?=(int)$row['escalations']?></td>
</tr>
<?php endforeach;?>
</tbody>
</table>
</div>
<div class="role-note"><span>🔎</span><p>Sorumlu tablosu sıralama/puanlama amacı taşımaz. Mevcut açık iş yükü ile seçili penceredeki kapanış ve bildirim hacmini aynı yerde gösterir.</p></div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">6 AYLIK TREND</span><h2>Kapanan Mutabakat Döngüleri</h2></div></div>
<div class="mp-trend">
<?php if(!$monthly):?><div class="role-empty">Son 6 ayda kapanan mutabakat vakası yok.</div><?php endif;?>
<?php foreach($monthly as $row):
$width=$monthMax>0?max(4,min(100,((int)$row['closed_count']/$monthMax)*100)):0;
?>
<article>
<div><strong><?=mph((string)$row['ay'])?> · <?=mph(mp_issue_label((string)$row['sorun_turu']))?></strong><span><?=(int)$row['closed_count']?> kapanan</span></div>
<div class="mp-trend-bar"><i style="width:<?=number_format($width,2,'.','')?>%"></i></div>
<small>Ort. çevrim <?=mpf((float)$row['avg_cycle_days'])?> gün</small>
</article>
<?php endforeach;?>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">SON KAPANIŞLAR</span><h2><?=$days?> Günlük Vaka Döngüleri</h2></div><a class="role-pill ok" href="ticari-mutabakat-saglik.php">Aksiyon Sağlığı →</a></div>
<div class="role-list mp-closed-list">
<?php if(!$recent):?><div class="role-empty"><span>—</span>Seçili pencerede kapanan vaka yok.</div><?php endif;?>
<?php foreach($recent as $row):?>
<a class="role-row" href="ticari-mutabakat-aksiyon.php?vaka_id=<?=(int)$row['vaka_id']?>">
<span><?=((string)$row['sorun_turu']==='butunluk'?'🧩':'✓')?></span>
<div>
<strong><?=mph((string)$row['kurum_adi'])?> · <?=mph((string)$row['sozlesme_no'])?></strong>
<small><?=mph(mp_issue_label((string)$row['sorun_turu']))?> · <?=mph((string)$row['sorumlu_adi'])?> · Çevrim <?=mpf((float)$row['cevrim_gun'])?> gün
<?php if($row['ilk_mudahale_saat']!==null):?> · İlk müdahale <?=mpf((float)$row['ilk_mudahale_saat'])?> saat<?php else:?> · İlk müdahale kaydı yok<?php endif;?>
<?php if(!empty($row['yeniden_acildi'])):?> · Reopen döngüsü<?php endif;?>
</small>
</div>
<span class="role-pill"><?=mph(date('d.m.Y H:i',strtotime((string)$row['kapanma_tarihi'])))?></span>
</a>
<?php endforeach;?>
</div>
</section>

<div class="role-note"><span>🔒</span><p>Bu dashboard salt-okunurdur. Vaka, sorumlu, aksiyon tarihi, hatırlatma veya eskalasyon kaydı oluşturmaz. Operasyonel değişiklikler ilgili Aksiyon, Planlama, Devir, Hatırlatma ve Eskalasyon merkezlerinde yapılır.</p></div>
<?php endif;?>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a href="ticari-dashboard.php"><span>📊</span>KPI</a>
<a href="ticari-mutabakat.php"><span>⚖️</span>Mutabakat</a>
<a href="ticari-mutabakat-is-kutusu.php"><span>📥</span>İş Kutusu</a>
<a href="ticari-mutabakat-aksiyon.php"><span>🧭</span>Aksiyon</a>
<a href="ticari-mutabakat-saglik.php"><span>🩺</span>Sağlık</a>
<a class="active" href="ticari-mutabakat-performans.php"><span>📈</span>Performans</a>
<a href="ticari-mutabakat-hedef-risk.php"><span>🎯</span>Hedef Risk</a>
<a href="ticari-mutabakat-hedefleri.php"><span>🎯</span>Hedefler</a>
<a href="ticari-mutabakat-eskalasyon.php"><span>🚨</span>Eskalasyon</a>
<a href="ticari-mutabakat-devir.php"><span>🔁</span>Devir</a>
</nav>
</div>
</body>
</html>
