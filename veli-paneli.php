<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/normalized.php';
$user=require_role('veli');$pdo=db();
function vp_h(string $v):string{return htmlspecialchars($v,ENT_QUOTES,'UTF-8');}
$institutionIds=auth_user_institution_ids($pdo,(int)$user['id'],'veli');
$institutionNames=[];
if($institutionIds){$ph=implode(',',array_fill(0,count($institutionIds),'?'));try{$s=$pdo->prepare("SELECT id,ad,tur FROM kurumlar WHERE id IN ($ph) ORDER BY ad");$s->execute($institutionIds);$institutionNames=$s->fetchAll();$s->closeCursor();}catch(Throwable){}}
$children=[];
try{
 $s=$pdo->prepare("SELECT o.id,o.ad,o.email FROM veli_ogrenci vo INNER JOIN veliler v ON v.id=vo.veli_id INNER JOIN ogrenciler o ON o.id=vo.ogrenci_id WHERE v.kullanici_id=? AND v.aktif=1 AND o.aktif=1 ORDER BY o.ad,o.id");
 $s->execute([(int)$user['id']]);$rows=$s->fetchAll();$s->closeCursor();
 foreach($rows as $r){$sid=(int)$r['id'];try{$sum=normalized_summary($pdo,$sid);}catch(Throwable){$sum=['completed_steps'=>0,'games'=>0,'stars'=>0];}$r['summary']=$sum;$children[]=$r;}
}catch(Throwable){}
?><!doctype html><html lang="tr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover"><title>Veli Paneli — İlkAdım</title>
<link rel="stylesheet" href="styles.css"><link rel="stylesheet" href="veli.css?v=1.0.42"></head><body class="role-page"><div class="role-shell">
<header class="role-topbar"><a class="role-brand" href="veli-paneli.php"><span>👪</span><span><strong>Veli</strong><small>ÇOCUK TAKİBİ</small></span></a><div class="role-actions"><a class="role-icon" href="veli-paneli.php">👪</a><a class="role-icon" href="hesap-guvenligi.php">⚙️</a></div></header>
<main class="role-content">
<section class="role-hero"><span class="eyeline">VELİ ALANI</span><h1>Çocuğunun gelişimini izle.</h1><p><?=vp_h((string)$user['ad_soyad'])?> · <?=count($children)?> bağlı öğrenci</p><span class="role-hero-art">💜</span></section>
<section class="role-section" id="cocuklar"><div class="role-section-head"><div><span class="eyeline">ÇOCUKLARIM</span><h2>Öğrenci Raporları</h2></div></div><div class="role-list">
<?php if(!$children):?><div class="role-empty"><span>🎒</span>Henüz öğrenci eşleştirilmedi.</div><?php else:foreach($children as $c):$x=$c['summary'];?><a class="role-row" href="ogrenci-raporu.php?id=<?=(int)$c['id']?>"><span>🎒</span><div><strong><?=vp_h((string)($c['ad']?:$c['email']))?></strong><small><?=$x['completed_steps']?> ders adımı · <?=$x['games']?> oyun · <?=$x['stars']?> yıldız</small></div><b>→</b></a><?php endforeach;endif;?>
</div></section>
<section class="role-section"><div class="role-section-head"><div><span class="eyeline">KURUM BİLGİSİ</span><h2>Bağlı Kurum</h2></div></div><div class="role-list">
<?php if(!$institutionNames):?><div class="role-row"><span>🌞</span><div><strong>İlkAdım Doğrudan Kullanıcı</strong><small>Okula bağlı olmayan hesap · Sistem içerikleri</small></div><span class="role-pill">Sistem</span></div>
<?php else:foreach($institutionNames as $k):?><div class="role-row"><span><?=$k['tur']==='platform'?'🌞':'🏫'?></span><div><strong><?=vp_h((string)$k['ad'])?></strong><small><?=vp_h((string)$k['tur'])?></small></div><span class="role-pill ok">Aktif</span></div><?php endforeach;endif;?>
</div></section>
<div class="role-note"><span>💡</span><p>Okula bağlı olmayan öğrenci hesaplarında İlkAdım’ın kendi ders ve etkinlik verileri görünmeye devam eder.</p></div>
</main><nav class="role-bottom"><a class="active" href="veli-paneli.php"><span>⌂</span>Panel</a><a href="veli-paneli.php#cocuklar"><span>🎒</span>Çocuklar</a><a href="hesap-guvenligi.php"><span>⚙️</span>Hesap</a><a href="logout.php"><span>🚪</span>Çıkış</a></nav></div></body></html>