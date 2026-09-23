<?php
declare(strict_types=1);

function oi_h(string $value): string {
    return htmlspecialchars($value,ENT_QUOTES,'UTF-8');
}

function oi_teacher_profile(PDO $pdo,int $userId): ?array {
    if($userId<=0) return null;
    try{
        $s=$pdo->prepare("SELECT o.id,o.kullanici_id,
            COALESCE(NULLIF(TRIM(o.ad_soyad),''),k.ad_soyad) ad_soyad
            FROM ogretmenler o
            INNER JOIN kullanicilar k ON k.id=o.kullanici_id
            WHERE o.kullanici_id=? AND o.aktif=1 AND k.aktif=1
            LIMIT 1");
        $s->execute([$userId]);
        $row=$s->fetch();
        $s->closeCursor();
        return is_array($row)?$row:null;
    }catch(Throwable){
        return null;
    }
}

function oi_teacher_institutions(PDO $pdo,int $userId): array {
    try{
        $s=$pdo->prepare("SELECT DISTINCT k.id,k.ad,k.kod,k.tur
            FROM kurum_kullanicilari kk
            INNER JOIN kurumlar k ON k.id=kk.kurum_id
            WHERE kk.kullanici_id=? AND kk.kurum_rolu='ogretmen'
              AND kk.aktif=1 AND k.aktif=1
            ORDER BY k.ad,k.id");
        $s->execute([$userId]);
        $rows=$s->fetchAll();
        $s->closeCursor();
        return is_array($rows)?$rows:[];
    }catch(Throwable){
        return [];
    }
}

function oi_teacher_can_use_institution(PDO $pdo,int $userId,int $institutionId): bool {
    if($userId<=0 || $institutionId<=0) return false;
    try{
        $s=$pdo->prepare("SELECT 1
            FROM kurum_kullanicilari kk
            INNER JOIN kurumlar k ON k.id=kk.kurum_id
            WHERE kk.kullanici_id=? AND kk.kurum_id=?
              AND kk.kurum_rolu='ogretmen' AND kk.aktif=1 AND k.aktif=1
            LIMIT 1");
        $s->execute([$userId,$institutionId]);
        $ok=(bool)$s->fetchColumn();
        $s->closeCursor();
        return $ok;
    }catch(Throwable){
        return false;
    }
}

function oi_teacher_students(PDO $pdo,int $teacherId,int $institutionId): array {
    if($teacherId<=0 || $institutionId<=0) return [];
    try{
        $s=$pdo->prepare("SELECT DISTINCT o.id,o.ad,o.email
            FROM ogretmen_ogrenci oo
            INNER JOIN ogrenciler o ON o.id=oo.ogrenci_id AND o.aktif=1
            INNER JOIN kullanicilar ku ON ku.id=o.kullanici_id AND ku.aktif=1
            INNER JOIN kurum_kullanicilari kk
              ON kk.kullanici_id=ku.id
             AND kk.kurum_id=?
             AND kk.kurum_rolu='ogrenci'
             AND kk.aktif=1
            WHERE oo.ogretmen_id=?
            ORDER BY o.ad,o.id");
        $s->execute([$institutionId,$teacherId]);
        $rows=$s->fetchAll();
        $s->closeCursor();
        return is_array($rows)?$rows:[];
    }catch(Throwable){
        return [];
    }
}

function oi_lessons(PDO $pdo): array {
    try{
        $s=$pdo->query("SELECT id,kod,ad,emoji FROM dersler WHERE aktif=1 ORDER BY sira,id");
        $rows=$s?$s->fetchAll():[];
        if($s) $s->closeCursor();
        return is_array($rows)?$rows:[];
    }catch(Throwable){
        return [];
    }
}

function oi_modules(PDO $pdo): array {
    try{
        $s=$pdo->query("SELECT id,ders_id,baslik,alt_baslik FROM ders_modulleri WHERE aktif=1 ORDER BY ders_id,sira,id");
        $rows=$s?$s->fetchAll():[];
        if($s) $s->closeCursor();
        return is_array($rows)?$rows:[];
    }catch(Throwable){
        return [];
    }
}

function oi_content_types(): array {
    return [
        'soru'=>'Soru',
        'tekrar'=>'Tekrar',
        'odev'=>'Ödev',
        'not'=>'Not',
        'diger'=>'Diğer'
    ];
}

function oi_create_content(PDO $pdo,array $user,array $input,array $targetStudentIds=[]): int {
    $teacher=oi_teacher_profile($pdo,(int)$user['id']);
    if(!$teacher) throw new RuntimeException('Öğretmen profili bulunamadı.');

    $institutionId=(int)($input['kurum_id']??0);
    $lessonId=(int)($input['ders_id']??0);
    $moduleId=(int)($input['ders_modulu_id']??0);
    $type=(string)($input['icerik_turu']??'soru');
    $title=trim((string)($input['baslik']??''));
    $topic=trim((string)($input['konu_basligi']??''));
    $body=trim((string)($input['icerik_metni']??''));
    $question=trim((string)($input['soru']??''));
    $explanation=trim((string)($input['aciklama']??''));
    $star=max(0,min(20,(int)($input['yildiz_degeri']??0)));

    if(!oi_teacher_can_use_institution($pdo,(int)$user['id'],$institutionId)){
        throw new RuntimeException('Bu kurum için içerik ekleme yetkin yok.');
    }
    if(!array_key_exists($type,oi_content_types())) throw new RuntimeException('İçerik türü geçersiz.');
    if(mb_strlen($title)<2 || mb_strlen($title)>190) throw new RuntimeException('Başlığı kontrol et.');

    $s=$pdo->prepare('SELECT id FROM dersler WHERE id=? AND aktif=1 LIMIT 1');
    $s->execute([$lessonId]);
    $validLesson=(int)($s->fetchColumn()?:0);
    $s->closeCursor();
    if($validLesson<=0) throw new RuntimeException('Ders seç.');

    if($moduleId>0){
        $s=$pdo->prepare('SELECT baslik FROM ders_modulleri WHERE id=? AND ders_id=? AND aktif=1 LIMIT 1');
        $s->execute([$moduleId,$lessonId]);
        $moduleTitle=(string)($s->fetchColumn()?:'');
        $s->closeCursor();
        if($moduleTitle==='') throw new RuntimeException('Seçilen konu bu derse ait değil.');
        if($topic==='') $topic=$moduleTitle;
    } else {
        $moduleId=0;
    }
    if($topic==='') $topic='Genel';

    $options=[];
    $correct=null;
    if($type==='soru'){
        if(mb_strlen($question)<2) throw new RuntimeException('Soruyu yaz.');
        $rawOptions=$input['secenekler']??[];
        if(!is_array($rawOptions)) $rawOptions=[];
        foreach($rawOptions as $option){
            $option=trim((string)$option);
            if($option!=='') $options[]=$option;
        }
        if(count($options)<2 || count($options)>6) throw new RuntimeException('Soru için 2 ile 6 arasında seçenek yaz.');
        $correct=(int)($input['dogru_cevap_indeksi']??-1);
        if($correct<0 || $correct>=count($options)) throw new RuntimeException('Doğru cevabı seç.');
    } elseif($body==='') {
        throw new RuntimeException('İçerik metnini yaz.');
    }

    $availableStudents=oi_teacher_students($pdo,(int)$teacher['id'],$institutionId);
    $availableIds=array_map('intval',array_column($availableStudents,'id'));
    $targetStudentIds=array_values(array_unique(array_filter(array_map('intval',$targetStudentIds),static fn(int $id):bool=>$id>0)));
    foreach($targetStudentIds as $studentId){
        if(!in_array($studentId,$availableIds,true)) throw new RuntimeException('Seçilen öğrencilerden biri bu kurumda sana bağlı değil.');
    }
    $targetType=$targetStudentIds?'secili_ogrenciler':'tum_ogrenciler';

    $pdo->beginTransaction();
    try{
        $s=$pdo->prepare("INSERT INTO ogretmen_icerikleri
          (kurum_id,ogretmen_id,ders_id,ders_modulu_id,konu_basligi,icerik_turu,baslik,icerik_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,yildiz_degeri,hedef_turu,aktif)
          VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,1)");
        $s->execute([
            $institutionId,(int)$teacher['id'],$lessonId,$moduleId>0?$moduleId:null,$topic,$type,$title,
            $body!==''?$body:null,$question!==''?$question:null,$options?json_encode($options,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES):null,
            $correct,$explanation!==''?$explanation:null,$star,$targetType
        ]);
        $contentId=(int)$pdo->lastInsertId();
        $s->closeCursor();

        if($targetStudentIds){
            $target=$pdo->prepare('INSERT INTO ogretmen_icerik_hedefleri (icerik_id,ogrenci_id) VALUES (?,?)');
            foreach($targetStudentIds as $studentId) $target->execute([$contentId,$studentId]);
            $target->closeCursor();
        }
        $pdo->commit();
    }catch(Throwable $e){
        if($pdo->inTransaction()) $pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$user['id'],null,'ogretmen_icerik_olustur','İçerik #'.$contentId.' / '.$type.' / kurum '.$institutionId);
    return $contentId;
}

function oi_teacher_contents(PDO $pdo,int $teacherId): array {
    if($teacherId<=0) return [];
    try{
        $s=$pdo->prepare("SELECT oi.id,oi.kurum_id,oi.ders_id,oi.ders_modulu_id,oi.konu_basligi,
          oi.icerik_turu,oi.baslik,oi.icerik_metni,oi.soru,oi.hedef_turu,oi.aktif,oi.olusturulma_tarihi,
          k.ad kurum_adi,d.ad ders_adi,d.emoji ders_emoji,
          COALESCE(dm.baslik,oi.konu_basligi,'Genel') konu_adi,
          COUNT(DISTINCT h.ogrenci_id) hedef_sayisi,
          COUNT(DISTINCT c.ogrenci_id) cevap_sayisi
          FROM ogretmen_icerikleri oi
          INNER JOIN kurumlar k ON k.id=oi.kurum_id
          INNER JOIN dersler d ON d.id=oi.ders_id
          LEFT JOIN ders_modulleri dm ON dm.id=oi.ders_modulu_id
          LEFT JOIN ogretmen_icerik_hedefleri h ON h.icerik_id=oi.id
          LEFT JOIN ogretmen_icerik_cevaplari c ON c.icerik_id=oi.id
          WHERE oi.ogretmen_id=?
          GROUP BY oi.id,k.ad,d.ad,d.emoji,dm.baslik
          ORDER BY oi.aktif DESC,oi.olusturulma_tarihi DESC,oi.id DESC");
        $s->execute([$teacherId]);
        $rows=$s->fetchAll();
        $s->closeCursor();
        return is_array($rows)?$rows:[];
    }catch(Throwable){
        return [];
    }
}

function oi_set_content_active(PDO $pdo,array $user,int $contentId,bool $active): void {
    $teacher=oi_teacher_profile($pdo,(int)$user['id']);
    if(!$teacher || $contentId<=0) throw new RuntimeException('İçerik bulunamadı.');
    $s=$pdo->prepare('UPDATE ogretmen_icerikleri SET aktif=? WHERE id=? AND ogretmen_id=?');
    $s->execute([$active?1:0,$contentId,(int)$teacher['id']]);
    $changed=$s->rowCount();
    $s->closeCursor();
    if($changed<1) throw new RuntimeException('İçerik bulunamadı veya zaten aynı durumda.');
    auth_audit($pdo,(int)$user['id'],null,$active?'ogretmen_icerik_aktif':'ogretmen_icerik_pasif','İçerik #'.$contentId);
}

function oi_student_teachers(PDO $pdo,int $studentId): array {
    if($studentId<=0) return [];
    try{
        $s=$pdo->prepare("SELECT DISTINCT og.id,
          COALESCE(NULLIF(TRIM(og.ad_soyad),''),ku.ad_soyad) ad_soyad,
          k.id kurum_id,k.ad kurum_adi
          FROM ogretmen_ogrenci oo
          INNER JOIN ogretmenler og ON og.id=oo.ogretmen_id AND og.aktif=1
          INNER JOIN kullanicilar ku ON ku.id=og.kullanici_id AND ku.aktif=1
          INNER JOIN ogrenciler os ON os.id=oo.ogrenci_id AND os.aktif=1
          INNER JOIN kullanicilar ks ON ks.id=os.kullanici_id AND ks.aktif=1
          INNER JOIN kurum_kullanicilari kko
            ON kko.kullanici_id=og.kullanici_id
           AND kko.kurum_rolu='ogretmen' AND kko.aktif=1
          INNER JOIN kurum_kullanicilari kks
            ON kks.kullanici_id=os.kullanici_id
           AND kks.kurum_id=kko.kurum_id
           AND kks.kurum_rolu='ogrenci' AND kks.aktif=1
          INNER JOIN kurumlar k ON k.id=kko.kurum_id AND k.aktif=1
          WHERE oo.ogrenci_id=?
          ORDER BY ku.ad_soyad,k.ad");
        $s->execute([$studentId]);
        $rows=$s->fetchAll();
        $s->closeCursor();
        return is_array($rows)?$rows:[];
    }catch(Throwable){
        return [];
    }
}

function oi_student_contents(PDO $pdo,int $studentId,?int $contentId=null): array {
    if($studentId<=0) return [];
    try{
        $sql="SELECT DISTINCT oi.*, 
          COALESCE(NULLIF(TRIM(og.ad_soyad),''),ktu.ad_soyad) ogretmen_adi,
          k.ad kurum_adi,d.ad ders_adi,d.kod ders_kodu,d.emoji ders_emoji,
          COALESCE(dm.baslik,oi.konu_basligi,'Genel') konu_adi,
          c.secilen_cevap_indeksi,c.dogru cevap_dogru,c.deneme_sayisi,c.guncellenme_tarihi cevap_tarihi
          FROM ogretmen_icerikleri oi
          INNER JOIN ogretmenler og ON og.id=oi.ogretmen_id AND og.aktif=1
          INNER JOIN kullanicilar ktu ON ktu.id=og.kullanici_id AND ktu.aktif=1
          INNER JOIN kurumlar k ON k.id=oi.kurum_id AND k.aktif=1
          INNER JOIN dersler d ON d.id=oi.ders_id AND d.aktif=1
          LEFT JOIN ders_modulleri dm ON dm.id=oi.ders_modulu_id
          INNER JOIN ogretmen_ogrenci oo ON oo.ogretmen_id=oi.ogretmen_id AND oo.ogrenci_id=?
          INNER JOIN ogrenciler os ON os.id=? AND os.aktif=1
          INNER JOIN kullanicilar ksu ON ksu.id=os.kullanici_id AND ksu.aktif=1
          INNER JOIN kurum_kullanicilari kks
            ON kks.kurum_id=oi.kurum_id
           AND kks.kullanici_id=ksu.id
           AND kks.kurum_rolu='ogrenci'
           AND kks.aktif=1
          INNER JOIN kurum_kullanicilari kko
            ON kko.kurum_id=oi.kurum_id
           AND kko.kullanici_id=og.kullanici_id
           AND kko.kurum_rolu='ogretmen'
           AND kko.aktif=1
          LEFT JOIN ogretmen_icerik_hedefleri h
            ON h.icerik_id=oi.id AND h.ogrenci_id=?
          LEFT JOIN ogretmen_icerik_cevaplari c
            ON c.icerik_id=oi.id AND c.ogrenci_id=?
          WHERE oi.aktif=1
            AND (oi.hedef_turu='tum_ogrenciler' OR h.ogrenci_id IS NOT NULL)";
        $params=[$studentId,$studentId,$studentId,$studentId];
        if($contentId!==null){
            $sql.=' AND oi.id=?';
            $params[]=$contentId;
        }
        $sql.=' ORDER BY og.ad_soyad,d.sira,d.id,COALESCE(dm.sira,999999),oi.olusturulma_tarihi DESC,oi.id DESC';
        $s=$pdo->prepare($sql);
        $s->execute($params);
        $rows=$s->fetchAll();
        $s->closeCursor();
        return is_array($rows)?$rows:[];
    }catch(Throwable){
        return [];
    }
}

function oi_answer_question(PDO $pdo,int $studentId,int $contentId,int $selectedIndex): bool {
    $rows=oi_student_contents($pdo,$studentId,$contentId);
    $content=$rows[0]??null;
    if(!is_array($content) || (string)$content['icerik_turu']!=='soru') throw new RuntimeException('Soru bulunamadı.');

    $options=json_decode((string)($content['secenekler_json']??''),true);
    if(!is_array($options) || $selectedIndex<0 || $selectedIndex>=count($options)) throw new RuntimeException('Bir cevap seç.');
    $correctIndex=(int)$content['dogru_cevap_indeksi'];
    $correct=$selectedIndex===$correctIndex;

    $s=$pdo->prepare("INSERT INTO ogretmen_icerik_cevaplari
      (icerik_id,ogrenci_id,secilen_cevap_indeksi,dogru,deneme_sayisi,cevap_tarihi)
      VALUES (?,?,?,?,1,NOW())
      ON DUPLICATE KEY UPDATE
        secilen_cevap_indeksi=VALUES(secilen_cevap_indeksi),
        dogru=VALUES(dogru),
        deneme_sayisi=deneme_sayisi+1,
        cevap_tarihi=NOW()");
    $s->execute([$contentId,$studentId,$selectedIndex,$correct?1:0]);
    $s->closeCursor();
    return $correct;
}
