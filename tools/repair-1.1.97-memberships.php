<?php
declare(strict_types=1);

/**
 * İlkAdım 1.1.97 -> 1.1.98 legacy kurum_kullanicilari bridge.
 *
 * Varsayılan çalışma dry-run'dır:
 *   php tools/repair-1.1.97-memberships.php --check
 *
 * Uygulama:
 *   php tools/repair-1.1.97-memberships.php --apply
 *
 * Amaç: 1.1.97 updater'ın paket dosyalarını kopyalamadan önce durduğu legacy
 * kurum üyeliği şemasını, tüm referanslar doğrulanabiliyorsa veri kaybetmeden
 * yeni kullanici_id tabanlı şemaya dönüştürmek.
 */

function rescue197_fail(string $message): never {
    fwrite(STDERR,"HATA: ".$message.PHP_EOL);
    exit(1);
}

function rescue197_table_exists(PDO $pdo,string $table): bool {
    $s=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
    $s->execute([$table]);
    return (int)$s->fetchColumn()>0;
}

function rescue197_columns(PDO $pdo,string $table): array {
    $s=$pdo->prepare('SELECT column_name,column_type FROM information_schema.columns WHERE table_schema=DATABASE() AND table_name=? ORDER BY ordinal_position');
    $s->execute([$table]);
    $out=[];
    foreach($s->fetchAll(PDO::FETCH_ASSOC)?:[] as $row){
        $out[(string)$row['column_name']]=(string)$row['column_type'];
    }
    return $out;
}

function rescue197_id_type(PDO $pdo,string $table): string {
    $s=$pdo->prepare("SELECT COLUMN_TYPE FROM information_schema.columns WHERE table_schema=DATABASE() AND table_name=? AND column_name='id' LIMIT 1");
    $s->execute([$table]);
    $type=(string)($s->fetchColumn()?:'');
    if($type==='' || preg_match('/^[a-zA-Z0-9(), ]+$/',$type)!==1){
        throw new RuntimeException('Geçersiz id kolon tipi: '.$table);
    }
    return $type;
}

function rescue197_scalar(PDO $pdo,string $sql,array $params=[]): mixed {
    $s=$pdo->prepare($sql);
    $s->execute($params);
    $v=$s->fetchColumn();
    $s->closeCursor();
    return $v;
}

function rescue197_user_exists(PDO $pdo,int $userId): bool {
    return $userId>0 && (int)rescue197_scalar($pdo,'SELECT COUNT(*) FROM kullanicilar WHERE id=?',[$userId])===1;
}

function rescue197_resolve_profile(PDO $pdo,string $table,int $profileId): ?int {
    if($profileId<=0 || !rescue197_table_exists($pdo,$table)) return null;
    $cols=rescue197_columns($pdo,$table);
    if(!isset($cols['kullanici_id'])) return null;
    $s=$pdo->prepare("SELECT kullanici_id FROM {$table} WHERE id=? LIMIT 1");
    $s->execute([$profileId]);
    $uid=(int)($s->fetchColumn()?:0);
    $s->closeCursor();
    return $uid>0 && rescue197_user_exists($pdo,$uid)?$uid:null;
}

function rescue197_resolve_manager(PDO $pdo,int $legacyId): ?int {
    if($legacyId<=0) return null;

    if(rescue197_table_exists($pdo,'yoneticiler')){
        $cols=rescue197_columns($pdo,'yoneticiler');
        if(isset($cols['kullanici_id'])){
            $s=$pdo->prepare('SELECT kullanici_id FROM yoneticiler WHERE id=? LIMIT 1');
            $s->execute([$legacyId]);
            $uid=(int)($s->fetchColumn()?:0);
            $s->closeCursor();
            if($uid>0 && rescue197_user_exists($pdo,$uid)) return $uid;
        }
    }

    if(!rescue197_user_exists($pdo,$legacyId)) return null;
    $s=$pdo->prepare("SELECT 1 FROM kullanicilar k
        WHERE k.id=?
          AND (
            k.ana_rol IN ('super_admin','yonetici')
            OR EXISTS(
                SELECT 1 FROM kullanici_rolleri r
                WHERE r.kullanici_id=k.id AND r.rol IN ('super_admin','yonetici')
            )
          )
        LIMIT 1");
    $s->execute([$legacyId]);
    $ok=(bool)$s->fetchColumn();
    $s->closeCursor();
    return $ok?$legacyId:null;
}

function rescue197_member_key(int $institutionId,int $userId,string $role): string {
    return $institutionId.':'.$userId.':'.$role;
}

function rescue197_collect_memberships(PDO $pdo,array $rows,array $cols): array {
    $members=[];
    $unresolved=[];
    $roleColumns=[
        'ogrenci_id'=>['role'=>'ogrenci','table'=>'ogrenciler'],
        'veli_id'=>['role'=>'veli','table'=>'veliler'],
        'ogretmen_id'=>['role'=>'ogretmen','table'=>'ogretmenler'],
        'yonetici_id'=>['role'=>'yonetici','table'=>null],
    ];

    foreach($rows as $index=>$row){
        $institutionId=(int)($row['kurum_id']??0);
        if($institutionId<=0 || (int)rescue197_scalar($pdo,'SELECT COUNT(*) FROM kurumlar WHERE id=?',[$institutionId])!==1){
            $unresolved[]='satır '.($index+1).': geçersiz kurum_id='.($row['kurum_id']??'NULL');
            continue;
        }

        $active=isset($cols['aktif'])?(int)($row['aktif']??1):1;
        $active=$active===0?0:1;
        $created=isset($cols['olusturulma_tarihi']) && trim((string)($row['olusturulma_tarihi']??''))!==''
            ? (string)$row['olusturulma_tarihi']
            : date('Y-m-d H:i:s');

        if(isset($cols['kullanici_id']) && (int)($row['kullanici_id']??0)>0){
            $uid=(int)$row['kullanici_id'];
            $role=trim((string)($row['kurum_rolu']??''));
            if(!in_array($role,['ogrenci','veli','ogretmen','yonetici'],true) || !rescue197_user_exists($pdo,$uid)){
                $unresolved[]='satır '.($index+1).': mevcut kullanici_id/kurum_rolu doğrulanamadı';
            }else{
                $members[rescue197_member_key($institutionId,$uid,$role)]=[
                    'kurum_id'=>$institutionId,'kullanici_id'=>$uid,'kurum_rolu'=>$role,
                    'aktif'=>$active,'olusturulma_tarihi'=>$created,
                ];
            }
        }

        foreach($roleColumns as $column=>$meta){
            if(!isset($cols[$column])) continue;
            $legacyId=(int)($row[$column]??0);
            if($legacyId<=0) continue;

            $uid=$column==='yonetici_id'
                ? rescue197_resolve_manager($pdo,$legacyId)
                : rescue197_resolve_profile($pdo,(string)$meta['table'],$legacyId);
            if($uid===null){
                $unresolved[]='satır '.($index+1).': '.$column.'='.$legacyId.' kullanıcıya çözümlenemedi';
                continue;
            }
            $role=(string)$meta['role'];
            $members[rescue197_member_key($institutionId,$uid,$role)]=[
                'kurum_id'=>$institutionId,'kullanici_id'=>$uid,'kurum_rolu'=>$role,
                'aktif'=>$active,'olusturulma_tarihi'=>$created,
            ];
        }
    }

    return [array_values($members),$unresolved];
}

function rescue197_connect(string $root): PDO {
    $cfg=require $root.'/config/app.php';
    if(!is_array($cfg) || !is_array($cfg['db']??null)){
        throw new RuntimeException('config/app.php DB ayarları okunamadı.');
    }
    $db=$cfg['db'];
    $host=(string)($db['host']??'localhost');
    $port=(int)($db['port']??3306);
    $name=(string)($db['name']??'');
    $user=(string)($db['user']??'');
    $pass=(string)($db['pass']??'');
    $charset=(string)($db['charset']??'utf8mb4');
    if($name===''||$user==='') throw new RuntimeException('DB adı veya kullanıcı adı eksik.');
    $pdo=new PDO(
        "mysql:host={$host};port={$port};dbname={$name};charset={$charset}",
        $user,$pass,
        [PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION,PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC,PDO::ATTR_EMULATE_PREPARES=>false]
    );
    return $pdo;
}

function rescue197_write_report(string $root,array $report): void {
    $dir=$root.'/storage/updates';
    if(!is_dir($dir)&&!mkdir($dir,0750,true)&&!is_dir($dir)){
        throw new RuntimeException('Rescue rapor klasörü oluşturulamadı.');
    }
    $path=$dir.'/legacy-membership-rescue-1.1.97.json';
    $json=json_encode($report,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES|JSON_PRETTY_PRINT);
    if(!is_string($json)||file_put_contents($path,$json."\n",LOCK_EX)===false){
        throw new RuntimeException('Rescue raporu yazılamadı.');
    }
    @chmod($path,0600);
}

function rescue197_main(array $argv): int {
    if(PHP_SAPI!=='cli') rescue197_fail('Bu araç yalnız CLI üzerinden çalıştırılır.');
    $apply=in_array('--apply',$argv,true);
    $root=dirname(__DIR__);

    $versionPath=$root.'/version.json';
    $version=is_file($versionPath)?json_decode((string)file_get_contents($versionPath),true):null;
    $installed=is_array($version)?trim((string)($version['version']??'')):'';
    if($installed!=='1.1.97'){
        rescue197_fail('Bu köprü yalnız kurulu sürüm tam olarak 1.1.97 iken çalışır. Mevcut: '.($installed?:'bilinmiyor'));
    }

    try{
        $pdo=rescue197_connect($root);
        foreach(['kurum_kullanicilari','kurumlar','kullanicilar'] as $table){
            if(!rescue197_table_exists($pdo,$table)) throw new RuntimeException('Gerekli tablo eksik: '.$table);
        }

        $cols=rescue197_columns($pdo,'kurum_kullanicilari');
        $legacy=array_values(array_intersect(['veli_id','ogretmen_id','ogrenci_id','yonetici_id'],array_keys($cols)));
        if($legacy===[]){
            fwrite(STDOUT,"OK: kurum_kullanicilari zaten modern şemada; dönüşüm gerekmiyor.".PHP_EOL);
            return 0;
        }
        if(!isset($cols['kurum_id'])) throw new RuntimeException('Legacy tabloda kurum_id yok.');

        $backup='kurum_kullanicilari_legacy_backup_1_1_97';
        $temp='kurum_kullanicilari_bridge_1_1_97';
        if(rescue197_table_exists($pdo,$backup)) throw new RuntimeException('Önceki rescue yedeği zaten var: '.$backup);
        if(rescue197_table_exists($pdo,$temp)) throw new RuntimeException('Yarım rescue geçici tablosu zaten var: '.$temp);

        $rows=$pdo->query('SELECT * FROM kurum_kullanicilari')->fetchAll(PDO::FETCH_ASSOC)?:[];
        [$members,$unresolved]=rescue197_collect_memberships($pdo,$rows,$cols);
        if($unresolved!==[]){
            throw new RuntimeException(
                "Çözümlenemeyen legacy üyelikler bulundu; hiçbir değişiklik yapılmadı:\n - "
                .implode("\n - ",array_slice($unresolved,0,20))
            );
        }
        if($rows!==[] && $members===[]){
            throw new RuntimeException('Legacy tabloda kayıt var ancak hiçbir üyelik güvenli biçimde üretilemedi.');
        }

        fwrite(STDOUT,'Kontrol tamamlandı. Legacy satır: '.count($rows).' / Yeni benzersiz üyelik: '.count($members).PHP_EOL);
        if(!$apply){
            fwrite(STDOUT,'DRY-RUN: Değişiklik yapılmadı. Uygulamak için --apply kullan.'.PHP_EOL);
            return 0;
        }

        $kurumType=rescue197_id_type($pdo,'kurumlar');
        $userType=rescue197_id_type($pdo,'kullanicilar');
        $pdo->exec("CREATE TABLE {$temp} (
            kurum_id {$kurumType} NOT NULL,
            kullanici_id {$userType} NOT NULL,
            kurum_rolu VARCHAR(30) NOT NULL,
            aktif TINYINT(1) NOT NULL DEFAULT 1,
            olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (kurum_id,kullanici_id,kurum_rolu),
            KEY ix_kurum_kullanici_user (kullanici_id,aktif),
            KEY ix_kurum_kullanici_role (kurum_id,kurum_rolu,aktif),
            CONSTRAINT fk_rescue197_kurum FOREIGN KEY (kurum_id) REFERENCES kurumlar(id) ON DELETE CASCADE,
            CONSTRAINT fk_rescue197_user FOREIGN KEY (kullanici_id) REFERENCES kullanicilar(id) ON DELETE CASCADE
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci");

        try{
            $insert=$pdo->prepare("INSERT INTO {$temp}
                (kurum_id,kullanici_id,kurum_rolu,aktif,olusturulma_tarihi)
                VALUES (?,?,?,?,?)");
            foreach($members as $member){
                $insert->execute([
                    $member['kurum_id'],$member['kullanici_id'],$member['kurum_rolu'],
                    $member['aktif'],$member['olusturulma_tarihi']
                ]);
            }
            $inserted=(int)$pdo->query("SELECT COUNT(*) FROM {$temp}")->fetchColumn();
            if($inserted!==count($members)){
                throw new RuntimeException('Yeni üyelik sayısı doğrulaması başarısız.');
            }

            $pdo->exec("RENAME TABLE kurum_kullanicilari TO {$backup}, {$temp} TO kurum_kullanicilari");

            $newCols=rescue197_columns($pdo,'kurum_kullanicilari');
            foreach(['kurum_id','kullanici_id','kurum_rolu','aktif'] as $required){
                if(!isset($newCols[$required])) throw new RuntimeException('Yeni şema doğrulaması başarısız: '.$required);
            }
            foreach(['veli_id','ogretmen_id','ogrenci_id','yonetici_id'] as $legacyColumn){
                if(isset($newCols[$legacyColumn])) throw new RuntimeException('Legacy kolon yeni tabloda kaldı: '.$legacyColumn);
            }

            rescue197_write_report($root,[
                'format'=>1,
                'applied_at'=>date(DATE_ATOM),
                'installed_version'=>$installed,
                'legacy_rows'=>count($rows),
                'converted_memberships'=>count($members),
                'backup_table'=>$backup,
                'live_table'=>'kurum_kullanicilari',
                'status'=>'applied',
            ]);
        }catch(Throwable $e){
            if(rescue197_table_exists($pdo,$temp)){
                try{$pdo->exec("DROP TABLE {$temp}");}catch(Throwable){}
            }
            throw $e;
        }

        fwrite(STDOUT,"OK: Legacy kurum üyelikleri veri kaybetmeden dönüştürüldü. Yedek tablo: {$backup}".PHP_EOL);
        fwrite(STDOUT,"Şimdi yönetim panelinden 1.1.98 güncellemesini yeniden çalıştır.".PHP_EOL);
        return 0;
    }catch(Throwable $e){
        rescue197_fail($e->getMessage());
    }
}

if(realpath((string)($_SERVER['SCRIPT_FILENAME']??''))===__FILE__){
    exit(rescue197_main($argv??[]));
}
