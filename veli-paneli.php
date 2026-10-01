<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/normalized.php';
require __DIR__.'/src/bildirimler.php';
$user=require_role('veli');$pdo=db();
$notificationUnread=bd_unread_count($pdo,(int)$user['id']);
function vp_h(string $v):string{return htmlspecialchars($v,ENT_QUOTES,'UTF-8');}
$institutionIds=auth_user_institution_ids($pdo,(int)$user['id'],'veli');
$institutionNames=[];
if($institutionIds){
 $ph=implode(',',array_fill(0,count($institutionIds),'?'));
 try{$s=$pdo->prepare("SELECT id,ad,tur FROM kurumlar WHERE id IN ($ph) ORDER BY ad");$s->execute($institutionIds);$institutionNames=$s->fetchAll();$s->closeCursor();}
 catch(Throwable){http_response_code(503);echo 'Kurum bilgileri şu anda okunamıyor. Lütfen daha sonra yeniden deneyin.';exit;}
}
$children=[];
try{
 $accessibleStudentIds=auth_accessible_student_ids($pdo,(int)$user['id']);
 if($accessibleStudentIds){
  $ph=implode(',',array_fill(0,count($accessibleStudentIds),'?'));
  $s=$pdo->prepare("SELECT o.id,o.ad,o.email
      FROM ogrenciler o
      INNER JOIN kullanicilar su ON su.id=o.kullanici_id AND su.aktif=1
      WHERE o.id IN ($ph) AND o.aktif=1
      ORDER BY o.ad,o.id");
  $s->execute($accessibleStudentIds);$rows=$s->fetchAll();$s->closeCursor();
  foreach($rows as $r){
   $sid=(int)$r['id'];
   try{$r['summary']=normalized_summary($pdo,$sid);}catch(Throwable){$r['summary']=null;}
   $children[]=$r;
  }
 }
}catch(Throwable){
 http_response_code(503);
 echo 'Öğrenci bilgileri şu anda okunamıyor. Lütfen daha sonra yeniden deneyin.';
 exit;
}
?><!doctype html><html lang="tr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover"><title>Veli Paneli — İlkAdım</title>
<link rel="stylesheet" href="styles.css"><link rel="stylesheet" href="veli.css?v=1.0.42"></head><body class="role-page"><div class="role-shell">
<header class="role-topbar"><a class="role-brand" href="veli-paneli.php"><span>👪</span><span><strong>Veli</strong><small>ÇOCUK TAKİBİ</small></span></a><div class="role-actions"><a class="role-icon" href="veli-paneli.php">👪</a><a class="role-icon" href="bildirimler.php" title="Bildirimler">🔔<?=$notificationUnread>0?' '.$notificationUnread:''?></a><a class="role-icon" href="destek.php" title="Destek">🎧</a><a class="role-icon" href="hesap-guvenligi.php">⚙️</a></div></header>
<main class="role-content">
<section class="role-hero"><span class="eyeline">VELİ ALANI</span><h1>Çocuğunun gelişimini izle.</h1><p><?=vp_h((string)$user['ad_soyad'])?> · <?=count($children)?> bağlı öğrenci</p><span class="role-hero-art">💜</span></section>
<section class="role-section" id="cocuklar"><div class="role-section-head"><div><span class="eyeline">ÇOCUKLARIM</span><h2>Öğrenci Raporları</h2></div></div><div class="role-list">
<?php if(!$children):?><div class="role-empty"><span>🎒</span>Henüz öğrenci eşleştirilmedi.</div><?php else:foreach($children as $c):$x=$c['summary'];?><a class="role-row" href="ogrenci-raporu.php?id=<?=(int)$c['id']?>"><span>🎒</span><div><strong><?=vp_h((string)($c['ad']?:$c['email']))?></strong><small><?php if($x===null):?>İlerleme bilgisi şu anda okunamıyor.<?php else:?><?=(int)$x['completed_steps']?> ders adımı · <?=(int)$x['games']?> oyun · <?=(int)$x['stars']?> yıldız<?php endif;?></small></div><b>→</b></a><?php endforeach;endif;?>
</div></section>
<section class="role-section"><div class="role-section-head"><div><span class="eyeline">ÖĞRETMEN TAKİBİ</span><h2>Çocuğumun İçerikleri</h2></div></div><div class="role-modules">
<a class="role-module" href="veli-icerikleri.php"><span>⭐</span><div><strong>Öğretmen İçerikleri</strong><small>Soru, tekrar, ödev ve notları; doğru/yanlış ve tamamlama durumlarıyla birlikte gör.</small></div><b>→</b></a>
<a class="role-module" href="veli-odevleri.php"><span>📝</span><div><strong>Yalnız Ödevler</strong><small>Bağlı çocuğunu seçerek öğretmeninin verdiği ödevleri teslim durumuyla gör.</small></div><b>→</b></a>
</div></section>
<section class="role-section"><div class="role-section-head"><div><span class="eyeline">BİLDİRİMLER</span><h2>Kurum Mesajları</h2></div></div><div class="role-modules"><a class="role-module" href="bildirimler.php"><span>🔔</span><div><strong>Bildirimlerim</strong><small><?=$notificationUnread?> okunmamış duyuru veya ödev bildirimi.</small></div><b>→</b></a></div></section>
<section class="role-section"><div class="role-section-head"><div><span class="eyeline">DESTEK</span><h2>Yardım & Talep</h2></div></div><div class="role-modules"><a class="role-module" href="destek.php"><span>🎧</span><div><strong>Destek Merkezi</strong><small>Hesap, içerik veya paket sorununu destek ekibine ilet.</small></div><b>→</b></a></div></section>
<section class="role-section"><div class="role-section-head"><div><span class="eyeline">KURUM BİLGİSİ</span><h2>Bağlı Kurum</h2></div></div><div class="role-list">
<?php if(!$institutionNames):?><div class="role-row"><span>🌞</span><div><strong>İlkAdım Doğrudan Kullanıcı</strong><small>Okula bağlı olmayan hesap · Sistem içerikleri</small></div><span class="role-pill">Sistem</span></div>
<?php else:foreach($institutionNames as $k):?><div class="role-row"><span><?=$k['tur']==='platform'?'🌞':'🏫'?></span><div><strong><?=vp_h((string)$k['ad'])?></strong><small><?=vp_h((string)$k['tur'])?></small></div><span class="role-pill ok">Aktif</span></div><?php endforeach;endif;?>
</div></section>
<div class="role-note"><span>💡</span><p>Okula bağlı olmayan öğrenci hesaplarında İlkAdım’ın kendi ders ve etkinlik verileri görünmeye devam eder.</p></div>
</main><nav class="role-bottom"><a class="active" href="veli-paneli.php"><span>⌂</span>Panel</a><a href="veli-paneli.php#cocuklar"><span>🎒</span>Çocuklar</a><a href="veli-icerikleri.php"><span>⭐</span>İçerikler</a><a href="hesap-guvenligi.php"><span>⚙️</span>Hesap</a></nav></div></body></html>
