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
            WHERE oo.ogretmen_id=? AND oo.kurum_id=?
            ORDER BY o.ad,o.id");
        $s->execute([$institutionId,$teacherId,$institutionId]);
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
    $dueAt=null;
    $dueRaw=trim((string)($input['teslim_tarihi']??''));
    if($type==='odev' && $dueRaw!==''){
        $due=DateTimeImmutable::createFromFormat('!Y-m-d\\TH:i',$dueRaw);
        $errors=DateTimeImmutable::getLastErrors();
        if(!$due || (is_array($errors) && (($errors['warning_count']??0)>0 || ($errors['error_count']??0)>0))){
            throw new RuntimeException('Teslim tarihini kontrol et.');
        }
        $dueAt=$due->format('Y-m-d H:i:s');
    }

    if(!oi_teacher_can_use_institution($pdo,(int)$user['id'],$institutionId)){
        throw new RuntimeException('Bu kurum için içerik ekleme yetkin yok.');
    }
    if(!array_key_exists($type,oi_content_types())) throw new RuntimeException('İçerik türü geçersiz.');
    if($type!=='soru') $star=0;
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
          (kurum_id,ogretmen_id,ders_id,ders_modulu_id,konu_basligi,icerik_turu,baslik,icerik_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,yildiz_degeri,hedef_turu,teslim_tarihi,aktif)
          VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,1)");
        $s->execute([
            $institutionId,(int)$teacher['id'],$lessonId,$moduleId>0?$moduleId:null,$topic,$type,$title,
            $body!==''?$body:null,$question!==''?$question:null,$options?json_encode($options,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES):null,
            $correct,$explanation!==''?$explanation:null,$star,$targetType,$dueAt
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
          oi.icerik_turu,oi.baslik,oi.icerik_metni,oi.soru,oi.yildiz_degeri,oi.hedef_turu,oi.teslim_tarihi,oi.aktif,oi.olusturulma_tarihi,
          k.ad kurum_adi,d.ad ders_adi,d.emoji ders_emoji,
          COALESCE(dm.baslik,oi.konu_basligi,'Genel') konu_adi,
          COUNT(DISTINCT h.ogrenci_id) hedef_sayisi,
          COUNT(DISTINCT c.ogrenci_id) cevap_sayisi,
          COUNT(DISTINCT od.ogrenci_id) odev_durum_sayisi
          FROM ogretmen_icerikleri oi
          INNER JOIN kurumlar k ON k.id=oi.kurum_id
          INNER JOIN dersler d ON d.id=oi.ders_id
          LEFT JOIN ders_modulleri dm ON dm.id=oi.ders_modulu_id
          LEFT JOIN ogretmen_icerik_hedefleri h ON h.icerik_id=oi.id
          LEFT JOIN ogretmen_icerik_cevaplari c ON c.icerik_id=oi.id
          LEFT JOIN ogrenci_odev_durumlari od ON od.icerik_id=oi.id
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
          WHERE oo.ogrenci_id=? AND oo.kurum_id=kko.kurum_id
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
          c.secilen_cevap_indeksi,c.dogru cevap_dogru,c.deneme_sayisi,c.guncellenme_tarihi cevap_tarihi,
          COALESCE(od.tamamlandi,0) odev_tamamlandi,od.tamamlanma_tarihi odev_tamamlanma_tarihi
          FROM ogretmen_icerikleri oi
          INNER JOIN ogretmenler og ON og.id=oi.ogretmen_id AND og.aktif=1
          INNER JOIN kullanicilar ktu ON ktu.id=og.kullanici_id AND ktu.aktif=1
          INNER JOIN kurumlar k ON k.id=oi.kurum_id AND k.aktif=1
          INNER JOIN dersler d ON d.id=oi.ders_id AND d.aktif=1
          LEFT JOIN ders_modulleri dm ON dm.id=oi.ders_modulu_id
          INNER JOIN ogretmen_ogrenci oo ON oo.ogretmen_id=oi.ogretmen_id AND oo.ogrenci_id=? AND oo.kurum_id=oi.kurum_id
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
          LEFT JOIN ogrenci_odev_durumlari od
            ON od.icerik_id=oi.id AND od.ogrenci_id=?
          WHERE oi.aktif=1
            AND (oi.hedef_turu='tum_ogrenciler' OR h.ogrenci_id IS NOT NULL)";
        $params=[$studentId,$studentId,$studentId,$studentId,$studentId];
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

function oi_set_homework_completed(PDO $pdo,int $studentId,int $contentId,bool $completed): void {
    if($studentId<=0 || $contentId<=0) throw new RuntimeException('Ödev bulunamadı.');
    $rows=oi_student_contents($pdo,$studentId,$contentId);
    $content=$rows[0]??null;
    if(!is_array($content) || (string)($content['icerik_turu']??'')!=='odev'){
        throw new RuntimeException('Ödev bulunamadı veya artık erişilemiyor.');
    }

    $s=$pdo->prepare("INSERT INTO ogrenci_odev_durumlari
      (icerik_id,ogrenci_id,tamamlandi,tamamlanma_tarihi)
      VALUES (?,?,?,?)
      ON DUPLICATE KEY UPDATE
        tamamlandi=VALUES(tamamlandi),
        tamamlanma_tarihi=VALUES(tamamlanma_tarihi)");
    $s->execute([
        $contentId,
        $studentId,
        $completed?1:0,
        $completed?date('Y-m-d H:i:s'):null
    ]);
    $s->closeCursor();
}

function oi_answer_question(PDO $pdo,int $studentId,int $contentId,int $selectedIndex,?int &$awardedStars=null): bool {
    $awardedStars=0;
    $rows=oi_student_contents($pdo,$studentId,$contentId);
    $content=$rows[0]??null;
    if(!is_array($content) || (string)$content['icerik_turu']!=='soru') throw new RuntimeException('Soru bulunamadı.');

    $options=json_decode((string)($content['secenekler_json']??''),true);
    if(!is_array($options) || $selectedIndex<0 || $selectedIndex>=count($options)) throw new RuntimeException('Bir cevap seç.');
    $correctIndex=(int)$content['dogru_cevap_indeksi'];
    $correct=$selectedIndex===$correctIndex;
    $reward=max(0,min(20,(int)($content['yildiz_degeri']??0)));
    $ownsTransaction=!$pdo->inTransaction();

    if($ownsTransaction) $pdo->beginTransaction();
    try{
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

        if($correct && $reward>0){
            $award=$pdo->prepare("INSERT IGNORE INTO ogretmen_icerik_yildiz_odulleri
              (icerik_id,ogrenci_id,yildiz_degeri,kazanma_tarihi)
              VALUES (?,?,?,NOW())");
            $award->execute([$contentId,$studentId,$reward]);
            if($award->rowCount()>0) $awardedStars=$reward;
            $award->closeCursor();
        }

        if($ownsTransaction) $pdo->commit();
    }catch(Throwable $e){
        if($ownsTransaction && $pdo->inTransaction()) $pdo->rollBack();
        throw $e;
    }

    return $correct;
}

function oi_teacher_content_for_edit(PDO $pdo,array $user,int $contentId): ?array {
    $teacher=oi_teacher_profile($pdo,(int)$user['id']);
    if(!$teacher || $contentId<=0) return null;

    $s=$pdo->prepare("SELECT oi.*,
      COUNT(DISTINCT c.ogrenci_id) soru_cevap_sayisi,
      COUNT(DISTINCT od.ogrenci_id) odev_durum_sayisi
      FROM ogretmen_icerikleri oi
      LEFT JOIN ogretmen_icerik_cevaplari c ON c.icerik_id=oi.id
      LEFT JOIN ogrenci_odev_durumlari od ON od.icerik_id=oi.id
      WHERE oi.id=? AND oi.ogretmen_id=?
      GROUP BY oi.id
      LIMIT 1");
    $s->execute([$contentId,(int)$teacher['id']]);
    $row=$s->fetch();
    $s->closeCursor();
    if(!is_array($row)) return null;

    $targets=$pdo->prepare('SELECT ogrenci_id FROM ogretmen_icerik_hedefleri WHERE icerik_id=? ORDER BY ogrenci_id');
    $targets->execute([$contentId]);
    $row['hedef_ogrenciler']=array_map('intval',$targets->fetchAll(PDO::FETCH_COLUMN)?:[]);
    $targets->closeCursor();
    $row['aktivite_sayisi']=(int)($row['soru_cevap_sayisi']??0)+(int)($row['odev_durum_sayisi']??0);
    return $row;
}

function oi_normalize_content_input(PDO $pdo,int $teacherId,int $institutionId,array $input,array $targetStudentIds=[]): array {
    $lessonId=(int)($input['ders_id']??0);
    $moduleId=(int)($input['ders_modulu_id']??0);
    $type=(string)($input['icerik_turu']??'soru');
    $title=trim((string)($input['baslik']??''));
    $topic=trim((string)($input['konu_basligi']??''));
    $body=trim((string)($input['icerik_metni']??''));
    $question=trim((string)($input['soru']??''));
    $explanation=trim((string)($input['aciklama']??''));
    $star=max(0,min(20,(int)($input['yildiz_degeri']??0)));
    $dueAt=null;
    $dueRaw=trim((string)($input['teslim_tarihi']??''));

    if(!array_key_exists($type,oi_content_types())) throw new RuntimeException('İçerik türü geçersiz.');
    if($type!=='soru') $star=0;
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
    }else{
        $moduleId=0;
    }
    if($topic==='') $topic='Genel';

    if($type==='odev' && $dueRaw!==''){
        $due=DateTimeImmutable::createFromFormat('!Y-m-d\TH:i',$dueRaw);
        $errors=DateTimeImmutable::getLastErrors();
        if(!$due || (is_array($errors) && (($errors['warning_count']??0)>0 || ($errors['error_count']??0)>0))){
            throw new RuntimeException('Teslim tarihini kontrol et.');
        }
        $dueAt=$due->format('Y-m-d H:i:s');
    }

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
        $body=null;
    }else{
        if($body==='') throw new RuntimeException('İçerik metnini yaz.');
        $question=null;
        $explanation=null;
        $options=[];
        $correct=null;
        if($type!=='odev') $dueAt=null;
    }

    $availableStudents=oi_teacher_students($pdo,$teacherId,$institutionId);
    $availableIds=array_map('intval',array_column($availableStudents,'id'));
    $targetStudentIds=array_values(array_unique(array_filter(array_map('intval',$targetStudentIds),static fn(int $id):bool=>$id>0)));
    foreach($targetStudentIds as $studentId){
        if(!in_array($studentId,$availableIds,true)){
            throw new RuntimeException('Seçilen öğrencilerden biri bu kurumda sana bağlı değil.');
        }
    }

    return [
        'ders_id'=>$lessonId,
        'ders_modulu_id'=>$moduleId>0?$moduleId:null,
        'konu_basligi'=>$topic,
        'icerik_turu'=>$type,
        'baslik'=>$title,
        'icerik_metni'=>$body!==null && $body!==''?$body:null,
        'soru'=>$question!==null && $question!==''?$question:null,
        'secenekler_json'=>$options?json_encode($options,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES):null,
        'dogru_cevap_indeksi'=>$correct,
        'aciklama'=>$explanation!==null && $explanation!==''?$explanation:null,
        'yildiz_degeri'=>$star,
        'hedef_turu'=>$targetStudentIds?'secili_ogrenciler':'tum_ogrenciler',
        'teslim_tarihi'=>$dueAt,
        'hedef_ogrenciler'=>$targetStudentIds,
    ];
}

function oi_update_content(PDO $pdo,array $user,int $contentId,array $input,array $targetStudentIds=[]): void {
    $teacher=oi_teacher_profile($pdo,(int)$user['id']);
    if(!$teacher) throw new RuntimeException('Öğretmen profili bulunamadı.');

    $current=oi_teacher_content_for_edit($pdo,$user,$contentId);
    if(!$current) throw new RuntimeException('İçerik bulunamadı.');
    if((int)($current['aktivite_sayisi']??0)>0){
        throw new RuntimeException('Bu içerikte öğrenci yanıtı veya ödev durumu oluşmuş. Geçmiş veriyi korumak için içeriği değiştirmek yerine kopyala ve yeni yayını düzenle.');
    }

    $institutionId=(int)$current['kurum_id'];
    if(!oi_teacher_can_use_institution($pdo,(int)$user['id'],$institutionId)){
        throw new RuntimeException('Bu kurum için içerik düzenleme yetkin yok.');
    }

    $normalized=oi_normalize_content_input($pdo,(int)$teacher['id'],$institutionId,$input,$targetStudentIds);

    $pdo->beginTransaction();
    try{
        $s=$pdo->prepare("UPDATE ogretmen_icerikleri SET
          ders_id=?,ders_modulu_id=?,konu_basligi=?,icerik_turu=?,baslik=?,
          icerik_metni=?,soru=?,secenekler_json=?,dogru_cevap_indeksi=?,aciklama=?,yildiz_degeri=?,
          hedef_turu=?,teslim_tarihi=?
          WHERE id=? AND ogretmen_id=? AND kurum_id=?");
        $s->execute([
            $normalized['ders_id'],$normalized['ders_modulu_id'],$normalized['konu_basligi'],$normalized['icerik_turu'],
            $normalized['baslik'],$normalized['icerik_metni'],$normalized['soru'],$normalized['secenekler_json'],
            $normalized['dogru_cevap_indeksi'],$normalized['aciklama'],$normalized['yildiz_degeri'],$normalized['hedef_turu'],$normalized['teslim_tarihi'],
            $contentId,(int)$teacher['id'],$institutionId
        ]);
        $s->closeCursor();

        $delete=$pdo->prepare('DELETE FROM ogretmen_icerik_hedefleri WHERE icerik_id=?');
        $delete->execute([$contentId]);
        $delete->closeCursor();

        if($normalized['hedef_ogrenciler']){
            $insert=$pdo->prepare('INSERT INTO ogretmen_icerik_hedefleri (icerik_id,ogrenci_id) VALUES (?,?)');
            foreach($normalized['hedef_ogrenciler'] as $studentId) $insert->execute([$contentId,$studentId]);
            $insert->closeCursor();
        }
        $pdo->commit();
    }catch(Throwable $e){
        if($pdo->inTransaction()) $pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$user['id'],null,'ogretmen_icerik_guncelle','İçerik #'.$contentId.' / kurum '.$institutionId);
}

function oi_duplicate_content(PDO $pdo,array $user,int $contentId): int {
    $teacher=oi_teacher_profile($pdo,(int)$user['id']);
    if(!$teacher) throw new RuntimeException('Öğretmen profili bulunamadı.');

    $current=oi_teacher_content_for_edit($pdo,$user,$contentId);
    if(!$current) throw new RuntimeException('İçerik bulunamadı.');

    $institutionId=(int)$current['kurum_id'];
    if(!oi_teacher_can_use_institution($pdo,(int)$user['id'],$institutionId)){
        throw new RuntimeException('Bu kurum için içerik kopyalama yetkin yok.');
    }

    $title=trim((string)$current['baslik']);
    $copyTitle=mb_substr($title.' (Kopya)',0,190);

    $pdo->beginTransaction();
    try{
        $s=$pdo->prepare("INSERT INTO ogretmen_icerikleri
          (kurum_id,ogretmen_id,ders_id,ders_modulu_id,konu_basligi,icerik_turu,baslik,
           icerik_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,yildiz_degeri,
           hedef_turu,teslim_tarihi,aktif)
          VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,0)");
        $s->execute([
            $institutionId,(int)$teacher['id'],(int)$current['ders_id'],$current['ders_modulu_id']!==null?(int)$current['ders_modulu_id']:null,
            (string)$current['konu_basligi'],(string)$current['icerik_turu'],$copyTitle,
            $current['icerik_metni'],$current['soru'],$current['secenekler_json'],$current['dogru_cevap_indeksi'],
            $current['aciklama'],(int)($current['yildiz_degeri']??0),(string)$current['hedef_turu'],$current['teslim_tarihi']
        ]);
        $newId=(int)$pdo->lastInsertId();
        $s->closeCursor();

        $targets=array_map('intval',$current['hedef_ogrenciler']??[]);
        if($targets){
            $insert=$pdo->prepare('INSERT INTO ogretmen_icerik_hedefleri (icerik_id,ogrenci_id) VALUES (?,?)');
            foreach($targets as $studentId) $insert->execute([$newId,$studentId]);
            $insert->closeCursor();
        }
        $pdo->commit();
    }catch(Throwable $e){
        if($pdo->inTransaction()) $pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$user['id'],null,'ogretmen_icerik_kopyala','Kaynak #'.$contentId.' / Kopya #'.$newId.' / kurum '.$institutionId);
    return $newId;
}

function oi_teacher_content_detail(PDO $pdo,array $user,int $contentId): ?array {
    $teacher=oi_teacher_profile($pdo,(int)$user['id']);
    if(!$teacher || $contentId<=0) return null;

    $s=$pdo->prepare("SELECT oi.*,
      k.ad kurum_adi,d.ad ders_adi,d.emoji ders_emoji,
      COALESCE(dm.baslik,oi.konu_basligi,'Genel') konu_adi
      FROM ogretmen_icerikleri oi
      INNER JOIN kurumlar k ON k.id=oi.kurum_id AND k.aktif=1
      INNER JOIN dersler d ON d.id=oi.ders_id
      LEFT JOIN ders_modulleri dm ON dm.id=oi.ders_modulu_id
      WHERE oi.id=? AND oi.ogretmen_id=?
      LIMIT 1");
    $s->execute([$contentId,(int)$teacher['id']]);
    $content=$s->fetch();
    $s->closeCursor();
    if(!is_array($content)) return null;

    $institutionId=(int)$content['kurum_id'];
    if(!oi_teacher_can_use_institution($pdo,(int)$user['id'],$institutionId)) return null;

    $s=$pdo->prepare("SELECT DISTINCT o.id,o.ad,o.email,o.sinif_seviyesi,
      c.secilen_cevap_indeksi,c.dogru cevap_dogru,c.deneme_sayisi,
      c.cevap_tarihi,c.guncellenme_tarihi cevap_guncellenme_tarihi,
      yr.yildiz_degeri kazanilan_yildiz,
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
      INNER JOIN kurum_kullanicilari kk
        ON kk.kurum_id=oi.kurum_id
       AND kk.kullanici_id=o.kullanici_id
       AND kk.kurum_rolu='ogrenci'
       AND kk.aktif=1
      LEFT JOIN ogretmen_icerik_hedefleri h
        ON h.icerik_id=oi.id
       AND h.ogrenci_id=o.id
      LEFT JOIN ogretmen_icerik_cevaplari c
        ON c.icerik_id=oi.id
       AND c.ogrenci_id=o.id
      LEFT JOIN ogrenci_odev_durumlari od
        ON od.icerik_id=oi.id
       AND od.ogrenci_id=o.id
      LEFT JOIN ogretmen_icerik_yildiz_odulleri yr
        ON yr.icerik_id=oi.id
       AND yr.ogrenci_id=o.id
      WHERE oi.id=?
        AND oi.ogretmen_id=?
        AND (oi.hedef_turu='tum_ogrenciler' OR h.ogrenci_id IS NOT NULL)
      ORDER BY o.sinif_seviyesi,o.ad,o.id");
    $s->execute([$contentId,(int)$teacher['id']]);
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
        'rewarded'=>0,
        'reward_stars'=>0,
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
            if((int)($student['kazanilan_yildiz']??0)>0){
                $summary['rewarded']++;
                $summary['reward_stars']+=(int)$student['kazanilan_yildiz'];
            }
        }
    }elseif($type==='odev'){
        $now=new DateTimeImmutable('now');
        $dueAt=null;
        if(!empty($content['teslim_tarihi'])){
            try{$dueAt=new DateTimeImmutable((string)$content['teslim_tarihi']);}catch(Throwable){}
        }
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

    return ['content'=>$content,'students'=>$students,'summary'=>$summary];
}

