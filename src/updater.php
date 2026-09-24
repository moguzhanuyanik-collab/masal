<?php
declare(strict_types=1);

function github_repo_info(array $gh): array {
    $owner=trim((string)($gh['owner']??''));
    $repo=trim((string)($gh['repo']??''));
    $branch=trim((string)($gh['branch']??'main'))?:'main';
    if($owner===''||$repo==='') throw new RuntimeException('GitHub owner/repo ayari yapilmamis.');
    foreach([$owner,$repo] as $v){ if(!preg_match('/^[A-Za-z0-9_.-]+$/',$v)) throw new RuntimeException('GitHub ayarlarinda gecersiz karakter var.'); }
    if(!preg_match('/^[A-Za-z0-9_\/.\-]+$/',$branch)) throw new RuntimeException('GitHub branch ayari gecersiz.');
    return [$owner,$repo,$branch];
}

function updater_headers(array $gh): array {
    $h=['User-Agent: IlkAdim-Updater/1.0.12','Accept: */*','Cache-Control: no-cache, no-store, must-revalidate','Pragma: no-cache'];
    $token=trim((string)($gh['token']??''));
    if($token!=='') $h[]='Authorization: Bearer '.$token;
    return $h;
}

function updater_http(string $url,array $gh,?string $target=null): string|array {
    if(!function_exists('curl_init')) throw new RuntimeException('PHP cURL eklentisi gerekli.');
    $ch=curl_init($url);
    if($ch===false) throw new RuntimeException('cURL baslatilamadi.');
    $opts=[
        CURLOPT_FOLLOWLOCATION=>true,
        CURLOPT_CONNECTTIMEOUT=>15,
        CURLOPT_TIMEOUT=>120,
        CURLOPT_FAILONERROR=>false,
        CURLOPT_HTTPHEADER=>updater_headers($gh),
        CURLOPT_USERAGENT=>'IlkAdim-Updater/1.0.12',
        CURLOPT_FRESH_CONNECT=>true,
        CURLOPT_FORBID_REUSE=>true,
    ];
    $fp=null;
    if($target!==null){
        $fp=fopen($target,'wb');
        if($fp===false){ curl_close($ch); throw new RuntimeException('Guncelleme paketi yazilamadi.'); }
        $opts[CURLOPT_RETURNTRANSFER]=false;
        $opts[CURLOPT_WRITEFUNCTION]=static function($curl,string $data) use($fp): int {
            $n=fwrite($fp,$data); return $n===false?0:$n;
        };
    }else{
        $opts[CURLOPT_RETURNTRANSFER]=true;
    }
    curl_setopt_array($ch,$opts);
    $body=curl_exec($ch);
    $status=(int)curl_getinfo($ch,CURLINFO_RESPONSE_CODE);
    $err=curl_error($ch);
    curl_close($ch);
    if(is_resource($fp)){ fflush($fp); fclose($fp); }

    if($body===false||$status<200||$status>=300){
        if($target!==null) @unlink($target);
        throw new RuntimeException('GitHub istegi basarisiz (HTTP '.$status.')'.($err!==''?': '.$err:''));
    }
    if($target!==null){
        if(!is_file($target)||filesize($target)<4){ @unlink($target); throw new RuntimeException('GitHub ZIP paketi bos veya gecersiz.'); }
        $fh=fopen($target,'rb'); $sig=$fh?fread($fh,4):''; if(is_resource($fh)) fclose($fh);
        if(!is_string($sig)||!str_starts_with($sig,'PK')){ @unlink($target); throw new RuntimeException('GitHub yaniti ZIP paketi degil.'); }
        return ['status'=>$status,'path'=>$target];
    }
    return (string)$body;
}

function remote_version_info(array $gh): array {
    [$owner,$repo,$branch]=github_repo_info($gh);
    $cacheBuster=(string)round(microtime(true)*1000);
    $url='https://raw.githubusercontent.com/'.rawurlencode($owner).'/'.rawurlencode($repo).'/'.rawurlencode($branch).'/version.json?cb='.$cacheBuster;
    $data=json_decode((string)updater_http($url,$gh),true);
    if(!is_array($data)||empty($data['version'])) throw new RuntimeException('GitHub version.json okunamadi veya gecersiz.');
    return [
        'version'=>(string)$data['version'],
        'name'=>(string)($data['name']??''),
        'commit'=>(string)($data['commit']??$branch),
    ];
}

function path_is_preserved(string $relative,array $preserve): bool {
    $relative=ltrim(str_replace('\\','/',$relative),'/');
    foreach($preserve as $rule){
        $rule=trim(str_replace('\\','/',(string)$rule),'/');
        if($rule!==''&&($relative===$rule||str_starts_with($relative,$rule.'/'))) return true;
    }
    return false;
}

function copy_update_tree(string $source,string $destination,array $preserve,string $relative=''): void {
    foreach(scandir($source)?:[] as $item){
        if($item==='.'||$item==='..'||$item==='.git') continue;
        $rel=ltrim($relative.'/'.$item,'/');
        if(path_is_preserved($rel,$preserve)) continue;
        $src=$source.'/'.$item; $dst=$destination.'/'.$rel;
        if(is_dir($src)){
            if(!is_dir($dst)&&!mkdir($dst,0775,true)&&!is_dir($dst)) throw new RuntimeException('Klasor olusturulamadi: '.$rel);
            copy_update_tree($src,$destination,$preserve,$rel);
        }else{
            $parent=dirname($dst);
            if(!is_dir($parent)&&!mkdir($parent,0775,true)&&!is_dir($parent)) throw new RuntimeException('Klasor olusturulamadi: '.$rel);
            if(!copy($src,$dst)) throw new RuntimeException('Dosya guncellenemedi: '.$rel);
        }
    }
}

function delete_tree(string $path): void {
    if(!file_exists($path)) return;
    if(is_file($path)||is_link($path)){ @unlink($path); return; }
    foreach(scandir($path)?:[] as $item){ if($item!=='.'&&$item!=='..') delete_tree($path.'/'.$item); }
    @rmdir($path);
}

function create_project_backup(string $root,string $target): void {
    if(!class_exists('ZipArchive')) throw new RuntimeException('PHP ZipArchive eklentisi gerekli.');
    $zip=new ZipArchive();
    if($zip->open($target,ZipArchive::CREATE|ZipArchive::OVERWRITE)!==true) throw new RuntimeException('Yedek ZIP olusturulamadi.');
    $it=new RecursiveIteratorIterator(new RecursiveDirectoryIterator($root,FilesystemIterator::SKIP_DOTS));
    foreach($it as $file){
        if(!$file->isFile()) continue;
        $path=$file->getPathname();
        $rel=ltrim(str_replace('\\','/',substr($path,strlen($root))),'/');
        if(str_starts_with($rel,'storage/backups/')||str_starts_with($rel,'storage/updates/')) continue;
        $zip->addFile($path,$rel);
    }
    $zip->close();
}

function create_single_previous_backup(string $root): string {
    $dir=$root.'/storage/backups';
    if(!is_dir($dir)&&!mkdir($dir,0775,true)&&!is_dir($dir)){
        throw new RuntimeException('Yedek klasoru olusturulamadi.');
    }

    $final=$dir.'/onceki_surum.zip';
    $tmp=$dir.'/onceki_surum.tmp.zip';
    $old=$dir.'/onceki_surum.old.zip';

    @unlink($tmp);
    @unlink($old);

    create_project_backup($root,$tmp);

    if(!is_file($tmp)||(int)(filesize($tmp)?:0)<4){
        @unlink($tmp);
        throw new RuntimeException('Onceki surum yedegi olusturulamadi.');
    }

    if(is_file($final)&&!@rename($final,$old)){
        @unlink($tmp);
        throw new RuntimeException('Mevcut yedek guvenli sekilde degistirilemedi.');
    }

    if(!@rename($tmp,$final)){
        if(is_file($old)) @rename($old,$final);
        @unlink($tmp);
        throw new RuntimeException('Yeni yedek etkinlestirilemedi.');
    }

    @unlink($old);

    foreach(glob($dir.'/pre_*.zip')?:[] as $legacy){
        @unlink($legacy);
    }

    return basename($final);
}

function run_migration_sql(PDO $pdo,string $path): void {
    $buffer='';
    foreach(file($path,FILE_IGNORE_NEW_LINES)?:[] as $line){
        $trim=trim($line);
        if($trim===''||str_starts_with($trim,'--')) continue;
        $buffer.=$line."\n";
        if(str_ends_with(rtrim($line),';')){ $sql=trim($buffer); $buffer=''; if($sql!=='') $pdo->exec($sql); }
    }
    if(trim($buffer)!=='') $pdo->exec($buffer);
}

function ensure_updater_schema(PDO $pdo): void {
    $pdo->exec("CREATE TABLE IF NOT EXISTS guncelleme_gecmisi (
        id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
        onceki_surumu VARCHAR(50) NULL,
        yeni_surumu VARCHAR(50) NULL,
        github_commit VARCHAR(64) NULL,
        durum VARCHAR(20) NOT NULL DEFAULT 'basladi',
        mesaj TEXT NULL,
        baslama_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        bitis_tarihi DATETIME NULL,
        PRIMARY KEY (id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");
    $cols=[];
    foreach($pdo->query('SHOW COLUMNS FROM guncelleme_gecmisi')?:[] as $row){ if(isset($row['Field'])) $cols[(string)$row['Field']]=true; }
    $required=[
        'onceki_surumu'=>"ALTER TABLE guncelleme_gecmisi ADD COLUMN onceki_surumu VARCHAR(50) NULL AFTER id",
        'yeni_surumu'=>"ALTER TABLE guncelleme_gecmisi ADD COLUMN yeni_surumu VARCHAR(50) NULL AFTER onceki_surumu",
        'github_commit'=>"ALTER TABLE guncelleme_gecmisi ADD COLUMN github_commit VARCHAR(64) NULL AFTER yeni_surumu",
        'durum'=>"ALTER TABLE guncelleme_gecmisi ADD COLUMN durum VARCHAR(20) NOT NULL DEFAULT 'basladi' AFTER github_commit",
        'mesaj'=>"ALTER TABLE guncelleme_gecmisi ADD COLUMN mesaj TEXT NULL AFTER durum",
        'baslama_tarihi'=>"ALTER TABLE guncelleme_gecmisi ADD COLUMN baslama_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER mesaj",
        'bitis_tarihi'=>"ALTER TABLE guncelleme_gecmisi ADD COLUMN bitis_tarihi DATETIME NULL AFTER baslama_tarihi",
    ];
    foreach($required as $name=>$sql){ if(!isset($cols[$name])) $pdo->exec($sql); }
    $pdo->exec("CREATE TABLE IF NOT EXISTS sistem_migrations (
        migration VARCHAR(190) NOT NULL,
        uygulanma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (migration)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");
}


function auth_table_exists(PDO $pdo,string $table): bool {
    $stmt=$pdo->prepare("SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?");
    $stmt->execute([$table]);
    return (int)$stmt->fetchColumn()>0;
}

function auth_column_map(PDO $pdo,string $table): array {
    $out=[];
    foreach($pdo->query("SHOW COLUMNS FROM `".$table."`")?:[] as $row){
        if(isset($row['Field'])) $out[(string)$row['Field']]=true;
    }
    return $out;
}

function ensure_student_auth_schema(PDO $pdo): void {
    if(!auth_table_exists($pdo,'ogrenciler')){
        $pdo->exec("CREATE TABLE ogrenciler (
            id INT UNSIGNED NOT NULL AUTO_INCREMENT,
            ad VARCHAR(190) NOT NULL DEFAULT 'Ogrenci',
            email VARCHAR(190) NULL,
            sifre_hash VARCHAR(255) NULL,
            avatar VARCHAR(32) NULL DEFAULT '🌞',
            profil_fotografi LONGTEXT NULL,
            egitim_kademesi VARCHAR(30) NOT NULL DEFAULT 'temel_egitim',
            sinif_seviyesi TINYINT UNSIGNED NOT NULL DEFAULT 1,
            aktif TINYINT(1) NOT NULL DEFAULT 1,
            son_giris_tarihi DATETIME NULL,
            son_giris_ip VARCHAR(45) NULL,
            olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
            guncellenme_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
            PRIMARY KEY (id),
            KEY ix_ogrenci_email (email)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");
    }else{
        $cols=auth_column_map($pdo,'ogrenciler');

        if(!isset($cols['id'])){
            throw new RuntimeException('ogrenciler tablosunda id kolonu yok. Otomatik onarim guvenli degil.');
        }

        $columnSql=[
            'ad'=>"ALTER TABLE ogrenciler ADD COLUMN ad VARCHAR(190) NOT NULL DEFAULT 'Ogrenci' AFTER id",
            'email'=>"ALTER TABLE ogrenciler ADD COLUMN email VARCHAR(190) NULL",
            'sifre_hash'=>"ALTER TABLE ogrenciler ADD COLUMN sifre_hash VARCHAR(255) NULL",
            'avatar'=>"ALTER TABLE ogrenciler ADD COLUMN avatar VARCHAR(32) NULL DEFAULT '🌞'",
            'profil_fotografi'=>"ALTER TABLE ogrenciler ADD COLUMN profil_fotografi LONGTEXT NULL",
            'egitim_kademesi'=>"ALTER TABLE ogrenciler ADD COLUMN egitim_kademesi VARCHAR(30) NOT NULL DEFAULT 'temel_egitim'",
            'sinif_seviyesi'=>"ALTER TABLE ogrenciler ADD COLUMN sinif_seviyesi TINYINT UNSIGNED NOT NULL DEFAULT 1",
            'aktif'=>"ALTER TABLE ogrenciler ADD COLUMN aktif TINYINT(1) NOT NULL DEFAULT 1",
            'son_giris_tarihi'=>"ALTER TABLE ogrenciler ADD COLUMN son_giris_tarihi DATETIME NULL",
            'son_giris_ip'=>"ALTER TABLE ogrenciler ADD COLUMN son_giris_ip VARCHAR(45) NULL"
        ];
        foreach($columnSql as $name=>$sql){
            if(!isset($cols[$name])) $pdo->exec($sql);
        }

        $hasEmailIndex=false;
        $indexStmt=$pdo->query("SHOW INDEX FROM ogrenciler");
        $indexRows=$indexStmt ? $indexStmt->fetchAll() : [];
        if($indexStmt) $indexStmt->closeCursor();
        foreach($indexRows as $row){
            if(($row['Column_name']??'')==='email'){$hasEmailIndex=true;break;}
        }
        if(!$hasEmailIndex){
            try{$pdo->exec("ALTER TABLE ogrenciler ADD KEY ix_ogrenci_email (email)");}catch(Throwable $ignored){}
        }
    }

    if(!auth_table_exists($pdo,'ogrenci_oturum_tokenlari')){
        $pdo->exec("CREATE TABLE ogrenci_oturum_tokenlari (
            id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
            ogrenci_id INT UNSIGNED NOT NULL,
            token_hash CHAR(64) NOT NULL,
            son_kullanma_tarihi DATETIME NOT NULL,
            olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (id),
            UNIQUE KEY uk_ogrenci_oturum_token_v11 (token_hash),
            KEY ix_ogrenci_oturum_student_v11 (ogrenci_id),
            KEY ix_ogrenci_oturum_expire_v11 (son_kullanma_tarihi)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");
    }else{
        $cols=auth_column_map($pdo,'ogrenci_oturum_tokenlari');
        $tokenColumns=[
            'ogrenci_id'=>"ALTER TABLE ogrenci_oturum_tokenlari ADD COLUMN ogrenci_id INT UNSIGNED NOT NULL DEFAULT 0",
            'token_hash'=>"ALTER TABLE ogrenci_oturum_tokenlari ADD COLUMN token_hash CHAR(64) NULL",
            'son_kullanma_tarihi'=>"ALTER TABLE ogrenci_oturum_tokenlari ADD COLUMN son_kullanma_tarihi DATETIME NULL",
            'olusturulma_tarihi'=>"ALTER TABLE ogrenci_oturum_tokenlari ADD COLUMN olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP"
        ];
        foreach($tokenColumns as $name=>$sql){
            if(!isset($cols[$name])) $pdo->exec($sql);
        }
    }

    $email='masal@gmail.com';
    $passwordHash=password_hash('12345678',PASSWORD_DEFAULT);
    if(!is_string($passwordHash)||$passwordHash===''){
        throw new RuntimeException('Test ogrenci sifresi olusturulamadi.');
    }

    $stmt=$pdo->prepare('SELECT id FROM ogrenciler WHERE email=? LIMIT 1');
    $stmt->execute([$email]);
    $studentId=(int)($stmt->fetchColumn()?:0);

    if($studentId<=0){
        $old=$pdo->prepare('SELECT id FROM ogrenciler WHERE email=? LIMIT 1');
        $old->execute(['test@ilkadim.local']);
        $studentId=(int)($old->fetchColumn()?:0);
    }

    if($studentId<=0){
        $first=$pdo->query('SELECT id FROM ogrenciler WHERE aktif=1 ORDER BY id LIMIT 1');
        $studentId=(int)($first?$first->fetchColumn():0);
    }

    if($studentId>0){
        $pdo->prepare("UPDATE ogrenciler
            SET ad=CASE WHEN ad IS NULL OR ad='' THEN 'Test Ogrenci' ELSE ad END,
                email=?,sifre_hash=?,aktif=1
            WHERE id=?")
            ->execute([$email,$passwordHash,$studentId]);
    }else{
        $pdo->prepare("INSERT INTO ogrenciler (ad,email,sifre_hash,avatar,aktif) VALUES (?,?,?,?,1)")
            ->execute(['Test Ogrenci',$email,$passwordHash,'🌞']);
    }
}

function repair_legacy_institution_membership_schema(PDO $pdo): void {
    if(!auth_table_exists($pdo,'kurum_kullanicilari')) return;

    $cols=auth_column_map($pdo,'kurum_kullanicilari');
    $legacyColumns=['veli_id','ogretmen_id','ogrenci_id','yonetici_id'];
    $hasLegacy=false;
    foreach($legacyColumns as $column){
        if(isset($cols[$column])){$hasLegacy=true;break;}
    }
    if(!$hasLegacy) return;
    if(!auth_table_exists($pdo,'kurumlar')||!auth_table_exists($pdo,'kullanicilar')){
        throw new RuntimeException('Eski kurum kullanıcısı şeması onarılamadı: temel tablolar eksik.');
    }

    $typeStmt=$pdo->prepare("SELECT COLUMN_TYPE FROM information_schema.columns WHERE table_schema=DATABASE() AND table_name=? AND column_name='id' LIMIT 1");
    $typeStmt->execute(['kurumlar']);
    $kurumType=(string)($typeStmt->fetchColumn()?:'BIGINT UNSIGNED');
    $typeStmt->closeCursor();
    $typeStmt->execute(['kullanicilar']);
    $kullaniciType=(string)($typeStmt->fetchColumn()?:'BIGINT UNSIGNED');
    $typeStmt->closeCursor();

    foreach([$kurumType,$kullaniciType] as $columnType){
        if(!preg_match('/^[a-zA-Z0-9(), ]+$/',$columnType)){
            throw new RuntimeException('Kurum kullanıcı şeması için geçersiz kolon tipi algılandı.');
        }
    }

    $oldFk=(int)$pdo->query('SELECT @@FOREIGN_KEY_CHECKS')->fetchColumn();
    try{
        $pdo->exec('SET FOREIGN_KEY_CHECKS=0');
        $pdo->exec('DROP TABLE kurum_kullanicilari');
        $pdo->exec("CREATE TABLE kurum_kullanicilari (
            kurum_id {$kurumType} NOT NULL,
            kullanici_id {$kullaniciType} NOT NULL,
            kurum_rolu VARCHAR(30) NOT NULL,
            aktif TINYINT(1) NOT NULL DEFAULT 1,
            olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
            PRIMARY KEY (kurum_id,kullanici_id,kurum_rolu),
            KEY ix_kurum_kullanici_user (kullanici_id,aktif),
            KEY ix_kurum_kullanici_role (kurum_id,kurum_rolu,aktif),
            CONSTRAINT fk_kurum_kullanici_kurum FOREIGN KEY (kurum_id)
                REFERENCES kurumlar(id) ON DELETE CASCADE,
            CONSTRAINT fk_kurum_kullanici_user FOREIGN KEY (kullanici_id)
                REFERENCES kullanicilar(id) ON DELETE CASCADE
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci");
    }finally{
        $pdo->exec('SET FOREIGN_KEY_CHECKS='.(string)$oldFk);
    }
}

function run_pending_migrations(PDO $pdo,string $root): array {
    repair_legacy_institution_membership_schema($pdo);
    $applied=[]; $files=glob($root.'/database/migrations/*.sql')?:[]; sort($files,SORT_NATURAL);
    $check=$pdo->prepare('SELECT 1 FROM sistem_migrations WHERE migration=? LIMIT 1');
    $insert=$pdo->prepare('INSERT INTO sistem_migrations (migration) VALUES (?)');
    foreach($files as $file){
        $name=basename($file,'.sql'); $check->execute([$name]); if($check->fetchColumn()) continue;
        if($name==='004_ogrenci_giris_sistemi'){
            ensure_student_auth_schema($pdo);
        }else{
            run_migration_sql($pdo,$file);
        }
        $insert->execute([$name]); $applied[]=$name;
    }
    return $applied;
}

function detect_update_root(string $extractDir): string {
    if(is_file($extractDir.'/version.json')) return $extractDir;
    $candidates=[];
    $it=new RecursiveIteratorIterator(new RecursiveDirectoryIterator($extractDir,FilesystemIterator::SKIP_DOTS),RecursiveIteratorIterator::SELF_FIRST);
    foreach($it as $item){
        if(!$item->isFile()||$item->getFilename()!=='version.json') continue;
        $dir=dirname($item->getPathname());
        $rel=ltrim(str_replace('\\','/',substr($dir,strlen($extractDir))),'/');
        if($rel==='') return $extractDir;
        if(substr_count($rel,'/')<=2) $candidates[]=$dir;
    }
    if($candidates!==[]){ usort($candidates,static fn($a,$b)=>strlen($a)<=>strlen($b)); return $candidates[0]; }
    throw new RuntimeException('GitHub paket koku anlasilamadi. version.json bulunamadi.');
}

function install_github_update(string $root,array $gh,array $preserve): array {
    [$owner,$repo,$branch]=github_repo_info($gh);
    $remote=remote_version_info($gh);
    $localVersion=read_app_version();
    if(version_compare($remote['version'],$localVersion,'<=')) return ['updated'=>false,'message'=>'Zaten guncel surum kullaniliyor.','remote'=>$remote,'local'=>$localVersion,'migrations'=>[]];

    $storage=$root.'/storage';
    @mkdir($storage.'/updates',0775,true); @mkdir($storage.'/backups',0775,true);
    $stamp=date('Ymd_His');
    $zipPath=$storage.'/updates/github_'.$stamp.'.zip';
    $extractDir=$storage.'/updates/extract_'.$stamp;
    $backupPath=$storage.'/backups/onceki_surum.zip';

    $pdo=db(); ensure_updater_schema($pdo);
    $log=$pdo->prepare("INSERT INTO guncelleme_gecmisi (onceki_surumu,yeni_surumu,github_commit,durum) VALUES (?,?,?,'basladi')");
    $log->execute([$localVersion,$remote['version'],$remote['commit']]); $logId=(int)$pdo->lastInsertId();

    try{
        $backupName=create_single_previous_backup($root);
        $downloadUrl='https://codeload.github.com/'.rawurlencode($owner).'/'.rawurlencode($repo).'/zip/refs/heads/'.rawurlencode($branch).'?cb='.(string)round(microtime(true)*1000);
        updater_http($downloadUrl,$gh,$zipPath);

        if(!class_exists('ZipArchive')) throw new RuntimeException('PHP ZipArchive eklentisi gerekli.');
        $zip=new ZipArchive();
        if($zip->open($zipPath)!==true) throw new RuntimeException('GitHub ZIP paketi acilamadi.');
        if(!is_dir($extractDir)&&!mkdir($extractDir,0775,true)&&!is_dir($extractDir)){ $zip->close(); throw new RuntimeException('Gecici klasor olusturulamadi.'); }
        if(!$zip->extractTo($extractDir)){ $zip->close(); throw new RuntimeException('GitHub paketi acilamadi.'); }
        $zip->close();

        $sourceRoot=detect_update_root($extractDir);

        // Migration'lar önce staging paketinden uygulanır.
        // DB dönüşümü başarısızsa yeni uygulama dosyaları canlıya kopyalanmaz.
        if(!auth_table_exists($pdo,'ogrenciler')) ensure_student_auth_schema($pdo);
        $migrations=run_pending_migrations($pdo,$sourceRoot);

        // Şema başarıyla hazırlandıktan sonra yeni uygulama dosyalarını etkinleştir.
        copy_update_tree($sourceRoot,$root,$preserve);
        $pdo->prepare("INSERT INTO sistem_ayarlar (ayar_anahtari,ayar_degeri) VALUES ('uygulama_surumu',?) ON DUPLICATE KEY UPDATE ayar_degeri=VALUES(ayar_degeri)")->execute([$remote['version']]);
        $pdo->prepare("UPDATE guncelleme_gecmisi SET durum='basarili',mesaj=?,bitis_tarihi=NOW() WHERE id=?")->execute(['Guncelleme tamamlandi. Yedek: '.$backupName,$logId]);

        @unlink($zipPath); delete_tree($extractDir);
        return ['updated'=>true,'message'=>'Guncelleme basariyla kuruldu.','remote'=>$remote,'local'=>$localVersion,'backup'=>$backupName,'migrations'=>$migrations];
    }catch(Throwable $e){
        try{ $pdo->prepare("UPDATE guncelleme_gecmisi SET durum='hatali',mesaj=?,bitis_tarihi=NOW() WHERE id=?")->execute([$e->getMessage(),$logId]); }catch(Throwable $ignored){}
        @unlink($zipPath); delete_tree($extractDir); throw $e;
    }
}
