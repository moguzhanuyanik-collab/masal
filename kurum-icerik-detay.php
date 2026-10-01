<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/kurum_yonetimi.php';
require __DIR__.'/src/yonetici_yetkileri.php';
require __DIR__.'/src/kurum_icerik_detay.php';

$user=require_role(['yonetici','super_admin']);
$pdo=db();
$institutionId=max(0,(int)($_GET['kurum_id']??0));
$contentId=max(0,(int)($_GET['id']??0));
$groupId=max(0,(int)($_GET['grup_id']??0));

try{
    $institution=ky_assert_manageable($pdo,$user,$institutionId);
    if(!yy_can($pdo,$user,'kurum_goruntule')) throw new RuntimeException('Kurum görüntüleme izni yok.');
}catch(Throwable){
    http_response_code(403);
    echo 'Bu kurumun içerik detayını görüntüleme yetkin yok.';
    exit;
}

$detail=kid_content_detail($pdo,$institutionId,$contentId,$groupId);
if(!$detail){
    http_response_code(404);
    echo 'İçerik bulunamadı veya bu kuruma ait değil.';
    exit;
}

$content=$detail['content'];
$students=$detail['students'];
$summary=$detail['summary'];
$groupContext=$detail['group']??null;
$type=(string)$content['icerik_turu'];

function kid_h(string $value): string {
    return htmlspecialchars($value,ENT_QUOTES,'UTF-8');
}
function kid_date(?string $value): string {
    $value=trim((string)$value);
    if($value==='') return '—';
    try{return (new DateTimeImmutable($value))->format('d.m.Y H:i');}
    catch(Throwable){return '—';}
}
function kid_type_label(string $type): string {
    return [
        'soru'=>'Soru',
        'tekrar'=>'Tekrar',
        'odev'=>'Ödev',
        'not'=>'Not',
        'diger'=>'Diğer',
    ][$type]??'Diğer';
}
function kid_type_icon(string $type): string {
    return [
        'soru'=>'❓',
        'tekrar'=>'🔁',
        'odev'=>'📝',
        'not'=>'💡',
        'diger'=>'📌',
    ][$type]??'📌';
}
function kid_group_label(array $group): string {
    $type=(string)($group['tur']??'sinif')==='grup'?'Grup':'Sınıf';
    $grade=$group['sinif_seviyesi']!==null?(int)$group['sinif_seviyesi']:0;
    return $type.' · '.(string)($group['ad']??'').($grade>0?' · '.$grade.'. sınıf':'');
}
?><!doctype html>
<html lang="tr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Kurum İçerik Detayı — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="kurum.css?v=1.2.16">
<link rel="stylesheet" href="kurum-icerik-detay.css?v=1.2.32">
</head>
<body class="role-page">
<div class="role-shell">
<header class="role-topbar">
<a class="role-icon" href="kurum-icerikleri.php?kurum_id=<?=$institutionId?><?=$groupId>0?'&amp;grup_id='.$groupId:''?>">←</a>
<span class="role-brand"><span><?=kid_type_icon($type)?></span><span><strong>İçerik Detayı</strong><small><?=kid_h((string)$institution['ad'])?></small></span></span>
<a class="role-icon" href="hesap-guvenligi.php">⚙️</a>
</header>

<main class="role-content institution-content-detail-shell">
<section class="role-hero">
<span class="eyeline"><?=kid_h(kid_type_label($type))?> / <?=kid_h((string)$content['ders_adi'])?></span>
<h1><?=kid_h((string)$content['baslik'])?></h1>
<p><?=kid_h((string)$content['ogretmen_adi'])?> · <?=kid_h((string)$content['konu_adi'])?> · <?=((int)$content['aktif']===1?'Aktif yayın':'Pasif yayın')?> · <?=kid_h(kid_date((string)$content['olusturulma_tarihi']))?></p>
<?php if(is_array($groupContext)):?><div class="institution-content-detail-group">🏷️ <?=kid_h(kid_group_label($groupContext))?> · yayın-anı snapshotı</div><?php endif;?>
<span class="role-hero-art"><?=kid_type_icon($type)?></span>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">ÖZET</span><h2>Öğrenci Durumu</h2></div></div>
<div class="institution-content-detail-stats">
<div class="role-stat"><span>🎯</span><strong><?=(int)$summary['targeted']?></strong><small>Hedef öğrenci</small></div>
<?php if($type==='soru'):?>
<div class="role-stat"><span>💬</span><strong><?=(int)$summary['answered']?></strong><small>Cevapladı</small></div>
<div class="role-stat"><span>✅</span><strong><?=(int)$summary['correct']?></strong><small>Doğru</small></div>
<div class="role-stat"><span>❌</span><strong><?=(int)$summary['wrong']?></strong><small>Yanlış</small></div>
<div class="role-stat"><span>⏳</span><strong><?=(int)$summary['waiting']?></strong><small>Bekliyor</small></div>
<?php elseif($type==='odev'):?>
<div class="role-stat"><span>✅</span><strong><?=(int)$summary['completed']?></strong><small>Tamamladı</small></div>
<div class="role-stat"><span>⏰</span><strong><?=(int)$summary['overdue']?></strong><small>Gecikti</small></div>
<div class="role-stat"><span>⏳</span><strong><?=(int)$summary['waiting']?></strong><small>Bekliyor</small></div>
<?php else:?>
<div class="role-stat"><span>👀</span><strong><?=(int)$summary['waiting']?></strong><small>Hedefte</small></div>
<?php endif;?>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">YAYIN</span><h2>İçerik Bilgisi</h2></div></div>
<div class="institution-content-detail-card">
<?php if($type==='soru'):?>
<p><strong>Soru:</strong> <?=nl2br(kid_h((string)($content['soru']??'')))?></p>
<?php
$options=json_decode((string)($content['secenekler_json']??''),true);
if(is_array($options) && $options):
?>
<div class="institution-content-detail-options">
<?php foreach($options as $index=>$option):?>
<span class="<?=((int)$content['dogru_cevap_indeksi']===$index?'correct':'')?>"><?=chr(65+$index)?>. <?=kid_h((string)$option)?></span>
<?php endforeach;?>
</div>
<?php endif;?>
<?php if(trim((string)($content['aciklama']??''))!==''):?><p><strong>Açıklama:</strong> <?=nl2br(kid_h((string)$content['aciklama']))?></p><?php endif;?>
<?php else:?>
<p><?=nl2br(kid_h((string)($content['icerik_metni']??'')))?></p>
<?php endif;?>
<div class="institution-content-detail-meta">
<span>👩‍🏫 <?=kid_h((string)$content['ogretmen_adi'])?></span>
<span>📘 <?=kid_h((string)$content['ders_adi'])?></span>
<span>📌 <?=kid_h((string)$content['konu_adi'])?></span>
<?php if($type==='odev'):?><span>⏰ Teslim: <?=kid_h(kid_date((string)($content['teslim_tarihi']??'')))?></span><?php endif;?>
</div>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">ÖĞRENCİLER</span><h2>Tek Tek Durum</h2></div><span class="role-pill"><?=count($students)?></span></div>
<div class="institution-content-detail-list">
<?php if(!$students):?><div class="role-empty"><span>🎒</span><?=$groupId>0?'Bu yayın-anı grup snapshotında aktif hedef öğrenci bulunamadı.':'Bu içerik için aktif hedef öğrenci bulunamadı.'?></div><?php endif;?>
<?php foreach($students as $student):
    $status='Hedefte';
    $statusClass='';
    $detailText='Bu içerik hedef listesinde.';
    if($type==='soru'){
        $answered=$student['secilen_cevap_indeksi']!==null;
        if(!$answered){
            $status='Bekliyor';
            $detailText='Henüz cevap vermedi.';
        }elseif((int)$student['cevap_dogru']===1){
            $status='Doğru';
            $statusClass='ok';
            $detailText=(int)($student['deneme_sayisi']??1).' deneme · '.kid_date((string)($student['cevap_tarihi']??$student['cevap_guncellenme_tarihi']??''));
        }else{
            $status='Yanlış';
            $statusClass='warn';
            $detailText=(int)($student['deneme_sayisi']??1).' deneme · '.kid_date((string)($student['cevap_tarihi']??$student['cevap_guncellenme_tarihi']??''));
        }
    }elseif($type==='odev'){
        $completed=(int)$student['odev_tamamlandi']===1;
        $overdue=false;
        if(!$completed && !empty($content['teslim_tarihi'])){
            try{$overdue=(new DateTimeImmutable((string)$content['teslim_tarihi']))<new DateTimeImmutable('now');}catch(Throwable){}
        }
        if($completed){
            $status='Tamamlandı';
            $statusClass='ok';
            $detailText='Tamamlanma: '.kid_date((string)($student['odev_tamamlanma_tarihi']??''));
        }elseif($overdue){
            $status='Gecikti';
            $statusClass='warn';
            $detailText='Teslim tarihi geçti.';
        }else{
            $status='Bekliyor';
            $detailText='Henüz tamamlamadı.';
        }
    }
?>
<a class="institution-content-detail-student" href="ogrenci-raporu.php?id=<?=(int)$student['id']?>&amp;kurum_id=<?=$institutionId?>">
<span class="institution-content-detail-avatar">🎒</span>
<div>
<strong><?=kid_h((string)($student['ad']?:$student['email']))?></strong>
<small><?=(int)$student['sinif_seviyesi']?>. sınıf · <?=kid_h($detailText)?></small>
</div>
<span class="institution-content-detail-status <?=$statusClass?>"><?=kid_h($status)?></span>
</a>
<?php endforeach;?>
</div>
</section>

<div class="role-note"><span>ℹ️</span><p><?=$groupId>0?'Bu detay yayın-anı sınıf / grup snapshotına göre filtrelenmiştir. ':''?>Bu ekran salt okunurdur. İçerik değişiklikleri ilgili öğretmenin İçeriklerim ekranında yapılır.</p></div>
</main>

<nav class="role-bottom">
<a href="kurum-detay.php?kurum_id=<?=$institutionId?>"><span>🏫</span>Kurum</a>
<a class="active" href="kurum-icerikleri.php?kurum_id=<?=$institutionId?>"><span>📚</span>İçerikler</a>
<a href="kurum-siniflari.php?kurum_id=<?=$institutionId?>"><span>🏷️</span>Sınıflar</a>
<a href="kurum-raporlari.php?kurum_id=<?=$institutionId?>"><span>📊</span>Raporlar</a>
</nav>
</div>
</body>
</html>
