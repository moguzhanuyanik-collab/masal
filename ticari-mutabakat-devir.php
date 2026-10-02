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
require __DIR__.'/src/ticari_mutabakat_devir.php';

$user=require_role('super_admin');
$pdo=db();
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');

function mdvh(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
function mdv_type_label(string $type): string { return $type==='butunluk'?'Veri Bütünlüğü':'Operasyon Açığı'; }

$ready=mdv_tables_ready($pdo);
$error='';
$success=trim((string)($_GET['ok']??''));

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)){
            throw new RuntimeException('Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar dene.');
        }
        if(!$ready) throw new RuntimeException('Mutabakat aksiyon tabloları henüz hazır değil.');
        if((string)($_POST['action']??'')!=='transfer') throw new RuntimeException('Geçersiz işlem.');

        $result=mdv_transfer(
            $pdo,$user,
            is_array($_POST['vaka_ids']??null)?$_POST['vaka_ids']:[],
            max(0,(int)($_POST['yeni_sorumlu_id']??0)),
            (string)($_POST['devir_notu']??'')
        );

        header('Location: ticari-mutabakat-devir.php?ok='.rawurlencode(
            (int)$result['updated'].' vaka '.(string)$result['owner_name'].' kullanıcısına devredildi.'
        ));
        exit;
    }catch(Throwable $e){
        $error=$e->getMessage();
    }
}

$filters=[
    'q'=>(string)($_GET['q']??''),
    'sorumlu_durumu'=>(string)($_GET['sorumlu_durumu']??''),
];
$summary=$ready?mdv_summary($pdo):[];
$rows=$ready?mdv_rows($pdo,$filters,1000):[];
$admins=$ready?map_super_admin_rows($pdo):[];
$recent=$ready?mdv_recent_transfers($pdo,60):[];
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Mutabakat Sorumlu Devir — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.72">
<link rel="stylesheet" href="ticari-mutabakat-devir.css?v=1.2.64">
</head>
<body class="role-page sa-subpage">
<?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="role-shell">
<header class="role-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Mutabakat Sorumlu Devir</small></span></a>
<div class="sa-page-actions">
<a class="sa-page-action" href="ticari-mutabakat-is-kutusu.php" aria-label="Günlük İş Kutusu"><svg><use href="#sa-users"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-hatirlatma.php" aria-label="Aksiyon Hatırlatmaları"><svg><use href="#sa-bell"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-planlama.php" aria-label="Toplu Planlama"><svg><use href="#sa-refresh"/></svg></a>
<a class="sa-page-action" href="ticari-mutabakat-saglik.php" aria-label="Aksiyon Sağlığı"><svg><use href="#sa-chart"/></svg></a>
<a class="sa-page-action" href="super-admin.php" aria-label="Panel"><svg><use href="#sa-home"/></svg></a>
</div>
</header>

<main class="role-content">
<section class="role-hero">
<span class="eyeline">SORUMLU SAĞLIĞI</span>
<h1>Mutabakat Sorumlu Devir & Yetim Vaka Kurtarma</h1>
<p>Sahipsiz, pasif kullanıcıya atanmış, artık Süper Admin olmayan veya kullanıcı kaydı silinmiş açık mutabakat vakalarını aktif bir Süper Admin'e güvenli biçimde devret.</p>
<span class="role-hero-art">🔁</span>
</section>

<div class="role-note"><span>ℹ️</span><p>Bu merkez normal görev dağılımı için kullanılmaz. Geçerli aktif Süper Admin sorumlusu olan vaka burada devredilemez; normal ekip planlaması için <a href="ticari-mutabakat-planlama.php">Toplu Planlama</a> kullanılır. Devir mevcut sonraki aksiyon tarihini değiştirmez.</p></div>

<?php if(!$ready):?><div class="role-note"><span>⚠️</span><p>1.2.59 mutabakat aksiyon tabloları hazır değil. 086 migration kurulduğunda devir merkezi otomatik açılır.</p></div><?php endif;?>
<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=mdvh($error)?></p></div><?php endif;?>
<?php if($success!==''):?><div class="role-note"><span>✅</span><p><?=mdvh($success)?></p></div><?php endif;?>

<?php if($ready):?>
<section class="mdv-summary">
<a href="ticari-mutabakat-devir.php"><strong><?=(int)($summary['toplam']??0)?></strong><span>Kurtarılacak vaka</span></a>
<a href="ticari-mutabakat-devir.php?sorumlu_durumu=sahipsiz"><strong><?=(int)($summary['sahipsiz']??0)?></strong><span>Sahipsiz</span></a>
<a href="ticari-mutabakat-devir.php?sorumlu_durumu=pasif"><strong><?=(int)($summary['pasif']??0)?></strong><span>Pasif sorumlu</span></a>
<a href="ticari-mutabakat-devir.php?sorumlu_durumu=rol_gecersiz"><strong><?=(int)($summary['rol_gecersiz']??0)?></strong><span>Rol geçersiz</span></a>
<a href="ticari-mutabakat-devir.php?sorumlu_durumu=kullanici_yok"><strong><?=(int)($summary['kullanici_yok']??0)?></strong><span>Kullanıcı yok</span></a>
<a href="ticari-mutabakat-devir.php"><strong><?=(int)($summary['aksiyon_gecikti']??0)?></strong><span>Aksiyonu gecikmiş</span></a>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">FİLTRE</span><h2>Yetim / Geçersiz Sorumlu Vakaları</h2></div><span class="role-pill"><?=count($rows)?> vaka</span></div>
<form class="mdv-filter" method="get">
<input type="search" name="q" value="<?=mdvh((string)$filters['q'])?>" placeholder="Kurum, sözleşme veya teşhis">
<select name="sorumlu_durumu">
<option value="">Tüm geçersiz sahiplikler</option>
<option value="sahipsiz" <?=$filters['sorumlu_durumu']==='sahipsiz'?'selected':''?>>Sahipsiz</option>
<option value="pasif" <?=$filters['sorumlu_durumu']==='pasif'?'selected':''?>>Pasif kullanıcı</option>
<option value="rol_gecersiz" <?=$filters['sorumlu_durumu']==='rol_gecersiz'?'selected':''?>>Artık Süper Admin değil</option>
<option value="kullanici_yok" <?=$filters['sorumlu_durumu']==='kullanici_yok'?'selected':''?>>Kullanıcı kaydı yok</option>
</select>
<button type="submit">Filtrele</button>
<a href="ticari-mutabakat-devir.php">Temizle</a>
</form>
</section>

<form method="post" class="mdv-transfer-form">
<input type="hidden" name="csrf" value="<?=mdvh(csrf_token())?>">
<input type="hidden" name="action" value="transfer">

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">TOPLU DEVİR</span><h2>Seçili Vakaları Kurtar</h2></div><span class="role-pill">En fazla 100</span></div>

<div class="mdv-transfer-controls">
<label>Yeni sorumlu
<select class="role-input" name="yeni_sorumlu_id" required>
<option value="">Aktif Süper Admin seç</option>
<?php foreach($admins as $admin):?>
<option value="<?=(int)$admin['id']?>"><?=mdvh((string)$admin['ad_soyad'])?> · <?=mdvh((string)$admin['email'])?></option>
<?php endforeach;?>
</select>
</label>
<label>Devir notu <small>İsteğe bağlı</small>
<input class="role-input" name="devir_notu" maxlength="600" placeholder="Görev değişimi, kullanıcı kapatıldı, ekip devri...">
</label>
<button class="role-button" type="submit">Seçili Vakaları Devret</button>
</div>

<div class="role-note"><span>🔒</span><p>İşlem tek transaction içinde çalışır. Seçili vakalardan biri kapanmışsa, kaynak sorunu çözülmüşse veya artık geçerli bir Süper Admin sorumlusuna sahipse tüm devir iptal edilir; kısmi güncelleme yapılmaz.</p></div>

<div class="mdv-select-head"><label><input type="checkbox" id="mdv-select-all"> Görünenlerin tümünü seç</label><span><?=count($rows)?> kurtarılabilir vaka</span></div>

<div class="role-list mdv-list">
<?php if(!$rows):?><div class="role-empty"><span>✅</span>Geçersiz/sahipsiz sorumluya bağlı açık mutabakat vakası yok.</div><?php endif;?>
<?php foreach($rows as $row):?>
<label class="role-row mdv-row">
<input class="mdv-check" type="checkbox" name="vaka_ids[]" value="<?=(int)$row['id']?>">
<span class="mdv-icon"><?=($row['sorumlu_durum_kodu']==='sahipsiz'?'∅':($row['sorumlu_durum_kodu']==='pasif'?'⏸':'⚠️'))?></span>
<div>
<strong><?=mdvh((string)$row['kurum_adi'])?> · <?=mdvh((string)$row['sozlesme_no'])?></strong>
<small><?=mdvh(mdv_type_label((string)$row['sorun_turu']))?> · <?=mdvh((string)$row['sorumlu_adi'])?> · <?=mdvh((string)$row['sorumlu_durum_etiketi'])?><?php if(!empty($row['sonraki_aksiyon_tarihi'])):?> · Aksiyon <?=mdvh((string)$row['sonraki_aksiyon_tarihi'])?><?php endif;?></small>
<?php if((string)($row['son_aciklama']??'')!==''):?><small><?=mdvh(mb_strimwidth((string)$row['son_aciklama'],0,180,'...','UTF-8'))?></small><?php endif;?>
</div>
<div class="mdv-tags">
<?php if(!empty($row['aksiyon_gecikti'])):?><span class="role-pill danger">Aksiyon Gecikti</span><?php endif;?>
<span class="role-pill"><?=mdvh((string)$row['sorumlu_durum_etiketi'])?></span>
<a href="ticari-mutabakat-aksiyon.php?vaka_id=<?=(int)$row['id']?>" onclick="event.stopPropagation()">Vaka →</a>
</div>
</label>
<?php endforeach;?>
</div>
</section>
</form>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">AUDIT</span><h2>Son Sorumlu Devirleri</h2></div><span class="role-pill"><?=count($recent)?></span></div>
<div class="mdv-history">
<?php if(!$recent):?><div class="role-empty">Henüz sorumlu devir kaydı yok.</div><?php endif;?>
<?php foreach($recent as $item):?>
<a href="ticari-mutabakat-aksiyon.php?vaka_id=<?=(int)$item['vaka_id']?>">
<div><strong><?=mdvh((string)$item['kurum_adi'])?> · <?=mdvh((string)$item['sozlesme_no'])?></strong><span><?=mdvh(date('d.m.Y H:i',strtotime((string)$item['olusturulma_tarihi'])))?></span></div>
<small><?=mdvh((string)$item['kullanici_adi'])?> · <?=mdvh((string)$item['not_metni'])?></small>
</a>
<?php endforeach;?>
</div>
</section>

<div class="role-note"><span>↪</span><p>Devir tamamlandıktan sonra vaka yeni sorumlunun Günlük İş Kutusu'nda görünür. Aksiyon tarihi bugün/gecikmişse 1.2.63 Hatırlatma Merkezi yeni sorumlu için kendi dedup döngüsünde bildirim üretebilir.</p></div>
<?php endif;?>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a href="ticari-mutabakat-is-kutusu.php"><span>📥</span>İş Kutusu</a>
<a href="ticari-mutabakat-hatirlatma.php"><span>🔔</span>Hatırlatma</a>
<a href="ticari-mutabakat-aksiyon.php"><span>🧭</span>Aksiyon</a>
<a href="ticari-mutabakat-planlama.php"><span>🗂️</span>Planlama</a>
<a class="active" href="ticari-mutabakat-devir.php"><span>🔁</span>Devir</a>
</nav>
</div>
<script>
document.getElementById('mdv-select-all')?.addEventListener('change',function(){
  document.querySelectorAll('.mdv-check').forEach((box)=>{ box.checked=this.checked; });
});
</script>
</body>
</html>
