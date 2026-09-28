<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/kurum_yonetimi.php';
require __DIR__.'/src/kurumlar_modulu.php';
require __DIR__.'/src/yonetici_yetkileri.php';

$user=require_role('yonetici');
$pdo=db();
$institutionId=(int)($_POST['kurum_id']??$_GET['kurum_id']??0);
try{
    $institution=ky_assert_manageable($pdo,$user,$institutionId);
    foreach(['kurum_goruntule','ogrenci_yonet','veli_yonet','ogretmen_yonet'] as $permission){
        if(!yy_can($pdo,$user,$permission)) throw new RuntimeException('Bu işlem için yetkiniz yok.');
    }
}catch(Throwable){
    http_response_code(403);
    echo 'Bu kuruma veya eşleştirmelere erişim yetkin yok.';
    exit;
}

$error='';
if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız. Sayfayı yenileyin.');
        $studentId=(int)($_POST['ogrenci_id']??0);
        if($studentId<=0) throw new RuntimeException('Öğrenci seçin.');
        $action=(string)($_POST['action']??'');
        if($action==='save'){
            $parents=$_POST['veli_ids']??[];
            $teachers=$_POST['ogretmen_ids']??[];
            if(!is_array($parents)||!is_array($teachers)) throw new RuntimeException('Eşleştirme seçimi geçersiz.');
            km_save_matching($pdo,$user,$institutionId,$studentId,$parents,$teachers);
        }elseif($action==='delete'){
            km_delete_matching($pdo,$user,$institutionId,$studentId);
        }else{
            throw new RuntimeException('Geçersiz işlem.');
        }
        header('Location: kurum-eslestirmeleri.php?kurum_id='.$institutionId.'&kaydedildi=1',true,303);
        exit;
    }catch(RuntimeException $e){
        $error=$e->getMessage();
    }catch(Throwable){
        $error='Eşleştirme kaydedilemedi. Lütfen tekrar deneyin.';
    }
}
try{
    $rows=km_matching_rows($pdo,$institutionId);
    $options=km_matching_options($pdo,$institutionId);
}catch(Throwable){
    http_response_code(503);
    echo 'Eşleştirmeler şu anda okunamıyor.';
    exit;
}
$parents=$options['veliler'];
$teachers=$options['ogretmenler'];
?><!doctype html><html lang="tr"><head>
<meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Eşleştirmeler — İlkAdım</title>
<link rel="stylesheet" href="styles.css"><link rel="stylesheet" href="kurum.css?v=1.0.41">
</head><body class="role-page"><div class="role-shell">
<header class="role-topbar"><a class="role-icon" href="yonetici-paneli.php?kurum_id=<?=$institutionId?>" aria-label="Yönetici paneline dön">←</a><span class="role-brand"><span>🔗</span><span><strong>Eşleştirmeler</strong><small><?=ky_h((string)$institution['ad'])?></small></span></span></header>
<main class="role-content">
<section class="role-hero"><span class="eyeline">KURUM YÖNETİMİ</span><h1>Öğrenci Eşleştirmeleri</h1><p>Her öğrenciye kurumunuzdaki birden fazla veli ve öğretmen bağlayabilirsiniz. Kaydet düğmesi o öğrencinin mevcut bağlantılarını seçiminizle değiştirir.</p></section>
<?php if(isset($_GET['kaydedildi'])):?><div class="role-note"><span>✓</span><p>Eşleştirme kaydedildi.</p></div><?php endif;?>
<?php if($error!==''):?><div class="role-note"><span>!</span><p><?=ky_h($error)?></p></div><?php endif;?>
<section class="role-section"><div class="role-section-head"><div><span class="eyeline">ÖĞRENCİLER</span><h2>Bağlantıları Yönet</h2></div><span class="role-pill"><?=count($rows)?></span></div>
<?php if(!$rows):?><div class="role-empty">Bu kurumda aktif öğrenci bulunamadı.</div><?php endif;?>
<?php foreach($rows as $row):
    $studentId=(int)$row['ogrenci_id'];
    $selectedParents=array_column($row['veliler'],'id');
    $selectedTeachers=array_column($row['ogretmenler'],'id');
?>
<form method="post" class="role-form" style="margin-bottom:12px">
<input type="hidden" name="csrf" value="<?=ky_h(csrf_token())?>">
<input type="hidden" name="kurum_id" value="<?=$institutionId?>">
<input type="hidden" name="ogrenci_id" value="<?=$studentId?>">
<input type="hidden" name="action" value="save">
<h2><?=ky_h((string)$row['ogrenci_adi'])?></h2>
<label>Veliler</label>
<?php if(!$parents):?><p>Bu kurumda veli yok.</p><?php endif;?>
<?php foreach($parents as $parent):?><label><input type="checkbox" name="veli_ids[]" value="<?=(int)$parent['profil_id']?>" <?=in_array((int)$parent['profil_id'],$selectedParents,true)?'checked':''?>> <?=ky_h((string)$parent['ad'])?></label><?php endforeach;?>
<label>Öğretmenler</label>
<?php if(!$teachers):?><p>Bu kurumda öğretmen yok.</p><?php endif;?>
<?php foreach($teachers as $teacher):?><label><input type="checkbox" name="ogretmen_ids[]" value="<?=(int)$teacher['profil_id']?>" <?=in_array((int)$teacher['profil_id'],$selectedTeachers,true)?'checked':''?>> <?=ky_h((string)$teacher['ad'])?></label><?php endforeach;?>
<button class="role-button" type="submit">Eşleştirmeleri Kaydet</button>
</form>
<?php endforeach;?></section>
</main><nav class="role-bottom"><a href="yonetici-paneli.php?kurum_id=<?=$institutionId?>"><span>⌂</span>Panel</a><a href="kurum-detay.php?kurum_id=<?=$institutionId?>"><span>🏫</span>Kurum</a><a class="active" href="kurum-eslestirmeleri.php?kurum_id=<?=$institutionId?>"><span>🔗</span>Eşleştirme</a><a href="hesap-guvenligi.php"><span>⚙️</span>Hesap</a></nav>
</div></body></html>
