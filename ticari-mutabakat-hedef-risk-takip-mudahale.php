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
require __DIR__.'/src/ticari_mutabakat_hedef_risk_takip_mudahale.php';

$user=require_role('super_admin');
$pdo=db();
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');

function mrtmh(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }

$ready=mrtm_tables_ready($pdo);
$days=mrh_window_days($_REQUEST['days']??30);
$filters=[
    'days'=>$days,
    'state'=>(string)($_REQUEST['state']??''),
    'owner_id'=>(int)($_REQUEST['owner_id']??0),
    'signal'=>(string)($_REQUEST['signal']??''),
    'q'=>(string)($_REQUEST['q']??''),
];
$error='';
$success=trim((string)($_GET['ok']??''));

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar dene.');
        if((string)($_POST['action']??'')!=='reschedule_attention') throw new RuntimeException('Geçersiz işlem.');

        $result=mrtm_reschedule_selected(
            $pdo,$user,
            is_array($_POST['vaka_ids']??null)?$_POST['vaka_ids']:[],
            (string)($_POST['sonraki_aksiyon_tarihi']??''),
            (string)($_POST['not']??''),
            $filters
        );

        $query=http_build_query([
            'days'=>$days,
            'state'=>$filters['state'],
            'owner_id'=>$filters['owner_id'],
            'signal'=>$filters['signal'],
            'q'=>$filters['q'],
            'ok'=>(int)$result['updated'].' vaka owner korunarak yeniden planlandı.',
        ]);
        header('Location: ticari-mutabakat-hedef-risk-takip-mudahale.php?'.$query);
        exit;
    }catch(Throwable $e){
        $error=$e->getMessage();
    }
}

$rows=$ready?mrtm_rows($pdo,$user,$filters,700):[];
$summary=$ready?mrtm_summary($pdo,$user,$days):[];
$ownerOptions=$ready?mrts_owner_options($pdo,$user,$days):[];
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Hedef-Risk Takip Sağlığı Müdahale Merkezi — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="ticari-mutabakat-hedef-risk-takip-mudahale.css?v=1.2.78">
</head>
<body class="role-page sa-subpage">
<?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Takip Sağlığı Müdahale</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="ticari-mutabakat-hedef-risk-takip-saglik.php" aria-label="Takip Planı Sağlığı"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-hedef-risk-takip.php" aria-label="Okunmamış Risk Takibi"><svg><use href="#sa-users"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-is-kutusu.php" aria-label="Günlük İş Kutusu"><svg><use href="#sa-users"/></svg></a>
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>

<main class="role-content">
<section class="role-hero">
<span class="eyeline">TAKİP SAĞLIĞI MÜDAHALE</span>
<h1>Gecikmiş, Bugün ve Tarihsiz Planları Güvenle Yeniden Planla</h1>
<p>Yalnız current owner, current reopen döngüsü, exact current hedef-risk sinyali ve exact okunmamış notification bağlamı hâlâ geçerli olan planlara müdahale et.</p>
<span class="role-hero-art">🛠️</span>
</section>

<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=mrtmh($error)?></p></div><?php endif;?>
<?php if($success!==''):?><div class="role-note"><span>✅</span><p><?=mrtmh($success)?></p></div><?php endif;?>

<div class="role-note"><span>🔒</span><p>Bu merkez owner değiştirmez, bildirimi okundu yapmaz, yeni hedef-risk bildirimi göndermez ve stale owner/döngü/sinyal/bildirim planlarını yeniden planlamaz. Seçimler POST anında yeniden doğrulanır.</p></div>

<?php if(!$ready):?>
<div class="role-note"><span>⚠️</span><p>Hedef-risk takip planı sağlığı veya current notification resolver altyapısı henüz hazır değil.</p></div>
<?php else:?>

<section class="mrtm-summary">
<div><strong><?=(int)($summary['total']??0)?></strong><span>Müdahale adayı</span></div>
<a href="?days=<?=$days?>&state=aksiyon_gecikmis"><strong><?=(int)($summary['overdue']??0)?></strong><span>Aksiyon gecikmiş</span></a>
<a href="?days=<?=$days?>&state=aksiyon_bugun"><strong><?=(int)($summary['today']??0)?></strong><span>Aksiyon bugün</span></a>
<a href="?days=<?=$days?>&state=aksiyon_tarihi_yok"><strong><?=(int)($summary['no_date']??0)?></strong><span>Aksiyon tarihi yok</span></a>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">FİLTRE</span><h2>Current-Context Müdahale Allowlisti</h2></div><a class="role-pill" href="ticari-mutabakat-hedef-risk-takip-saglik.php">Plan Sağlığı →</a></div>
<form class="mrtm-filter" method="get">
<select name="days">
<?php foreach([7,30,90,180,365] as $option):?><option value="<?=$option?>" <?=$days===$option?'selected':''?>>Son <?=$option?> gün</option><?php endforeach;?>
</select>
<select name="state">
<option value="">Tüm müdahale durumları</option>
<?php foreach(mrtm_state_labels() as $value=>$label):?><option value="<?=mrtmh($value)?>" <?=$filters['state']===$value?'selected':''?>><?=mrtmh($label)?></option><?php endforeach;?>
</select>
<select name="signal">
<option value="">Tüm plan sinyalleri</option>
<option value="hedef_75" <?=$filters['signal']==='hedef_75'?'selected':''?>>%75+</option>
<option value="hedef_disinda" <?=$filters['signal']==='hedef_disinda'?'selected':''?>>Hedef dışında</option>
</select>
<select name="owner_id">
<option value="0">Tüm güncel sorumlular</option>
<?php foreach($ownerOptions as $id=>$name):?><option value="<?=(int)$id?>" <?=(int)$filters['owner_id']===(int)$id?'selected':''?>><?=mrtmh($name)?></option><?php endforeach;?>
</select>
<input type="search" name="q" value="<?=mrtmh((string)$filters['q'])?>" placeholder="Kurum, sözleşme, owner, plan notu">
<button type="submit">Filtrele</button>
<a href="ticari-mutabakat-hedef-risk-takip-mudahale.php">Temizle</a>
</form>
</section>

<form method="post" class="mrtm-plan-form">
<input type="hidden" name="csrf" value="<?=mrtmh(csrf_token())?>">
<input type="hidden" name="action" value="reschedule_attention">
<input type="hidden" name="days" value="<?=$days?>">
<input type="hidden" name="state" value="<?=mrtmh((string)$filters['state'])?>">
<input type="hidden" name="owner_id" value="<?=(int)$filters['owner_id']?>">
<input type="hidden" name="signal" value="<?=mrtmh((string)$filters['signal'])?>">
<input type="hidden" name="q" value="<?=mrtmh((string)$filters['q'])?>">

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">YENİDEN PLANLAMA</span><h2>Seçili Sağlık Müdahaleleri</h2></div><span class="role-pill">En fazla 50 vaka</span></div>
<div class="mrtm-plan-grid">
<label>Yeni sonraki aksiyon tarihi
<input class="role-input" type="date" name="sonraki_aksiyon_tarihi" min="<?=date('Y-m-d')?>" required>
</label>
<label>Takip notu <small>İsteğe bağlı · en fazla 600 karakter</small>
<textarea class="role-input" name="not" maxlength="600" rows="3" placeholder="Yeniden planlama nedeni veya sonraki adım..."></textarea>
</label>
</div>
<div class="mrtm-plan-actions">
<label><input id="mrtm-select-first" type="checkbox"> İlk 50 görünür adayı seç</label>
<button class="role-button" type="submit">Seçili Takipleri Yeniden Planla</button>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">MÜDAHALE ADAYLARI</span><h2>Current-Context Takip Sağlığı</h2></div><span class="role-pill"><?=count($rows)?> görünür</span></div>
<div class="mrtm-list">
<?php if(!$rows):?><div class="role-empty"><span>✅</span>Filtreye uyan müdahale gerektiren current-context takip planı yok.</div><?php endif;?>
<?php foreach($rows as $row):
$state=(string)$row['takip_durumu'];
?>
<label class="mrtm-row <?=$state==='aksiyon_gecikmis'?'critical':'warning'?>">
<input class="mrtm-case-check" type="checkbox" name="vaka_ids[]" value="<?=(int)$row['vaka_id']?>">
<span class="mrtm-kind"><?=$state==='aksiyon_gecikmis'?'🚨':'🗓️'?></span>
<span class="mrtm-main">
<strong><?=mrtmh((string)$row['kurum_adi'])?> · <?=mrtmh((string)$row['sozlesme_no'])?></strong>
<small><?=mrtmh((string)$row['guncel_sorumlu_adi'])?> · <?=mrtmh((string)$row['takip_durumu_etiketi'])?> · Plan sinyali <?=mrtmh((string)($row['plan_esik_kodu']?:'—'))?></small>
<em>Mevcut aksiyon: <?=mrtmh((string)($row['sonraki_aksiyon_tarihi']?:'Yok'))?> · Bildirim <?=mrtmh((string)($row['guncel_bildirim_durumu']?:'—'))?></em>
</span>
<a href="ticari-mutabakat-aksiyon.php?vaka_id=<?=(int)$row['vaka_id']?>" target="_blank" rel="noopener">Detay →</a>
</label>
<?php endforeach;?>
</div>
</section>
</form>

<div class="role-note"><span>ℹ️</span><p><strong>Planlı · Okunmadı</strong> gelecekte planı olan vakalar bu allowliste alınmaz. <strong>Owner/Döngü/Sinyal/Bildirim Değişti</strong> durumları da stale bağlamdır; bunlar İş Kutusu veya vaka detayından yeniden değerlendirilmelidir.</p></div>
<?php endif;?>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a href="ticari-mutabakat-is-kutusu.php"><span>📥</span>İş Kutusu</a>
<a href="ticari-mutabakat-hedef-risk-takip.php"><span>🗓️</span>Planla</a>
<a href="ticari-mutabakat-hedef-risk-takip-saglik.php"><span>🩺</span>Plan Sağlığı</a>
<a class="active" href="ticari-mutabakat-hedef-risk-takip-mudahale.php"><span>🛠️</span>Müdahale</a>
<a href="ticari-mutabakat-aksiyon.php"><span>🧭</span>Aksiyon</a>
</nav>
<script>
(() => {
  const master=document.getElementById('mrtm-select-first');
  if(!master) return;
  master.addEventListener('change',() => {
    const checks=Array.from(document.querySelectorAll('.mrtm-case-check'));
    checks.forEach((box,index) => { box.checked=master.checked && index<50; });
  });
})();
</script>
</div>
</body>
</html>
