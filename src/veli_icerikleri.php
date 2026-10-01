<?php
declare(strict_types=1);

function vi_parent_children(PDO $pdo,int $parentUserId): array {
    if($parentUserId<=0) return [];
    $stmt=$pdo->prepare("SELECT DISTINCT o.id,o.ad,o.email,o.sinif_seviyesi
        FROM veli_ogrenci vo
        INNER JOIN veliler v
          ON v.id=vo.veli_id
         AND v.aktif=1
         AND v.kullanici_id=?
        INNER JOIN ogrenciler o
          ON o.id=vo.ogrenci_id
         AND o.aktif=1
        INNER JOIN kullanicilar su
          ON su.id=o.kullanici_id
         AND su.aktif=1
        INNER JOIN kurumlar k
          ON k.id=vo.kurum_id
         AND k.aktif=1
        INNER JOIN kurum_kullanicilari vk
          ON vk.kullanici_id=v.kullanici_id
         AND vk.kurum_id=vo.kurum_id
         AND vk.kurum_rolu='veli'
         AND vk.aktif=1
        INNER JOIN kurum_kullanicilari sk
          ON sk.kullanici_id=o.kullanici_id
         AND sk.kurum_id=vo.kurum_id
         AND sk.kurum_rolu='ogrenci'
         AND sk.aktif=1
        ORDER BY o.ad,o.id");
    $stmt->execute([$parentUserId]);
    $rows=$stmt->fetchAll();
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function vi_parent_child_institutions(PDO $pdo,int $parentUserId,int $studentId): array {
    if($parentUserId<=0 || $studentId<=0) return [];
    $stmt=$pdo->prepare("SELECT DISTINCT k.id,k.ad
        FROM veli_ogrenci vo
        INNER JOIN veliler v
          ON v.id=vo.veli_id
         AND v.aktif=1
         AND v.kullanici_id=?
        INNER JOIN ogrenciler o
          ON o.id=vo.ogrenci_id
         AND o.aktif=1
        INNER JOIN kurumlar k
          ON k.id=vo.kurum_id
         AND k.aktif=1
        INNER JOIN kurum_kullanicilari vk
          ON vk.kullanici_id=v.kullanici_id
         AND vk.kurum_id=vo.kurum_id
         AND vk.kurum_rolu='veli'
         AND vk.aktif=1
        INNER JOIN kurum_kullanicilari sk
          ON sk.kullanici_id=o.kullanici_id
         AND sk.kurum_id=vo.kurum_id
         AND sk.kurum_rolu='ogrenci'
         AND sk.aktif=1
        WHERE o.id=?
        ORDER BY k.ad,k.id");
    $stmt->execute([$parentUserId,$studentId]);
    $rows=$stmt->fetchAll();
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function vi_parent_contents(
    PDO $pdo,
    int $parentUserId,
    int $studentId,
    int $institutionId=0,
    string $type='tum'
): array {
    if($parentUserId<=0 || $studentId<=0) return [];
    $allowedTypes=['tum','soru','tekrar','odev','not','diger'];
    if(!in_array($type,$allowedTypes,true)) $type='tum';

    $where=[
        "oi.aktif=1",
        "(oi.hedef_turu='tum_ogrenciler' OR h.ogrenci_id IS NOT NULL)"
    ];
    $filterParams=[];

    if($institutionId>0){
        $where[]='oi.kurum_id=?';
        $filterParams[]=$institutionId;
    }
    if($type!=='tum'){
        $where[]='oi.icerik_turu=?';
        $filterParams[]=$type;
    }

    $sql="SELECT DISTINCT oi.id,oi.kurum_id,oi.ogretmen_id,oi.icerik_turu,oi.baslik,
        oi.icerik_metni,oi.soru,oi.secenekler_json,
        oi.dogru_cevap_indeksi,oi.aciklama,oi.teslim_tarihi,oi.olusturulma_tarihi,
        k.ad kurum_adi,d.ad ders_adi,d.emoji ders_emoji,
        COALESCE(dm.baslik,oi.konu_basligi,'Genel') konu_adi,
        COALESCE(NULLIF(TRIM(og.ad_soyad),''),tu.ad_soyad) ogretmen_adi,
        c.secilen_cevap_indeksi,c.dogru cevap_dogru,c.deneme_sayisi,c.cevap_tarihi,
        COALESCE(od.tamamlandi,0) odev_tamamlandi,od.tamamlanma_tarihi
        FROM ogretmen_icerikleri oi
        INNER JOIN kurumlar k
          ON k.id=oi.kurum_id
         AND k.aktif=1
        INNER JOIN dersler d
          ON d.id=oi.ders_id
         AND d.aktif=1
        LEFT JOIN ders_modulleri dm
          ON dm.id=oi.ders_modulu_id
        INNER JOIN ogretmenler og
          ON og.id=oi.ogretmen_id
         AND og.aktif=1
        INNER JOIN kullanicilar tu
          ON tu.id=og.kullanici_id
         AND tu.aktif=1
        INNER JOIN kurum_kullanicilari tk
          ON tk.kullanici_id=tu.id
         AND tk.kurum_id=oi.kurum_id
         AND tk.kurum_rolu='ogretmen'
         AND tk.aktif=1
        INNER JOIN ogrenciler os
          ON os.id=?
         AND os.aktif=1
        INNER JOIN kullanicilar su
          ON su.id=os.kullanici_id
         AND su.aktif=1
        INNER JOIN kurum_kullanicilari sk
          ON sk.kullanici_id=os.kullanici_id
         AND sk.kurum_id=oi.kurum_id
         AND sk.kurum_rolu='ogrenci'
         AND sk.aktif=1
        INNER JOIN ogretmen_ogrenci oo
          ON oo.ogretmen_id=oi.ogretmen_id
         AND oo.ogrenci_id=os.id
         AND oo.kurum_id=oi.kurum_id
        INNER JOIN veli_ogrenci vo
          ON vo.ogrenci_id=os.id
         AND vo.kurum_id=oi.kurum_id
        INNER JOIN veliler v
          ON v.id=vo.veli_id
         AND v.aktif=1
         AND v.kullanici_id=?
        INNER JOIN kurum_kullanicilari vk
          ON vk.kullanici_id=v.kullanici_id
         AND vk.kurum_id=oi.kurum_id
         AND vk.kurum_rolu='veli'
         AND vk.aktif=1
        LEFT JOIN ogretmen_icerik_hedefleri h
          ON h.icerik_id=oi.id
         AND h.ogrenci_id=os.id
        LEFT JOIN ogretmen_icerik_cevaplari c
          ON c.icerik_id=oi.id
         AND c.ogrenci_id=os.id
        LEFT JOIN ogrenci_odev_durumlari od
          ON od.icerik_id=oi.id
         AND od.ogrenci_id=os.id
        WHERE ".implode(' AND ',$where)."
        ORDER BY oi.olusturulma_tarihi DESC,oi.id DESC";

    // SQL begins with student id then parent id in join order.
    $queryParams=[$studentId,$parentUserId,...$filterParams];

    $stmt=$pdo->prepare($sql);
    $stmt->execute($queryParams);
    $rows=$stmt->fetchAll();
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function vi_parent_summary(array $contents,?DateTimeImmutable $now=null): array {
    $now=$now??new DateTimeImmutable('now');
    $summary=[
        'all'=>count($contents),
        'questions'=>0,
        'answered'=>0,
        'correct'=>0,
        'wrong'=>0,
        'homeworks'=>0,
        'completed'=>0,
        'overdue'=>0,
        'waiting'=>0,
    ];

    foreach($contents as $item){
        $type=(string)($item['icerik_turu']??'');
        if($type==='soru'){
            $summary['questions']++;
            if($item['secilen_cevap_indeksi']===null){
                $summary['waiting']++;
            }else{
                $summary['answered']++;
                if((int)($item['cevap_dogru']??0)===1)$summary['correct']++;
                else $summary['wrong']++;
            }
            continue;
        }

        if($type==='odev'){
            $summary['homeworks']++;
            if((int)($item['odev_tamamlandi']??0)===1){
                $summary['completed']++;
                continue;
            }
            $due=trim((string)($item['teslim_tarihi']??''));
            if($due!==''){
                try{
                    if((new DateTimeImmutable($due))<$now){
                        $summary['overdue']++;
                        continue;
                    }
                }catch(Throwable){}
            }
            $summary['waiting']++;
        }
    }

    return $summary;
}
