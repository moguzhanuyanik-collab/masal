<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/kurumlar_modulu.php';
require __DIR__.'/src/deneme_satis.php';

$user=require_role('super_admin');
$pdo=db();
header('Cache-Control: no-store, max-age=0');

function sth(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
function st_status_label(string $status): string {
    return match($status){
        'deneme'=>'Deneme',
        'suresi_doldu'=>'Süresi Doldu',
        'donustu'=>'Ücretliye Dönüştü',
        'kaybedildi'=>'Kaybedildi',
        default=>$status,
    };
}

$error='';
$success=trim((string)($_GET['ok']??''));

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar dene.');
        $action=(string)($_POST['action']??'');

        if($action==='trial_create'){
            $salesId=st_create_trial($pdo,$user,$_POST);
            header('Location: demo-satis.php?satis_id='.$salesId.'&ok='.rawurlencode('Demo kurumu ve deneme lisansı oluşturuldu.'));
            exit;
        }
        if($action==='note_add'){
            $salesId=max(0,(int)($_POST['satis_id']??0));
            st_add_note($pdo,$user,$salesId,(string)($_POST['satis_notu']??''));
            header('Location: demo-satis.php?satis_id='.$salesId.'&ok='.rawurlencode('Satış notu eklendi.'));
            exit;
        }
        if($action==='convert'){
            $salesId=max(0,(int)($_POST['satis_id']??0));
            st_convert(
                $pdo,$user,$salesId,max(0,(int)($_POST['paket_id']??0)),
                (string)($_POST['lisans_bitis_tarihi']??''),
                (string)($_POST['donusum_notu']??'')
            );
            header('Location: demo-satis.php?satis_id='.$salesId.'&ok='.rawurlencode('Deneme kurumu ücretli pakete dönüştürüldü.'));
            exit;
        }
        if($action==='lost'){
            $salesId=max(0,(int)($_POST['satis_id']??0));
            st_mark_lost($pdo,$user,$salesId,(string)($_POST['kayip_nedeni']??''));
            header('Location: demo-satis.php?satis_id='.$salesId.'&ok='.rawurlencode('Satış kaybedildi olarak işaretlendi; deneme lisansı kapatıldı.'));
            exit;
        }
        throw new RuntimeException('Geçersiz işlem.');
    }catch(PDOException $e){
        $mysqlError=(int)($e->errorInfo[1]??0);
        $error=$mysqlError===1062?'Kurum kodu veya demo satış kaydı zaten kullanılıyor.':'Veritabanı işlemi tamamlanamadı.';
    }catch(Throwable $e){
        $error=$e->getMessage();
    }
}

$ready=st_tables_ready($pdo);
$packages=kl_tables_ready($pdo)?kl_package_rows($pdo,false):[];
$summary=$ready?st_summary($pdo):[];
$warnings=$ready?st_trial_warning_rows($pdo,7):[];
$filters=[
    'durum'=>(string)($_GET['durum']??''),
    'kaynak'=>(string)($_GET['kaynak']??''),
];
$sales=$ready?st_sales_rows($pdo,$filters):[];

$selectedId=max(0,(int)($_GET['satis_id']??0));
$selected=$selectedId>0&&$ready?st_sales_row($pdo,$selectedId):null;
$notes=$selected?st_notes($pdo,$selectedId):[];
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Demo & Satış — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="kurum.css?v=1.0.41">
<link rel="stylesheet" href="demo-satis.css?v=1.2.45">
</head>
<body class="role-page sa-subpage"><?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Demo & Satış</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="paketler.php" aria-label="Paketler"><svg><use href="#sa-database"/></svg></a>
<a class="sa-page-action" href="ticari-finans.php" aria-label="Ticari Finans"><svg><use href="#sa-card"/></svg></a>
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>

<main class="role-content">
<section class="role-hero">
<span class="eyeline">SATIŞ DÖNÜŞÜMÜ</span>
<h1>Demo & Deneme Kurumları</h1>
<p>Demo kurumunu deneme lisansıyla tek işlemde oluştur, bitiş tarihini takip et, satış notlarını koru ve ücretli pakete dönüştür.</p>
<span class="role-hero-art">🚀</span>
</section>

<?php if(!$ready):?><div class="role-note"><span>⚠️</span><p>Demo satış tabloları henüz hazır değil. 1.2.45 migrationı kurulduğunda bu ekran otomatik açılır.</p></div><?php endif;?>
<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=sth($error)?></p></div><?php endif;?>
<?php if($success!==''):?><div class="role-note"><span>✅</span><p><?=sth($success)?></p></div><?php endif;?>

<?php if($ready):?>
<section class="st-summary">
<div><strong><?=(int)($summary['toplam']??0)?></strong><span>Başlatılan Demo</span></div>
<div><strong><?=(int)($summary['deneme']??0)?></strong><span>Aktif Deneme</span></div>
<div><strong><?=(int)($summary['suresi_doldu']??0)?></strong><span>Süresi Doldu</span></div>
<div><strong><?=(int)($summary['donustu']??0)?></strong><span>Ücretliye Dönüştü</span></div>
<div><strong><?=(int)($summary['kaybedildi']??0)?></strong><span>Kaybedildi</span></div>
<div><strong><?=sth(number_format((float)($summary['genel_donusum_orani']??0),1,',','.'))?>%</strong><span>Genel Dönüşüm</span></div>
<div><strong><?=sth(number_format((float)($summary['karar_verilen_donusum_orani']??0),1,',','.'))?>%</strong><span>Karar Verilenlerde</span></div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">7 GÜNLÜK RADAR</span><h2>Deneme Bitiş Uyarıları</h2></div><span class="role-pill"><?=count($warnings)?></span></div>
<div class="role-list">
<?php if(!$warnings):?><div class="role-empty"><span>✅</span>Önümüzdeki 7 gün içinde bitecek veya süresi geçmiş açık deneme yok.</div><?php endif;?>
<?php foreach($warnings as $warning): $days=(int)$warning['kalan_gun'];?>
<a class="role-row" href="demo-satis.php?satis_id=<?=(int)$warning['id']?>">
<span><?=$days<0?'🚨':($days===0?'⏰':'⏳')?></span>
<div><strong><?=sth((string)$warning['kurum_adi'])?> · <?=sth((string)$warning['paket_adi'])?></strong>
<small><?=sth((string)$warning['deneme_bitis_tarihi'])?> · <?=$days<0?abs($days).' gün önce bitti':($days===0?'Bugün bitiyor':$days.' gün kaldı')?><?php if(!empty($warning['son_temas_tarihi'])):?> · Son temas <?=sth((string)$warning['son_temas_tarihi'])?><?php endif;?></small></div>
<span class="role-pill <?=$days>=0?'ok':''?>"><?=$days<0?'Süresi Doldu':'Takip Et'?></span>
</a>
<?php endforeach;?>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">YENİ DEMO</span><h2>Deneme Kurumu Oluştur</h2></div></div>
<form class="role-form" method="post">
<input type="hidden" name="csrf" value="<?=sth(csrf_token())?>">
<input type="hidden" name="action" value="trial_create">

<label>Kurum adı</label>
<input class="role-input" name="ad" maxlength="190" required placeholder="Örn. ABC Koleji Demo">
<label>Kurum kodu <small>Boş bırakılırsa addan üretilir.</small></label>
<input class="role-input" name="kod" maxlength="80" placeholder="abc-koleji-demo">
<label>Kurum türü</label>
<select class="role-input" name="tur"><option value="okul">Okul</option><option value="kurs">Kurs</option><option value="platform">Platform</option></select>
<input type="hidden" name="icerik_kaynagi" value="kurum">

<label>Kurum e-posta</label>
<input class="role-input" type="email" name="email" placeholder="kurum@example.com">
<label>Telefon</label>
<input class="role-input" name="telefon" maxlength="30">
<label>Adres</label>
<textarea class="role-input" name="adres" rows="2" maxlength="3000"></textarea>

<label>Deneme paketi</label>
<select class="role-input" name="paket_id" required>
<option value="">Paket seç</option>
<?php foreach($packages as $package):?>
<option value="<?=(int)$package['id']?>"><?=sth((string)$package['ad'])?> · <?=sth((string)$package['aylik_fiyat'])?> <?=sth((string)$package['para_birimi'])?></option>
<?php endforeach;?>
</select>

<label>Deneme süresi <small>1–90 gün</small></label>
<input class="role-input" type="number" min="1" max="90" name="deneme_gun" value="14" required>
<label>Satış kaynağı</label>
<select class="role-input" name="kaynak"><?php foreach(st_sources() as $key=>$label):?><option value="<?=$key?>"><?=sth($label)?></option><?php endforeach;?></select>
<label>İlk satış notu <small>İsteğe bağlı</small></label>
<textarea class="role-input" name="satis_notu" rows="3" maxlength="2000" placeholder="İlk görüşme, ihtiyaçlar, karar verici veya sonraki adım..."></textarea>
<button class="role-button" type="submit">Demo Kurumu ve Deneme Lisansını Oluştur</button>
</form>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">SATIŞ BORUSU</span><h2>Demo Fırsatları</h2></div><span class="role-pill"><?=count($sales)?></span></div>
<form class="st-filter" method="get">
<select name="durum">
<option value="">Tüm durumlar</option>
<option value="deneme" <?=$filters['durum']==='deneme'?'selected':''?>>Aktif + Açık Denemeler</option>
<option value="suresi_doldu" <?=$filters['durum']==='suresi_doldu'?'selected':''?>>Süresi Dolanlar</option>
<option value="donustu" <?=$filters['durum']==='donustu'?'selected':''?>>Ücretliye Dönüşenler</option>
<option value="kaybedildi" <?=$filters['durum']==='kaybedildi'?'selected':''?>>Kaybedilenler</option>
</select>
<select name="kaynak"><option value="">Tüm kaynaklar</option><?php foreach(st_sources() as $key=>$label):?><option value="<?=$key?>" <?=$filters['kaynak']===$key?'selected':''?>><?=sth($label)?></option><?php endforeach;?></select>
<button type="submit">Filtrele</button><a href="demo-satis.php">Temizle</a>
</form>

<div class="role-list st-sales-list">
<?php if(!$sales):?><div class="role-empty"><span>🚀</span>Filtreye uyan demo satış kaydı yok.</div><?php endif;?>
<?php foreach($sales as $row): $effective=(string)$row['etkin_durum']; $days=(int)$row['kalan_gun'];?>
<a class="role-row <?=$selectedId===(int)$row['id']?'st-selected':''?>" href="demo-satis.php?satis_id=<?=(int)$row['id']?>">
<span><?=$effective==='donustu'?'✅':($effective==='kaybedildi'?'❌':($effective==='suresi_doldu'?'🚨':'🚀'))?></span>
<div>
<strong><?=sth((string)$row['kurum_adi'])?> · <?=sth((string)$row['deneme_paket_adi'])?></strong>
<small><?=sth((string)(st_sources()[(string)$row['kaynak']]??$row['kaynak']))?> · <?=sth((string)$row['deneme_baslangic_tarihi'])?> → <?=sth((string)$row['deneme_bitis_tarihi'])?> · <?=(int)$row['not_sayisi']?> not
<?php if($effective==='deneme'):?> · <?=$days===0?'Bugün bitiyor':$days.' gün kaldı'?><?php elseif($effective==='suresi_doldu'):?> · <?=abs($days)?> gün geçti<?php endif;?></small>
</div>
<span class="role-pill <?=$effective==='donustu'||$effective==='deneme'?'ok':''?>"><?=sth(st_status_label($effective))?></span>
</a>
<?php endforeach;?>
</div>
</section>

<?php if($selected): $effective=(string)$selected['etkin_durum'];?>
<section class="role-section">
<div class="role-section-head">
<div><span class="eyeline">FIRSAT #<?=(int)$selected['id']?></span><h2><?=sth((string)$selected['kurum_adi'])?></h2></div>
<span class="role-pill <?=$effective==='donustu'||$effective==='deneme'?'ok':''?>"><?=sth(st_status_label($effective))?></span>
</div>

<div class="st-detail-grid">
<div><span>Kurum Kodu</span><strong><?=sth((string)$selected['kurum_kodu'])?></strong></div>
<div><span>Deneme Paketi</span><strong><?=sth((string)$selected['deneme_paket_adi'])?></strong></div>
<div><span>Deneme</span><strong><?=sth((string)$selected['deneme_baslangic_tarihi'])?> → <?=sth((string)$selected['deneme_bitis_tarihi'])?></strong></div>
<div><span>Kaynak</span><strong><?=sth((string)(st_sources()[(string)$selected['kaynak']]??$selected['kaynak']))?></strong></div>
<div><span>Güncel Lisans</span><strong><?=sth((string)$selected['lisans_durum'])?><?php if(!empty($selected['lisans_bitis'])):?> · <?=sth((string)$selected['lisans_bitis'])?><?php endif;?></strong></div>
<div><span>Son Temas</span><strong><?=sth((string)($selected['son_temas_tarihi']??'—'))?></strong></div>
</div>

<div class="st-actions">
<a class="role-pill" href="kurumlar.php?sekme=kurumlar&kurum_id=<?=(int)$selected['kurum_id']?>">Kurumu Aç</a>
<a class="role-pill" href="paketler.php?kurum_id=<?=(int)$selected['kurum_id']?>">Lisansı Aç</a>
<?php if($effective==='donustu'):?><a class="role-pill" href="ticari-finans.php">Ticari Finans</a><?php endif;?>
</div>

<?php if((string)$selected['durum']==='deneme'):?>
<div class="st-two-col">
<form class="role-form st-action-card" method="post">
<input type="hidden" name="csrf" value="<?=sth(csrf_token())?>">
<input type="hidden" name="action" value="convert">
<input type="hidden" name="satis_id" value="<?=(int)$selected['id']?>">
<h3>Ücretliye Dönüştür</h3>
<label>Ücretli paket</label>
<select class="role-input" name="paket_id" required><option value="">Paket seç</option><?php foreach($packages as $package):?><option value="<?=(int)$package['id']?>"><?=sth((string)$package['ad'])?> · <?=sth((string)$package['aylik_fiyat'])?> <?=sth((string)$package['para_birimi'])?></option><?php endforeach;?></select>
<label>Lisans bitiş tarihi <small>Boş = süresiz</small></label>
<input class="role-input" type="date" name="lisans_bitis_tarihi">
<label>Dönüşüm notu <small>İsteğe bağlı</small></label>
<textarea class="role-input" name="donusum_notu" rows="3" maxlength="2000"></textarea>
<button class="role-button" type="submit">Ücretli Pakete Dönüştür</button>
<small>Dönüşüm mevcut deneme lisansını aktif lisansa çevirir. Sözleşme ve tahsilat kaydı Ticari Finans'ta ayrıca oluşturulur.</small>
</form>

<form class="role-form st-action-card st-lost-card" method="post">
<input type="hidden" name="csrf" value="<?=sth(csrf_token())?>">
<input type="hidden" name="action" value="lost">
<input type="hidden" name="satis_id" value="<?=(int)$selected['id']?>">
<h3>Fırsatı Kapat</h3>
<label>Kayıp nedeni</label>
<textarea class="role-input" name="kayip_nedeni" rows="4" minlength="3" maxlength="500" required placeholder="Fiyat, zamanlama, rakip, karar ertelendi..."></textarea>
<button class="role-button" type="submit">Kaybedildi Olarak İşaretle</button>
<small>Bu işlem açık deneme lisansını da iptal eder; satış ve not geçmişini silmez.</small>
</form>
</div>
<?php endif;?>

<form class="role-form st-note-form" method="post">
<input type="hidden" name="csrf" value="<?=sth(csrf_token())?>">
<input type="hidden" name="action" value="note_add">
<input type="hidden" name="satis_id" value="<?=(int)$selected['id']?>">
<label>Yeni satış notu</label>
<textarea class="role-input" name="satis_notu" rows="3" minlength="2" maxlength="2000" required placeholder="Görüşme sonucu, sonraki arama, karar verici veya ihtiyaç..."></textarea>
<button class="role-button" type="submit">Not Ekle</button>
</form>

<div class="st-notes">
<h3>Satış Geçmişi</h3>
<?php if(!$notes):?><div class="role-empty">Henüz satış notu yok.</div><?php endif;?>
<?php foreach($notes as $note):?>
<article class="st-note <?=$note['tur']==='durum'?'st-system-note':''?>">
<div><strong><?=sth((string)$note['kullanici_adi'])?></strong><span><?=sth(date('d.m.Y H:i',strtotime((string)$note['olusturulma_tarihi'])))?></span></div>
<p><?=nl2br(sth((string)$note['not_metni']))?></p>
</article>
<?php endforeach;?>
</div>
</section>
<?php endif;?>

<div class="role-note"><span>ℹ️</span><p>Dönüşüm oranları operasyonel satış metriğidir. “Genel Dönüşüm” tüm başlatılan denemeleri; “Karar Verilenlerde” yalnız ücretliye dönüşen + kaybedilen fırsatları baz alır.</p></div>
<?php endif;?>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a href="paketler.php"><span>💼</span>Paketler</a>
<a class="active" href="demo-satis.php"><span>🚀</span>Demo</a>
<a href="ticari-finans.php"><span>₺</span>Finans</a>
</nav>
</div>
</body>
</html>
