<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
$user=require_role('super_admin');$pdo=db();$message='';$error='';
function sp_h(string $text):string{return htmlspecialchars($text,ENT_QUOTES,'UTF-8');}
$photoBase=__DIR__.'/storage/profil/'.(int)$user['id'];
try {
    if($_SERVER['REQUEST_METHOD']==='POST'){
        if(!verify_csrf($_POST['csrf']??null))throw new RuntimeException('Güvenlik doğrulaması başarısız.');
        $name=trim((string)($_POST['ad_soyad']??''));
        if(mb_strlen($name)<2 || mb_strlen($name)>190)throw new RuntimeException('Ad soyad 2 ile 190 karakter arasında olmalı.');
        $photo=$_FILES['fotograf']??null;
        if(is_array($photo) && (int)($photo['error']??UPLOAD_ERR_NO_FILE)!==UPLOAD_ERR_NO_FILE){
            if((int)$photo['error']!==UPLOAD_ERR_OK || (int)$photo['size']>5*1024*1024)throw new RuntimeException('Fotoğraf yüklenemedi veya 5 MB sınırını aşıyor.');
            $tmp=(string)($photo['tmp_name']??'');
            if(!is_uploaded_file($tmp))throw new RuntimeException('Geçersiz fotoğraf dosyası.');
            $info=@getimagesize($tmp);$width=(int)($info[0]??0);$height=(int)($info[1]??0);$type=(int)($info[2]??0);
            if($width<1 || $height<1 || $width*$height>12000000 || !in_array($type,[IMAGETYPE_JPEG,IMAGETYPE_PNG,IMAGETYPE_WEBP],true))throw new RuntimeException('JPEG, PNG veya WebP fotoğraf seçin (en fazla 12 MP).');
            if(!extension_loaded('gd'))throw new RuntimeException('Fotoğraf küçültmek için sunucuda GD eklentisi gerekli.');
            $source=match($type){IMAGETYPE_JPEG=>@imagecreatefromjpeg($tmp),IMAGETYPE_PNG=>@imagecreatefrompng($tmp),IMAGETYPE_WEBP=>@imagecreatefromwebp($tmp)};
            if(!$source)throw new RuntimeException('Fotoğraf işlenemedi.');
            $scale=min(1,256/max($width,$height));$targetWidth=max(1,(int)round($width*$scale));$targetHeight=max(1,(int)round($height*$scale));
            $target=imagecreatetruecolor($targetWidth,$targetHeight);
            if(!$target){imagedestroy($source);throw new RuntimeException('Fotoğraf küçültülemedi.');}
            imagealphablending($target,false);imagesavealpha($target,true);
            imagecopyresampled($target,$source,0,0,0,0,$targetWidth,$targetHeight,$width,$height);imagedestroy($source);
            $directory=dirname($photoBase);
            if(!is_dir($directory) && !mkdir($directory,0750,true) && !is_dir($directory))throw new RuntimeException('Fotoğraf klasörü oluşturulamadı.');
            $webp=function_exists('imagewebp');$extension=$webp?'webp':'jpg';
            $tempFile=tempnam($directory,'photo_');
            if($tempFile===false){imagedestroy($target);throw new RuntimeException('Fotoğraf kaydedilemedi.');}
            if(!$webp){$white=imagecreatetruecolor($targetWidth,$targetHeight);imagefill($white,0,0,imagecolorallocate($white,255,255,255));imagecopy($white,$target,0,0,0,0,$targetWidth,$targetHeight);imagedestroy($target);$target=$white;}
            $saved=$webp?imagewebp($target,$tempFile,74):imagejpeg($target,$tempFile,78);
            imagedestroy($target);
            if(!$saved || filesize($tempFile)>150*1024){@unlink($tempFile);throw new RuntimeException('Fotoğraf istenen boyutta kaydedilemedi.');}
            chmod($tempFile,0640);
            if(!rename($tempFile,$photoBase.'.'.$extension)){@unlink($tempFile);throw new RuntimeException('Fotoğraf taşınamadı.');}
            @unlink($photoBase.($webp?'.jpg':'.webp'));
        }
        $pdo->prepare('UPDATE kullanicilar SET ad_soyad=? WHERE id=?')->execute([$name,(int)$user['id']]);
        auth_audit($pdo,(int)$user['id'],(int)$user['id'],'profil_guncelle','Süper admin profili güncellendi');
        $user=auth_fetch_user($pdo,(int)$user['id'])??$user;$message='Profil güncellendi.';
    }
}catch(Throwable $e){$error=$e->getMessage();}
$photoPath=is_file($photoBase.'.webp')?$photoBase.'.webp':(is_file($photoBase.'.jpg')?$photoBase.'.jpg':'');
?><!doctype html><html lang="tr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover"><title>Profil — İlkAdım</title><link rel="stylesheet" href="super-admin-pages.css?v=1.0.61"></head>
<body class="sa-subpage"><?php require __DIR__.'/src/super_admin_icons.php'; ?><div class="app-shell"><header class="app-topbar"><a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Yönetim Merkezi</small></span></a></header><main id="screen"><div class="screen-content"><section class="subpage-intro"><span><svg><use href="#sa-user"/></svg></span><h1>Profilim</h1><p>Görünür adınızı ve profil fotoğrafınızı yönetin.</p></section>
<?php if($message):?><div class="role-note"><p><?=sp_h($message)?></p></div><?php endif;?><?php if($error):?><div class="role-note"><p><?=sp_h($error)?></p></div><?php endif;?>
<form method="post" enctype="multipart/form-data" class="settings-block"><input type="hidden" name="csrf" value="<?=sp_h(csrf_token())?>"><div class="sp-profile-photo"><?php if($photoPath):?><img src="profil-foto.php?v=<?=filemtime($photoPath)?>" width="82" height="82" alt="Profil fotoğrafı"><?php else:?><span><svg><use href="#sa-user"/></svg></span><?php endif;?><div><strong><?=sp_h((string)$user['ad_soyad'])?></strong><small><?=sp_h((string)$user['email'])?></small></div></div>
<label class="field-label" for="profile-name">Ad Soyad</label><input class="text-input" id="profile-name" name="ad_soyad" maxlength="190" required value="<?=sp_h((string)$user['ad_soyad'])?>">
<label class="field-label" for="profile-photo">Profil fotoğrafı</label><input class="text-input" id="profile-photo" type="file" name="fotograf" accept="image/jpeg,image/png,image/webp"><p class="little-note">Fotoğraf en çok 256 piksele küçültülür ve 150 KB sınırında saklanır.</p><button class="button primary full" type="submit">Profili Kaydet</button></form><a class="button soft full" href="hesap-guvenligi.php">E-posta ve Şifre Ayarları</a></div></main>
<nav class="app-nav" aria-label="Süper Admin menüsü"><a href="super-admin.php"><span><svg><use href="#sa-home"/></svg></span>Panel</a><a href="kurumlar.php"><span><svg><use href="#sa-building"/></svg></span>Kurumlar</a><a href="global.php"><span><svg><use href="#sa-users"/></svg></span>Global</a><a href="yonetici-yetkileri.php"><span><svg><use href="#sa-shield"/></svg></span>Yetkiler</a><a class="active" href="super-admin-profil.php"><span><svg><use href="#sa-user"/></svg></span>Profil</a></nav></div></body></html>
