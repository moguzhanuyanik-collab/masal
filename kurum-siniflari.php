<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/kurum_yonetimi.php';
require __DIR__.'/src/yonetici_yetkileri.php';

$user=require_role(['yonetici','super_admin']);
$pdo=db();
$institutionId=(int)($_REQUEST['kurum_id']??0);
$message='';
$error='';

try{
    $institution=ky_assert_manageable($pdo,$user,$institutionId);
    if(!yy_can($pdo,$user,'kurum_goruntule')) throw new RuntimeException('Kurum görüntüleme izni yok.');
}catch(Throwable){
    http_response_code(403);
    echo 'Bu kurumun sınıf ve gruplarına erişim yetkin yok.';
    exit;
}

$canManage=yy_can($pdo,$user,'ogrenci_yonet');

function ks_h(string $value): string {
    return htmlspecialchars($value,ENT_QUOTES,'UTF-8');
}
function ks_grade_label(?int $grade): string {
    return $grade!==null && $grade>=1 && $grade<=8 ? $grade.'. sınıf' : 'Karma sınıf';
}
function ks_group_type_label(string $type): string {
    return $type==='grup'?'Grup':'Sınıf';
}

function ks_validate_group_input(array $input): array {
    $name=trim((string)($input['ad']??''));
    $type=(string)($input['tur']??'sinif');
    $grade=(int)($input['sinif_seviyesi']??0);

    if(mb_strlen($name)<2 || mb_strlen($name)>120) throw new RuntimeException('Sınıf / grup adını kontrol et.');
    if(!in_array($type,['sinif','grup'],true)) throw new RuntimeException('Geçersiz sınıf / grup türü.');
    if($type==='sinif' && ($grade<1 || $grade>8)) throw new RuntimeException('Sınıf için 1 ile 8 arasında seviye seç.');
    if($type==='grup' && ($grade<0 || $grade>8)) throw new RuntimeException('Grup sınıf seviyesi geçersiz.');

    return [$name,$type,$grade>0?$grade:null];
}

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!$canManage) throw new RuntimeException('Sınıf ve grup düzenlemek için öğrenci yönetimi yetkisi gerekli.');
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız.');

        $action=(string)($_POST['action']??'');

        if($action==='create'){
            [$name,$type,$grade]=ks_validate_group_input($_POST);

            $stmt=$pdo->prepare('INSERT INTO kurum_siniflari (kurum_id,ad,tur,sinif_seviyesi,aktif) VALUES (?,?,?,?,1)');
            $stmt->execute([$institutionId,$name,$type,$grade]);
            $groupId=(int)$pdo->lastInsertId();
            $stmt->closeCursor();

            auth_audit($pdo,(int)$user['id'],null,'kurum_sinif_olustur','Kurum '.$institutionId.' / Sınıf-Grup #'.$groupId.' / '.$type);
            $message=ks_group_type_label($type).' oluşturuldu.';
        }elseif($action==='update'){
            $groupId=(int)($_POST['sinif_id']??0);
            [$name,$type,$grade]=ks_validate_group_input($_POST);

            $stmt=$pdo->prepare('SELECT id FROM kurum_siniflari WHERE id=? AND kurum_id=? LIMIT 1');
            $stmt->execute([$groupId,$institutionId]);
            $exists=(bool)$stmt->fetchColumn();
            $stmt->closeCursor();
            if(!$exists) throw new RuntimeException('Sınıf / grup bulunamadı.');

            if($grade!==null){
                $stmt=$pdo->prepare("SELECT COUNT(*)
                    FROM kurum_sinif_ogrencileri kso
                    INNER JOIN ogrenciler o ON o.id=kso.ogrenci_id
                    WHERE kso.kurum_sinif_id=? AND kso.kurum_id=? AND o.sinif_seviyesi<>?");
                $stmt->execute([$groupId,$institutionId,$grade]);
                $mismatch=(int)($stmt->fetchColumn()?:0);
                $stmt->closeCursor();
                if($mismatch>0){
                    throw new RuntimeException('Yeni sınıf seviyesine uymayan öğrenciler var. Önce bu öğrencileri gruptan çıkar.');
                }
            }

            $stmt=$pdo->prepare('UPDATE kurum_siniflari SET ad=?,tur=?,sinif_seviyesi=? WHERE id=? AND kurum_id=?');
            $stmt->execute([$name,$type,$grade,$groupId,$institutionId]);
            $stmt->closeCursor();

            auth_audit($pdo,(int)$user['id'],null,'kurum_sinif_guncelle','Kurum '.$institutionId.' / Sınıf-Grup #'.$groupId.' / '.$type);
            $message='Sınıf / grup bilgileri güncellendi.';
        }elseif($action==='toggle'){
            $groupId=(int)($_POST['sinif_id']??0);
            $active=(int)($_POST['aktif']??0)===1;

            $stmt=$pdo->prepare('UPDATE kurum_siniflari SET aktif=? WHERE id=? AND kurum_id=?');
            $stmt->execute([$active?1:0,$groupId,$institutionId]);
            $changed=$stmt->rowCount();
            $stmt->closeCursor();
            if($changed<1) throw new RuntimeException('Sınıf / grup bulunamadı veya zaten aynı durumda.');

            auth_audit($pdo,(int)$user['id'],null,$active?'kurum_sinif_aktif':'kurum_sinif_pasif','Kurum '.$institutionId.' / Sınıf-Grup #'.$groupId);
            $message=$active?'Sınıf / grup aktifleştirildi.':'Sınıf / grup pasife alındı.';
        }elseif($action==='members'){
            $groupId=(int)($_POST['sinif_id']??0);
            $posted=$_POST['ogrenciler']??[];
            if(!is_array($posted)) throw new RuntimeException('Öğrenci seçimi geçersiz.');

            $stmt=$pdo->prepare('SELECT id,tur,sinif_seviyesi,aktif FROM kurum_siniflari WHERE id=? AND kurum_id=? LIMIT 1');
            $stmt->execute([$groupId,$institutionId]);
            $group=$stmt->fetch();
            $stmt->closeCursor();
            if(!is_array($group) || (int)$group['aktif']!==1) throw new RuntimeException('Aktif sınıf / grup bulunamadı.');

            $grade=$group['sinif_seviyesi']!==null?(int)$group['sinif_seviyesi']:null;

            $sql="SELECT DISTINCT o.id
                FROM kurum_kullanicilari kk
                INNER JOIN kullanicilar u ON u.id=kk.kullanici_id AND u.aktif=1
                INNER JOIN ogrenciler o ON o.kullanici_id=u.id AND o.aktif=1
                WHERE kk.kurum_id=? AND kk.kurum_rolu='ogrenci' AND kk.aktif=1";
            $params=[$institutionId];
            if($grade!==null){
                $sql.=' AND o.sinif_seviyesi=?';
                $params[]=$grade;
            }
            $stmt=$pdo->prepare($sql);
            $stmt->execute($params);
            $allowedIds=array_map('intval',$stmt->fetchAll(PDO::FETCH_COLUMN)?:[]);
            $stmt->closeCursor();

            $selected=array_values(array_unique(array_filter(array_map('intval',$posted),static fn(int $id):bool=>$id>0)));
            foreach($selected as $studentId){
                if(!in_array($studentId,$allowedIds,true)) throw new RuntimeException('Seçilen öğrencilerden biri bu sınıf / grup için uygun değil.');
            }

            $pdo->beginTransaction();
            try{
                $delete=$pdo->prepare('DELETE FROM kurum_sinif_ogrencileri WHERE kurum_sinif_id=? AND kurum_id=?');
                $delete->execute([$groupId,$institutionId]);
                $delete->closeCursor();

                if($selected){
                    $insert=$pdo->prepare('INSERT INTO kurum_sinif_ogrencileri (kurum_sinif_id,kurum_id,ogrenci_id) VALUES (?,?,?)');
                    foreach($selected as $studentId)$insert->execute([$groupId,$institutionId,$studentId]);
                    $insert->closeCursor();
                }
                $pdo->commit();
            }catch(Throwable $e){
                if($pdo->inTransaction())$pdo->rollBack();
                throw $e;
            }

            auth_audit($pdo,(int)$user['id'],null,'kurum_sinif_uyeleri','Kurum '.$institutionId.' / Sınıf-Grup #'.$groupId.' / '.count($selected).' öğrenci');
            $message='Sınıf / grup öğrencileri güncellendi.';
        }else{
            throw new RuntimeException('Geçersiz işlem.');
        }
    }catch(PDOException $e){
        error_log('[IlkAdim][institution-classes-db] '.$e->getMessage());
        $error=$e->getCode()==='23000'?'Bu kurumda aynı adda sınıf / grup zaten var.':'Veritabanı işlemi tamamlanamadı.';
    }catch(RuntimeException $e){
        $error=$e->getMessage();
    }catch(Throwable $e){
        error_log('[IlkAdim][institution-classes] '.$e->getMessage());
        $error='Sınıf / grup işlemi tamamlanamadı. Lütfen tekrar deneyin.';
    }
}

try{
    $stmt=$pdo->prepare("SELECT ks.id,ks.ad,ks.tur,ks.sinif_seviyesi,ks.aktif,ks.olusturulma_tarihi,
        COUNT(DISTINCT kso.ogrenci_id) ogrenci_sayisi
        FROM kurum_siniflari ks
        LEFT JOIN kurum_sinif_ogrencileri kso
          ON kso.kurum_sinif_id=ks.id AND kso.kurum_id=ks.kurum_id
        WHERE ks.kurum_id=?
        GROUP BY ks.id,ks.ad,ks.tur,ks.sinif_seviyesi,ks.aktif,ks.olusturulma_tarihi
        ORDER BY ks.aktif DESC,COALESCE(ks.sinif_seviyesi,99),ks.tur,ks.ad,ks.id");
    $stmt->execute([$institutionId]);
    $groups=$stmt->fetchAll();
    $stmt->closeCursor();

    $studentStmt=$pdo->prepare("SELECT DISTINCT o.id,o.ad,o.email,o.sinif_seviyesi
        FROM kurum_kullanicilari kk
        INNER JOIN kullanicilar u ON u.id=kk.kullanici_id AND u.aktif=1
        INNER JOIN ogrenciler o ON o.kullanici_id=u.id AND o.aktif=1
        WHERE kk.kurum_id=? AND kk.kurum_rolu='ogrenci' AND kk.aktif=1
        ORDER BY o.sinif_seviyesi,o.ad,o.id");
    $studentStmt->execute([$institutionId]);
    $students=$studentStmt->fetchAll();
    $studentStmt->closeCursor();
}catch(Throwable $e){
    error_log('[IlkAdim][institution-classes-read] '.$e->getMessage());
    http_response_code(503);
    echo 'Sınıf / grup bilgileri şu anda okunamıyor.';
    exit;
}

$groupIds=array_map('intval',array_column($groups,'id'));
$selectedGroupId=(int)($_GET['sinif_id']??0);
if($selectedGroupId>0 && !in_array($selectedGroupId,$groupIds,true))$selectedGroupId=0;
if($selectedGroupId<=0){
    foreach($groups as $group){
        if((int)$group['aktif']===1){$selectedGroupId=(int)$group['id'];break;}
    }
}

$selectedGroup=null;
foreach($groups as $group){
    if((int)$group['id']===$selectedGroupId){$selectedGroup=$group;break;}
}

$selectedMemberIds=[];
if($selectedGroupId>0){
    try{
        $stmt=$pdo->prepare('SELECT ogrenci_id FROM kurum_sinif_ogrencileri WHERE kurum_sinif_id=? AND kurum_id=? ORDER BY ogrenci_id');
        $stmt->execute([$selectedGroupId,$institutionId]);
        $selectedMemberIds=array_map('intval',$stmt->fetchAll(PDO::FETCH_COLUMN)?:[]);
        $stmt->closeCursor();
    }catch(Throwable){
        $selectedMemberIds=[];
    }
}

$eligibleStudents=$students;
if(is_array($selectedGroup) && $selectedGroup['sinif_seviyesi']!==null){
    $selectedGrade=(int)$selectedGroup['sinif_seviyesi'];
    $eligibleStudents=array_values(array_filter(
        $students,
        static fn(array $student):bool=>(int)$student['sinif_seviyesi']===$selectedGrade
    ));
}

$stats=['all'=>count($groups),'active'=>0,'classes'=>0,'groups'=>0,'members'=>0];
$uniqueMemberIds=[];
foreach($groups as $group){
    if((int)$group['aktif']===1)$stats['active']++;
    if((string)$group['tur']==='grup')$stats['groups']++; else $stats['classes']++;
}
try{
    $stmt=$pdo->prepare('SELECT DISTINCT ogrenci_id FROM kurum_sinif_ogrencileri WHERE kurum_id=?');
    $stmt->execute([$institutionId]);
    $uniqueMemberIds=array_map('intval',$stmt->fetchAll(PDO::FETCH_COLUMN)?:[]);
    $stmt->closeCursor();
}catch(Throwable){}
$stats['members']=count($uniqueMemberIds);

$isSuper=auth_user_has_role($user,'super_admin');
$back=$isSuper?'kurum-detay.php?kurum_id='.$institutionId:'yonetici-paneli.php?kurum_id='.$institutionId;
?><!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Sınıflar / Gruplar — <?=ks_h((string)$institution['ad'])?></title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="kurum.css?v=1.2.9">
<link rel="stylesheet" href="kurum-siniflari.css?v=1.2.9">
</head>
<body class="role-page"><div class="role-shell">
<header class="role-topbar">
<a class="role-icon" href="<?=ks_h($back)?>" aria-label="Geri">←</a>
<span class="role-brand"><span>🏷️</span><span><strong>Sınıflar / Gruplar</strong><small><?=ks_h((string)$institution['ad'])?></small></span></span>
<a class="role-icon" href="hesap-guvenligi.php" aria-label="Hesap">⚙️</a>
</header>

<main class="role-content class-group-shell">
<section class="role-hero">
<span class="eyeline">KURUM ORGANİZASYONU</span>
<h1>Sınıf ve çalışma gruplarını düzenle.</h1>
<p>Öğrencileri kurum içinde sınıf veya özel çalışma grupları altında topla. Sınıf seviyesi olan gruplara yalnız aynı seviyedeki öğrenciler atanabilir.</p>
<span class="role-hero-art">🏷️</span>
</section>

<?php if($message!==''):?><div class="role-note"><span>✅</span><p><?=ks_h($message)?></p></div><?php endif;?>
<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=ks_h($error)?></p></div><?php endif;?>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">ÖZET</span><h2>Kurum Yapısı</h2></div></div>
<div class="role-stats">
<div class="role-stat"><span>🏫</span><strong><?=$stats['classes']?></strong><small>Sınıf</small></div>
<div class="role-stat"><span>👥</span><strong><?=$stats['groups']?></strong><small>Grup</small></div>
<div class="role-stat"><span>✅</span><strong><?=$stats['active']?></strong><small>Aktif yapı</small></div>
<div class="role-stat"><span>🎒</span><strong><?=$stats['members']?></strong><small>En az bir grupta öğrenci</small></div>
</div>
</section>

<?php if($canManage):?>
<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">YENİ</span><h2>Sınıf / Grup Oluştur</h2></div></div>
<form class="role-form" method="post">
<input type="hidden" name="csrf" value="<?=ks_h(csrf_token())?>">
<input type="hidden" name="action" value="create">
<input type="hidden" name="kurum_id" value="<?=$institutionId?>">
<label for="ad">Ad</label>
<input class="role-input" id="ad" name="ad" required maxlength="120" placeholder="Örn. 4-A veya Matematik Destek">
<label for="tur">Tür</label>
<select class="role-input" id="tur" name="tur">
<option value="sinif">Sınıf</option>
<option value="grup">Grup</option>
</select>
<label for="sinif-seviyesi">Sınıf seviyesi</label>
<select class="role-input" id="sinif-seviyesi" name="sinif_seviyesi">
<option value="0">Karma / seviye sınırı yok</option>
<?php for($grade=1;$grade<=8;$grade++):?><option value="<?=$grade?>"><?=$grade?>. sınıf</option><?php endfor;?>
</select>
<small class="class-group-help">Sınıf türünde seviye seçmek zorunludur. Grup türünde karma öğrenci seçebilirsin.</small>
<button class="role-button" type="submit">Sınıf / Grup Oluştur</button>
</form>
</section>
<?php endif;?>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">KAYITLAR</span><h2>Sınıflar ve Gruplar</h2></div><span class="role-pill"><?=$stats['all']?></span></div>
<div class="role-list">
<?php if(!$groups):?><div class="role-empty"><span>🏷️</span>Henüz sınıf veya grup oluşturulmadı.</div><?php endif;?>
<?php foreach($groups as $group):?>
<div class="role-row class-group-row">
<span><?=((string)$group['tur']==='grup'?'👥':'🏫')?></span>
<div>
<strong><?=ks_h((string)$group['ad'])?></strong>
<small><?=ks_h(ks_group_type_label((string)$group['tur']))?> · <?=ks_h(ks_grade_label($group['sinif_seviyesi']!==null?(int)$group['sinif_seviyesi']:null))?> · <?=(int)$group['ogrenci_sayisi']?> öğrenci</small>
<div class="class-group-actions">
<?php if((int)$group['aktif']===1):?><a href="kurum-siniflari.php?kurum_id=<?=$institutionId?>&amp;sinif_id=<?=(int)$group['id']?>">Üyeleri düzenle</a><?php endif;?>
<?php if($canManage):?>
<button type="button" class="class-group-edit-btn"
 data-class-edit
 data-id="<?=(int)$group['id']?>"
 data-name="<?=ks_h((string)$group['ad'])?>"
 data-type="<?=ks_h((string)$group['tur'])?>"
 data-grade="<?=$group['sinif_seviyesi']!==null?(int)$group['sinif_seviyesi']:0?>">Düzenle</button>
<form method="post">
<input type="hidden" name="csrf" value="<?=ks_h(csrf_token())?>">
<input type="hidden" name="action" value="toggle">
<input type="hidden" name="kurum_id" value="<?=$institutionId?>">
<input type="hidden" name="sinif_id" value="<?=(int)$group['id']?>">
<input type="hidden" name="aktif" value="<?=((int)$group['aktif']===1?0:1)?>">
<button type="submit"><?=((int)$group['aktif']===1?'Pasife al':'Aktifleştir')?></button>
</form>
<?php endif;?>
</div>
</div>
<span class="role-pill <?=((int)$group['aktif']===1?'ok':'off')?>"><?=((int)$group['aktif']===1?'Aktif':'Pasif')?></span>
</div>
<?php endforeach;?>
</div>
</section>

<?php if($canManage && is_array($selectedGroup) && (int)$selectedGroup['aktif']===1):?>
<section class="role-section" id="uyeler">
<div class="role-section-head"><div><span class="eyeline">ÜYELER</span><h2><?=ks_h((string)$selectedGroup['ad'])?></h2></div><span class="role-pill"><?=count($selectedMemberIds)?></span></div>
<form class="role-form class-member-form" method="post">
<input type="hidden" name="csrf" value="<?=ks_h(csrf_token())?>">
<input type="hidden" name="action" value="members">
<input type="hidden" name="kurum_id" value="<?=$institutionId?>">
<input type="hidden" name="sinif_id" value="<?=(int)$selectedGroup['id']?>">
<p class="class-group-help"><?=ks_h(ks_grade_label($selectedGroup['sinif_seviyesi']!==null?(int)$selectedGroup['sinif_seviyesi']:null))?> için uygun aktif öğrencileri seç.</p>
<div class="class-member-grid">
<?php if(!$eligibleStudents):?><div class="role-empty"><span>🎒</span>Bu sınıf / grup için uygun aktif öğrenci bulunamadı.</div><?php endif;?>
<?php foreach($eligibleStudents as $student):?>
<label class="class-member-option">
<input type="checkbox" name="ogrenciler[]" value="<?=(int)$student['id']?>" <?=in_array((int)$student['id'],$selectedMemberIds,true)?'checked':''?>>
<span><strong><?=ks_h((string)($student['ad']?:$student['email']))?></strong><small><?=(int)$student['sinif_seviyesi']?>. sınıf</small></span>
</label>
<?php endforeach;?>
</div>
<button class="role-button" type="submit">Üyeleri Kaydet</button>
</form>
</section>
<?php endif;?>

<?php if(!$canManage):?><div class="role-note"><span>ℹ️</span><p>Bu sayfayı görüntüleyebilirsin. Sınıf/grup oluşturma ve öğrenci atama için öğrenci yönetimi yetkisi gerekir.</p></div><?php endif;?>
</main>

<dialog class="class-group-edit-dialog" data-class-dialog>
<form class="role-form class-group-edit-form" method="post">
<input type="hidden" name="csrf" value="<?=ks_h(csrf_token())?>">
<input type="hidden" name="action" value="update">
<input type="hidden" name="kurum_id" value="<?=$institutionId?>">
<input type="hidden" name="sinif_id" value="0" data-class-id>
<div class="class-group-dialog-head"><div><span class="eyeline">KAYIT DÜZENLE</span><h2>Sınıf / Grup Bilgileri</h2></div><button type="button" data-class-close aria-label="Kapat">×</button></div>
<label>Ad</label>
<input class="role-input" name="ad" data-class-name required maxlength="120">
<label>Tür</label>
<select class="role-input" name="tur" data-class-type>
<option value="sinif">Sınıf</option>
<option value="grup">Grup</option>
</select>
<label>Sınıf seviyesi</label>
<select class="role-input" name="sinif_seviyesi" data-class-grade>
<option value="0">Karma / seviye sınırı yok</option>
<?php for($grade=1;$grade<=8;$grade++):?><option value="<?=$grade?>"><?=$grade?>. sınıf</option><?php endfor;?>
</select>
<small class="class-group-help">Sınıf türünde seviye zorunludur. Yeni seviye mevcut üyelerle uyuşmuyorsa önce uygun olmayan öğrencileri gruptan çıkar.</small>
<button class="role-button" type="submit">Bilgileri Güncelle</button>
</form>
</dialog>

<nav class="role-bottom">
<a href="kurum-detay.php?kurum_id=<?=$institutionId?>"><span>⌂</span>Kurum</a>
<a href="kurum-icerikleri.php?kurum_id=<?=$institutionId?>"><span>📚</span>İçerikler</a>
<a class="active" href="kurum-siniflari.php?kurum_id=<?=$institutionId?>"><span>🏷️</span>Sınıflar</a>
<a href="kurum-raporlari.php?kurum_id=<?=$institutionId?>"><span>📊</span>Raporlar</a>
</nav>
</div><script src="kurum-siniflari.js?v=1.2.11" defer></script></body></html>
