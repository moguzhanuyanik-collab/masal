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

$user=require_role('super_admin');
$pdo=db();
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');

function mrth(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }

function mrt_return_query(array $source): string {
    $out=[];
    $days=mrh_window_days($source['days']??30);
    if($days!==30)$out['days']=$days;
    $signal=(string)($source['signal']??'');
    if(in_array($signal,['hedef_75','hedef_disinda'],true))$out['signal']=$signal;
    $owner=max(0,(int)($source['owner_id']??0));
    if($owner>0)$out['owner_id']=$owner;
    return http_build_query($out);
}

$ready=mrt_tables_ready($pdo);
$error='';
$success=trim((string)($_GET['ok']??''));
$days=mrh_window_days($_GET['days']??30);
$filters=[
    'days'=>$days,
    'signal'=>(string)($_GET['signal']??''),
    'owner_id'=>(int)($_GET['owner_id']??0),
];

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)){
            throw new RuntimeException('Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar dene.');
        }
        if(!$ready) throw new RuntimeException('Hedef-risk takip planlama altyapısı henüz hazır değil.');
        if((string)($_POST['action']??'')!=='plan_unread'){
            throw new RuntimeException('Geçersiz işlem.');
        }

        $postFilters=[
            'days'=>mrh_window_days($_POST['days']??30),
            'signal'=>(string)($_POST['signal']??''),
            'owner_id'=>(int)($_POST['owner_id']??0),
        ];

        $result=mrt_plan_selected(
            $pdo,$user,
            is_array($_POST['vaka_ids']??null)?$_POST['vaka_ids']:[],
            (string)($_POST['sonraki_aksiyon_tarihi']??''),
            (string)($_POST['plan_notu']??''),
            $postFilters
        );

        $query=mrt_return_query($postFilters);
        $msg=(int)$result['updated'].' okunmamış hedef-risk vakası takip planına alındı · '
            .(int)$result['owner_count'].' mevcut sorumlu korundu · '
            .(string)$result['next_action_date'];
        header('Location: ticari-mutabakat-hedef-risk-takip.php'.($query!==''?'?'.$query.'&':'?').'ok='.rawurlencode($msg));
        exit;
    }catch(PDOException $e){
        $error='Veritabanı işlemi tamamlanamadı.';
    }catch(Throwable $e){
        $error=$e->getMessage();
    }
}

$rows=$ready?mrt_rows($pdo,$user,$filters,500):[];
$summary=$ready?mrt_summary($pdo,$user,$days):[];
$ownerOptions=$ready?mrh_owner_options($pdo,$days):[];
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Okunmamış Hedef Risk Takip Planlama — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="ticari-mutabakat-hedef-risk-takip.css?v=1.2.76">
</head>
<body class="role-page sa-subpage">
<?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Okunmamış Risk Takip Planlama</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="ticari-mutabakat-hedef-risk-saglik.php" aria-label="Bildirim Sağlığı"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-is-kutusu.php" aria-label="Günlük İş Kutusu"><svg><use href="#sa-users"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-planlama.php" aria-label="Toplu Planlama"><svg><use href="#sa-refresh"/></svg></a>
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>

<main class="role-content">
<section class="role-hero">
<span class="eyeline">HEDEF-RİSK TAKİBİ</span>
<h1>Okunmamış Riskleri Takip Planına Al</h1>
<p>Yalnız güncel açık döngüde, güncel sorumluya ait ve güncel hedef-risk sinyaliyle eşleşen okunmamış bildirimleri seç; sorumluyu değiştirmeden sonraki aksiyon tarihini planla.</p>
<span class="role-hero-art">🗓️</span>
</section>

<div class="role-note"><span>🔒</span><p>Bu akış bildirimi okundu yapmaz, yeni bildirim göndermez ve owner değiştirmez. POST anında current owner + current reopen döngüsü + exact current signal + okunmamış durumu yeniden doğrulanır.</p></div>

<?php if(!$ready):?><div class="role-note"><span>⚠️</span><p>Mutabakat hedef-risk, bildirim sağlığı veya toplu planlama altyapısı henüz hazır değil.</p></div><?php endif;?>
<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=mrth($error)?></p></div><?php endif;?>
<?php if($success!==''):?><div class="role-note"><span>✅</span><p><?=mrth($success)?></p></div><?php endif;?>

<?php if($ready):?>
<section class="mrt-summary">
<div><strong><?=(int)($summary['total']??0)?></strong><span>Güncel açık + okunmadı</span></div>
<a href="?days=<?=$days?>&signal=hedef_disinda"><strong><?=(int)($summary['outside']??0)?></strong><span>Hedef dışında</span></a>
<a href="?days=<?=$days?>&signal=hedef_75"><strong><?=(int)($summary['target_75']??0)?></strong><span>Hedef %75+</span></a>
<div><strong><?=(int)($summary['overdue_action']??0)?></strong><span>Aksiyon tarihi gecikmiş</span></div>
<div><strong><?=(int)($summary['no_action_date']??0)?></strong><span>Aksiyon tarihi yok</span></div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">FİLTRE</span><h2>Planlanacak Okunmamış Bildirimler</h2></div><a class="role-pill" href="ticari-mutabakat-hedef-risk-saglik.php?state=guncel_acik_okunmadi">Sağlık Dashboardu →</a></div>
<form class="mrt-filter" method="get">
<select name="days">
<?php foreach([7,30,90,180,365] as $option):?><option value="<?=$option?>" <?=$days===$option?'selected':''?>>Son <?=$option?> gün</option><?php endforeach;?>
</select>
<select name="signal">
<option value="">Tüm güncel sinyaller</option>
<option value="hedef_75" <?=$filters['signal']==='hedef_75'?'selected':''?>>%75+</option>
<option value="hedef_disinda" <?=$filters['signal']==='hedef_disinda'?'selected':''?>>Hedef dışında</option>
</select>
<select name="owner_id">
<option value="0">Tüm güncel sorumlular</option>
<?php foreach($ownerOptions as $id=>$name):?><option value="<?=(int)$id?>" <?=(int)$filters['owner_id']===(int)$id?'selected':''?>><?=mrth($name)?></option><?php endforeach;?>
</select>
<button type="submit">Filtrele</button>
<a href="ticari-mutabakat-hedef-risk-takip.php">Temizle</a>
</form>
</section>

<form method="post" id="mrt-plan-form">
<input type="hidden" name="csrf" value="<?=mrth(csrf_token())?>">
<input type="hidden" name="action" value="plan_unread">
<input type="hidden" name="days" value="<?=$days?>">
<input type="hidden" name="signal" value="<?=mrth((string)$filters['signal'])?>">
<input type="hidden" name="owner_id" value="<?=(int)$filters['owner_id']?>">

<section class="role-section mrt-plan">
<div class="role-section-head"><div><span class="eyeline">TOPLU TAKİP</span><h2>Sonraki Aksiyon Tarihi</h2></div><span class="role-pill">En fazla 50 vaka</span></div>
<div class="mrt-plan-grid">
<label>Sonraki aksiyon tarihi
<input class="role-input" type="date" name="sonraki_aksiyon_tarihi" min="<?=date('Y-m-d')?>" required>
</label>
<label>Plan notu <small>İsteğe bağlı · 600 karakter</small>
<input class="role-input" name="plan_notu" maxlength="600" placeholder="Okunmamış hedef-risk takibi, gün sonu kontrolü...">
</label>
</div>
<div class="mrt-plan-actions">
<label><input id="mrt-select-first" type="checkbox"> İlk 50 görünür vakayı seç</label>
<button class="role-button" type="submit">Seçili Okunmamış Riskleri Planla</button>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">SEÇİM</span><h2>Güncel Okunmamış Hedef-Risk Vakaları</h2></div><span class="role-pill"><?=count($rows)?> görünür</span></div>
<div class="mrt-list">
<?php if(!$rows):?><div class="role-empty"><span>✅</span>Filtreye uyan güncel açık ve okunmamış hedef-risk bildirimi yok.</div><?php endif;?>
<?php foreach($rows as $row):?>
<label class="mrt-row">
<input class="mrt-case-check" type="checkbox" name="vaka_ids[]" value="<?=(int)$row['vaka_id']?>">
<span class="mrt-kind"><?=(string)$row['esik_kodu']==='hedef_disinda'?'🚨':'🎯'?></span>
<span class="mrt-main">
<strong><?=mrth((string)$row['kurum_adi'])?> · <?=mrth((string)$row['sozlesme_no'])?></strong>
<small><?=mrth((string)$row['alici_adi'])?> · <?=mrth((string)$row['hedef_risk_etiketi'])?> · Gönderim <?=mrth(date('d.m.Y H:i',strtotime((string)$row['olusturulma_tarihi'])))?></small>
<em>Sonraki aksiyon: <?=mrth((string)($row['sonraki_aksiyon_tarihi']?:'Yok'))?><?php if($row['hedef_sure_kullanim_orani']!==null):?> · Hedef kullanım %<?=number_format((float)$row['hedef_sure_kullanim_orani'],1,',','.')?><?php endif;?></em>
</span>
<a href="ticari-mutabakat-aksiyon.php?vaka_id=<?=(int)$row['vaka_id']?>" target="_blank" rel="noopener">Detay →</a>
</label>
<?php endforeach;?>
</div>
</section>
</form>

<div class="role-note"><span>ℹ️</span><p>Seçimden sonra bildirim okunursa, owner değişirse, vaka kapanırsa, reopen döngüsü değişirse veya güncel hedef-risk sinyali değişirse POST reddedilir. Böylece stale ekrandan yanlış takip planı yazılmaz.</p></div>
<?php endif;?>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a href="ticari-mutabakat-is-kutusu.php"><span>📥</span>İş Kutusu</a>
<a href="ticari-mutabakat-hedef-risk-saglik.php"><span>📨</span>Sağlık</a>
<a class="active" href="ticari-mutabakat-hedef-risk-takip.php"><span>🗓️</span>Risk Takip</a>
<a href="ticari-mutabakat-planlama.php"><span>🗂️</span>Planlama</a>
<a href="ticari-mutabakat-aksiyon.php"><span>🧭</span>Aksiyon</a>
</nav>
<script>
(() => {
  const master=document.getElementById('mrt-select-first');
  if(!master) return;
  master.addEventListener('change',() => {
    const checks=Array.from(document.querySelectorAll('.mrt-case-check'));
    checks.forEach((box,index) => { box.checked=master.checked && index<50; });
  });
})();
</script>
</div>
</body>
</html>
