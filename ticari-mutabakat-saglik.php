<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/ticari_finans.php';
require __DIR__.'/src/ticari_belgeler.php';
require __DIR__.'/src/ticari_mutabakat.php';
require __DIR__.'/src/ticari_mutabakat_aksiyon.php';
require __DIR__.'/src/ticari_mutabakat_saglik.php';

$user=require_role('super_admin');
$pdo=db();
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');

function mhsh(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
function mhs_type_label(string $type): string {
    return $type==='butunluk'?'Veri Bütünlüğü':'Operasyon Açığı';
}
function mhs_stage_label(string $stage): string {
    return ma_stage_labels()[$stage]??$stage;
}
function mhs_health_tags(array $row): array {
    $tags=[];
    if(!empty($row['aksiyon_gecikti'])) $tags[]=['Gecikmiş aksiyon','danger'];
    elseif(!empty($row['aksiyon_bugun'])) $tags[]=['Aksiyon bugün','warning'];
    if(!empty($row['sahipsiz'])) $tags[]=['Sahipsiz','danger'];
    if(!empty($row['aksiyon_tarihi_yok'])) $tags[]=['Aksiyon tarihi yok','muted'];
    if(!empty($row['ilk_mudahale_yok'])) $tags[]=['İlk müdahale yok','warning'];
    if((string)$row['durum']==='beklemede') $tags[]=['Dış aksiyon','waiting'];
    return $tags;
}

$ready=mhs_tables_ready($pdo);
$filters=[
    'q'=>(string)($_GET['q']??''),
    'sorun_turu'=>(string)($_GET['sorun_turu']??''),
    'yas'=>(string)($_GET['yas']??''),
    'saglik'=>(string)($_GET['saglik']??''),
    'sorumlu_kullanici_id'=>(string)($_GET['sorumlu_kullanici_id']??''),
];

$summary=$ready?mhs_summary($pdo):[];
$owners=$ready?mhs_owner_workload($pdo,100):[];
$closed=$ready?mhs_recent_closed_metrics($pdo,30):[];
$rows=$ready?mhs_case_rows($pdo,$filters,900):[];
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Mutabakat Aksiyon Sağlığı — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="ticari-mutabakat-saglik.css?v=1.2.60">
</head>
<body class="role-page sa-subpage">
<?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Mutabakat Aksiyon Sağlığı</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="ticari-mutabakat-aksiyon.php" aria-label="Mutabakat Aksiyon"><svg><use href="#sa-alert"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat.php" aria-label="Mutabakat Kontrol"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="ticari-dashboard.php" aria-label="Ticari Dashboard"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>

<main class="role-content">
<section class="role-hero">
<span class="eyeline">OPERASYON SAĞLIĞI</span>
<h1>Mutabakat Vaka Yaşlandırma & Aksiyon Sağlığı</h1>
<p>Açık mutabakat vakalarının kaç gündür açık olduğunu, aksiyon tarihlerini, sahipsiz işleri, ilk müdahale eksiklerini ve sorumlu bazlı iş yükünü finansal kayıtlara dokunmadan izle.</p>
<span class="role-hero-art">🩺</span>
</section>

<div class="role-note"><span>ℹ️</span><p>Bu ekran SLA kararı vermez ve keyfi puan üretmez. Yalnız mevcut vaka yaşı, sorumlu, takip tarihi ve append-only geçmişten türetilen objektif operasyon göstergelerini sunar. Vaka üzerinde işlem yapmak için <a href="ticari-mutabakat-aksiyon.php">Mutabakat Aksiyon Merkezi</a> kullanılır.</p></div>

<?php if(!$ready):?>
<div class="role-note"><span>⚠️</span><p>1.2.59 mutabakat aksiyon tabloları hazır değil. 086 migration kurulduğunda sağlık görünümü otomatik açılır.</p></div>
<?php else:?>

<section class="mhs-summary">
<a href="ticari-mutabakat-saglik.php"><strong><?=(int)($summary['open']??0)?></strong><span>Açık vaka</span></a>
<a href="ticari-mutabakat-saglik.php?saglik=aksiyon_gecikti"><strong><?=(int)($summary['aksiyon_gecikti']??0)?></strong><span>Aksiyon gecikti</span></a>
<a href="ticari-mutabakat-saglik.php?saglik=aksiyon_bugun"><strong><?=(int)($summary['aksiyon_bugun']??0)?></strong><span>Aksiyon bugün</span></a>
<a href="ticari-mutabakat-saglik.php?saglik=sahipsiz"><strong><?=(int)($summary['sahipsiz']??0)?></strong><span>Sahipsiz</span></a>
<a href="ticari-mutabakat-saglik.php?saglik=aksiyon_tarihi_yok"><strong><?=(int)($summary['aksiyon_tarihi_yok']??0)?></strong><span>Aksiyon tarihi yok</span></a>
<a href="ticari-mutabakat-saglik.php?saglik=ilk_mudahale_yok"><strong><?=(int)($summary['ilk_mudahale_yok']??0)?></strong><span>İlk müdahale yok</span></a>
<a href="ticari-mutabakat-saglik.php?yas=8_plus"><strong><?=(int)($summary['yas_8_plus']??0)?></strong><span>8+ gün açık</span></a>
<a href="ticari-mutabakat-saglik.php?saglik=beklemede"><strong><?=(int)($summary['beklemede']??0)?></strong><span>Dış aksiyon</span></a>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">YAŞLANDIRMA</span><h2>Açık Vaka Dağılımı</h2></div><span class="role-pill">Mevcut açık döngü</span></div>
<div class="mhs-age-grid">
<a href="ticari-mutabakat-saglik.php?yas=0_1"><strong><?=(int)($summary['yas_0_1']??0)?></strong><span>0–1 gün</span></a>
<a href="ticari-mutabakat-saglik.php?yas=2_3"><strong><?=(int)($summary['yas_2_3']??0)?></strong><span>2–3 gün</span></a>
<a href="ticari-mutabakat-saglik.php?yas=4_7"><strong><?=(int)($summary['yas_4_7']??0)?></strong><span>4–7 gün</span></a>
<a href="ticari-mutabakat-saglik.php?yas=8_plus"><strong><?=(int)($summary['yas_8_plus']??0)?></strong><span>8+ gün</span></a>
<a href="ticari-mutabakat-saglik.php?sorun_turu=butunluk"><strong><?=(int)($summary['butunluk']??0)?></strong><span>Veri bütünlüğü</span></a>
<a href="ticari-mutabakat-saglik.php?sorun_turu=operasyon"><strong><?=(int)($summary['operasyon']??0)?></strong><span>Operasyon açığı</span></a>
</div>
<div class="role-note"><span>↻</span><p>Kapanıp yeniden açılan vakalarda yaş ilk oluşturulma tarihinden değil, append-only geçmişteki son <strong>vaka_yeniden_acildi</strong> olayından itibaren hesaplanır.</p></div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">SON 30 GÜN</span><h2>Kapanan Vaka Döngüleri</h2></div></div>
<div class="mhs-closed-grid">
<div><strong><?=(int)($closed['closed']??0)?></strong><span>Kapanan vaka</span></div>
<div><strong><?=number_format((float)($closed['avg_cycle_days']??0),1,',','.')?></strong><span>Ort. açık döngü günü</span></div>
<div><strong><?=(int)($closed['max_cycle_days']??0)?></strong><span>En uzun döngü günü</span></div>
<div><strong><?=(int)($closed['reopened_closed']??0)?></strong><span>Yeniden açılıp kapanan</span></div>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">SORUMLU YÜKÜ</span><h2>Açık Vaka İş Yükü</h2></div><span class="role-pill"><?=count($owners)?></span></div>
<div class="mhs-owner-grid">
<?php if(!$owners):?><div class="role-empty">Açık mutabakat vakası yok.</div><?php endif;?>
<?php foreach($owners as $owner):
$ownerParam=(int)$owner['sorumlu_kullanici_id']>0?(string)(int)$owner['sorumlu_kullanici_id']:'unassigned';
?>
<a href="ticari-mutabakat-saglik.php?sorumlu_kullanici_id=<?=urlencode($ownerParam)?>">
<div><strong><?=mhsh((string)$owner['sorumlu_adi'])?></strong><span><?=(int)$owner['open_count']?> açık</span></div>
<small><?=(int)$owner['butunluk_count']?> bütünlük · <?=(int)$owner['overdue_action']?> gecikmiş aksiyon · <?=(int)$owner['age_8_plus']?> adet 8+ gün · <?=(int)$owner['no_action_date']?> aksiyon tarihi yok</small>
</a>
<?php endforeach;?>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">SAĞLIK KUYRUĞU</span><h2>Açık Mutabakat Vakaları</h2></div><span class="role-pill"><?=count($rows)?></span></div>

<form class="mhs-filter" method="get">
<input type="search" name="q" value="<?=mhsh((string)$filters['q'])?>" placeholder="Kurum, sözleşme veya teşhis">
<select name="sorun_turu">
<option value="">Tüm sorun türleri</option>
<option value="butunluk" <?=$filters['sorun_turu']==='butunluk'?'selected':''?>>Veri bütünlüğü</option>
<option value="operasyon" <?=$filters['sorun_turu']==='operasyon'?'selected':''?>>Operasyon açığı</option>
</select>
<select name="yas">
<option value="">Tüm yaşlar</option>
<option value="0_1" <?=$filters['yas']==='0_1'?'selected':''?>>0–1 gün</option>
<option value="2_3" <?=$filters['yas']==='2_3'?'selected':''?>>2–3 gün</option>
<option value="4_7" <?=$filters['yas']==='4_7'?'selected':''?>>4–7 gün</option>
<option value="8_plus" <?=$filters['yas']==='8_plus'?'selected':''?>>8+ gün</option>
</select>
<select name="saglik">
<option value="">Tüm sağlık durumları</option>
<option value="aksiyon_gecikti" <?=$filters['saglik']==='aksiyon_gecikti'?'selected':''?>>Aksiyon gecikti</option>
<option value="aksiyon_bugun" <?=$filters['saglik']==='aksiyon_bugun'?'selected':''?>>Aksiyon bugün</option>
<option value="sahipsiz" <?=$filters['saglik']==='sahipsiz'?'selected':''?>>Sahipsiz</option>
<option value="aksiyon_tarihi_yok" <?=$filters['saglik']==='aksiyon_tarihi_yok'?'selected':''?>>Aksiyon tarihi yok</option>
<option value="ilk_mudahale_yok" <?=$filters['saglik']==='ilk_mudahale_yok'?'selected':''?>>İlk müdahale yok</option>
<option value="beklemede" <?=$filters['saglik']==='beklemede'?'selected':''?>>Dış aksiyon bekliyor</option>
</select>
<?php if((string)$filters['sorumlu_kullanici_id']!==''):?><input type="hidden" name="sorumlu_kullanici_id" value="<?=mhsh((string)$filters['sorumlu_kullanici_id'])?>"><?php endif;?>
<button type="submit">Filtrele</button>
<a href="ticari-mutabakat-saglik.php">Temizle</a>
</form>

<div class="role-list mhs-list">
<?php if(!$rows):?><div class="role-empty"><span>✅</span>Filtreye uyan açık mutabakat vakası yok.</div><?php endif;?>
<?php foreach($rows as $row):
$tags=mhs_health_tags($row);
?>
<a class="role-row mhs-row" href="ticari-mutabakat-aksiyon.php?vaka_id=<?=(int)$row['id']?>">
<span><?=((string)$row['sorun_turu']==='butunluk'?'🚨':'🧩')?></span>
<div>
<strong><?=mhsh((string)$row['kurum_adi'])?> · <?=mhsh((string)$row['sozlesme_no'])?></strong>
<small><?=mhsh(mhs_type_label((string)$row['sorun_turu']))?> · <?=mhsh(mhs_stage_label((string)$row['durum']))?> · <?=mhsh((string)$row['yas_etiketi'])?> açık
<?php if(!empty($row['sonraki_aksiyon_tarihi'])):?> · Aksiyon <?=mhsh((string)$row['sonraki_aksiyon_tarihi'])?><?php endif;?>
 · Sorumlu <?=mhsh((string)$row['sorumlu_adi'])?>
</small>
</div>
<div class="mhs-tags">
<?php foreach($tags as [$label,$class]):?><span class="role-pill <?=$class?>"><?=mhsh($label)?></span><?php endforeach;?>
<?php if(!$tags):?><span class="role-pill ok">Planlı</span><?php endif;?>
</div>
</a>
<?php endforeach;?>
</div>
</section>

<div class="role-note"><span>🔒</span><p>Bu sağlık ekranı yalnız okur. Vaka aşaması, sorumlu ve takip tarihi 1.2.59 Mutabakat Aksiyon Merkezi’nde yönetilir; finansal sözleşme, belge, tahsilat ve eşleme kayıtları burada değiştirilmez.</p></div>
<?php endif;?>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a href="ticari-dashboard.php"><span>📊</span>KPI</a>
<a href="ticari-mutabakat.php"><span>⚖️</span>Mutabakat</a>
<a href="ticari-mutabakat-aksiyon.php"><span>🧭</span>Aksiyon</a>
<a class="active" href="ticari-mutabakat-saglik.php"><span>🩺</span>Sağlık</a>
<a href="ticari-belgeler.php"><span>🧾</span>Belgeler</a>
<a href="ticari-finans.php"><span>₺</span>Finans</a>
</nav>
</div>
</body>
</html>
