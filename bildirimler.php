<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/bildirimler.php';

$user=require_login();
$pdo=db();
$role=(string)(auth_effective_role($user)??'');
$canSend=in_array($role,['super_admin','yonetici'],true);
$ready=bd_tables_ready($pdo);

function bdh(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
function bd_importance(string $value): string {
    return match($value){'acil'=>'Acil','onemli'=>'Önemli',default=>'Normal'};
}
function bd_role_text(string $csv): string {
    $map=bd_recipient_roles();
    $labels=[];
    foreach(array_filter(explode(',',$csv)) as $role) if(isset($map[$role])) $labels[]=$map[$role];
    return $labels?implode(', ',$labels):'—';
}

$error='';
$success=trim((string)($_GET['ok']??''));
if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar dene.');
        $action=(string)($_POST['action']??'');
        if($action==='send'){
            if(!$canSend) throw new RuntimeException('Duyuru gönderme yetkin yok.');
            bd_create_manual($pdo,$user,$_POST);
            header('Location: bildirimler.php?ok='.rawurlencode('Duyuru alıcılara gönderildi.'));
            exit;
        }
        if($action==='read'){
            bd_mark_read($pdo,(int)$user['id'],(int)($_POST['duyuru_id']??0));
            header('Location: bildirimler.php');
            exit;
        }
        if($action==='read_all'){
            bd_mark_all_read($pdo,(int)$user['id']);
            header('Location: bildirimler.php?ok='.rawurlencode('Tüm bildirimler okundu olarak işaretlendi.'));
            exit;
        }
        if($action==='archive'){
            if(!$canSend) throw new RuntimeException('Duyuru arşivleme yetkin yok.');
            bd_archive_manual($pdo,$user,(int)($_POST['duyuru_id']??0));
            header('Location: bildirimler.php?ok='.rawurlencode('Duyuru arşivlendi.'));
            exit;
        }
        throw new RuntimeException('Geçersiz işlem.');
    }catch(Throwable $e){
        $error=$e->getMessage();
    }
}

$institutions=$canSend&&$ready?bd_manageable_institutions($pdo,$user):[];
$inbox=$ready?bd_inbox_rows($pdo,(int)$user['id']):[];
$unread=$ready?bd_unread_count($pdo,(int)$user['id']):0;
$sent=$canSend&&$ready?bd_sent_rows($pdo,$user):[];
$home=auth_role_home($user);
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Bildirimler — İlkAdım</title>
<link rel="stylesheet" href="bildirimler.css?v=1.2.39">
</head>
<body>
<div class="bd-shell">
<header class="bd-top">
<a class="bd-brand" href="<?=bdh($home)?>"><span>İA</span><strong>İlkAdım <small>Bildirim Merkezi</small></strong></a>
<div class="bd-top-actions"><span class="bd-count"><?=$unread?> okunmamış</span><a href="<?=bdh($home)?>">Panele dön</a></div>
</header>

<main class="bd-main">
<section class="bd-hero">
<div><span class="bd-kicker">MERKEZİ İLETİŞİM</span><h1>Bildirimler & Duyurular</h1><p>Kurum duyurularını ve öğretmen içerik bildirimlerini tek yerde takip et.</p></div>
<span class="bd-hero-icon">🔔</span>
</section>

<?php if(!$ready):?><div class="bd-alert warn">Bildirim tabloları henüz hazır değil. 1.2.39 migrationı kurulduğunda merkez otomatik açılır.</div><?php endif;?>
<?php if($error!==''):?><div class="bd-alert warn"><?=bdh($error)?></div><?php endif;?>
<?php if($success!==''):?><div class="bd-alert ok"><?=bdh($success)?></div><?php endif;?>

<?php if($ready && $canSend):?>
<section class="bd-card">
<div class="bd-card-head"><div><span class="bd-kicker">YENİ DUYURU</span><h2>Kuruma Gönder</h2></div></div>
<?php if(!$institutions):?><p class="bd-empty">Duyuru gönderebileceğin aktif kurum bulunmuyor.</p><?php else:?>
<form class="bd-form" method="post">
<input type="hidden" name="csrf" value="<?=bdh(csrf_token())?>">
<input type="hidden" name="action" value="send">
<label>Kurum</label>
<select name="kurum_id" required><option value="">Kurum seç</option><?php foreach($institutions as $institution):?><option value="<?=(int)$institution['id']?>"><?=bdh((string)$institution['ad'])?></option><?php endforeach;?></select>
<label>Başlık</label>
<input name="baslik" maxlength="190" required placeholder="Örn. Yarınki etkinlik hakkında">
<label>Mesaj</label>
<textarea name="mesaj" rows="5" maxlength="4000" required placeholder="Duyuru metnini yaz..."></textarea>
<label>Alıcı grupları</label>
<div class="bd-checks">
<?php foreach(bd_recipient_roles() as $value=>$label):?><label><input type="checkbox" name="hedef_roller[]" value="<?=$value?>"> <?=bdh($label)?></label><?php endforeach;?>
</div>
<label>Önem</label>
<select name="onem"><option value="normal">Normal</option><option value="onemli">Önemli</option><option value="acil">Acil</option></select>
<label>Son gösterim tarihi <small>İsteğe bağlı</small></label>
<input type="date" name="son_gosterim_tarihi" min="<?=date('Y-m-d')?>">
<button type="submit">Duyuruyu Gönder</button>
</form>
<?php endif;?>
</section>
<?php endif;?>

<section class="bd-card">
<div class="bd-card-head"><div><span class="bd-kicker">GELEN KUTUSU</span><h2>Bildirimlerim</h2></div>
<?php if($unread>0):?><form method="post"><input type="hidden" name="csrf" value="<?=bdh(csrf_token())?>"><input type="hidden" name="action" value="read_all"><button class="bd-link-button" type="submit">Tümünü okundu yap</button></form><?php endif;?>
</div>
<div class="bd-list">
<?php if(!$inbox):?><div class="bd-empty">Şu anda görüntülenecek bildirim yok.</div><?php endif;?>
<?php foreach($inbox as $item): $isUnread=empty($item['okundu_tarihi']);?>
<article class="bd-item <?=$isUnread?'unread':''?> <?=bdh((string)$item['onem'])?>">
<div class="bd-item-icon"><?=$item['tur']==='sistem'?'⚡':'🔔'?></div>
<div class="bd-item-body">
<div class="bd-item-meta"><span><?=bdh((string)$item['kurum_adi'])?></span><span><?=bdh(bd_importance((string)$item['onem']))?></span><span><?=bdh(date('d.m.Y H:i',strtotime((string)$item['olusturulma_tarihi'])))?></span></div>
<h3><?=bdh((string)$item['baslik'])?></h3>
<p><?=nl2br(bdh((string)$item['mesaj']))?></p>
<small>Gönderen: <?=bdh((string)$item['gonderen_adi'])?></small>
<div class="bd-actions">
<?php if($isUnread):?><form method="post"><input type="hidden" name="csrf" value="<?=bdh(csrf_token())?>"><input type="hidden" name="action" value="read"><input type="hidden" name="duyuru_id" value="<?=(int)$item['id']?>"><button type="submit">Okundu işaretle</button></form><?php endif;?>
<?php if(!empty($item['baglanti'])):?><a href="<?=bdh((string)$item['baglanti'])?>">İlgili bölümü aç →</a><?php endif;?>
</div>
</div>
</article>
<?php endforeach;?>
</div>
</section>

<?php if($ready && $canSend):?>
<section class="bd-card">
<div class="bd-card-head"><div><span class="bd-kicker">GÖNDERİM TAKİBİ</span><h2>Kurum Duyuruları</h2></div><span class="bd-count"><?=count($sent)?></span></div>
<div class="bd-list">
<?php if(!$sent):?><div class="bd-empty">Henüz gönderilmiş duyuru veya sistem bildirimi yok.</div><?php endif;?>
<?php foreach($sent as $item):?>
<article class="bd-item">
<div class="bd-item-icon"><?=$item['tur']==='sistem'?'⚡':'📣'?></div>
<div class="bd-item-body">
<div class="bd-item-meta"><span><?=bdh((string)$item['kurum_adi'])?></span><span><?=bdh((string)$item['gonderen_adi'])?></span><span><?=((int)$item['aktif']===1?'Aktif':'Arşiv')?></span></div>
<h3><?=bdh((string)$item['baslik'])?></h3>
<p><?=bdh(bd_role_text((string)$item['hedef_roller']))?> · <?=(int)$item['okundu_sayisi']?> / <?=(int)$item['alici_sayisi']?> okundu</p>
<?php if($item['tur']==='duyuru' && (int)$item['aktif']===1):?><div class="bd-actions"><form method="post"><input type="hidden" name="csrf" value="<?=bdh(csrf_token())?>"><input type="hidden" name="action" value="archive"><input type="hidden" name="duyuru_id" value="<?=(int)$item['id']?>"><button type="submit">Arşivle</button></form></div><?php endif;?>
</div>
</article>
<?php endforeach;?>
</div>
</section>
<?php endif;?>

<div class="bd-note">Gönderimler kurum üyeliklerinden anlık alıcı snapshot’ı oluşturur. Sonradan kuruma eklenen kullanıcılar geçmiş duyurulara otomatik eklenmez.</div>
</main>
</div>
</body>
</html>
