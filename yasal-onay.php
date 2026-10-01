<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/yasal_onay.php';

$user=authenticated_user();
if(!$user){
    header('Location: login.php');
    exit;
}
$pdo=db();
header('Cache-Control: no-store, max-age=0');

function ylh(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }

$error='';
if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar dene.');
        $ids=is_array($_POST['belgeler']??null)?$_POST['belgeler']:[];
        yl_accept($pdo,$user,$ids);
        header('Location: '.auth_role_home($user));
        exit;
    }catch(Throwable $e){
        $error=$e instanceof RuntimeException?$e->getMessage():'Onay işlemi tamamlanamadı.';
    }
}

$pending=yl_pending_documents($pdo,$user);
$history=yl_user_acceptance_rows($pdo,(int)$user['id']);
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Yasal Belgeler — İlkAdım</title>
<link rel="stylesheet" href="yasal.css?v=1.2.43">
</head>
<body>
<div class="yl-shell">
<header class="yl-topbar">
<a class="yl-brand" href="javascript:void(0)"><span>İA</span><strong>İlkAdım <small>Yasal Belgeler</small></strong></a>
<a class="yl-logout" href="logout.php">Çıkış yap</a>
</header>

<main class="yl-main">
<section class="yl-hero">
<div><span class="yl-kicker">AÇIK ONAY</span><h1>Yasal belge onayı</h1>
<p>Devam etmeden önce aşağıdaki güncel belge sürümlerini ayrı ayrı okuyup onaylaman gerekiyor.</p></div>
<span class="yl-hero-icon">📄</span>
</section>

<?php if($error!==''):?><div class="yl-alert warn"><?=ylh($error)?></div><?php endif;?>

<?php if($pending):?>
<form method="post" class="yl-form">
<input type="hidden" name="csrf" value="<?=ylh(csrf_token())?>">
<?php foreach($pending as $doc):?>
<section class="yl-card">
<div class="yl-card-head">
<div><span class="yl-kicker"><?=ylh((string)(yl_document_types()[(string)$doc['belge_turu']]??$doc['belge_turu']))?></span><h2><?=ylh((string)$doc['baslik'])?></h2></div>
<span class="yl-version">Sürüm <?=ylh((string)$doc['surum'])?></span>
</div>
<?php if(!empty($doc['yururluk_tarihi'])):?><div class="yl-date">Yürürlük: <?=ylh(date('d.m.Y',strtotime((string)$doc['yururluk_tarihi'])))?></div><?php endif;?>
<div class="yl-text"><?=nl2br(ylh((string)$doc['icerik']))?></div>
<label class="yl-check">
<input type="checkbox" name="belgeler[]" value="<?=(int)$doc['id']?>" required>
<span>Bu belgeyi okudum ve bu sürümü onaylıyorum.</span>
</label>
</section>
<?php endforeach;?>

<section class="yl-card yl-submit">
<p>Onay sırasında tarih, belge sürümü ve belge bütünlük hash’i kaydedilir. IP adresinin kendisi yerine tek yönlü hash tutulur.</p>
<button type="submit">Belgeleri Onayla ve Devam Et →</button>
<a href="logout.php">Şimdi onaylamak istemiyorum, çıkış yap</a>
</section>
</form>
<?php else:?>
<section class="yl-card">
<h2>Bekleyen zorunlu belge yok</h2>
<p>Hesabın için onay bekleyen güncel zorunlu belge bulunmuyor.</p>
<a class="yl-primary-link" href="<?=ylh(auth_role_home($user))?>">Panele dön →</a>
</section>
<?php endif;?>

<?php if($history):?>
<section class="yl-card">
<div class="yl-card-head"><div><span class="yl-kicker">GEÇMİŞ</span><h2>Onay geçmişim</h2></div></div>
<div class="yl-history">
<?php foreach($history as $row):?>
<div>
<strong><?=ylh((string)$row['baslik'])?></strong>
<span>Sürüm <?=ylh((string)$row['surum'])?> · <?=ylh(date('d.m.Y H:i',strtotime((string)$row['onay_tarihi'])))?></span>
</div>
<?php endforeach;?>
</div>
</section>
<?php endif;?>
</main>
</div>
</body>
</html>
