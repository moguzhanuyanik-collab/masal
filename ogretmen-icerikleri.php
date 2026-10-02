<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/ogretmen_icerik.php';

$user=require_role('ogretmen');
$pdo=db();
$teacher=oi_teacher_profile($pdo,(int)$user['id']);
if(!$teacher){
    http_response_code(403);
    echo 'Öğretmen profili bulunamadı.';
    exit;
}

$message='';
$error='';
$editContentId=max(0,(int)($_GET['duzenle']??0));

$institutions=oi_teacher_institutions($pdo,(int)$user['id']);
$institutionIds=array_map('intval',array_column($institutions,'id'));
$selectedInstitutionId=(int)($_POST['kurum_id']??$_GET['kurum_id']??($institutionIds[0]??0));
if($selectedInstitutionId>0 && !in_array($selectedInstitutionId,$institutionIds,true)){
    $selectedInstitutionId=(int)($institutionIds[0]??0);
}

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız.');
        $action=(string)($_POST['action']??'');

        if($action==='create'){
            $targets=$_POST['hedef_ogrenciler']??[];
            if(!is_array($targets)) $targets=[];
            oi_create_content($pdo,$user,$_POST,$targets);
            $message='İçerik yayınlandı. Öğrenciler bunu Öğretmenim bölümünde görecek.';
        }elseif($action==='update'){
            $editContentId=(int)($_POST['icerik_id']??0);
            $targets=$_POST['hedef_ogrenciler']??[];
            if(!is_array($targets)) $targets=[];
            oi_update_content($pdo,$user,$editContentId,$_POST,$targets);
            $message='İçerik güncellendi.';
        }elseif($action==='copy'){
            $sourceId=(int)($_POST['icerik_id']??0);
            $editContentId=oi_duplicate_content($pdo,$user,$sourceId);
            $message='İçerik pasif bir kopya olarak oluşturuldu. Düzenleyip hazır olduğunda aktifleştirebilirsin.';
        }elseif($action==='toggle'){
            $contentId=(int)($_POST['icerik_id']??0);
            $active=(int)($_POST['aktif']??0)===1;
            oi_set_content_active($pdo,$user,$contentId,$active);
            $message=$active?'İçerik yeniden aktifleştirildi.':'İçerik pasife alındı.';
        }else{
            throw new RuntimeException('Geçersiz içerik işlemi.');
        }
    }catch(PDOException $e){
        error_log('[IlkAdim][teacher-content-db] '.$e->getMessage());
        $error='İçerik işlemi veritabanında tamamlanamadı.';
    }catch(RuntimeException $e){
        $error=$e->getMessage();
    }catch(Throwable $e){
        error_log('[IlkAdim][teacher-content] '.$e->getMessage());
        $error='İçerik işlemi tamamlanamadı. Lütfen tekrar deneyin.';
    }
}

$editContent=null;
if($editContentId>0){
    try{
        $editContent=oi_teacher_content_for_edit($pdo,$user,$editContentId);
        if(!$editContent && $error==='') $error='Düzenlenecek içerik bulunamadı.';
        if(is_array($editContent)){
            $editInstitutionId=(int)$editContent['kurum_id'];
            if(in_array($editInstitutionId,$institutionIds,true)) $selectedInstitutionId=$editInstitutionId;
        }
    }catch(Throwable $e){
        error_log('[IlkAdim][teacher-content-edit-open] '.$e->getMessage());
        $editContent=null;
        if($error==='') $error='Düzenlenecek içerik şu anda yüklenemedi. Liste görünümünden devam edebilirsin.';
    }
}

$lessons=oi_lessons($pdo);
$modules=oi_modules($pdo);
$students=$selectedInstitutionId>0
    ?oi_teacher_students($pdo,(int)$teacher['id'],$selectedInstitutionId)
    :[];
$targetGroups=$selectedInstitutionId>0
    ?oi_teacher_target_groups($pdo,(int)$teacher['id'],$selectedInstitutionId)
    :[];
$contents=oi_teacher_contents($pdo,(int)$teacher['id']);
$types=oi_content_types();

$editOptions=[];
$editTargets=[];
$editGroups=[];
$editDue='';
$editLocked=false;
if(is_array($editContent)){
    $decoded=json_decode((string)($editContent['secenekler_json']??''),true);
    if(is_array($decoded)) $editOptions=array_values(array_map('strval',$decoded));
    while(count($editOptions)<6) $editOptions[]='';
    $editOptions=array_slice($editOptions,0,6);
    $editTargets=array_map('intval',$editContent['hedef_ogrenciler']??[]);
    $editGroups=array_map('intval',$editContent['hedef_gruplar']??[]);
    if(!empty($editContent['teslim_tarihi'])){
        try{$editDue=(new DateTimeImmutable((string)$editContent['teslim_tarihi']))->format('Y-m-d\TH:i');}catch(Throwable){}
    }
    $editLocked=(int)($editContent['aktivite_sayisi']??0)>0;
}

function oi_type_icon(string $type): string {
    return match($type){
        'soru'=>'❓',
        'tekrar'=>'🔁',
        'odev'=>'📝',
        'not'=>'💡',
        default=>'📌'
    };
}

function oi_target_group_label(array $group): string {
    $type=(string)($group['tur']??'sinif')==='grup'?'Grup':'Sınıf';
    $grade=$group['sinif_seviyesi']!==null?(int)$group['sinif_seviyesi']:0;
    return $type.' · '.(string)($group['ad']??'').($grade>0?' · '.$grade.'. sınıf':'');
}
?><!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>İçeriklerim — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="ogretmen.css?v=1.0.42">
<link rel="stylesheet" href="ogretmen-icerikleri.css?v=1.2.31">
<script src="ogretmen-icerikleri.js?v=1.2.31" defer></script>
</head>
<body class="role-page">
<div class="role-shell">
<header class="role-topbar">
<a class="role-icon" href="ogretmen-paneli.php">←</a>
<span class="role-brand"><span>⭐</span><span><strong>İçeriklerim</strong><small>ÖĞRETMENİM BÖLÜMÜ</small></span></span>
<a class="role-icon" href="hesap-guvenligi.php">⚙️</a>
</header>

<main class="role-content teacher-content-shell">
<section class="role-hero">
<span class="eyeline">ÖĞRETMEN İÇERİĞİ</span>
<h1>Ders ders, konu konu içerik yayınla.</h1>
<p><?=oi_h((string)$teacher['ad_soyad'])?> · İçeriklerin yalnızca sana bağlı öğrencilerde görünür.</p>
<span class="role-hero-art">⭐</span>
</section>

<?php if($message!==''):?><div class="role-note"><span>✅</span><p><?=oi_h($message)?></p></div><?php endif;?>
<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=oi_h($error)?></p></div><?php endif;?>

<?php if(count($institutions)>1):?>
<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">KURUM</span><h2>Çalıştığın Kurum</h2></div></div>
<div class="teacher-content-switch">
<?php foreach($institutions as $institution):?>
<a class="<?=((int)$institution['id']===$selectedInstitutionId?'active':'')?>" href="ogretmen-icerikleri.php?kurum_id=<?=(int)$institution['id']?>"><?=oi_h((string)$institution['ad'])?></a>
<?php endforeach;?>
</div>
</section>
<?php endif;?>

<?php if(is_array($editContent)):?>
<section class="role-section teacher-content-edit-section" id="icerik-duzenle">
<div class="role-section-head">
<div><span class="eyeline">İÇERİK DÜZENLE</span><h2><?=oi_h((string)$editContent['baslik'])?></h2></div>
<a class="teacher-content-cancel" href="ogretmen-icerikleri.php?kurum_id=<?=$selectedInstitutionId?>">Kapat</a>
</div>

<?php if($editLocked):?>
<div class="role-note">
<span>🔒</span>
<p>Bu içerikte öğrenci yanıtı veya ödev durumu oluştuğu için geçmiş performans verisini korumak amacıyla yerinde düzenleme kapalıdır. İçeriği kopyalayıp yeni kopyayı düzenleyebilirsin.</p>
</div>
<form method="post" data-content-copy class="teacher-content-inline-form">
<input type="hidden" name="csrf" value="<?=oi_h(csrf_token())?>">
<input type="hidden" name="action" value="copy">
<input type="hidden" name="kurum_id" value="<?=(int)$editContent['kurum_id']?>">
<input type="hidden" name="icerik_id" value="<?=(int)$editContent['id']?>">
<button class="role-button" type="submit">📄 Pasif Kopya Oluştur</button>
</form>
<?php else:?>
<form method="post" class="teacher-content-form">
<input type="hidden" name="csrf" value="<?=oi_h(csrf_token())?>">
<input type="hidden" name="action" value="update">
<input type="hidden" name="kurum_id" value="<?=(int)$editContent['kurum_id']?>">
<input type="hidden" name="icerik_id" value="<?=(int)$editContent['id']?>">

<div class="teacher-content-grid">
<div>
<label>Ders</label>
<select class="role-input" name="ders_id" required>
<option value="">Ders seç</option>
<?php foreach($lessons as $lesson):?>
<option value="<?=(int)$lesson['id']?>" <?=((int)$editContent['ders_id']===(int)$lesson['id']?'selected':'')?>><?=oi_h((string)$lesson['emoji'])?> <?=oi_h((string)$lesson['ad'])?></option>
<?php endforeach;?>
</select>
</div>
<div>
<label>Konu</label>
<select class="role-input" name="ders_modulu_id">
<option value="">Genel / özel konu</option>
<?php foreach($modules as $module):?>
<option value="<?=(int)$module['id']?>" data-lesson="<?=(int)$module['ders_id']?>" <?=((int)($editContent['ders_modulu_id']??0)===(int)$module['id']?'selected':'')?>><?=oi_h((string)$module['baslik'])?></option>
<?php endforeach;?>
</select>
</div>
</div>

<label>Özel konu başlığı</label>
<input class="role-input" name="konu_basligi" maxlength="190" value="<?=oi_h((string)$editContent['konu_basligi'])?>">

<div class="teacher-content-grid">
<div>
<label>İçerik türü</label>
<select class="role-input" name="icerik_turu">
<?php foreach($types as $key=>$label):?><option value="<?=oi_h($key)?>" <?=((string)$editContent['icerik_turu']===$key?'selected':'')?>><?=oi_h($label)?></option><?php endforeach;?>
</select>
</div>
<div>
<label>Başlık</label>
<input class="role-input" name="baslik" required maxlength="190" value="<?=oi_h((string)$editContent['baslik'])?>">
</div>
</div>

<label>Açıklama / tekrar / ödev metni</label>
<textarea class="role-input" name="icerik_metni"><?=oi_h((string)($editContent['icerik_metni']??''))?></textarea>

<div class="teacher-content-homework" data-homework-fields>
<label>Teslim tarihi <small>(isteğe bağlı)</small></label>
<input class="role-input" type="datetime-local" name="teslim_tarihi" value="<?=oi_h($editDue)?>">
<small class="teacher-content-help">Ödev için son teslim tarihini belirleyebilirsin. Tarih vermezsen süre sınırı olmaz.</small>
</div>

<div class="teacher-content-question" data-question-fields>
<label>Soru</label>
<textarea class="role-input" name="soru"><?=oi_h((string)($editContent['soru']??''))?></textarea>
<div class="teacher-content-options">
<?php foreach($editOptions as $index=>$option):?>
<input class="role-input" name="secenekler[]" maxlength="255" value="<?=oi_h($option)?>" placeholder="<?=chr(65+$index)?> seçeneği">
<?php endforeach;?>
</div>
<label>Doğru cevap</label>
<select class="role-input" name="dogru_cevap_indeksi">
<?php for($i=0;$i<6;$i++):?><option value="<?=$i?>" <?=((int)($editContent['dogru_cevap_indeksi']??0)===$i?'selected':'')?>><?=chr(65+$i)?></option><?php endfor;?>
</select>
<label>Cevap açıklaması</label>
<textarea class="role-input" name="aciklama"><?=oi_h((string)($editContent['aciklama']??''))?></textarea>
<label>Doğru cevap yıldız ödülü <small>(0–20)</small></label>
<input class="role-input" type="number" name="yildiz_degeri" min="0" max="20" value="<?=max(0,min(20,(int)($editContent['yildiz_degeri']??0)))?>">
<small class="teacher-content-help">Öğrenci bu soruyu ilk kez doğru çözdüğünde ödül bir kez kazanılır.</small>
</div>

<div class="teacher-content-group-target-box">
<label>Sınıf / grup hızlı hedefleme <small>(isteğe bağlı)</small></label>
<?php if(!$targetGroups):?>
<div class="role-empty"><span>🏷️</span>Bu kurumda sana bağlı aktif öğrencisi bulunan sınıf / grup yok.</div>
<?php else:?>
<div class="teacher-content-group-targets">
<?php foreach($targetGroups as $group):?>
<label class="teacher-content-group-target">
<input type="checkbox" name="hedef_gruplar[]" value="<?=(int)$group['id']?>" <?=in_array((int)$group['id'],$editGroups,true)?'checked':''?>>
<span><strong><?=oi_h(oi_target_group_label($group))?></strong><small><?=(int)$group['ogrenci_sayisi']?> bağlı öğrenci</small></span>
</label>
<?php endforeach;?>
</div>
<small class="teacher-content-help">Seçilen grupların mevcut aktif ve sana bağlı öğrencileri bu kayıtta hedef listesine eklenir. Grup üyeliği sonradan değişse bile eski yayının hedefi otomatik değişmez.</small>
<?php endif;?>
</div>

<label>Hedef öğrenciler <small>(hiçbirini seçmezsen bu kurumdaki sana bağlı tüm öğrenciler görür)</small></label>
<div class="teacher-content-targets">
<?php if(!$students):?>
<div class="role-empty"><span>🎒</span>Bu kurumda sana bağlı aktif öğrenci yok.</div>
<?php else:foreach($students as $student):?>
<label class="teacher-content-target">
<input type="checkbox" name="hedef_ogrenciler[]" value="<?=(int)$student['id']?>" <?=in_array((int)$student['id'],$editTargets,true)?'checked':''?>>
<span><?=oi_h((string)($student['ad']?:$student['email']))?></span>
</label>
<?php endforeach;endif;?>
</div>

<button class="role-button" type="submit">Değişiklikleri Kaydet</button>
</form>
<?php endif;?>
</section>
<?php endif;?>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">YENİ İÇERİK</span><h2>Öğrencilerime Gönder</h2></div></div>

<?php if(!$institutions):?>
<div class="role-empty"><span>🏫</span>İçerik yayınlamak için önce aktif bir kuruma öğretmen olarak bağlanmalısın.</div>
<?php elseif(!$lessons):?>
<div class="role-empty"><span>📚</span>Aktif ders bulunamadı.</div>
<?php else:?>
<form method="post" class="teacher-content-form">
<input type="hidden" name="csrf" value="<?=oi_h(csrf_token())?>">
<input type="hidden" name="action" value="create">
<input type="hidden" name="kurum_id" value="<?=$selectedInstitutionId?>">

<div class="teacher-content-grid">
<div>
<label>Ders</label>
<select class="role-input" name="ders_id" required>
<option value="">Ders seç</option>
<?php foreach($lessons as $lesson):?>
<option value="<?=(int)$lesson['id']?>"><?=oi_h((string)$lesson['emoji'])?> <?=oi_h((string)$lesson['ad'])?></option>
<?php endforeach;?>
</select>
</div>
<div>
<label>Konu</label>
<select class="role-input" name="ders_modulu_id">
<option value="">Genel / özel konu</option>
<?php foreach($modules as $module):?>
<option value="<?=(int)$module['id']?>" data-lesson="<?=(int)$module['ders_id']?>"><?=oi_h((string)$module['baslik'])?></option>
<?php endforeach;?>
</select>
</div>
</div>

<label>Özel konu başlığı <small>(ders konusu seçmezsen kullanılır)</small></label>
<input class="role-input" name="konu_basligi" maxlength="190" placeholder="Örn. Toplama İşlemi Tekrarı">

<div class="teacher-content-grid">
<div>
<label>İçerik türü</label>
<select class="role-input" name="icerik_turu">
<?php foreach($types as $key=>$label):?><option value="<?=oi_h($key)?>"><?=oi_h($label)?></option><?php endforeach;?>
</select>
</div>
<div>
<label>Başlık</label>
<input class="role-input" name="baslik" required maxlength="190" placeholder="Örn. Bugünün yıldız sorusu">
</div>
</div>

<label>Açıklama / tekrar / ödev metni</label>
<textarea class="role-input" name="icerik_metni" placeholder="Öğrencine anlatmak istediğin içerik..."></textarea>

<div class="teacher-content-homework" data-homework-fields hidden>
<label>Teslim tarihi <small>(isteğe bağlı)</small></label>
<input class="role-input" type="datetime-local" name="teslim_tarihi">
<small class="teacher-content-help">Ödev için son teslim tarihini belirleyebilirsin. Tarih vermezsen süre sınırı olmaz.</small>
</div>

<div class="teacher-content-question" data-question-fields>
<label>Soru</label>
<textarea class="role-input" name="soru" placeholder="Sorunu buraya yaz"></textarea>
<div class="teacher-content-options">
<?php for($i=0;$i<6;$i++):?><input class="role-input" name="secenekler[]" maxlength="255" placeholder="<?=chr(65+$i)?> seçeneği"><?php endfor;?>
</div>
<label>Doğru cevap</label>
<select class="role-input" name="dogru_cevap_indeksi">
<?php for($i=0;$i<6;$i++):?><option value="<?=$i?>"><?=chr(65+$i)?></option><?php endfor;?>
</select>
<label>Cevap açıklaması</label>
<textarea class="role-input" name="aciklama" placeholder="Doğru cevabı kısa şekilde açıkla"></textarea>
<label>Doğru cevap yıldız ödülü <small>(0–20)</small></label>
<input class="role-input" type="number" name="yildiz_degeri" min="0" max="20" value="0">
<small class="teacher-content-help">İstersen ilk doğru cevap için yıldız ödülü belirleyebilirsin.</small>
</div>

<div class="teacher-content-group-target-box">
<label>Sınıf / grup hızlı hedefleme <small>(isteğe bağlı)</small></label>
<?php if(!$targetGroups):?>
<div class="role-empty"><span>🏷️</span>Bu kurumda sana bağlı aktif öğrencisi bulunan sınıf / grup yok.</div>
<?php else:?>
<div class="teacher-content-group-targets">
<?php foreach($targetGroups as $group):?>
<label class="teacher-content-group-target">
<input type="checkbox" name="hedef_gruplar[]" value="<?=(int)$group['id']?>">
<span><strong><?=oi_h(oi_target_group_label($group))?></strong><small><?=(int)$group['ogrenci_sayisi']?> bağlı öğrenci</small></span>
</label>
<?php endforeach;?>
</div>
<small class="teacher-content-help">Bir veya daha fazla sınıf / grup seçebilirsin. Seçtiğin grupların mevcut öğrencileri ile aşağıda ayrıca işaretlediğin öğrenciler birleştirilir.</small>
<?php endif;?>
</div>

<label>Hedef öğrenciler <small>(hiçbirini seçmezsen bu kurumdaki sana bağlı tüm öğrenciler görür)</small></label>
<div class="teacher-content-targets">
<?php if(!$students):?>
<div class="role-empty"><span>🎒</span>Bu kurumda sana bağlı aktif öğrenci yok.</div>
<?php else:foreach($students as $student):?>
<label class="teacher-content-target"><input type="checkbox" name="hedef_ogrenciler[]" value="<?=(int)$student['id']?>"><span><?=oi_h((string)($student['ad']?:$student['email']))?></span></label>
<?php endforeach;endif;?>
</div>

<button class="role-button" type="submit">⭐ Öğretmenim Bölümünde Yayınla</button>
</form>
<?php endif;?>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">YAYINLARIM</span><h2>İçeriklerim</h2></div><span class="role-pill"><?=count($contents)?></span></div>
<div class="teacher-content-list">
<?php if(!$contents):?>
<div class="role-empty"><span>⭐</span>Henüz öğretmen içeriği yayınlamadın.</div>
<?php else:foreach($contents as $item):
    $activity=(int)($item['cevap_sayisi']??0)+(int)($item['odev_durum_sayisi']??0);
?>
<div class="teacher-content-item">
<span class="teacher-content-icon"><?=oi_type_icon((string)$item['icerik_turu'])?></span>
<div>
<strong><?=oi_h((string)$item['baslik'])?></strong>
<small><?=oi_h((string)$item['kurum_adi'])?> · <?=oi_h((string)$item['ders_adi'])?> / <?=oi_h((string)$item['konu_adi'])?> · <?=oi_h($types[(string)$item['icerik_turu']]??'Diğer')?> · <?=$item['hedef_turu']==='tum_ogrenciler'?'Tüm bağlı öğrenciler':(int)$item['hedef_sayisi'].' öğrenci'?><?=(string)$item['icerik_turu']==='soru'?' · '.(int)$item['cevap_sayisi'].' cevap'.((int)($item['yildiz_degeri']??0)>0?' · ⭐ '.(int)$item['yildiz_degeri'].' ödül':''):''?><?=(string)$item['icerik_turu']==='odev'?' · '.(int)$item['odev_durum_sayisi'].' durum kaydı':''?><?=(string)$item['icerik_turu']==='odev' && !empty($item['teslim_tarihi'])?' · Teslim: '.oi_h(date('d.m.Y H:i',strtotime((string)$item['teslim_tarihi']))):''?></small>
</div>
<div class="teacher-content-actions">
<span class="role-pill <?=((int)$item['aktif']===1?'ok':'off')?>"><?=((int)$item['aktif']===1?'Aktif':'Pasif')?></span>
<?php if($activity>0):?><span class="role-pill off">🔒 Geçmiş var</span><?php endif;?>
<a class="teacher-content-action detail" href="ogretmen-icerik-detay.php?id=<?=(int)$item['id']?>">Detay</a>
<a class="teacher-content-action edit" href="ogretmen-icerikleri.php?kurum_id=<?=(int)$item['kurum_id']?>&amp;duzenle=<?=(int)$item['id']?>#icerik-duzenle"><?=$activity>0?'İncele':'Düzenle'?></a>
<form method="post" data-content-copy>
<input type="hidden" name="csrf" value="<?=oi_h(csrf_token())?>">
<input type="hidden" name="action" value="copy">
<input type="hidden" name="kurum_id" value="<?=(int)$item['kurum_id']?>">
<input type="hidden" name="icerik_id" value="<?=(int)$item['id']?>">
<button class="teacher-content-action copy" type="submit">Kopyala</button>
</form>
<form method="post">
<input type="hidden" name="csrf" value="<?=oi_h(csrf_token())?>">
<input type="hidden" name="action" value="toggle">
<input type="hidden" name="kurum_id" value="<?=(int)$item['kurum_id']?>">
<input type="hidden" name="icerik_id" value="<?=(int)$item['id']?>">
<input type="hidden" name="aktif" value="<?=((int)$item['aktif']===1?0:1)?>">
<button class="teacher-content-action <?=((int)$item['aktif']===1?'off':'on')?>" type="submit"><?=((int)$item['aktif']===1?'Pasife Al':'Aktifleştir')?></button>
</form>
</div>
</div>
<?php endforeach;endif;?>
</div>
</section>

<div class="role-note"><span>ℹ️</span><p>Öğrenci yanıtı veya ödev durumu oluşan içerikler geçmiş veriyi korumak için yerinde düzenlenmez. Böyle bir içeriği kopyalayıp pasif kopyayı düzenleyerek yeni yayın hazırlayabilirsin.</p></div>
</main>

<nav class="role-bottom">
<a href="ogretmen-paneli.php"><span>⌂</span>Panel</a>
<a href="ogretmen-paneli.php#ogrenciler"><span>🎒</span>Öğrenciler</a>
<a class="active" href="ogretmen-icerikleri.php"><span>⭐</span>İçeriklerim</a>
<a href="logout.php"><span>🚪</span>Çıkış</a>
</nav>
</div>
</body>
</html>
