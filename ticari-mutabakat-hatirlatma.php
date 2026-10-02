<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/ticari_belge.php';
require __DIR__.'/src/ticari_mutabakat.php';
require __DIR__.'/src/ticari_mutabakat_aksiyon.php';
require __DIR__.'/src/ticari_mutabakat_saglik.php';
require __DIR__.'/src/ticari_mutabakat_is_kutusu.php';
require __DIR__.'/src/bildirimler.php';
require __DIR__.'/src/ticari_mutabakat_hatirlatma.php';

$user=require_role('super_admin');
$pdo=db();
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');

function mrh(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }

$error='';
$success=trim((string)($_GET['ok']??''));
$ready=mr_tables_ready($pdo);

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar dene.');
        if(!$ready) throw new RuntimeException('Mutabakat aksiyon hatırlatma migrationı henüz kurulmamış.');
        if((string)($_POST['action']??'')!=='sync') throw new RuntimeException('Geçersiz işlem.');

        $result=mr_sync($pdo,$user);
        header('Location: ticari-mutabakat-hatirlatma.php?ok='.rawurlencode(
            'Hatırlatmalar senkronize edildi. Gönderilen: '.(int)$result['sent']
            .' · Atlanan/daha önce gönderilen: '.(int)$result['skipped']
            .' · Geçersiz sorumlu: '.(int)$result['invalid_owner']
            .' · Kurumsuz vaka: '.(int)$result['no_institution']
            .' · Kaynak çözülmüş: '.(int)$result['stale_source']
            .' · Hata: '.(int)$result['failed']
        ));
        exit;
    }catch(PDOException){
        $error='Veritabanı işlemi tamamlanamadı.';
    }catch(Throwable $e){
        $error=$e->getMessage();
    }
}

$summary=$ready?mr_summary($pdo):[];
$candidates=$ready?mr_candidate_rows($pdo,600):[];
$history=$ready?mr_history_rows($pdo,180):[];

$pending=0;
$sentCurrent=0;
$invalidOwner=0;
$noInstitution=0;
foreach($candidates as $row){
    if(empty($row['alici_gecerli'])){$invalidOwner++;continue;}
    if(empty($row['kurum_gecerli'])){$noInstitution++;continue;}
    if(!empty($row['gonderildi']))$sentCurrent++;
    else $pending++;
}
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Mutabakat Aksiyon Hatırlatmaları — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="ticari-mutabakat-hatirlatma.css?v=1.2.63">
</head>
<body class="role-page sa-subpage">
<?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Mutabakat Aksiyon Hatırlatmaları</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="ticari-mutabakat-is-kutusu.php" aria-label="Günlük İş Kutusu"><svg><use href="#sa-card"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-aksiyon.php" aria-label="Aksiyon Merkezi"><svg><use href="#sa-alert"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-planlama.php" aria-label="Toplu Planlama"><svg><use href="#sa-refresh"/></svg></a>
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>

<main class="role-content">
<section class="role-hero">
<span class="eyeline">MUTABAKAT TAKİP BİLDİRİMLERİ</span>
<h1>Aksiyon Hatırlatma Merkezi</h1>
<p>Bugün aksiyon bekleyen veya gecikmiş mutabakat vakalarını sorumlu Süper Admin'e kontrollü ve deduplikasyonlu sistem bildirimi olarak gönder.</p>
<span class="role-hero-art">🔔</span>
</section>

<?php if(!$ready):?><div class="role-note"><span>⚠️</span><p>1.2.63 hatırlatma migrationı henüz hazır değil. 087 migration kurulduğunda bu merkez açılır.</p></div><?php endif;?>
<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=mrh($error)?></p></div><?php endif;?>
<?php if($success!==''):?><div class="role-note"><span>✅</span><p><?=mrh($success)?></p></div><?php endif;?>

<?php if($ready):?>
<section class="mr-summary">
<div><strong><?=$pending?></strong><span>Gönderim bekliyor</span></div>
<div><strong><?=$sentCurrent?></strong><span>Mevcut eşik gönderildi</span></div>
<div><strong><?=$invalidOwner?></strong><span>Geçersiz/pasif sorumlu</span></div>
<div><strong><?=$noInstitution?></strong><span>Kurumsuz vaka</span></div>
<div><strong><?=(int)($summary['toplam']??0)?></strong><span>Toplam geçmiş</span></div>
</section>

<section class="role-section">
<div class="role-section-head">
<div><span class="eyeline">SENKRONİZASYON</span><h2>Sorumlu Hatırlatmaları</h2></div>
<span class="role-pill"><?=$pending?> bekleyen</span>
</div>
<form class="mr-sync" method="post">
<input type="hidden" name="csrf" value="<?=mrh(csrf_token())?>">
<input type="hidden" name="action" value="sync">
<button class="role-button" type="submit">Aksiyon Hatırlatmalarını Senkronize Et</button>
<a class="role-pill" href="ticari-mutabakat-is-kutusu.php">Günlük İş Kutusu →</a>
</form>
<div class="role-note"><span>ℹ️</span><p>Gönderim yalnız bu POST işlemiyle çalışır; sayfayı açmak bildirim üretmez. Aynı vaka, aynı aksiyon tarihi, aynı eşik ve aynı sorumlu kullanıcıya ikinci bildirim gönderilmez. Sorumlu değişirse yeni sorumlu kendi bildirimi alabilir.</p></div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">EŞİK GEÇMİŞİ</span><h2>Gönderim Dağılımı</h2></div></div>
<div class="mr-milestones">
<div><strong><?=(int)($summary['bugun']??0)?></strong><span>Bugün</span></div>
<div><strong><?=(int)($summary['gecikme_1']??0)?></strong><span>1+ gün</span></div>
<div><strong><?=(int)($summary['gecikme_3']??0)?></strong><span>3+ gün</span></div>
<div><strong><?=(int)($summary['gecikme_7']??0)?></strong><span>7+ gün</span></div>
<div><strong><?=(int)($summary['gecikme_14']??0)?></strong><span>14+ gün</span></div>
<div><strong><?=(int)($summary['gecikme_30']??0)?></strong><span>30+ gün</span></div>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">GÜNCEL ADAYLAR</span><h2>Bugün & Gecikmiş Vakalar</h2></div><span class="role-pill"><?=count($candidates)?> vaka</span></div>
<div class="role-list mr-list">
<?php if(!$candidates):?><div class="role-empty"><span>✅</span>Bugün veya gecikmiş, sorumlu atanmış açık vaka yok.</div><?php endif;?>
<?php foreach($candidates as $row):
$validOwner=!empty($row['alici_gecerli']);
$validInstitution=!empty($row['kurum_gecerli']);
$sent=!empty($row['gonderildi']);
?>
<a class="role-row" href="ticari-mutabakat-aksiyon.php?vaka_id=<?=(int)$row['vaka_id']?>">
<span><?=$sent?'✅':(!$validOwner||!$validInstitution?'⚠️':'🔔')?></span>
<div>
<strong><?=mrh((string)$row['kurum_adi'])?> · <?=mrh((string)$row['sozlesme_no'])?></strong>
<small><?=mrh((string)$row['sorumlu_adi'])?> · Aksiyon <?=mrh((string)$row['sonraki_aksiyon_tarihi'])?> · <?=mrh((string)($row['esik_etiketi']??'—'))?> · <?=mrh((string)$row['sorun_turu'])?></small>
</div>
<?php if(!$validOwner):?><span class="role-pill invalid">Geçersiz Sorumlu</span>
<?php elseif(!$validInstitution):?><span class="role-pill invalid">Kurum Yok</span>
<?php elseif($sent):?><span class="role-pill ok">Gönderildi</span>
<?php else:?><span class="role-pill pending">Bekliyor</span><?php endif;?>
</a>
<?php endforeach;?>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">AUDIT</span><h2>Hatırlatma Geçmişi</h2></div><span class="role-pill"><?=count($history)?></span></div>
<div class="mr-history">
<?php if(!$history):?><div class="role-empty">Henüz mutabakat aksiyon hatırlatması gönderilmedi.</div><?php endif;?>
<?php foreach($history as $row):?>
<a href="ticari-mutabakat-aksiyon.php?vaka_id=<?=(int)$row['vaka_id']?>">
<div><strong><?=mrh((string)$row['kurum_adi'])?> · <?=mrh((string)$row['sozlesme_no'])?></strong><span><?=mrh(date('d.m.Y H:i',strtotime((string)$row['olusturulma_tarihi'])))?></span></div>
<small><?=mrh((string)$row['alici_adi'])?> · <?=mrh((string)$row['esik_kodu'])?> · Aksiyon <?=mrh((string)$row['aksiyon_tarihi'])?> · <?=mrh((string)$row['sorun_turu'])?></small>
</a>
<?php endforeach;?>
</div>
</section>

<div class="role-note"><span>🔒</span><p>Hatırlatma merkezi vaka sorumlusu, aksiyon tarihi, aşama veya finansal kaynak verisini değiştirmez. Kaynak sorun çözülmüşse bildirim gönderilmez; önce Aksiyon Merkezi senkronizasyonuyla vaka durumu uzlaştırılmalıdır.</p></div>
<?php endif;?>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a href="ticari-mutabakat-is-kutusu.php"><span>📥</span>İş Kutusu</a>
<a class="active" href="ticari-mutabakat-hatirlatma.php"><span>🔔</span>Hatırlatma</a>
<a href="ticari-mutabakat-aksiyon.php"><span>🧭</span>Aksiyon</a>
<a href="ticari-mutabakat-planlama.php"><span>🗂️</span>Planlama</a>
</nav>
</div>
</body>
</html>
