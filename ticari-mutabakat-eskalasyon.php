<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/bildirimler.php';
require __DIR__.'/src/ticari_finans.php';
require __DIR__.'/src/ticari_belgeler.php';
require __DIR__.'/src/ticari_mutabakat.php';
require __DIR__.'/src/ticari_mutabakat_aksiyon.php';
require __DIR__.'/src/ticari_mutabakat_saglik.php';
require __DIR__.'/src/ticari_mutabakat_eskalasyon.php';

$user=require_role('super_admin');
$pdo=db();
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');

function meh(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
function me_level_class(string $level): string {
    return match($level){
        'kritik'=>'critical',
        'yuksek'=>'high',
        'orta'=>'medium',
        default=>'',
    };
}

$error='';
$success=trim((string)($_GET['ok']??''));
$ready=me_tables_ready($pdo);

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar dene.');
        if(!$ready) throw new RuntimeException('Mutabakat eskalasyon migrationı henüz kurulmamış.');
        if((string)($_POST['action']??'')!=='sync') throw new RuntimeException('Geçersiz işlem.');

        $result=me_sync($pdo,$user);
        header('Location: ticari-mutabakat-eskalasyon.php?ok='.rawurlencode(
            'Eskalasyon senkronizasyonu tamamlandı. Gönderilen: '.(int)$result['sent']
            .' · Atlanan/daha önce gönderilen: '.(int)$result['skipped']
            .' · Geçersiz sorumlu: '.(int)$result['invalid_owner']
            .' · Kurumsuz vaka: '.(int)$result['no_institution']
            .' · Kaynak çözülmüş: '.(int)$result['stale_source']
            .' · Hata: '.(int)$result['failed']
        ));
        exit;
    }catch(PDOException $e){
        $error='Veritabanı işlemi tamamlanamadı.';
    }catch(Throwable $e){
        $error=$e->getMessage();
    }
}

$candidates=$ready?me_candidate_rows($pdo,1500):[];
$summary=$ready?me_summary($pdo):[];
$history=$ready?me_history_rows($pdo,200):[];

$pending=0;
$sentCurrent=0;
$invalidOwner=0;
$noInstitution=0;
foreach($candidates as $row){
    if(empty($row['alici_gecerli'])){$invalidOwner++;continue;}
    if(empty($row['kurum_gecerli'])){$noInstitution++;continue;}
    if(!empty($row['gonderildi']))$sentCurrent++; else $pending++;
}
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Mutabakat Operasyon Eskalasyonu — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="ticari-mutabakat-eskalasyon.css?v=1.2.65">
</head>
<body class="role-page sa-subpage">
<?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Mutabakat Operasyon Eskalasyonu</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="ticari-mutabakat-saglik.php" aria-label="Aksiyon Sağlığı"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-hatirlatma.php" aria-label="Aksiyon Hatırlatmaları"><svg><use href="#sa-bell"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-devir.php" aria-label="Sorumlu Devir"><svg><use href="#sa-users"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-is-kutusu.php" aria-label="Günlük İş Kutusu"><svg><use href="#sa-card"/></svg></a>
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>

<main class="role-content">
<section class="role-hero">
<span class="eyeline">İÇ OPERASYON EŞİKLERİ</span>
<h1>Mutabakat Operasyon Eskalasyon Merkezi</h1>
<p>Açık mutabakat döngülerinde ilk müdahale eksiklerini ve 4/8/14/30+ gün yaşlanan vakaları sorumlu Süper Admin'e kontrollü ve döngü-bazlı deduplikasyonla bildir.</p>
<span class="role-hero-art">🚨</span>
</section>

<div class="role-note"><span>ℹ️</span><p>Bu merkez sözleşmesel veya harici bir SLA tanımlamaz. Eşikler yalnız iç operasyon takibi içindir ve 1.2.60'taki objektif vaka yaşı / ilk müdahale göstergelerini kullanır. Bugün/gecikmiş aksiyon tarihi bildirimleri 1.2.63 Hatırlatma Merkezi'nde ayrı kalır.</p></div>

<?php if(!$ready):?><div class="role-note"><span>⚠️</span><p>1.2.65 eskalasyon migrationı henüz hazır değil. 088 migration kurulduğunda bu merkez açılır.</p></div><?php endif;?>
<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=meh($error)?></p></div><?php endif;?>
<?php if($success!==''):?><div class="role-note"><span>✅</span><p><?=meh($success)?></p></div><?php endif;?>

<?php if($ready):?>
<section class="me-summary">
<div><strong><?=$pending?></strong><span>Gönderim bekliyor</span></div>
<div><strong><?=$sentCurrent?></strong><span>Mevcut eşik gönderildi</span></div>
<a href="ticari-mutabakat-devir.php"><strong><?=$invalidOwner?></strong><span>Geçersiz/pasif sorumlu</span></a>
<div><strong><?=$noInstitution?></strong><span>Kurumsuz vaka</span></div>
<div><strong><?=(int)($summary['toplam']??0)?></strong><span>Toplam eskalasyon geçmişi</span></div>
</section>

<section class="role-section">
<div class="role-section-head">
<div><span class="eyeline">SENKRONİZASYON</span><h2>Operasyon Eskalasyonları</h2></div>
<span class="role-pill"><?=$pending?> bekleyen</span>
</div>
<form class="me-sync" method="post">
<input type="hidden" name="csrf" value="<?=meh(csrf_token())?>">
<input type="hidden" name="action" value="sync">
<button class="role-button" type="submit">Eskalasyonları Senkronize Et</button>
<a class="role-pill" href="ticari-mutabakat-saglik.php">Aksiyon Sağlığı →</a>
</form>
<div class="role-note"><span>🔔</span><p>Sayfayı açmak bildirim üretmez. Aynı vaka, aynı açık döngü, aynı eşik ve aynı sorumluya ikinci eskalasyon gönderilmez. Vaka kapanıp yeniden açılırsa yeni döngü kendi eskalasyon geçmişini oluşturur.</p></div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">EŞİK GEÇMİŞİ</span><h2>Operasyon Seviyeleri</h2></div></div>
<div class="me-milestones">
<div><strong><?=(int)($summary['ilk_mudahale_2']??0)?></strong><span>2+ gün ilk müdahale yok</span></div>
<div><strong><?=(int)($summary['dongu_4']??0)?></strong><span>4+ gün açık</span></div>
<div><strong><?=(int)($summary['dongu_8']??0)?></strong><span>8+ gün açık</span></div>
<div><strong><?=(int)($summary['dongu_14']??0)?></strong><span>14+ gün açık</span></div>
<div><strong><?=(int)($summary['dongu_30']??0)?></strong><span>30+ gün açık</span></div>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">GÜNCEL ADAYLAR</span><h2>Mevcut Açık Döngü Eskalasyonları</h2></div><span class="role-pill"><?=count($candidates)?> vaka</span></div>
<div class="role-list me-list">
<?php if(!$candidates):?><div class="role-empty"><span>✅</span>Mevcut eşiklere giren açık mutabakat vakası yok.</div><?php endif;?>
<?php foreach($candidates as $row):
$validOwner=!empty($row['alici_gecerli']);
$validInstitution=!empty($row['kurum_gecerli']);
$sent=!empty($row['gonderildi']);
?>
<a class="role-row" href="<?=!$validOwner?'ticari-mutabakat-devir.php':'ticari-mutabakat-aksiyon.php?vaka_id='.(int)$row['vaka_id']?>">
<span><?=$sent?'✅':(!$validOwner||!$validInstitution?'⚠️':'🚨')?></span>
<div>
<strong><?=meh((string)$row['kurum_adi'])?> · <?=meh((string)$row['sozlesme_no'])?></strong>
<small><?=meh((string)$row['sorumlu_adi'])?> · <?=(int)$row['acik_gun']?> gün açık · <?=meh((string)$row['esik_etiketi'])?> · <?=meh((string)$row['sorun_turu'])?>
<?php if(!empty($row['ilk_mudahale_yok'])):?> · İlk müdahale yok<?php endif;?>
<?php if(!empty($row['aksiyon_tarihi_yok'])):?> · Aksiyon tarihi yok<?php elseif(!empty($row['aksiyon_gecikti'])):?> · Aksiyon gecikmiş<?php endif;?>
</small>
</div>
<?php if(!$validOwner):?><span class="role-pill invalid">Devir Gerekli</span>
<?php elseif(!$validInstitution):?><span class="role-pill invalid">Kurum Yok</span>
<?php elseif($sent):?><span class="role-pill ok">Gönderildi</span>
<?php else:?><span class="role-pill <?=me_level_class((string)$row['eskalasyon_seviyesi'])?>"><?=meh((string)$row['esik_etiketi'])?></span><?php endif;?>
</a>
<?php endforeach;?>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">AUDIT</span><h2>Eskalasyon Geçmişi</h2></div><span class="role-pill"><?=count($history)?></span></div>
<div class="me-history">
<?php if(!$history):?><div class="role-empty">Henüz mutabakat operasyon eskalasyonu gönderilmedi.</div><?php endif;?>
<?php foreach($history as $row):?>
<a href="ticari-mutabakat-aksiyon.php?vaka_id=<?=(int)$row['vaka_id']?>">
<div><strong><?=meh((string)$row['kurum_adi'])?> · <?=meh((string)$row['sozlesme_no'])?></strong><span><?=meh(date('d.m.Y H:i',strtotime((string)$row['olusturulma_tarihi'])))?></span></div>
<small><?=meh((string)$row['alici_adi'])?> · <?=meh((string)$row['esik_kodu'])?> · <?=(int)$row['acik_gun']?> gün açık · Döngü <?=meh((string)$row['dongu_baslangic_tarihi'])?> · <?=meh((string)$row['sorun_turu'])?></small>
</a>
<?php endforeach;?>
</div>
</section>

<div class="role-note"><span>🔒</span><p>Eskalasyon merkezi vaka sorumlusu, aşama, aksiyon tarihi veya finansal kaynak verisini değiştirmez. Geçersiz sorumlu 1.2.64 Devir Merkezi'nde düzeltilir; kaynak sorun çözülmüşse eskalasyon gönderilmez.</p></div>
<?php endif;?>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a href="ticari-mutabakat-is-kutusu.php"><span>📥</span>İş Kutusu</a>
<a href="ticari-mutabakat-hatirlatma.php"><span>🔔</span>Hatırlatma</a>
<a class="active" href="ticari-mutabakat-eskalasyon.php"><span>🚨</span>Eskalasyon</a>
<a href="ticari-mutabakat-saglik.php"><span>🩺</span>Sağlık</a>
<a href="ticari-mutabakat-devir.php"><span>🔁</span>Devir</a>
</nav>
</div>
</body>
</html>
