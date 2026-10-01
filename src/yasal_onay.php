<?php
declare(strict_types=1);

function yl_tables_ready(PDO $pdo): bool {
    return auth_runtime_table_exists($pdo,'yasal_belgeler')
        && auth_runtime_table_exists($pdo,'yasal_belge_onaylari');
}

function yl_document_types(): array {
    return [
        'kvkk_aydinlatma'=>'KVKK Aydınlatma Metni',
        'gizlilik'=>'Gizlilik Politikası',
        'kullanim_kosullari'=>'Kullanım Koşulları',
    ];
}

function yl_target_roles(): array {
    return [
        'ogrenci'=>'Öğrenci',
        'veli'=>'Veli',
        'ogretmen'=>'Öğretmen',
        'yonetici'=>'Yönetici',
        'super_admin'=>'Süper Admin',
    ];
}

function yl_normalize_roles(array $roles): array {
    $allowed=array_keys(yl_target_roles());
    return array_values(array_unique(array_filter(array_map('strval',$roles),static fn(string $role):bool=>in_array($role,$allowed,true))));
}

function yl_role_csv(array $roles): string {
    return implode(',',yl_normalize_roles($roles));
}

function yl_role_in_csv(string $csv,string $role): bool {
    if($role==='') return false;
    return in_array($role,array_filter(array_map('trim',explode(',',$csv))),true);
}

function yl_hash_content(string $title,string $content): string {
    return hash('sha256',trim($title)."\n".str_replace(["\r\n","\r"],"\n",trim($content)));
}

function yl_validate_date(string $value): ?string {
    $value=trim($value);
    if($value==='') return null;
    $date=DateTimeImmutable::createFromFormat('!Y-m-d',$value);
    $errors=DateTimeImmutable::getLastErrors();
    if(!$date || (is_array($errors) && (($errors['warning_count']??0)>0 || ($errors['error_count']??0)>0))
        || $date->format('Y-m-d')!==$value){
        throw new RuntimeException('Yürürlük tarihini kontrol et.');
    }
    return $value;
}

function yl_admin_rows(PDO $pdo): array {
    if(!yl_tables_ready($pdo)) return [];
    $stmt=$pdo->query("SELECT
        b.*,
        COALESCE(u.ad_soyad,'Sistem') olusturan_adi,
        (SELECT COUNT(*) FROM yasal_belge_onaylari o WHERE o.belge_id=b.id) onay_sayisi
        FROM yasal_belgeler b
        LEFT JOIN kullanicilar u ON u.id=b.olusturan_kullanici_id
        ORDER BY b.belge_turu,b.id DESC");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function yl_document(PDO $pdo,int $id): ?array {
    if($id<=0 || !yl_tables_ready($pdo)) return null;
    $stmt=$pdo->prepare('SELECT * FROM yasal_belgeler WHERE id=? LIMIT 1');
    $stmt->execute([$id]);
    $row=$stmt->fetch(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($row)?$row:null;
}

function yl_create_draft(PDO $pdo,array $admin,array $input): int {
    if((string)(auth_effective_role($admin)??'')!=='super_admin') throw new RuntimeException('Süper Admin yetkisi gerekli.');
    if(!yl_tables_ready($pdo)) throw new RuntimeException('Yasal belge tabloları henüz hazır değil.');

    $type=(string)($input['belge_turu']??'');
    $version=trim((string)($input['surum']??''));
    $title=trim((string)($input['baslik']??''));
    $content=trim((string)($input['icerik']??''));
    $required=!empty($input['zorunlu'])?1:0;
    $roles=yl_normalize_roles(is_array($input['hedef_roller']??null)?$input['hedef_roller']:[]);
    $effective=yl_validate_date((string)($input['yururluk_tarihi']??''));

    if(!array_key_exists($type,yl_document_types())) throw new RuntimeException('Belge türünü kontrol et.');
    if(!preg_match('/^[A-Za-z0-9._-]{1,40}$/D',$version)) throw new RuntimeException('Sürüm alanı yalnız harf, rakam, nokta, tire ve alt çizgi içerebilir.');
    if(mb_strlen($title)<5 || mb_strlen($title)>190) throw new RuntimeException('Belge başlığı 5 ile 190 karakter arasında olmalı.');
    if(mb_strlen($content)<50 || mb_strlen($content)>60000) throw new RuntimeException('Belge metni 50 ile 60000 karakter arasında olmalı.');
    if(!$roles) throw new RuntimeException('En az bir hedef rol seç.');

    $stmt=$pdo->prepare("INSERT INTO yasal_belgeler
        (belge_turu,surum,baslik,icerik,icerik_hash,zorunlu,hedef_roller,durum,yururluk_tarihi,olusturan_kullanici_id)
        VALUES (?,?,?,?,?,?,?,'taslak',?,?)");
    try{
        $stmt->execute([
            $type,$version,$title,$content,yl_hash_content($title,$content),
            $required,yl_role_csv($roles),$effective,(int)$admin['id']
        ]);
    }catch(PDOException $e){
        if((string)$e->getCode()==='23000') throw new RuntimeException('Bu belge türü ve sürüm numarası zaten var.');
        throw $e;
    }
    $id=(int)$pdo->lastInsertId();
    $stmt->closeCursor();
    auth_audit($pdo,(int)$admin['id'],null,'yasal_belge_taslak','Belge #'.$id.' '.$type.' '.$version);
    return $id;
}

function yl_update_draft(PDO $pdo,array $admin,int $id,array $input): void {
    if((string)(auth_effective_role($admin)??'')!=='super_admin') throw new RuntimeException('Süper Admin yetkisi gerekli.');
    $current=yl_document($pdo,$id);
    if(!$current || (string)$current['durum']!=='taslak') throw new RuntimeException('Yalnız taslak belgeler düzenlenebilir.');

    $version=trim((string)($input['surum']??''));
    $title=trim((string)($input['baslik']??''));
    $content=trim((string)($input['icerik']??''));
    $required=!empty($input['zorunlu'])?1:0;
    $roles=yl_normalize_roles(is_array($input['hedef_roller']??null)?$input['hedef_roller']:[]);
    $effective=yl_validate_date((string)($input['yururluk_tarihi']??''));

    if(!preg_match('/^[A-Za-z0-9._-]{1,40}$/D',$version)) throw new RuntimeException('Sürüm alanını kontrol et.');
    if(mb_strlen($title)<5 || mb_strlen($title)>190) throw new RuntimeException('Belge başlığını kontrol et.');
    if(mb_strlen($content)<50 || mb_strlen($content)>60000) throw new RuntimeException('Belge metnini kontrol et.');
    if(!$roles) throw new RuntimeException('En az bir hedef rol seç.');

    $stmt=$pdo->prepare("UPDATE yasal_belgeler
        SET surum=?,baslik=?,icerik=?,icerik_hash=?,zorunlu=?,hedef_roller=?,yururluk_tarihi=?
        WHERE id=? AND durum='taslak'");
    try{
        $stmt->execute([
            $version,$title,$content,yl_hash_content($title,$content),$required,yl_role_csv($roles),$effective,$id
        ]);
    }catch(PDOException $e){
        if((string)$e->getCode()==='23000') throw new RuntimeException('Bu belge türü ve sürüm numarası zaten var.');
        throw $e;
    }
    $stmt->closeCursor();
    auth_audit($pdo,(int)$admin['id'],null,'yasal_belge_taslak_guncelle','Belge #'.$id);
}

function yl_publish(PDO $pdo,array $admin,int $id): void {
    if((string)(auth_effective_role($admin)??'')!=='super_admin') throw new RuntimeException('Süper Admin yetkisi gerekli.');
    $started=false;
    try{
        if(!$pdo->inTransaction()){$pdo->beginTransaction();$started=true;}
        $lock=$pdo->prepare("SELECT * FROM yasal_belgeler WHERE id=? LIMIT 1 FOR UPDATE");
        $lock->execute([$id]);
        $doc=$lock->fetch(PDO::FETCH_ASSOC);
        $lock->closeCursor();
        if(!is_array($doc) || (string)$doc['durum']!=='taslak') throw new RuntimeException('Yalnız taslak belge yayınlanabilir.');
        if(yl_hash_content((string)$doc['baslik'],(string)$doc['icerik'])!==(string)$doc['icerik_hash']){
            throw new RuntimeException('Belge bütünlük kontrolü başarısız.');
        }

        $stmt=$pdo->prepare("UPDATE yasal_belgeler
            SET durum='arsiv',arsiv_tarihi=NOW()
            WHERE belge_turu=? AND durum='yayinda' AND id<>?");
        $stmt->execute([(string)$doc['belge_turu'],$id]);
        $stmt->closeCursor();

        $stmt=$pdo->prepare("UPDATE yasal_belgeler
            SET durum='yayinda',yayin_tarihi=NOW(),arsiv_tarihi=NULL
            WHERE id=? AND durum='taslak'");
        $stmt->execute([$id]);
        if($stmt->rowCount()!==1) throw new RuntimeException('Belge yayınlanamadı.');
        $stmt->closeCursor();

        if($started)$pdo->commit();
    }catch(Throwable $e){
        if($started && $pdo->inTransaction())$pdo->rollBack();
        throw $e;
    }

    auth_audit($pdo,(int)$admin['id'],null,'yasal_belge_yayinla','Belge #'.$id);
}

function yl_archive(PDO $pdo,array $admin,int $id): void {
    if((string)(auth_effective_role($admin)??'')!=='super_admin') throw new RuntimeException('Süper Admin yetkisi gerekli.');
    $doc=yl_document($pdo,$id);
    if(!$doc || !in_array((string)$doc['durum'],['taslak','yayinda'],true)) throw new RuntimeException('Arşivlenebilir belge bulunamadı.');
    $stmt=$pdo->prepare("UPDATE yasal_belgeler SET durum='arsiv',arsiv_tarihi=NOW() WHERE id=? AND durum IN ('taslak','yayinda')");
    $stmt->execute([$id]);
    $stmt->closeCursor();
    auth_audit($pdo,(int)$admin['id'],null,'yasal_belge_arsivle','Belge #'.$id);
}

function yl_active_required_for_role(PDO $pdo,string $role): array {
    if(!yl_tables_ready($pdo) || !array_key_exists($role,yl_target_roles())) return [];
    $stmt=$pdo->query("SELECT id,belge_turu,surum,baslik,icerik,icerik_hash,zorunlu,hedef_roller,yururluk_tarihi,yayin_tarihi
        FROM yasal_belgeler
        WHERE durum='yayinda' AND zorunlu=1
          AND (yururluk_tarihi IS NULL OR yururluk_tarihi<=CURDATE())
        ORDER BY belge_turu,id");
    $rows=$stmt?$stmt->fetchAll(PDO::FETCH_ASSOC):[];
    if($stmt)$stmt->closeCursor();
    if(!is_array($rows)) return [];
    return array_values(array_filter($rows,static fn(array $row):bool=>yl_role_in_csv((string)$row['hedef_roller'],$role)));
}

function yl_pending_documents(PDO $pdo,array $user): array {
    $role=(string)(auth_effective_role($user)??'');
    $docs=yl_active_required_for_role($pdo,$role);
    if(!$docs) return [];
    $stmt=$pdo->prepare('SELECT 1 FROM yasal_belge_onaylari WHERE belge_id=? AND kullanici_id=? AND belge_hash=? LIMIT 1');
    $pending=[];
    foreach($docs as $doc){
        $stmt->execute([(int)$doc['id'],(int)$user['id'],(string)$doc['icerik_hash']]);
        $accepted=(bool)$stmt->fetchColumn();
        $stmt->closeCursor();
        if(!$accepted)$pending[]=$doc;
    }
    return $pending;
}

function yl_ip_hash(): ?string {
    $ip=trim((string)($_SERVER['REMOTE_ADDR']??''));
    return $ip!==''?hash('sha256',$ip):null;
}

function yl_user_agent_hash(): ?string {
    $ua=trim((string)($_SERVER['HTTP_USER_AGENT']??''));
    return $ua!==''?hash('sha256',mb_substr($ua,0,1000)):null;
}

function yl_accept(PDO $pdo,array $user,array $documentIds): int {
    if(!yl_tables_ready($pdo)) throw new RuntimeException('Yasal onay sistemi henüz hazır değil.');
    $pending=yl_pending_documents($pdo,$user);
    if(!$pending) return 0;
    $pendingIds=array_map(static fn(array $row):int=>(int)$row['id'],$pending);
    $submitted=array_values(array_unique(array_filter(array_map('intval',$documentIds),static fn(int $id):bool=>$id>0)));
    sort($pendingIds);sort($submitted);
    if($pendingIds!==$submitted) throw new RuntimeException('Tüm zorunlu belgeleri ayrı ayrı onaylaman gerekiyor.');

    $role=(string)(auth_effective_role($user)??'');
    $stmt=$pdo->prepare("INSERT INTO yasal_belge_onaylari
        (belge_id,kullanici_id,onay_rolu,belge_hash,onay_ip_hash,user_agent_hash,onay_tarihi)
        VALUES (?,?,?,?,?,?,NOW())");
    $count=0;
    foreach($pending as $doc){
        try{
            $stmt->execute([
                (int)$doc['id'],(int)$user['id'],$role,(string)$doc['icerik_hash'],yl_ip_hash(),yl_user_agent_hash()
            ]);
            if($stmt->rowCount()>0)$count++;
        }catch(PDOException $e){
            if((string)$e->getCode()!=='23000') throw $e;
        }
    }
    $stmt->closeCursor();
    auth_audit($pdo,(int)$user['id'],(int)$user['id'],'yasal_belge_onay','Onaylanan belge sayısı '.$count);
    return $count;
}

function yl_user_acceptance_rows(PDO $pdo,int $userId): array {
    if($userId<=0 || !yl_tables_ready($pdo)) return [];
    $stmt=$pdo->prepare("SELECT
        o.belge_id,o.onay_rolu,o.belge_hash,o.onay_tarihi,
        b.belge_turu,b.surum,b.baslik,b.durum
        FROM yasal_belge_onaylari o
        INNER JOIN yasal_belgeler b ON b.id=o.belge_id
        WHERE o.kullanici_id=?
        ORDER BY o.onay_tarihi DESC,o.belge_id DESC");
    $stmt->execute([$userId]);
    $rows=$stmt->fetchAll(PDO::FETCH_ASSOC);
    $stmt->closeCursor();
    return is_array($rows)?$rows:[];
}

function yl_admin_report(PDO $pdo): array {
    if(!yl_tables_ready($pdo)) return [];
    $docs=$pdo->query("SELECT * FROM yasal_belgeler WHERE durum='yayinda' ORDER BY belge_turu,id");
    $rows=$docs?$docs->fetchAll(PDO::FETCH_ASSOC):[];
    if($docs)$docs->closeCursor();
    if(!is_array($rows)) return [];

    foreach($rows as &$doc){
        $targetRoles=array_filter(array_map('trim',explode(',',(string)$doc['hedef_roller'])));
        if(!$targetRoles){$doc['hedef_kullanici']=0;$doc['onaylayan']=0;$doc['bekleyen']=0;continue;}
        $ph=implode(',',array_fill(0,count($targetRoles),'?'));
        $stmt=$pdo->prepare("SELECT COUNT(DISTINCT k.id)
            FROM kullanicilar k
            LEFT JOIN kullanici_rolleri kr ON kr.kullanici_id=k.id
            WHERE k.aktif=1
              AND (k.ana_rol IN ($ph) OR kr.rol IN ($ph))");
        $params=array_merge($targetRoles,$targetRoles);
        $stmt->execute($params);
        $target=(int)($stmt->fetchColumn()?:0);
        $stmt->closeCursor();

        $stmt=$pdo->prepare('SELECT COUNT(*) FROM yasal_belge_onaylari WHERE belge_id=?');
        $stmt->execute([(int)$doc['id']]);
        $accepted=(int)($stmt->fetchColumn()?:0);
        $stmt->closeCursor();

        $doc['hedef_kullanici']=$target;
        $doc['onaylayan']=$accepted;
        $doc['bekleyen']=max(0,$target-$accepted);
    }
    unset($doc);
    return $rows;
}
