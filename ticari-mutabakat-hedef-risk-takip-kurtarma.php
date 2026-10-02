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
require __DIR__.'/src/ticari_mutabakat_hedef_risk_takip_kurtarma.php';

$user=require_role('super_admin');
$pdo=db();
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');

function mrtrh(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }

$ready=mrtr_tables_ready($pdo);
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
        if((string)($_POST['action']??'')!=='recover_stale') throw new RuntimeException('Geçersiz işlem.');

        $result=mrtr_recover_selected(
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
            'ok'=>(int)$result['recovered'].' stale plan güncel bağlamla yeni takip planına dönüştürüldü.',
        ]);
        header('Location: ticari-mutabakat-hedef-risk-takip-kurtarma.php?'.$query);
        exit;
    }catch(PDOException $e){
        $error='Veritabanı işlemi tamamlanamadı.';
    }catch(Throwable $e){
        $error=$e->getMessage();
    }
}

$rows=$ready?mrtr_rows($pdo,$user,$filters,700):[];
$summary=$ready?mrtr_summary($pdo,$user,$days):[];
$ownerOptions=$ready?mrts_owner_options($pdo,$user,$days):[];
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Stale Hedef-Risk Takip Planı Kurtarma — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="ticari-mutabakat-hedef-risk-takip-kurtarma.css?v=1.2.79">
</head>
<body class="role-page sa-subpage">
<?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Stale Takip Planı Kurtarma</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="ticari-mutabakat-hedef-risk-takip-saglik.php" aria-label="Takip Planı Sağlığı"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-hedef-risk-takip-mudahale.php" aria-label="Current-Context Müdahale"><svg><use href="#sa-alert"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-hedef-risk-takip.php" aria-label="Okunmamış Risk Takibi"><svg><use href="#sa-users"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-is-kutusu.php" aria-label="Günlük İş Kutusu"><svg><use href="#sa-users"/></svg></a>
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>

<main class="role-content">
<section class="role-hero">
<span class="eyeline">STALE PLAN KURTARMA</span>
<h1>Eski Planı Taşımadan Güncel Bağlamda Yeni Takip Planı Oluştur</h1>
<p>Owner, reopen döngüsü, hedef-risk sinyali veya exact notification değişmiş eski planları yalnız bugün hâlâ current open + exact unread hedef-risk koşulları sağlanıyorsa güvenle yeniden planla.</p>
<span class="role-hero-art">♻️</span>
</section>

<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=mrtrh($error)?></p></div><?php endif;?>
<?php if($success!==''):?><div class="role-note"><span>✅</span><p><?=mrtrh($success)?></p></div><?php endif;?>

<div class="role-note"><span>🔒</span><p>Bu merkez stale planın owner, reopen döngüsü, eski sinyali veya eski notification bilgisini yeni plana kopyalamaz. Yalnız güncel owner ve exact current unread hedef-risk bildirimi allowlistini kullanır; owner değiştirmez, bildirimi okundu yapmaz ve yeni risk bildirimi üretmez.</p></div>

<?php if(!$ready):?>
<div class="role-note"><span>⚠️</span><p>Takip planı sağlığı, current unread resolver veya owner-preserving planlama altyapısı henüz hazır değil.</p></div>
<?php else:?>

<section class="mrtr-summary">
<div><strong><?=(int)($summary['total']??0)?></strong><span>Kurtarma adayı</span></div>
<a href="?days=<?=$days?>&state=owner_degisti"><strong><?=(int)($summary['owner_changed']??0)?></strong><span>Owner değişti</span></a>
<a href="?days=<?=$days?>&state=dongu_degisti"><strong><?=(int)($summary['cycle_changed']??0)?></strong><span>Reopen döngüsü</span></a>
<a href="?days=<?=$days?>&state=sinyal_degisti"><strong><?=(int)($summary['signal_changed']??0)?></strong><span>Sinyal değişti</span></a>
<a href="?days=<?=$days?>&state=bildirim_degisti"><strong><?=(int)($summary['notice_changed']??0)?></strong><span>Bildirim değişti</span></a>
<a href="?days=<?=$days?>&state=plan_bildirimi_yok"><strong><?=(int)($summary['plan_notice_missing']??0)?></strong><span>Plan bildirimi yok</span></a>
</section>

<section class="role-section">
<div class="role-section-head">
<div><span class="eyeline">FİLTRE</span><h2>Stale + Exact Current Unread Kesişimi</h2></div>
<div><a class="role-pill" href="ticari-mutabakat-hedef-risk-takip-saglik.php">Plan Sağlığı →</a> <a class="role-pill" href="ticari-mutabakat-hedef-risk-takip-mudahale.php">Current Müdahale →</a></div>
</div>
<form class="mrtr-filter" method="get">
<select name="days">
<?php foreach([7,30,90,180,365] as $option):?><option value="<?=$option?>" <?=$days===$option?'selected':''?>>Son <?=$option?> gün</option><?php endforeach;?>
</select>
<select name="state">
<option value="">Tüm stale durumlar</option>
<?php foreach(mrtr_state_labels() as $value=>$label):?><option value="<?=mrtrh($value)?>" <?=$filters['state']===$value?'selected':''?>><?=mrtrh($label)?></option><?php endforeach;?>
</select>
<select name="signal">
<option value="">Tüm güncel sinyaller</option>
<option value="hedef_75" <?=$filters['signal']==='hedef_75'?'selected':''?>>Güncel %75+</option>
<option value="hedef_disinda" <?=$filters['signal']==='hedef_disinda'?'selected':''?>>Güncel hedef dışında</option>
</select>
<select name="owner_id">
<option value="0">Tüm güncel sorumlular</option>
<?php foreach($ownerOptions as $id=>$name):?><option value="<?=(int)$id?>" <?=(int)$filters['owner_id']===(int)$id?'selected':''?>><?=mrtrh($name)?></option><?php endforeach;?>
</select>
<input type="search" name="q" value="<?=mrtrh((string)$filters['q'])?>" placeholder="Kurum, sözleşme, eski/yeni owner, plan notu">
<button type="submit">Filtrele</button>
<a href="ticari-mutabakat-hedef-risk-takip-kurtarma.php">Temizle</a>
</form>
</section>

<form method="post" class="mrtr-plan-form">
<input type="hidden" name="csrf" value="<?=mrtrh(csrf_token())?>">
<input type="hidden" name="action" value="recover_stale">
<input type="hidden" name="days" value="<?=$days?>">
<input type="hidden" name="state" value="<?=mrtrh((string)$filters['state'])?>">
<input type="hidden" name="owner_id" value="<?=(int)$filters['owner_id']?>">
<input type="hidden" name="signal" value="<?=mrtrh((string)$filters['signal'])?>">
<input type="hidden" name="q" value="<?=mrtrh((string)$filters['q'])?>">

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">YENİ CURRENT PLAN</span><h2>Seçili Stale Planları Kurtar</h2></div><span class="role-pill">En fazla 50 vaka</span></div>
<div class="mrtr-plan-grid">
<label>Yeni sonraki aksiyon tarihi
<input class="role-input" type="date" name="sonraki_aksiyon_tarihi" min="<?=date('Y-m-d')?>" required>
</label>
<label>Takip notu <small>İsteğe bağlı · en fazla 600 karakter</small>
<textarea class="role-input" name="not" maxlength="600" rows="3" placeholder="Yeni current-context planının nedeni veya sonraki adım..."></textarea>
</label>
</div>
<div class="mrtr-plan-actions">
<label><input id="mrtr-select-first" type="checkbox"> İlk 50 görünür adayı seç</label>
<button class="role-button" type="submit">Seçili Stale Planları Kurtar</button>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">KURTARMA ADAYLARI</span><h2>Eski Plan → Güncel Context</h2></div><span class="role-pill"><?=count($rows)?> görünür</span></div>
<div class="mrtr-list">
<?php if(!$rows):?><div class="role-empty"><span>✅</span>Filtreye uyan ve bugün exact current unread bağlamıyla kurtarılabilir stale plan yok.</div><?php endif;?>
<?php foreach($rows as $row):
$state=(string)$row['takip_durumu'];
?>
<label class="mrtr-row">
<input class="mrtr-case-check" type="checkbox" name="vaka_ids[]" value="<?=(int)$row['vaka_id']?>">
<span class="mrtr-kind">↻</span>
<span class="mrtr-main">
<strong><?=mrtrh((string)$row['kurum_adi'])?> · <?=mrtrh((string)$row['sozlesme_no'])?></strong>
<small><?=mrtrh((string)$row['takip_durumu_etiketi'])?> · <?=mrtrh((string)$row['takip_nedeni'])?></small>
<div class="mrtr-context">
<span><b>Eski plan</b> <?=mrtrh((string)($row['plan_alici_adi']?:'—'))?> · <?=mrtrh((string)($row['plan_esik_kodu']?:'—'))?> · Bildirim #<?=(int)($row['plan_bildirim_id']??0)?></span>
<span><b>Güncel</b> <?=mrtrh((string)($row['kurtarma_alici_adi']?:'—'))?> · <?=mrtrh((string)($row['kurtarma_esik_kodu']?:'—'))?> · Bildirim #<?=(int)($row['kurtarma_bildirim_id']??0)?></span>
</div>
<?php if((string)($row['plan_notu']??'')!==''):?><em>Eski plan notu: <?=mrtrh((string)$row['plan_notu'])?></em><?php endif;?>
</span>
<a href="ticari-mutabakat-aksiyon.php?vaka_id=<?=(int)$row['vaka_id']?>" target="_blank" rel="noopener">Detay →</a>
</label>
<?php endforeach;?>
</div>
</section>
</form>

<div class="role-note"><span>ℹ️</span><p><strong>Okundu</strong>, <strong>Risk Çözüldü</strong>, <strong>Vaka Kapandı</strong> ve bugün exact current unread bildirimi bulunmayan stale kayıtlar kurtarma allowlistine alınmaz. Kurtarma başarılı olduğunda yeni <code>toplu_takip_planlama</code> olayı son current plan olur; eski plan geçmişten silinmez.</p></div>
<?php endif;?>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a href="ticari-mutabakat-is-kutusu.php"><span>📥</span>İş Kutusu</a>
<a href="ticari-mutabakat-hedef-risk-takip.php"><span>🗓️</span>Planla</a>
<a href="ticari-mutabakat-hedef-risk-takip-saglik.php"><span>🩺</span>Plan Sağlığı</a>
<a href="ticari-mutabakat-hedef-risk-takip-mudahale.php"><span>🛠️</span>Müdahale</a>
<a class="active" href="ticari-mutabakat-hedef-risk-takip-kurtarma.php"><span>♻️</span>Kurtarma</a>
<a href="ticari-mutabakat-aksiyon.php"><span>🧭</span>Aksiyon</a>
</nav>
<script>
(() => {
  const master=document.getElementById('mrtr-select-first');
  if(!master) return;
  master.addEventListener('change',() => {
    const checks=Array.from(document.querySelectorAll('.mrtr-case-check'));
    checks.forEach((box,index) => { box.checked=master.checked && index<50; });
  });
})();
</script>
</div>
</body>
</html>
