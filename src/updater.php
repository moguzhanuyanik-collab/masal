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
    $h=['User-Agent: IlkAdim-Updater/1.0.8','Accept: */*','Cache-Control: no-cache, no-store, must-revalidate','Pragma: no-cache'];
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
        CURLOPT_USERAGENT=>'IlkAdim-Updater/1.0.8',
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

function run_pending_migrations(PDO $pdo,string $root): array {
    $applied=[]; $files=glob($root.'/database/migrations/*.sql')?:[]; sort($files,SORT_NATURAL);
    $check=$pdo->prepare('SELECT 1 FROM sistem_migrations WHERE migration=? LIMIT 1');
    $insert=$pdo->prepare('INSERT INTO sistem_migrations (migration) VALUES (?)');
    foreach($files as $file){
        $name=basename($file,'.sql'); $check->execute([$name]); if($check->fetchColumn()) continue;
        run_migration_sql($pdo,$file); $insert->execute([$name]); $applied[]=$name;
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
    $backupPath=$storage.'/backups/pre_'.str_replace('.','_',$localVersion).'_'.$stamp.'.zip';

    $pdo=db(); ensure_updater_schema($pdo);
    $log=$pdo->prepare("INSERT INTO guncelleme_gecmisi (onceki_surumu,yeni_surumu,github_commit,durum) VALUES (?,?,?,'basladi')");
    $log->execute([$localVersion,$remote['version'],$remote['commit']]); $logId=(int)$pdo->lastInsertId();

    try{
        create_project_backup($root,$backupPath);
        $downloadUrl='https://codeload.github.com/'.rawurlencode($owner).'/'.rawurlencode($repo).'/zip/refs/heads/'.rawurlencode($branch).'?cb='.(string)round(microtime(true)*1000);
        updater_http($downloadUrl,$gh,$zipPath);

        if(!class_exists('ZipArchive')) throw new RuntimeException('PHP ZipArchive eklentisi gerekli.');
        $zip=new ZipArchive();
        if($zip->open($zipPath)!==true) throw new RuntimeException('GitHub ZIP paketi acilamadi.');
        if(!is_dir($extractDir)&&!mkdir($extractDir,0775,true)&&!is_dir($extractDir)){ $zip->close(); throw new RuntimeException('Gecici klasor olusturulamadi.'); }
        if(!$zip->extractTo($extractDir)){ $zip->close(); throw new RuntimeException('GitHub paketi acilamadi.'); }
        $zip->close();

        $sourceRoot=detect_update_root($extractDir);
        copy_update_tree($sourceRoot,$root,$preserve);
        $migrations=run_pending_migrations($pdo,$root);
        $pdo->prepare("INSERT INTO sistem_ayarlar (ayar_anahtari,ayar_degeri) VALUES ('uygulama_surumu',?) ON DUPLICATE KEY UPDATE ayar_degeri=VALUES(ayar_degeri)")->execute([$remote['version']]);
        $pdo->prepare("UPDATE guncelleme_gecmisi SET durum='basarili',mesaj=?,bitis_tarihi=NOW() WHERE id=?")->execute(['Guncelleme tamamlandi. Yedek: '.basename($backupPath),$logId]);

        @unlink($zipPath); delete_tree($extractDir);
        return ['updated'=>true,'message'=>'Guncelleme basariyla kuruldu.','remote'=>$remote,'local'=>$localVersion,'backup'=>basename($backupPath),'migrations'=>$migrations];
    }catch(Throwable $e){
        try{ $pdo->prepare("UPDATE guncelleme_gecmisi SET durum='hatali',mesaj=?,bitis_tarihi=NOW() WHERE id=?")->execute([$e->getMessage(),$logId]); }catch(Throwable $ignored){}
        @unlink($zipPath); delete_tree($extractDir); throw $e;
    }
}
