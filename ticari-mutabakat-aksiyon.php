<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/ticari_finans.php';
require __DIR__.'/src/ticari_belgeler.php';
require __DIR__.'/src/ticari_mutabakat.php';
require __DIR__.'/src/ticari_mutabakat_aksiyon.php';

$user=require_role('super_admin');
$pdo=db();
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');

function mah(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
function ma_type_label(string $type): string {
    return match($type){
        'butunluk'=>'Veri Bütünlüğü',
        'operasyon'=>'Operasyon Açığı',
        default=>$type,
    };
}
function ma_type_class(string $type): string {
    return $type==='butunluk'?'danger':'warning';
}
function ma_stage_class(string $stage): string {
    return match($stage){
        'incelemede'=>'review',
        'beklemede'=>'waiting',
        'kapali'=>'ok',
        default=>'',
    };
}

$error='';
$success=trim((string)($_GET['ok']??''));
$ready=ma_tables_ready($pdo);

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar dene.');
        if(!$ready) throw new RuntimeException('Mutabakat aksiyon migrationı henüz kurulmamış.');

        $action=(string)($_POST['action']??'');

        if($action==='sync'){
            $sync=ma_sync_cases($pdo,$user);
            header('Location: ticari-mutabakat-aksiyon.php?ok='.rawurlencode(
                'Mutabakat vakaları senkronize edildi. Yeni: '.(int)$sync['created']
                .' · Yeniden açılan: '.(int)$sync['reopened']
                .' · Otomatik kapanan: '.(int)$sync['closed']
                .' · Güncellenen: '.(int)$sync['refreshed']
            ));
            exit;
        }

        ma_sync_cases($pdo,$user);
        $caseId=max(0,(int)($_POST['vaka_id']??0));

        if($action==='stage'){
            ma_set_stage($pdo,$user,$caseId,(string)($_POST['durum']??''));
            header('Location: ticari-mutabakat-aksiyon.php?vaka_id='.$caseId.'&ok='.rawurlencode('Vaka aşaması güncellendi.'));
            exit;
        }

        if($action==='note'){
            ma_add_note(
                $pdo,$user,$caseId,
                (string)($_POST['not_metni']??''),
                (string)($_POST['sonraki_aksiyon_tarihi']??''),
                (string)($_POST['durum']??'')
            );
            header('Location: ticari-mutabakat-aksiyon.php?vaka_id='.$caseId.'&ok='.rawurlencode('Takip notu ve sonraki aksiyon kaydedildi.'));
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
    'sorun_turu'=>(string)($_GET['sorun_turu']??''),
    'kurum_id'=>max(0,(int)($_GET['kurum_id']??0)),
    'sozlesme_id'=>max(0,(int)($_GET['sozlesme_id']??0)),
    'q'=>(string)($_GET['q']??''),
];

$summary=$ready?ma_summary($pdo):[];
$rows=$ready?ma_queue_rows($pdo,$filters,700):[];
$selectedId=max(0,(int)($_GET['vaka_id']??0));
$selected=$selectedId>0&&$ready?ma_case_row($pdo,$selectedId):null;
$history=$selected?ma_history_rows($pdo,$selectedId):[];
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Mutabakat Aksiyon Merkezi — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="ticari-mutabakat-aksiyon.css?v=1.2.59">
</head>
<body class="role-page sa-subpage">
<?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Mutabakat Aksiyon Merkezi</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="ticari-mutabakat.php" aria-label="Mutabakat Kontrol"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="ticari-belgeler.php" aria-label="Ticari Belgeler"><svg><use href="#sa-database"/></svg></a>
<a class="sa-page-action" href="ticari-finans.php" aria-label="Ticari Finans"><svg><use href="#sa-database"/></svg></a>
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>

<main class="role-content">
<section class="role-hero">
<span class="eyeline">TİCARİ AKSİYON</span>
<h1>Mutabakat Vaka & İstisna Merkezi</h1>
<p>Operasyon açıklarını ve veri bütünlüğü anomalilerini tekil vakaya dönüştür; sorumlu, aşama, takip notu ve sonraki aksiyonla yönet. Kaynak sorun çözülünce vaka otomatik kapansın.</p>
<span class="role-hero-art">🧭</span>
</section>

<?php if(!$ready):?><div class="role-note"><span>⚠️</span><p>1.2.59 mutabakat aksiyon migrationı henüz hazır değil. 086 migration kurulduğunda bu merkez açılır.</p></div><?php endif;?>
<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=mah($error)?></p></div><?php endif;?>
<?php if($success!==''):?><div class="role-note"><span>✅</span><p><?=mah($success)?></p></div><?php endif;?>

<?php if($ready):?>
<section class="ma-summary">
<a href="ticari-mutabakat-aksiyon.php?durum=open"><strong><?=(int)($summary['open']??0)?></strong><span>Açık vaka</span></a>
<a href="ticari-mutabakat-aksiyon.php?durum=open&amp;sorun_turu=butunluk"><strong><?=(int)($summary['butunluk']??0)?></strong><span>Veri bütünlüğü</span></a>
<a href="ticari-mutabakat-aksiyon.php?durum=open&amp;sorun_turu=operasyon"><strong><?=(int)($summary['operasyon']??0)?></strong><span>Operasyon açığı</span></a>
<a href="ticari-mutabakat-aksiyon.php?durum=incelemede"><strong><?=(int)($summary['incelemede']??0)?></strong><span>İncelemede</span></a>
<a href="ticari-mutabakat-aksiyon.php?durum=beklemede"><strong><?=(int)($summary['beklemede']??0)?></strong><span>Dış aksiyon bekliyor</span></a>
<a href="ticari-mutabakat-aksiyon.php?durum=open"><strong><?=(int)($summary['aksiyon_bekleyen']??0)?></strong><span>Aksiyon zamanı geldi</span></a>
<a href="ticari-mutabakat-aksiyon.php?durum=kapali"><strong><?=(int)($summary['kapali']??0)?></strong><span>Kaynağı çözülmüş</span></a>
</section>

<section class="role-section">
<div class="role-section-head">
<div><span class="eyeline">SENKRONİZASYON</span><h2>Teşhisten Operasyon Vakasına</h2></div>
<a class="role-pill" href="ticari-mutabakat.php">Salt-okunur Mutabakat →</a>
</div>
<div class="ma-sync">
<form method="post">
<input type="hidden" name="csrf" value="<?=mah(csrf_token())?>">
<input type="hidden" name="action" value="sync">
<button class="role-button" type="submit">Mutabakat Vakalarını Senkronize Et</button>
</form>
</div>
<div class="role-note"><span>ℹ️</span><p>Senkronizasyon finansal kayıtları düzeltmez. 1.2.58 teşhis sonuçlarını vaka tablosuyla uzlaştırır. Sorun kaynaktan düzeltildiyse açık vaka otomatik kapanır; aynı kaynak sorunu tekrar oluşursa aynı vaka yeniden açılır.</p></div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">AKSİYON KUYRUĞU</span><h2>Mutabakat Vakaları</h2></div><span class="role-pill"><?=count($rows)?></span></div>
<form class="ma-filter" method="get">
<input type="search" name="q" value="<?=mah((string)$filters['q'])?>" placeholder="Kurum, sözleşme veya açıklama">
<select name="durum">
<option value="open" <?=$filters['durum']==='open'?'selected':''?>>Tüm açık vakalar</option>
<?php foreach(ma_stage_labels() as $value=>$label):?><option value="<?=$value?>" <?=$filters['durum']===$value?'selected':''?>><?=mah($label)?></option><?php endforeach;?>
</select>
<select name="sorun_turu">
<option value="">Tüm sorun türleri</option>
<option value="butunluk" <?=$filters['sorun_turu']==='butunluk'?'selected':''?>>Veri bütünlüğü</option>
<option value="operasyon" <?=$filters['sorun_turu']==='operasyon'?'selected':''?>>Operasyon açığı</option>
</select>
<?php if($filters['kurum_id']>0):?><input type="hidden" name="kurum_id" value="<?=(int)$filters['kurum_id']?>"><?php endif;?>
<?php if($filters['sozlesme_id']>0):?><input type="hidden" name="sozlesme_id" value="<?=(int)$filters['sozlesme_id']?>"><?php endif;?>
<button type="submit">Filtrele</button>
<a href="ticari-mutabakat-aksiyon.php">Temizle</a>
</form>

<div class="role-list ma-list">
<?php if(!$rows):?><div class="role-empty"><span>✅</span>Filtreye uyan mutabakat vakası yok.</div><?php endif;?>
<?php foreach($rows as $row):
$type=(string)$row['sorun_turu'];
$stage=(string)$row['durum'];
?>
<a class="role-row ma-row <?=$selectedId===(int)$row['id']?'selected':''?>" href="ticari-mutabakat-aksiyon.php?vaka_id=<?=(int)$row['id']?>">
<span><?=$type==='butunluk'?'🚨':'🧩'?></span>
<div>
<strong><?=mah((string)$row['kurum_adi'])?> · <?=mah((string)$row['sozlesme_no'])?></strong>
<small><?=mah(ma_type_label($type))?> · <?=mah((string)$row['kaynak_kodu'])?> · <?=mah(ma_stage_labels()[$stage]??$stage)?>
<?php if(!empty($row['sonraki_aksiyon_tarihi'])):?> · Aksiyon <?=mah((string)$row['sonraki_aksiyon_tarihi'])?><?php endif;?>
 · <?=(int)$row['gecmis_sayisi']?> geçmiş
</small>
</div>
<div class="ma-row-tags">
<span class="role-pill <?=ma_type_class($type)?>"><?=mah(ma_type_label($type))?></span>
<span class="role-pill <?=ma_stage_class($stage)?>"><?=mah(ma_stage_labels()[$stage]??$stage)?></span>
</div>
</a>
<?php endforeach;?>
</div>
</section>

<?php if($selected):
$stage=(string)$selected['durum'];
$type=(string)$selected['sorun_turu'];
$isOpen=in_array($stage,ma_open_stages(),true);
?>
<section class="role-section">
<div class="role-section-head">
<div><span class="eyeline">VAKA #<?=(int)$selected['id']?></span><h2><?=mah((string)$selected['kurum_adi'])?> · <?=mah((string)$selected['sozlesme_no'])?></h2></div>
<div class="ma-head-tags">
<span class="role-pill <?=ma_type_class($type)?>"><?=mah(ma_type_label($type))?></span>
<span class="role-pill <?=ma_stage_class($stage)?>"><?=mah(ma_stage_labels()[$stage]??$stage)?></span>
</div>
</div>

<div class="ma-detail-grid">
<div><span>Kaynak</span><strong><?=mah((string)$selected['kaynak_turu'])?></strong></div>
<div><span>Kaynak Kodu</span><strong><?=mah((string)$selected['kaynak_kodu'])?></strong></div>
<div><span>Para Birimi</span><strong><?=mah((string)($selected['para_birimi']?:'—'))?></strong></div>
<div><span>Sorumlu</span><strong><?=mah((string)$selected['sorumlu_adi'])?></strong></div>
<div><span>Son Tespit</span><strong><?=mah((string)($selected['son_tespit_tarihi']?:'—'))?></strong></div>
<div><span>Sonraki Aksiyon</span><strong><?=mah((string)($selected['sonraki_aksiyon_tarihi']?:'—'))?></strong></div>
</div>

<div class="ma-diagnosis"><strong>Son kaynak teşhisi</strong><p><?=nl2br(mah((string)($selected['son_aciklama']?:'—')))?></p></div>

<div class="ma-links">
<a class="role-pill" href="ticari-mutabakat.php<?=((int)$selected['kurum_id']>0?'?kurum_id='.(int)$selected['kurum_id']:'')?>">Mutabakat Kontrolü →</a>
<?php if((int)$selected['kurum_id']>0):?><a class="role-pill" href="kurum-ticari-360.php?kurum_id=<?=(int)$selected['kurum_id']?>">Kurum 360 →</a><?php endif;?>
<?php if((int)$selected['sozlesme_id']>0):?><a class="role-pill" href="ticari-finans.php?sozlesme_id=<?=(int)$selected['sozlesme_id']?>">Sözleşme →</a><?php endif;?>
<?php if((string)$selected['kaynak_turu']==='belge_kimlik' && (int)$selected['kaynak_id']>0):?><a class="role-pill" href="ticari-belgeler.php?belge_id=<?=(int)$selected['kaynak_id']?>">Belge →</a><?php endif;?>
<?php if((string)$selected['kaynak_turu']==='esleme_kimlik' && (int)$selected['kurum_id']>0):?><a class="role-pill" href="ticari-belgeler.php?kurum_id=<?=(int)$selected['kurum_id']?>">Eşlemeler →</a><?php endif;?>
</div>

<?php if($isOpen):?>
<div class="ma-stage-actions">
<?php foreach(['acik'=>'Açık','incelemede'=>'İncelemede','beklemede'=>'Dış Aksiyon Bekleniyor'] as $value=>$label):?>
<form method="post">
<input type="hidden" name="csrf" value="<?=mah(csrf_token())?>">
<input type="hidden" name="action" value="stage">
<input type="hidden" name="vaka_id" value="<?=(int)$selected['id']?>">
<input type="hidden" name="durum" value="<?=$value?>">
<button class="role-pill <?=$stage===$value?'ok':''?>" type="submit"><?=mah($label)?></button>
</form>
<?php endforeach;?>
</div>

<form class="role-form ma-note-form" method="post">
<input type="hidden" name="csrf" value="<?=mah(csrf_token())?>">
<input type="hidden" name="action" value="note">
<input type="hidden" name="vaka_id" value="<?=(int)$selected['id']?>">
<h3>Takip Notu</h3>
<label>Aşama</label>
<select class="role-input" name="durum">
<?php foreach(['incelemede'=>'İncelemede','beklemede'=>'Dış Aksiyon Bekleniyor','acik'=>'Açık'] as $value=>$label):?>
<option value="<?=$value?>" <?=$stage===$value?'selected':''?>><?=mah($label)?></option>
<?php endforeach;?>
</select>
<label>Not</label>
<textarea class="role-input" name="not_metni" minlength="2" maxlength="2000" rows="4" required placeholder="Kontrol sonucu, yapılacak düzeltme, muhasebe dönüşü, belge/eşleme aksiyonu..."></textarea>
<label>Sonraki aksiyon tarihi <small>İsteğe bağlı</small></label>
<input class="role-input" type="date" name="sonraki_aksiyon_tarihi" min="<?=date('Y-m-d')?>">
<button class="role-button" type="submit">Takip Notunu Kaydet</button>
</form>
<?php else:?>
<div class="role-note"><span>✅</span><p>Kaynak teşhis artık bu sorunu üretmediği için vaka otomatik kapanmıştır. Geçmiş korunur. Aynı kaynak sorunu tekrar oluşursa senkronizasyonda bu vaka yeniden açılır.</p></div>
<?php endif;?>

<div class="ma-history">
<h3>Vaka Geçmişi</h3>
<?php if(!$history):?><div class="role-empty">Henüz vaka geçmişi yok.</div><?php endif;?>
<?php foreach($history as $item):?>
<article>
<div><strong><?=mah((string)$item['kullanici_adi'])?> · <?=mah((string)$item['tur'])?></strong><span><?=mah(date('d.m.Y H:i',strtotime((string)$item['olusturulma_tarihi'])))?></span></div>
<?php if((string)($item['kod']??'')!==''):?><small><?=mah((string)$item['kod'])?></small><?php endif;?>
<?php if((string)($item['not_metni']??'')!==''):?><p><?=nl2br(mah((string)$item['not_metni']))?></p><?php endif;?>
</article>
<?php endforeach;?>
</div>
</section>
<?php endif;?>

<div class="role-note"><span>🔒</span><p>Mutabakat Aksiyon Merkezi sözleşme, belge, tahsilat veya eşleme kayıtlarını otomatik düzeltmez. Manuel “kapat” işlemi yoktur. Sorun ilgili kaynak modülde kontrollü olarak düzeltildikten sonra senkronizasyon vakayı otomatik kapatır.</p></div>
<?php endif;?>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a href="ticari-dashboard.php"><span>📊</span>KPI</a>
<a href="ticari-mutabakat.php"><span>⚖️</span>Mutabakat</a>
<a class="active" href="ticari-mutabakat-aksiyon.php"><span>🧭</span>Aksiyon</a>
<a href="ticari-belgeler.php"><span>🧾</span>Belgeler</a>
<a href="ticari-finans.php"><span>₺</span>Finans</a>
</nav>
</div>
</body>
</html>
