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
            $contentId=oi_create_content($pdo,$user,$_POST,$targets);
            $message='İçerik yayınlandı. Öğrenciler bunu Öğretmenim bölümünde görecek.';
        }elseif($action==='toggle'){
            $contentId=(int)($_POST['icerik_id']??0);
            $active=(int)($_POST['aktif']??0)===1;
            oi_set_content_active($pdo,$user,$contentId,$active);
            $message=$active?'İçerik yeniden aktifleştirildi.':'İçerik pasife alındı.';
        }
    }catch(PDOException $e){
        $error='İçerik işlemi veritabanında tamamlanamadı.';
    }catch(Throwable $e){
        $error=$e->getMessage();
    }
}

$lessons=oi_lessons($pdo);
$modules=oi_modules($pdo);
$students=$selectedInstitutionId>0
    ?oi_teacher_students($pdo,(int)$teacher['id'],$selectedInstitutionId)
    :[];
$contents=oi_teacher_contents($pdo,(int)$teacher['id']);
$types=oi_content_types();

function oi_type_icon(string $type): string {
    return match($type){
        'soru'=>'❓',
        'tekrar'=>'🔁',
        'odev'=>'📝',
        'not'=>'💡',
        default=>'📌'
    };
}
?><!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>İçeriklerim — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="ogretmen.css?v=1.0.42">
<link rel="stylesheet" href="ogretmen-icerikleri.css?v=1.0.48">
<script src="ogretmen-icerikleri.js?v=1.0.48" defer></script>
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

<div class="teacher-content-question" data-question-fields>
<label>Soru</label>
<textarea class="role-input" name="soru" placeholder="Sorunu buraya yaz"></textarea>
<div class="teacher-content-options">
<input class="role-input" name="secenekler[]" maxlength="255" placeholder="A seçeneği">
<input class="role-input" name="secenekler[]" maxlength="255" placeholder="B seçeneği">
<input class="role-input" name="secenekler[]" maxlength="255" placeholder="C seçeneği">
<input class="role-input" name="secenekler[]" maxlength="255" placeholder="D seçeneği">
</div>
<label>Doğru cevap</label>
<select class="role-input" name="dogru_cevap_indeksi">
<option value="0">A</option><option value="1">B</option><option value="2">C</option><option value="3">D</option>
</select>
<label>Cevap açıklaması</label>
<textarea class="role-input" name="aciklama" placeholder="Doğru cevabı kısa şekilde açıkla"></textarea>
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
<?php else:foreach($contents as $item):?>
<div class="teacher-content-item">
<span class="teacher-content-icon"><?=oi_type_icon((string)$item['icerik_turu'])?></span>
<div>
<strong><?=oi_h((string)$item['baslik'])?></strong>
<small><?=oi_h((string)$item['kurum_adi'])?> · <?=oi_h((string)$item['ders_adi'])?> / <?=oi_h((string)$item['konu_adi'])?> · <?=oi_h($types[(string)$item['icerik_turu']]??'Diğer')?> · <?=$item['hedef_turu']==='tum_ogrenciler'?'Tüm bağlı öğrenciler':(int)$item['hedef_sayisi'].' öğrenci'?><?=(string)$item['icerik_turu']==='soru'?' · '.(int)$item['cevap_sayisi'].' cevap':''?></small>
</div>
<div class="teacher-content-actions">
<span class="role-pill <?=((int)$item['aktif']===1?'ok':'off')?>"><?=((int)$item['aktif']===1?'Aktif':'Pasif')?></span>
<form method="post">
<input type="hidden" name="csrf" value="<?=oi_h(csrf_token())?>">
<input type="hidden" name="action" value="toggle">
<input type="hidden" name="kurum_id" value="<?=$selectedInstitutionId?>">
<input type="hidden" name="icerik_id" value="<?=(int)$item['id']?>">
<input type="hidden" name="aktif" value="<?=((int)$item['aktif']===1?0:1)?>">
<button class="teacher-content-action <?=((int)$item['aktif']===1?'off':'on')?>" type="submit"><?=((int)$item['aktif']===1?'Pasife Al':'Aktifleştir')?></button>
</form>
</div>
</div>
<?php endforeach;endif;?>
</div>
</section>
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
