<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/kurum_lisanslari.php';
require __DIR__.'/src/ticari_finans.php';
require __DIR__.'/src/ticari_belgeler.php';

$user=require_role('super_admin');
$pdo=db();
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');

function tbh(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
function tbm(string|float|int $value): string { return number_format((float)$value,2,',','.'); }
function tb_payment_label(string $value): string {
    return match($value){
        'odendi'=>'Ödeme Eşleşti',
        'kismi'=>'Kısmi Eşleşti',
        'odenmedi'=>'Eşleşme Yok',
        'iptal'=>'Belge İptal',
        default=>$value,
    };
}
function tb_payment_class(string $value): string {
    return match($value){
        'odendi'=>'ok',
        'kismi'=>'partial',
        'iptal'=>'cancelled',
        default=>'open',
    };
}

$error='';
$success=trim((string)($_GET['ok']??''));
$ready=tb_tables_ready($pdo);

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar dene.');
        if(!$ready) throw new RuntimeException('Ticari belge migrationı henüz kurulmamış.');

        $action=(string)($_POST['action']??'');

        if($action==='save'){
            $id=tb_save_document($pdo,$user,$_POST);
            header('Location: ticari-belgeler.php?belge_id='.$id.'&ok='.rawurlencode('Ticari belge kaydı kaydedildi.'));
            exit;
        }

        $documentId=max(0,(int)($_POST['belge_id']??0));

        if($action==='cancel'){
            tb_cancel_document($pdo,$user,$documentId,(string)($_POST['iptal_nedeni']??''));
            header('Location: ticari-belgeler.php?belge_id='.$documentId.'&ok='.rawurlencode('Ticari belge kaydı iptal edildi. Finansal sözleşme/tahsilat bakiyesi değiştirilmedi.'));
            exit;
        }

        if($action==='allocate'){
            tb_allocate_payment(
                $pdo,$user,$documentId,
                max(0,(int)($_POST['tahsilat_id']??0)),
                $_POST['esleme_tutari']??'0'
            );
            header('Location: ticari-belgeler.php?belge_id='.$documentId.'&ok='.rawurlencode('Tahsilat belgeye eşlendi.'));
            exit;
        }

        if($action==='unallocate'){
            tb_unallocate_payment(
                $pdo,$user,$documentId,
                max(0,(int)($_POST['tahsilat_id']??0)),
                (string)($_POST['esleme_iptal_nedeni']??'')
            );
            header('Location: ticari-belgeler.php?belge_id='.$documentId.'&ok='.rawurlencode('Tahsilat eşlemesi kaldırıldı; geçmiş kaydı korundu.'));
            exit;
        }

        throw new RuntimeException('Geçersiz işlem.');
    }catch(PDOException $e){
        $mysqlError=(int)($e->errorInfo[1]??0);
        $error=$mysqlError===1062
            ?'Aynı kurumda bu belge türü ve belge numarası zaten kayıtlı.'
            :'Veritabanı işlemi tamamlanamadı.';
    }catch(Throwable $e){
        $error=$e->getMessage();
    }
}

$filters=[
    'kurum_id'=>(string)($_GET['kurum_id']??''),
    'durum'=>(string)($_GET['durum']??''),
    'belge_turu'=>(string)($_GET['belge_turu']??''),
    'q'=>(string)($_GET['q']??''),
];
$filterInstitutionId=max(0,(int)$filters['kurum_id']);

$summary=$ready?tb_currency_summary($pdo):[];
$contracts=$ready?tb_contract_options($pdo,500):[];
$rows=$ready?tb_document_rows($pdo,$filters,500):[];

$selectedId=max(0,(int)($_GET['belge_id']??0));
$selected=$selectedId>0&&$ready?tb_document_row($pdo,$selectedId):null;
$mappings=$selected?tb_document_mappings($pdo,$selectedId):[];
$availablePayments=$selected?tb_available_payments($pdo,$selectedId,200):[];
$history=$selected?tb_history_rows($pdo,$selectedId,200):[];
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Ticari Belge & Tahakkuk Merkezi — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="ticari-belgeler.css?v=1.2.57">
</head>
<body class="role-page sa-subpage">
<?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Ticari Belge & Tahakkuk</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="ticari-dashboard.php" aria-label="Ticari Dashboard"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat.php" aria-label="Ticari Mutabakat"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-aksiyon.php" aria-label="Mutabakat Aksiyon"><svg><use href="#sa-alert"/></svg></a>
<a class="sa-page-action" href="ticari-finans.php" aria-label="Ticari Finans"><svg><use href="#sa-database"/></svg></a>
<a class="sa-page-action" href="tahsilat-takvimi.php" aria-label="Tahsilat Takvimi"><svg><use href="#sa-refresh"/></svg></a>
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>

<main class="role-content">
<section class="role-hero">
<span class="eyeline">TİCARİ BELGE TAKİBİ</span>
<h1>Belge, Tahakkuk ve Tahsilat Eşleme Merkezi</h1>
<p>Harici fatura/e-Belge referanslarını ve iç tahakkukları sözleşmeye bağla; aktif tahsilatlarla kontrollü eşleştir ve tüm hareketleri audit geçmişinde koru.</p>
<span class="role-hero-art">🧾</span>
</section>

<div class="role-note tb-legal-note"><span>⚖️</span><p><strong>Bu modül yasal e-Fatura/e-Arşiv üretmez, GİB'e göndermez ve mali belge düzenlendiği anlamına gelmez.</strong> Yalnız harici muhasebe/entegratör sisteminde oluşturulmuş belge referansını veya iç tahakkuk kaydını izler. Finansal gerçek sözleşme ve aktif tahsilat tablolarıdır.</p></div>

<?php if(!$ready):?><div class="role-note"><span>⚠️</span><p>1.2.57 ticari belge migrationı henüz hazır değil. 085 migration kurulduğunda bu merkez açılır.</p></div><?php endif;?>
<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=tbh($error)?></p></div><?php endif;?>
<?php if($success!==''):?><div class="role-note"><span>✅</span><p><?=tbh($success)?></p></div><?php endif;?>

<?php if($ready):?>
<section class="tb-summary">
<?php if(!$summary):?><div class="role-empty">Henüz aktif ticari belge kaydı yok.</div><?php endif;?>
<?php foreach($summary as $item):?>
<article>
<div><strong><?=tbh((string)$item['para_birimi'])?></strong><span><?=number_format((float)$item['esleme_orani'],1,',','.')?>% eşleme</span></div>
<p><b><?=tbm($item['eslesen_tutar'])?></b> / <?=tbm($item['belge_toplami'])?></p>
<small>Eşlenen / belge toplamı · Açık <?=tbm($item['acik_belge_tutari'])?> · <?=(int)$item['belge_sayisi']?> belge</small>
</article>
<?php endforeach;?>
</section>

<section class="role-section">
<div class="role-section-head">
<div><span class="eyeline"><?=$selected?'BELGE #'.(int)$selected['id']:'YENİ KAYIT'?></span><h2><?=$selected?'Ticari Belgeyi Gör / Düzenle':'Ticari Belge Referansı Kaydet'?></h2></div>
<?php if($selected):?><a class="role-pill" href="ticari-belgeler.php">Yeni belge</a><?php endif;?>
</div>

<?php if(!$selected || (string)$selected['durum']==='aktif'):?>
<form class="role-form tb-document-form" method="post">
<input type="hidden" name="csrf" value="<?=tbh(csrf_token())?>">
<input type="hidden" name="action" value="save">
<?php if($selected):?>
<input type="hidden" name="belge_id" value="<?=(int)$selected['id']?>">
<input type="hidden" name="sozlesme_id" value="<?=(int)$selected['sozlesme_id']?>">
<div class="tb-contract-fixed">
<span>Sözleşme</span>
<strong><?=tbh((string)$selected['kurum_adi'])?> · <?=tbh((string)$selected['sozlesme_no'])?></strong>
<small>Belge oluşturulduktan sonra sözleşme bağlantısı değiştirilemez.</small>
</div>
<?php else:?>
<label>Sözleşme</label>
<select class="role-input" name="sozlesme_id" required>
<option value="">Sözleşme seç</option>
<?php foreach($contracts as $contract):?>
<option value="<?=(int)$contract['id']?>">
<?=tbh((string)$contract['kurum_adi'])?> · <?=tbh((string)$contract['sozlesme_no'])?> ·
<?=tbm($contract['belgesiz_tutar'])?> <?=tbh((string)$contract['para_birimi'])?> belgesiz
</option>
<?php endforeach;?>
</select>
<?php endif;?>

<div class="tb-form-grid">
<div>
<label>Belge türü</label>
<select class="role-input" name="belge_turu" required>
<?php foreach(tb_document_types() as $value=>$label):?>
<option value="<?=$value?>" <?=($selected&&(string)$selected['belge_turu']===$value)?'selected':''?>><?=tbh($label)?></option>
<?php endforeach;?>
</select>
</div>
<div>
<label>Belge no / referans</label>
<input class="role-input" name="belge_no" minlength="2" maxlength="120" required value="<?=tbh((string)($selected['belge_no']??''))?>" placeholder="Örn. EAR2026... veya TAHAKKUK-001">
</div>
<div>
<label>Belge tarihi</label>
<input class="role-input" type="date" name="belge_tarihi" required value="<?=tbh((string)($selected['belge_tarihi']??date('Y-m-d')))?>">
</div>
<div>
<label>Belge tutarı</label>
<input class="role-input" inputmode="decimal" name="tutar" required value="<?=tbh((string)($selected['tutar']??''))?>" placeholder="0,00">
</div>
</div>

<label>Not <small>İsteğe bağlı</small></label>
<textarea class="role-input" name="notlar" maxlength="2000" rows="3"><?=tbh((string)($selected['notlar']??''))?></textarea>
<button class="role-button" type="submit"><?=$selected?'Belge Kaydını Güncelle':'Belge Referansını Kaydet'?></button>
<?php if($selected && tb_document_mapping_count($pdo,(int)$selected['id'])>0):?>
<small>Tahsilat eşleme geçmişi bulunduğu için belge türü, numarası, tarihi ve tutarı artık değiştirilemez; yalnız not alanı aynı değerlerle yeniden kaydedilebilir.</small>
<?php endif;?>
</form>
<?php else:?>
<div class="role-note"><span>⛔</span><p>Bu ticari belge kaydı iptal edilmiştir. Belge geçmişi ve eski eşleme kayıtları audit amacıyla korunur.</p></div>
<?php endif;?>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">BELGE HAVUZU</span><h2>Ticari Belgeler</h2></div><span class="role-pill"><?=count($rows)?></span></div>
<form class="tb-filter" method="get">
<?php if($filterInstitutionId>0):?><input type="hidden" name="kurum_id" value="<?=$filterInstitutionId?>"><?php endif;?>
<input type="search" name="q" value="<?=tbh((string)$filters['q'])?>" placeholder="Belge no, sözleşme, kurum...">
<select name="belge_turu">
<option value="">Tüm belge türleri</option>
<?php foreach(tb_document_types() as $value=>$label):?><option value="<?=$value?>" <?=$filters['belge_turu']===$value?'selected':''?>><?=tbh($label)?></option><?php endforeach;?>
</select>
<select name="durum">
<option value="">Tüm durumlar</option>
<option value="aktif" <?=$filters['durum']==='aktif'?'selected':''?>>Aktif</option>
<option value="iptal" <?=$filters['durum']==='iptal'?'selected':''?>>İptal</option>
</select>
<button type="submit">Filtrele</button>
<a href="ticari-belgeler.php">Temizle</a>
</form>
<?php if($filterInstitutionId>0):?><div class="role-note"><span>🏢</span><p>Kurum filtresi aktif: #<?=$filterInstitutionId?>. Tüm belge havuzuna dönmek için “Temizle”yi kullan.</p></div><?php endif;?>

<div class="role-list tb-list">
<?php if(!$rows):?><div class="role-empty"><span>🧾</span>Filtreye uyan ticari belge yok.</div><?php endif;?>
<?php foreach($rows as $row):?>
<a class="role-row <?=$selectedId===(int)$row['id']?'selected':''?>" href="ticari-belgeler.php?belge_id=<?=(int)$row['id']?>">
<span><?=($row['belge_turu']==='fatura_referansi'?'🧾':($row['belge_turu']==='tahakkuk'?'📄':'📎'))?></span>
<div>
<strong><?=tbh((string)$row['kurum_adi'])?> · <?=tbh((string)$row['belge_no'])?></strong>
<small><?=tbh(tb_document_types()[(string)$row['belge_turu']]??(string)$row['belge_turu'])?> ·
<?=tbh((string)$row['sozlesme_no'])?> · <?=tbh((string)$row['belge_tarihi'])?> ·
<?=tbm($row['eslesen_tutar'])?> / <?=tbm($row['tutar'])?> <?=tbh((string)$row['para_birimi'])?>
</small>
</div>
<span class="role-pill <?=tb_payment_class((string)$row['odeme_durumu'])?>"><?=tbh(tb_payment_label((string)$row['odeme_durumu']))?></span>
</a>
<?php endforeach;?>
</div>
</section>

<?php if($selected):?>
<section class="role-section">
<div class="role-section-head">
<div><span class="eyeline">BELGE DETAYI</span><h2><?=tbh((string)$selected['belge_no'])?></h2></div>
<span class="role-pill <?=tb_payment_class((string)$selected['odeme_durumu'])?>"><?=tbh(tb_payment_label((string)$selected['odeme_durumu']))?></span>
</div>

<div class="tb-detail-grid">
<div><span>Kurum</span><strong><?=tbh((string)$selected['kurum_adi'])?></strong></div>
<div><span>Sözleşme</span><strong><?=tbh((string)$selected['sozlesme_no'])?></strong></div>
<div><span>Belge Türü</span><strong><?=tbh(tb_document_types()[(string)$selected['belge_turu']]??(string)$selected['belge_turu'])?></strong></div>
<div><span>Belge Tarihi</span><strong><?=tbh((string)$selected['belge_tarihi'])?></strong></div>
<div><span>Belge Tutarı</span><strong><?=tbm($selected['tutar'])?> <?=tbh((string)$selected['para_birimi'])?></strong></div>
<div><span>Eşlenen Aktif Tahsilat</span><strong><?=tbm($selected['eslesen_tutar'])?> <?=tbh((string)$selected['para_birimi'])?></strong></div>
<div><span>Belge Kalanı</span><strong><?=tbm($selected['kalan_tutar'])?> <?=tbh((string)$selected['para_birimi'])?></strong></div>
<div><span>Durum</span><strong><?=((string)$selected['durum']==='aktif'?'Aktif':'İptal')?></strong></div>
</div>

<div class="tb-links">
<a class="role-pill ok" href="ticari-finans.php?sozlesme_id=<?=(int)$selected['sozlesme_id']?>">Sözleşmeyi Aç →</a>
<a class="role-pill" href="kurum-ticari-360.php?kurum_id=<?=(int)$selected['kurum_id']?>">Kurum Ticari 360 →</a>
</div>

<?php if((string)$selected['durum']==='aktif' && (float)$selected['kalan_tutar']>0.009):?>
<div class="tb-allocation-grid">
<form class="role-form tb-card" method="post">
<input type="hidden" name="csrf" value="<?=tbh(csrf_token())?>">
<input type="hidden" name="action" value="allocate">
<input type="hidden" name="belge_id" value="<?=(int)$selected['id']?>">
<h3>Aktif Tahsilatı Eşle</h3>
<?php if(!$availablePayments):?>
<div class="role-empty">Bu sözleşmede eşlemeye uygun kullanılabilir aktif tahsilat yok.</div>
<?php else:?>
<label>Tahsilat</label>
<select class="role-input" name="tahsilat_id" required>
<option value="">Tahsilat seç</option>
<?php foreach($availablePayments as $payment):?>
<option value="<?=(int)$payment['id']?>">
#<?=(int)$payment['id']?> · <?=tbh((string)$payment['tahsilat_tarihi'])?> ·
Kullanılabilir <?=tbm($payment['kullanilabilir_tutar'])?> <?=tbh((string)$payment['para_birimi'])?>
<?php if((string)($payment['referans_no']??'')!==''):?> · <?=tbh((string)$payment['referans_no'])?><?php endif;?>
</option>
<?php endforeach;?>
</select>
<label>Eşleme tutarı</label>
<input class="role-input" inputmode="decimal" name="esleme_tutari" required placeholder="0,00">
<button class="role-button" type="submit">Tahsilatı Belgeye Eşle</button>
<small>Bu işlem tahsilat tutarını veya sözleşme bakiyesini değiştirmez; yalnız ödeme-belge ilişkilendirmesi oluşturur.</small>
<?php endif;?>
</form>

<div class="tb-card">
<h3>Eşleme Politikası</h3>
<p>Bir tahsilat birden fazla belgeye bölünebilir; toplam eşleme tahsilat tutarını aşamaz. Bir belge de birden fazla tahsilatla kapatılabilir; toplam eşleme belge tutarını aşamaz.</p>
<p>İptal edilmiş tahsilat finansal eşleşme toplamından otomatik düşer; geçmiş bağlantı kaydı audit için kalır.</p>
</div>
</div>
<?php endif;?>

<div class="tb-mappings">
<h3>Tahsilat Eşleme Geçmişi</h3>
<?php if(!$mappings):?><div class="role-empty">Bu belge için tahsilat eşleme geçmişi yok.</div><?php endif;?>
<?php foreach($mappings as $mapping):?>
<article>
<div>
<strong>Tahsilat #<?=(int)$mapping['tahsilat_id']?> · <?=tbm($mapping['esleme_tutari'])?> <?=tbh((string)($mapping['para_birimi']?:$selected['para_birimi']))?></strong>
<span><?=tbh((string)($mapping['tahsilat_tarihi']?:'—'))?></span>
</div>
<small>
Eşleme <?=((string)$mapping['esleme_durumu']==='aktif'?'aktif':'kaldırıldı')?> ·
Tahsilat <?=((string)$mapping['tahsilat_durumu']==='aktif'?'aktif':((string)$mapping['tahsilat_durumu']==='iptal'?'iptal':'bulunamadı'))?>
<?php if((string)($mapping['referans_no']??'')!==''):?> · <?=tbh((string)$mapping['referans_no'])?><?php endif;?>
</small>
<?php if((string)$mapping['esleme_durumu']==='aktif'):?>
<form class="tb-inline-cancel" method="post">
<input type="hidden" name="csrf" value="<?=tbh(csrf_token())?>">
<input type="hidden" name="action" value="unallocate">
<input type="hidden" name="belge_id" value="<?=(int)$selected['id']?>">
<input type="hidden" name="tahsilat_id" value="<?=(int)$mapping['tahsilat_id']?>">
<input class="role-input" name="esleme_iptal_nedeni" minlength="3" maxlength="500" required placeholder="Eşleme kaldırma nedeni">
<button class="role-pill" type="submit">Eşlemeyi Kaldır</button>
</form>
<?php elseif((string)($mapping['iptal_nedeni']??'')!==''):?>
<p><?=tbh((string)$mapping['iptal_nedeni'])?></p>
<?php endif;?>
</article>
<?php endforeach;?>
</div>

<?php if((string)$selected['durum']==='aktif'):?>
<form class="role-form tb-cancel-doc" method="post">
<input type="hidden" name="csrf" value="<?=tbh(csrf_token())?>">
<input type="hidden" name="action" value="cancel">
<input type="hidden" name="belge_id" value="<?=(int)$selected['id']?>">
<label>Belge Kaydını İptal Et <small>Aktif finansal eşleme varsa önce eşlemeyi kaldır.</small></label>
<textarea class="role-input" name="iptal_nedeni" minlength="3" maxlength="500" rows="2" required placeholder="İptal nedeni"></textarea>
<button class="role-button tb-danger" type="submit">Belge Kaydını İptal Et</button>
</form>
<?php endif;?>

<div class="tb-history">
<h3>Belge Audit Geçmişi</h3>
<?php if(!$history):?><div class="role-empty">Belge geçmişi bulunamadı.</div><?php endif;?>
<?php foreach($history as $item):?>
<article>
<div><strong><?=tbh((string)$item['kullanici_adi'])?> · <?=tbh((string)$item['tur'])?></strong><span><?=tbh(date('d.m.Y H:i',strtotime((string)$item['olusturulma_tarihi'])))?></span></div>
<?php if((string)($item['kod']??'')!==''):?><small><?=tbh((string)$item['kod'])?></small><?php endif;?>
<?php if((string)($item['detay']??'')!==''):?><p><?=nl2br(tbh((string)$item['detay']))?></p><?php endif;?>
</article>
<?php endforeach;?>
</div>
</section>
<?php endif;?>

<div class="role-note"><span>🔒</span><p>Ticari belge kayıtları sözleşmenin borç tutarını ve tahsilatın finansal durumunu değiştirmez. Resmî mali belge üretimi/iletimi için yetkili muhasebe veya e-Belge entegratörü kullanılmalıdır.</p></div>
<?php endif;?>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a href="ticari-dashboard.php"><span>📊</span>KPI</a>
<a class="active" href="ticari-belgeler.php"><span>🧾</span>Belgeler</a>
<a href="ticari-mutabakat.php"><span>⚖️</span>Mutabakat</a>
<a href="ticari-mutabakat-aksiyon.php"><span>🧭</span>Aksiyon</a>
<a href="ticari-finans.php"><span>₺</span>Finans</a>
<a href="tahsilat-takvimi.php"><span>📅</span>Takvim</a>
</nav>
</div>
</body>
</html>
