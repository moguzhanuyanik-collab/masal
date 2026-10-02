<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/ticari_finans.php';
require __DIR__.'/src/ticari_belgeler.php';
require __DIR__.'/src/ticari_mutabakat.php';
require __DIR__.'/src/ticari_mutabakat_aksiyon.php';
require __DIR__.'/src/ticari_mutabakat_saglik.php';
require __DIR__.'/src/ticari_mutabakat_performans.php';
require __DIR__.'/src/ticari_mutabakat_hedef.php';

$user=require_role('super_admin');
$pdo=db();
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');

function mhh(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
function mhp(float|int $value): string { return number_format((float)$value,1,',','.').'%'; }

$error='';
$success=trim((string)($_GET['ok']??''));
$ready=mh_tables_ready($pdo);

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)){
            throw new RuntimeException('Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar dene.');
        }
        if(!$ready) throw new RuntimeException('Mutabakat hedef politikası migrationı henüz kurulmamış.');

        $action=(string)($_POST['action']??'');
        if($action!=='publish') throw new RuntimeException('Geçersiz işlem.');

        $scope=(string)($_POST['kapsam']??'');
        $id=mh_publish_policy(
            $pdo,$user,$scope,
            (string)($_POST['ilk_mudahale_saat']??''),
            (string)($_POST['cevrim_gun']??''),
            (string)($_POST['aciklama']??'')
        );
        header('Location: ticari-mutabakat-hedefleri.php?ok='.rawurlencode(
            'Yeni operasyon hedef politikası yayınlandı (#'.$id.').'
        ));
        exit;
    }catch(PDOException $e){
        $error='Veritabanı işlemi tamamlanamadı.';
    }catch(Throwable $e){
        $error=$e->getMessage();
    }
}

$current=$ready?mh_effective_current_policies($pdo):[];
$history=$ready?mh_policy_versions($pdo):[];
$openSummary=$ready?mh_open_target_summary($pdo):[];
$closed30=$ready?mh_closed_target_summary($pdo,30):[];
$issue30=$ready?mh_issue_target_summary($pdo,30):[];
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Mutabakat Operasyon Hedefleri — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="ticari-mutabakat-hedefleri.css?v=1.2.67">
</head>
<body class="role-page sa-subpage">
<?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Mutabakat Operasyon Hedefleri</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="ticari-mutabakat-performans.php" aria-label="Operasyon Performansı"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-saglik.php" aria-label="Aksiyon Sağlığı"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-eskalasyon.php" aria-label="Operasyon Eskalasyonu"><svg><use href="#sa-alert"/></svg></a>
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>

<main class="role-content">
<section class="role-hero">
<span class="eyeline">İÇ OPERASYON POLİTİKASI</span>
<h1>Mutabakat Operasyon Hedefleri</h1>
<p>İlk müdahale ve çevrim hedeflerini versioned politika olarak yayınla; geçmiş vaka döngülerini o döngü başladığında geçerli olan hedefe göre ölç.</p>
<span class="role-hero-art">🎯</span>
</section>

<div class="role-note"><span>ℹ️</span><p>Bu hedefler sözleşmesel SLA, çalışan puanı veya otomatik performans kararı değildir. İç operasyon yönetimi ve raporlama içindir. 1.2.65 eskalasyon eşikleri bu sürümde değiştirilmez.</p></div>

<?php if(!$ready):?><div class="role-note"><span>⚠️</span><p>089 migration kurulunca hedef politika merkezi açılır. Başlangıç genel hedefi 48 saat ilk müdahale / 8 gün çevrim olarak oluşturulur.</p></div><?php endif;?>
<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=mhh($error)?></p></div><?php endif;?>
<?php if($success!==''):?><div class="role-note"><span>✅</span><p><?=mhh($success)?></p></div><?php endif;?>

<?php if($ready):?>
<section class="mh-summary">
<div><strong><?=(int)($openSummary['open']??0)?></strong><span>Mevcut açık vaka</span></div>
<div><strong><?=(int)($openSummary['cycle_outside']??0)?></strong><span>Çevrim hedefi dışında</span></div>
<div><strong><?=(int)($openSummary['first_outside']??0)?></strong><span>İlk müdahale hedefi dışında</span></div>
<div><strong><?=(int)($openSummary['no_policy']??0)?></strong><span>Politika öncesi / tanımsız</span></div>
<div><strong><?=mhp((float)($closed30['cycle_within_rate']??0))?></strong><span>30 gün çevrim hedef içi</span></div>
<div><strong><?=mhp((float)($closed30['first_within_rate']??0))?></strong><span>30 gün ilk müdahale hedef içi</span></div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">GEÇERLİ HEDEFLER</span><h2>Aktif Politika Görünümü</h2></div><span class="role-pill">Append-only</span></div>
<div class="mh-current-grid">
<?php foreach(mh_scope_labels() as $scope=>$label): $row=$current[$scope]??null;?>
<article>
<div><strong><?=mhh($label)?></strong><span><?=$row?'Politika #'.(int)$row['id']:'Özel hedef yok'?></span></div>
<?php if($row):?>
<div class="mh-target-values">
<span><b><?=(int)$row['ilk_mudahale_saat']?></b> saat ilk müdahale</span>
<span><b><?=(int)$row['cevrim_gun']?></b> gün çevrim</span>
</div>
<small><?=mhh((string)$row['gecerlilik_baslangici'])?> · <?=mhh((string)$row['olusturan_adi'])?></small>
<?php else:?>
<p>Bu kapsam için özel politika yayınlanmadı. Vaka döngüsü Genel politika ile değerlendirilir.</p>
<?php endif;?>
</article>
<?php endforeach;?>
</div>
<div class="role-note"><span>↪</span><p>Öncelik: vaka sorun türüne özel politika varsa o kullanılır; yoksa <strong>Genel</strong> politika uygulanır. Politika seçimi vaka döngüsünün başlangıç tarihine göre yapılır.</p></div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">YENİ VERSİYON</span><h2>Operasyon Hedefi Yayınla</h2></div></div>
<form class="role-form mh-form" method="post">
<input type="hidden" name="csrf" value="<?=mhh(csrf_token())?>">
<input type="hidden" name="action" value="publish">
<label>Kapsam</label>
<select class="role-input" name="kapsam" required>
<?php foreach(mh_scope_labels() as $scope=>$label):?><option value="<?=$scope?>"><?=mhh($label)?></option><?php endforeach;?>
</select>
<div class="mh-two">
<div><label>İlk müdahale hedefi <small>saat</small></label><input class="role-input" type="number" name="ilk_mudahale_saat" min="1" max="720" value="48" required></div>
<div><label>Çevrim hedefi <small>gün</small></label><input class="role-input" type="number" name="cevrim_gun" min="1" max="365" value="8" required></div>
</div>
<label>Politika notu <small>İsteğe bağlı</small></label>
<textarea class="role-input" name="aciklama" rows="4" maxlength="1000" placeholder="Hedef değişikliğinin nedeni, kapsamı veya operasyon notu..."></textarea>
<button class="role-button" type="submit">Yeni Politika Versiyonunu Yayınla</button>
<small>Mevcut politika güncellenmez veya silinmez. Yeni satır yeni geçerlilik başlangıcıyla eklenir.</small>
</form>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">30 GÜNLÜK HEDEF GÖRÜNÜMÜ</span><h2>Sorun Türü Bazında Uyum</h2></div><a class="role-pill ok" href="ticari-mutabakat-performans.php?gun=30">Performans Dashboardu →</a></div>
<div class="mh-issue-grid">
<?php foreach($issue30 as $row):?>
<article>
<strong><?=mhh($row['sorun_turu']==='butunluk'?'Veri Bütünlüğü':'Operasyon Açığı')?></strong>
<span><?=(int)$row['eligible']?> politika ile değerlendirilen kapanış</span>
<div><b><?=mhp((float)$row['cycle_rate'])?></b><small>Çevrim hedef içi</small></div>
<div><b><?=mhp((float)$row['first_rate'])?></b><small>İlk müdahale hedef içi</small></div>
</article>
<?php endforeach;?>
</div>
<div class="role-note"><span>🕓</span><p>089 migration öncesinde başlayan döngüler geçmişe dönük hedef uydurulmadığı için “politika öncesi” sayılır ve hedef uyum yüzdesinin paydasına alınmaz.</p></div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">VERSİYON GEÇMİŞİ</span><h2>Yayınlanmış Politikalar</h2></div><span class="role-pill"><?=count($history)?></span></div>
<div class="mh-history">
<?php foreach($history as $row):?>
<article>
<div><strong>#<?=(int)$row['id']?> · <?=mhh(mh_scope_labels()[(string)$row['kapsam']]??(string)$row['kapsam'])?></strong><span><?=mhh((string)$row['gecerlilik_baslangici'])?></span></div>
<div class="mh-target-values">
<span><b><?=(int)$row['ilk_mudahale_saat']?></b> saat ilk müdahale</span>
<span><b><?=(int)$row['cevrim_gun']?></b> gün çevrim</span>
</div>
<small><?=mhh((string)$row['olusturan_adi'])?></small>
<?php if((string)($row['aciklama']??'')!==''):?><p><?=nl2br(mhh((string)$row['aciklama']))?></p><?php endif;?>
</article>
<?php endforeach;?>
</div>
</section>
<?php endif;?>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a href="ticari-mutabakat.php"><span>⚖️</span>Mutabakat</a>
<a href="ticari-mutabakat-saglik.php"><span>🩺</span>Sağlık</a>
<a href="ticari-mutabakat-performans.php"><span>📈</span>Performans</a>
<a class="active" href="ticari-mutabakat-hedefleri.php"><span>🎯</span>Hedefler</a>
<a href="ticari-mutabakat-eskalasyon.php"><span>🚨</span>Eskalasyon</a>
</nav>
</div>
</body>
</html>
