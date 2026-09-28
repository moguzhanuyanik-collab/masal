<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';

$user=require_role('super_admin');
$pdo=db();
$config=require __DIR__.'/config/app.php';

function sd_h(string $value): string {
    return htmlspecialchars($value,ENT_QUOTES,'UTF-8');
}

function sd_status(bool $ok,string $ready,string $missing): array {
    return ['ok'=>$ok,'label'=>$ok?$ready:$missing];
}

function sd_writable_status(string $path): array {
    if(!is_dir($path)) return sd_status(false,'Yazılabilir','Klasör bulunamadı');
    return sd_status(is_writable($path),'Yazılabilir','Yazma izni yok');
}

$databaseOk=false;
try{
    $databaseOk=(bool)$pdo->query('SELECT 1')->fetchColumn();
}catch(Throwable){}

$ai=is_array($config['ai']??null)?$config['ai']:[];
$aiEnabled=(bool)($ai['enabled']??false);
$aiProvider=trim((string)($ai['provider']??''));
$aiModel=trim((string)($ai['model']??''));
$aiKey=trim((string)($ai['api_key']??''));
$aiOk=$aiEnabled && $aiProvider!=='' && $aiModel!=='' && $aiKey!=='';

$checks=[
    ['name'=>'Veritabanı','detail'=>'MySQL bağlantısı ve basit sorgu','status'=>sd_status($databaseOk,'Hazır','Bağlantı kurulamadı')],
    ['name'=>'PDO MySQL','detail'=>'Veritabanı sürücüsü','status'=>sd_status(extension_loaded('pdo_mysql'),'Yüklü','Eksik')],
    ['name'=>'Mbstring','detail'=>'Türkçe metin işlemleri','status'=>sd_status(extension_loaded('mbstring'),'Yüklü','Eksik')],
    ['name'=>'ZIP','detail'=>'Güncelleme paketlerini açma','status'=>sd_status(extension_loaded('zip'),'Yüklü','Eksik')],
    ['name'=>'GD','detail'=>'Profil fotoğrafı işleme','status'=>sd_status(extension_loaded('gd'),'Yüklü','Eksik')],
    ['name'=>'Storage','detail'=>'Uygulama çalışma verileri','status'=>sd_writable_status(__DIR__.'/storage')],
    ['name'=>'Güncelleme alanı','detail'=>'İndirilen paket ve geçici dosyalar','status'=>sd_writable_status(__DIR__.'/storage/updates')],
    ['name'=>'Yedek alanı','detail'=>'Güncelleme öncesi dosya yedekleri','status'=>sd_writable_status(__DIR__.'/storage/backups')],
    ['name'=>'AdımBot','detail'=>$aiProvider!=='' && $aiModel!==''?$aiProvider.' · '.$aiModel:'Sağlayıcı veya model seçilmedi','status'=>sd_status($aiOk,'Yapılandırıldı',$aiEnabled?'Eksik yapılandırma':'Kapalı')],
];
$readyCount=count(array_filter($checks,static fn(array $check):bool=>(bool)$check['status']['ok']));
$version='—';
$versionFile=__DIR__.'/version.json';
if(is_file($versionFile)){
    $versionData=json_decode((string)file_get_contents($versionFile),true);
    if(is_array($versionData)) $version=(string)($versionData['version']??'—');
}
?><!doctype html><html lang="tr"><head>
<meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Sistem Durumu — İlkAdım</title>
<link rel="stylesheet" href="super-admin.css?v=1.0.72">
</head><body class="sa-subpage"><?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="app-shell"><header class="app-topbar"><a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Sistem Durumu</small></span></a><div class="sa-page-actions"><a class="sa-page-action" href="guncelleme.php" aria-label="Güncellemeler"><svg><use href="#sa-refresh"/></svg></a></div></header>
<main id="screen"><div class="screen-content">
<section class="subpage-intro"><span><svg><use href="#sa-database"/></svg></span><h1>Sistem Durumu</h1><p>Sunucu gereksinimlerini ve kritik yapılandırmaları tek ekranda kontrol edin. Gizli anahtarlar bu sayfada gösterilmez.</p></section>
<section class="sa-section"><div class="sa-section-title"><div><small>GENEL DURUM</small><h2><?=$readyCount?> / <?=count($checks)?> kontrol hazır</h2></div><span class="sa-section-note">v<?=sd_h($version)?></span></div>
<div class="sa-status-list">
<?php foreach($checks as $check): $status=$check['status']; ?>
<div><span class="sa-status-icon"><svg><use href="<?=$status['ok']?'#sa-shield':'#sa-settings'?>"/></svg></span><p><strong><?=sd_h((string)$check['name'])?></strong><small><?=sd_h((string)$check['detail'])?></small></p><?php if($status['ok']):?><b><i></i><?=sd_h((string)$status['label'])?></b><?php else:?><em><?=sd_h((string)$status['label'])?></em><?php endif;?></div>
<?php endforeach; ?>
</div></section>
<p class="little-note">Bu ekran yalnız durum okur; ayarları, veritabanını veya dosyaları değiştirmez.</p>
</div></main>
<nav class="app-nav" aria-label="Süper Admin menüsü"><a href="super-admin.php"><span><svg><use href="#sa-home"/></svg></span>Panel</a><a href="kurumlar.php"><span><svg><use href="#sa-building"/></svg></span>Kurumlar</a><a href="global.php"><span><svg><use href="#sa-users"/></svg></span>Global</a><a href="guncelleme.php"><span><svg><use href="#sa-refresh"/></svg></span>Güncelle</a><a class="active" href="sistem-durum.php"><span><svg><use href="#sa-database"/></svg></span>Durum</a></nav>
</div></body></html>
