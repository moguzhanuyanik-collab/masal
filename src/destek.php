<?php
declare(strict_types=1);

function ds_tables_ready(PDO $pdo): bool {
    return auth_runtime_table_exists($pdo,'destek_talepleri')
        && auth_runtime_table_exists($pdo,'destek_talep_mesajlari');
}

function ds_requester_roles(): array {
    return ['yonetici'=>'Yönetici','ogretmen'=>'Öğretmen','veli'=>'Veli'];
}

function ds_categories(): array {
    return [
        'teknik'=>'Teknik Sorun',
        'hesap'=>'Hesap & Giriş',
        'icerik'=>'İçerik / Eğitim',
        'faturalama'=>'Paket / Faturalama',
        'diger'=>'Diğer',
    ];
}

function ds_priorities(): array {
    return ['normal'=>'Normal','onemli'=>'Önemli','acil'=>'Acil'];
}

function ds_statuses(): array {
    return [
        'acik'=>'Açık',
        'inceleniyor'=>'İnceleniyor',
        'kullanici_bekleniyor'=>'Kullanıcı Yanıtı Bekleniyor',
        'cozuldu'=>'Çözüldü',
        'kapali'=>'Kapalı',
    ];
}

function ds_user_institutions(PDO $pdo,array $user): array {
    $role=(string)(auth_effective_role($user)??'');
    if(!array_key_exists($role,ds_requester_roles())) return [];
    $ids=auth_user_institution_ids_raw($pdo,(int)$user['id'],$role);
    if(!$ids) return [];
    $ph=implode(',',array_fill(0,count($ids),'?'));
    $stmt=$pdo->prepare("SELECT id,ad,kod,aktif FROM kurumlar WHERE id IN ($ph) ORDER BY aktif DESC,ad,id");
    $stmt->execute($ids);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function ds_create_ticket(PDO $pdo,array $user,array $input): int {
    if(!ds_tables_ready($pdo)) throw new RuntimeException('Destek merkezi tabloları henüz hazır değil.');
    $role=(string)(auth_effective_role($user)??'');
    if(!array_key_exists($role,ds_requester_roles())) throw new RuntimeException('Bu hesap destek talebi açamaz.');

    $institutionId=max(0,(int)($input['kurum_id']??0));
    if($institutionId<=0 || !auth_user_in_institution_raw($pdo,(int)$user['id'],$institutionId,$role)){
        throw new RuntimeException('Destek talebi için yetkili kurum seç.');
    }

    $category=(string)($input['kategori']??'');
    $priority=(string)($input['oncelik']??'normal');
    $subject=trim((string)($input['konu']??''));
    $message=trim((string)($input['mesaj']??''));

    if(!array_key_exists($category,ds_categories())) throw new RuntimeException('Destek kategorisini kontrol et.');
    if(!array_key_exists($priority,ds_priorities())) throw new RuntimeException('Öncelik seçimi geçersiz.');
    if(mb_strlen($subject)<5 || mb_strlen($subject)>190) throw new RuntimeException('Konu 5 ile 190 karakter arasında olmalı.');
    if(mb_strlen($message)<10 || mb_strlen($message)>5000) throw new RuntimeException('Mesaj 10 ile 5000 karakter arasında olmalı.');

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}

        $stmt=$pdo->prepare("INSERT INTO destek_talepleri
            (kurum_id,acani_kullanici_id,acani_rolu,kategori,oncelik,konu,durum,son_hareket_tarihi)
            VALUES (?,?,?,?,?,?, 'acik', NOW())");
        $stmt->execute([$institutionId,(int)$user['id'],$role,$category,$priority,$subject]);
        $ticketId=(int)$pdo->lastInsertId();
        $stmt->closeCursor();

        $stmt=$pdo->prepare("INSERT INTO destek_talep_mesajlari
            (talep_id,kurum_id,gonderen_kullanici_id,gonderen_rolu,mesaj)
            VALUES (?,?,?,?,?)");
        $stmt->execute([$ticketId,$institutionId,(int)$user['id'],$role,$message]);
        $stmt->closeCursor();

        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$user['id'],null,'destek_talebi_ac','Destek #'.$ticketId.' kurum #'.$institutionId.' kategori '.$category);
    return $ticketId;
}

function ds_ticket_row(PDO $pdo,array $user,int $ticketId): ?array {
    if($ticketId<=0 || !ds_tables_ready($pdo)) return null;
    $role=(string)(auth_effective_role($user)??'');

    $sql="SELECT
        t.id,t.kurum_id,t.acani_kullanici_id,t.acani_rolu,t.atanan_kullanici_id,
        t.kategori,t.oncelik,t.konu,t.durum,t.son_hareket_tarihi,t.cozum_tarihi,t.kapanis_tarihi,
        t.olusturulma_tarihi,t.guncellenme_tarihi,
        k.ad kurum_adi,u.ad_soyad acan_adi
        FROM destek_talepleri t
        INNER JOIN kurumlar k ON k.id=t.kurum_id
        INNER JOIN kullanicilar u ON u.id=t.acani_kullanici_id
        WHERE t.id=?";
    $params=[$ticketId];
    if($role!=='super_admin'){
        $sql.=" AND t.acani_kullanici_id=?";
        $params[]=(int)$user['id'];
    }
    $sql.=" LIMIT 1";

    $stmt=$pdo->prepare($sql);
    $stmt->execute($params);
    $row=$stmt->fetch(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($row)?$row:null;
}

function ds_ticket_messages(PDO $pdo,int $ticketId): array {
    if($ticketId<=0 || !ds_tables_ready($pdo)) return [];
    $stmt=$pdo->prepare("SELECT
        m.id,m.gonderen_kullanici_id,m.gonderen_rolu,m.mesaj,m.olusturulma_tarihi,
        COALESCE(u.ad_soyad,'Sistem') gonderen_adi
        FROM destek_talep_mesajlari m
        LEFT JOIN kullanicilar u ON u.id=m.gonderen_kullanici_id
        WHERE m.talep_id=?
        ORDER BY m.id");
    $stmt->execute([$ticketId]);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function ds_user_ticket_rows(PDO $pdo,array $user,int $limit=100): array {
    if(!ds_tables_ready($pdo)) return [];
    $role=(string)(auth_effective_role($user)??'');
    if(!array_key_exists($role,ds_requester_roles())) return [];
    $limit=max(1,min(300,$limit));

    $stmt=$pdo->prepare("SELECT
        t.id,t.kurum_id,t.kategori,t.oncelik,t.konu,t.durum,t.son_hareket_tarihi,t.olusturulma_tarihi,
        k.ad kurum_adi,
        (SELECT COUNT(*) FROM destek_talep_mesajlari m WHERE m.talep_id=t.id) mesaj_sayisi
        FROM destek_talepleri t
        INNER JOIN kurumlar k ON k.id=t.kurum_id
        WHERE t.acani_kullanici_id=?
        ORDER BY CASE t.durum WHEN 'acik' THEN 0 WHEN 'inceleniyor' THEN 1 WHEN 'kullanici_bekleniyor' THEN 2 WHEN 'cozuldu' THEN 3 ELSE 4 END,
                 t.son_hareket_tarihi DESC,t.id DESC
        LIMIT {$limit}");
    $stmt->execute([(int)$user['id']]);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function ds_admin_ticket_rows(PDO $pdo,array $filters=[],int $limit=200): array {
    if(!ds_tables_ready($pdo)) return [];
    $limit=max(1,min(500,$limit));
    $where=['1=1'];
    $params=[];

    $status=trim((string)($filters['durum']??''));
    if($status!=='' && array_key_exists($status,ds_statuses())){
        $where[]='t.durum=?';$params[]=$status;
    }
    $priority=trim((string)($filters['oncelik']??''));
    if($priority!=='' && array_key_exists($priority,ds_priorities())){
        $where[]='t.oncelik=?';$params[]=$priority;
    }
    $category=trim((string)($filters['kategori']??''));
    if($category!=='' && array_key_exists($category,ds_categories())){
        $where[]='t.kategori=?';$params[]=$category;
    }
    $institutionId=max(0,(int)($filters['kurum_id']??0));
    if($institutionId>0){$where[]='t.kurum_id=?';$params[]=$institutionId;}

    $sql="SELECT
        t.id,t.kurum_id,t.acani_kullanici_id,t.acani_rolu,t.atanan_kullanici_id,
        t.kategori,t.oncelik,t.konu,t.durum,t.son_hareket_tarihi,t.olusturulma_tarihi,
        k.ad kurum_adi,u.ad_soyad acan_adi,
        (SELECT COUNT(*) FROM destek_talep_mesajlari m WHERE m.talep_id=t.id) mesaj_sayisi
        FROM destek_talepleri t
        INNER JOIN kurumlar k ON k.id=t.kurum_id
        INNER JOIN kullanicilar u ON u.id=t.acani_kullanici_id
        WHERE ".implode(' AND ',$where)."
        ORDER BY
          CASE t.oncelik WHEN 'acil' THEN 0 WHEN 'onemli' THEN 1 ELSE 2 END,
          CASE t.durum WHEN 'acik' THEN 0 WHEN 'inceleniyor' THEN 1 WHEN 'kullanici_bekleniyor' THEN 2 WHEN 'cozuldu' THEN 3 ELSE 4 END,
          t.son_hareket_tarihi ASC,t.id ASC
        LIMIT {$limit}";
    $stmt=$pdo->prepare($sql);
    $stmt->execute($params);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function ds_admin_summary(PDO $pdo): array {
    $summary=['toplam_acik'=>0,'acil'=>0,'inceleniyor'=>0,'kullanici_bekleniyor'=>0,'cozuldu'=>0];
    if(!ds_tables_ready($pdo)) return $summary;
    $stmt=$pdo->query("SELECT
        SUM(CASE WHEN durum<>'kapali' THEN 1 ELSE 0 END) toplam_acik,
        SUM(CASE WHEN oncelik='acil' AND durum NOT IN ('cozuldu','kapali') THEN 1 ELSE 0 END) acil,
        SUM(CASE WHEN durum='inceleniyor' THEN 1 ELSE 0 END) inceleniyor,
        SUM(CASE WHEN durum='kullanici_bekleniyor' THEN 1 ELSE 0 END) kullanici_bekleniyor,
        SUM(CASE WHEN durum='cozuldu' THEN 1 ELSE 0 END) cozuldu
        FROM destek_talepleri");
    $row=$stmt?$stmt->fetch(PDO::FETCH_ASSOC):false;
    if($stmt)$stmt->closeCursor();
    if(is_array($row)){
        foreach($summary as $key=>$value)$summary[$key]=max(0,(int)($row[$key]??0));
    }
    return $summary;
}

function ds_user_reply(PDO $pdo,array $user,int $ticketId,string $message): void {
    $message=trim($message);
    if(mb_strlen($message)<2 || mb_strlen($message)>5000) throw new RuntimeException('Yanıt 2 ile 5000 karakter arasında olmalı.');
    $ticket=ds_ticket_row($pdo,$user,$ticketId);
    if(!$ticket) throw new RuntimeException('Destek talebi bulunamadı.');
    if((string)$ticket['durum']==='kapali') throw new RuntimeException('Kapalı destek talebine yeni mesaj eklenemez.');

    $role=(string)(auth_effective_role($user)??'');
    if(!array_key_exists($role,ds_requester_roles())) throw new RuntimeException('Bu hesap destek talebine yanıt veremez.');

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}
        $lock=$pdo->prepare("SELECT id,durum FROM destek_talepleri WHERE id=? AND acani_kullanici_id=? LIMIT 1 FOR UPDATE");
        $lock->execute([$ticketId,(int)$user['id']]);
        $locked=$lock->fetch(PDO::FETCH_ASSOC);
        $lock->closeCursor();
        if(!is_array($locked)) throw new RuntimeException('Destek talebi bulunamadı.');
        if((string)$locked['durum']==='kapali') throw new RuntimeException('Kapalı destek talebine yeni mesaj eklenemez.');

        $stmt=$pdo->prepare("INSERT INTO destek_talep_mesajlari
            (talep_id,kurum_id,gonderen_kullanici_id,gonderen_rolu,mesaj)
            VALUES (?,?,?,?,?)");
        $stmt->execute([$ticketId,(int)$ticket['kurum_id'],(int)$user['id'],$role,$message]);
        $stmt->closeCursor();

        $stmt=$pdo->prepare("UPDATE destek_talepleri
            SET durum='acik',cozum_tarihi=NULL,kapanis_tarihi=NULL,son_hareket_tarihi=NOW()
            WHERE id=?");
        $stmt->execute([$ticketId]);
        $stmt->closeCursor();

        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$user['id'],null,'destek_talebi_yanit','Destek #'.$ticketId.' kullanıcı yanıtı');
}

function ds_admin_reply(PDO $pdo,array $admin,int $ticketId,string $message): void {
    if((string)(auth_effective_role($admin)??'')!=='super_admin') throw new RuntimeException('Destek yanıtı için Süper Admin yetkisi gerekli.');
    $message=trim($message);
    if(mb_strlen($message)<2 || mb_strlen($message)>5000) throw new RuntimeException('Yanıt 2 ile 5000 karakter arasında olmalı.');
    $ticket=ds_ticket_row($pdo,$admin,$ticketId);
    if(!$ticket) throw new RuntimeException('Destek talebi bulunamadı.');
    if((string)$ticket['durum']==='kapali') throw new RuntimeException('Kapalı destek talebine yanıt verilemez.');

    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}
        $lock=$pdo->prepare("SELECT id,durum FROM destek_talepleri WHERE id=? LIMIT 1 FOR UPDATE");
        $lock->execute([$ticketId]);
        $locked=$lock->fetch(PDO::FETCH_ASSOC);
        $lock->closeCursor();
        if(!is_array($locked)) throw new RuntimeException('Destek talebi bulunamadı.');
        if((string)$locked['durum']==='kapali') throw new RuntimeException('Kapalı destek talebine yanıt verilemez.');

        $stmt=$pdo->prepare("INSERT INTO destek_talep_mesajlari
            (talep_id,kurum_id,gonderen_kullanici_id,gonderen_rolu,mesaj)
            VALUES (?,?,?,?,?)");
        $stmt->execute([$ticketId,(int)$ticket['kurum_id'],(int)$admin['id'],'super_admin',$message]);
        $stmt->closeCursor();

        $stmt=$pdo->prepare("UPDATE destek_talepleri
            SET durum='kullanici_bekleniyor',atanan_kullanici_id=COALESCE(atanan_kullanici_id,?),
                cozum_tarihi=NULL,kapanis_tarihi=NULL,son_hareket_tarihi=NOW()
            WHERE id=?");
        $stmt->execute([(int)$admin['id'],$ticketId]);
        $stmt->closeCursor();

        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$admin['id'],(int)$ticket['acani_kullanici_id'],'destek_admin_yanit','Destek #'.$ticketId.' Süper Admin yanıtı');
}

function ds_admin_set_status(PDO $pdo,array $admin,int $ticketId,string $status): void {
    if((string)(auth_effective_role($admin)??'')!=='super_admin') throw new RuntimeException('Durum güncelleme için Süper Admin yetkisi gerekli.');
    if(!array_key_exists($status,ds_statuses())) throw new RuntimeException('Destek durumu geçersiz.');
    $ticket=ds_ticket_row($pdo,$admin,$ticketId);
    if(!$ticket) throw new RuntimeException('Destek talebi bulunamadı.');

    $assigned=in_array($status,['inceleniyor','kullanici_bekleniyor','cozuldu','kapali'],true)?(int)$admin['id']:null;

    $sql="UPDATE destek_talepleri SET durum=?,son_hareket_tarihi=NOW(),
        cozum_tarihi=CASE
            WHEN ?='cozuldu' THEN NOW()
            WHEN ?='kapali' THEN COALESCE(cozum_tarihi,NOW())
            ELSE NULL
        END,
        kapanis_tarihi=CASE WHEN ?='kapali' THEN NOW() ELSE NULL END";
    $params=[$status,$status,$status,$status];
    if($assigned!==null){$sql.=",atanan_kullanici_id=COALESCE(atanan_kullanici_id,?)";$params[]=$assigned;}
    $sql.=" WHERE id=?";
    $params[]=$ticketId;

    $stmt=$pdo->prepare($sql);
    $stmt->execute($params);
    $stmt->closeCursor();

    auth_audit($pdo,(int)$admin['id'],(int)$ticket['acani_kullanici_id'],'destek_durum_degistir','Destek #'.$ticketId.' -> '.$status);
}
