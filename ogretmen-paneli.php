<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/normalized.php';
$user=require_role('ogretmen');$pdo=db();
function tp_h(string $v):string{return htmlspecialchars($v,ENT_QUOTES,'UTF-8');}
$institutionIds=auth_user_institution_ids($pdo,(int)$user['id'],'ogretmen');
$institutionNames=[];
if($institutionIds){$ph=implode(',',array_fill(0,count($institutionIds),'?'));try{$s=$pdo->prepare("SELECT id,ad FROM kurumlar WHERE id IN ($ph) ORDER BY ad");$s->execute($institutionIds);$institutionNames=$s->fetchAll();$s->closeCursor();}catch(Throwable){}}
$students=[];
try{
 $s=$pdo->prepare("SELECT o.id,o.ad,o.email FROM ogretmen_ogrenci oo
   INNER JOIN ogretmenler og ON og.id=oo.ogretmen_id
   INNER JOIN ogrenciler o ON o.id=oo.ogrenci_id
   WHERE og.kullanici_id=? AND og.aktif=1 AND o.aktif=1 ORDER BY o.ad,o.id");
 $s->execute([(int)$user['id']]);$rows=$s->fetchAll();$s->closeCursor();
 foreach($rows as $r){$sid=(int)$r['id'];try{$sum=normalized_summary($pdo,$sid);}catch(Throwable){$sum=['completed_steps'=>0,'games'=>0,'stars'=>0];}$r['summary']=$sum;$students[]=$r;}
}catch(Throwable){}
?><!doctype html><html lang="tr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover"><title>Öğretmen Paneli — İlkAdım</title>
<link rel="stylesheet" href="styles.css"><link rel="stylesheet" href="ogretmen.css?v=1.0.42"></head><body class="role-page"><div class="role-shell">
<header class="role-topbar"><a class="role-brand" href="ogretmen-paneli.php"><span>👩‍🏫</span><span><strong>Öğretmen</strong><small>ÖĞRENCİ TAKİBİ</small></span></a><div class="role-actions"><a class="role-icon" href="ogretmen-paneli.php">👩‍🏫</a><a class="role-icon" href="hesap-guvenligi.php">⚙️</a></div></header>
<main class="role-content">
<section class="role-hero"><span class="eyeline">ÖĞRETMEN ALANI</span><h1>Öğrencilerini takip et.</h1><p><?=tp_h((string)$user['ad_soyad'])?> · <?=count($institutionNames)?> kurum · <?=count($students)?> öğrenci</p><span class="role-hero-art">📚</span></section>
<section class="role-section"><div class="role-section-head"><div><span class="eyeline">KURUMLARIM</span><h2>Bağlı Kurumlar</h2></div></div><div class="role-list">
<?php if(!$institutionNames):?><div class="role-empty"><span>🏫</span>Henüz kuruma bağlanmadın.</div><?php else:foreach($institutionNames as $k):?><div class="role-row"><span>🏫</span><div><strong><?=tp_h((string)$k['ad'])?></strong><small>Öğretmen üyeliği</small></div><span class="role-pill ok">Aktif</span></div><?php endforeach;endif;?>
</div></section>
<section class="role-section" id="ogrenciler"><div class="role-section-head"><div><span class="eyeline">ÖĞRENCİLERİM</span><h2>Bağlı Öğrenciler</h2></div></div><div class="role-list">
<?php if(!$students):?><div class="role-empty"><span>🎒</span>Henüz öğrenci eşleştirilmedi.</div><?php else:foreach($students as $s):$x=$s['summary'];?><a class="role-row" href="ogrenci-raporu.php?id=<?=(int)$s['id']?>"><span>🎒</span><div><strong><?=tp_h((string)($s['ad']?:$s['email']))?></strong><small><?=$x['completed_steps']?> ders adımı · <?=$x['games']?> oyun · <?=$x['stars']?> yıldız</small></div><b>→</b></a><?php endforeach;endif;?>
</div></section>
<div class="role-note"><span>ℹ️</span><p>Öğretmene özel içerik üretimi ve kurum içeriği daha sonra bağlanacak. Şimdilik mevcut sistem verileri ve öğrenci raporları korunuyor.</p></div>
</main><nav class="role-bottom"><a class="active" href="ogretmen-paneli.php"><span>⌂</span>Panel</a><a href="ogretmen-paneli.php#ogrenciler"><span>🎒</span>Öğrenciler</a><a href="hesap-guvenligi.php"><span>⚙️</span>Hesap</a><a href="logout.php"><span>🚪</span>Çıkış</a></nav></div></body></html>