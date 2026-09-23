<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/kurum_yonetimi.php';
$user=require_role('super_admin');$pdo=db();$message='';$error='';
if($_SERVER['REQUEST_METHOD']==='POST'){
 try{
  if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız.');
  $action=(string)($_POST['action']??'');
  if($action==='create'){
   ky_create_user($pdo,$user,'veli',(string)($_POST['ad_soyad']??''),(string)($_POST['email']??''),(string)($_POST['sifre']??''),null);
   $message='Global veli oluşturuldu.';
  }elseif($action==='update'){
   ky_update_global_user($pdo,$user,'veli',(int)($_POST['kullanici_id']??0),(string)($_POST['ad_soyad']??''),(string)($_POST['email']??''),(string)($_POST['sifre']??''));
   $message='Global veli güncellendi.';
  }elseif($action==='delete'){
   ky_deactivate_global_user($pdo,$user,'veli',(int)($_POST['kullanici_id']??0));
   $message='Global veli pasife alındı.';
  }
 }catch(PDOException $e){$error=$e->getCode()==='23000'?'Bu e-posta zaten kullanılıyor.':'Veritabanı işlemi tamamlanamadı.';}catch(Throwable $e){$error=$e->getMessage();}
}
$parents=ky_global_parents($pdo);
?><!doctype html><html lang="tr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover"><title>Global Veliler — İlkAdım</title>
<link rel="stylesheet" href="super-admin-pages.css?v=1.0.64"></head>
<body class="sa-subpage"><?php require __DIR__.'/src/super_admin_icons.php'; ?><div class="app-shell">
<header class="app-topbar"><a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>Yönetim Merkezi</small></span></a><div class="sa-page-actions"><a class="sa-page-action" href="super-admin-profil.php"><svg><use href="#sa-user"/></svg></a></div></header>
<main id="screen"><div class="screen-content">
<section class="subpage-intro"><span><svg><use href="#sa-users"/></svg></span><h1>Global Veliler</h1><p>Kurumdan bağımsız veli hesaplarını tablo üzerinden yönetin.</p></section>
<?php if($message):?><div class="role-note"><span><svg><use href="#sa-check"/></svg></span><p><?=ky_h($message)?></p></div><?php endif;?>
<?php if($error):?><div class="role-note"><span><svg><use href="#sa-alert"/></svg></span><p><?=ky_h($error)?></p></div><?php endif;?>

<section class="role-section">
<div class="sa-data-toolbar"><div><span class="eyeline">VELİLER</span><h2>Global Veli Listesi</h2><small><?=count($parents)?> kayıt</small></div><div class="sa-data-actions"><a class="sa-secondary-btn" href="global-eslestirme.php">Eşleştirme</a><button class="sa-primary-btn" type="button" data-open-create>+ Yeni Veli</button></div></div>
<div class="sa-table-card"><div class="sa-table-scroll"><table class="sa-data-table"><thead><tr><th>Veli</th><th>E-posta</th><th>Öğrenci</th><th>Durum</th><th class="sa-actions-col">İşlemler</th></tr></thead><tbody>
<?php if(!$parents):?><tr><td colspan="5" class="sa-empty-cell">Henüz global veli yok.</td></tr><?php endif;?>
<?php foreach($parents as $p):?><tr>
<td><strong><?=ky_h((string)$p['ad_soyad'])?></strong></td>
<td><?=ky_h((string)$p['email'])?></td>
<td><?=ky_h((string)($p['ogrenci_adlari']?:'Bağlı değil'))?></td>
<td><span class="role-pill ok">Global</span></td>
<td class="sa-row-actions">
<button type="button" class="sa-edit-btn" data-edit data-id="<?=(int)$p['kullanici_id']?>" data-name="<?=ky_h((string)$p['ad_soyad'])?>" data-email="<?=ky_h((string)$p['email'])?>">Güncelle</button>
<form method="post" onsubmit="return confirm('Bu veli pasife alınsın mı?')"><input type="hidden" name="csrf" value="<?=ky_h(csrf_token())?>"><input type="hidden" name="action" value="delete"><input type="hidden" name="kullanici_id" value="<?=(int)$p['kullanici_id']?>"><button class="sa-delete-btn" type="submit">Sil</button></form>
</td></tr><?php endforeach;?>
</tbody></table></div></div>
</section>
</div></main>

<dialog class="sa-data-dialog" id="parentDialog"><form method="post" class="sa-dialog-form" autocomplete="off"><input type="hidden" name="csrf" value="<?=ky_h(csrf_token())?>"><input type="hidden" name="action" id="parentAction" value="create"><input type="hidden" name="kullanici_id" id="parentId" value="0">
<div class="sa-dialog-head"><div><small id="parentEyeline">YENİ KAYIT</small><h3 id="parentTitle">Global Veli Ekle</h3></div><button type="button" data-close>×</button></div>
<div class="sa-dialog-body"><label>Ad Soyad</label><input class="role-input" id="parentName" name="ad_soyad" required maxlength="190"><label>E-posta</label><input class="role-input" id="parentEmail" type="email" name="email" required><label id="parentPasswordLabel">Geçici Şifre</label><input class="role-input" id="parentPassword" type="password" name="sifre" minlength="8"><p class="little-note" id="parentPasswordNote">Yeni hesap için en az 8 karakter.</p></div>
<div class="sa-dialog-actions"><button type="button" class="sa-secondary-btn" data-close>Vazgeç</button><button type="submit" class="sa-primary-btn">Kaydet</button></div></form></dialog>

<nav class="app-nav"><a href="super-admin.php"><span><svg><use href="#sa-home"/></svg></span>Panel</a><a href="kurumlar.php"><span><svg><use href="#sa-building"/></svg></span>Kurumlar</a><a class="active" href="global.php"><span><svg><use href="#sa-users"/></svg></span>Global</a><a href="yonetici-yetkileri.php"><span><svg><use href="#sa-shield"/></svg></span>Yetkiler</a><a href="super-admin-profil.php"><span><svg><use href="#sa-user"/></svg></span>Profil</a></nav>
</div>
<script>
(()=>{const d=document.getElementById('parentDialog'),a=document.getElementById('parentAction'),id=document.getElementById('parentId'),n=document.getElementById('parentName'),e=document.getElementById('parentEmail'),p=document.getElementById('parentPassword'),t=document.getElementById('parentTitle'),ey=document.getElementById('parentEyeline'),pl=document.getElementById('parentPasswordLabel'),pn=document.getElementById('parentPasswordNote');
const openCreate=()=>{a.value='create';id.value='0';n.value='';e.value='';p.value='';p.required=true;t.textContent='Global Veli Ekle';ey.textContent='YENİ KAYIT';pl.textContent='Geçici Şifre';pn.textContent='Yeni hesap için en az 8 karakter.';d.showModal();};
document.querySelector('[data-open-create]')?.addEventListener('click',openCreate);
document.querySelectorAll('[data-edit]').forEach(b=>b.addEventListener('click',()=>{a.value='update';id.value=b.dataset.id||'0';n.value=b.dataset.name||'';e.value=b.dataset.email||'';p.value='';p.required=false;t.textContent='Global Veliyi Güncelle';ey.textContent='KAYIT DÜZENLE';pl.textContent='Yeni Şifre (isteğe bağlı)';pn.textContent='Şifre değişmeyecekse boş bırak.';d.showModal();}));
document.querySelectorAll('[data-close]').forEach(b=>b.addEventListener('click',()=>d.close()));d.addEventListener('click',ev=>{if(ev.target===d)d.close();});})();
</script></body></html>