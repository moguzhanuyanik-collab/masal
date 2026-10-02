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

$user=require_role('super_admin');
$pdo=db();
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');

function mhrh(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
function mhrf(float|int|null $value,int $precision=1): string {
    if($value===null) return '—';
    return number_format((float)$value,$precision,',','.');
}
function mhr_issue_label(string $type): string {
    return $type==='butunluk'?'Veri Bütünlüğü':'Operasyon Açığı';
}
function mhr_risk_class(string $code): string {
    return match($code){
        'hedef_disinda'=>'outside',
        'yuzde_75'=>'near',
        'yuzde_50'=>'watch',
        'politika_yok'=>'undefined',
        default=>'inside',
    };
}

$ready=mhr_tables_ready($pdo);
$scope=(string)($_GET['scope']??'team');
if(!array_key_exists($scope,mhr_scope_labels())) $scope='team';
$risk=(string)($_GET['risk']??'');
if($risk!=='' && !array_key_exists($risk,mhr_risk_labels())) $risk='';
$type=(string)($_GET['sorun_turu']??'');
if(!in_array($type,['operasyon','butunluk'],true)) $type='';
$ownerFilter=(string)($_GET['owner_id']??'');
$query=trim((string)($_GET['q']??''));

$summary=$ready?mhr_summary($pdo,$user):[];
$rows=$ready?mhr_rows($pdo,$user,[
    'scope'=>$scope,
    'risk'=>$risk,
    'sorun_turu'=>$type,
    'owner_id'=>$ownerFilter,
    'q'=>$query,
],900):[];
$owners=$ready?mhr_owner_rows($pdo,$user,120):[];
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Mutabakat Hedef Risk Kuyruğu — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="ticari-mutabakat-hedef-risk.css?v=1.2.68">
</head>
<body class="role-page sa-subpage">
<?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Mutabakat Hedef Risk Kuyruğu</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="ticari-mutabakat-is-kutusu.php" aria-label="Günlük İş Kutusu"><svg><use href="#sa-card"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-hedefleri.php" aria-label="Operasyon Hedefleri"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-hedef-risk-bildirim.php" aria-label="Hedef Risk Bildirimleri"><svg><use href="#sa-alert"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-hedef-risk-saglik.php" aria-label="Bildirim Sağlığı"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-saglik.php" aria-label="Aksiyon Sağlığı"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-performans.php" aria-label="Performans"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>

<main class="role-content">
<section class="role-hero">
<span class="eyeline">HEDEF BAZLI OPERASYON</span>
<h1>Hedef Risk & Aksiyon Kuyruğu</h1>
<p>Açık mutabakat vakalarını, vaka döngüsü başladığında geçerli olan iç operasyon hedefiyle değerlendir; hedef dışına çıkanları ve hedef süresinin büyük bölümünü tüketenleri tek kuyrukta gör.</p>
<span class="role-hero-art">🎯</span>
</section>

<div class="role-note"><span>ℹ️</span><p>Bu ekran sözleşmesel SLA, çalışan skoru veya başarı sıralaması değildir. Yüzde yalnız vaka döngüsünün ilgili hedef süresinden ne kadar tüketildiğini gösterir. 1.2.65 eskalasyon eşikleri değişmez ve bu kuyruk bildirim göndermez.</p></div>

<?php if(!$ready):?>
<div class="role-note"><span>⚠️</span><p>Mutabakat hedef politikası hazır değil. 089 migration ve 1.2.67 hedef domaini kullanılabilir olduğunda bu ekran açılır.</p></div>
<?php else:?>

<section class="mhr-summary">
<a href="ticari-mutabakat-hedef-risk.php?scope=team"><strong><?=(int)($summary['open']??0)?></strong><span>Açık vaka</span></a>
<a href="ticari-mutabakat-hedef-risk.php?scope=team&amp;risk=hedef_disinda"><strong><?=(int)($summary['outside']??0)?></strong><span>Hedef dışında</span></a>
<a href="ticari-mutabakat-hedef-risk.php?scope=team&amp;risk=yuzde_75"><strong><?=(int)($summary['near_75']??0)?></strong><span>Süre %75+</span></a>
<a href="ticari-mutabakat-hedef-risk.php?scope=team&amp;risk=yuzde_50"><strong><?=(int)($summary['watch_50']??0)?></strong><span>Süre %50–74</span></a>
<a href="ticari-mutabakat-hedef-risk.php?scope=team&amp;risk=politika_yok"><strong><?=(int)($summary['policy_missing']??0)?></strong><span>Politika yok</span></a>
<a href="ticari-mutabakat-hedef-risk.php?scope=mine&amp;risk=hedef_disinda"><strong><?=(int)($summary['mine_outside']??0)?></strong><span>Bana atanan · dışarıda</span></a>
<a href="ticari-mutabakat-hedef-risk.php?scope=unassigned&amp;risk=hedef_disinda"><strong><?=(int)($summary['unassigned_outside']??0)?></strong><span>Sahipsiz · dışarıda</span></a>
<a href="ticari-mutabakat-hedef-risk.php?scope=team&amp;risk=hedef_disinda"><strong><?=(int)($summary['outside_overdue_action']??0)?></strong><span>Dışarıda + aksiyon gecikmiş</span></a>
</section>

<section class="role-section">
<div class="role-section-head">
<div><span class="eyeline">AKSİYON KUYRUĞU</span><h2>Açık Vaka Hedef Durumu</h2></div>
<span class="role-pill"><?=count($rows)?> vaka</span>
</div>

<form class="mhr-filter" method="get">
<select name="scope">
<?php foreach(mhr_scope_labels() as $value=>$label):?>
<option value="<?=$value?>" <?=$scope===$value?'selected':''?>><?=mhrh($label)?></option>
<?php endforeach;?>
</select>
<select name="risk">
<option value="">Tüm hedef durumları</option>
<?php foreach(mhr_risk_labels() as $value=>$label):?>
<option value="<?=$value?>" <?=$risk===$value?'selected':''?>><?=mhrh($label)?></option>
<?php endforeach;?>
</select>
<select name="sorun_turu">
<option value="">Tüm sorun türleri</option>
<option value="operasyon" <?=$type==='operasyon'?'selected':''?>>Operasyon Açığı</option>
<option value="butunluk" <?=$type==='butunluk'?'selected':''?>>Veri Bütünlüğü</option>
</select>
<?php if($ownerFilter!==''):?><input type="hidden" name="owner_id" value="<?=mhrh($ownerFilter)?>"><?php endif;?>
<input type="search" name="q" value="<?=mhrh($query)?>" placeholder="Kurum, sözleşme, sorumlu veya açıklama">
<button type="submit">Filtrele</button>
<a href="ticari-mutabakat-hedef-risk.php">Temizle</a>
</form>

<div class="role-list mhr-list">
<?php if(!$rows):?><div class="role-empty"><span>✅</span>Filtreye uyan açık hedef-risk vakası yok.</div><?php endif;?>
<?php foreach($rows as $row):
$code=(string)$row['hedef_risk_kodu'];
$usage=$row['hedef_sure_kullanim_orani'];
$cycleUsage=$row['cevrim_kullanim_orani'];
$firstUsage=$row['ilk_mudahale_kullanim_orani'];
$progress=$usage===null?0:max(0,min(100,(float)$usage));
?>
<a class="role-row mhr-row" href="ticari-mutabakat-aksiyon.php?vaka_id=<?=(int)$row['id']?>">
<span><?=($code==='hedef_disinda'?'🚨':($code==='politika_yok'?'?':'🎯'))?></span>
<div class="mhr-main">
<strong><?=mhrh((string)$row['kurum_adi'])?> · <?=mhrh((string)$row['sozlesme_no'])?></strong>
<small><?=mhrh(mhr_issue_label((string)$row['sorun_turu']))?> · <?=mhrh((string)$row['sorumlu_adi'])?> · <?=mhrh((string)$row['durum'])?> · Döngü <?=mhrh((string)$row['dongu_baslangic_tarihi'])?></small>
<?php if(!empty($row['hedef_politika_id'])):?>
<div class="mhr-progress"><i style="width:<?=number_format($progress,2,'.','')?>%"></i></div>
<em>
Genel kullanım <?=mhrf($usage)?>%
· Çevrim <?=mhrf($cycleUsage)?>%
· İlk müdahale <?=mhrf($firstUsage)?>%
· En yakın kalan <?=mhrh(mhr_remaining_label($row['hedef_kalan_saat']!==null?(float)$row['hedef_kalan_saat']:null))?>
</em>
<?php else:?>
<em>Bu vaka döngüsünün başladığı tarihte uygulanabilir hedef politikası yok.</em>
<?php endif;?>
</div>
<div class="mhr-tags">
<span class="role-pill <?=mhr_risk_class($code)?>"><?=mhrh((string)$row['hedef_risk_etiketi'])?></span>
<?php if(!empty($row['hedef_politika_id'])):?><span class="role-pill">Politika #<?=(int)$row['hedef_politika_id']?></span><?php endif;?>
<?php if((string)($row['hedef_cevrim_durumu']??'')==='hedef_disinda'):?><span class="role-pill outside">Çevrim Dışı</span><?php endif;?>
<?php if((string)($row['hedef_ilk_mudahale_durumu']??'')==='hedef_disinda'):?><span class="role-pill outside">İlk Müdahale Dışı</span><?php endif;?>
<?php if(!empty($row['ilk_mudahale_bekliyor'])):?><span class="role-pill">İlk Müdahale Bekliyor</span><?php endif;?>
<?php if(!empty($row['aksiyon_gecikti'])):?><span class="role-pill action">Aksiyon Gecikmiş</span><?php endif;?>
<?php if(!empty($row['aksiyon_bugun'])):?><span class="role-pill today">Aksiyon Bugün</span><?php endif;?>
</div>
</a>
<?php endforeach;?>
</div>
</section>

<section class="role-section">
<div class="role-section-head">
<div><span class="eyeline">SORUMLU BAZLI</span><h2>Hedef Durumu İş Yükü</h2></div>
<a class="role-pill ok" href="ticari-mutabakat-is-kutusu.php?scope=team">Günlük İş Kutusu →</a>
</div>
<div class="mhr-table-wrap">
<table class="mhr-table">
<thead><tr>
<th>Sorumlu</th><th>Açık</th><th>Politikalı</th><th>Hedef Dışı</th><th>%75+</th><th>%50–74</th><th>Politika Yok</th><th>Aksiyon Gecikmiş</th>
</tr></thead>
<tbody>
<?php if(!$owners):?><tr><td colspan="8">Açık mutabakat vaka yükü yok.</td></tr><?php endif;?>
<?php foreach($owners as $owner):
$ownerId=(int)$owner['sorumlu_kullanici_id'];
$link=$ownerId>0
    ?'ticari-mutabakat-hedef-risk.php?scope=team&amp;owner_id='.$ownerId
    :'ticari-mutabakat-hedef-risk.php?scope=unassigned';
?>
<tr>
<td><a href="<?=$link?>"><strong><?=mhrh((string)$owner['sorumlu_adi'])?></strong></a></td>
<td><?=(int)$owner['open']?></td>
<td><?=(int)$owner['policy_evaluable']?></td>
<td class="<?=((int)$owner['outside']>0?'mhr-danger':'')?>"><?=(int)$owner['outside']?></td>
<td><?=(int)$owner['near_75']?></td>
<td><?=(int)$owner['watch_50']?></td>
<td><?=(int)$owner['policy_missing']?></td>
<td><?=(int)$owner['overdue_action']?></td>
</tr>
<?php endforeach;?>
</tbody>
</table>
</div>
<div class="role-note"><span>🔎</span><p>Bu tablo çalışan puanı veya performans sıralaması değildir. Yalnız mevcut açık vaka yükünün hedef zamanı ve aksiyon tarihi açısından dağılımını gösterir.</p></div>
</section>

<section class="role-section">
<div class="role-section-head">
<div><span class="eyeline">HEDEF SÖZLEŞMESİ</span><h2>Nasıl Hesaplanıyor?</h2></div>
<a class="role-pill ok" href="ticari-mutabakat-hedefleri.php">Politikaları Aç →</a>
</div>
<div class="mhr-rules">
<article><strong>%100+</strong><span>Çevrim veya ilk müdahale hedeflerinden en az biri hedef dışında.</span></article>
<article><strong>%75–99</strong><span>Aktif hedef saatinin en az dörtte üçü tüketilmiş, fakat henüz aşılmamış.</span></article>
<article><strong>%50–74</strong><span>Aktif hedef saatinin en az yarısı tüketilmiş.</span></article>
<article><strong>&lt;%50</strong><span>Aktif hedef süresinin yarısından azı tüketilmiş.</span></article>
<article><strong>Politika Yok</strong><span>Döngü başlangıcında geçerli özel veya genel hedef politikası bulunamamış.</span></article>
</div>
<div class="role-note"><span>↻</span><p>Reopen olmuş vakada süre ilk kayıt tarihinden değil son <strong>vaka_yeniden_acildi</strong> olayından başlar. Politika da bu yeni döngü başlangıcında geçerli olan sürümden çözülür; bugünkü hedef geçmiş döngüye uygulanmaz.</p></div>
</section>

<div class="role-note"><span>🔒</span><p>Bu merkez salt-okunurdur. Vaka, sorumlu, aksiyon tarihi, politika, hatırlatma veya eskalasyon kaydı oluşturmaz. Değişiklik için Aksiyon/Planlama/Hedef/Eskalasyon merkezlerini kullan.</p></div>
<?php endif;?>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a href="ticari-mutabakat-is-kutusu.php"><span>📥</span>İş Kutusu</a>
<a class="active" href="ticari-mutabakat-hedef-risk.php"><span>🎯</span>Hedef Risk</a>
<a href="ticari-mutabakat-hedef-risk-bildirim.php"><span>🔔</span>Uyarılar</a>
<a href="ticari-mutabakat-hedef-risk-saglik.php"><span>📨</span>Bildirim Sağlığı</a>
<a href="ticari-mutabakat-aksiyon.php"><span>🧭</span>Aksiyon</a>
<a href="ticari-mutabakat-saglik.php"><span>🩺</span>Sağlık</a>
<a href="ticari-mutabakat-performans.php"><span>📈</span>Performans</a>
<a href="ticari-mutabakat-hedefleri.php"><span>🎯</span>Hedefler</a>
<a href="ticari-mutabakat-eskalasyon.php"><span>🚨</span>Eskalasyon</a>
</nav>
</div>
</body>
</html>
