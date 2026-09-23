<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';

$user=require_role('super_admin');
$pdo=db();
$message='';
$error='';

function kr_h(string $v): string {
    return htmlspecialchars($v,ENT_QUOTES,'UTF-8');
}

function kr_slug(string $v): string {
    $v=mb_strtolower(trim($v),'UTF-8');
    $map=['ç'=>'c','ğ'=>'g','ı'=>'i','ö'=>'o','ş'=>'s','ü'=>'u'];
    $v=strtr($v,$map);
    $v=preg_replace('/[^a-z0-9]+/','-',$v)??'';
    return trim($v,'-');
}

function kr_validate_fields(array $post): array {
    $ad=trim((string)($post['ad']??''));
    $kod=kr_slug((string)($post['kod']??''));
    $tur=(string)($post['tur']??'okul');
    $kaynak=(string)($post['icerik_kaynagi']??'kurum');
    $email=mb_strtolower(trim((string)($post['email']??'')));
    $telefon=trim((string)($post['telefon']??''));
    $adres=trim((string)($post['adres']??''));

    if(mb_strlen($ad)<2 || mb_strlen($ad)>190) throw new RuntimeException('Kurum adını kontrol et.');
    if($kod==='') $kod=kr_slug($ad);
    if($kod==='') throw new RuntimeException('Kurum kodu oluşturulamadı.');
    if(mb_strlen($kod)>80) throw new RuntimeException('Kurum kodu çok uzun.');
    if(!in_array($tur,['okul','kurs','platform'],true)) $tur='okul';
    if(!in_array($kaynak,['sistem','kurum'],true)) $kaynak='kurum';
    if($email!=='' && !filter_var($email,FILTER_VALIDATE_EMAIL)) throw new RuntimeException('Kurum e-posta adresini kontrol et.');
    if(mb_strlen($telefon)>30) throw new RuntimeException('Telefon bilgisi çok uzun.');
    if(mb_strlen($adres)>3000) throw new RuntimeException('Adres bilgisi çok uzun.');

    return [$ad,$kod,$tur,$kaynak,$email,$telefon,$adres];
}

function kr_update_profiles_inactive(PDO $pdo,array $userIds): void {
    if(!$userIds) return;
    $placeholders=implode(',',array_fill(0,count($userIds),'?'));

    foreach(['ogrenciler','veliler','ogretmenler'] as $table){
        if(!auth_runtime_table_exists($pdo,$table)) continue;
        if(!auth_runtime_column_exists($pdo,$table,'kullanici_id') || !auth_runtime_column_exists($pdo,$table,'aktif')) continue;
        $stmt=$pdo->prepare("UPDATE {$table} SET aktif=0 WHERE kullanici_id IN ({$placeholders})");
        $stmt->execute($userIds);
        $stmt->closeCursor();
    }

    if(auth_runtime_table_exists($pdo,'kullanici_oturum_tokenlari')){
        $stmt=$pdo->prepare("DELETE FROM kullanici_oturum_tokenlari WHERE kullanici_id IN ({$placeholders})");
        $stmt->execute($userIds);
        $stmt->closeCursor();
    }

    if(auth_runtime_table_exists($pdo,'ogrenci_oturum_tokenlari') && auth_runtime_table_exists($pdo,'ogrenciler')){
        $stmt=$pdo->prepare("DELETE t FROM ogrenci_oturum_tokenlari t
            INNER JOIN ogrenciler o ON o.id=t.ogrenci_id
            WHERE o.kullanici_id IN ({$placeholders})");
        $stmt->execute($userIds);
        $stmt->closeCursor();
    }
}

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız.');
        $action=(string)($_POST['action']??'');

        if($action==='create'){
            [$ad,$kod,$tur,$kaynak,$email,$telefon,$adres]=kr_validate_fields($_POST);
            $stmt=$pdo->prepare('INSERT INTO kurumlar (kod,ad,tur,icerik_kaynagi,email,telefon,adres,aktif) VALUES (?,?,?,?,?,?,?,1)');
            $stmt->execute([$kod,$ad,$tur,$kaynak,$email!==''?$email:null,$telefon!==''?$telefon:null,$adres!==''?$adres:null]);
            $institutionId=(int)$pdo->lastInsertId();
            $stmt->closeCursor();
            auth_audit($pdo,(int)$user['id'],null,'kurum_olustur','Kurum #'.$institutionId.' '.$ad.' / '.$kod);
            $message='Kurum başarıyla oluşturuldu.';
        }

        if($action==='update'){
            $institutionId=(int)($_POST['kurum_id']??0);
            if($institutionId<=0) throw new RuntimeException('Güncellenecek kurum bulunamadı.');

            $stmt=$pdo->prepare('SELECT id,kod FROM kurumlar WHERE id=? LIMIT 1');
            $stmt->execute([$institutionId]);
            $existing=$stmt->fetch();
            $stmt->closeCursor();
            if(!is_array($existing)) throw new RuntimeException('Kurum bulunamadı.');

            [$ad,$kod,$tur,$kaynak,$email,$telefon,$adres]=kr_validate_fields($_POST);
            if((string)$existing['kod']==='ilkadim'){
                $kod='ilkadim';
                $tur='platform';
                $kaynak='sistem';
            }

            $stmt=$pdo->prepare('UPDATE kurumlar SET kod=?,ad=?,tur=?,icerik_kaynagi=?,email=?,telefon=?,adres=? WHERE id=?');
            $stmt->execute([$kod,$ad,$tur,$kaynak,$email!==''?$email:null,$telefon!==''?$telefon:null,$adres!==''?$adres:null,$institutionId]);
            $stmt->closeCursor();
            auth_audit($pdo,(int)$user['id'],null,'kurum_guncelle','Kurum #'.$institutionId.' '.$ad.' / '.$kod);
            $message='Kurum bilgileri güncellendi.';
        }

        if($action==='disable'){
            $institutionId=(int)($_POST['kurum_id']??0);
            if($institutionId<=0) throw new RuntimeException('Pasife alınacak kurum bulunamadı.');

            $pdo->beginTransaction();
            try{
                $stmt=$pdo->prepare('SELECT id,kod,ad,aktif FROM kurumlar WHERE id=? LIMIT 1 FOR UPDATE');
                $stmt->execute([$institutionId]);
                $institution=$stmt->fetch();
                $stmt->closeCursor();

                if(!is_array($institution)) throw new RuntimeException('Kurum bulunamadı.');
                if((string)$institution['kod']==='ilkadim') throw new RuntimeException('İlkAdım sistem kurumu pasife alınamaz.');
                if((int)$institution['aktif']!==1) throw new RuntimeException('Kurum zaten pasif.');

                $stmt=$pdo->prepare('SELECT DISTINCT kullanici_id FROM kurum_kullanicilari WHERE kurum_id=? AND kullanici_id IS NOT NULL');
                $stmt->execute([$institutionId]);
                $institutionUserIds=array_values(array_filter(array_map('intval',$stmt->fetchAll(PDO::FETCH_COLUMN)?:[]),static fn(int $id):bool=>$id>0));
                $stmt->closeCursor();

                $stmt=$pdo->prepare('UPDATE kurumlar SET aktif=0 WHERE id=?');
                $stmt->execute([$institutionId]);
                $stmt->closeCursor();

                $stmt=$pdo->prepare('UPDATE kurum_kullanicilari SET aktif=0 WHERE kurum_id=?');
                $stmt->execute([$institutionId]);
                $stmt->closeCursor();

                $deactivatedUserIds=[];
                if($institutionUserIds){
                    $placeholders=implode(',',array_fill(0,count($institutionUserIds),'?'));
                    $stmt=$pdo->prepare("SELECT k.id
                        FROM kullanicilar k
                        WHERE k.id IN ({$placeholders})
                          AND NOT EXISTS (
                            SELECT 1
                            FROM kurum_kullanicilari kk2
                            INNER JOIN kurumlar k2 ON k2.id=kk2.kurum_id
                            WHERE kk2.kullanici_id=k.id
                              AND kk2.aktif=1
                              AND k2.aktif=1
                          )
                          AND NOT EXISTS (
                            SELECT 1 FROM kullanici_rolleri r2
                            WHERE r2.kullanici_id=k.id AND r2.rol='super_admin'
                          )");
                    $stmt->execute($institutionUserIds);
                    $deactivatedUserIds=array_values(array_filter(array_map('intval',$stmt->fetchAll(PDO::FETCH_COLUMN)?:[]),static fn(int $id):bool=>$id>0));
                    $stmt->closeCursor();

                    if($deactivatedUserIds){
                        $userPlaceholders=implode(',',array_fill(0,count($deactivatedUserIds),'?'));
                        $stmt=$pdo->prepare("UPDATE kullanicilar SET aktif=0 WHERE id IN ({$userPlaceholders})");
                        $stmt->execute($deactivatedUserIds);
                        $stmt->closeCursor();
                        kr_update_profiles_inactive($pdo,$deactivatedUserIds);
                    }
                }

                $pdo->commit();
                auth_audit(
                    $pdo,
                    (int)$user['id'],
                    null,
                    'kurum_pasife_al',
                    'Kurum #'.$institutionId.' '.(string)$institution['ad'].' · kurum üyeliği '.count($institutionUserIds).' · hesap pasif '.count($deactivatedUserIds)
                );
                $message='Kurum pasife alındı. '.count($deactivatedUserIds).' kullanıcı hesabı da pasife çekildi.';
            }catch(Throwable $e){
                if($pdo->inTransaction()) $pdo->rollBack();
                throw $e;
            }
        }
    }catch(PDOException $e){
        $error=$e->getCode()==='23000'
            ? 'Bu kurum kodu başka bir kurumda kullanılıyor.'
            : 'Kurum işlemi tamamlanamadı.';
    }catch(Throwable $e){
        $error=$e->getMessage();
    }
}

$kurumlar=[];
try{
    $stmt=$pdo->query("SELECT k.*,
        COUNT(DISTINCT CASE WHEN kk.kurum_rolu='yonetici' THEN kk.kullanici_id END) yonetici_sayisi,
        COUNT(DISTINCT CASE WHEN kk.kurum_rolu='ogretmen' THEN kk.kullanici_id END) ogretmen_sayisi,
        COUNT(DISTINCT CASE WHEN kk.kurum_rolu='veli' THEN kk.kullanici_id END) veli_sayisi,
        COUNT(DISTINCT CASE WHEN kk.kurum_rolu='ogrenci' THEN kk.kullanici_id END) ogrenci_sayisi
        FROM kurumlar k
        LEFT JOIN kurum_kullanicilari kk ON kk.kurum_id=k.id
        GROUP BY k.id
        ORDER BY k.aktif DESC,(k.kod='ilkadim') DESC,k.ad");
    $kurumlar=$stmt?$stmt->fetchAll():[];
    if($stmt) $stmt->closeCursor();
}catch(Throwable $e){
    if($error==='') $error='Kurum listesi yüklenemedi.';
}
?><!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Kurumlar — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="kurum.css?v=1.0.41">
<link rel="stylesheet" href="kurumlar-ui.css?v=1.0.47">
<script src="kurumlar-ui.js?v=1.0.47" defer></script>
</head>
<body class="role-page">
<div class="role-shell">
<header class="role-topbar">
<a class="role-icon" href="super-admin.php">←</a>
<span class="role-brand"><span>🏫</span><span><strong>Kurumlar</strong><small>İLKADIM YÖNETİMİ</small></span></span>
<a class="role-icon" href="hesap-guvenligi.php">👑</a>
</header>

<main class="role-content">
<?php if($message!==''):?><div class="role-note"><span>✅</span><p><?=kr_h($message)?></p></div><?php endif;?>
<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=kr_h($error)?></p></div><?php endif;?>

<div class="institutions-toolbar">
<div class="title-wrap"><span class="eyeline">KURUM YÖNETİMİ</span><h1>Kurum Listesi</h1></div>
<button type="button" class="institutions-add" data-institution-create>＋ Yeni Kurum Ekle</button>
</div>

<section class="institutions-card">
<div class="institutions-table-wrap">
<table class="institutions-table">
<thead>
<tr>
<th>Kurum</th>
<th>Tür</th>
<th>İçerik</th>
<th>Kullanıcılar</th>
<th>Durum</th>
<th style="text-align:right">İşlemler</th>
</tr>
</thead>
<tbody>
<?php if(!$kurumlar):?>
<tr><td colspan="6"><div class="institutions-empty"><span>🏫</span>Henüz kurum bulunmuyor.</div></td></tr>
<?php else: foreach($kurumlar as $k):
    $isSystem=(string)$k['kod']==='ilkadim';
    $isActive=(int)$k['aktif']===1;
?>
<tr>
<td>
<div class="institution-name">
<span class="institution-avatar"><?=$isSystem?'🌞':'🏫'?></span>
<div><strong><?=kr_h((string)$k['ad'])?></strong><small><?=kr_h((string)$k['kod'])?><?=!empty($k['email'])?' · '.kr_h((string)$k['email']):''?></small></div>
</div>
</td>
<td><?=kr_h(ucfirst((string)$k['tur']))?></td>
<td><span class="role-pill"><?=kr_h((string)$k['icerik_kaynagi'])?></span></td>
<td>
<div class="institution-users">
<span>Yön. <?= (int)$k['yonetici_sayisi']?></span>
<span>Öğrt. <?= (int)$k['ogretmen_sayisi']?></span>
<span>Veli <?= (int)$k['veli_sayisi']?></span>
<span>Öğr. <?= (int)$k['ogrenci_sayisi']?></span>
</div>
</td>
<td><span class="role-pill <?=$isActive?'ok':'off'?>"><?=$isActive?'Aktif':'Pasif'?></span></td>
<td>
<div class="institution-actions">
<?php if($isActive):?><a class="institution-action primary" href="kurum-detay.php?kurum_id=<?=(int)$k['id']?>">Aç</a><?php endif;?>
<button
 type="button"
 class="institution-action"
 data-institution-edit
 data-id="<?=(int)$k['id']?>"
 data-ad="<?=kr_h((string)$k['ad'])?>"
 data-kod="<?=kr_h((string)$k['kod'])?>"
 data-tur="<?=kr_h((string)$k['tur'])?>"
 data-icerik_kaynagi="<?=kr_h((string)$k['icerik_kaynagi'])?>"
 data-email="<?=kr_h((string)($k['email']??''))?>"
 data-telefon="<?=kr_h((string)($k['telefon']??''))?>"
 data-adres="<?=kr_h((string)($k['adres']??''))?>"
>Düzenle</button>
<?php if($isActive && !$isSystem):?>
<form method="post">
<input type="hidden" name="csrf" value="<?=kr_h(csrf_token())?>">
<input type="hidden" name="action" value="disable">
<input type="hidden" name="kurum_id" value="<?=(int)$k['id']?>">
<button type="submit" class="institution-action danger" data-institution-disable data-name="<?=kr_h((string)$k['ad'])?>">Pasife Al</button>
</form>
<?php elseif($isSystem):?>
<button type="button" class="institution-action" disabled>Sistem</button>
<?php endif;?>
</div>
</td>
</tr>
<?php endforeach; endif;?>
</tbody>
</table>
</div>
</section>

<div class="role-note"><span>ℹ️</span><p>Kurum pasife alındığında kurumdaki tüm üyelikler kapatılır. Başka aktif kurumu olmayan kullanıcı hesapları da pasif olur. Başka aktif kurumda çalışan kullanıcıların hesabı açık kalır.</p></div>
</main>

<nav class="role-bottom">
<a href="super-admin.php"><span>⌂</span>Panel</a>
<a class="active" href="kurumlar.php"><span>🏫</span>Kurumlar</a>
<a href="global-ogrenciler.php"><span>🎒</span>Öğrenciler</a>
<a href="global-veliler.php"><span>👪</span>Veliler</a>
</nav>
</div>

<dialog class="institution-dialog" id="institution-dialog">
<form method="post" id="institution-form">
<div class="institution-dialog-head">
<strong id="institution-dialog-title">Yeni Kurum Ekle</strong>
<button type="button" class="institution-dialog-close" data-institution-close aria-label="Kapat">×</button>
</div>
<div class="institution-dialog-body">
<input type="hidden" name="csrf" value="<?=kr_h(csrf_token())?>">
<input type="hidden" name="action" value="create">
<input type="hidden" name="kurum_id" value="0">

<label>Kurum adı</label>
<input class="role-input" name="ad" required maxlength="190" placeholder="Örnek Koleji">

<div class="institution-dialog-grid">
<div><label>Kurum kodu</label><input class="role-input" name="kod" maxlength="80" placeholder="Otomatik oluşabilir"></div>
<div><label>Tür</label><select class="role-input" name="tur"><option value="okul">Okul</option><option value="kurs">Kurs</option><option value="platform">Platform</option></select></div>
</div>

<label>İçerik kaynağı</label>
<select class="role-input" name="icerik_kaynagi"><option value="kurum">Kurum içeriği</option><option value="sistem">İlkAdım sistem içeriği</option></select>

<div class="institution-dialog-grid">
<div><label>E-posta</label><input class="role-input" type="email" name="email" maxlength="190" placeholder="kurum@ornek.com"></div>
<div><label>Telefon</label><input class="role-input" name="telefon" maxlength="30" placeholder="0 5xx xxx xx xx"></div>
</div>

<label>Adres</label>
<textarea class="role-input" name="adres" maxlength="3000" placeholder="Kurum adresi"></textarea>

<div class="institution-status-note">Kurum ekleme ve güncelleme bu pencereden yapılır. İlkAdım sistem kurumunun kodu, türü ve içerik kaynağı korunur.</div>
<div class="institution-dialog-actions">
<button type="button" class="institution-secondary" data-institution-close>Vazgeç</button>
<button type="submit" class="role-button">Kaydet</button>
</div>
</div>
</form>
</dialog>
</body>
</html>
