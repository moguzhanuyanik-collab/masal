<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/kurum_lisanslari.php';

$user=require_role('super_admin');
$pdo=db();

function pl_h(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
function pl_limit(int $value): string { return $value>0?(string)$value:'Sınırsız'; }
function pl_status_label(string $status): string {
    return match($status){
        'aktif'=>'Aktif',
        'deneme'=>'Deneme',
        'askida'=>'Askıda',
        'iptal'=>'İptal',
        'bekliyor'=>'Başlamadı',
        'suresi_doldu'=>'Süresi doldu',
        default=>$status,
    };
}

$error='';
$success=trim((string)($_GET['ok']??''));
if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar dene.');
        $action=(string)($_POST['action']??'');
        if($action==='package_save'){
            kl_save_package($pdo,$user,$_POST);
            header('Location: paketler.php?ok='.rawurlencode('Paket kaydedildi.'));
            exit;
        }
        if($action==='package_toggle'){
            $id=max(0,(int)($_POST['paket_id']??0));
            $active=(int)($_POST['aktif']??0)===1;
            kl_set_package_active($pdo,$user,$id,$active);
            header('Location: paketler.php?ok='.rawurlencode($active?'Paket aktifleştirildi.':'Paket pasife alındı.'));
            exit;
        }
        if($action==='license_save'){
            kl_save_license($pdo,$user,$_POST);
            header('Location: paketler.php?ok='.rawurlencode('Kurum lisansı kaydedildi.'));
            exit;
        }
        throw new RuntimeException('Geçersiz işlem.');
    }catch(PDOException $e){
        $mysqlError=(int)($e->errorInfo[1]??0);
        $error=$mysqlError===1062?'Paket kodu zaten kullanılıyor.':'Veritabanı işlemi tamamlanamadı.';
    }catch(Throwable $e){
        $error=$e->getMessage();
    }
}

$ready=kl_tables_ready($pdo);
$packages=$ready?kl_package_rows($pdo,true):[];
$activePackages=$ready?kl_package_rows($pdo,false):[];
$institutions=kl_active_institutions($pdo);
$licenses=$ready?kl_license_rows($pdo):[];

$editPackageId=max(0,(int)($_GET['paket_id']??0));
$editPackage=null;
foreach($packages as $row) if((int)$row['id']===$editPackageId){$editPackage=$row;break;}

$editInstitutionId=max(0,(int)($_GET['kurum_id']??0));
$editLicense=null;
foreach($licenses as $row) if((int)$row['kurum_id']===$editInstitutionId){$editLicense=$row;break;}
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Paket & Lisanslar — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="kurum.css?v=1.0.41">
</head>
<body class="role-page sa-subpage"><?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Paket & Lisanslar</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="kurumlar.php" aria-label="Kurumlar"><svg><use href="#sa-building"/></svg></a>
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>

<main class="role-content">
<section class="role-hero">
<span class="eyeline">TİCARİ YÖNETİM</span>
<h1>Paket & Lisans Yönetimi</h1>
<p>Kurum paketlerini, kullanıcı kapasitelerini, AI aylık kota limitlerini ve lisans tarihlerini tek merkezden yönet.</p>
<span class="role-hero-art">💼</span>
</section>

<?php if(!$ready):?>
<div class="role-note"><span>⚠️</span><p>Paket / lisans veritabanı tabloları henüz hazır değil. 1.2.36 migrationı kurulduğunda bu ekran otomatik açılır.</p></div>
<?php endif;?>
<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=pl_h($error)?></p></div><?php endif;?>
<?php if($success!==''):?><div class="role-note"><span>✅</span><p><?=pl_h($success)?></p></div><?php endif;?>

<?php if($ready):?>
<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">PAKET TANIMI</span><h2><?=$editPackage?'Paketi Düzenle':'Yeni Paket'?></h2></div><?php if($editPackage):?><a class="role-pill" href="paketler.php">Yeni paket</a><?php endif;?></div>
<form class="role-form" method="post">
<input type="hidden" name="csrf" value="<?=pl_h(csrf_token())?>">
<input type="hidden" name="action" value="package_save">
<input type="hidden" name="paket_id" value="<?=(int)($editPackage['id']??0)?>">
<label>Paket adı</label>
<input class="role-input" name="ad" maxlength="120" required value="<?=pl_h((string)($editPackage['ad']??''))?>" placeholder="Örn. Kurumsal Pro">
<label>Paket kodu</label>
<input class="role-input" name="kod" maxlength="80" value="<?=pl_h((string)($editPackage['kod']??''))?>" placeholder="Boş bırakılırsa addan üretilir">
<label>Açıklama</label>
<textarea class="role-input" name="aciklama" rows="3" maxlength="1000"><?=pl_h((string)($editPackage['aciklama']??''))?></textarea>
<label>Öğrenci limiti <small>0 = sınırsız</small></label>
<input class="role-input" type="number" min="0" max="10000000" name="ogrenci_limiti" value="<?=(int)($editPackage['ogrenci_limiti']??0)?>">
<label>Öğretmen limiti <small>0 = sınırsız</small></label>
<input class="role-input" type="number" min="0" max="10000000" name="ogretmen_limiti" value="<?=(int)($editPackage['ogretmen_limiti']??0)?>">
<label>Veli limiti <small>0 = sınırsız</small></label>
<input class="role-input" type="number" min="0" max="10000000" name="veli_limiti" value="<?=(int)($editPackage['veli_limiti']??0)?>">
<label>Aylık AI kotası <small>0 = sınırsız / takip dışı</small></label>
<input class="role-input" type="number" min="0" max="10000000" name="ai_aylik_kota" value="<?=(int)($editPackage['ai_aylik_kota']??0)?>">
<label>Aylık liste fiyatı</label>
<input class="role-input" inputmode="decimal" name="aylik_fiyat" value="<?=pl_h((string)($editPackage['aylik_fiyat']??'0.00'))?>">
<label>Para birimi</label>
<select class="role-input" name="para_birimi">
<?php foreach(['TRY','USD','EUR'] as $currency):?><option value="<?=$currency?>" <?=((string)($editPackage['para_birimi']??'TRY')===$currency?'selected':'')?>><?=$currency?></option><?php endforeach;?>
</select>
<button class="role-button" type="submit"><?=$editPackage?'Paketi Güncelle':'Paketi Oluştur'?></button>
</form>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">PAKETLER</span><h2>Tanımlı Paketler</h2></div><span class="role-pill"><?=count($packages)?></span></div>
<div class="role-list">
<?php if(!$packages):?><div class="role-empty"><span>💼</span>Henüz paket tanımlanmadı.</div><?php endif;?>
<?php foreach($packages as $package):?>
<div class="role-row">
<span>💼</span>
<div>
<strong><?=pl_h((string)$package['ad'])?> · <?=pl_h((string)$package['aylik_fiyat'])?> <?=pl_h((string)$package['para_birimi'])?></strong>
<small>Öğrenci <?=pl_limit((int)$package['ogrenci_limiti'])?> · Öğretmen <?=pl_limit((int)$package['ogretmen_limiti'])?> · Veli <?=pl_limit((int)$package['veli_limiti'])?> · AI <?=pl_limit((int)$package['ai_aylik_kota'])?>/ay</small>
</div>
<span class="role-pill <?=((int)$package['aktif']===1?'ok':'')?>"><?=((int)$package['aktif']===1?'Aktif':'Pasif')?></span>
<a class="role-pill" href="paketler.php?paket_id=<?=(int)$package['id']?>">Düzenle</a>
<form method="post">
<input type="hidden" name="csrf" value="<?=pl_h(csrf_token())?>">
<input type="hidden" name="action" value="package_toggle">
<input type="hidden" name="paket_id" value="<?=(int)$package['id']?>">
<input type="hidden" name="aktif" value="<?=((int)$package['aktif']===1?0:1)?>">
<button class="role-pill" type="submit"><?=((int)$package['aktif']===1?'Pasife al':'Aktifleştir')?></button>
</form>
</div>
<?php endforeach;?>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">KURUM LİSANSI</span><h2><?=$editLicense?'Lisansı Güncelle':'Paket Ata'?></h2></div><?php if($editLicense):?><a class="role-pill" href="paketler.php">Yeni atama</a><?php endif;?></div>
<form class="role-form" method="post">
<input type="hidden" name="csrf" value="<?=pl_h(csrf_token())?>">
<input type="hidden" name="action" value="license_save">
<label>Kurum</label>
<select class="role-input" name="kurum_id" required>
<option value="">Kurum seç</option>
<?php foreach($institutions as $institution): $selected=(int)($editLicense['kurum_id']??0)===(int)$institution['id'];?>
<option value="<?=(int)$institution['id']?>" <?=$selected?'selected':''?>><?=pl_h((string)$institution['ad'])?></option>
<?php endforeach;?>
</select>
<label>Paket</label>
<select class="role-input" name="paket_id" required>
<option value="">Paket seç</option>
<?php foreach($activePackages as $package): $selected=(int)($editLicense['paket_id']??0)===(int)$package['id'];?>
<option value="<?=(int)$package['id']?>" <?=$selected?'selected':''?>><?=pl_h((string)$package['ad'])?></option>
<?php endforeach;?>
</select>
<label>Durum</label>
<select class="role-input" name="durum">
<?php foreach(['aktif'=>'Aktif','deneme'=>'Deneme','askida'=>'Askıda','iptal'=>'İptal'] as $value=>$label):?>
<option value="<?=$value?>" <?=((string)($editLicense['durum']??'aktif')===$value?'selected':'')?>><?=$label?></option>
<?php endforeach;?>
</select>
<label>Başlangıç tarihi</label>
<input class="role-input" type="date" name="baslangic_tarihi" required value="<?=pl_h((string)($editLicense['baslangic_tarihi']??date('Y-m-d')))?>">
<label>Bitiş tarihi <small>Boş = süresiz</small></label>
<input class="role-input" type="date" name="bitis_tarihi" value="<?=pl_h((string)($editLicense['bitis_tarihi']??''))?>">
<label>Satış / sözleşme notu</label>
<textarea class="role-input" name="notlar" rows="3" maxlength="2000"><?=pl_h((string)($editLicense['notlar']??''))?></textarea>
<button class="role-button" type="submit">Lisansı Kaydet</button>
</form>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">LİSANSLAR</span><h2>Kurum Lisans Durumu</h2></div><span class="role-pill"><?=count($licenses)?></span></div>
<div class="role-list">
<?php if(!$licenses):?><div class="role-empty"><span>🏫</span>Henüz bir kuruma lisans atanmadı. Lisansı olmayan kurumlar geriye uyumluluk için sınırsız çalışmaya devam eder.</div><?php endif;?>
<?php foreach($licenses as $license):
$status=(string)$license['etkin_durum'];
?>
<a class="role-row" href="paketler.php?kurum_id=<?=(int)$license['kurum_id']?>">
<span>🏫</span>
<div>
<strong><?=pl_h((string)$license['kurum_adi'])?> · <?=pl_h((string)$license['paket_adi'])?></strong>
<small>
Öğrenci <?=(int)$license['ogrenci_sayisi']?> / <?=pl_limit((int)$license['ogrenci_limiti'])?> ·
Öğretmen <?=(int)$license['ogretmen_sayisi']?> / <?=pl_limit((int)$license['ogretmen_limiti'])?> ·
Veli <?=(int)$license['veli_sayisi']?> / <?=pl_limit((int)$license['veli_limiti'])?> ·
<?=pl_h((string)$license['baslangic_tarihi'])?> → <?=pl_h((string)($license['bitis_tarihi']?:'Süresiz'))?>
</small>
</div>
<span class="role-pill <?=in_array($status,['aktif','deneme'],true)?'ok':''?>"><?=pl_h(pl_status_label($status))?></span>
</a>
<?php endforeach;?>
</div>
</section>

<div class="role-note"><span>ℹ️</span><p>Lisansı olmayan kurumlar etkilenmez. Aktif/deneme lisansı bulunan kurumlarda kullanıcı limitleri yeni ekleme, başka kuruma taşıma ve yeniden aktifleştirme sırasında uygulanır. AI kotası bu sürümde ticari paket tanımı olarak saklanır; AdımBot kullanım sayacı ayrı entegrasyon adımında bağlanacaktır.</p></div>
<?php endif;?>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a href="kurumlar.php"><span>🏫</span>Kurumlar</a>
<a class="active" href="paketler.php"><span>💼</span>Paketler</a>
<a href="guncelleme.php"><span>↻</span>Güncelle</a>
</nav>
</div>
</body>
</html>
