<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/ticari_belge.php';
require __DIR__.'/src/ticari_mutabakat.php';
require __DIR__.'/src/ticari_mutabakat_aksiyon.php';
require __DIR__.'/src/ticari_mutabakat_saglik.php';
require __DIR__.'/src/ticari_mutabakat_performans.php';
require __DIR__.'/src/ticari_mutabakat_hedef.php';
require __DIR__.'/src/ticari_mutabakat_hedef_risk.php';
require __DIR__.'/src/ticari_mutabakat_is_kutusu.php';
require __DIR__.'/src/bildirimler.php';
require __DIR__.'/src/ticari_mutabakat_hedef_risk_bildirim.php';

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

function mi_return_query(array $source): string {
    $out=[];
    $scope=(string)($source['scope']??'mine');
    if(array_key_exists($scope,mi_scope_labels()) && $scope!=='mine')$out['scope']=$scope;

    $window=(string)($source['window']??'all');
    if(array_key_exists($window,mi_window_labels()) && $window!=='all')$out['window']=$window;

    $type=(string)($source['sorun_turu']??'');
    if(in_array($type,['operasyon','butunluk'],true))$out['sorun_turu']=$type;

    $risk=(string)($source['risk']??'');
    if(array_key_exists($risk,mi_target_risk_labels()) && $risk!=='')$out['risk']=$risk;

    $owner=(string)($source['owner_id']??'');
    if($owner==='unassigned')$out['owner_id']='unassigned';
    elseif((int)$owner>0)$out['owner_id']=(string)(int)$owner;

    $q=trim((string)($source['q']??''));
    if($q!=='')$out['q']=mb_substr($q,0,160);

    return http_build_query($out);
}

function mi_redirect_url(array $source,string $message): string {
    $query=mi_return_query($source);
    $query.=$query!==''?'&':'';
    $query.='ok='.rawurlencode($message);
    return 'ticari-mutabakat-is-kutusu.php?'.$query;
}

$error='';
$success=trim((string)($_GET['ok']??''));
$ready=mi_tables_ready($pdo);

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar dene.');
        if(!$ready) throw new RuntimeException('Mutabakat aksiyon tabloları hazır değil.');

        $action=(string)($_POST['action']??'');
        if(!in_array($action,['send_target_risk','send_target_risk_batch'],true)){
            throw new RuntimeException('Geçersiz işlem.');
        }

        if(function_exists('ma_sync_cases')) ma_sync_cases($pdo,$user);

        if($action==='send_target_risk_batch'){
            $selected=$_POST['vaka_ids']??[];
            if(!is_array($selected)) throw new RuntimeException('Toplu vaka seçimi geçersiz.');

            $visibleRows=mi_case_rows($pdo,$user,[
                'scope'=>(string)($_POST['scope']??'mine'),
                'window'=>(string)($_POST['window']??'all'),
                'sorun_turu'=>(string)($_POST['sorun_turu']??''),
                'risk'=>(string)($_POST['risk']??''),
                'owner_id'=>(string)($_POST['owner_id']??''),
                'q'=>(string)($_POST['q']??''),
            ],700);
            $allowed=mi_pending_case_ids($visibleRows);
            $batch=mi_send_target_risk_cases($pdo,$user,$selected,$allowed,50);
            if((int)$batch['eligible']===0){
                throw new RuntimeException('Seçilen vakalar mevcut filtrede artık bildirim beklemiyor.');
            }

            $parts=[
                (int)$batch['selected'].' seçili',
                (int)$batch['sent'].' gönderildi',
            ];
            if((int)$batch['not_pending']>0)$parts[]=(int)$batch['not_pending'].' artık beklemiyor';
            if((int)$batch['not_visible']>0)$parts[]=(int)$batch['not_visible'].' görünür/bekleyen değil';
            if((int)$batch['invalid_owner']>0)$parts[]=(int)$batch['invalid_owner'].' geçersiz sorumlu';
            if((int)$batch['no_institution']>0)$parts[]=(int)$batch['no_institution'].' kurum bağlamı yok';
            if((int)$batch['stale_source']>0)$parts[]=(int)$batch['stale_source'].' kaynak sorun çözülmüş';
            if((int)$batch['no_longer_required']>0)$parts[]=(int)$batch['no_longer_required'].' sinyal değişmiş';
            if((int)$batch['skipped']>0)$parts[]=(int)$batch['skipped'].' dedup/stale';
            if((int)$batch['failed']>0)$parts[]=(int)$batch['failed'].' hata';

            header('Location: '.mi_redirect_url($_POST,'Toplu hedef-risk gönderimi: '.implode(' · ',$parts).'.'));
            exit;
        }

        $caseId=max(0,(int)($_POST['vaka_id']??0));
        $send=mi_send_target_risk_case($pdo,$user,$caseId);
        $status=(string)($send['status']??'failed');

        $message=match($status){
            'sent'=>'Güncel hedef-risk bildirimi vaka sorumlusu Süper Admin kullanıcısına gönderildi.',
            'not_pending'=>'Bu vaka için güncel hedef-risk bildirimi artık gönderim beklemiyor.',
            'no_context'=>'Vakanın güncel hedef-risk bağlamı artık çözülemiyor.',
            'invalid_owner'=>'Vakanın bildirim alabilecek aktif Süper Admin sorumlusu bulunmuyor.',
            'no_institution'=>'Vakanın kurum bağlamı olmadığı için hedef-risk bildirimi gönderilemedi.',
            'stale_source'=>'Kaynak sorun artık açık olmadığı için hedef-risk bildirimi gönderilmedi.',
            'no_longer_required'=>'Vakanın güncel hedef-risk sinyali artık bildirim gerektirmiyor.',
            'skipped'=>'Bildirim daha önce gönderilmiş veya vaka bağlamı işlem sırasında değişmiş.',
            default=>'Hedef-risk bildirimi oluşturulamadı.',
        };

        if(in_array($status,['invalid_owner','no_institution','failed'],true)){
            throw new RuntimeException($message);
        }

        header('Location: '.mi_redirect_url($_POST,$message));
        exit;
    }catch(PDOException $e){
        $error='Veritabanı işlemi tamamlanamadı.';
    }catch(Throwable $e){
        $error=$e->getMessage();
    }
}

$scope=(string)($_GET['scope']??$_POST['scope']??'mine');
if(!array_key_exists($scope,mi_scope_labels()))$scope='mine';
$window=(string)($_GET['window']??$_POST['window']??'all');
if(!array_key_exists($window,mi_window_labels()))$window='all';
$type=(string)($_GET['sorun_turu']??$_POST['sorun_turu']??'');
$risk=(string)($_GET['risk']??$_POST['risk']??'');
if(!array_key_exists($risk,mi_target_risk_labels()))$risk='';
$ownerFilter=(string)($_GET['owner_id']??$_POST['owner_id']??'');
$query=trim((string)($_GET['q']??$_POST['q']??''));

$summary=$ready?mi_summary($pdo,$user):[];
$rows=$ready?mi_case_rows($pdo,$user,['scope'=>$scope,'window'=>$window,'sorun_turu'=>$type,'risk'=>$risk,'owner_id'=>$ownerFilter,'q'=>$query],700):[];
$visiblePendingCount=$ready?count(mi_pending_case_ids($rows)):0;
$team=$ready?mi_team_workload($pdo,100,$user):[];
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Mutabakat Günlük İş Kutusu — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="ticari-mutabakat-is-kutusu.css?v=1.2.75">
</head>
<body class="role-page sa-subpage">
<?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Mutabakat Günlük İş Kutusu</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="ticari-mutabakat-devir.php" aria-label="Sorumlu Devir"><svg><use href="#sa-users"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-aksiyon.php" aria-label="Aksiyon Merkezi"><svg><use href="#sa-alert"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-hatirlatma.php" aria-label="Aksiyon Hatırlatmaları"><svg><use href="#sa-bell"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-planlama.php" aria-label="Toplu Planlama"><svg><use href="#sa-refresh"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-saglik.php" aria-label="Sağlık"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-eskalasyon.php" aria-label="Operasyon Eskalasyonu"><svg><use href="#sa-alert"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-performans.php" aria-label="Operasyon Performansı"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-hedef-risk.php" aria-label="Hedef Risk Kuyruğu"><svg><use href="#sa-alert"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-hedef-risk-saglik.php" aria-label="Hedef Risk Bildirim Sağlığı"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-hedef-risk-takip.php" aria-label="Okunmamış Risk Takibi"><svg><use href="#sa-calendar"/></svg></a>
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>
<main class="role-content">
<section class="role-hero">
<span class="eyeline">GÜNLÜK OPERASYON</span>
<h1>Mutabakat İş Kutusu</h1>
<p>Bana atanan, bugün aksiyon bekleyen, gecikmiş veya plansız mutabakat vakalarını; güncel hedef-risk ve bildirim okuma durumuyla birlikte tek günlük iş görünümünde takip et.</p>
<span class="role-hero-art">📥</span>
</section>

<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=mih($error)?></p></div><?php endif;?>
<?php if($success!==''):?><div class="role-note"><span>✅</span><p><?=mih($success)?></p></div><?php endif;?>
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
<a href="ticari-mutabakat-is-kutusu.php?scope=mine&amp;risk=hedef_disinda"><strong><?=(int)($summary['mine_target_outside']??0)?></strong><span>Hedef dışında</span></a>
<a href="ticari-mutabakat-is-kutusu.php?scope=mine&amp;risk=yuzde_75"><strong><?=(int)($summary['mine_target_75']??0)?></strong><span>Hedef %75+</span></a>
<a href="ticari-mutabakat-is-kutusu.php?scope=mine&amp;risk=okunmamis"><strong><?=(int)($summary['mine_target_unread']??0)?></strong><span>Risk bildirimi okunmadı</span></a>
<a href="ticari-mutabakat-is-kutusu.php?scope=mine&amp;risk=bildirim_bekleyen"><strong><?=(int)($summary['mine_target_pending']??0)?></strong><span>Risk bildirimi bekliyor</span></a>
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
<select name="risk">
<?php foreach(mi_target_risk_labels() as $v=>$label):?><option value="<?=mih($v)?>" <?=$risk===$v?'selected':''?>><?=mih($label)?></option><?php endforeach;?>
</select>
<input type="search" name="q" value="<?=mih($query)?>" placeholder="Kurum, sözleşme veya teşhis">
<button type="submit">Filtrele</button>
<a href="ticari-mutabakat-is-kutusu.php">Temizle</a>
</form>

<?php if($visiblePendingCount>0):?>
<form id="mi-bulk-risk-form" class="mi-bulk-risk" method="post">
<input type="hidden" name="csrf" value="<?=mih(csrf_token())?>">
<input type="hidden" name="action" value="send_target_risk_batch">
<input type="hidden" name="scope" value="<?=mih($scope)?>">
<input type="hidden" name="window" value="<?=mih($window)?>">
<input type="hidden" name="sorun_turu" value="<?=mih($type)?>">
<input type="hidden" name="risk" value="<?=mih($risk)?>">
<input type="hidden" name="owner_id" value="<?=mih($ownerFilter)?>">
<input type="hidden" name="q" value="<?=mih($query)?>">
<label><input type="checkbox" id="mi-bulk-select-visible"> İlk 50 görünür bekleyen vakayı seç</label>
<div>
<strong><?=$visiblePendingCount?> görünür vaka bildirim bekliyor</strong>
<small>Yalnız seçili, mevcut filtrede görünür ve POST anında hâlâ bekleyen vakalar işlenir. En fazla 50 vaka.</small>
</div>
<button type="submit">Seçili Hedef-Risk Bildirimlerini Gönder</button>
</form>
<?php endif;?>

<div class="role-list mi-list">
<?php if(!$rows):?><div class="role-empty"><span>✅</span>Filtreye uyan açık mutabakat vakası yok.</div><?php endif;?>
<?php foreach($rows as $row):?>
<div class="mi-row-wrap <?=!empty($row['hedef_bildirim_bekliyor'])?'bulk-pending':''?>">
<?php if(!empty($row['hedef_bildirim_bekliyor'])):?>
<label class="mi-bulk-select">
<input class="mi-bulk-risk-check" type="checkbox" name="vaka_ids[]" value="<?=(int)$row['id']?>" form="mi-bulk-risk-form">
<span>Toplu gönderim için seç</span>
</label>
<?php endif;?>
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
<?php if((string)($row['hedef_risk_kodu']??'')==='hedef_disinda'):?><span class="role-pill target-outside">Hedef Dışında</span><?php endif;?>
<?php if((string)($row['hedef_risk_kodu']??'')==='yuzde_75'):?><span class="role-pill target-75">Hedef %75+</span><?php endif;?>
<?php if((string)($row['hedef_risk_kodu']??'')==='yuzde_50'):?><span class="role-pill target-50">Hedef %50–74</span><?php endif;?>
<?php if((string)($row['hedef_risk_kodu']??'')==='politika_yok'):?><span class="role-pill target-none">Politika Yok</span><?php endif;?>
<?php if(!empty($row['hedef_bildirim_okunmadi'])):?><span class="role-pill target-unread">Bildirim Okunmadı</span><?php endif;?>
<?php if(!empty($row['hedef_bildirim_bekliyor'])):?><span class="role-pill target-pending">Bildirim Bekliyor</span><?php endif;?>
</div>
</a>
<?php if(!empty($row['hedef_bildirim_bekliyor'])):?>
<form class="mi-risk-send" method="post">
<input type="hidden" name="csrf" value="<?=mih(csrf_token())?>">
<input type="hidden" name="action" value="send_target_risk">
<input type="hidden" name="vaka_id" value="<?=(int)$row['id']?>">
<input type="hidden" name="scope" value="<?=mih($scope)?>">
<input type="hidden" name="window" value="<?=mih($window)?>">
<input type="hidden" name="sorun_turu" value="<?=mih($type)?>">
<input type="hidden" name="risk" value="<?=mih($risk)?>">
<input type="hidden" name="owner_id" value="<?=mih($ownerFilter)?>">
<input type="hidden" name="q" value="<?=mih($query)?>">
<button type="submit">Güncel Hedef-Risk Bildirimini Gönder</button>
<small>Aynı vaka + current owner + current reopen döngüsü + current sinyal ikinci kez gönderilemez.</small>
</form>
<?php endif;?>
</div>
<?php endforeach;?>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">EKİP</span><h2>Sorumlu İş Yükü</h2></div><a class="role-pill ok" href="ticari-mutabakat-planlama.php">Toplu Planlama →</a></div>
<div class="mi-team">
<?php foreach($team as $row):?>
<a href="ticari-mutabakat-is-kutusu.php?scope=team&amp;owner_id=<?=((int)$row['sorumlu_kullanici_id']>0?(int)$row['sorumlu_kullanici_id']:'unassigned')?>">
<strong><?=mih((string)$row['sorumlu_adi'])?></strong>
<span><?=(int)$row['open_count']?> açık · <?=(int)$row['overdue_count']?> gecikmiş · <?=(int)$row['today_count']?> bugün · <?=(int)$row['next7_count']?> 7 gün · <?=(int)$row['no_date_count']?> tarihsiz · <?=(int)$row['integrity_count']?> bütünlük · <?=(int)($row['target_outside_count']??0)?> hedef dışı · <?=(int)($row['target_unread_count']??0)?> okunmamış risk · <?=(int)($row['target_pending_count']??0)?> gönderim bekliyor</span>
</a>
<?php endforeach;?>
</div>
</section>

<div class="role-note"><span>🔒</span><p>İş Kutusu hedef-risk hesabını değiştirmez. Tek-vaka ve seçili toplu gönderim aynı 1.2.69/1.2.73 exact-case güvenlik motorunu kullanır. Toplu işlem yalnız mevcut filtrede görünür ve hâlâ “Bildirim Bekliyor” vakaları işler; vaka state'i veya okundu durumu değiştirilmez.</p></div>
<?php endif;?>
</main>
<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a class="active" href="ticari-mutabakat-is-kutusu.php"><span>📥</span>İş Kutusu</a>
<a href="ticari-mutabakat-hedef-risk.php"><span>🎯</span>Hedef Risk</a>
<a href="ticari-mutabakat-hedef-risk-saglik.php"><span>📨</span>Risk Sağlığı</a>
<a href="ticari-mutabakat-hedef-risk-takip.php"><span>🗓️</span>Risk Takip</a>
<a href="ticari-mutabakat-hatirlatma.php"><span>🔔</span>Hatırlatma</a>
<a href="ticari-mutabakat-aksiyon.php"><span>🧭</span>Aksiyon</a>
<a href="ticari-mutabakat-saglik.php"><span>🩺</span>Sağlık</a>
<a href="ticari-mutabakat-planlama.php"><span>🗂️</span>Planlama</a>
<a href="ticari-mutabakat-eskalasyon.php"><span>🚨</span>Eskalasyon</a>
<a href="ticari-mutabakat-devir.php"><span>🔁</span>Devir</a>
<a href="ticari-mutabakat-performans.php"><span>📈</span>Performans</a>
</nav>
<script>
(() => {
  const master=document.getElementById('mi-bulk-select-visible');
  if(!master) return;
  master.addEventListener('change',() => {
    const checks=Array.from(document.querySelectorAll('.mi-bulk-risk-check'));
    checks.forEach((box,index) => { box.checked=master.checked && index<50; });
  });
})();
</script>
</div>
</body>
</html>
