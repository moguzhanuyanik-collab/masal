<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/destek.php';

$user=require_login();
$pdo=db();
$role=(string)(auth_effective_role($user)??'');
$isAdmin=$role==='super_admin';
if(!$isAdmin && !array_key_exists($role,ds_requester_roles())){
    http_response_code(403);
    exit('Bu hesap destek merkezini kullanamaz.');
}
header('Cache-Control: no-store, max-age=0');

function dsh(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
function ds_label(array $map,string $key): string { return (string)($map[$key]??$key); }
function ds_code(int $id): string { return 'DST-'.str_pad((string)$id,6,'0',STR_PAD_LEFT); }

$error='';
$success=trim((string)($_GET['ok']??''));

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar dene.');
        $action=(string)($_POST['action']??'');

        if($action==='create'){
            if($isAdmin) throw new RuntimeException('Süper Admin bu ekrandan kullanıcı adına talep açmaz.');
            $id=ds_create_ticket($pdo,$user,$_POST);
            header('Location: destek.php?talep_id='.$id.'&ok='.rawurlencode('Destek talebin oluşturuldu.'));
            exit;
        }

        if($action==='user_reply'){
            if($isAdmin) throw new RuntimeException('Geçersiz işlem.');
            $id=max(0,(int)($_POST['talep_id']??0));
            ds_user_reply($pdo,$user,$id,(string)($_POST['mesaj']??''));
            header('Location: destek.php?talep_id='.$id.'&ok='.rawurlencode('Yanıtın destek talebine eklendi.'));
            exit;
        }

        if($action==='admin_reply'){
            if(!$isAdmin) throw new RuntimeException('Süper Admin yetkisi gerekli.');
            $id=max(0,(int)($_POST['talep_id']??0));
            ds_admin_reply($pdo,$user,$id,(string)($_POST['mesaj']??''));
            header('Location: destek.php?talep_id='.$id.'&ok='.rawurlencode('Destek yanıtı kaydedildi.'));
            exit;
        }

        if($action==='admin_status'){
            if(!$isAdmin) throw new RuntimeException('Süper Admin yetkisi gerekli.');
            $id=max(0,(int)($_POST['talep_id']??0));
            ds_admin_set_status($pdo,$user,$id,(string)($_POST['durum']??''));
            header('Location: destek.php?talep_id='.$id.'&ok='.rawurlencode('Destek durumu güncellendi.'));
            exit;
        }

        throw new RuntimeException('Geçersiz işlem.');
    }catch(Throwable $e){
        $error=$e instanceof RuntimeException?$e->getMessage():'Destek işlemi tamamlanamadı.';
    }
}

$ready=ds_tables_ready($pdo);
$institutions=!$isAdmin&&$ready?ds_user_institutions($pdo,$user):[];
$filters=[
    'durum'=>(string)($_GET['durum']??''),
    'oncelik'=>(string)($_GET['oncelik']??''),
    'kategori'=>(string)($_GET['kategori']??''),
    'kurum_id'=>(int)($_GET['kurum_id']??0),
];
$tickets=$ready
    ?($isAdmin?ds_admin_ticket_rows($pdo,$filters):ds_user_ticket_rows($pdo,$user))
    :[];
$summary=$isAdmin&&$ready?ds_admin_summary($pdo):[];
$ticketId=max(0,(int)($_GET['talep_id']??0));
$selected=$ticketId>0&&$ready?ds_ticket_row($pdo,$user,$ticketId):null;
$messages=$selected?ds_ticket_messages($pdo,$ticketId):[];
$home=auth_role_home($user);
?>
<!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Destek Merkezi — İlkAdım</title>
<link rel="stylesheet" href="destek.css?v=1.2.42">
</head>
<body>
<div class="ds-shell">
<header class="ds-topbar">
<a class="ds-brand" href="<?=dsh($home)?>"><span>İA</span><strong>İlkAdım <small>Destek Merkezi</small></strong></a>
<div class="ds-top-actions"><a href="<?=dsh($home)?>">Panele dön</a></div>
</header>

<main class="ds-main">
<section class="ds-hero">
<div><span class="ds-kicker">DESTEK & OPERASYON</span><h1><?=$isAdmin?'Destek Operasyon Merkezi':'Destek Merkezi'?></h1>
<p><?=$isAdmin?'Kurum taleplerini öncelik ve duruma göre yönet, cevapla ve sonuçlandır.':'Teknik, hesap, içerik veya paket konularında destek talebi oluştur ve cevap geçmişini takip et.'?></p></div>
<span class="ds-hero-icon">🎧</span>
</section>

<?php if(!$ready):?><div class="ds-alert warn">Destek tabloları henüz hazır değil. 1.2.42 migrationı kurulduğunda merkez otomatik açılır.</div><?php endif;?>
<?php if($error!==''):?><div class="ds-alert warn"><?=dsh($error)?></div><?php endif;?>
<?php if($success!==''):?><div class="ds-alert ok"><?=dsh($success)?></div><?php endif;?>

<?php if($ready && $isAdmin):?>
<section class="ds-summary">
<div><strong><?=(int)($summary['toplam_acik']??0)?></strong><span>Aktif Talep</span></div>
<div><strong><?=(int)($summary['acil']??0)?></strong><span>Acil</span></div>
<div><strong><?=(int)($summary['inceleniyor']??0)?></strong><span>İnceleniyor</span></div>
<div><strong><?=(int)($summary['kullanici_bekleniyor']??0)?></strong><span>Kullanıcı Bekleniyor</span></div>
<div><strong><?=(int)($summary['cozuldu']??0)?></strong><span>Çözüldü</span></div>
</section>

<section class="ds-card">
<div class="ds-card-head"><div><span class="ds-kicker">FİLTRE</span><h2>Destek Kuyruğu</h2></div><span class="ds-pill"><?=count($tickets)?></span></div>
<form class="ds-filter" method="get">
<select name="durum"><option value="">Tüm durumlar</option><?php foreach(ds_statuses() as $key=>$label):?><option value="<?=$key?>" <?=$filters['durum']===$key?'selected':''?>><?=dsh($label)?></option><?php endforeach;?></select>
<select name="oncelik"><option value="">Tüm öncelikler</option><?php foreach(ds_priorities() as $key=>$label):?><option value="<?=$key?>" <?=$filters['oncelik']===$key?'selected':''?>><?=dsh($label)?></option><?php endforeach;?></select>
<select name="kategori"><option value="">Tüm kategoriler</option><?php foreach(ds_categories() as $key=>$label):?><option value="<?=$key?>" <?=$filters['kategori']===$key?'selected':''?>><?=dsh($label)?></option><?php endforeach;?></select>
<input type="number" min="1" name="kurum_id" value="<?=$filters['kurum_id']>0?(int)$filters['kurum_id']:''?>" placeholder="Kurum ID">
<button type="submit">Filtrele</button><a href="destek.php">Temizle</a>
</form>
</section>
<?php endif;?>

<?php if($ready && !$isAdmin):?>
<section class="ds-card">
<div class="ds-card-head"><div><span class="ds-kicker">YENİ TALEP</span><h2>Destek Talebi Aç</h2></div></div>
<?php if(!$institutions):?>
<div class="ds-empty">Aktif kurum üyeliğin bulunmadığı için yeni destek talebi açılamıyor.</div>
<?php else:?>
<form class="ds-form" method="post">
<input type="hidden" name="csrf" value="<?=dsh(csrf_token())?>">
<input type="hidden" name="action" value="create">
<label>Kurum</label>
<select name="kurum_id" required><option value="">Kurum seç</option><?php foreach($institutions as $institution):?><option value="<?=(int)$institution['id']?>"><?=dsh((string)$institution['ad'])?><?=((int)($institution['aktif']??1)===1?'':' · Pasif kurum')?></option><?php endforeach;?></select>
<label>Kategori</label>
<select name="kategori" required><?php foreach(ds_categories() as $key=>$label):?><option value="<?=$key?>"><?=dsh($label)?></option><?php endforeach;?></select>
<label>Öncelik</label>
<select name="oncelik" required><?php foreach(ds_priorities() as $key=>$label):?><option value="<?=$key?>"><?=dsh($label)?></option><?php endforeach;?></select>
<label>Konu</label>
<input name="konu" minlength="5" maxlength="190" required placeholder="Sorunu kısa şekilde özetle">
<label>Açıklama</label>
<textarea name="mesaj" minlength="10" maxlength="5000" rows="6" required placeholder="Sorunu, gördüğün hata mesajını ve hangi işlem sırasında oluştuğunu yaz."></textarea>
<button type="submit">Destek Talebi Oluştur</button>
</form>
<?php endif;?>
</section>
<?php endif;?>

<section class="ds-card">
<div class="ds-card-head"><div><span class="ds-kicker"><?=$isAdmin?'KUYRUK':'TALEPLERİM'?></span><h2><?=$isAdmin?'Talep Listesi':'Destek Geçmişi'?></h2></div><span class="ds-pill"><?=count($tickets)?></span></div>
<div class="ds-list">
<?php if(!$tickets):?><div class="ds-empty"><?=$isAdmin?'Filtreye uyan destek talebi yok.':'Henüz destek talebin yok.'?></div><?php endif;?>
<?php foreach($tickets as $ticket):?>
<a class="ds-ticket <?=$ticketId===(int)$ticket['id']?'active':''?>" href="destek.php?talep_id=<?=(int)$ticket['id']?><?= $isAdmin?'&durum='.rawurlencode($filters['durum']).'&oncelik='.rawurlencode($filters['oncelik']).'&kategori='.rawurlencode($filters['kategori']).'&kurum_id='.(int)$filters['kurum_id']:'' ?>">
<div class="ds-ticket-icon"><?=((string)$ticket['oncelik']==='acil'?'🚨':((string)$ticket['oncelik']==='onemli'?'⚠️':'🎫'))?></div>
<div class="ds-ticket-body">
<div class="ds-meta">
<span><?=dsh(ds_code((int)$ticket['id']))?></span>
<span><?=dsh((string)$ticket['kurum_adi'])?></span>
<?php if($isAdmin):?><span><?=dsh((string)$ticket['acan_adi'])?> · <?=dsh(ds_label(ds_requester_roles(),(string)$ticket['acani_rolu']))?></span><?php endif;?>
</div>
<strong><?=dsh((string)$ticket['konu'])?></strong>
<small><?=dsh(ds_label(ds_categories(),(string)$ticket['kategori']))?> · <?=dsh(ds_label(ds_priorities(),(string)$ticket['oncelik']))?> · <?=(int)$ticket['mesaj_sayisi']?> mesaj</small>
</div>
<span class="ds-status <?=dsh((string)$ticket['durum'])?>"><?=dsh(ds_label(ds_statuses(),(string)$ticket['durum']))?></span>
</a>
<?php endforeach;?>
</div>
</section>

<?php if($selected):?>
<section class="ds-card" id="talep-detay">
<div class="ds-card-head">
<div><span class="ds-kicker"><?=dsh(ds_code((int)$selected['id']))?></span><h2><?=dsh((string)$selected['konu'])?></h2></div>
<span class="ds-status <?=dsh((string)$selected['durum'])?>"><?=dsh(ds_label(ds_statuses(),(string)$selected['durum']))?></span>
</div>

<div class="ds-ticket-info">
<span><b>Kurum:</b> <?=dsh((string)$selected['kurum_adi'])?></span>
<span><b>Kategori:</b> <?=dsh(ds_label(ds_categories(),(string)$selected['kategori']))?></span>
<span><b>Öncelik:</b> <?=dsh(ds_label(ds_priorities(),(string)$selected['oncelik']))?></span>
<span><b>Açan:</b> <?=dsh((string)$selected['acan_adi'])?></span>
<span><b>Tarih:</b> <?=dsh(date('d.m.Y H:i',strtotime((string)$selected['olusturulma_tarihi'])))?></span>
</div>

<div class="ds-conversation">
<?php foreach($messages as $item): $adminMessage=(string)$item['gonderen_rolu']==='super_admin';?>
<article class="ds-message <?=$adminMessage?'admin':'user'?>">
<div class="ds-message-head"><strong><?=$adminMessage?'İlkAdım Destek':dsh((string)$item['gonderen_adi'])?></strong><span><?=dsh(date('d.m.Y H:i',strtotime((string)$item['olusturulma_tarihi'])))?></span></div>
<p><?=nl2br(dsh((string)$item['mesaj']))?></p>
</article>
<?php endforeach;?>
</div>

<?php if($isAdmin && (string)$selected['durum']!=='kapali'): ?>
<div class="ds-admin-grid">
<form class="ds-form" method="post">
<input type="hidden" name="csrf" value="<?=dsh(csrf_token())?>">
<input type="hidden" name="action" value="admin_reply">
<input type="hidden" name="talep_id" value="<?=(int)$selected['id']?>">
<label>Destek Yanıtı</label>
<textarea name="mesaj" minlength="2" maxlength="5000" rows="5" required placeholder="Kullanıcıya gönderilecek yanıt..."></textarea>
<button type="submit">Yanıtı Gönder</button>
</form>

<form class="ds-form" method="post">
<input type="hidden" name="csrf" value="<?=dsh(csrf_token())?>">
<input type="hidden" name="action" value="admin_status">
<input type="hidden" name="talep_id" value="<?=(int)$selected['id']?>">
<label>Talep Durumu</label>
<select name="durum"><?php foreach(ds_statuses() as $key=>$label):?><option value="<?=$key?>" <?=((string)$selected['durum']===$key?'selected':'')?>><?=dsh($label)?></option><?php endforeach;?></select>
<button type="submit">Durumu Güncelle</button>
</form>
</div>
<?php elseif(!$isAdmin && (string)$selected['durum']!=='kapali'): ?>
<form class="ds-form ds-reply" method="post">
<input type="hidden" name="csrf" value="<?=dsh(csrf_token())?>">
<input type="hidden" name="action" value="user_reply">
<input type="hidden" name="talep_id" value="<?=(int)$selected['id']?>">
<label>Yanıt Ekle</label>
<textarea name="mesaj" minlength="2" maxlength="5000" rows="5" required placeholder="Ek bilgi veya yanıtını yaz..."></textarea>
<button type="submit">Yanıtı Gönder</button>
</form>
<?php else:?>
<div class="ds-alert">Bu destek talebi kapatılmıştır; yeni mesaj eklenemez.</div>
<?php endif;?>
</section>
<?php endif;?>

<div class="ds-note">Destek merkezi bu sürümde metin tabanlıdır. Dosya yükleme özellikle eklenmedi; böylece zararlı dosya, kişisel belge ve depolama riskleri olmadan güvenli destek akışı sağlanır.</div>
</main>
</div>
</body>
</html>
