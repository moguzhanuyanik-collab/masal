<?php
declare(strict_types=1);

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';
require __DIR__.'/src/ogretmen_icerik.php';

$user=require_role('ogretmen');
$pdo=db();
$contentId=max(0,(int)($_GET['id']??0));
$detail=oi_teacher_content_detail($pdo,$user,$contentId);

if(!$detail){
    http_response_code(404);
    echo 'İçerik bulunamadı veya bu içeriği görüntüleme yetkin yok.';
    exit;
}

$content=$detail['content'];
$students=$detail['students'];
$summary=$detail['summary'];
$type=(string)$content['icerik_turu'];
$types=oi_content_types();

function oid_h(string $value): string {
    return htmlspecialchars($value,ENT_QUOTES,'UTF-8');
}
function oid_date(?string $value): string {
    $value=trim((string)$value);
    if($value==='') return '—';
    try{
        return (new DateTimeImmutable($value))->format('d.m.Y H:i');
    }catch(Throwable){
        return '—';
    }
}
function oid_type_icon(string $type): string {
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
<title>İçerik Detayı — İlkAdım</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="ogretmen.css?v=1.0.42">
<link rel="stylesheet" href="ogretmen-icerik-detay.css?v=1.2.15">
</head>
<body class="role-page">
<div class="role-shell">
<header class="role-topbar">
<a class="role-icon" href="ogretmen-icerikleri.php?kurum_id=<?=(int)$content['kurum_id']?>">←</a>
<span class="role-brand"><span><?=oid_type_icon($type)?></span><span><strong>İçerik Detayı</strong><small><?=oid_h((string)$content['kurum_adi'])?></small></span></span>
<a class="role-icon" href="hesap-guvenligi.php">⚙️</a>
</header>

<main class="role-content teacher-detail-shell">
<section class="role-hero">
<span class="eyeline"><?=oid_h($types[$type]??'İçerik')?> / <?=oid_h((string)$content['ders_adi'])?></span>
<h1><?=oid_h((string)$content['baslik'])?></h1>
<p><?=oid_h((string)$content['konu_adi'])?> · <?=((int)$content['aktif']===1?'Aktif yayın':'Pasif yayın')?> · Yayın: <?=oid_h(oid_date((string)$content['olusturulma_tarihi']))?></p>
<span class="role-hero-art"><?=oid_type_icon($type)?></span>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">ÖZET</span><h2>Öğrenci Durumu</h2></div></div>
<div class="teacher-detail-stats">
<div class="role-stat"><span>🎯</span><strong><?=(int)$summary['targeted']?></strong><small>Hedef öğrenci</small></div>
<?php if($type==='soru'):?>
<div class="role-stat"><span>💬</span><strong><?=(int)$summary['answered']?></strong><small>Cevapladı</small></div>
<div class="role-stat"><span>✅</span><strong><?=(int)$summary['correct']?></strong><small>Doğru</small></div>
<div class="role-stat"><span>❌</span><strong><?=(int)$summary['wrong']?></strong><small>Yanlış</small></div>
<div class="role-stat"><span>⏳</span><strong><?=(int)$summary['waiting']?></strong><small>Bekliyor</small></div>
<?php if((int)($content['yildiz_degeri']??0)>0):?><div class="role-stat"><span>⭐</span><strong><?=(int)$summary['reward_stars']?></strong><small>Dağıtılan yıldız</small></div><?php endif;?>
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
<div class="role-section-head"><div><span class="eyeline">İÇERİK</span><h2>Yayın Bilgisi</h2></div></div>
<div class="teacher-detail-card">
<?php if($type==='soru'):?>
<p><strong>Soru:</strong> <?=nl2br(oid_h((string)($content['soru']??'')))?></p>
<?php
$options=json_decode((string)($content['secenekler_json']??''),true);
if(is_array($options) && $options):
?>
<div class="teacher-detail-options">
<?php foreach($options as $index=>$option):?>
<span class="<?=((int)$content['dogru_cevap_indeksi']===$index?'correct':'')?>"><?=chr(65+$index)?>. <?=oid_h((string)$option)?></span>
<?php endforeach;?>
</div>
<?php endif;?>
<?php if(trim((string)($content['aciklama']??''))!==''):?><p><strong>Açıklama:</strong> <?=nl2br(oid_h((string)$content['aciklama']))?></p><?php endif;?>
<?php else:?>
<p><?=nl2br(oid_h((string)($content['icerik_metni']??'')))?></p>
<?php endif;?>
<div class="teacher-detail-meta">
<span>🏫 <?=oid_h((string)$content['kurum_adi'])?></span>
<span>📘 <?=oid_h((string)$content['ders_adi'])?></span>
<span>📌 <?=oid_h((string)$content['konu_adi'])?></span>
<?php if($type==='soru' && (int)($content['yildiz_degeri']??0)>0):?><span>⭐ İlk doğru cevap ödülü: <?=(int)$content['yildiz_degeri']?></span><?php endif;?>
<?php if($type==='odev'):?><span>⏰ Teslim: <?=oid_h(oid_date((string)($content['teslim_tarihi']??'')))?></span><?php endif;?>
</div>
</div>
</section>

<section class="role-section">
<div class="role-section-head"><div><span class="eyeline">ÖĞRENCİLER</span><h2>Tek Tek Durum</h2></div><span class="role-pill"><?=count($students)?></span></div>
<div class="teacher-detail-list">
<?php if(!$students):?><div class="role-empty"><span>🎒</span>Bu içerik için hedef öğrenci bulunamadı.</div><?php endif;?>
<?php foreach($students as $student):
    $status='Hedefte';
    $statusClass='';
    $detailText='';
    if($type==='soru'){
        $answered=$student['secilen_cevap_indeksi']!==null;
        if(!$answered){
            $status='Bekliyor';
            $detailText='Henüz cevap vermedi.';
        }elseif((int)$student['cevap_dogru']===1){
            $status='Doğru';
            $statusClass='ok';
            $detailText=(int)($student['deneme_sayisi']??1).' deneme · '.oid_date((string)($student['cevap_tarihi']??$student['cevap_guncellenme_tarihi']??''));
            if((int)($student['kazanilan_yildiz']??0)>0)$detailText.=' · ⭐ +'.(int)$student['kazanilan_yildiz'];
        }else{
            $status='Yanlış';
            $statusClass='warn';
            $detailText=(int)($student['deneme_sayisi']??1).' deneme · '.oid_date((string)($student['cevap_tarihi']??$student['cevap_guncellenme_tarihi']??''));
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
            $detailText='Tamamlanma: '.oid_date((string)($student['odev_tamamlanma_tarihi']??''));
        }elseif($overdue){
            $status='Gecikti';
            $statusClass='warn';
            $detailText='Teslim tarihi geçti.';
        }else{
            $status='Bekliyor';
            $detailText='Henüz tamamlamadı.';
        }
    }else{
        $detailText='Bu içerik hedef listesinde.';
    }
?>
<a class="teacher-detail-student" href="ogrenci-raporu.php?id=<?=(int)$student['id']?>">
<span class="teacher-detail-avatar">🎒</span>
<div>
<strong><?=oid_h((string)($student['ad']?:$student['email']))?></strong>
<small><?=(int)$student['sinif_seviyesi']?>. sınıf · <?=oid_h($detailText)?></small>
</div>
<span class="teacher-detail-status <?=$statusClass?>"><?=oid_h($status)?></span>
</a>
<?php endforeach;?>
</div>
</section>

<div class="teacher-detail-actions">
<a class="button soft full" href="ogretmen-icerikleri.php?kurum_id=<?=(int)$content['kurum_id']?>&amp;duzenle=<?=$contentId?>#icerik-duzenle">İçeriği Aç</a>
<a class="button soft full" href="ogretmen-icerikleri.php?kurum_id=<?=(int)$content['kurum_id']?>">İçeriklerime Dön</a>
</div>
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
