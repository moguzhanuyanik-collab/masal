<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/ticari_belge.php';
require __DIR__.'/src/ticari_mutabakat.php';
require __DIR__.'/src/ticari_mutabakat_aksiyon.php';
require __DIR__.'/src/ticari_mutabakat_saglik.php';
require __DIR__.'/src/ticari_mutabakat_is_kutusu.php';

$user=require_role('super_admin');
$pdo=db();
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');

function mih(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
function mi_due_label(?string $value): string {
    $value=(string)$value;
    if($value==='') return 'Tarih yok';
    if($value<date('Y-m-d')) return 'Gecikti';
    if($value===date('Y-m-d')) return 'Bugün';
    return $value;
}

$ready=mi_tables_ready($pdo);
$scope=(string)($_GET['scope']??'mine');
if(!array_key_exists($scope,mi_scope_labels()))$scope='mine';
$window=(string)($_GET['window']??'all');
if(!array_key_exists($window,mi_window_labels()))$window='all';
$type=(string)($_GET['sorun_turu']??'');
$ownerFilter=(string)($_GET['owner_id']??'');
$query=trim((string)($_GET['q']??''));

$summary=$ready?mi_summary($pdo,$user):[];
$rows=$ready?mi_case_rows($pdo,$user,['scope'=>$scope,'window'=>$window,'sorun_turu'=>$type,'owner_id'=>$ownerFilter,'q'=>$query],700):[];
$team=$ready?mi_team_workload($pdo,100):[];
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Mutabakat Günlük İş Kutusu — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="ticari-mutabakat-is-kutusu.css?v=1.2.62">
</head>
<body class="role-page sa-subpage">
<?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Mutabakat Günlük İş Kutusu</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="ticari-mutabakat-aksiyon.php" aria-label="Aksiyon Merkezi"><svg><use href="#sa-alert"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-planlama.php" aria-label="Toplu Planlama"><svg><use href="#sa-refresh"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-saglik.php" aria-label="Sağlık"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>
<main class="role-content">
<section class="role-hero">
<span class="eyeline">GÜNLÜK OPERASYON</span>
<h1>Mutabakat İş Kutusu</h1>
<p>Bana atanan, bugün aksiyon bekleyen, gecikmiş veya plansız mutabakat vakalarını tek günlük iş görünümünde takip et.</p>
<span class="role-hero-art">📥</span>
</section>

<?php if(!$ready):?><div class="role-note"><span>⚠️</span><p>Mutabakat aksiyon tabloları hazır değil.</p></div><?php else:?>

<section class="mi-summary">
<a href="ticari-mutabakat-is-kutusu.php?scope=mine"><strong><?=(int)($summary['mine_open']??0)?></strong><span>Bana atanan</span></a>
<a href="ticari-mutabakat-is-kutusu.php?scope=mine&window=overdue"><strong><?=(int)($summary['mine_overdue']??0)?></strong><span>Gecikmiş</span></a>
<a href="ticari-mutabakat-is-kutusu.php?scope=mine&window=today"><strong><?=(int)($summary['mine_today']??0)?></strong><span>Bugün</span></a>
<a href="ticari-mutabakat-is-kutusu.php?scope=mine&window=next3"><strong><?=(int)($summary['mine_next3']??0)?></strong><span>3 gün</span></a>
<a href="ticari-mutabakat-is-kutusu.php?scope=mine&window=next7"><strong><?=(int)($summary['mine_next7']??0)?></strong><span>7 gün</span></a>
<a href="ticari-mutabakat-is-kutusu.php?scope=mine&window=no_date"><strong><?=(int)($summary['mine_no_date']??0)?></strong><span>Tarihsiz</span></a>
<a href="ticari-mutabakat-is-kutusu.php?scope=mine"><strong><?=(int)($summary['mine_waiting']??0)?></strong><span>Dış aksiyon bekliyor</span></a>
<a href="ticari-mutabakat-is-kutusu.php?scope=unassigned"><strong><?=(int)($summary['unassigned']??0)?></strong><span>Sahipsiz</span></a>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">FİLTRE</span><h2>Günlük İş Listesi</h2></div><span class="role-pill"><?=count($rows)?> vaka</span></div>
<form class="mi-filter" method="get">
<?php if($ownerFilter!==''):?><input type="hidden" name="owner_id" value="<?=mih($ownerFilter)?>"><?php endif;?>
<select name="scope"><?php foreach(mi_scope_labels() as $v=>$label):?><option value="<?=$v?>" <?=$scope===$v?'selected':''?>><?=mih($label)?></option><?php endforeach;?></select>
<select name="window"><?php foreach(mi_window_labels() as $v=>$label):?><option value="<?=$v?>" <?=$window===$v?'selected':''?>><?=mih($label)?></option><?php endforeach;?></select>
<select name="sorun_turu">
<option value="">Tüm sorun türleri</option>
<option value="butunluk" <?=$type==='butunluk'?'selected':''?>>Veri Bütünlüğü</option>
<option value="operasyon" <?=$type==='operasyon'?'selected':''?>>Operasyon Açığı</option>
</select>
<input type="search" name="q" value="<?=mih($query)?>" placeholder="Kurum, sözleşme veya teşhis">
<button type="submit">Filtrele</button>
<a href="ticari-mutabakat-is-kutusu.php">Temizle</a>
</form>

<div class="role-list mi-list">
<?php if(!$rows):?><div class="role-empty"><span>✅</span>Filtreye uyan açık mutabakat vakası yok.</div><?php endif;?>
<?php foreach($rows as $row):?>
<a class="role-row mi-row" href="ticari-mutabakat-aksiyon.php?vaka_id=<?=(int)$row['id']?>">
<span><?=((string)$row['sorun_turu']==='butunluk'?'🚨':'🧩')?></span>
<div>
<strong><?=mih((string)$row['kurum_adi'])?> · <?=mih((string)$row['sozlesme_no'])?></strong>
<small><?=mih((string)$row['sorumlu_adi'])?> · <?=mih((string)$row['yas_etiketi'])?> açık · <?=mih((string)$row['durum'])?> · <?=mih(mi_due_label($row['sonraki_aksiyon_tarihi']??null))?></small>
<em><?=mih((string)$row['son_aciklama'])?></em>
</div>
<div class="mi-tags">
<?php if(!empty($row['aksiyon_gecikti'])):?><span class="role-pill overdue">Gecikti</span><?php endif;?>
<?php if(!empty($row['aksiyon_bugun'])):?><span class="role-pill today">Bugün</span><?php endif;?>
<?php if(!empty($row['aksiyon_tarihi_yok'])):?><span class="role-pill nodate">Tarih Yok</span><?php endif;?>
<?php if(!empty($row['ilk_mudahale_yok'])):?><span class="role-pill">İlk Müdahale Yok</span><?php endif;?>
</div>
</a>
<?php endforeach;?>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">EKİP</span><h2>Sorumlu İş Yükü</h2></div><a class="role-pill ok" href="ticari-mutabakat-planlama.php">Toplu Planlama →</a></div>
<div class="mi-team">
<?php foreach($team as $row):?>
<a href="ticari-mutabakat-is-kutusu.php?scope=team&amp;owner_id=<?=((int)$row['sorumlu_kullanici_id']>0?(int)$row['sorumlu_kullanici_id']:'unassigned')?>">
<strong><?=mih((string)$row['sorumlu_adi'])?></strong>
<span><?=(int)$row['open_count']?> açık · <?=(int)$row['overdue_count']?> gecikmiş · <?=(int)$row['today_count']?> bugün · <?=(int)$row['next7_count']?> 7 gün · <?=(int)$row['no_date_count']?> tarihsiz · <?=(int)$row['integrity_count']?> bütünlük</span>
</a>
<?php endforeach;?>
</div>
</section>

<div class="role-note"><span>🔒</span><p>Bu ekran salt-okunurdur. Vaka sorumlusu, aksiyon tarihi veya aşaması burada değiştirilmez. Vaka düzenleme için Aksiyon Merkezi'ni, toplu sahiplik/tarih planlaması için Toplu Planlama ekranını kullan.</p></div>
<?php endif;?>
</main>
<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a class="active" href="ticari-mutabakat-is-kutusu.php"><span>📥</span>İş Kutusu</a>
<a href="ticari-mutabakat-aksiyon.php"><span>🧭</span>Aksiyon</a>
<a href="ticari-mutabakat-saglik.php"><span>🩺</span>Sağlık</a>
<a href="ticari-mutabakat-planlama.php"><span>🗂️</span>Planlama</a>
</nav>
</div>
</body>
</html>
