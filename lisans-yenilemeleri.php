<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/kurum_lisanslari.php';
require __DIR__.'/src/bildirimler.php';
require __DIR__.'/src/lisans_yenileme.php';
require __DIR__.'/src/ticari_finans.php';
require __DIR__.'/src/lisans_yenileme_ticari.php';

$user=require_role('super_admin');
$pdo=db();
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');

function lyh(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
function ly_day_text(int $days): string {
    if($days<0) return abs($days).' gün geçti';
    if($days===0) return 'Bugün bitiyor';
    if($days===1) return '1 gün kaldı';
    return $days.' gün kaldı';
}
function ly_urgency_class(int $days): string {
    if($days<0) return 'expired';
    if($days<=1) return 'critical';
    if($days<=7) return 'urgent';
    if($days<=15) return 'warning';
    return 'normal';
}

function ly_contract_status(string $value): string {
    return match($value){
        'taslak'=>'Taslak',
        'aktif'=>'Aktif',
        'tamamlandi'=>'Tamamlandı',
        'iptal'=>'İptal',
        default=>$value,
    };
}

$error='';
$success=trim((string)($_GET['ok']??''));
$ready=ly_tables_ready($pdo);

if($ready && $_SERVER['REQUEST_METHOD']!=='POST'){
    try{
        ly_sync_cases($pdo,$user,30);
    }catch(Throwable $e){
        $error='Yenileme kuyruğu senkronize edilemedi: '.$e->getMessage();
    }
}

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar dene.');
        if(!$ready) throw new RuntimeException('Lisans yenileme migrationı henüz kurulmamış.');

        ly_sync_cases($pdo,$user,30);
        $action=(string)($_POST['action']??'');
        $renewalId=max(0,(int)($_POST['yenileme_id']??0));

        if($action==='sync'){
            $sync=ly_sync_cases($pdo,$user,30);
            header('Location: lisans-yenilemeleri.php?ok='.rawurlencode(
                'Kuyruk güncellendi. Yeni vaka: '.(int)$sync['created'].' · Otomatik kapanan: '.(int)$sync['reconciled']
            ));
            exit;
        }

        if($action==='notify'){
            ly_sync_cases($pdo,$user,30);
            $notify=ly_sync_manager_notifications($pdo,$user);
            header('Location: lisans-yenilemeleri.php?ok='.rawurlencode(
                'Yönetici uyarıları senkronize edildi. Gönderilen: '.(int)$notify['sent'].' · Atlanan/daha önce gönderilen: '.(int)$notify['skipped']
            ));
            exit;
        }

        if($action==='stage'){
            ly_set_stage($pdo,$user,$renewalId,(string)($_POST['durum']??''));
            header('Location: lisans-yenilemeleri.php?yenileme_id='.$renewalId.'&ok='.rawurlencode('Yenileme aşaması güncellendi.'));
            exit;
        }

        if($action==='note'){
            ly_add_note(
                $pdo,$user,$renewalId,
                (string)($_POST['not_metni']??''),
                (string)($_POST['sonraki_takip_tarihi']??'')
            );
            header('Location: lisans-yenilemeleri.php?yenileme_id='.$renewalId.'&ok='.rawurlencode('Yenileme notu eklendi.'));
            exit;
        }

        if($action==='renew'){
            ly_renew(
                $pdo,$user,$renewalId,
                max(0,(int)($_POST['paket_id']??0)),
                (string)($_POST['yeni_bitis_tarihi']??''),
                (string)($_POST['yenileme_notu']??'')
            );
            header('Location: lisans-yenilemeleri.php?yenileme_id='.$renewalId.'&ok='.rawurlencode('Kurum lisansı yenilendi ve vaka kapatıldı.'));
            exit;
        }

        if($action==='not_renewed'){
            ly_mark_not_renewed($pdo,$user,$renewalId,(string)($_POST['neden']??''));
            header('Location: lisans-yenilemeleri.php?yenileme_id='.$renewalId.'&ok='.rawurlencode('Yenileme vakası “Yenilenmedi” olarak kapatıldı.'));
            exit;
        }

        if($action==='contract_draft'){
            $contractId=lyt_create_contract_draft($pdo,$user,$renewalId,$_POST);
            header('Location: lisans-yenilemeleri.php?yenileme_id='.$renewalId.'&ok='.rawurlencode('Yenileme için sözleşme taslağı oluşturuldu (#'.$contractId.').'));
            exit;
        }

        throw new RuntimeException('Geçersiz işlem.');
    }catch(PDOException $e){
        $mysqlError=(int)($e->errorInfo[1]??0);
        $error=$mysqlError===1062
            ?'Sözleşme numarası veya yenileme-sözleşme bağlantısı zaten kullanılıyor.'
            :'Veritabanı işlemi tamamlanamadı.';
    }catch(Throwable $e){
        $error=$e->getMessage();
    }
}

$filters=[
    'durum'=>(string)($_GET['durum']??''),
    'aciliyet'=>(string)($_GET['aciliyet']??''),
];
$summary=$ready?ly_summary($pdo):[];
$rows=$ready?ly_queue_rows($pdo,$filters):[];
$packages=kl_tables_ready($pdo)?kl_package_rows($pdo,false):[];
$commercialReady=lyt_tables_ready($pdo);
$commercialSummary=$commercialReady?lyt_gap_summary($pdo):[];
$commercialRevenue=$commercialReady?lyt_revenue_summary($pdo):[];
$commercialRows=$commercialReady?lyt_gap_rows($pdo,200):[];

$selectedId=max(0,(int)($_GET['yenileme_id']??0));
$selected=$selectedId>0&&$ready?ly_case_row($pdo,$selectedId):null;
$history=$selected?ly_history_rows($pdo,$selectedId):[];
$selectedContract=$selected&&$commercialReady?lyt_contract_relation($pdo,$selectedId):null;
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Lisans Yenilemeleri — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="lisans-yenilemeleri.css?v=1.2.49">
</head>
<body class="role-page sa-subpage">
<?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Lisans Yenilemeleri</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="paketler.php" aria-label="Paket & Lisanslar"><svg><use href="#sa-database"/></svg></a>
<a class="sa-page-action" href="ticari-finans.php" aria-label="Ticari Finans"><svg><use href="#sa-card"/></svg></a>
<a class="sa-page-action" href="ticari-dashboard.php" aria-label="Ticari Dashboard"><svg><use href="#sa-database"/></svg></a>
<a class="sa-page-action" href="tahsilat-risk.php" aria-label="Tahsilat Risk Merkezi"><svg><use href="#sa-alert"/></svg></a>
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>

<main class="role-content">
<section class="role-hero">
<span class="eyeline">YENİLEME OPERASYONU</span>
<h1>Lisans Süre Sonu Merkezi</h1>
<p>30/15/7/1 gün eşiklerini, süresi geçen kurumları, görüşme notlarını ve gerçek lisans yenilemesini tek kuyruğa bağla.</p>
<span class="role-hero-art">⏳</span>
</section>

<?php if(!$ready):?><div class="role-note"><span>⚠️</span><p>1.2.48 lisans yenileme migrationı henüz hazır değil. 080 migration kurulduğunda bu merkez otomatik açılır.</p></div><?php endif;?>
<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=lyh($error)?></p></div><?php endif;?>
<?php if($success!==''):?><div class="role-note"><span>✅</span><p><?=lyh($success)?></p></div><?php endif;?>

<?php if($ready):?>
<section class="ly-summary">
<a href="lisans-yenilemeleri.php?durum=open"><strong><?=(int)($summary['acik']??0)?></strong><span>Açık Vaka</span></a>
<a href="lisans-yenilemeleri.php?aciliyet=expired"><strong><?=(int)($summary['expired']??0)?></strong><span>Süresi Geçti</span></a>
<a href="lisans-yenilemeleri.php?aciliyet=1"><strong><?=(int)($summary['gun_1']??0)?></strong><span>0–1 Gün</span></a>
<a href="lisans-yenilemeleri.php?aciliyet=7"><strong><?=(int)($summary['gun_7']??0)?></strong><span>2–7 Gün</span></a>
<a href="lisans-yenilemeleri.php?aciliyet=15"><strong><?=(int)($summary['gun_15']??0)?></strong><span>8–15 Gün</span></a>
<a href="lisans-yenilemeleri.php?aciliyet=30"><strong><?=(int)($summary['gun_30']??0)?></strong><span>16–30 Gün</span></a>
<a href="lisans-yenilemeleri.php?durum=yenilendi"><strong><?=(int)($summary['yenilendi']??0)?></strong><span>Yenilendi</span></a>
<a href="lisans-yenilemeleri.php?durum=yenilenmedi"><strong><?=(int)($summary['yenilenmedi']??0)?></strong><span>Yenilenmedi</span></a>
</section>

<?php if($commercialReady):?>
<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">TİCARİ TAMAMLAMA</span><h2>Yenileme → Sözleşme → Tahsilat</h2></div><span class="role-pill"><?=count($commercialRows)?> yenilenmiş vaka</span></div>
<div class="role-stats">
<div class="role-stat"><span>📄</span><strong><?=(int)($commercialSummary['sozlesme_yok']??0)?></strong><small>Yenilendi · sözleşme yok</small></div>
<div class="role-stat"><span>📝</span><strong><?=(int)($commercialSummary['sozlesme_taslak']??0)?></strong><small>Sözleşme taslak</small></div>
<div class="role-stat"><span>₺</span><strong><?=(int)($commercialSummary['tahsilat_yok']??0)?></strong><small>Aktif sözleşme · tahsilat yok</small></div>
<div class="role-stat"><span>◐</span><strong><?=(int)($commercialSummary['kismi_tahsilat']??0)?></strong><small>Kısmi tahsilat</small></div>
<div class="role-stat"><span>✓</span><strong><?=(int)($commercialSummary['tamam']??0)?></strong><small>Ticari akış tamam</small></div>
</div>

<?php if($commercialRevenue):?>
<div class="ly-revenue-grid">
<?php foreach($commercialRevenue as $revenue):?>
<div class="ly-revenue-card">
<span><?=lyh((string)$revenue['para_birimi'])?></span>
<strong><?=number_format((float)$revenue['tahsil_edilen'],2,',','.')?> / <?=number_format((float)$revenue['sozlesme_toplami'],2,',','.')?></strong>
<small>Tahsilat / yenileme sözleşmesi · Kalan <?=number_format((float)$revenue['kalan_tutar'],2,',','.')?> · <?=(int)$revenue['yenileme_sayisi']?> yenileme</small>
</div>
<?php endforeach;?>
</div>
<?php endif;?>

<div class="role-list ly-commercial-list">
<?php foreach($commercialRows as $commercial): if((string)$commercial['ticari_durum']==='tamam') continue;?>
<a class="role-row" href="lisans-yenilemeleri.php?yenileme_id=<?=(int)$commercial['yenileme_id']?>">
<span><?=in_array((string)$commercial['ticari_durum'],['sozlesme_yok','sozlesme_kaydi_yok','sozlesme_iptal'],true)?'⚠️':'₺'?></span>
<div><strong><?=lyh((string)$commercial['kurum_adi'])?> · <?=lyh((string)$commercial['paket_adi'])?></strong>
<small><?=lyh(lyt_gap_label((string)$commercial['ticari_durum']))?>
<?php if(!empty($commercial['sozlesme_no'])):?> · <?=lyh((string)$commercial['sozlesme_no'])?><?php endif;?>
<?php if(!empty($commercial['para_birimi'])):?> · <?=number_format((float)$commercial['tahsil_edilen'],2,',','.')?> / <?=number_format((float)$commercial['toplam_tutar'],2,',','.')?> <?=lyh((string)$commercial['para_birimi'])?><?php endif;?>
</small></div>
<span class="role-pill"><?=lyh(lyt_gap_label((string)$commercial['ticari_durum']))?></span>
</a>
<?php endforeach;?>
</div>
</section>
<?php else:?>
<div class="role-note"><span>ℹ️</span><p>Yenileme–sözleşme ticari bağlantısı 081 migration kurulduğunda otomatik açılır.</p></div>
<?php endif;?>

<section class="role-section">
<div class="role-section-head">
<div><span class="eyeline">OPERASYON</span><h2>Kuyruk & Yönetici Uyarıları</h2></div>
<span class="role-pill"><?=(int)($summary['takip_bekleyen']??0)?> takip zamanı geldi</span>
</div>
<div class="ly-sync-actions">
<form method="post">
<input type="hidden" name="csrf" value="<?=lyh(csrf_token())?>">
<input type="hidden" name="action" value="sync">
<button class="role-button ly-secondary" type="submit">Kuyruğu Yeniden Senkronize Et</button>
</form>
<form method="post">
<input type="hidden" name="csrf" value="<?=lyh(csrf_token())?>">
<input type="hidden" name="action" value="notify">
<button class="role-button" type="submit">Yönetici Uyarılarını Senkronize Et</button>
</form>
</div>
<div class="role-note"><span>🔔</span><p>Bildirimler 30/15/7/1 gün ve süre doldu eşiklerinde kurum yöneticilerine gönderilir. Aynı yenileme dönemi ve aynı eşik ikinci kez gönderilmez. Bildirim senkronizasyonu bu butonla kontrollü olarak çalışır.</p></div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">AKSİYON KUYRUĞU</span><h2>Lisans Yenilemeleri</h2></div><span class="role-pill"><?=count($rows)?></span></div>
<form class="ly-filter" method="get">
<select name="durum">
<option value="">Tüm durumlar</option>
<option value="open" <?=$filters['durum']==='open'?'selected':''?>>Tüm açık vakalar</option>
<?php foreach(ly_status_labels() as $value=>$label):?><option value="<?=$value?>" <?=$filters['durum']===$value?'selected':''?>><?=lyh($label)?></option><?php endforeach;?>
</select>
<select name="aciliyet">
<option value="">Tüm tarihler</option>
<option value="expired" <?=$filters['aciliyet']==='expired'?'selected':''?>>Süresi geçmiş</option>
<option value="1" <?=$filters['aciliyet']==='1'?'selected':''?>>0–1 gün</option>
<option value="7" <?=$filters['aciliyet']==='7'?'selected':''?>>2–7 gün</option>
<option value="15" <?=$filters['aciliyet']==='15'?'selected':''?>>8–15 gün</option>
<option value="30" <?=$filters['aciliyet']==='30'?'selected':''?>>16–30 gün</option>
</select>
<button type="submit">Filtrele</button>
<a href="lisans-yenilemeleri.php">Temizle</a>
</form>

<div class="role-list ly-list">
<?php if(!$rows):?><div class="role-empty"><span>✅</span>Filtreye uyan lisans yenileme vakası yok.</div><?php endif;?>
<?php foreach($rows as $row):
$days=(int)$row['kalan_gun'];
$status=(string)$row['durum'];
$isOpen=in_array($status,ly_open_statuses(),true);
?>
<a class="role-row ly-row <?=$selectedId===(int)$row['id']?'selected':''?>" href="lisans-yenilemeleri.php?yenileme_id=<?=(int)$row['id']?>">
<span><?=$status==='yenilendi'?'✅':($status==='yenilenmedi'?'❌':($days<0?'🚨':'⏳'))?></span>
<div>
<strong><?=lyh((string)$row['kurum_adi'])?> · <?=lyh((string)($row['paket_adi']?:'Paket bulunamadı'))?></strong>
<small>
Hedef bitiş <?=lyh((string)$row['hedef_bitis_tarihi'])?>
<?php if($isOpen):?> · <?=lyh(ly_day_text($days))?><?php endif;?>
· <?=lyh(ly_status_labels()[$status]??$status)?>
<?php if(!empty($row['sonraki_takip_tarihi'])):?> · Takip <?=lyh((string)$row['sonraki_takip_tarihi'])?><?php endif;?>
· <?=(int)$row['gecmis_sayisi']?> kayıt
</small>
</div>
<span class="role-pill <?=$status==='yenilendi'?'ok':($isOpen?ly_urgency_class($days):'')?>"><?=lyh($isOpen?ly_day_text($days):(ly_status_labels()[$status]??$status))?></span>
</a>
<?php endforeach;?>
</div>
</section>

<?php if($selected):
$status=(string)$selected['durum'];
$isOpen=in_array($status,ly_open_statuses(),true);
$days=(int)$selected['kalan_gun'];
?>
<section class="role-section">
<div class="role-section-head">
<div><span class="eyeline">YENİLEME #<?=(int)$selected['id']?></span><h2><?=lyh((string)$selected['kurum_adi'])?></h2></div>
<span class="role-pill <?=$isOpen?ly_urgency_class($days):($status==='yenilendi'?'ok':'')?>"><?=lyh(ly_status_labels()[$status]??$status)?></span>
</div>

<div class="ly-detail-grid">
<div><span>Mevcut Paket</span><strong><?=lyh((string)($selected['paket_adi']?:'—'))?></strong></div>
<div><span>Hedef Bitiş</span><strong><?=lyh((string)$selected['hedef_bitis_tarihi'])?></strong></div>
<div><span>Güncel Bitiş</span><strong><?=lyh((string)($selected['guncel_bitis_tarihi']?:'Süresiz'))?></strong></div>
<div><span>Lisans Durumu</span><strong><?=lyh((string)$selected['lisans_durum'])?></strong></div>
<div><span>Kalan</span><strong><?=$isOpen?lyh(ly_day_text($days)):'Vaka kapalı'?></strong></div>
<div><span>Son Temas</span><strong><?=lyh((string)($selected['son_temas_tarihi']?:'—'))?></strong></div>
</div>

<div class="ly-links">
<a class="role-pill" href="paketler.php?kurum_id=<?=(int)$selected['kurum_id']?>">Lisansı Aç</a>
<a class="role-pill" href="ticari-finans.php">Ticari Finans</a>
<a class="role-pill" href="destek.php">Destek Merkezi</a>
</div>

<?php if($isOpen):?>
<div class="ly-stage-actions">
<?php foreach(['acik'=>'Açık','temas'=>'Temas Edildi','teklif'=>'Teklif / Görüşme'] as $value=>$label):?>
<form method="post">
<input type="hidden" name="csrf" value="<?=lyh(csrf_token())?>">
<input type="hidden" name="action" value="stage">
<input type="hidden" name="yenileme_id" value="<?=(int)$selected['id']?>">
<input type="hidden" name="durum" value="<?=$value?>">
<button class="role-pill <?=$status===$value?'ok':''?>" type="submit"><?=lyh($label)?></button>
</form>
<?php endforeach;?>
</div>

<div class="ly-two-col">
<form class="role-form ly-card" method="post">
<input type="hidden" name="csrf" value="<?=lyh(csrf_token())?>">
<input type="hidden" name="action" value="note">
<input type="hidden" name="yenileme_id" value="<?=(int)$selected['id']?>">
<h3>Takip Notu</h3>
<label>Not</label>
<textarea class="role-input" name="not_metni" minlength="2" maxlength="2000" rows="4" required placeholder="Arama sonucu, karar verici, teklif, sonraki adım..."></textarea>
<label>Sonraki takip tarihi <small>İsteğe bağlı</small></label>
<input class="role-input" type="date" name="sonraki_takip_tarihi" min="<?=date('Y-m-d')?>">
<button class="role-button ly-secondary" type="submit">Notu Kaydet</button>
</form>

<form class="role-form ly-card" method="post">
<input type="hidden" name="csrf" value="<?=lyh(csrf_token())?>">
<input type="hidden" name="action" value="renew">
<input type="hidden" name="yenileme_id" value="<?=(int)$selected['id']?>">
<h3>Lisansı Yenile</h3>
<label>Paket</label>
<select class="role-input" name="paket_id" required>
<option value="">Paket seç</option>
<?php foreach($packages as $package):?>
<option value="<?=(int)$package['id']?>" <?=((int)$selected['paket_id']===(int)$package['id']?'selected':'')?>><?=lyh((string)$package['ad'])?> · <?=lyh((string)$package['aylik_fiyat'])?> <?=lyh((string)$package['para_birimi'])?></option>
<?php endforeach;?>
</select>
<label>Yeni bitiş tarihi</label>
<input class="role-input" type="date" name="yeni_bitis_tarihi" min="<?=date('Y-m-d')?>" required>
<label>Yenileme notu <small>İsteğe bağlı</small></label>
<textarea class="role-input" name="yenileme_notu" rows="3" maxlength="2000"></textarea>
<button class="role-button" type="submit">Lisansı Yenile ve Vakayı Kapat</button>
<small>Mevcut kurum lisansı güncellenir; yeni ikinci lisans oluşturulmaz. Lisans değişikliği 1.2.46 geçmişine de yazılır.</small>
</form>
</div>

<form class="role-form ly-not-renewed" method="post">
<input type="hidden" name="csrf" value="<?=lyh(csrf_token())?>">
<input type="hidden" name="action" value="not_renewed">
<input type="hidden" name="yenileme_id" value="<?=(int)$selected['id']?>">
<label>Yenilenmedi olarak kapat <small>Bu işlem lisansı erken iptal etmez; mevcut bitiş tarihine kadar erişim devam eder.</small></label>
<textarea class="role-input" name="neden" minlength="3" maxlength="1000" rows="3" required placeholder="Bütçe, kurum kararı, hizmet sonlandırma..."></textarea>
<button class="role-button ly-danger" type="submit">Yenilenmedi Olarak Kapat</button>
</form>
<?php endif;?>

<?php if($status==='yenilendi'):?>
<div class="ly-commercial-detail">
<h3>Ticari Bağlantı</h3>
<?php if(!$commercialReady):?>
<div class="role-note"><span>ℹ️</span><p>081 migration kurulunca yenileme vakasını sözleşmeye bağlayabilirsin.</p></div>
<?php elseif($selectedContract):?>
<div class="ly-detail-grid">
<div><span>Sözleşme</span><strong><?=lyh((string)$selectedContract['sozlesme_no'])?></strong></div>
<div><span>Durum</span><strong><?=lyh(ly_contract_status((string)$selectedContract['durum']))?></strong></div>
<div><span>Toplam</span><strong><?=number_format((float)$selectedContract['toplam_tutar'],2,',','.')?> <?=lyh((string)$selectedContract['para_birimi'])?></strong></div>
<div><span>Tahsil Edilen</span><strong><?=number_format((float)$selectedContract['tahsil_edilen'],2,',','.')?> <?=lyh((string)$selectedContract['para_birimi'])?></strong></div>
<div><span>Kalan</span><strong><?=number_format((float)$selectedContract['kalan_tutar'],2,',','.')?> <?=lyh((string)$selectedContract['para_birimi'])?></strong></div>
<div><span>Vade</span><strong><?=lyh((string)($selectedContract['vade_tarihi']?:'—'))?></strong></div>
</div>
<div class="ly-links">
<a class="role-pill ok" href="ticari-finans.php?sozlesme_id=<?=(int)$selectedContract['sozlesme_id']?>">Sözleşmeyi Aç →</a>
</div>
<?php else:?>
<form class="role-form ly-card ly-contract-draft" method="post">
<input type="hidden" name="csrf" value="<?=lyh(csrf_token())?>">
<input type="hidden" name="action" value="contract_draft">
<input type="hidden" name="yenileme_id" value="<?=(int)$selected['id']?>">
<h3>Sözleşme Taslağı Oluştur</h3>
<div class="role-note"><span>📄</span><p>Sözleşme başlangıcı otomatik olarak eski lisans bitişinin ertesi günü, bitişi ise yenilenen lisansın yeni bitiş tarihi olur. Toplam tutar otomatik hesaplanmaz; ticari anlaşmadaki gerçek tutarı gir.</p></div>
<label>Sözleşme numarası</label>
<input class="role-input" name="sozlesme_no" maxlength="80" required value="<?=lyh('IA-YEN-'.(string)$selected['id'].'-'.date('Y'))?>">
<label>Toplam sözleşme tutarı</label>
<input class="role-input" inputmode="decimal" name="toplam_tutar" required placeholder="0,00">
<label>Para birimi</label>
<select class="role-input" name="para_birimi">
<option value="TRY">TRY</option><option value="USD">USD</option><option value="EUR">EUR</option>
</select>
<label>Vade tarihi <small>İsteğe bağlı</small></label>
<input class="role-input" type="date" name="vade_tarihi">
<label>Not <small>İsteğe bağlı</small></label>
<textarea class="role-input" name="notlar" rows="3" maxlength="1600"></textarea>
<button class="role-button" type="submit">Sözleşme Taslağını Oluştur</button>
<small>Taslak sözleşmeye tahsilat girilemez. Ticari Finans ekranında kontrol edip “Aktif” durumuna aldıktan sonra tahsilat kaydedebilirsin.</small>
</form>
<?php endif;?>
</div>
<?php endif;?>

<div class="ly-history">
<h3>Yenileme Geçmişi</h3>
<?php if(!$history):?><div class="role-empty">Henüz yenileme geçmişi yok.</div><?php endif;?>
<?php foreach($history as $item):?>
<article class="ly-history-item <?=$item['tur']==='bildirim'?'notification':''?>">
<div><strong><?=lyh((string)$item['kullanici_adi'])?> · <?=lyh((string)$item['tur'])?></strong><span><?=lyh(date('d.m.Y H:i',strtotime((string)$item['olusturulma_tarihi'])))?></span></div>
<?php if((string)($item['kod']??'')!==''):?><small><?=lyh((string)$item['kod'])?></small><?php endif;?>
<?php if((string)($item['not_metni']??'')!==''):?><p><?=nl2br(lyh((string)$item['not_metni']))?></p><?php endif;?>
</article>
<?php endforeach;?>
</div>
</section>
<?php endif;?>

<div class="role-note"><span>ℹ️</span><p>Yenileme vakası “Yenilenmedi” olarak kapatılırsa lisans hemen iptal edilmez. Mevcut bitiş tarihine kadar 1.2.47 erişim politikası normal çalışır; tarih geçince operasyonel erişim otomatik kapanır.</p></div>
<?php endif;?>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a href="paketler.php"><span>💼</span>Paketler</a>
<a class="active" href="lisans-yenilemeleri.php"><span>⏳</span>Yenileme</a>
<a href="ticari-dashboard.php"><span>📊</span>KPI</a>
<a href="ticari-finans.php"><span>₺</span>Finans</a>
<a href="tahsilat-risk.php"><span>⚠️</span>Risk</a>
</nav>
</div>
</body>
</html>
