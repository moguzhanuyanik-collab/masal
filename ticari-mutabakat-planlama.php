<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/ticari_finans.php';
require __DIR__.'/src/ticari_belgeler.php';
require __DIR__.'/src/ticari_mutabakat.php';
require __DIR__.'/src/ticari_mutabakat_aksiyon.php';
require __DIR__.'/src/ticari_mutabakat_saglik.php';
require __DIR__.'/src/ticari_mutabakat_planlama.php';

$user=require_role('super_admin');
$pdo=db();
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');

function maph(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
function map_type_label(string $type): string { return $type==='butunluk'?'Veri Bütünlüğü':'Operasyon Açığı'; }

$ready=map_tables_ready($pdo);
$error='';
$success=trim((string)($_GET['ok']??''));

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)){
            throw new RuntimeException('Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar dene.');
        }
        if(!$ready) throw new RuntimeException('Mutabakat aksiyon tabloları henüz hazır değil.');

        $action=(string)($_POST['action']??'');
        if($action!=='bulk_plan') throw new RuntimeException('Geçersiz işlem.');

        $result=map_bulk_plan(
            $pdo,
            $user,
            is_array($_POST['vaka_id']??null)?$_POST['vaka_id']:[],
            max(0,(int)($_POST['sorumlu_kullanici_id']??0)),
            (string)($_POST['sonraki_aksiyon_tarihi']??''),
            (string)($_POST['plan_notu']??'')
        );

        header('Location: ticari-mutabakat-planlama.php?ok='.rawurlencode(
            (int)$result['updated'].' vaka planlandı · '
            .(string)$result['owner_name'].' · '
            .(string)$result['next_action_date']
        ));
        exit;
    }catch(PDOException $e){
        $error='Veritabanı işlemi tamamlanamadı.';
    }catch(Throwable $e){
        $error=$e->getMessage();
    }
}

$filters=[
    'q'=>(string)($_GET['q']??''),
    'sorun_turu'=>(string)($_GET['sorun_turu']??''),
    'yas'=>(string)($_GET['yas']??''),
    'saglik'=>(string)($_GET['saglik']??''),
    'sorumlu_kullanici_id'=>(string)($_GET['sorumlu_kullanici_id']??''),
];

$summary=$ready?mhs_summary($pdo):[];
$rows=$ready?mhs_case_rows($pdo,$filters,500):[];
$admins=$ready?map_super_admin_rows($pdo):[];
$recent=$ready?map_recent_planning($pdo,30):[];
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Mutabakat Toplu Planlama — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="ticari-mutabakat-planlama.css?v=1.2.61">
</head>
<body class="role-page sa-subpage">
<?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Mutabakat Toplu Planlama</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="ticari-mutabakat-devir.php" aria-label="Sorumlu Devir"><svg><use href="#sa-users"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-is-kutusu.php" aria-label="Günlük İş Kutusu"><svg><use href="#sa-users"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-hatirlatma.php" aria-label="Aksiyon Hatırlatmaları"><svg><use href="#sa-bell"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-saglik.php" aria-label="Aksiyon Sağlığı"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-aksiyon.php" aria-label="Mutabakat Aksiyon"><svg><use href="#sa-alert"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat.php" aria-label="Mutabakat Kontrol"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-eskalasyon.php" aria-label="Operasyon Eskalasyonu"><svg><use href="#sa-alert"/></svg></a>
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>

<main class="role-content">
<section class="role-hero">
<span class="eyeline">OPERASYON PLANLAMA</span>
<h1>Mutabakat Toplu Aksiyon Planlama</h1>
<p>Sağlık ekranında görünür hale gelen sahipsiz, aksiyon tarihi olmayan veya gecikmiş açık vakaları seç; tek transaction içinde sorumlu ve sonraki aksiyon tarihini güvenli biçimde planla.</p>
<span class="role-hero-art">🗂️</span>
</section>

<div class="role-note"><span>ℹ️</span><p>Toplu planlama finansal kaydı değiştirmez ve vakayı çözülmüş saymaz. Atama tek başına “ilk müdahale” metriğini kapatmaz; gerçek müdahale Mutabakat Aksiyon Merkezi'ndeki takip notu veya aşama işlemiyle ölçülmeye devam eder.</p></div>

<?php if(!$ready):?><div class="role-note"><span>⚠️</span><p>1.2.59 mutabakat aksiyon tabloları hazır değil. 086 migration kurulduğunda toplu planlama açılır.</p></div><?php endif;?>
<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=maph($error)?></p></div><?php endif;?>
<?php if($success!==''):?><div class="role-note"><span>✅</span><p><?=maph($success)?></p></div><?php endif;?>

<?php if($ready):?>
<section class="map-summary">
<a href="ticari-mutabakat-planlama.php"><strong><?=(int)($summary['open']??0)?></strong><span>Açık vaka</span></a>
<a href="ticari-mutabakat-planlama.php?saglik=sahipsiz"><strong><?=(int)($summary['sahipsiz']??0)?></strong><span>Sahipsiz</span></a>
<a href="ticari-mutabakat-planlama.php?saglik=aksiyon_tarihi_yok"><strong><?=(int)($summary['aksiyon_tarihi_yok']??0)?></strong><span>Aksiyon tarihi yok</span></a>
<a href="ticari-mutabakat-planlama.php?saglik=aksiyon_gecikti"><strong><?=(int)($summary['aksiyon_gecikti']??0)?></strong><span>Aksiyon gecikti</span></a>
<a href="ticari-mutabakat-planlama.php?saglik=ilk_mudahale_yok"><strong><?=(int)($summary['ilk_mudahale_yok']??0)?></strong><span>İlk müdahale yok</span></a>
<a href="ticari-mutabakat-planlama.php?yas=8_plus"><strong><?=(int)($summary['yas_8_plus']??0)?></strong><span>8+ gün açık</span></a>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">FİLTRE</span><h2>Planlanacak Açık Vakaları Bul</h2></div><a class="role-pill" href="ticari-mutabakat-saglik.php">Sağlık Dashboardu →</a></div>
<form class="map-filter" method="get">
<input type="search" name="q" value="<?=maph((string)$filters['q'])?>" placeholder="Kurum, sözleşme veya teşhis">
<select name="sorun_turu">
<option value="">Tüm sorun türleri</option>
<option value="butunluk" <?=$filters['sorun_turu']==='butunluk'?'selected':''?>>Veri bütünlüğü</option>
<option value="operasyon" <?=$filters['sorun_turu']==='operasyon'?'selected':''?>>Operasyon açığı</option>
</select>
<select name="yas">
<option value="">Tüm yaşlar</option>
<option value="0_1" <?=$filters['yas']==='0_1'?'selected':''?>>0–1 gün</option>
<option value="2_3" <?=$filters['yas']==='2_3'?'selected':''?>>2–3 gün</option>
<option value="4_7" <?=$filters['yas']==='4_7'?'selected':''?>>4–7 gün</option>
<option value="8_plus" <?=$filters['yas']==='8_plus'?'selected':''?>>8+ gün</option>
</select>
<select name="saglik">
<option value="">Tüm sağlık durumları</option>
<option value="sahipsiz" <?=$filters['saglik']==='sahipsiz'?'selected':''?>>Sahipsiz</option>
<option value="aksiyon_tarihi_yok" <?=$filters['saglik']==='aksiyon_tarihi_yok'?'selected':''?>>Aksiyon tarihi yok</option>
<option value="aksiyon_gecikti" <?=$filters['saglik']==='aksiyon_gecikti'?'selected':''?>>Aksiyon gecikti</option>
<option value="aksiyon_bugun" <?=$filters['saglik']==='aksiyon_bugun'?'selected':''?>>Aksiyon bugün</option>
<option value="ilk_mudahale_yok" <?=$filters['saglik']==='ilk_mudahale_yok'?'selected':''?>>İlk müdahale yok</option>
<option value="beklemede" <?=$filters['saglik']==='beklemede'?'selected':''?>>Dış aksiyon bekliyor</option>
</select>
<button type="submit">Filtrele</button>
<a href="ticari-mutabakat-planlama.php">Temizle</a>
</form>
</section>

<form method="post" class="map-plan-form">
<input type="hidden" name="csrf" value="<?=maph(csrf_token())?>">
<input type="hidden" name="action" value="bulk_plan">

<section class="role-section map-plan-panel">
<div class="role-section-head"><div><span class="eyeline">TOPLU PLAN</span><h2>Sorumlu & Sonraki Aksiyon</h2></div><span class="role-pill">En fazla 100 vaka</span></div>
<div class="map-plan-grid">
<label>Sorumlu Süper Admin
<select class="role-input" name="sorumlu_kullanici_id" required>
<option value="">Sorumlu seç</option>
<?php foreach($admins as $admin):?>
<option value="<?=(int)$admin['id']?>"><?=maph((string)$admin['ad_soyad'])?><?php if((string)($admin['email']??'')!==''):?> · <?=maph((string)$admin['email'])?><?php endif;?></option>
<?php endforeach;?>
</select>
</label>
<label>Sonraki aksiyon tarihi
<input class="role-input" type="date" name="sonraki_aksiyon_tarihi" min="<?=date('Y-m-d')?>" required>
</label>
<label class="map-note">Plan notu <small>İsteğe bağlı · 600 karakter</small>
<input class="role-input" name="plan_notu" maxlength="600" placeholder="Toplu dağıtım, dönem kapanışı, belge kontrolü...">
</label>
</div>
<button class="role-button" type="submit">Seçili Vakaları Planla</button>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">SEÇİM</span><h2>Açık Mutabakat Vakaları</h2></div><span class="role-pill"><?=count($rows)?> görünür</span></div>
<div class="role-note"><span>🔒</span><p>Gönderim anında seçili tüm vakalar yeniden kilitlenir ve kaynak sorunlarının hâlâ açık olduğu doğrulanır. Tek vaka bile kapanmış veya kaynak sorunu çözülmüşse tüm toplu işlem rollback edilir.</p></div>
<div class="map-list">
<?php if(!$rows):?><div class="role-empty"><span>✅</span>Filtreye uyan açık vaka yok.</div><?php endif;?>
<?php foreach($rows as $row):?>
<label class="map-row">
<input type="checkbox" name="vaka_id[]" value="<?=(int)$row['id']?>">
<span class="map-kind"><?=((string)$row['sorun_turu']==='butunluk'?'🚨':'🧩')?></span>
<span class="map-main">
<strong><?=maph((string)$row['kurum_adi'])?> · <?=maph((string)$row['sozlesme_no'])?></strong>
<small><?=maph(map_type_label((string)$row['sorun_turu']))?> · <?=maph((string)$row['yas_etiketi'])?> açık · <?=maph((string)$row['durum'])?> · Sorumlu <?=maph((string)$row['sorumlu_adi'])?><?php if(!empty($row['sonraki_aksiyon_tarihi'])):?> · Aksiyon <?=maph((string)$row['sonraki_aksiyon_tarihi'])?><?php endif;?></small>
<em><?=maph((string)$row['son_aciklama'])?></em>
</span>
<a href="ticari-mutabakat-aksiyon.php?vaka_id=<?=(int)$row['id']?>" target="_blank" rel="noopener">Detay →</a>
</label>
<?php endforeach;?>
</div>
</section>
</form>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">AUDIT</span><h2>Son Toplu Planlama Hareketleri</h2></div><span class="role-pill"><?=count($recent)?></span></div>
<div class="map-history">
<?php if(!$recent):?><div class="role-empty">Henüz toplu planlama geçmişi yok.</div><?php endif;?>
<?php foreach($recent as $item):?>
<a href="ticari-mutabakat-aksiyon.php?vaka_id=<?=(int)$item['vaka_id']?>">
<div><strong><?=maph((string)$item['kurum_adi'])?> · <?=maph((string)$item['sozlesme_no'])?></strong><span><?=maph(date('d.m.Y H:i',strtotime((string)$item['olusturulma_tarihi'])))?></span></div>
<small><?=maph((string)$item['kullanici_adi'])?> · <?=maph((string)$item['not_metni'])?></small>
</a>
<?php endforeach;?>
</div>
</section>

<div class="role-note"><span>ℹ️</span><p>Toplu planlama yalnız sahiplik ve sonraki aksiyon tarihini değiştirir. Vaka aşaması, takip notu ve kaynak finans/belge/eşleme düzeltmeleri Mutabakat Aksiyon Merkezi üzerinden vaka bazında yapılır.</p></div>
<?php endif;?>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a href="ticari-dashboard.php"><span>📊</span>KPI</a>
<a href="ticari-mutabakat.php"><span>⚖️</span>Mutabakat</a>
<a href="ticari-mutabakat-is-kutusu.php"><span>📥</span>İş Kutusu</a>
<a href="ticari-mutabakat-hatirlatma.php"><span>🔔</span>Hatırlatma</a>
<a href="ticari-mutabakat-aksiyon.php"><span>🧭</span>Aksiyon</a>
<a href="ticari-mutabakat-saglik.php"><span>🩺</span>Sağlık</a>
<a class="active" href="ticari-mutabakat-planlama.php"><span>🗂️</span>Planlama</a>
<a href="ticari-mutabakat-eskalasyon.php"><span>🚨</span>Eskalasyon</a>
<a href="ticari-mutabakat-devir.php"><span>🔁</span>Devir</a>
</nav>
</div>
</body>
</html>
