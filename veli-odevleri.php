<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';

$user=require_role('veli');
$pdo=db();
function vo_h(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }

try{
    $stmt=$pdo->prepare("SELECT DISTINCT o.id,o.ad,o.email,o.sinif_seviyesi
        FROM veli_ogrenci vo
        INNER JOIN veliler v ON v.id=vo.veli_id AND v.aktif=1
        INNER JOIN ogrenciler o ON o.id=vo.ogrenci_id AND o.aktif=1
        INNER JOIN kullanicilar su ON su.id=o.kullanici_id AND su.aktif=1
        WHERE v.kullanici_id=? ORDER BY o.ad,o.id");
    $stmt->execute([(int)$user['id']]);
    $children=$stmt->fetchAll();
    $stmt->closeCursor();
}catch(Throwable){
    http_response_code(503);
    echo 'Çocuk bilgileri şu anda okunamıyor.';
    exit;
}

$childIds=array_map('intval',array_column($children,'id'));
$childId=(int)($_GET['cocuk_id']??($childIds[0]??0));
if(array_key_exists('cocuk_id',$_GET) && !in_array($childId,$childIds,true)){
    http_response_code(403);
    echo 'Bu öğrencinin ödevlerine erişim yetkiniz yok.';
    exit;
}
$selectedChild=null;
foreach($children as $child){if((int)$child['id']===$childId){$selectedChild=$child;break;}}

$homeworks=[];
if($childId>0){
    try{
        $stmt=$pdo->prepare("SELECT DISTINCT oi.id,oi.baslik,oi.icerik_metni,oi.teslim_tarihi,oi.olusturulma_tarihi,
            COALESCE(od.tamamlandi,0) tamamlandi,od.tamamlanma_tarihi,
            k.ad kurum_adi,d.ad ders_adi,
            COALESCE(NULLIF(TRIM(og.ad_soyad),''),tu.ad_soyad) ogretmen_adi
            FROM ogretmen_icerikleri oi
            INNER JOIN kurumlar k ON k.id=oi.kurum_id AND k.aktif=1
            INNER JOIN dersler d ON d.id=oi.ders_id AND d.aktif=1
            INNER JOIN ogretmenler og ON og.id=oi.ogretmen_id AND og.aktif=1
            INNER JOIN kullanicilar tu ON tu.id=og.kullanici_id AND tu.aktif=1
            INNER JOIN kurum_kullanicilari tk ON tk.kurum_id=oi.kurum_id
                AND tk.kullanici_id=tu.id AND tk.kurum_rolu='ogretmen' AND tk.aktif=1
            INNER JOIN ogrenciler os ON os.id=? AND os.aktif=1
            INNER JOIN kullanicilar su ON su.id=os.kullanici_id AND su.aktif=1
            INNER JOIN kurum_kullanicilari sk ON sk.kurum_id=oi.kurum_id
                AND sk.kullanici_id=os.kullanici_id AND sk.kurum_rolu='ogrenci' AND sk.aktif=1
            INNER JOIN ogretmen_ogrenci oo ON oo.ogretmen_id=og.id AND oo.ogrenci_id=os.id
            LEFT JOIN ogretmen_icerik_hedefleri h ON h.icerik_id=oi.id AND h.ogrenci_id=os.id
            LEFT JOIN ogrenci_odev_durumlari od ON od.icerik_id=oi.id AND od.ogrenci_id=os.id
            WHERE oi.icerik_turu='odev' AND oi.aktif=1
              AND EXISTS (SELECT 1 FROM veli_ogrenci vo
                  INNER JOIN veliler v ON v.id=vo.veli_id AND v.aktif=1
                  WHERE vo.ogrenci_id=os.id AND v.kullanici_id=?)
              AND (oi.hedef_turu='tum_ogrenciler' OR h.ogrenci_id IS NOT NULL)
            ORDER BY oi.olusturulma_tarihi DESC,oi.id DESC LIMIT 100");
        $stmt->execute([$childId,(int)$user['id']]);
        $homeworks=$stmt->fetchAll();
        $stmt->closeCursor();
    }catch(Throwable){
        http_response_code(503);
        echo 'Ödevler şu anda okunamıyor.';
        exit;
    }
}
?><!doctype html><html lang="tr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>Çocuğumun Ödevleri — İlkAdım</title><link rel="stylesheet" href="styles.css"><link rel="stylesheet" href="veli.css?v=1.0.42"></head>
<body class="role-page"><div class="role-shell">
<header class="role-topbar"><a class="role-icon" href="veli-paneli.php" aria-label="Veli paneline dön">←</a><span class="role-brand"><span>📝</span><span><strong>Ödevler</strong><small>VELİ ALANI</small></span></span></header>
<main class="role-content"><section class="role-hero"><span class="eyeline">ÇOCUĞUMUN ÖDEVLERİ</span><h1>Yayınlanan Çalışmalar</h1><p>Bağlı çocuğunun öğretmenleri tarafından yayınlanan ödevleri gör.</p></section>
<?php if($children):?><section class="role-section"><div class="role-section-head"><div><span class="eyeline">ÇOCUK SEÇİMİ</span><h2>Öğrenci</h2></div></div>
<form method="get" class="role-form"><label for="cocuk">Çocuğum</label><select class="role-input" name="cocuk_id" id="cocuk">
<?php foreach($children as $child):?><option value="<?=(int)$child['id']?>" <?=((int)$child['id']===$childId?'selected':'')?>><?=vo_h((string)($child['ad']?:$child['email']))?></option><?php endforeach;?>
</select><button class="role-button" type="submit">Ödevleri Göster</button></form></section><?php endif;?>
<section class="role-section"><div class="role-section-head"><div><span class="eyeline">ÖDEVLER</span><h2><?=vo_h((string)($selectedChild['ad']??'Yayınlanan ödevler'))?></h2></div><span class="role-pill"><?=count($homeworks)?></span></div><div class="role-list">
<?php if(!$children):?><div class="role-empty">Henüz hesabına öğrenci eşleştirilmedi.</div>
<?php elseif(!$homeworks):?><div class="role-empty">Bu çocuk için yayınlanmış ödev bulunamadı.</div><?php endif;?>
<?php foreach($homeworks as $homework):?>
<?php $done=(int)($homework['tamamlandi']??0)===1;$due=!empty($homework['teslim_tarihi'])?date('d.m.Y H:i',strtotime((string)$homework['teslim_tarihi'])):'Süre yok'; ?>
<div class="role-row"><span><?=$done?'✅':'📝'?></span><div><strong><?=vo_h((string)$homework['baslik'])?></strong><small><?=vo_h((string)$homework['kurum_adi'])?> · <?=vo_h((string)$homework['ders_adi'])?> · <?=vo_h((string)$homework['ogretmen_adi'])?></small><p><?=nl2br(vo_h((string)$homework['icerik_metni']))?></p><small>Teslim: <?=vo_h($due)?><?=$done && !empty($homework['tamamlanma_tarihi'])?' · Tamamlandı: '.vo_h(date('d.m.Y H:i',strtotime((string)$homework['tamamlanma_tarihi']))):''?></small></div><span class="role-pill <?=$done?'ok':'off'?>"><?=$done?'Tamamlandı':'Bekliyor'?></span></div>
<?php endforeach;?>
</div></section><div class="role-note"><span>ℹ️</span><p>Tamamlanma durumu öğrencinin kendi Ödevlerim ekranındaki işaretlemesine göre gösterilir.</p></div>
</main><nav class="role-bottom"><a href="veli-paneli.php"><span>⌂</span>Panel</a><a href="veli-paneli.php#cocuklar"><span>🎒</span>Çocuklar</a><a class="active" href="veli-odevleri.php"><span>📝</span>Ödevler</a><a href="hesap-guvenligi.php"><span>⚙️</span>Hesap</a></nav></div></body></html>
