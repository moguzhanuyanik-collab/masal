<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';

$user=require_role('super_admin');
$pdo=db();
$message='';$error='';

function kr_h(string $v): string { return htmlspecialchars($v,ENT_QUOTES,'UTF-8'); }
function kr_slug(string $v): string {
    $v=mb_strtolower(trim($v),'UTF-8');
    $map=['ç'=>'c','ğ'=>'g','ı'=>'i','ö'=>'o','ş'=>'s','ü'=>'u'];
    $v=strtr($v,$map); $v=preg_replace('/[^a-z0-9]+/','-',$v)??'';
    return trim($v,'-');
}
if($_SERVER['REQUEST_METHOD']==='POST'){
  try{
    if(!verify_csrf($_POST['csrf']??null))throw new RuntimeException('Güvenlik doğrulaması başarısız.');
    $ad=trim((string)($_POST['ad']??''));
    $tur=(string)($_POST['tur']??'okul');
    $kaynak=(string)($_POST['icerik_kaynagi']??'kurum');
    if(mb_strlen($ad)<2||mb_strlen($ad)>190)throw new RuntimeException('Kurum adını kontrol et.');
    if(!in_array($tur,['okul','kurs','platform'],true))$tur='okul';
    if(!in_array($kaynak,['sistem','kurum'],true))$kaynak='kurum';
    $kod=kr_slug((string)($_POST['kod']??$ad));
    if($kod==='')$kod='kurum-'.time();
    $s=$pdo->prepare('INSERT INTO kurumlar (kod,ad,tur,icerik_kaynagi,aktif) VALUES (?,?,?,?,1)');
    $s->execute([$kod,$ad,$tur,$kaynak]);
    auth_audit($pdo,(int)$user['id'],null,'kurum_olustur','Kurum: '.$ad.' / '.$kod);
    $message='Kurum oluşturuldu.';
  }catch(PDOException $e){$error=$e->getCode()==='23000'?'Bu kurum kodu zaten kullanılıyor.':'Kurum oluşturulamadı.';}
  catch(Throwable $e){$error=$e->getMessage();}
}
$kurumlar=[];
try{
 $s=$pdo->query("SELECT k.*,
   SUM(CASE WHEN kk.kurum_rolu='yonetici' AND kk.aktif=1 THEN 1 ELSE 0 END) yonetici_sayisi,
   SUM(CASE WHEN kk.kurum_rolu='ogretmen' AND kk.aktif=1 THEN 1 ELSE 0 END) ogretmen_sayisi,
   SUM(CASE WHEN kk.kurum_rolu='veli' AND kk.aktif=1 THEN 1 ELSE 0 END) veli_sayisi,
   SUM(CASE WHEN kk.kurum_rolu='ogrenci' AND kk.aktif=1 THEN 1 ELSE 0 END) ogrenci_sayisi
   FROM kurumlar k LEFT JOIN kurum_kullanicilari kk ON kk.kurum_id=k.id
   GROUP BY k.id ORDER BY k.tur='platform' DESC,k.ad");
 $kurumlar=$s?$s->fetchAll():[]; if($s)$s->closeCursor();
}catch(Throwable){}
?><!doctype html><html lang="tr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Kurumlar — İlkAdım</title><link rel="stylesheet" href="styles.css"><link rel="stylesheet" href="kurum.css?v=1.0.41"></head>
<body class="role-page"><div class="role-shell">
<header class="role-topbar"><a class="role-icon" href="super-admin.php">←</a><span class="role-brand"><span>🏫</span><span><strong>Kurumlar</strong><small>İLKADIM YÖNETİMİ</small></span></span><a class="role-icon" href="hesap-guvenligi.php">👑</a></header>
<main class="role-content">
<section class="role-hero"><span class="eyeline">KURUM MİMARİSİ</span><h1>Okul, kurs ve İlkAdım merkezi.</h1><p>Kurumlar kendi yönetici, öğretmen, veli ve öğrencilerini ayrı sayfalarda yönetir. Global kullanıcılar kurumdan bağımsızdır.</p><span class="role-hero-art">🏫</span></section>
<?php if($message!==''):?><div class="role-note"><span>✅</span><p><?=kr_h($message)?></p></div><?php endif;?>
<?php if($error!==''):?><div class="role-note"><span>⚠️</span><p><?=kr_h($error)?></p></div><?php endif;?>

<section class="role-section"><div class="role-section-head"><div><span class="eyeline">YENİ KURUM</span><h2>Kurum Ekle</h2></div></div>
<form class="role-form" method="post">
<input type="hidden" name="csrf" value="<?=kr_h(csrf_token())?>">
<label>Kurum adı</label><input class="role-input" name="ad" required maxlength="190" placeholder="Örnek Koleji">
<label>Kurum kodu</label><input class="role-input" name="kod" maxlength="80" placeholder="Boş bırakırsan otomatik oluşur">
<label>Tür</label><select class="role-input" name="tur"><option value="okul">Okul</option><option value="kurs">Kurs</option><option value="platform">Platform</option></select>
<label>İçerik kaynağı</label><select class="role-input" name="icerik_kaynagi"><option value="kurum">Kurum içeriği — sonra ayarlanacak</option><option value="sistem">İlkAdım sistem içeriği</option></select>
<button class="role-button" type="submit">Kurum Oluştur</button>
</form></section>

<section class="role-section"><div class="role-section-head"><div><span class="eyeline">AKTİF KURUMLAR</span><h2>Kurum Listesi</h2></div></div>
<div class="role-list">
<?php if(!$kurumlar):?><div class="role-empty"><span>🏫</span>Kurum bulunamadı.</div>
<?php else:foreach($kurumlar as $k):?>
<a class="role-row" href="kurum-detay.php?kurum_id=<?=(int)$k['id']?>">
<span><?=$k['tur']==='platform'?'🌞':'🏫'?></span><div><strong><?=kr_h((string)$k['ad'])?></strong>
<small><?=kr_h((string)$k['tur'])?> · İçerik: <?=kr_h((string)$k['icerik_kaynagi'])?> · Yön. <?= (int)$k['yonetici_sayisi']?> · Öğrt. <?= (int)$k['ogretmen_sayisi']?> · Veli <?= (int)$k['veli_sayisi']?> · Öğr. <?= (int)$k['ogrenci_sayisi']?></small></div><span class="role-pill <?=((int)$k['aktif']===1?'ok':'off')?>"><?=((int)$k['aktif']===1?'Aktif':'Pasif')?></span></a>
<?php endforeach;endif;?>
</div></section>
</main>
<nav class="role-bottom"><a href="super-admin.php"><span>⌂</span>Panel</a><a class="active" href="kurumlar.php"><span>🏫</span>Kurumlar</a><a href="global-ogrenciler.php"><span>🎒</span>Öğrenciler</a><a href="global-veliler.php"><span>👪</span>Veliler</a></nav>
</div></body></html>