<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/kurum_lisanslari.php';
require __DIR__.'/src/ticari_finans.php';

$user=require_role('super_admin');
$pdo=db();

function tfh(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
function tff(string|float|int $value): string { return number_format((float)$value,2,',','.'); }
function tf_status(string $value): string {
    return match($value){
        'taslak'=>'Taslak',
        'aktif'=>'Aktif',
        'tamamlandi'=>'Tamamlandı',
        'iptal'=>'İptal',
        default=>$value,
    };
}
function tf_method(string $value): string {
    return match($value){
        'havale'=>'Havale / EFT',
        'kredi_karti'=>'Kredi kartı',
        'nakit'=>'Nakit',
        'cek'=>'Çek',
        'diger'=>'Diğer',
        default=>$value,
    };
}

$error='';
$success=trim((string)($_GET['ok']??''));
if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar dene.');
        $action=(string)($_POST['action']??'');
        if($action==='contract_save'){
            tf_save_contract($pdo,$user,$_POST);
            header('Location: ticari-finans.php?ok='.rawurlencode('Sözleşme kaydedildi.'));
            exit;
        }
        if($action==='payment_save'){
            tf_record_payment($pdo,$user,$_POST);
            header('Location: ticari-finans.php?ok='.rawurlencode('Tahsilat kaydedildi.'));
            exit;
        }
        if($action==='payment_cancel'){
            tf_cancel_payment($pdo,$user,(int)($_POST['tahsilat_id']??0),(string)($_POST['iptal_nedeni']??''));
            header('Location: ticari-finans.php?ok='.rawurlencode('Tahsilat iptal edildi; kayıt geçmişte korunuyor.'));
            exit;
        }
        throw new RuntimeException('Geçersiz işlem.');
    }catch(PDOException $e){
        $mysqlError=(int)($e->errorInfo[1]??0);
        $error=$mysqlError===1062?'Sözleşme numarası zaten kullanılıyor.':'Veritabanı işlemi tamamlanamadı.';
    }catch(Throwable $e){
        $error=$e->getMessage();
    }
}

$ready=tf_tables_ready($pdo);
$institutions=kl_active_institutions($pdo);
$packages=kl_tables_ready($pdo)?kl_package_rows($pdo,true):[];
$contracts=$ready?tf_contract_rows($pdo):[];
$payments=$ready?tf_payment_rows($pdo,80):[];
$summary=$ready?tf_financial_summary($pdo):[];
$integrityIssues=$ready?tf_integrity_issues($pdo):[];
$renewals=kl_tables_ready($pdo)?tf_license_renewal_rows($pdo,30):[];

$editId=max(0,(int)($_GET['sozlesme_id']??0));
$edit=null;
foreach($contracts as $row) if((int)$row['id']===$editId){$edit=$row;break;}
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Ticari Finans — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="kurum.css?v=1.0.41">
</head>
<body class="role-page sa-subpage"><?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Ticari Finans</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="paketler.php" aria-label="Paketler"><svg><use href="#sa-database"/></svg></a>
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>

<main class="role-content">
<section class="role-hero">
<span class="eyeline">SATIŞ & TAHSİLAT</span>
<h1>Ticari Finans Merkezi</h1>
<p>Kurum sözleşmelerini, tahsilatları, vadeleri ve yaklaşan lisans yenilemelerini tek ekrandan takip et.</p>
<span class="role-hero-art">₺</span>
</section>

<?php if(!$ready):?><div class="role-note"><span>⚠️</span><p>Ticari finans tabloları henüz hazır değil. 1.2.38 migrationı kurulduğunda bu ekran otomatik açılır.</p></div><?php endif;?>
<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=tfh($error)?></p></div><?php endif;?>
<?php if($success!==''):?><div class="role-note"><span>✅</span><p><?=tfh($success)?></p></div><?php endif;?>

<?php if($ready):?>
<?php if($integrityIssues):?>
<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">VERİ BÜTÜNLÜĞÜ</span><h2>Geçmiş Kayıt Uyarıları</h2></div><span class="role-pill"><?=count($integrityIssues)?></span></div>
<div class="role-list">
<?php foreach($integrityIssues as $issue):?>
<div class="role-row">
<span>⚠️</span>
<div><strong><?=tfh((string)$issue['mesaj'])?></strong><small><?=(int)$issue['adet']?> kayıt · Yeni işlemlerde bu tutarsızlık artık engelleniyor.</small></div>
<span class="role-pill"><?=(int)$issue['adet']?></span>
</div>
<?php endforeach;?>
</div>
</section>
<?php endif;?>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">FİNANS ÖZETİ</span><h2>Sözleşme ve Tahsilat</h2></div></div>
<div class="role-stats">
<?php if(!$summary):?><div class="role-stat"><span>—</span><strong>Henüz sözleşme yok</strong><small>Ticari takip başlatılmadı.</small></div><?php endif;?>
<?php foreach($summary as $row):?>
<div class="role-stat">
<span><?=tfh((string)$row['para_birimi'])?></span>
<strong><?=tff($row['tahsil_edilen'])?> / <?=tff($row['sozlesme_toplami'])?></strong>
<small>Tahsil edilen / sözleşme · Kalan <?=tff($row['kalan_tutar'])?></small>
</div>
<?php endforeach;?>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">LİSANS YENİLEME</span><h2>30 Günlük Yenileme Radar</h2></div><span class="role-pill"><?=count($renewals)?></span></div>
<div class="role-list">
<?php if(!$renewals):?><div class="role-empty"><span>✅</span>Önümüzdeki 30 gün içinde biten veya süresi geçmiş aktif lisans yok.</div><?php endif;?>
<?php foreach($renewals as $renewal): $days=(int)$renewal['kalan_gun'];?>
<a class="role-row" href="paketler.php?kurum_id=<?=(int)$renewal['kurum_id']?>">
<span><?=$days<0?'⚠️':'⏳'?></span>
<div><strong><?=tfh((string)$renewal['kurum_adi'])?> · <?=tfh((string)$renewal['paket_adi'])?></strong>
<small><?=tfh((string)$renewal['bitis_tarihi'])?> · <?=$days<0?abs($days).' gün geçti':$days.' gün kaldı'?></small></div>
<span class="role-pill <?=$days>=0?'ok':''?>"><?=$days<0?'Süresi geçti':'Yenileme'?></span>
</a>
<?php endforeach;?>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">SÖZLEŞME</span><h2><?=$edit?'Sözleşmeyi Düzenle':'Yeni Sözleşme'?></h2></div><?php if($edit):?><a class="role-pill" href="ticari-finans.php">Yeni sözleşme</a><?php endif;?></div>
<form class="role-form" method="post">
<input type="hidden" name="csrf" value="<?=tfh(csrf_token())?>">
<input type="hidden" name="action" value="contract_save">
<input type="hidden" name="sozlesme_id" value="<?=(int)($edit['id']??0)?>">
<label>Kurum</label>
<select class="role-input" name="kurum_id" required>
<option value="">Kurum seç</option>
<?php foreach($institutions as $institution):?><option value="<?=(int)$institution['id']?>" <?=((int)($edit['kurum_id']??0)===(int)$institution['id']?'selected':'')?>><?=tfh((string)$institution['ad'])?></option><?php endforeach;?>
</select>
<label>Paket <small>İsteğe bağlı</small></label>
<select class="role-input" name="paket_id">
<option value="0">Paket bağımsız</option>
<?php foreach($packages as $package):?><option value="<?=(int)$package['id']?>" <?=((int)($edit['paket_id']??0)===(int)$package['id']?'selected':'')?>><?=tfh((string)$package['ad'])?></option><?php endforeach;?>
</select>
<label>Sözleşme numarası</label>
<input class="role-input" name="sozlesme_no" maxlength="80" required value="<?=tfh((string)($edit['sozlesme_no']??''))?>" placeholder="Örn. IA-2026-001">
<label>Başlangıç tarihi</label>
<input class="role-input" type="date" name="baslangic_tarihi" required value="<?=tfh((string)($edit['baslangic_tarihi']??date('Y-m-d')))?>">
<label>Bitiş tarihi</label>
<input class="role-input" type="date" name="bitis_tarihi" value="<?=tfh((string)($edit['bitis_tarihi']??''))?>">
<label>Vade tarihi</label>
<input class="role-input" type="date" name="vade_tarihi" value="<?=tfh((string)($edit['vade_tarihi']??''))?>">
<label>Toplam sözleşme tutarı</label>
<input class="role-input" inputmode="decimal" name="toplam_tutar" required value="<?=tfh((string)($edit['toplam_tutar']??''))?>" placeholder="0,00">
<label>Para birimi</label>
<select class="role-input" name="para_birimi"><?php foreach(['TRY','USD','EUR'] as $currency):?><option value="<?=$currency?>" <?=((string)($edit['para_birimi']??'TRY')===$currency?'selected':'')?>><?=$currency?></option><?php endforeach;?></select>
<label>Durum</label>
<select class="role-input" name="durum">
<option value="taslak" <?=((string)($edit['durum']??'aktif')==='taslak'?'selected':'')?>>Taslak</option>
<option value="aktif" <?=((string)($edit['durum']??'aktif')==='aktif'?'selected':'')?>>Aktif</option>
<?php if((string)($edit['durum']??'')==='tamamlandi'):?><option value="tamamlandi" selected disabled>Tamamlandı · tahsilata göre otomatik</option><?php endif;?>
<option value="iptal" <?=((string)($edit['durum']??'aktif')==='iptal'?'selected':'')?>>İptal</option>
</select>
<small>Tamamlandı durumu aktif tahsilat toplamına göre otomatik belirlenir. Tahsilat geçmişi başladıktan sonra kurum ve para birimi değiştirilemez; aktif tahsilatlar iptal edilmeden sözleşme iptal edilemez.</small>
<label>Not</label>
<textarea class="role-input" name="notlar" rows="3" maxlength="2000"><?=tfh((string)($edit['notlar']??''))?></textarea>
<button class="role-button" type="submit"><?=$edit?'Sözleşmeyi Güncelle':'Sözleşmeyi Kaydet'?></button>
</form>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">TAHSİLAT</span><h2>Yeni Tahsilat</h2></div></div>
<form class="role-form" method="post">
<input type="hidden" name="csrf" value="<?=tfh(csrf_token())?>">
<input type="hidden" name="action" value="payment_save">
<label>Sözleşme</label>
<select class="role-input" name="sozlesme_id" required>
<option value="">Sözleşme seç</option>
<?php foreach($contracts as $contract): if(in_array((string)$contract['durum'],['iptal','taslak'],true)) continue;?>
<option value="<?=(int)$contract['id']?>"><?=tfh((string)$contract['sozlesme_no'])?> · <?=tfh((string)$contract['kurum_adi'])?> · Kalan <?=tff($contract['kalan_tutar'])?> <?=tfh((string)$contract['para_birimi'])?></option>
<?php endforeach;?>
</select>
<label>Tahsilat tarihi</label>
<input class="role-input" type="date" name="tahsilat_tarihi" required value="<?=date('Y-m-d')?>">
<label>Tutar</label>
<input class="role-input" inputmode="decimal" name="tutar" required placeholder="0,00">
<label>Ödeme yöntemi</label>
<select class="role-input" name="odeme_yontemi">
<option value="havale">Havale / EFT</option>
<option value="kredi_karti">Kredi kartı</option>
<option value="nakit">Nakit</option>
<option value="cek">Çek</option>
<option value="diger">Diğer</option>
</select>
<label>Referans / dekont no</label>
<input class="role-input" name="referans_no" maxlength="120">
<label>Not</label>
<textarea class="role-input" name="notlar" rows="2" maxlength="1000"></textarea>
<button class="role-button" type="submit">Tahsilatı Kaydet</button>
</form>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">SÖZLEŞMELER</span><h2>Ticari Portföy</h2></div><span class="role-pill"><?=count($contracts)?></span></div>
<div class="role-list">
<?php if(!$contracts):?><div class="role-empty"><span>📄</span>Henüz sözleşme kaydı yok.</div><?php endif;?>
<?php foreach($contracts as $contract):?>
<a class="role-row" href="ticari-finans.php?sozlesme_id=<?=(int)$contract['id']?>">
<span><?=($contract['gecikmis']??false)?'⚠️':'📄'?></span>
<div><strong><?=tfh((string)$contract['kurum_adi'])?> · <?=tfh((string)$contract['sozlesme_no'])?></strong>
<small><?=tff($contract['tahsil_edilen'])?> / <?=tff($contract['toplam_tutar'])?> <?=tfh((string)$contract['para_birimi'])?> · Kalan <?=tff($contract['kalan_tutar'])?><?php if((string)$contract['vade_tarihi']!==''):?> · Vade <?=tfh((string)$contract['vade_tarihi'])?><?php endif;?></small></div>
<span class="role-pill <?=($contract['gecikmis']??false)?'':((string)$contract['durum']==='aktif'?'ok':'')?>"><?=($contract['gecikmis']??false)?'Gecikmiş':tf_status((string)$contract['durum'])?></span>
</a>
<?php endforeach;?>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">TAHSİLAT GEÇMİŞİ</span><h2>Son Hareketler</h2></div><span class="role-pill"><?=count($payments)?></span></div>
<div class="role-list">
<?php if(!$payments):?><div class="role-empty"><span>₺</span>Henüz tahsilat kaydı yok.</div><?php endif;?>
<?php foreach($payments as $payment):?>
<div class="role-row">
<span><?=((string)$payment['durum']==='aktif'?'💳':'↩️')?></span>
<div><strong><?=tfh((string)$payment['kurum_adi'])?> · <?=tff($payment['tutar'])?> <?=tfh((string)$payment['para_birimi'])?></strong>
<small><?=tfh((string)$payment['tahsilat_tarihi'])?> · <?=tfh(tf_method((string)$payment['odeme_yontemi']))?> · <?=tfh((string)$payment['sozlesme_no'])?><?php if((string)$payment['referans_no']!==''):?> · Ref <?=tfh((string)$payment['referans_no'])?><?php endif;?></small>
<?php if((string)$payment['durum']==='iptal'):?><small>İptal: <?=tfh((string)$payment['iptal_nedeni'])?></small><?php endif;?>
<?php if(!empty($payment['kurum_tutarsiz'])):?><small>⚠️ Tahsilatın kayıtlı kurumu ile sözleşmenin güncel kurumu farklı. Geçmiş kayıt incelemesi gerekli.</small><?php endif;?>
</div>
<span class="role-pill <?=((string)$payment['durum']==='aktif'?'ok':'')?>"><?=((string)$payment['durum']==='aktif'?'Aktif':'İptal')?></span>
<?php if((string)$payment['durum']==='aktif'):?>
<form method="post">
<input type="hidden" name="csrf" value="<?=tfh(csrf_token())?>">
<input type="hidden" name="action" value="payment_cancel">
<input type="hidden" name="tahsilat_id" value="<?=(int)$payment['id']?>">
<input class="role-input" name="iptal_nedeni" maxlength="500" required placeholder="İptal nedeni">
<button class="role-pill" type="submit">İptal et</button>
</form>
<?php endif;?>
</div>
<?php endforeach;?>
</div>
</section>

<div class="role-note"><span>ℹ️</span><p>Bu modül ticari takip içindir; resmi e-Fatura/e-Arşiv belgesi üretmez. Tahsilatlar fiziksel olarak silinmez; hatalı kayıtlar iptal edilerek audit izi korunur.</p></div>
<?php endif;?>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a href="paketler.php"><span>💼</span>Paketler</a>
<a class="active" href="ticari-finans.php"><span>₺</span>Finans</a>
<a href="guncelleme.php"><span>↻</span>Güncelle</a>
</nav>
</div>
</body>
</html>
