<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/yasal_onay.php';

$user=require_role('super_admin');
$pdo=db();
header('Cache-Control: no-store, max-age=0');

function yab_h(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }

$error='';
$success=trim((string)($_GET['ok']??''));

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar dene.');
        $action=(string)($_POST['action']??'');

        if($action==='create'){
            $id=yl_create_draft($pdo,$user,$_POST);
            header('Location: yasal-belgeler.php?edit='.$id.'&ok='.rawurlencode('Taslak belge oluşturuldu.'));
            exit;
        }
        if($action==='update'){
            $id=max(0,(int)($_POST['belge_id']??0));
            yl_update_draft($pdo,$user,$id,$_POST);
            header('Location: yasal-belgeler.php?edit='.$id.'&ok='.rawurlencode('Taslak güncellendi.'));
            exit;
        }
        if($action==='publish'){
            $id=max(0,(int)($_POST['belge_id']??0));
            if((string)($_POST['publish_confirm']??'')!=='1') throw new RuntimeException('Yayınlama onay kutusunu işaretle.');
            yl_publish($pdo,$user,$id);
            header('Location: yasal-belgeler.php?ok='.rawurlencode('Belge sürümü yayınlandı. Hedeflenen kullanıcılar için onay süreci başladı.'));
            exit;
        }
        if($action==='archive'){
            $id=max(0,(int)($_POST['belge_id']??0));
            yl_archive($pdo,$user,$id);
            header('Location: yasal-belgeler.php?ok='.rawurlencode('Belge arşivlendi.'));
            exit;
        }
        throw new RuntimeException('Geçersiz işlem.');
    }catch(Throwable $e){
        $error=$e instanceof RuntimeException?$e->getMessage():'Yasal belge işlemi tamamlanamadı.';
    }
}

$rows=yl_admin_rows($pdo);
$reports=yl_admin_report($pdo);
$editId=max(0,(int)($_GET['edit']??0));
$edit=$editId>0?yl_document($pdo,$editId):null;
if($edit && (string)$edit['durum']!=='taslak')$edit=null;
$reportId=max(0,(int)($_GET['rapor']??0));
$reportDoc=$reportId>0?yl_document($pdo,$reportId):null;
$reportUsers=$reportDoc?yl_admin_user_report($pdo,$reportId):[];
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
<a class="yl-brand" href="super-admin.php"><span>İA</span><strong>İlkAdım <small>Yasal Belge Merkezi</small></strong></a>
<a class="yl-logout" href="super-admin.php">Panele dön</a>
</header>

<main class="yl-main yl-admin">
<section class="yl-hero">
<div><span class="yl-kicker">VERSİYONLU BELGE YÖNETİMİ</span><h1>Yasal Belgeler & Onaylar</h1>
<p>Metin sürümlerini taslak olarak hazırla, hukuki kontrolden sonra yayınla ve kullanıcı onay durumunu izle.</p></div>
<span class="yl-hero-icon">⚖️</span>
</section>

<div class="yl-alert info"><strong>Hukuki içerik uyarısı:</strong> Bu ekran teknik kayıt ve onay altyapısıdır. KVKK, gizlilik ve kullanım koşulları metinlerinin hukuki doğruluğu ayrıca hukuk danışmanı tarafından doğrulanmalıdır.</div>
<?php if($error!==''):?><div class="yl-alert warn"><?=yab_h($error)?></div><?php endif;?>
<?php if($success!==''):?><div class="yl-alert ok"><?=yab_h($success)?></div><?php endif;?>

<section class="yl-card">
<div class="yl-card-head"><div><span class="yl-kicker"><?=$edit?'TASLAK DÜZENLE':'YENİ SÜRÜM'?></span><h2><?=$edit?'Taslağı Güncelle':'Yeni Belge Taslağı'?></h2></div></div>
<form class="yl-admin-form" method="post">
<input type="hidden" name="csrf" value="<?=yab_h(csrf_token())?>">
<input type="hidden" name="action" value="<?=$edit?'update':'create'?>">
<?php if($edit):?><input type="hidden" name="belge_id" value="<?=(int)$edit['id']?>"><?php endif;?>

<label>Belge türü</label>
<?php if($edit):?>
<input value="<?=yab_h((string)(yl_document_types()[(string)$edit['belge_turu']]??$edit['belge_turu']))?>" disabled>
<input type="hidden" name="belge_turu" value="<?=yab_h((string)$edit['belge_turu'])?>">
<?php else:?>
<select name="belge_turu" required><?php foreach(yl_document_types() as $key=>$label):?><option value="<?=$key?>"><?=yab_h($label)?></option><?php endforeach;?></select>
<?php endif;?>

<label>Sürüm</label>
<input name="surum" maxlength="40" required value="<?=yab_h((string)($edit['surum']??''))?>" placeholder="Örn. 2026.10 veya 1.0">

<label>Başlık</label>
<input name="baslik" maxlength="190" required value="<?=yab_h((string)($edit['baslik']??''))?>" placeholder="Belge başlığı">

<label>Belge metni</label>
<textarea name="icerik" minlength="50" maxlength="60000" rows="18" required placeholder="Hukuk danışmanı tarafından gözden geçirilmiş metni buraya gir."><?=yab_h((string)($edit['icerik']??''))?></textarea>

<label>Hedef roller</label>
<div class="yl-role-grid">
<?php $selectedRoles=$edit?array_filter(explode(',',(string)$edit['hedef_roller'])):['ogrenci','veli','ogretmen','yonetici']; ?>
<?php foreach(yl_target_roles() as $key=>$label):?>
<label class="yl-check"><input type="checkbox" name="hedef_roller[]" value="<?=$key?>" <?=in_array($key,$selectedRoles,true)?'checked':''?>><span><?=yab_h($label)?></span></label>
<?php endforeach;?>
</div>

<label class="yl-check"><input type="checkbox" name="zorunlu" value="1" <?=(!$edit || (int)$edit['zorunlu']===1)?'checked':''?>><span>Bu sürüm hedeflenen roller için zorunlu onay gerektirsin.</span></label>

<label>Yürürlük tarihi <small>Boş bırakılırsa yayınlandığı anda yürürlüğe girer.</small></label>
<input type="date" name="yururluk_tarihi" value="<?=yab_h((string)($edit['yururluk_tarihi']??''))?>">

<button type="submit"><?=$edit?'Taslağı Güncelle':'Taslak Oluştur'?></button>
<?php if($edit):?><a class="yl-secondary-link" href="yasal-belgeler.php">Düzenlemeyi kapat</a><?php endif;?>
</form>
</section>

<section class="yl-card">
<div class="yl-card-head"><div><span class="yl-kicker">BELGELER</span><h2>Sürüm Geçmişi</h2></div><span class="yl-version"><?=count($rows)?></span></div>
<div class="yl-doc-list">
<?php if(!$rows):?><div class="yl-empty">Henüz belge sürümü oluşturulmadı.</div><?php endif;?>
<?php foreach($rows as $row):?>
<article class="yl-doc-row">
<div>
<div class="yl-doc-meta"><span><?=yab_h((string)(yl_document_types()[(string)$row['belge_turu']]??$row['belge_turu']))?></span><span>Sürüm <?=yab_h((string)$row['surum'])?></span><span><?=yab_h((string)$row['durum'])?></span></div>
<strong><?=yab_h((string)$row['baslik'])?></strong>
<small><?=yab_h((string)$row['hedef_roller'])?> · <?=$row['zorunlu']?'Zorunlu':'Bilgilendirme'?> · <?=(int)$row['onay_sayisi']?> onay</small>
</div>
<div class="yl-row-actions">
<?php if((string)$row['durum']==='taslak'):?>
<a href="yasal-belgeler.php?edit=<?=(int)$row['id']?>">Düzenle</a>
<form method="post"><input type="hidden" name="csrf" value="<?=yab_h(csrf_token())?>"><input type="hidden" name="action" value="publish"><input type="hidden" name="belge_id" value="<?=(int)$row['id']?>"><label class="yl-mini-check"><input type="checkbox" name="publish_confirm" value="1" required> Hukuki kontrol tamam</label><button type="submit">Yayınla</button></form>
<?php endif;?>
<?php if(in_array((string)$row['durum'],['taslak','yayinda'],true)):?>
<form method="post"><input type="hidden" name="csrf" value="<?=yab_h(csrf_token())?>"><input type="hidden" name="action" value="archive"><input type="hidden" name="belge_id" value="<?=(int)$row['id']?>"><button type="submit" class="secondary">Arşivle</button></form>
<?php endif;?>
<?php if((string)$row['durum']==='yayinda'):?><a href="yasal-belgeler.php?rapor=<?=(int)$row['id']?>">Onay Raporu</a><?php endif;?>
</div>
</article>
<?php endforeach;?>
</div>
</section>

<section class="yl-card">
<div class="yl-card-head"><div><span class="yl-kicker">ÖZET RAPOR</span><h2>Yayındaki Sürümler</h2></div></div>
<div class="yl-report-grid">
<?php if(!$reports):?><div class="yl-empty">Yayında belge yok.</div><?php endif;?>
<?php foreach($reports as $row):?>
<a href="yasal-belgeler.php?rapor=<?=(int)$row['id']?>" class="yl-report-card">
<strong><?=yab_h((string)$row['baslik'])?></strong>
<span>Sürüm <?=yab_h((string)$row['surum'])?></span>
<div><b><?=(int)$row['onaylayan']?></b> onay · <b><?=(int)$row['bekleyen']?></b> bekleyen · <?=(int)$row['hedef_kullanici']?> hedef</div>
</a>
<?php endforeach;?>
</div>
</section>

<?php if($reportDoc):?>
<section class="yl-card">
<div class="yl-card-head"><div><span class="yl-kicker">DETAYLI RAPOR</span><h2><?=yab_h((string)$reportDoc['baslik'])?> · <?=yab_h((string)$reportDoc['surum'])?></h2></div><a class="yl-secondary-link" href="yasal-belgeler.php">Kapat</a></div>
<div class="yl-table-wrap"><table class="yl-table"><thead><tr><th>Kullanıcı</th><th>E-posta</th><th>Rol</th><th>Durum</th><th>Onay zamanı</th></tr></thead><tbody>
<?php foreach($reportUsers as $row):?>
<tr><td><?=yab_h((string)$row['ad_soyad'])?></td><td><?=yab_h((string)$row['email'])?></td><td><?=yab_h((string)($row['onay_rolu']?:$row['ana_rol']))?></td><td><?=$row['onayli']?'Onaylandı':'Bekliyor'?></td><td><?=!empty($row['onay_tarihi'])?yab_h(date('d.m.Y H:i',strtotime((string)$row['onay_tarihi']))):'—'?></td></tr>
<?php endforeach;?>
</tbody></table></div>
</section>
<?php endif;?>
</main>
</div>
</body>
</html>
