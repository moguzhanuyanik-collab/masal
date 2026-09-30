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

function remote_version_info_at_ref(array $gh,string $ref): array {
    [$owner,$repo,$branch]=github_repo_info($gh);
    $ref=trim($ref);
    if($ref==='') throw new RuntimeException('GitHub surum referansi bos olamaz.');
    if(!preg_match('/^[A-Za-z0-9_.\/-]+$/',$ref)) throw new RuntimeException('GitHub surum referansi gecersiz.');

    $cacheBuster=(string)round(microtime(true)*1000);
    $url='https://raw.githubusercontent.com/'.rawurlencode($owner).'/'.rawurlencode($repo).'/'.rawurlencode($ref).'/version.json?cb='.$cacheBuster;
    $data=json_decode((string)updater_http($url,$gh),true);
    if(!is_array($data)||empty($data['version'])) throw new RuntimeException('GitHub version.json okunamadi veya gecersiz.');

    return [
        'version'=>(string)$data['version'],
        'name'=>(string)($data['name']??''),
        'commit'=>$ref,
    ];
}

function remote_version_info(array $gh): array {
    [,,$branch]=github_repo_info($gh);
    return remote_version_info_at_ref($gh,$branch);
}

function next_remote_version_info(array $gh,string $localVersion): array {
    [$owner,$repo,$branch]=github_repo_info($gh);
    $localVersion=trim($localVersion);
    if($localVersion==='') $localVersion='0.0.0';

    $next=null;
    $page=1;
    $maxPages=20;

    while($page<=$maxPages){
        $url='https://api.github.com/repos/'.rawurlencode($owner).'/'.rawurlencode($repo)
            .'/commits?sha='.rawurlencode($branch)
            .'&path=version.json&per_page=100&page='.$page
            .'&cb='.(string)round(microtime(true)*1000);

        $rows=json_decode((string)updater_http($url,$gh),true);
        if(!is_array($rows)) throw new RuntimeException('GitHub surum gecmisi okunamadi.');
        if($rows===[]) break;

        $reachedInstalledOrOlder=false;

        foreach($rows as $row){
            $sha=trim((string)($row['sha']??''));
            if(!preg_match('/^[a-f0-9]{40}$/i',$sha)) continue;

            try{
                $info=remote_version_info_at_ref($gh,$sha);
            }catch(Throwable $ignored){
                continue;
            }

            $candidateVersion=trim((string)($info['version']??''));
            if($candidateVersion==='') continue;

            if(version_compare($candidateVersion,$localVersion,'>')){
                if($next===null||version_compare($candidateVersion,(string)$next['version'],'<')){
                    $next=$info;
                }
                continue;
            }

            $reachedInstalledOrOlder=true;
            break;
        }

        if($reachedInstalledOrOlder||count($rows)<100) break;
        $page++;
    }

    if($next!==null){
        return $next;
    }

    $latest=remote_version_info($gh);
    $latestVersion=trim((string)($latest['version']??''));

    if($latestVersion===''||version_compare($latestVersion,$localVersion,'<=')){
        return $latest;
    }

    // Sürüm geçmişinden güvenli ara sürüm belirlenemiyorsa en son main sürümüne atlama.
    // Böylece eksik bir ara paket yüzünden güncelleme zinciri bozulmaz.
    throw new RuntimeException(
        'Siradaki guncelleme guvenli bicimde belirlenemedi. '
        .'En son surume atlanmadi; ara surum zinciri kontrol edilmeli.'
    );
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
        if(is_link($src)){
            throw new RuntimeException('Güncelleme paketi sembolik bağlantı içeriyor: '.$rel);
        }
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

function managed_relative_path(string $relative): string {
    $relative=ltrim(str_replace('\\','/',$relative),'/');
    if($relative==='' || str_contains($relative,"\0")) throw new RuntimeException('Geçersiz yönetilen dosya yolu.');
    $parts=explode('/',$relative);
    foreach($parts as $part){
        if($part===''||$part==='.'||$part==='..') throw new RuntimeException('Geçersiz yönetilen dosya yolu: '.$relative);
    }
    if($parts[0]==='.git') throw new RuntimeException('Git metadata yönetilen dosya olamaz.');
    return implode('/',$parts);
}

function collect_managed_update_files(string $source,array $preserve,string $relative=''): array {
    $files=[];
    foreach(scandir($source)?:[] as $item){
        if($item==='.'||$item==='..'||$item==='.git') continue;
        $rel=ltrim($relative.'/'.$item,'/');
        if(path_is_preserved($rel,$preserve)) continue;
        $src=$source.'/'.$item;
        if(is_link($src)){
            throw new RuntimeException('Güncelleme paketi sembolik bağlantı içeriyor: '.$rel);
        }
        if(is_dir($src)){
            foreach(collect_managed_update_files($src,$preserve,$rel) as $nested) $files[]=$nested;
            continue;
        }
        if(is_file($src)) $files[]=managed_relative_path($rel);
    }
    sort($files,SORT_STRING);
    return array_values(array_unique($files));
}

function managed_manifest_path(string $root): string {
    return rtrim($root,'/\\').'/storage/updates/managed-files.json';
}

function read_managed_update_manifest(string $root): array {
    $path=managed_manifest_path($root);
    if(!is_file($path)) return [];
    $decoded=json_decode((string)file_get_contents($path),true);
    if(!is_array($decoded) || !is_array($decoded['files']??null)) return [];

    $files=[];
    foreach($decoded['files'] as $relative){
        if(!is_string($relative)) continue;
        try{$files[]=managed_relative_path($relative);}catch(Throwable){}
    }
    sort($files,SORT_STRING);
    return array_values(array_unique($files));
}

function write_managed_update_manifest(string $root,array $files,string $version): void {
    $path=managed_manifest_path($root);
    $dir=dirname($path);
    if(!is_dir($dir)&&!mkdir($dir,0750,true)&&!is_dir($dir)){
        throw new RuntimeException('Yönetilen dosya manifest klasörü oluşturulamadı.');
    }

    $normalized=[];
    foreach($files as $relative) $normalized[]=managed_relative_path((string)$relative);
    sort($normalized,SORT_STRING);
    $normalized=array_values(array_unique($normalized));

    $json=json_encode([
        'format'=>1,
        'version'=>$version,
        'written_at'=>date(DATE_ATOM),
        'files'=>$normalized,
    ],JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES|JSON_PRETTY_PRINT);
    if(!is_string($json)) throw new RuntimeException('Yönetilen dosya manifesti kodlanamadı.');

    $tmp=$path.'.tmp';
    @unlink($tmp);
    if(file_put_contents($tmp,$json."\n",LOCK_EX)===false){
        throw new RuntimeException('Yönetilen dosya manifesti yazılamadı.');
    }
    @chmod($tmp,0600);
    if(!@rename($tmp,$path)){
        @unlink($tmp);
        throw new RuntimeException('Yönetilen dosya manifesti etkinleştirilemedi.');
    }
    @chmod($path,0600);
}

function assert_managed_target_safe(string $root,string $relative): string {
    $relative=managed_relative_path($relative);
    $root=rtrim($root,'/\\');
    $current=$root;
    $parts=explode('/',$relative);
    $last=array_pop($parts);
    foreach($parts as $part){
        $current.='/'.$part;
        if(is_link($current)){
            throw new RuntimeException('Yönetilen dosya yolu sembolik bağlantı içeriyor: '.$relative);
        }
    }
    return $root.'/'.$relative;
}

function cleanup_empty_managed_parents(string $root,string $relative,array $preserve): void {
    $root=rtrim($root,'/\\');
    $dir=dirname($relative);
    while($dir!=='.' && $dir!=='/' && $dir!==''){
        $dir=managed_relative_path($dir);
        if(path_is_preserved($dir,$preserve)) break;
        $path=assert_managed_target_safe($root,$dir);
        if(!is_dir($path) || is_link($path)) break;
        $items=array_values(array_diff(scandir($path)?:[],['.','..']));
        if($items!==[]) break;
        if(!@rmdir($path)) break;
        $parent=dirname($dir);
        if($parent===$dir) break;
        $dir=$parent;
    }
}

function assert_managed_copy_type_safe(string $root,string $sourceRoot,array $newFiles,array $oldFiles,array $preserve): void {
    $oldLookup=array_fill_keys($oldFiles,true);
    foreach($newFiles as $relative){
        $relative=managed_relative_path((string)$relative);
        if(path_is_preserved($relative,$preserve)) continue;

        $source=$sourceRoot.'/'.$relative;
        if(!is_file($source)) continue;

        $parts=explode('/',$relative);
        array_pop($parts);
        $prefix='';
        foreach($parts as $part){
            $prefix=$prefix===''?$part:$prefix.'/'.$part;
            $live=$root.'/'.$prefix;
            if(is_file($live) || is_link($live)){
                if(!isset($oldLookup[$prefix])){
                    throw new RuntimeException(
                        'Güncelleme yol türü canlıya özel dosyayla çakışıyor; otomatik işlem durduruldu: '.$prefix
                    );
                }
                throw new RuntimeException(
                    'Yönetilen dosyanın klasöre dönüşmesi kontrollü geçiş gerektiriyor: '.$prefix
                );
            }
        }

        $liveTarget=$root.'/'.$relative;
        if(is_dir($liveTarget) && !is_link($liveTarget)){
            throw new RuntimeException(
                'Yönetilen klasörün dosyaya dönüşmesi kontrollü geçiş gerektiriyor: '.$relative
            );
        }
    }
}

function remove_stale_managed_files(string $root,array $oldFiles,array $newFiles,array $preserve): array {
    if($oldFiles===[]) return [];
    $newLookup=array_fill_keys($newFiles,true);
    $removed=[];
    foreach($oldFiles as $relative){
        $relative=managed_relative_path((string)$relative);
        if(isset($newLookup[$relative]) || path_is_preserved($relative,$preserve)) continue;

        $target=assert_managed_target_safe($root,$relative);
        if(!file_exists($target) && !is_link($target)) continue;
        if(is_dir($target) && !is_link($target)){
            throw new RuntimeException('Eski yönetilen yol dosya yerine klasör oldu; otomatik silme durduruldu: '.$relative);
        }
        if(!@unlink($target)){
            throw new RuntimeException('Eski yönetilen dosya kaldırılamadı: '.$relative);
        }
        $removed[]=$relative;
        cleanup_empty_managed_parents($root,$relative,$preserve);
    }
    sort($removed,SORT_STRING);
    return $removed;
}

function delete_tree(string $path): void {
    if(!file_exists($path)) return;
    if(is_file($path)||is_link($path)){ @unlink($path); return; }
    foreach(scandir($path)?:[] as $item){ if($item!=='.'&&$item!=='..') delete_tree($path.'/'.$item); }
    @rmdir($path);
}

function ensure_runtime_storage_guard(string $root): void {
    $storage=rtrim($root,'/\\').'/storage';
    if(!is_dir($storage)&&!mkdir($storage,0750,true)&&!is_dir($storage)){
        throw new RuntimeException('Storage klasörü hazırlanamadı.');
    }

    // Apache üzerinde doğrudan web erişimini engeller. Nginx bu dosyayı yok
    // sayar; o ortamda aynı kural sunucu yapılandırmasında uygulanmalıdır.
    $htaccess="<IfModule mod_authz_core.c>\nRequire all denied\n</IfModule>\n"
        ."<IfModule !mod_authz_core.c>\nOrder allow,deny\nDeny from all\n</IfModule>\n";
    $htPath=$storage.'/.htaccess';
    if(!is_file($htPath) || trim((string)@file_get_contents($htPath))!==trim($htaccess)){
        if(file_put_contents($htPath,$htaccess,LOCK_EX)===false){
            throw new RuntimeException('Storage erişim koruması yazılamadı.');
        }
        @chmod($htPath,0640);
    }

    $index=$storage.'/index.html';
    if(!is_file($index)){
        @file_put_contents($index,'',LOCK_EX);
        @chmod($index,0640);
    }
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
        // Güncelleme geri dönüş yedeği yalnız uygulama kodunu taşır.
        // Canlı sırlar ve çalışma verileri ayrı korunur; ZIP içine alınmaz.
        if($rel==='config/local.php'||$rel==='.env'||str_starts_with($rel,'storage/')) continue;
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

function assert_automatic_migration_safe(string $name,string $path): void {
    $raw=file_get_contents($path);
    if(!is_string($raw)) throw new RuntimeException('Migration okunamadı: '.$name);

    // Yorumları çıkar; yalnız çalıştırılabilir SQL üzerinde yüksek riskli kalıpları ara.
    $sql=preg_replace('/\/\*.*?\*\//s',' ',$raw) ?? $raw;
    $sql=preg_replace('/^\s*--.*$/m',' ',$sql) ?? $sql;
    $sql=str_replace(chr(96),'',$sql);

    $dangerous =
        preg_match('/\b(?:DROP|TRUNCATE)\s+TABLE\b/i',$sql)===1
        || preg_match('/\bDELETE\s+FROM\s+[A-Za-z0-9_]+\s*;/i',$sql)===1
        || preg_match('/\bUPDATE\s+[A-Za-z0-9_]+\s+SET\s+aktif\s*=\s*0\s*;/i',$sql)===1;

    if($dangerous){
        throw new RuntimeException(
            'Migration '.$name.' otomatik güncelleme için yıkıcı SQL içeriyor. '
            .'Veri kaybını önlemek için kurulum durduruldu.'
        );
    }
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

    // Eski tablo veri içeriyorsa otomatik DROP yasaktır. Bu kayıtların hangi
    // kullanici_id ile eşleşeceği kurulumdan kuruluma değişebilir; tahmin ederek
    // taşımak veri kaybı veya yanlış kurum eşleşmesi üretir.
    $rowCount=(int)($pdo->query('SELECT COUNT(*) FROM kurum_kullanicilari')->fetchColumn()?:0);
    if($rowCount>0){
        throw new RuntimeException(
            'Eski kurum_kullanicilari şeması '.$rowCount.' kayıt içeriyor. '
            .'Veri kaybını önlemek için otomatik güncelleme durduruldu; '
            .'kurum eşleşmeleri kontrollü migration ile dönüştürülmelidir.'
        );
    }

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

    // Buraya yalnız boş legacy tablo ulaşabilir; yeniden oluşturma veri kaybetmez.
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

function retired_automatic_migrations(): array {
    return [
        '000_v3_kurum_kullanicilari_onarim'=>true,
        '007_icerik_paketi_geri_al'=>true,
        '024_tek_aktif_super_admin'=>true,
        '025_tek_super_admin_sert_temizlik'=>true,
        '026_tek_aktif_super_admin_duzeltme'=>true,
        '027_tek_super_admin_kesin_sifirlama'=>true,
        '028_legacy_kurum_fk_temizlik'=>true,
        '032_test_ilerleme_sifirlama'=>true,
    ];
}

function run_pending_migrations(PDO $pdo,string $root): array {
    repair_legacy_institution_membership_schema($pdo);
    $retired=retired_automatic_migrations();
    $applied=[]; $files=glob($root.'/database/migrations/*.sql')?:[]; sort($files,SORT_NATURAL);
    $check=$pdo->prepare('SELECT 1 FROM sistem_migrations WHERE migration=? LIMIT 1');
    $insert=$pdo->prepare('INSERT INTO sistem_migrations (migration) VALUES (?)');
    foreach($files as $file){
        $name=basename($file,'.sql');
        $check->execute([$name]);
        if($check->fetchColumn()) continue;

        // Geçmişte tek seferlik veri temizliği amacıyla yazılmış bu migrationlar
        // artık otomatik güncelleme zincirinde kesinlikle çalıştırılmaz.
        if(isset($retired[$name])) continue;

        if($name==='004_ogrenci_giris_sistemi'){
            ensure_student_auth_schema($pdo);
        }else{
            assert_automatic_migration_safe($name,$file);
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

function assert_update_zip_safe(ZipArchive $zip): void {
    for($i=0;$i<$zip->numFiles;$i++){
        $name=(string)$zip->getNameIndex($i);
        $normalized=str_replace('\\','/',$name);
        if($normalized==='' || str_contains($normalized,"\0")
            || str_starts_with($normalized,'/')
            || preg_match('/^[A-Za-z]:\//',$normalized)===1){
            throw new RuntimeException('Güncelleme ZIP paketi geçersiz dosya yolu içeriyor.');
        }
        foreach(explode('/',$normalized) as $part){
            if($part==='..') throw new RuntimeException('Güncelleme ZIP paketi yol kaçışı içeriyor.');
        }

        if(method_exists($zip,'getExternalAttributesIndex')){
            $opsys=0;$attributes=0;
            if($zip->getExternalAttributesIndex($i,$opsys,$attributes)
                && $opsys===ZipArchive::OPSYS_UNIX){
                $mode=($attributes>>16)&0170000;
                if($mode===0120000){
                    throw new RuntimeException('Güncelleme ZIP paketi sembolik bağlantı içeriyor.');
                }
            }
        }
    }
}

function install_github_update(string $root,array $gh,array $preserve): array {
    [$owner,$repo,$branch]=github_repo_info($gh);
    $localVersion=read_app_version();
    $remote=next_remote_version_info($gh,$localVersion);
    if(version_compare($remote['version'],$localVersion,'<=')) return ['updated'=>false,'message'=>'Zaten guncel surum kullaniliyor.','remote'=>$remote,'local'=>$localVersion,'migrations'=>[]];

    $targetCommit=trim((string)($remote['commit']??''));
    if(!preg_match('/^[a-f0-9]{40}$/i',$targetCommit)){
        throw new RuntimeException('Siradaki surumun GitHub commit bilgisi gecersiz.');
    }

    $storage=$root.'/storage';
    ensure_runtime_storage_guard($root);
    @mkdir($storage.'/updates',0775,true); @mkdir($storage.'/backups',0775,true);
    $updateLock=fopen($storage.'/updates/update.lock','c');
    if($updateLock===false || !flock($updateLock,LOCK_EX|LOCK_NB)){
        if(is_resource($updateLock)) fclose($updateLock);
        throw new RuntimeException('Baska bir guncelleme islemi halen devam ediyor.');
    }
    $stamp=date('Ymd_His');
    $zipPath=$storage.'/updates/github_'.$stamp.'.zip';
    $extractDir=$storage.'/updates/extract_'.$stamp;
    $backupPath=$storage.'/backups/onceki_surum.zip';

    $pdo=db(); ensure_updater_schema($pdo);
    $log=$pdo->prepare("INSERT INTO guncelleme_gecmisi (onceki_surumu,yeni_surumu,github_commit,durum) VALUES (?,?,?,'basladi')");
    $log->execute([$localVersion,$remote['version'],$remote['commit']]); $logId=(int)$pdo->lastInsertId();

    try{
        $backupName=create_single_previous_backup($root);
        // En son main paketini degil, siradaki surumun sabit commit paketini indir.
        $downloadUrl='https://codeload.github.com/'.rawurlencode($owner).'/'.rawurlencode($repo).'/zip/'.rawurlencode($targetCommit).'?cb='.(string)round(microtime(true)*1000);
        updater_http($downloadUrl,$gh,$zipPath);

        if(!class_exists('ZipArchive')) throw new RuntimeException('PHP ZipArchive eklentisi gerekli.');
        $zip=new ZipArchive();
        if($zip->open($zipPath)!==true) throw new RuntimeException('GitHub ZIP paketi acilamadi.');
        assert_update_zip_safe($zip);
        if(!is_dir($extractDir)&&!mkdir($extractDir,0775,true)&&!is_dir($extractDir)){ $zip->close(); throw new RuntimeException('Gecici klasor olusturulamadi.'); }
        if(!$zip->extractTo($extractDir)){ $zip->close(); throw new RuntimeException('GitHub paketi acilamadi.'); }
        $zip->close();

        $sourceRoot=detect_update_root($extractDir);

        $packageVersionFile=$sourceRoot.'/version.json';
        $packageVersionData=is_file($packageVersionFile)
            ? json_decode((string)file_get_contents($packageVersionFile),true)
            : null;
        $packageVersion=is_array($packageVersionData)?trim((string)($packageVersionData['version']??'')):'';
        if($packageVersion===''||$packageVersion!==(string)$remote['version']){
            throw new RuntimeException(
                'Indirilen guncelleme paketi beklenen surumle eslesmiyor. Beklenen: '
                .(string)$remote['version'].' / Paket: '.($packageVersion!==''?$packageVersion:'bilinmiyor')
            );
        }

        $requiredPackageFiles=[
            'version.json',
            'config/app.php',
            'src/updater.php',
            'src/auth.php',
            'login.php',
            'index.php',
        ];
        foreach($requiredPackageFiles as $requiredFile){
            if(!is_file($sourceRoot.'/'.$requiredFile)){
                throw new RuntimeException('Güncelleme paketi eksik zorunlu dosya içeriyor: '.$requiredFile);
            }
        }

        // Yalnız updater'ın daha önce yönettiği dosyalar stale cleanup adayıdır.
        // İlk manifest yoksa hiçbir canlı dosya silinmez; sadece yeni baseline kaydedilir.
        $oldManagedFiles=read_managed_update_manifest($root);
        $newManagedFiles=collect_managed_update_files($sourceRoot,$preserve);
        assert_managed_copy_type_safe($root,$sourceRoot,$newManagedFiles,$oldManagedFiles,$preserve);

        // Migration'lar önce staging paketinden uygulanır.
        // DB dönüşümü başarısızsa yeni uygulama dosyaları canlıya kopyalanmaz.
        if(!auth_table_exists($pdo,'ogrenciler')) ensure_student_auth_schema($pdo);
        $migrations=run_pending_migrations($pdo,$sourceRoot);

        // Şema başarıyla hazırlandıktan sonra yeni uygulama dosyalarını etkinleştir.
        copy_update_tree($sourceRoot,$root,$preserve);
        $removedManagedFiles=remove_stale_managed_files($root,$oldManagedFiles,$newManagedFiles,$preserve);
        write_managed_update_manifest($root,$newManagedFiles,(string)$remote['version']);

        $pdo->prepare("INSERT INTO sistem_ayarlar (ayar_anahtari,ayar_degeri) VALUES ('uygulama_surumu',?) ON DUPLICATE KEY UPDATE ayar_degeri=VALUES(ayar_degeri)")->execute([$remote['version']]);
        $historyMessage='Guncelleme tamamlandi. Yedek: '.$backupName;
        if($removedManagedFiles!==[]) $historyMessage.='; temizlenen eski dosya: '.count($removedManagedFiles);
        $pdo->prepare("UPDATE guncelleme_gecmisi SET durum='basarili',mesaj=?,bitis_tarihi=NOW() WHERE id=?")->execute([$historyMessage,$logId]);

        @unlink($zipPath); delete_tree($extractDir);
        flock($updateLock,LOCK_UN); fclose($updateLock);
        return [
            'updated'=>true,
            'message'=>'Guncelleme basariyla kuruldu.',
            'remote'=>$remote,
            'local'=>$localVersion,
            'backup'=>$backupName,
            'migrations'=>$migrations,
            'removed_files'=>$removedManagedFiles,
            'managed_files'=>count($newManagedFiles),
        ];
    }catch(Throwable $e){
        error_log('[IlkAdim][updater] '.$e->getMessage());
        try{ $pdo->prepare("UPDATE guncelleme_gecmisi SET durum='hatali',mesaj=?,bitis_tarihi=NOW() WHERE id=?")->execute(['Guncelleme hatayla sonlandi. Ayrintilar sunucu gunlugune kaydedildi.',$logId]); }catch(Throwable $ignored){}
        @unlink($zipPath); delete_tree($extractDir);
        if(is_resource($updateLock)){flock($updateLock,LOCK_UN);fclose($updateLock);}
        throw $e;
    }
}
