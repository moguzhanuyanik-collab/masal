<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/kurum_lisanslari.php';
require __DIR__.'/src/ticari_finans.php';
require __DIR__.'/src/ticari_taksit.php';
require __DIR__.'/src/tahsilat_risk.php';
require __DIR__.'/src/bildirimler.php';
require __DIR__.'/src/tahsilat_hatirlatma.php';

$user=require_role('super_admin');
$pdo=db();
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');

function trh(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
function trm(string|float|int $value): string { return number_format((float)$value,2,',','.'); }
function tr_risk_class(string $level): string {
    return match($level){
        'kritik'=>'critical',
        'yuksek'=>'high',
        'orta'=>'medium',
        default=>'low',
    };
}
function tr_stage_class(string $stage): string {
    return match($stage){
        'odeme_sozu'=>'promise',
        'ihtilaf'=>'dispute',
        'kapali'=>'closed',
        'temas'=>'contact',
        default=>'',
    };
}
function tr_due_text(?string $dueDate,?int $lateDays): string {
    if($dueDate===null || $dueDate==='') return 'Vade tarihi yok';
    if($lateDays===null) return $dueDate;
    if($lateDays<0) return abs($lateDays).' gün sonra';
    if($lateDays===0) return 'Bugün';
    return $lateDays.' gün gecikti';
}

$error='';
$success=trim((string)($_GET['ok']??''));
$ready=tr_tables_ready($pdo);

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar dene.');
        if(!$ready) throw new RuntimeException('Tahsilat risk migrationı henüz kurulmamış.');

        $action=(string)($_POST['action']??'');
        if($action==='sync'){
            $sync=tr_sync_cases($pdo,$user);
            header('Location: tahsilat-risk.php?ok='.rawurlencode(
                'Risk kuyruğu senkronize edildi. Yeni: '.(int)$sync['created']
                .' · Yeniden açılan: '.(int)$sync['reopened']
                .' · Otomatik kapanan: '.(int)$sync['closed']
            ));
            exit;
        }

        if($action==='notify'){
            tr_sync_cases($pdo,$user);
            if(!th_tables_ready($pdo)) throw new RuntimeException('Tahsilat hatırlatma migrationı henüz kurulmamış.');
            $notify=th_sync_manager_reminders($pdo,$user);
            header('Location: tahsilat-risk.php?ok='.rawurlencode(
                'Yönetici tahsilat hatırlatmaları senkronize edildi. Gönderilen: '.(int)$notify['sent']
                .' · Daha önce gönderilen/uygun olmayan: '.(int)$notify['skipped']
                .' · Yöneticisi olmayan kurum: '.(int)$notify['no_recipient']
                .' · Hata: '.(int)$notify['failed']
            ));
            exit;
        }

        tr_sync_cases($pdo,$user);
        $contractId=max(0,(int)($_POST['sozlesme_id']??0));

        if($action==='stage'){
            tr_set_stage($pdo,$user,$contractId,(string)($_POST['durum']??''));
            header('Location: tahsilat-risk.php?sozlesme_id='.$contractId.'&ok='.rawurlencode('Tahsilat takip aşaması güncellendi.'));
            exit;
        }

        if($action==='note'){
            tr_add_note(
                $pdo,$user,$contractId,
                (string)($_POST['not_metni']??''),
                (string)($_POST['sonraki_aksiyon_tarihi']??''),
                (string)($_POST['durum']??'')
            );
            header('Location: tahsilat-risk.php?sozlesme_id='.$contractId.'&ok='.rawurlencode('Takip notu ve sonraki aksiyon kaydedildi.'));
            exit;
        }

        throw new RuntimeException('Geçersiz işlem.');
    }catch(PDOException $e){
        $error='Veritabanı işlemi tamamlanamadı.';
    }catch(Throwable $e){
        $error=$e->getMessage();
    }
}

$filters=[
    'durum'=>(string)($_GET['durum']??'open'),
    'risk'=>(string)($_GET['risk']??''),
    'yenileme'=>(string)($_GET['yenileme']??''),
];

$summary=$ready?tr_summary($pdo):[];
$exposure=$ready?tr_currency_exposure($pdo):[];
$rows=$ready?tr_queue_rows($pdo,$filters,500):[];
$reminderReady=$ready&&th_tables_ready($pdo);
$reminderSummary=$reminderReady?th_summary($pdo):[];
$reminderRows=$reminderReady?th_history_rows($pdo,120):[];

$selectedId=max(0,(int)($_GET['sozlesme_id']??0));
$selected=$selectedId>0&&$ready?tr_case_detail($pdo,$selectedId):null;
$history=$selected?tr_history_rows($pdo,$selectedId):[];
$selectedReminders=$selected&&$reminderReady?th_contract_history($pdo,$selectedId):[];
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Tahsilat Risk Merkezi — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="tahsilat-risk.css?v=1.2.51">
</head>
<body class="role-page sa-subpage">
<?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Tahsilat Risk Merkezi</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="ticari-finans.php" aria-label="Ticari Finans"><svg><use href="#sa-database"/></svg></a>
<a class="sa-page-action" href="ticari-dashboard.php" aria-label="Ticari Dashboard"><svg><use href="#sa-database"/></svg></a>
<a class="sa-page-action" href="lisans-yenilemeleri.php" aria-label="Lisans Yenilemeleri"><svg><use href="#sa-refresh"/></svg></a>
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>

<main class="role-content">
<section class="role-hero">
<span class="eyeline">TAHSİLAT OPERASYONU</span>
<h1>Ticari Risk & Aksiyon Merkezi</h1>
<p>Vadesi yaklaşan ve geciken açık bakiyeleri yaşlandır, yenileme kaynaklı tahsilat riskini ayır ve takip aksiyonlarını append-only geçmişle yönet.</p>
<span class="role-hero-art">⚠️</span>
</section>

<?php if(!$ready):?><div class="role-note"><span>⚠️</span><p>1.2.50 tahsilat risk migrationı henüz hazır değil. 082 migration kurulduğunda bu merkez açılır.</p></div><?php endif;?>
<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=trh($error)?></p></div><?php endif;?>
<?php if($success!==''):?><div class="role-note"><span>✅</span><p><?=trh($success)?></p></div><?php endif;?>

<?php if($ready):?>
<section class="tr-summary">
<a href="tahsilat-risk.php?durum=open"><strong><?=(int)($summary['open']??0)?></strong><span>Açık takip</span></a>
<a href="tahsilat-risk.php?risk=yaklasan"><strong><?=(int)($summary['yaklasan']??0)?></strong><span>7 gün içinde vade</span></a>
<a href="tahsilat-risk.php?risk=0_7"><strong><?=(int)($summary['0_7']??0)?></strong><span>0–7 gün</span></a>
<a href="tahsilat-risk.php?risk=8_15"><strong><?=(int)($summary['8_15']??0)?></strong><span>8–15 gün</span></a>
<a href="tahsilat-risk.php?risk=16_30"><strong><?=(int)($summary['16_30']??0)?></strong><span>16–30 gün</span></a>
<a href="tahsilat-risk.php?risk=31_plus"><strong><?=(int)($summary['31_plus']??0)?></strong><span>31+ gün</span></a>
<a href="tahsilat-risk.php?risk=vade_yok"><strong><?=(int)($summary['vade_yok']??0)?></strong><span>Vade eksik</span></a>
<a href="tahsilat-risk.php?yenileme=1"><strong><?=(int)($summary['yenileme_gecikmis']??0)?></strong><span>Yenileme gecikmesi</span></a>
</section>

<section class="role-section">
<div class="role-section-head">
<div><span class="eyeline">SENKRONİZASYON</span><h2>Finansal Gerçekten Risk Kuyruğu</h2></div>
<span class="role-pill"><?=(int)($summary['aksiyon_bekleyen']??0)?> aksiyon zamanı geldi</span>
</div>
<div class="tr-sync">
<form method="post">
<input type="hidden" name="csrf" value="<?=trh(csrf_token())?>">
<input type="hidden" name="action" value="sync">
<button class="role-button" type="submit">Risk Kuyruğunu Senkronize Et</button>
</form>
<?php if($reminderReady):?>
<form method="post">
<input type="hidden" name="csrf" value="<?=trh(csrf_token())?>">
<input type="hidden" name="action" value="notify">
<button class="role-button tr-notify-button" type="submit">Yönetici Hatırlatmalarını Senkronize Et</button>
</form>
<?php endif;?>
<a class="role-pill" href="ticari-finans.php">Ticari Finans →</a>
</div>
<div class="role-note"><span>ℹ️</span><p>Finansal bakiye bu modülde kopyalanmaz. Açık bakiye ve sözleşme durumu her görüntülemede Ticari Finans tablolarından okunur. Risk senkronizasyonu operasyonel vakaları yönetir; yönetici hatırlatmaları ise ayrı, CSRF korumalı işlemle yalnız eksik eşik bildirimlerini gönderir.</p></div>
</section>

<?php if($reminderReady):?>
<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">YÖNETİCİ HATIRLATMALARI</span><h2>Gönderim Geçmişi & Eşikler</h2></div><span class="role-pill"><?=(int)($reminderSummary['toplam']??0)?> gönderim</span></div>
<div class="tr-reminder-summary">
<div><strong><?=(int)($reminderSummary['vade_7']??0)?></strong><span>≤7 gün vade</span></div>
<div><strong><?=(int)($reminderSummary['vade_0']??0)?></strong><span>Vade / ilk gecikme</span></div>
<div><strong><?=(int)($reminderSummary['gecikme_7']??0)?></strong><span>7+ gün</span></div>
<div><strong><?=(int)($reminderSummary['gecikme_15']??0)?></strong><span>15+ gün</span></div>
<div><strong><?=(int)($reminderSummary['gecikme_30']??0)?></strong><span>30+ gün</span></div>
</div>
<div class="role-note"><span>🔔</span><p>Aynı sözleşme, aynı vade dönemi ve aynı eşik ikinci kez gönderilmez. Vade tarihi değişirse yeni dönem ayrı takip edilir. Hatırlatmalar yalnız aktif kurum yöneticilerine gider; manuel duyuru hedef seçenekleri değişmez.</p></div>
<div class="tr-reminder-history">
<?php if(!$reminderRows):?><div class="role-empty">Henüz tahsilat hatırlatması gönderilmedi.</div><?php endif;?>
<?php foreach(array_slice($reminderRows,0,20) as $reminder):?>
<a href="tahsilat-risk.php?sozlesme_id=<?=(int)$reminder['sozlesme_id']?>">
<div><strong><?=trh((string)($reminder['kurum_adi']?:'Kurum'))?> · <?=trh((string)($reminder['sozlesme_no']?:'#'.$reminder['sozlesme_id']))?></strong><span><?=trh(date('d.m.Y H:i',strtotime((string)$reminder['olusturulma_tarihi'])))?></span></div>
<small><?=trh((string)$reminder['esik_kodu'])?> · Vade <?=trh((string)$reminder['vade_tarihi'])?> · <?=trm($reminder['acik_tutar'])?> <?=trh((string)$reminder['para_birimi'])?> · <?=(int)$reminder['alici_sayisi']?> yönetici</small>
</a>
<?php endforeach;?>
</div>
</section>
<?php else:?>
<div class="role-note"><span>ℹ️</span><p>Yönetici tahsilat hatırlatmaları 083 migration kurulduğunda açılır.</p></div>
<?php endif;?>

<?php if($exposure):?>
<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">RİSK TUTARI</span><h2>Para Birimi Bazında Açık Bakiye</h2></div></div>
<div class="tr-exposure">
<?php foreach($exposure as $item):?>
<div class="tr-exposure-card">
<span><?=trh((string)$item['para_birimi'])?></span>
<strong><?=trm($item['gecikmis_bakiye'])?> / <?=trm($item['acik_bakiye'])?></strong>
<small>Gecikmiş / risk kuyruğundaki açık bakiye · 31+ gün <?=trm($item['kritik_bakiye'])?> · <?=(int)$item['sozlesme_sayisi']?> sözleşme</small>
</div>
<?php endforeach;?>
</div>
</section>
<?php endif;?>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">AKSİYON KUYRUĞU</span><h2>Tahsilat Takibi</h2></div><span class="role-pill"><?=count($rows)?></span></div>

<form class="tr-filter" method="get">
<select name="durum">
<option value="open" <?=$filters['durum']==='open'?'selected':''?>>Tüm açık takipler</option>
<?php foreach(tr_stage_labels() as $value=>$label):?><option value="<?=$value?>" <?=$filters['durum']===$value?'selected':''?>><?=trh($label)?></option><?php endforeach;?>
</select>
<select name="risk">
<option value="">Tüm riskler</option>
<option value="yaklasan" <?=$filters['risk']==='yaklasan'?'selected':''?>>7 gün içinde vade</option>
<option value="0_7" <?=$filters['risk']==='0_7'?'selected':''?>>0–7 gün gecikme</option>
<option value="8_15" <?=$filters['risk']==='8_15'?'selected':''?>>8–15 gün gecikme</option>
<option value="16_30" <?=$filters['risk']==='16_30'?'selected':''?>>16–30 gün gecikme</option>
<option value="31_plus" <?=$filters['risk']==='31_plus'?'selected':''?>>31+ gün gecikme</option>
<option value="vade_yok" <?=$filters['risk']==='vade_yok'?'selected':''?>>Vade tarihi eksik</option>
</select>
<label class="tr-check"><input type="checkbox" name="yenileme" value="1" <?=$filters['yenileme']==='1'?'checked':''?>> Yenileme kaynaklı gecikme</label>
<button type="submit">Filtrele</button>
<a href="tahsilat-risk.php">Temizle</a>
</form>

<div class="role-list tr-list">
<?php if(!$rows):?><div class="role-empty"><span>✅</span>Filtreye uyan tahsilat takip vakası yok.</div><?php endif;?>
<?php foreach($rows as $row):
$riskLevel=(string)$row['risk_seviyesi'];
$stage=(string)$row['durum'];
$late=$row['gecikme_gunu']===null?null:(int)$row['gecikme_gunu'];
?>
<a class="role-row tr-row <?=$selectedId===(int)$row['sozlesme_id']?'selected':''?>" href="tahsilat-risk.php?sozlesme_id=<?=(int)$row['sozlesme_id']?>">
<span><?=($riskLevel==='kritik'?'🚨':($riskLevel==='yuksek'?'⚠️':'₺'))?></span>
<div>
<strong><?=trh((string)$row['kurum_adi'])?> · <?=trh((string)$row['sozlesme_no'])?></strong>
<small>
Açık <?=trm($row['kalan_tutar'])?> <?=trh((string)$row['para_birimi'])?>
· <?=trh((string)$row['risk_etiketi'])?>
<?php if(!empty($row['taksit_plani_aktif'])):?> · Taksit planı<?php endif;?>
· <?=trh(tr_stage_labels()[$stage]??$stage)?>
<?php if(!empty($row['yenileme_baglantili'])):?> · Yenileme #<?=(int)$row['yenileme_id']?><?php endif;?>
<?php if(!empty($row['sonraki_aksiyon_tarihi'])):?> · Aksiyon <?=trh((string)$row['sonraki_aksiyon_tarihi'])?><?php endif;?>
</small>
</div>
<div class="tr-row-tags">
<?php if(!empty($row['yenileme_gecikmis'])):?><span class="role-pill renewal">Yenileme Gecikmesi</span><?php endif;?>
<span class="role-pill <?=tr_risk_class($riskLevel)?>"><?=trh((string)$row['risk_etiketi'])?></span>
</div>
</a>
<?php endforeach;?>
</div>
</section>

<?php if($selected):
$riskLevel=(string)$selected['risk_seviyesi'];
$stage=(string)$selected['durum'];
$late=$selected['gecikme_gunu']===null?null:(int)$selected['gecikme_gunu'];
$isOpen=in_array($stage,tr_open_stages(),true);
?>
<section class="role-section">
<div class="role-section-head">
<div><span class="eyeline">SÖZLEŞME #<?=(int)$selected['sozlesme_id']?></span><h2><?=trh((string)$selected['kurum_adi'])?> · <?=trh((string)$selected['sozlesme_no'])?></h2></div>
<div class="tr-head-tags">
<span class="role-pill <?=tr_stage_class($stage)?>"><?=trh(tr_stage_labels()[$stage]??$stage)?></span>
<span class="role-pill <?=tr_risk_class($riskLevel)?>"><?=trh((string)$selected['risk_etiketi'])?></span>
</div>
</div>

<div class="tr-detail-grid">
<div><span>Sözleşme Toplamı</span><strong><?=trm($selected['toplam_tutar'])?> <?=trh((string)$selected['para_birimi'])?></strong></div>
<div><span>Tahsil Edilen</span><strong><?=trm($selected['tahsil_edilen'])?> <?=trh((string)$selected['para_birimi'])?></strong></div>
<div><span>Açık Bakiye</span><strong><?=trm($selected['kalan_tutar'])?> <?=trh((string)$selected['para_birimi'])?></strong></div>
<div><span><?=!empty($selected['taksit_plani_aktif'])?'Sonraki Taksit Vadesi':'Vade'?></span><strong><?=trh((string)($selected['vade_tarihi']?:'Tanımlı değil'))?></strong><small><?=trh(tr_due_text(($selected['vade_tarihi']??null)!==null?(string)$selected['vade_tarihi']:null,$late))?><?php if(!empty($selected['taksit_plani_aktif'])):?> · Gecikmiş taksit <?=trm($selected['taksit_gecikmis_tutar'])?> <?=trh((string)$selected['para_birimi'])?><?php endif;?></small></div>
<div><span>Paket</span><strong><?=trh((string)($selected['paket_adi']?:'—'))?></strong></div>
<div><span>Sorumlu</span><strong><?=trh((string)$selected['sorumlu_adi'])?></strong></div>
<div><span>Son Temas</span><strong><?=trh((string)($selected['son_temas_tarihi']?:'—'))?></strong></div>
<div><span>Sonraki Aksiyon</span><strong><?=trh((string)($selected['sonraki_aksiyon_tarihi']?:'—'))?></strong></div>
</div>

<div class="tr-links">
<a class="role-pill ok" href="ticari-finans.php?sozlesme_id=<?=(int)$selected['sozlesme_id']?>">Sözleşmeyi Aç →</a>
<?php if((int)($selected['yenileme_id']??0)>0):?><a class="role-pill" href="lisans-yenilemeleri.php?yenileme_id=<?=(int)$selected['yenileme_id']?>">Yenileme #<?=(int)$selected['yenileme_id']?> →</a><?php endif;?>
</div>

<?php if($isOpen):?>
<div class="tr-stage-actions">
<?php foreach(['acik'=>'Açık','temas'=>'Temas Edildi','odeme_sozu'=>'Ödeme Sözü','ihtilaf'=>'İhtilaf / İnceleme'] as $value=>$label):?>
<form method="post">
<input type="hidden" name="csrf" value="<?=trh(csrf_token())?>">
<input type="hidden" name="action" value="stage">
<input type="hidden" name="sozlesme_id" value="<?=(int)$selected['sozlesme_id']?>">
<input type="hidden" name="durum" value="<?=$value?>">
<button class="role-pill <?=$stage===$value?'ok':''?>" type="submit"><?=trh($label)?></button>
</form>
<?php endforeach;?>
</div>

<form class="role-form tr-note-form" method="post">
<input type="hidden" name="csrf" value="<?=trh(csrf_token())?>">
<input type="hidden" name="action" value="note">
<input type="hidden" name="sozlesme_id" value="<?=(int)$selected['sozlesme_id']?>">
<h3>Tahsilat Takip Notu</h3>
<label>Aşama</label>
<select class="role-input" name="durum">
<?php foreach(['temas'=>'Temas Edildi','odeme_sozu'=>'Ödeme Sözü','ihtilaf'=>'İhtilaf / İnceleme','acik'=>'Açık'] as $value=>$label):?>
<option value="<?=$value?>" <?=$stage===$value?'selected':''?>><?=trh($label)?></option>
<?php endforeach;?>
</select>
<label>Not</label>
<textarea class="role-input" name="not_metni" minlength="2" maxlength="2000" rows="4" required placeholder="Arama sonucu, ödeme sözü, itiraz, dekont bekleniyor, sonraki adım..."></textarea>
<label>Sonraki aksiyon tarihi <small>İsteğe bağlı</small></label>
<input class="role-input" type="date" name="sonraki_aksiyon_tarihi" min="<?=date('Y-m-d')?>">
<button class="role-button" type="submit">Takip Notunu Kaydet</button>
</form>
<?php else:?>
<div class="role-note"><span>✅</span><p>Bu takip vakası finansal risk çözüldüğü için kapalıdır. Geçmiş kayıtlar korunur. Sözleşme tekrar risk penceresine girerse senkronizasyonda aynı vaka yeniden açılır.</p></div>
<?php endif;?>

<?php if($reminderReady):?>
<div class="tr-contract-reminders">
<h3>Yönetici Hatırlatma Geçmişi</h3>
<?php if(!$selectedReminders):?><div class="role-empty">Bu sözleşme için henüz yönetici hatırlatması gönderilmedi.</div><?php endif;?>
<?php foreach($selectedReminders as $reminder):?>
<article>
<div><strong><?=trh((string)$reminder['esik_kodu'])?></strong><span><?=trh(date('d.m.Y H:i',strtotime((string)$reminder['olusturulma_tarihi'])))?></span></div>
<small>Vade <?=trh((string)$reminder['vade_tarihi'])?> · Açık tutar snapshot <?=trm($reminder['acik_tutar'])?> <?=trh((string)$reminder['para_birimi'])?> · <?=(int)$reminder['alici_sayisi']?> alıcı · <?=trh((string)$reminder['gonderen_adi'])?></small>
</article>
<?php endforeach;?>
</div>
<?php endif;?>

<div class="tr-history">
<h3>Takip Geçmişi</h3>
<?php if(!$history):?><div class="role-empty">Henüz takip geçmişi yok.</div><?php endif;?>
<?php foreach($history as $item):?>
<article>
<div><strong><?=trh((string)$item['kullanici_adi'])?> · <?=trh((string)$item['tur'])?></strong><span><?=trh(date('d.m.Y H:i',strtotime((string)$item['olusturulma_tarihi'])))?></span></div>
<?php if((string)($item['kod']??'')!==''):?><small><?=trh((string)$item['kod'])?></small><?php endif;?>
<?php if((string)($item['not_metni']??'')!==''):?><p><?=nl2br(trh((string)$item['not_metni']))?></p><?php endif;?>
</article>
<?php endforeach;?>
</div>
</section>
<?php endif;?>

<div class="role-note"><span>🔒</span><p>Risk merkezi borç bakiyesini veya tahsilat kayıtlarını değiştirmez. Ödeme işlemleri Ticari Finans üzerinden yapılır. Takip vakası borç devam ederken manuel kapatılamaz; finansal durum çözüldüğünde senkronizasyon otomatik kapatır.</p></div>
<?php endif;?>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a href="lisans-yenilemeleri.php"><span>⏳</span>Yenileme</a>
<a href="ticari-dashboard.php"><span>📊</span>KPI</a>
<a href="ticari-finans.php"><span>₺</span>Finans</a>
<a class="active" href="tahsilat-risk.php"><span>⚠️</span>Risk</a>
<a href="guncelleme.php"><span>↻</span>Güncelle</a>
</nav>
</div>
</body>
</html>
