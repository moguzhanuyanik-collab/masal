<?php
declare(strict_types=1);

function bd_table_exists(PDO $pdo,string $table): bool {
    if(!preg_match('/^[A-Za-z0-9_]+$/D',$table)) return false;
    try{
        $stmt=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
        $stmt->execute([$table]);
        $exists=(int)$stmt->fetchColumn()>0;
        $stmt->closeCursor();
        return $exists;
    }catch(Throwable){
        return false;
    }
}

function bd_tables_ready(PDO $pdo): bool {
    return bd_table_exists($pdo,'kurum_duyurulari')
        && bd_table_exists($pdo,'kurum_duyuru_alicilari');
}

function bd_recipient_roles(): array {
    return ['ogretmen'=>'Öğretmenler','veli'=>'Veliler','ogrenci'=>'Öğrenciler'];
}

function bd_validate_date(string $value): ?string {
    $value=trim($value);
    if($value==='') return null;
    $date=DateTimeImmutable::createFromFormat('!Y-m-d',$value);
    $errors=DateTimeImmutable::getLastErrors();
    if(!$date || (is_array($errors) && (($errors['warning_count']??0)>0 || ($errors['error_count']??0)>0))
        || $date->format('Y-m-d')!==$value){
        throw new RuntimeException('Son gösterim tarihini kontrol et.');
    }
    return $value;
}

function bd_manageable_institutions(PDO $pdo,array $actor): array {
    $ids=auth_operational_manageable_institution_ids($pdo,$actor);
    if(!$ids) return [];
    $ph=implode(',',array_fill(0,count($ids),'?'));
    $stmt=$pdo->prepare("SELECT id,ad,kod FROM kurumlar WHERE aktif=1 AND id IN ($ph) ORDER BY ad,id");
    $stmt->execute($ids);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function bd_assert_manageable(PDO $pdo,array $actor,int $institutionId): void {
    if($institutionId<=0) throw new RuntimeException('Kurum seç.');
    if(!in_array($institutionId,auth_operational_manageable_institution_ids($pdo,$actor),true)){
        throw new RuntimeException('Bu kurum için duyuru gönderme yetkin yok.');
    }
}

function bd_institution_recipient_rows(PDO $pdo,int $institutionId,array $roles): array {
    $allowed=array_keys(bd_recipient_roles());
    $roles=array_values(array_unique(array_filter(array_map('strval',$roles),static fn(string $role):bool=>in_array($role,$allowed,true))));
    if($institutionId<=0 || !$roles) return [];
    $ph=implode(',',array_fill(0,count($roles),'?'));
    $params=array_merge([$institutionId],$roles);
    $stmt=$pdo->prepare("SELECT kk.kullanici_id,MIN(kk.kurum_rolu) kurum_rolu
        FROM kurum_kullanicilari kk
        INNER JOIN kullanicilar u ON u.id=kk.kullanici_id AND u.aktif=1
        WHERE kk.kurum_id=?
          AND kk.aktif=1
          AND kk.kurum_rolu IN ($ph)
        GROUP BY kk.kullanici_id
        ORDER BY kk.kullanici_id");
    $stmt->execute($params);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function bd_insert_announcement(
    PDO $pdo,
    int $institutionId,
    int $senderUserId,
    string $type,
    string $title,
    string $message,
    string $importance,
    string $targetRoles,
    array $recipients,
    ?string $link=null,
    ?string $expiresOn=null,
    ?string $sourceType=null,
    ?int $sourceId=null
): int {
    if(!bd_tables_ready($pdo) || !$recipients) return 0;

    $started=false;
    try{
        if(!$pdo->inTransaction()){
            $pdo->beginTransaction();
            $started=true;
        }

        if($sourceType!==null && $sourceId!==null && $sourceId>0){
            $find=$pdo->prepare("SELECT id FROM kurum_duyurulari
                WHERE kurum_id=? AND kaynak_turu=? AND kaynak_id=?
                LIMIT 1 FOR UPDATE");
            $find->execute([$institutionId,$sourceType,$sourceId]);
            $existing=(int)($find->fetchColumn()?:0);
            $find->closeCursor();
            if($existing>0){
                if($started) $pdo->commit();
                return $existing;
            }
        }

        $stmt=$pdo->prepare("INSERT INTO kurum_duyurulari
            (kurum_id,gonderen_kullanici_id,tur,kaynak_turu,kaynak_id,baslik,mesaj,onem,hedef_roller,baglanti,son_gosterim_tarihi,aktif)
            VALUES (?,?,?,?,?,?,?,?,?,?,?,1)");
        $stmt->execute([
            $institutionId,$senderUserId,$type,$sourceType,$sourceId,
            $title,$message,$importance,$targetRoles,$link,$expiresOn
        ]);
        $announcementId=(int)$pdo->lastInsertId();
        $stmt->closeCursor();

        $insert=$pdo->prepare("INSERT IGNORE INTO kurum_duyuru_alicilari
            (duyuru_id,kurum_id,kullanici_id,kurum_rolu,okundu_tarihi)
            VALUES (?,?,?,?,NULL)");
        $inserted=0;
        foreach($recipients as $recipient){
            $userId=max(0,(int)($recipient['kullanici_id']??0));
            $role=(string)($recipient['kurum_rolu']??'');
            if($userId<=0 || !in_array($role,array_keys(bd_recipient_roles()),true)) continue;
            $insert->execute([$announcementId,$institutionId,$userId,$role]);
            if($insert->rowCount()>0) $inserted++;
        }
        $insert->closeCursor();

        if($inserted<1) throw new RuntimeException('Duyuru için aktif alıcı bulunamadı.');
        if($started) $pdo->commit();
        return $announcementId;
    }catch(Throwable $e){
        if($started && $pdo->inTransaction()) $pdo->rollBack();
        throw $e;
    }
}

function bd_create_manual(PDO $pdo,array $actor,array $input): int {
    if(!bd_tables_ready($pdo)) throw new RuntimeException('Bildirim migrationı henüz kurulmamış.');
    if(!in_array(auth_effective_role($actor),['super_admin','yonetici'],true)){
        throw new RuntimeException('Duyuru gönderme yetkin yok.');
    }

    $institutionId=max(0,(int)($input['kurum_id']??0));
    bd_assert_manageable($pdo,$actor,$institutionId);

    $title=trim((string)($input['baslik']??''));
    $message=trim((string)($input['mesaj']??''));
    $importance=(string)($input['onem']??'normal');
    $roles=is_array($input['hedef_roller']??null)?$input['hedef_roller']:[];
    $roles=array_values(array_unique(array_filter(array_map('strval',$roles),static fn(string $role):bool=>array_key_exists($role,bd_recipient_roles()))));
    $expires=bd_validate_date((string)($input['son_gosterim_tarihi']??''));

    if(mb_strlen($title)<3 || mb_strlen($title)>190) throw new RuntimeException('Duyuru başlığını kontrol et.');
    if(mb_strlen($message)<3 || mb_strlen($message)>4000) throw new RuntimeException('Duyuru metnini kontrol et.');
    if(!in_array($importance,['normal','onemli','acil'],true)) throw new RuntimeException('Duyuru önem seviyesi geçersiz.');
    if(!$roles) throw new RuntimeException('En az bir alıcı grubu seç.');
    if($expires!==null && $expires<date('Y-m-d')) throw new RuntimeException('Son gösterim tarihi geçmişte olamaz.');

    $recipients=bd_institution_recipient_rows($pdo,$institutionId,$roles);
    if(!$recipients) throw new RuntimeException('Seçilen gruplarda aktif alıcı bulunamadı.');

    $id=bd_insert_announcement(
        $pdo,$institutionId,(int)$actor['id'],'duyuru',$title,$message,$importance,
        implode(',',$roles),$recipients,null,$expires,null,null
    );
    if($id<=0) throw new RuntimeException('Duyuru oluşturulamadı.');

    auth_audit($pdo,(int)$actor['id'],null,'kurum_duyuru_gonder','Duyuru #'.$id.' kurum #'.$institutionId.' alıcı '.count($recipients));
    return $id;
}

function bd_target_student_recipients(PDO $pdo,int $institutionId,array $studentIds,bool $includeParents): array {
    $studentIds=array_values(array_unique(array_filter(array_map('intval',$studentIds),static fn(int $id):bool=>$id>0)));
    if($institutionId<=0 || !$studentIds) return [];

    $ph=implode(',',array_fill(0,count($studentIds),'?'));
    $params=array_merge([$institutionId],$studentIds);
    $stmt=$pdo->prepare("SELECT DISTINCT o.kullanici_id,'ogrenci' kurum_rolu
        FROM ogrenciler o
        INNER JOIN kullanicilar u ON u.id=o.kullanici_id AND u.aktif=1
        INNER JOIN kurum_kullanicilari kk
          ON kk.kullanici_id=o.kullanici_id
         AND kk.kurum_id=?
         AND kk.kurum_rolu='ogrenci'
         AND kk.aktif=1
        WHERE o.aktif=1 AND o.id IN ($ph)");
    $stmt->execute($params);
    $recipients=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($recipients)) $recipients=[];

    if($includeParents && bd_table_exists($pdo,'veli_ogrenci') && bd_table_exists($pdo,'veliler')){
        $params=array_merge([$institutionId,$institutionId],$studentIds);
        $stmt=$pdo->prepare("SELECT DISTINCT v.kullanici_id,'veli' kurum_rolu
            FROM veli_ogrenci vo
            INNER JOIN veliler v ON v.id=vo.veli_id AND v.aktif=1
            INNER JOIN kullanicilar u ON u.id=v.kullanici_id AND u.aktif=1
            INNER JOIN kurum_kullanicilari kk
              ON kk.kullanici_id=v.kullanici_id
             AND kk.kurum_id=?
             AND kk.kurum_rolu='veli'
             AND kk.aktif=1
            WHERE vo.kurum_id=?
              AND vo.ogrenci_id IN ($ph)");
        $stmt->execute($params);
        $parentRows=$stmt->fetchAll(PDO::FETCH_ASSOC);
        $stmt->closeCursor();
        if(is_array($parentRows)) $recipients=array_merge($recipients,$parentRows);
    }

    $unique=[];
    foreach($recipients as $row){
        $userId=max(0,(int)($row['kullanici_id']??0));
        if($userId<=0) continue;
        $unique[$userId]=['kullanici_id'=>$userId,'kurum_rolu'=>(string)$row['kurum_rolu']];
    }
    return array_values($unique);
}

function bd_notify_teacher_content(
    PDO $pdo,
    int $institutionId,
    int $senderUserId,
    int $contentId,
    string $contentType,
    string $title,
    array $studentIds,
    ?string $dueAt=null
): int {
    if(!bd_tables_ready($pdo) || $institutionId<=0 || $senderUserId<=0 || $contentId<=0) return 0;
    try{
        $isHomework=$contentType==='odev';
        $recipients=bd_target_student_recipients($pdo,$institutionId,$studentIds,$isHomework);
        if(!$recipients) return 0;
        $displayTitle=$isHomework?'Yeni ödev: '.$title:'Yeni öğretmen içeriği: '.$title;
        $message=$isHomework
            ?'Öğretmenin yeni bir ödev yayınladı.'.($dueAt?' Son teslim: '.date('d.m.Y H:i',strtotime($dueAt)).'.':'')
            :'Öğretmenin yeni bir içerik yayınladı. Öğretmenim bölümünden inceleyebilirsin.';
        return bd_insert_announcement(
            $pdo,$institutionId,$senderUserId,'sistem',$displayTitle,$message,$isHomework?'onemli':'normal',
            $isHomework?'ogrenci,veli':'ogrenci',$recipients,'ogretmenim.php',null,'ogretmen_icerik',$contentId
        );
    }catch(Throwable $e){
        error_log('[IlkAdim][bildirim] Öğretmen içerik bildirimi oluşturulamadı: '.$e->getMessage());
        return 0;
    }
}

function bd_unread_count(PDO $pdo,int $userId): int {
    if($userId<=0 || !bd_tables_ready($pdo)) return 0;
    try{
        $stmt=$pdo->prepare("SELECT COUNT(*)
            FROM kurum_duyuru_alicilari a
            INNER JOIN kurum_duyurulari d ON d.id=a.duyuru_id
            WHERE a.kullanici_id=?
              AND a.okundu_tarihi IS NULL
              AND d.aktif=1
              AND (d.son_gosterim_tarihi IS NULL OR d.son_gosterim_tarihi>=CURDATE())");
        $stmt->execute([$userId]);
        $count=(int)($stmt->fetchColumn()?:0);
        $stmt->closeCursor();
        return max(0,$count);
    }catch(Throwable){
        return 0;
    }
}

function bd_inbox_rows(PDO $pdo,int $userId,int $limit=100): array {
    if($userId<=0 || !bd_tables_ready($pdo)) return [];
    $limit=max(1,min(300,$limit));
    $stmt=$pdo->prepare("SELECT
        d.id,d.kurum_id,d.tur,d.baslik,d.mesaj,d.onem,d.baglanti,d.son_gosterim_tarihi,d.olusturulma_tarihi,
        a.kurum_rolu,a.okundu_tarihi,
        k.ad kurum_adi,
        COALESCE(u.ad_soyad,'Sistem') gonderen_adi
        FROM kurum_duyuru_alicilari a
        INNER JOIN kurum_duyurulari d ON d.id=a.duyuru_id
        INNER JOIN kurumlar k ON k.id=d.kurum_id
        LEFT JOIN kullanicilar u ON u.id=d.gonderen_kullanici_id
        WHERE a.kullanici_id=?
          AND d.aktif=1
          AND (d.son_gosterim_tarihi IS NULL OR d.son_gosterim_tarihi>=CURDATE())
        ORDER BY (a.okundu_tarihi IS NULL) DESC,d.olusturulma_tarihi DESC,d.id DESC
        LIMIT {$limit}");
    $stmt->execute([$userId]);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function bd_mark_read(PDO $pdo,int $userId,int $announcementId): void {
    if($userId<=0 || $announcementId<=0 || !bd_tables_ready($pdo)) return;
    $stmt=$pdo->prepare("UPDATE kurum_duyuru_alicilari a
        INNER JOIN kurum_duyurulari d ON d.id=a.duyuru_id AND d.aktif=1
        SET a.okundu_tarihi=COALESCE(a.okundu_tarihi,NOW())
        WHERE a.duyuru_id=? AND a.kullanici_id=?");
    $stmt->execute([$announcementId,$userId]);
    $stmt->closeCursor();
}

function bd_mark_all_read(PDO $pdo,int $userId): void {
    if($userId<=0 || !bd_tables_ready($pdo)) return;
    $stmt=$pdo->prepare("UPDATE kurum_duyuru_alicilari a
        INNER JOIN kurum_duyurulari d ON d.id=a.duyuru_id AND d.aktif=1
        SET a.okundu_tarihi=COALESCE(a.okundu_tarihi,NOW())
        WHERE a.kullanici_id=?
          AND a.okundu_tarihi IS NULL
          AND (d.son_gosterim_tarihi IS NULL OR d.son_gosterim_tarihi>=CURDATE())");
    $stmt->execute([$userId]);
    $stmt->closeCursor();
}

function bd_sent_rows(PDO $pdo,array $actor,int $limit=100): array {
    if(!bd_tables_ready($pdo)) return [];
    $ids=auth_manageable_institution_ids($pdo,$actor);
    if(!$ids) return [];
    $limit=max(1,min(300,$limit));
    $ph=implode(',',array_fill(0,count($ids),'?'));
    $stmt=$pdo->prepare("SELECT
        d.id,d.kurum_id,d.tur,d.baslik,d.onem,d.hedef_roller,d.aktif,d.olusturulma_tarihi,
        k.ad kurum_adi,COALESCE(u.ad_soyad,'Sistem') gonderen_adi,
        COUNT(a.kullanici_id) alici_sayisi,
        SUM(CASE WHEN a.okundu_tarihi IS NOT NULL THEN 1 ELSE 0 END) okundu_sayisi
        FROM kurum_duyurulari d
        INNER JOIN kurumlar k ON k.id=d.kurum_id
        LEFT JOIN kullanicilar u ON u.id=d.gonderen_kullanici_id
        LEFT JOIN kurum_duyuru_alicilari a ON a.duyuru_id=d.id
        WHERE d.kurum_id IN ($ph)
        GROUP BY d.id,d.kurum_id,d.tur,d.baslik,d.onem,d.hedef_roller,d.aktif,d.olusturulma_tarihi,k.ad,u.ad_soyad
        ORDER BY d.olusturulma_tarihi DESC,d.id DESC
        LIMIT {$limit}");
    $stmt->execute($ids);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function bd_archive_manual(PDO $pdo,array $actor,int $announcementId): void {
    if($announcementId<=0 || !bd_tables_ready($pdo)) throw new RuntimeException('Duyuru bulunamadı.');
    $ids=auth_manageable_institution_ids($pdo,$actor);
    if(!$ids) throw new RuntimeException('Duyuru arşivleme yetkin yok.');
    $ph=implode(',',array_fill(0,count($ids),'?'));
    $params=array_merge([$announcementId],$ids);
    $stmt=$pdo->prepare("SELECT id,kurum_id FROM kurum_duyurulari
        WHERE id=? AND tur='duyuru' AND aktif=1 AND kurum_id IN ($ph)
        LIMIT 1");
    $stmt->execute($params);
    $row=$stmt->fetch(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    if(!is_array($row)) throw new RuntimeException('Aktif manuel duyuru bulunamadı.');

    $stmt=$pdo->prepare("UPDATE kurum_duyurulari SET aktif=0 WHERE id=? AND tur='duyuru' AND aktif=1");
    $stmt->execute([$announcementId]);
    $stmt->closeCursor();
    auth_audit($pdo,(int)$actor['id'],null,'kurum_duyuru_arsivle','Duyuru #'.$announcementId.' kurum #'.(int)$row['kurum_id']);
}
