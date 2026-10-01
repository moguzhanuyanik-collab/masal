<?php
declare(strict_types=1);

function kid_table_exists(PDO $pdo,string $table): bool {
    static $cache=[];
    $key=spl_object_id($pdo).':'.$table;
    if(array_key_exists($key,$cache)) return $cache[$key];
    try{
        $s=$pdo->prepare("SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?");
        $s->execute([$table]);
        $cache[$key]=(int)$s->fetchColumn()>0;
        $s->closeCursor();
    }catch(Throwable){
        $cache[$key]=false;
    }
    return $cache[$key];
}

function kid_group_context(PDO $pdo,int $institutionId,int $contentId,int $groupId): ?array {
    if($institutionId<=0 || $contentId<=0 || $groupId<=0) return null;
    if(!kid_table_exists($pdo,'ogretmen_icerik_hedef_gruplari')) return null;

    $s=$pdo->prepare("SELECT kurum_sinif_id id,
        MAX(grup_adi) ad,
        MAX(grup_turu) tur,
        MAX(sinif_seviyesi) sinif_seviyesi,
        COUNT(DISTINCT ogrenci_id) hedef_sayisi
      FROM ogretmen_icerik_hedef_gruplari
      WHERE kurum_id=?
        AND icerik_id=?
        AND kurum_sinif_id=?
      GROUP BY kurum_sinif_id
      LIMIT 1");
    $s->execute([$institutionId,$contentId,$groupId]);
    $row=$s->fetch();
    $s->closeCursor();
    return is_array($row)?$row:null;
}

function kid_content_detail(PDO $pdo,int $institutionId,int $contentId,int $groupId=0): ?array {
    if($institutionId<=0 || $contentId<=0) return null;
    $groupId=max(0,$groupId);

    $s=$pdo->prepare("SELECT oi.*,
      COALESCE(NULLIF(TRIM(og.ad_soyad),''),u.ad_soyad) ogretmen_adi,
      k.ad kurum_adi,d.ad ders_adi,d.emoji ders_emoji,
      COALESCE(dm.baslik,oi.konu_basligi,'Genel') konu_adi
      FROM ogretmen_icerikleri oi
      INNER JOIN kurumlar k ON k.id=oi.kurum_id AND k.aktif=1
      INNER JOIN ogretmenler og ON og.id=oi.ogretmen_id AND og.aktif=1
      INNER JOIN kullanicilar u ON u.id=og.kullanici_id AND u.aktif=1
      INNER JOIN kurum_kullanicilari tk
        ON tk.kurum_id=oi.kurum_id
       AND tk.kullanici_id=og.kullanici_id
       AND tk.kurum_rolu='ogretmen'
       AND tk.aktif=1
      INNER JOIN dersler d ON d.id=oi.ders_id
      LEFT JOIN ders_modulleri dm ON dm.id=oi.ders_modulu_id
      WHERE oi.id=? AND oi.kurum_id=?
      LIMIT 1");
    $s->execute([$contentId,$institutionId]);
    $content=$s->fetch();
    $s->closeCursor();
    if(!is_array($content)) return null;

    $groupContext=null;
    $groupJoin='';
    $params=[$contentId,$institutionId];
    if($groupId>0){
        $groupContext=kid_group_context($pdo,$institutionId,$contentId,$groupId);
        if(!is_array($groupContext)) return null;
        $groupJoin="INNER JOIN ogretmen_icerik_hedef_gruplari gh
          ON gh.icerik_id=oi.id
         AND gh.kurum_id=oi.kurum_id
         AND gh.kurum_sinif_id=?
         AND gh.ogrenci_id=o.id";
        $params=[$groupId,$contentId,$institutionId];
    }

    $s=$pdo->prepare("SELECT DISTINCT o.id,o.ad,o.email,o.sinif_seviyesi,
      c.secilen_cevap_indeksi,c.dogru cevap_dogru,c.deneme_sayisi,
      c.cevap_tarihi,c.guncellenme_tarihi cevap_guncellenme_tarihi,
      COALESCE(od.tamamlandi,0) odev_tamamlandi,
      od.tamamlanma_tarihi odev_tamamlanma_tarihi
      FROM ogretmen_icerikleri oi
      INNER JOIN ogretmen_ogrenci oo
        ON oo.ogretmen_id=oi.ogretmen_id
       AND oo.kurum_id=oi.kurum_id
      INNER JOIN ogrenciler o
        ON o.id=oo.ogrenci_id
       AND o.aktif=1
      INNER JOIN kullanicilar su
        ON su.id=o.kullanici_id
       AND su.aktif=1
      INNER JOIN kurum_kullanicilari sk
        ON sk.kurum_id=oi.kurum_id
       AND sk.kullanici_id=o.kullanici_id
       AND sk.kurum_rolu='ogrenci'
       AND sk.aktif=1
      LEFT JOIN ogretmen_icerik_hedefleri h
        ON h.icerik_id=oi.id
       AND h.ogrenci_id=o.id
      {$groupJoin}
      LEFT JOIN ogretmen_icerik_cevaplari c
        ON c.icerik_id=oi.id
       AND c.ogrenci_id=o.id
      LEFT JOIN ogrenci_odev_durumlari od
        ON od.icerik_id=oi.id
       AND od.ogrenci_id=o.id
      WHERE oi.id=?
        AND oi.kurum_id=?
        AND (oi.hedef_turu='tum_ogrenciler' OR h.ogrenci_id IS NOT NULL)
      ORDER BY o.sinif_seviyesi,o.ad,o.id");
    $s->execute($params);
    $students=$s->fetchAll();
    $s->closeCursor();
    if(!is_array($students)) $students=[];

    $summary=[
        'targeted'=>count($students),
        'answered'=>0,
        'correct'=>0,
        'wrong'=>0,
        'waiting'=>0,
        'completed'=>0,
        'overdue'=>0,
    ];

    $type=(string)$content['icerik_turu'];
    if($type==='soru'){
        foreach($students as $student){
            if($student['secilen_cevap_indeksi']===null){
                $summary['waiting']++;
                continue;
            }
            $summary['answered']++;
            if((int)$student['cevap_dogru']===1)$summary['correct']++;
            else $summary['wrong']++;
        }
    }elseif($type==='odev'){
        $dueAt=null;
        if(!empty($content['teslim_tarihi'])){
            try{$dueAt=new DateTimeImmutable((string)$content['teslim_tarihi']);}catch(Throwable){}
        }
        $now=new DateTimeImmutable('now');
        foreach($students as $student){
            if((int)$student['odev_tamamlandi']===1){
                $summary['completed']++;
            }elseif($dueAt && $dueAt<$now){
                $summary['overdue']++;
            }else{
                $summary['waiting']++;
            }
        }
    }else{
        $summary['waiting']=$summary['targeted'];
    }

    return [
        'content'=>$content,
        'students'=>$students,
        'summary'=>$summary,
        'group'=>$groupContext,
    ];
}
