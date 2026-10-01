<?php
declare(strict_types=1);
if(!isset($kyRole,$kyTitle,$kyIcon,$kyDescription)) throw new RuntimeException('Kurum rol sayfası yapılandırılmadı.');

require __DIR__.'/bootstrap.php';
require __DIR__.'/auth.php';
require __DIR__.'/kurum_yonetimi.php';
require __DIR__.'/yonetici_yetkileri.php';
require __DIR__.'/kurumlar_modulu.php';

$user=require_role(['yonetici','super_admin']);
$pdo=db();
$isSuper=auth_user_has_role($user,'super_admin');
$institutionId=(int)($_REQUEST['kurum_id']??0);
$message='';
$error='';

try{
    $institution=ky_assert_manageable($pdo,$user,$institutionId);
    if($kyRole==='yonetici' && !$isSuper){
        throw new RuntimeException('Kurum yöneticilerini yalnızca Süper Admin yönetebilir.');
    }
    $permission=['ogretmen'=>'ogretmen_yonet','veli'=>'veli_yonet','ogrenci'=>'ogrenci_yonet'][$kyRole]??'';
    if(!$isSuper && ($permission==='' || !yy_can($pdo,$user,$permission))) {
        throw new RuntimeException('Bu bölüm için yönetici izni verilmemiş.');
    }
}catch(Throwable){
    http_response_code(403);
    echo 'Bu kurumu veya bölümü yönetme yetkin yok.';
    exit;
}

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız.');

        $action=(string)($_POST['action']??'create');
        $input=$_POST;
        $input['kurum_id']=$institutionId;

        if($action==='create'){
            km_create_member($pdo,$user,$kyRole,$input);
            $message=$kyTitle.' hesabı kuruma eklendi.';
        }elseif($action==='update'){
            $userId=(int)($_POST['kullanici_id']??0);
            km_update_member($pdo,$user,$kyRole,$userId,$institutionId,$input);
            $message='Kullanıcı bilgileri güncellendi.';
        }elseif($action==='delete'){
            $userId=(int)($_POST['kullanici_id']??0);
            $result=km_delete_member($pdo,$user,$kyRole,$userId,$institutionId);
            $message=$result['account_deactivated']
                ?'Kullanıcı kurumdan çıkarıldı; başka aktif kurum üyeliği olmadığı için hesabı da pasife alındı.'
                :'Kullanıcı bu kurumdan çıkarıldı. Diğer aktif kurum üyelikleri korunuyor.';
        }elseif($action==='restore'){
            $userId=(int)($_POST['kullanici_id']??0);
            km_restore_member($pdo,$user,$kyRole,$userId,$institutionId);
            $message='Kurum üyeliği yeniden aktifleştirildi.';
        }else{
            throw new RuntimeException('Geçersiz işlem.');
        }
    }catch(PDOException $e){
        error_log('[IlkAdim][institution-role-db] '.$e->getMessage());
        $mysqlError=(int)($e->errorInfo[1]??0);
        if($mysqlError===1062 || $e->getCode()==='23000') $error='Bu e-posta veya kurum üyeliği zaten kullanılıyor.';
        else $error='Veritabanı işlemi tamamlanamadı.';
    }catch(RuntimeException $e){
        $error=$e->getMessage();
    }catch(Throwable $e){
        error_log('[IlkAdim][institution-role] '.$e->getMessage());
        $error='Kullanıcı işlemi tamamlanamadı. Lütfen tekrar deneyin.';
    }
}

$members=ky_role_members($pdo,$institutionId,$kyRole,true);
$activeCount=0;
foreach($members as $member){
    if((int)($member['uyelik_aktif']??0)===1 && (int)($member['kullanici_aktif']??0)===1)$activeCount++;
}
?><!doctype html><html lang="tr"><head>
<meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title><?=ky_h($kyTitle)?> — <?=ky_h((string)$institution['ad'])?></title>
<link rel="stylesheet" href="styles.css"><link rel="stylesheet" href="kurum.css?v=1.2.10">
<link rel="stylesheet" href="kurum-rol-crud.css?v=1.2.10">
</head><body class="role-page"><div class="role-shell">
<header class="role-topbar">
<a class="role-icon" href="kurum-detay.php?kurum_id=<?=$institutionId?>">←</a>
<span class="role-brand"><span><?=ky_h($kyIcon)?></span><span><strong><?=ky_h($kyTitle)?></strong><small><?=ky_h((string)$institution['ad'])?></small></span></span>
<a class="role-icon" href="hesap-guvenligi.php">⚙️</a>
</header>
<main class="role-content">
<section class="role-hero"><span class="eyeline">KURUM YÖNETİMİ</span><h1><?=ky_h($kyTitle)?></h1><p><?=ky_h($kyDescription)?></p><span class="role-hero-art"><?=ky_h($kyIcon)?></span></section>

<?php if($message!==''):?><div class="role-note"><span>✅</span><p><?=ky_h($message)?></p></div><?php endif;?>
<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=ky_h($error)?></p></div><?php endif;?>

<section class="role-section"><div class="role-section-head"><div><span class="eyeline">YENİ HESAP</span><h2><?=ky_h($kyTitle)?> Ekle</h2></div></div>
<form class="role-form" method="post" autocomplete="off">
<input type="hidden" name="csrf" value="<?=ky_h(csrf_token())?>">
<input type="hidden" name="action" value="create">
<input type="hidden" name="kurum_id" value="<?=$institutionId?>">
<label>Ad Soyad</label><input class="role-input" name="ad_soyad" required maxlength="190">
<?php if($kyRole==='ogrenci'):?>
<label>Kademe</label><input class="role-input" value="Temel Eğitim" readonly>
<label>Sınıf</label><select class="role-input" name="sinif_seviyesi" required><?php for($g=1;$g<=8;$g++):?><option value="<?=$g?>"><?=$g?>. sınıf</option><?php endfor;?></select>
<?php endif;?>
<?php if(in_array($kyRole,['ogretmen','veli'],true)):?><label>Telefon <small>(isteğe bağlı)</small></label><input class="role-input" name="telefon" maxlength="30" inputmode="tel"><?php endif;?>
<label>E-posta</label><input class="role-input" type="email" name="email" autocomplete="off" autocapitalize="none" spellcheck="false" required>
<label>Geçici şifre</label><input class="role-input" type="password" name="sifre" autocomplete="new-password" minlength="8" required>
<button class="role-button" type="submit"><?=ky_h($kyTitle)?> Hesabı Oluştur</button>
</form></section>

<section class="role-section"><div class="role-section-head"><div><span class="eyeline">KAYITLAR</span><h2><?=ky_h($kyTitle)?> Listesi</h2></div><span class="role-pill"><?=$activeCount?> aktif / <?=count($members)?> kayıt</span></div>
<div class="role-list">
<?php if(!$members):?><div class="role-empty"><span><?=ky_h($kyIcon)?></span>Henüz kayıt yok.</div>
<?php else:foreach($members as $m):
    $membershipActive=(int)($m['uyelik_aktif']??0)===1;
    $accountActive=(int)($m['kullanici_aktif']??0)===1;
    $profileActive=(int)($m['profil_aktif']??$m['kullanici_aktif']??0)===1;
    $active=$membershipActive && $accountActive && $profileActive;
    $name=(string)($m['ad']?:$m['ad_soyad']);
?>
<div class="role-row member-crud-row">
<span><?=ky_h($kyIcon)?></span>
<div>
<strong><?=ky_h($name)?></strong>
<small><?=ky_h((string)$m['email'])?><?=$kyRole==='ogrenci'?' · Temel Eğitim · '.min(8,max(1,(int)($m['sinif_seviyesi']??1))).'. sınıf':''?><?=in_array($kyRole,['ogretmen','veli'],true) && trim((string)($m['telefon']??''))!==''?' · '.ky_h((string)$m['telefon']):''?></small>
<div class="member-crud-actions">
<?php if($active):?>
<button type="button" class="member-edit-btn"
 data-member-edit
 data-id="<?=(int)$m['kullanici_id']?>"
 data-name="<?=ky_h($name)?>"
 data-email="<?=ky_h((string)$m['email'])?>"
 data-phone="<?=ky_h((string)($m['telefon']??''))?>"
 data-grade="<?=min(8,max(1,(int)($m['sinif_seviyesi']??1)))?>">Düzenle</button>
<form method="post" data-member-delete>
<input type="hidden" name="csrf" value="<?=ky_h(csrf_token())?>">
<input type="hidden" name="action" value="delete">
<input type="hidden" name="kurum_id" value="<?=$institutionId?>">
<input type="hidden" name="kullanici_id" value="<?=(int)$m['kullanici_id']?>">
<button type="submit" class="member-danger-btn">Kurumdan çıkar</button>
</form>
<?php else:?>
<form method="post">
<input type="hidden" name="csrf" value="<?=ky_h(csrf_token())?>">
<input type="hidden" name="action" value="restore">
<input type="hidden" name="kurum_id" value="<?=$institutionId?>">
<input type="hidden" name="kullanici_id" value="<?=(int)$m['kullanici_id']?>">
<button type="submit" class="member-restore-btn">Yeniden aktifleştir</button>
</form>
<?php endif;?>
</div>
</div>
<span class="role-pill <?=$active?'ok':'off'?>"><?=$active?'Aktif':'Pasif'?></span>
</div>
<?php endforeach;endif;?>
</div></section>

<div class="role-note"><span>ℹ️</span><p>Kurumdan çıkarma işlemi veriyi fiziksel olarak silmez. Kullanıcının başka aktif kurum üyeliği varsa hesabı açık kalır; yoksa hesap güvenli biçimde pasife alınır ve daha sonra yeniden aktifleştirilebilir.</p></div>
</main>

<dialog class="member-edit-dialog" data-member-dialog>
<form method="post" class="role-form member-edit-form" autocomplete="off">
<input type="hidden" name="csrf" value="<?=ky_h(csrf_token())?>">
<input type="hidden" name="action" value="update">
<input type="hidden" name="kurum_id" value="<?=$institutionId?>">
<input type="hidden" name="kullanici_id" value="0" data-member-id>
<div class="member-dialog-head"><div><span class="eyeline">KAYIT DÜZENLE</span><h2><?=ky_h(rtrim($kyTitle,'ler'))?> Bilgileri</h2></div><button type="button" data-member-close aria-label="Kapat">×</button></div>
<label>Ad Soyad</label><input class="role-input" name="ad_soyad" data-member-name required maxlength="190">
<?php if($kyRole==='ogrenci'):?>
<label>Kademe</label><input class="role-input" value="Temel Eğitim" readonly>
<label>Sınıf</label><select class="role-input" name="sinif_seviyesi" data-member-grade required><?php for($g=1;$g<=8;$g++):?><option value="<?=$g?>"><?=$g?>. sınıf</option><?php endfor;?></select>
<?php endif;?>
<?php if(in_array($kyRole,['ogretmen','veli'],true)):?><label>Telefon <small>(isteğe bağlı)</small></label><input class="role-input" name="telefon" data-member-phone maxlength="30" inputmode="tel"><?php endif;?>
<label>E-posta</label><input class="role-input" type="email" name="email" data-member-email required>
<label>Yeni şifre <small>(isteğe bağlı)</small></label><input class="role-input" type="password" name="sifre" autocomplete="new-password" minlength="8">
<small class="member-help">Şifreyi değiştirmek istemiyorsan boş bırak.</small>
<button class="role-button" type="submit">Bilgileri Güncelle</button>
</form>
</dialog>

<nav class="role-bottom">
<a href="kurum-detay.php?kurum_id=<?=$institutionId?>"><span>⌂</span>Kurum</a>
<a href="kurum-ogretmenleri.php?kurum_id=<?=$institutionId?>"><span>👩‍🏫</span>Öğretmen</a>
<a href="kurum-velileri.php?kurum_id=<?=$institutionId?>"><span>👪</span>Veli</a>
<a href="kurum-ogrencileri.php?kurum_id=<?=$institutionId?>"><span>🎒</span>Öğrenci</a>
</nav>
</div>
<script src="kurum-rol-crud.js?v=1.2.10" defer></script>
</body></html>
