<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/kurum_yonetimi.php';

$user=require_role('super_admin');
$pdo=db();
$message='';$error='';

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Güvenlik doğrulaması başarısız.');
        $action=(string)($_POST['action']??'');

        if($action==='create_student'){
            $uid=ky_create_user(
                $pdo,$user,'ogrenci',
                (string)($_POST['ad_soyad']??''),
                (string)($_POST['yeni_kullanici_eposta']??''),
                (string)($_POST['yeni_kullanici_sifre']??''),
                null
            );
            $studentId=auth_student_id_for_user($pdo,$uid);
            $parentUserId=(int)($_POST['veli_kullanici_id']??0);
            if($studentId && $parentUserId>0){
                ky_link_global_parent_student($pdo,$user,$parentUserId,$studentId);
            }
            $message='Global öğrenci oluşturuldu'.($parentUserId>0?' ve veliyle eşleştirildi.':'.');
        }

        if($action==='link_parent'){
            ky_link_global_parent_student(
                $pdo,$user,
                (int)($_POST['veli_kullanici_id']??0),
                (int)($_POST['ogrenci_id']??0)
            );
            $message='Veli ve öğrenci eşleştirildi.';
        }
    }catch(PDOException $e){
        $error=$e->getCode()==='23000'?'Bu e-posta veya eşleştirme zaten kullanılıyor.':'Veritabanı işlemi tamamlanamadı.';
    }catch(Throwable $e){
        $error=$e->getMessage();
    }
}

$students=ky_global_students($pdo);
$parents=ky_global_parents($pdo);
?><!doctype html><html lang="tr"><head>
<meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Global Öğrenciler — İlkAdım</title>
<link rel="stylesheet" href="styles.css"><link rel="stylesheet" href="super-admin.css?v=1.0.41">
</head><body class="role-page"><div class="role-shell">
<header class="role-topbar">
<a class="role-icon" href="super-admin.php">←</a>
<span class="role-brand"><span>🎒</span><span><strong>Global Öğrenciler</strong><small>KURUMSUZ / OKULSUZ</small></span></span>
<a class="role-icon" href="global-veliler.php">👪</a>
</header>
<main class="role-content">
<section class="role-hero"><span class="eyeline">GLOBAL KULLANICILAR</span><h1>Kurum ve öğretmen bağı olmayan öğrenciler.</h1>
<p>Bu öğrenciler yalnızca İlkAdım’ın sistem dersleri ve etkinliklerini kullanır. İstenirse global veliyle eşleştirilir.</p><span class="role-hero-art">🎒</span></section>

<?php if($message!==''):?><div class="role-note"><span>✅</span><p><?=ky_h($message)?></p></div><?php endif;?>
<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=ky_h($error)?></p></div><?php endif;?>

<section class="role-section"><div class="role-section-head"><div><span class="eyeline">YENİ ÖĞRENCİ</span><h2>Global Öğrenci Ekle</h2></div></div>
<form class="role-form" method="post" autocomplete="off">
<input type="hidden" name="csrf" value="<?=ky_h(csrf_token())?>">
<input type="hidden" name="action" value="create_student">
<label>Ad Soyad</label><input class="role-input" name="ad_soyad" required maxlength="190">
<label>E-posta</label><input class="role-input" type="email" name="yeni_kullanici_eposta" autocomplete="off" autocapitalize="none" spellcheck="false" value="" required>
<label>Geçici şifre</label><input class="role-input" type="password" name="yeni_kullanici_sifre" autocomplete="new-password" minlength="8" value="" required>
<label>Veli (isteğe bağlı)</label>
<select class="role-input" name="veli_kullanici_id">
<option value="0">Şimdilik veli bağlama</option>
<?php foreach($parents as $p):?><option value="<?=(int)$p['kullanici_id']?>"><?=ky_h((string)$p['ad_soyad'])?> — <?=ky_h((string)$p['email'])?></option><?php endforeach;?>
</select>
<button class="role-button" type="submit">Global Öğrenci Oluştur</button>
</form>
<p class="role-note"><span>ℹ️</span><span>Global öğrencinin kurumu ve öğretmeni olmaz. Veli ayrı Global Veliler sayfasından da oluşturulabilir.</span></p>
</section>

<section class="role-section"><div class="role-section-head"><div><span class="eyeline">EŞLEŞTİRME</span><h2>Veli Bağla</h2></div><a href="global-veliler.php">Veli Ekle</a></div>
<?php if(!$students||!$parents):?><div class="role-list"><div class="role-empty"><span>🔗</span>Eşleştirme için en az bir global öğrenci ve global veli gerekir.</div></div>
<?php else:?><form class="role-form" method="post">
<input type="hidden" name="csrf" value="<?=ky_h(csrf_token())?>">
<input type="hidden" name="action" value="link_parent">
<label>Öğrenci</label><select class="role-input" name="ogrenci_id" required><?php foreach($students as $s):?><option value="<?=(int)$s['ogrenci_id']?>"><?=ky_h((string)($s['ad']?:$s['email']))?></option><?php endforeach;?></select>
<label>Veli</label><select class="role-input" name="veli_kullanici_id" required><?php foreach($parents as $p):?><option value="<?=(int)$p['kullanici_id']?>"><?=ky_h((string)$p['ad_soyad'])?> — <?=ky_h((string)$p['email'])?></option><?php endforeach;?></select>
<button class="role-button" type="submit">Veliyle Eşleştir</button>
</form><?php endif;?>
</section>

<section class="role-section"><div class="role-section-head"><div><span class="eyeline">ÖĞRENCİLER</span><h2>Global Öğrenci Listesi</h2></div><span class="role-pill"><?=count($students)?></span></div>
<div class="role-list">
<?php if(!$students):?><div class="role-empty"><span>🎒</span>Henüz global öğrenci yok.</div>
<?php else:foreach($students as $s):?><div class="role-row"><span>🎒</span><div><strong><?=ky_h((string)($s['ad']?:$s['email']))?></strong><small><?=ky_h((string)$s['email'])?> · Veli: <?=ky_h((string)($s['veli_adlari']?:'Bağlı değil'))?></small></div><span class="role-pill ok">Global</span></div><?php endforeach;endif;?>
</div></section>
</main>
<nav class="role-bottom"><a href="super-admin.php"><span>⌂</span>Panel</a><a class="active" href="global-ogrenciler.php"><span>🎒</span>Öğrenciler</a><a href="global-veliler.php"><span>👪</span>Veliler</a><a href="kurumlar.php"><span>🏫</span>Kurumlar</a></nav>
</div></body></html>