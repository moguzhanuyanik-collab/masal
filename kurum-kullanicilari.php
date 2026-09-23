<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';

$user=require_role(['yonetici','super_admin']);
$pdo=db();
$isSuper=auth_user_has_role($user,'super_admin');
$message='';$error='';

function kk_h(string $v):string{return htmlspecialchars($v,ENT_QUOTES,'UTF-8');}
function kk_profile_id(PDO $pdo,string $table,int $userId):int{
    try{$s=$pdo->prepare("SELECT id FROM {$table} WHERE kullanici_id=? LIMIT 1");$s->execute([$userId]);$id=(int)($s->fetchColumn()?:0);$s->closeCursor();return $id;}catch(Throwable){return 0;}
}
function kk_has_membership(PDO $pdo,int $institutionId,int $userId,string $role):bool{
    return auth_user_in_institution($pdo,$userId,$institutionId,$role);
}
function kk_assert_member(PDO $pdo,int $institutionId,int $userId,string $role):void{
    if(!kk_has_membership($pdo,$institutionId,$userId,$role))throw new RuntimeException('Seçilen kullanıcı bu kurumda ilgili role sahip değil.');
}

$manageable=auth_manageable_institution_ids($pdo,$user);
$selected=(int)($_REQUEST['kurum_id']??($manageable[0]??0));
if($selected<=0 || (!$isSuper && !in_array($selected,$manageable,true))){
    $selected=(int)($manageable[0]??0);
}
if($isSuper && $selected>0 && !in_array($selected,$manageable,true))$selected=(int)($manageable[0]??0);

$institution=null;
if($selected>0){
    try{$s=$pdo->prepare('SELECT id,ad,kod,tur,icerik_kaynagi,aktif FROM kurumlar WHERE id=? AND aktif=1 LIMIT 1');$s->execute([$selected]);$institution=$s->fetch();$s->closeCursor();}catch(Throwable){}
}
if(!$institution && $selected>0)$selected=0;

if($_SERVER['REQUEST_METHOD']==='POST'){
 try{
  if(!verify_csrf($_POST['csrf']??null))throw new RuntimeException('Güvenlik doğrulaması başarısız.');
  if($selected<=0)throw new RuntimeException('Önce bir kurum seç.');
  if(!$isSuper && !in_array($selected,$manageable,true))throw new RuntimeException('Bu kurumu yönetme yetkin yok.');
  $action=(string)($_POST['action']??'');

  if($action==='create_user'){
    $name=trim((string)($_POST['ad_soyad']??''));
    $email=mb_strtolower(trim((string)($_POST['email']??'')));
    $password=(string)($_POST['password']??'');
    $role=(string)($_POST['rol']??'');
    $allowed=$isSuper?['ogrenci','veli','ogretmen','yonetici']:['ogrenci','veli','ogretmen'];
    if(!in_array($role,$allowed,true))throw new RuntimeException('Bu rolü oluşturma yetkin yok.');
    if(mb_strlen($name)<2||mb_strlen($name)>190)throw new RuntimeException('Ad soyad bilgisini kontrol et.');
    if(!filter_var($email,FILTER_VALIDATE_EMAIL))throw new RuntimeException('Geçerli bir e-posta yaz.');
    if(mb_strlen($password)<8)throw new RuntimeException('Şifre en az 8 karakter olmalı.');
    $hash=password_hash($password,PASSWORD_DEFAULT);
    if(!is_string($hash)||$hash==='')throw new RuntimeException('Şifre oluşturulamadı.');

    $pdo->beginTransaction();
    try{
      $s=$pdo->prepare('INSERT INTO kullanicilar (email,sifre_hash,ad_soyad,ana_rol,aktif) VALUES (?,?,?,?,1)');
      $s->execute([$email,$hash,$name,$role]);
      $uid=(int)$pdo->lastInsertId();
      $pdo->prepare('INSERT INTO kullanici_rolleri (kullanici_id,rol) VALUES (?,?)')->execute([$uid,$role]);
      $pdo->prepare('INSERT INTO kurum_kullanicilari (kurum_id,kullanici_id,kurum_rolu,aktif) VALUES (?,?,?,1)')
          ->execute([$selected,$uid,$role==='yonetici'?'yonetici':$role]);

      if($role==='ogrenci'){
        $pdo->prepare("INSERT INTO ogrenciler (kullanici_id,ad,email,sifre_hash,avatar,aktif) VALUES (?,?,?,?,?,1)")
          ->execute([$uid,$name,$email,$hash,'🌞']);
      }elseif($role==='veli'){
        $pdo->prepare('INSERT INTO veliler (kullanici_id,ad_soyad,aktif) VALUES (?,?,1)')->execute([$uid,$name]);
      }elseif($role==='ogretmen'){
        $pdo->prepare('INSERT INTO ogretmenler (kullanici_id,ad_soyad,aktif) VALUES (?,?,1)')->execute([$uid,$name]);
      }
      $pdo->commit();
    }catch(Throwable $e){if($pdo->inTransaction())$pdo->rollBack();throw $e;}
    auth_audit($pdo,(int)$user['id'],$uid,'kurum_kullanici_olustur','Kurum #'.$selected.' Rol: '.$role);
    $message='Kullanıcı kuruma eklendi.';
  }

  if($action==='link_student'){
    $target=(int)($_POST['kullanici_id']??0);
    $student=(int)($_POST['ogrenci_id']??0);
    $role=(string)($_POST['rol']??'');
    if(!in_array($role,['veli','ogretmen'],true))throw new RuntimeException('Geçersiz eşleştirme rolü.');
    kk_assert_member($pdo,$selected,$target,$role);

    $s=$pdo->prepare("SELECT o.id,o.kullanici_id FROM ogrenciler o
      INNER JOIN kurum_kullanicilari kk ON kk.kullanici_id=o.kullanici_id
      WHERE o.id=? AND o.aktif=1 AND kk.kurum_id=? AND kk.kurum_rolu='ogrenci' AND kk.aktif=1 LIMIT 1");
    $s->execute([$student,$selected]);$studentRow=$s->fetch();$s->closeCursor();
    if(!is_array($studentRow))throw new RuntimeException('Öğrenci bu kurumda bulunamadı.');

    if($role==='veli'){
      $profile=kk_profile_id($pdo,'veliler',$target);
      if($profile<=0)throw new RuntimeException('Veli profili bulunamadı.');
      $pdo->prepare('INSERT IGNORE INTO veli_ogrenci (veli_id,ogrenci_id) VALUES (?,?)')->execute([$profile,$student]);
    }else{
      $profile=kk_profile_id($pdo,'ogretmenler',$target);
      if($profile<=0)throw new RuntimeException('Öğretmen profili bulunamadı.');
      $pdo->prepare('INSERT IGNORE INTO ogretmen_ogrenci (ogretmen_id,ogrenci_id) VALUES (?,?)')->execute([$profile,$student]);
    }
    auth_audit($pdo,(int)$user['id'],$target,'kurum_ogrenci_eslestir','Kurum #'.$selected.' Rol: '.$role.' Öğrenci: '.$student);
    $message='Öğrenci eşleştirmesi kaydedildi.';
  }
 }catch(PDOException $e){
   $error=$e->getCode()==='23000'?'Bu e-posta veya kayıt zaten kullanılıyor.':'Veritabanı işlemi tamamlanamadı.';
 }catch(Throwable $e){$error=$e->getMessage();}
}

$institutions=[];
if($manageable){
  $ph=implode(',',array_fill(0,count($manageable),'?'));
  try{$s=$pdo->prepare("SELECT id,ad,tur,icerik_kaynagi FROM kurumlar WHERE aktif=1 AND id IN ($ph) ORDER BY tur='platform' DESC,ad");$s->execute($manageable);$institutions=$s->fetchAll();$s->closeCursor();}catch(Throwable){}
}
$members=[];$students=[];$assignable=[];
if($selected>0){
 try{
  $s=$pdo->prepare("SELECT k.id,k.ad_soyad,k.email,k.aktif,kk.kurum_rolu
    FROM kurum_kullanicilari kk INNER JOIN kullanicilar k ON k.id=kk.kullanici_id
    WHERE kk.kurum_id=? AND kk.aktif=1 ORDER BY FIELD(kk.kurum_rolu,'yonetici','ogretmen','veli','ogrenci'),k.ad_soyad,k.id");
  $s->execute([$selected]);$members=$s->fetchAll();$s->closeCursor();
 }catch(Throwable){}
 try{
  $s=$pdo->prepare("SELECT o.id,o.ad,o.email,k.id kullanici_id
    FROM kurum_kullanicilari kk INNER JOIN kullanicilar k ON k.id=kk.kullanici_id
    INNER JOIN ogrenciler o ON o.kullanici_id=k.id
    WHERE kk.kurum_id=? AND kk.kurum_rolu='ogrenci' AND kk.aktif=1 AND o.aktif=1 ORDER BY o.ad,o.id");
  $s->execute([$selected]);$students=$s->fetchAll();$s->closeCursor();
 }catch(Throwable){}
 $assignable=array_values(array_filter($members,static fn(array $m):bool=>in_array((string)$m['kurum_rolu'],['veli','ogretmen'],true)));
}
?><!doctype html><html lang="tr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Kurum Kullanıcıları — İlkAdım</title><link rel="stylesheet" href="styles.css"><link rel="stylesheet" href="<?= $isSuper?'super-admin.css':'yonetici.css' ?>?v=1.0.40"></head>
<body class="role-page"><div class="role-shell">
<header class="role-topbar"><a class="role-icon" href="<?= $isSuper?'super-admin.php':'yonetici-paneli.php?kurum_id='.$selected ?>">←</a><span class="role-brand"><span>👥</span><span><strong>Kullanıcılar</strong><small>KURUM YÖNETİMİ</small></span></span><a class="role-icon" href="hesap-guvenligi.php">⚙️</a></header>
<main class="role-content">
<section class="role-hero"><span class="eyeline">KURUM KULLANICILARI</span><h1><?=kk_h((string)($institution['ad']??'Kurum seç'))?></h1>
<p><?=kk_h((string)($institution['tur']??''))?> · İçerik kaynağı: <?=kk_h((string)($institution['icerik_kaynagi']??''))?></p><span class="role-hero-art">👥</span></section>

<?php if($message!==''):?><div class="role-note"><span>✅</span><p><?=kk_h($message)?></p></div><?php endif;?>
<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=kk_h($error)?></p></div><?php endif;?>

<?php if(count($institutions)>1):?><section class="role-section"><div class="role-section-head"><div><span class="eyeline">KURUM</span><h2>Kurum Seç</h2></div></div>
<form class="role-form" method="get"><select class="role-input" name="kurum_id" onchange="this.form.submit()"><?php foreach($institutions as $k):?><option value="<?=(int)$k['id']?>" <?=((int)$k['id']===$selected?'selected':'')?>><?=kk_h((string)$k['ad'])?> — <?=kk_h((string)$k['tur'])?></option><?php endforeach;?></select></form></section><?php endif;?>

<?php if($selected>0):?>
<section class="role-section"><div class="role-section-head"><div><span class="eyeline">YENİ HESAP</span><h2>Kuruma Kullanıcı Ekle</h2></div></div>
<form class="role-form" method="post"><input type="hidden" name="csrf" value="<?=kk_h(csrf_token())?>"><input type="hidden" name="action" value="create_user"><input type="hidden" name="kurum_id" value="<?=$selected?>">
<label>Ad Soyad</label><input class="role-input" name="ad_soyad" required maxlength="190">
<label>E-posta</label><input class="role-input" type="email" name="email" required>
<label>Geçici şifre</label><input class="role-input" type="password" name="password" minlength="8" required>
<label>Rol</label><select class="role-input" name="rol" required><option value="ogrenci">Öğrenci</option><option value="veli">Veli</option><option value="ogretmen">Öğretmen</option><?php if($isSuper):?><option value="yonetici">Yönetici</option><?php endif;?></select>
<button class="role-button" type="submit">Hesabı Oluştur</button></form></section>

<section class="role-section"><div class="role-section-head"><div><span class="eyeline">EŞLEŞTİRME</span><h2>Veli / Öğretmen → Öğrenci</h2></div></div>
<?php if(!$assignable||!$students):?><div class="role-list"><div class="role-empty"><span>🔗</span>Eşleştirme için en az bir veli/öğretmen ve bir öğrenci gerekir.</div></div>
<?php else:?><form class="role-form" method="post"><input type="hidden" name="csrf" value="<?=kk_h(csrf_token())?>"><input type="hidden" name="action" value="link_student"><input type="hidden" name="kurum_id" value="<?=$selected?>">
<label>Veli / Öğretmen</label><select class="role-input" name="kullanici_id" required><?php foreach($assignable as $m):?><option value="<?=(int)$m['id']?>"><?=kk_h((string)$m['ad_soyad'])?> — <?=kk_h((string)$m['kurum_rolu'])?></option><?php endforeach;?></select>
<label>Rol</label><select class="role-input" name="rol" required><option value="veli">Veli</option><option value="ogretmen">Öğretmen</option></select>
<label>Öğrenci</label><select class="role-input" name="ogrenci_id" required><?php foreach($students as $st):?><option value="<?=(int)$st['id']?>"><?=kk_h((string)($st['ad']?:$st['email']))?></option><?php endforeach;?></select>
<button class="role-button" type="submit">Eşleştir</button></form><?php endif;?></section>

<section class="role-section"><div class="role-section-head"><div><span class="eyeline">KURUM EKİBİ</span><h2>Kullanıcı Listesi</h2></div></div><div class="role-list">
<?php if(!$members):?><div class="role-empty"><span>👥</span>Henüz kullanıcı yok.</div><?php else:foreach($members as $m):?><div class="role-row"><span><?=match((string)$m['kurum_rolu']){'yonetici'=>'🧑‍💼','ogretmen'=>'👩‍🏫','veli'=>'👪',default=>'🎒'}?></span><div><strong><?=kk_h((string)($m['ad_soyad']?:$m['email']))?></strong><small><?=kk_h((string)$m['email'])?> · <?=kk_h((string)$m['kurum_rolu'])?></small></div><span class="role-pill <?=((int)$m['aktif']===1?'ok':'off')?>"><?=((int)$m['aktif']===1?'Aktif':'Pasif')?></span></div><?php endforeach;endif;?>
</div></section>

<div class="role-note"><span>💡</span><p><?=($institution['icerik_kaynagi']??'sistem')==='sistem'?'Bu kurumun öğrencileri şu anda İlkAdım’ın sistem dersleri ve etkinliklerini kullanır.':'Kurum içerikleri daha sonra ayrıca bağlanacak; mevcut sistem içerikleri şimdilik çalışmaya devam eder.'?></p></div>
<?php endif;?>
</main>
<nav class="role-bottom"><a href="<?= $isSuper?'super-admin.php':'yonetici-paneli.php?kurum_id='.$selected ?>"><span>⌂</span>Panel</a><a class="active" href="kurum-kullanicilari.php?kurum_id=<?=$selected?>"><span>👥</span>Kullanıcılar</a><a href="rol-paneli.php"><span>🛡️</span>Yetkiler</a><a href="logout.php"><span>🚪</span>Çıkış</a></nav>
</div></body></html>