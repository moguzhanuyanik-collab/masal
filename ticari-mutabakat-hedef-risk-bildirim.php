<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/ticari_belge.php';
require __DIR__.'/src/ticari_mutabakat.php';
require __DIR__.'/src/ticari_mutabakat_aksiyon.php';
require __DIR__.'/src/ticari_mutabakat_saglik.php';
require __DIR__.'/src/ticari_mutabakat_performans.php';
require __DIR__.'/src/ticari_mutabakat_hedef.php';
require __DIR__.'/src/ticari_mutabakat_hedef_risk.php';
require __DIR__.'/src/bildirimler.php';
require __DIR__.'/src/ticari_mutabakat_hedef_risk_bildirim.php';

$user=require_role('super_admin');
$pdo=db();
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');

function mrbh(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
function mrbf(float|int|null $value,int $precision=1): string {
    if($value===null) return '—';
    return number_format((float)$value,$precision,',','.');
}
function mrb_signal_class(string $code): string {
    return $code==='hedef_disinda'?'outside':'near';
}

$error='';
$success=trim((string)($_GET['ok']??''));
$ready=mrb_tables_ready($pdo);

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)){
            throw new RuntimeException('Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar dene.');
        }
        if(!$ready) throw new RuntimeException('Hedef-risk bildirim migrationı henüz kurulmamış.');
        if((string)($_POST['action']??'')!=='sync') throw new RuntimeException('Geçersiz işlem.');

        $result=mrb_sync($pdo,$user);
        header('Location: ticari-mutabakat-hedef-risk-bildirim.php?ok='.rawurlencode(
            'Hedef-risk bildirimleri senkronize edildi. Gönderilen: '.(int)$result['sent']
            .' · Atlanan: '.(int)$result['skipped']
            .' · Geçersiz sorumlu: '.(int)$result['invalid_owner']
            .' · Kurumsuz: '.(int)$result['no_institution']
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

$summary=$ready?mrb_summary($pdo,$user):[];
$candidates=$ready?mrb_candidate_rows($pdo,$user,800):[];
$history=$ready?mrb_history_rows($pdo,120):[];
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Mutabakat Hedef Risk Bildirimleri — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="ticari-mutabakat-hedef-risk-bildirim.css?v=1.2.69">
</head>
<body class="role-page sa-subpage">
<?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Hedef Risk Bildirimleri</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="ticari-mutabakat-hedef-risk.php" aria-label="Hedef Risk Kuyruğu"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-aksiyon.php" aria-label="Aksiyon Merkezi"><svg><use href="#sa-card"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-hedefleri.php" aria-label="Operasyon Hedefleri"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>

<main class="role-content">
<section class="role-hero">
<span class="eyeline">POLİTİKA BAZLI UYARI</span>
<h1>Mutabakat Hedef Risk Bildirimleri</h1>
<p>1.2.68 hedef-risk kuyruğundaki %75+ ve hedef dışı vakaları, tarihsel politika ve açık döngü bağlamını bozmadan ilgili Süper Admin sorumlusuna kontrollü sistem bildirimi olarak ulaştır.</p>
<span class="role-hero-art">🎯</span>
</section>

<div class="role-note"><span>ℹ️</span><p>Bu merkez 1.2.65 operasyon eskalasyonunun yerine geçmez. Eskalasyon sabit operasyon yaş eşiklerini; bu merkez ise vaka döngüsü başladığında geçerli olan versioned hedef politikasını izler. %50 bandı ve politika olmayan vakalar bildirim üretmez.</p></div>

<?php if(!$ready):?><div class="role-note"><span>⚠️</span><p>090 hedef-risk bildirim migrationı henüz hazır değil.</p></div><?php endif;?>
<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=mrbh($error)?></p></div><?php endif;?>
<?php if($success!==''):?><div class="role-note"><span>✅</span><p><?=mrbh($success)?></p></div><?php endif;?>

<?php if($ready):?>
<section class="mrb-summary">
<div><strong><?=(int)($summary['pending']??0)?></strong><span>Gönderim bekleyen</span></div>
<div><strong><?=(int)($summary['sent_current']??0)?></strong><span>Güncel sinyal gönderilmiş</span></div>
<a href="ticari-mutabakat-devir.php"><strong><?=(int)($summary['invalid_owner']??0)?></strong><span>Geçersiz / sahipsiz sorumlu</span></a>
<div><strong><?=(int)($summary['no_institution']??0)?></strong><span>Kurumsuz vaka</span></div>
<div><strong><?=(int)($summary['history_75']??0)?></strong><span>%75+ geçmişi</span></div>
<div><strong><?=(int)($summary['history_outside']??0)?></strong><span>Hedef dışı geçmişi</span></div>
<div><strong><?=(int)($summary['history_total']??0)?></strong><span>Toplam bildirim geçmişi</span></div>
</section>

<section class="role-section">
<div class="role-section-head">
<div><span class="eyeline">EXPLICIT SYNC</span><h2>Güncel Hedef Risk Sinyallerini Gönder</h2></div>
<span class="role-pill"><?=count($candidates)?> aday</span>
</div>
<form class="mrb-sync" method="post">
<input type="hidden" name="csrf" value="<?=mrbh(csrf_token())?>">
<input type="hidden" name="action" value="sync">
<button class="role-button" type="submit">Hedef Risk Bildirimlerini Senkronize Et</button>
<a class="role-pill" href="ticari-mutabakat-hedef-risk.php">Hedef Risk Kuyruğu →</a>
</form>
<div class="role-note"><span>🔔</span><p>Sayfayı açmak bildirim göndermez. Aynı vaka + açık döngü + tarihsel politika + sinyal + alıcı ikinci kez gönderilmez. İlk senkronizasyon vaka zaten hedef dışındaysa eski %75 uyarısı geriye dönük gönderilmez.</p></div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">ADAYLAR</span><h2>Güncel Politika-Bazlı Uyarılar</h2></div></div>
<div class="role-list mrb-list">
<?php if(!$candidates):?><div class="role-empty"><span>✅</span>Şu anda %75+ veya hedef dışı bildirim adayı yok.</div><?php endif;?>
<?php foreach($candidates as $row):
$code=(string)$row['esik_kodu'];
?>
<a class="role-row mrb-row" href="ticari-mutabakat-aksiyon.php?vaka_id=<?=(int)$row['vaka_id']?>">
<span><?=$code==='hedef_disinda'?'🚨':'🎯'?></span>
<div>
<strong><?=mrbh((string)$row['kurum_adi'])?> · <?=mrbh((string)$row['sozlesme_no'])?></strong>
<small>
<?=mrbh((string)$row['esik_etiketi'])?>
· Kullanım %<?=mrbf($row['hedef_sure_kullanim_orani'])?>
· Politika #<?=(int)$row['hedef_politika_id']?>
· <?=mrbh((string)$row['sorumlu_adi'])?>
</small>
</div>
<div class="mrb-tags">
<?php if(empty($row['kurum_gecerli'])):?><span class="role-pill invalid">Kurumsuz</span>
<?php elseif(empty($row['alici_gecerli'])):?><span class="role-pill invalid">Geçersiz sorumlu</span>
<?php elseif(!empty($row['gonderildi'])):?><span class="role-pill sent">Gönderildi</span>
<?php else:?><span class="role-pill <?=mrb_signal_class($code)?>">Gönderim bekliyor</span><?php endif;?>
</div>
</a>
<?php endforeach;?>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">APPEND-ONLY</span><h2>Bildirim Geçmişi</h2></div><span class="role-pill"><?=count($history)?></span></div>
<div class="mrb-history">
<?php if(!$history):?><div class="role-empty">Henüz hedef-risk bildirimi gönderilmedi.</div><?php endif;?>
<?php foreach($history as $item):?>
<a href="ticari-mutabakat-aksiyon.php?vaka_id=<?=(int)$item['vaka_id']?>">
<div><strong><?=mrbh((string)$item['kurum_adi'])?> · <?=mrbh((string)$item['sozlesme_no'])?></strong><span><?=mrbh(date('d.m.Y H:i',strtotime((string)$item['olusturulma_tarihi'])))?></span></div>
<small><?=mrbh((string)$item['esik_kodu'])?> · Politika #<?=(int)$item['hedef_politika_id']?> · Alıcı <?=mrbh((string)$item['alici_adi'])?><?php if($item['kullanim_orani']!==null):?> · Snapshot %<?=mrbf((float)$item['kullanim_orani'])?><?php endif;?></small>
</a>
<?php endforeach;?>
</div>
</section>

<div class="role-note"><span>🔒</span><p>Bildirimden hemen önce vaka satırı kilitlenir, kaynak sorunun hâlâ açık olduğu doğrulanır ve hedef-risk durumu yeniden hesaplanır. Sorumlu veya risk seviyesi değişmiş eski aday verisiyle bildirim gönderilmez.</p></div>
<?php endif;?>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a href="ticari-mutabakat-hedef-risk.php"><span>🎯</span>Risk</a>
<a class="active" href="ticari-mutabakat-hedef-risk-bildirim.php"><span>🔔</span>Uyarılar</a>
<a href="ticari-mutabakat-aksiyon.php"><span>✓</span>Aksiyon</a>
<a href="ticari-mutabakat-hedefleri.php"><span>◎</span>Hedefler</a>
</nav>
</div>
</body>
</html>
