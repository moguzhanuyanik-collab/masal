<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/kurum_yonetimi.php';

$user=require_role('super_admin');
$pdo=db();
$message='';
$error='';

$role=(string)($_GET['rol']??'tum');
if(!in_array($role,['tum','ogrenci','veli'],true)) $role='tum';

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız.');
        $action=(string)($_POST['action']??'');
        if($action!=='restore') throw new RuntimeException('Geçersiz işlem.');

        $restoreRole=(string)($_POST['rol']??'');
        $userId=(int)($_POST['kullanici_id']??0);
        ky_restore_global_user($pdo,$user,$restoreRole,$userId);
        $message=$restoreRole==='ogrenci'
            ?'Global öğrenci yeniden aktifleştirildi.'
            :'Global veli yeniden aktifleştirildi.';
    }catch(PDOException $e){
        error_log('[IlkAdim][global-archive-db] '.$e->getMessage());
        $error=$e->getCode()==='23000'
            ?'Hesap aktifleştirilirken benzersiz kayıt kuralı engel oldu.'
            :'Veritabanı işlemi tamamlanamadı.';
    }catch(RuntimeException $e){
        $error=$e->getMessage();
    }catch(Throwable $e){
        error_log('[IlkAdim][global-archive] '.$e->getMessage());
        $error='Arşiv işlemi tamamlanamadı. Lütfen tekrar deneyin.';
    }
}

try{
    $archived=ky_global_archived_users($pdo,$role);
}catch(Throwable $e){
    error_log('[IlkAdim][global-archive-list] '.$e->getMessage());
    $archived=[];
    $error=$error?:'Global arşiv şu anda okunamıyor.';
}

$studentCount=0;
$parentCount=0;
foreach($archived as $row){
    if((string)$row['rol']==='ogrenci') $studentCount++;
    elseif((string)$row['rol']==='veli') $parentCount++;
}
?><!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Global Arşiv — İlkAdım</title>
<link rel="stylesheet" href="super-admin-pages.css?v=1.2.33">
</head>
<body class="sa-subpage">
<?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="app-shell">
<header class="app-topbar">
<a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Yönetim Merkezi</small></span></a>
<div class="sa-page-actions"><a class="sa-page-action" href="super-admin-profil.php" aria-label="Profil"><svg><use href="#sa-user"/></svg></a></div>
</header>

<main id="screen">
<div class="screen-content">
<section class="subpage-intro">
<span><svg><use href="#sa-archive"/></svg></span>
<h1>Global Arşiv</h1>
<p>Pasife alınmış kurumdan bağımsız öğrenci ve veli hesaplarını görüntüle ve güvenli biçimde yeniden aktifleştir.</p>
</section>

<?php if($message):?><div class="role-note"><span><svg><use href="#sa-check"/></svg></span><p><?=ky_h($message)?></p></div><?php endif;?>
<?php if($error):?><div class="role-note"><span><svg><use href="#sa-alert"/></svg></span><p><?=ky_h($error)?></p></div><?php endif;?>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">ÖZET</span><h2>Arşiv Durumu</h2></div></div>
<div class="role-stats">
<div class="role-stat"><span>🗃️</span><strong><?=count($archived)?></strong><small>Filtredeki pasif hesap</small></div>
<div class="role-stat"><span>🎒</span><strong><?=$studentCount?></strong><small>Pasif öğrenci</small></div>
<div class="role-stat"><span>👪</span><strong><?=$parentCount?></strong><small>Pasif veli</small></div>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">FİLTRE</span><h2>Hesap Türü</h2></div></div>
<form class="role-form" method="get">
<label for="rol">Rol</label>
<select class="role-input" id="rol" name="rol">
<option value="tum" <?=$role==='tum'?'selected':''?>>Tüm pasif hesaplar</option>
<option value="ogrenci" <?=$role==='ogrenci'?'selected':''?>>Öğrenciler</option>
<option value="veli" <?=$role==='veli'?'selected':''?>>Veliler</option>
</select>
<button class="role-button" type="submit">Arşivi Göster</button>
</form>
</section>

<section class="role-section">
<div class="sa-data-toolbar">
<div><span class="eyeline">ARŞİV</span><h2>Pasif Global Hesaplar</h2><small><?=count($archived)?> kayıt</small></div>
<div class="sa-data-actions">
<a class="sa-secondary-btn" href="global-ogrenciler.php">Öğrenciler</a>
<a class="sa-secondary-btn" href="global-veliler.php">Veliler</a>
</div>
</div>

<div class="sa-table-card">
<div class="sa-table-scroll">
<table class="sa-data-table">
<thead><tr><th>Hesap</th><th>Rol</th><th>E-posta</th><th>Bağlantı</th><th>Durum</th><th class="sa-actions-col">İşlemler</th></tr></thead>
<tbody>
<?php if(!$archived):?><tr><td colspan="6" class="sa-empty-cell">Bu filtrede pasif global hesap bulunamadı.</td></tr><?php endif;?>
<?php foreach($archived as $row):
    $isStudent=(string)$row['rol']==='ogrenci';
    $displayName=(string)($row['ad']?:$row['ad_soyad']);
    $linked=trim((string)($row['bagli_adlar']??''));
?>
<tr>
<td><strong><?=ky_h($displayName)?></strong><?php if($isStudent):?><small><?=max(1,min(8,(int)($row['sinif_seviyesi']??1)))?>. sınıf</small><?php endif;?></td>
<td><span class="role-pill"><?=$isStudent?'Öğrenci':'Veli'?></span></td>
<td><?=ky_h((string)$row['email'])?></td>
<td><?=ky_h($linked!==''?$linked:($isStudent?'Veli bağlı değil':'Öğrenci bağlı değil'))?></td>
<td><span class="role-pill off"><?=((int)$row['kullanici_aktif']===0 && (int)$row['profil_aktif']===0)?'Pasif':'Durum tutarsız'?></span></td>
<td class="sa-row-actions">
<form method="post" onsubmit="return confirm('Bu global hesap yeniden aktifleştirilsin mi?')">
<input type="hidden" name="csrf" value="<?=ky_h(csrf_token())?>">
<input type="hidden" name="action" value="restore">
<input type="hidden" name="rol" value="<?=ky_h((string)$row['rol'])?>">
<input type="hidden" name="kullanici_id" value="<?=(int)$row['kullanici_id']?>">
<button class="sa-edit-btn" type="submit">Aktifleştir</button>
</form>
</td>
</tr>
<?php endforeach;?>
</tbody>
</table>
</div>
</div>
</section>

<div class="role-note"><span>ℹ️</span><p>Aktifleştirme mevcut global veli–öğrenci eşleştirmelerini silmez. Hesap bir kuruma aktif olarak bağlanmışsa arşivden global hesap olarak geri açılamaz.</p></div>
</div>
</main>

<nav class="app-nav" aria-label="Süper Admin menüsü">
<a href="super-admin.php"><span><svg><use href="#sa-home"/></svg></span>Panel</a>
<a href="kurumlar.php"><span><svg><use href="#sa-building"/></svg></span>Kurumlar</a>
<a class="active" href="global.php"><span><svg><use href="#sa-users"/></svg></span>Global</a>
<a href="yonetici-yetkileri.php"><span><svg><use href="#sa-shield"/></svg></span>Yetkiler</a>
<a href="super-admin-profil.php"><span><svg><use href="#sa-user"/></svg></span>Profil</a>
</nav>
</div>
</body>
</html>
