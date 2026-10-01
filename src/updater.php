<?php
declare(strict_types=1);

const ILKADIM_UPDATER_CORE_GENERATION = 121;

function updater_core_generation_from_file(string $path): int {
    if(!is_file($path) || is_link($path) || !is_readable($path)) return 0;
    $raw=file_get_contents($path);
    if(!is_string($raw) || $raw==='') return 0;
    if(preg_match('/\\bILKADIM_UPDATER_CORE_GENERATION\\s*=\\s*(\\d+)\\s*;/', $raw, $m)!==1) return 0;
    return max(0,(int)$m[1]);
}

function preserve_newer_live_updater_in_staging(string $root,string $sourceRoot): bool {
    $live=rtrim($root,'/\\').'/src/updater.php';
    $staged=rtrim($sourceRoot,'/\\').'/src/updater.php';
    if(!is_file($live) || is_link($live) || !is_readable($live)) return false;
    if(!is_file($staged) || is_link($staged)) return false;

    $liveGeneration=updater_core_generation_from_file($live);
    $stagedGeneration=updater_core_generation_from_file($staged);
    if($liveGeneration<1 || $liveGeneration<=$stagedGeneration) return false;

    $tmp=$staged.'.keep-newer-'.bin2hex(random_bytes(6)).'.tmp';
    @unlink($tmp);
    try{
        if(!copy($live,$tmp)){
            throw new RuntimeException('Yeni updater çekirdeği staging alanına korunamadı.');
        }
        $liveHash=hash_file('sha256',$live);
        $tmpHash=hash_file('sha256',$tmp);
        if(!is_string($liveHash) || !is_string($tmpHash) || !hash_equals($liveHash,$tmpHash)){
            throw new RuntimeException('Korunan updater çekirdeği bütünlük doğrulamasından geçemedi.');
        }
        $mode=@fileperms($live);
        if(is_int($mode)) @chmod($tmp,$mode&0777);
        if(!@rename($tmp,$staged)){
            throw new RuntimeException('Korunan updater çekirdeği staging alanında etkinleştirilemedi.');
        }
    }finally{
        if(is_file($tmp)||is_link($tmp)) @unlink($tmp);
    }
    return true;
}

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

function updater_http(string $url,array $gh,?string $target=null,int $maxBytes=0): string|array {
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
    $writtenBytes=0;
    $downloadTooLarge=false;
    if($target!==null){
        $fp=fopen($target,'wb');
        if($fp===false){ curl_close($ch); throw new RuntimeException('Guncelleme paketi yazilamadi.'); }
        $opts[CURLOPT_RETURNTRANSFER]=false;
        $opts[CURLOPT_WRITEFUNCTION]=static function($curl,string $data) use($fp,$maxBytes,&$writtenBytes,&$downloadTooLarge): int {
            $length=strlen($data);
            if($maxBytes>0 && $writtenBytes+$length>$maxBytes){
                $downloadTooLarge=true;
                return 0;
            }
            $n=fwrite($fp,$data);
            if($n!==false) $writtenBytes+=$n;
            return $n===false?0:$n;
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

    if($downloadTooLarge){
        if($target!==null) @unlink($target);
        throw new RuntimeException('Güncelleme paketi indirme boyutu güvenlik sınırını aşıyor.');
    }
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

function update_package_limits(array $updateConfig=[]): array {
    $read=static function(string $key,int $default,int $minimum,int $maximum) use($updateConfig): int {
        $value=(int)($updateConfig[$key]??$default);
        if($value<$minimum) return $minimum;
        if($value>$maximum) return $maximum;
        return $value;
    };
    return [
        'max_download_bytes'=>$read('max_package_download_bytes',64*1024*1024,8*1024*1024,1024*1024*1024),
        'max_entries'=>$read('max_package_entries',5000,100,50000),
        'max_uncompressed_bytes'=>$read('max_package_uncompressed_bytes',128*1024*1024,16*1024*1024,2*1024*1024*1024),
        'max_file_bytes'=>$read('max_package_file_bytes',16*1024*1024,1024*1024,512*1024*1024),
        'max_compression_ratio'=>$read('max_package_compression_ratio',250,10,2000),
    ];
}

function normalize_release_revision(mixed $value): int {
    if(is_int($value)) return max(0,$value);
    if(is_string($value) && preg_match('/^\d+$/D',$value)===1) return max(0,(int)$value);
    if(is_float($value) && floor($value)===$value) return max(0,(int)$value);
    return 0;
}

function read_local_release_revision(string $root,string $expectedVersion=''): int {
    $path=rtrim($root,'/\\').'/version.json';
    if(!is_file($path) || !is_readable($path)) return 0;
    $data=json_decode((string)file_get_contents($path),true);
    if(!is_array($data)) return 0;
    $version=trim((string)($data['version']??''));
    if($expectedVersion!=='' && $version!==$expectedVersion) return 0;
    return normalize_release_revision($data['release_revision']??0);
}

function release_identity_is_newer(array $candidate,string $localVersion,int $localRevision=0): bool {
    $candidateVersion=trim((string)($candidate['version']??''));
    if($candidateVersion==='') return false;
    $cmp=version_compare($candidateVersion,$localVersion);
    if($cmp>0) return true;
    if($cmp<0) return false;
    return normalize_release_revision($candidate['release_revision']??0)>max(0,$localRevision);
}

function release_identity_should_replace_next(array $candidate,?array $next): bool {
    if($next===null) return true;
    $candidateVersion=trim((string)($candidate['version']??''));
    $nextVersion=trim((string)($next['version']??''));
    $cmp=version_compare($candidateVersion,$nextVersion);
    if($cmp<0) return true;
    if($cmp>0) return false;
    return normalize_release_revision($candidate['release_revision']??0)
        > normalize_release_revision($next['release_revision']??0);
}

function remote_update_metadata_at_ref(array $gh,string $ref,string $metadataFile='version.json'): array {
    [$owner,$repo,$branch]=github_repo_info($gh);
    $ref=trim($ref);
    if($ref==='') throw new RuntimeException('GitHub surum referansi bos olamaz.');
    if(!preg_match('/^[A-Za-z0-9_.\/-]+$/',$ref)) throw new RuntimeException('GitHub surum referansi gecersiz.');
    if(!in_array($metadataFile,['version.json','update-release.json'],true)){
        throw new RuntimeException('GitHub surum metadata dosyasi gecersiz.');
    }

    $cacheBuster=(string)round(microtime(true)*1000);
    $url='https://raw.githubusercontent.com/'.rawurlencode($owner).'/'.rawurlencode($repo).'/'.rawurlencode($ref).'/'.$metadataFile.'?cb='.$cacheBuster;
    $data=json_decode((string)updater_http($url,$gh),true);
    if(!is_array($data)||empty($data['version'])){
        throw new RuntimeException('GitHub '.$metadataFile.' okunamadi veya gecersiz.');
    }

    return [
        'version'=>(string)$data['version'],
        'release_revision'=>normalize_release_revision($data['release_revision']??0),
        'name'=>(string)($data['name']??''),
        'commit'=>$ref,
    ];
}

function remote_version_info_at_ref(array $gh,string $ref): array {
    return remote_update_metadata_at_ref($gh,$ref,'version.json');
}

function remote_release_info_at_ref(array $gh,string $ref): array {
    return remote_update_metadata_at_ref($gh,$ref,'update-release.json');
}

function github_branch_head_sha(array $gh): string {
    [$owner,$repo,$branch]=github_repo_info($gh);
    $cacheBuster=(string)round(microtime(true)*1000);
    $url='https://api.github.com/repos/'.rawurlencode($owner).'/'.rawurlencode($repo)
        .'/commits/'.rawurlencode($branch).'?cb='.$cacheBuster;
    $data=json_decode((string)updater_http($url,$gh),true);
    $sha=trim((string)($data['sha']??''));
    if(!preg_match('/^[a-f0-9]{40}$/i',$sha)){
        throw new RuntimeException('GitHub dal HEAD commit bilgisi çözümlenemedi.');
    }
    return $sha;
}

function remote_version_info(array $gh): array {
    return remote_version_info_at_ref($gh,github_branch_head_sha($gh));
}

function remote_release_info(array $gh): array {
    return remote_release_info_at_ref($gh,github_branch_head_sha($gh));
}

function next_remote_version_info(array $gh,string $localVersion,int $localRevision=0): array {
    $localVersion=trim($localVersion);
    if($localVersion==='') $localVersion='0.0.0';

    // 1.2.1: eski ara-sürüm/recovery zinciri tamamen kaldırıldı.
    // Her kontrol yalnız main dalının gerçek 40 karakterlik HEAD SHA'sına gider.
    return remote_release_info($gh);
}

function path_is_preserved(string $relative,array $preserve): bool {
    $relative=ltrim(str_replace('\\','/',$relative),'/');
    foreach($preserve as $rule){
        $rule=trim(str_replace('\\','/',(string)$rule),'/');
        if($rule!==''&&($relative===$rule||str_starts_with($relative,$rule.'/'))) return true;
    }
    return false;
}

function update_file_sha256(string $path,string $label): string {
    if(!is_file($path) || is_link($path)){
        throw new RuntimeException($label.' normal dosya değil.');
    }
    $hash=hash_file('sha256',$path);
    if(!is_string($hash) || strlen($hash)!==64){
        throw new RuntimeException($label.' SHA-256 değeri üretilemedi.');
    }
    return $hash;
}

function atomic_replace_update_file(string $source,string $target,string $relative): void {
    $parent=dirname($target);
    if(!is_dir($parent)&&!mkdir($parent,0775,true)&&!is_dir($parent)){
        throw new RuntimeException('Güncelleme hedef klasörü oluşturulamadı: '.$relative);
    }
    if(is_link($target)){
        throw new RuntimeException('Güncelleme hedef dosyası sembolik bağlantı olamaz: '.$relative);
    }

    $tmp=$parent.'/.'.basename($target).'.ilkadim-update-'.bin2hex(random_bytes(6)).'.tmp';
    @unlink($tmp);
    try{
        if(!copy($source,$tmp)){
            throw new RuntimeException('Güncelleme dosyası geçici alana yazılamadı: '.$relative);
        }
        $sourceHash=update_file_sha256($source,'Kaynak güncelleme dosyası');
        $tmpHash=update_file_sha256($tmp,'Geçici güncelleme dosyası');
        if(!hash_equals($sourceHash,$tmpHash)){
            throw new RuntimeException('Güncelleme dosyası geçici yazım bütünlüğü doğrulanamadı: '.$relative);
        }
        $mode=@fileperms($source);
        if(is_int($mode)) @chmod($tmp,$mode&0777);
        if(!@rename($tmp,$target)){
            throw new RuntimeException('Güncelleme dosyası atomik olarak etkinleştirilemedi: '.$relative);
        }
    }finally{
        if(is_file($tmp)||is_link($tmp)) @unlink($tmp);
    }
}

function updater_core_handoff_marker_path(string $root): string {
    return rtrim($root,'/\\').'/storage/updates/updater-core-handoff.json';
}

function updater_core_handoff_max_age_seconds(): int {
    return 6*60*60;
}

function read_updater_core_handoff_marker(
    string $root,
    string $targetCommit,
    string $targetVersion=''
): ?array {
    $path=updater_core_handoff_marker_path($root);
    if(!is_file($path) || !is_readable($path) || is_link($path)) return null;
    $data=json_decode((string)file_get_contents($path),true);
    if(!is_array($data)) return null;

    if(trim((string)($data['target_commit']??''))!==$targetCommit) return null;
    if($targetVersion!=='' && trim((string)($data['target_version']??''))!==$targetVersion) return null;

    $updatedAt=trim((string)($data['updated_at']??''));
    $updatedTs=$updatedAt!==''?strtotime($updatedAt):false;
    $now=time();
    if($updatedTs===false || $updatedTs>$now+300 || ($now-$updatedTs)>updater_core_handoff_max_age_seconds()){
        return null;
    }

    $rawBackup=trim((string)($data['application_backup']??''));
    $backup=basename($rawBackup);
    if($backup==='' || $rawBackup!==$backup) return null;
    $backupPath=rtrim($root,'/\\').'/storage/backups/'.$backup;
    if(!is_file($backupPath) || is_link($backupPath)) return null;

    $actualHash=update_file_sha256($backupPath,'Handoff uygulama yedeği');
    $actualBytes=max(0,(int)(filesize($backupPath)?:0));
    if($actualBytes<1) return null;

    $format=max(1,(int)($data['format']??1));
    if($format>=2){
        $expectedHash=strtolower(trim((string)($data['application_backup_sha256']??'')));
        $expectedBytes=max(0,(int)($data['application_backup_bytes']??0));
        if(!preg_match('/^[a-f0-9]{64}$/',$expectedHash)) return null;
        if($expectedBytes<1 || $expectedBytes!==$actualBytes) return null;
        if(!hash_equals($expectedHash,$actualHash)) return null;
    }else{
        $data['application_backup_sha256']=$actualHash;
        $data['application_backup_bytes']=$actualBytes;
        $data['legacy_marker']=true;
    }

    $rawUpdaterBackup=trim((string)($data['updater_backup']??''));
    $updaterBackup=basename($rawUpdaterBackup);
    $oldHash=strtolower(trim((string)($data['old_sha256']??'')));
    $newHash=strtolower(trim((string)($data['new_sha256']??'')));
    if($updaterBackup==='' || $rawUpdaterBackup!==$updaterBackup) return null;
    if(preg_match('/^[a-f0-9]{64}$/',$oldHash)!==1 || preg_match('/^[a-f0-9]{64}$/',$newHash)!==1) return null;

    $updaterBackupPath=rtrim($root,'/\\').'/storage/backups/'.$updaterBackup;
    if(!is_file($updaterBackupPath) || is_link($updaterBackupPath)) return null;
    if(!hash_equals($oldHash,update_file_sha256($updaterBackupPath,'Handoff updater yedeği'))) return null;

    $liveUpdater=rtrim($root,'/\\').'/src/updater.php';
    if(!is_file($liveUpdater) || is_link($liveUpdater)) return null;
    if(!hash_equals($newHash,update_file_sha256($liveUpdater,'Canlı updater çekirdeği'))) return null;

    return $data;
}

function write_updater_core_handoff_marker(string $root,array $state): void {
    $path=updater_core_handoff_marker_path($root);
    $dir=dirname($path);
    if(!is_dir($dir)&&!mkdir($dir,0750,true)&&!is_dir($dir)){
        throw new RuntimeException('Updater çekirdeği handoff klasörü oluşturulamadı.');
    }
    $tmp=$path.'.tmp';
    $json=json_encode(
        ['format'=>2,'updated_at'=>date(DATE_ATOM)]+$state,
        JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES|JSON_PRETTY_PRINT
    );
    if(!is_string($json)) throw new RuntimeException('Updater çekirdeği handoff kaydı oluşturulamadı.');
    @unlink($tmp);
    if(file_put_contents($tmp,$json."\n",LOCK_EX)===false){
        throw new RuntimeException('Updater çekirdeği handoff kaydı yazılamadı.');
    }
    @chmod($tmp,0600);
    if(!@rename($tmp,$path)){
        @unlink($tmp);
        throw new RuntimeException('Updater çekirdeği handoff kaydı etkinleştirilemedi.');
    }
    @chmod($path,0600);
}

function clear_updater_core_handoff_marker(string $root): void {
    $path=updater_core_handoff_marker_path($root);
    if(is_file($path)||is_link($path)) @unlink($path);
}

function prepare_updater_core_handoff(
    string $root,
    string $sourceRoot,
    string $targetVersion,
    string $targetCommit,
    string $applicationBackup
): ?array {
    $relative='src/updater.php';
    $source=rtrim($sourceRoot,'/\\').'/'.$relative;
    $target=rtrim($root,'/\\').'/'.$relative;
    if(!is_file($source)||is_link($source)){
        throw new RuntimeException('Paket updater çekirdeği geçersiz.');
    }
    if(!is_file($target)||is_link($target)){
        throw new RuntimeException('Canlı updater çekirdeği geçersiz.');
    }

    $sourceHash=update_file_sha256($source,'Paket updater çekirdeği');
    $targetHash=update_file_sha256($target,'Canlı updater çekirdeği');
    if(hash_equals($sourceHash,$targetHash)) return null;

    $backupDir=rtrim($root,'/\\').'/storage/backups';
    if(!is_dir($backupDir)&&!mkdir($backupDir,0750,true)&&!is_dir($backupDir)){
        throw new RuntimeException('Updater çekirdeği yedek klasörü oluşturulamadı.');
    }
    $safeVersion=preg_replace('/[^0-9A-Za-z._-]+/','-',trim($targetVersion))?:'unknown';
    $backupName='updater-core-before-'.$safeVersion.'-'.date('Ymd_His').'-'.substr($targetHash,0,12).'.php';
    $backupPath=$backupDir.'/'.$backupName;
    if(!copy($target,$backupPath)){
        throw new RuntimeException('Canlı updater çekirdeği yedeklenemedi.');
    }
    @chmod($backupPath,0600);
    if(!hash_equals($targetHash,update_file_sha256($backupPath,'Updater çekirdeği yedeği'))){
        @unlink($backupPath);
        throw new RuntimeException('Updater çekirdeği yedeği bütünlük doğrulamasından geçemedi.');
    }

    $activated=false;
    try{
        atomic_replace_update_file($source,$target,$relative);
        $activated=true;
        $activatedHash=update_file_sha256($target,'Etkin updater çekirdeği');
        if(!hash_equals($sourceHash,$activatedHash)){
            throw new RuntimeException('Updater çekirdeği etkinleştirme sonrası bütünlük doğrulamasından geçemedi.');
        }

        $applicationBackupMeta=backup_artifact_metadata($root,$applicationBackup);
        if($applicationBackupMeta===null || (int)($applicationBackupMeta['bytes']??0)<1){
            throw new RuntimeException('Handoff uygulama yedeği bütünlük metadata değeri üretilemedi.');
        }

        $state=[
            'target_version'=>$targetVersion,
            'target_commit'=>$targetCommit,
            'application_backup'=>basename($applicationBackup),
            'application_backup_sha256'=>(string)$applicationBackupMeta['sha256'],
            'application_backup_bytes'=>(int)$applicationBackupMeta['bytes'],
            'updater_backup'=>$backupName,
            'old_sha256'=>$targetHash,
            'new_sha256'=>$sourceHash,
        ];
        write_updater_core_handoff_marker($root,$state);
        return $state;
    }catch(Throwable $handoffError){
        if($activated){
            try{
                atomic_replace_update_file($backupPath,$target,$relative);
                $rolledBackHash=update_file_sha256($target,'Geri yüklenen updater çekirdeği');
                if(!hash_equals($targetHash,$rolledBackHash)){
                    throw new RuntimeException('Updater çekirdeği rollback bütünlük doğrulamasından geçemedi.');
                }
                clear_updater_core_handoff_marker($root);
            }catch(Throwable $rollbackError){
                throw new RuntimeException(
                    'Updater çekirdeği handoff başarısız oldu ve otomatik rollback tamamlanamadı.',
                    0,
                    $handoffError
                );
            }
        }
        throw $handoffError;
    }
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
            if(!is_dir($dst)&&!mkdir($dst,0775,true)&&!is_dir($dst)){
                throw new RuntimeException('Güncelleme hedef klasörü oluşturulamadı: '.$rel);
            }
            copy_update_tree($src,$destination,$preserve,$rel);
            continue;
        }
        if(!is_file($src)){
            throw new RuntimeException('Güncelleme paketi desteklenmeyen dosya türü içeriyor: '.$rel);
        }
        atomic_replace_update_file($src,$dst,$rel);
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

function normalized_packaged_manifest_files(array $manifestData): array {
    if((int)($manifestData['format']??0)!==1){
        throw new RuntimeException('Güncelleme paketi yönetilen dosya manifest formatı desteklenmiyor.');
    }
    $raw=$manifestData['files']??null;
    if(!is_array($raw) || $raw===[]){
        throw new RuntimeException('Güncelleme paketi yönetilen dosya manifesti boş veya geçersiz.');
    }

    $files=[];
    $seen=[];
    foreach($raw as $relative){
        if(!is_string($relative) || trim($relative)===''){
            throw new RuntimeException('Güncelleme paketi yönetilen dosya manifestinde geçersiz kayıt var.');
        }
        $normalized=managed_relative_path($relative);
        if(isset($seen[$normalized])){
            throw new RuntimeException('Güncelleme paketi yönetilen dosya manifestinde tekrarlı kayıt var: '.$normalized);
        }
        $seen[$normalized]=true;
        $files[]=$normalized;
    }
    sort($files,SORT_STRING);
    return $files;
}

function assert_packaged_manifest_matches_tree(array $manifestData,array $actualFiles): void {
    $declared=normalized_packaged_manifest_files($manifestData);
    $actual=[];
    foreach($actualFiles as $relative) $actual[]=managed_relative_path((string)$relative);
    sort($actual,SORT_STRING);
    $actual=array_values(array_unique($actual));

    if($declared===$actual) return;

    $missing=array_values(array_diff($actual,$declared));
    $phantom=array_values(array_diff($declared,$actual));
    $parts=[];
    if($missing!==[]) $parts[]='manifestte eksik: '.implode(', ',array_slice($missing,0,5)).(count($missing)>5?' ...':'');
    if($phantom!==[]) $parts[]='pakette bulunmayan: '.implode(', ',array_slice($phantom,0,5)).(count($phantom)>5?' ...':'');
    throw new RuntimeException(
        'Güncelleme paketi yönetilen dosya manifesti gerçek paket ağacıyla eşleşmiyor'
        .($parts!==[]?': '.implode('; ',$parts):'.')
    );
}

function managed_manifest_path(string $root): string {
    return rtrim($root,'/\\').'/storage/updates/managed-files.json';
}

function read_managed_file_list(string $path): array {
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

function managed_runtime_manifest_state(string $root): ?array {
    $path=managed_manifest_path($root);
    if(!is_file($path) || !is_readable($path) || is_link($path)) return null;
    $decoded=json_decode((string)file_get_contents($path),true);
    if(!is_array($decoded) || !is_array($decoded['files']??null)) return null;

    $format=max(1,(int)($decoded['format']??1));
    $version=trim((string)($decoded['version']??''));
    $revision=normalize_release_revision($decoded['release_revision']??0);
    if($version==='') return null;

    $localPath=rtrim($root,'/\\').'/version.json';
    $localData=is_file($localPath)?json_decode((string)file_get_contents($localPath),true):null;
    if(!is_array($localData)) return null;
    $localVersion=trim((string)($localData['version']??''));
    $localRevision=normalize_release_revision($localData['release_revision']??0);
    if($localVersion==='' || $version!==$localVersion) return null;
    if(version_compare($localVersion,'1.1.105','>=') && $revision!==$localRevision) return null;

    $files=read_managed_file_list($path);
    if($files===[]) return null;
    return [
        'format'=>$format,
        'version'=>$version,
        'release_revision'=>$revision,
        'files'=>$files,
        'path'=>$path,
    ];
}

function read_managed_update_manifest(string $root): array {
    $runtime=managed_runtime_manifest_state($root);
    if($runtime!==null) return $runtime['files'];

    // Runtime manifest kimliği yerel release ile eşleşmiyorsa güvenilmez.
    // Paketle gelen manifest yalnız dosya-listesi baseline'ı olarak kullanılabilir.
    return read_managed_file_list(rtrim($root,'/\\').'/update-managed-files.json');
}

function read_managed_file_hashes(string $path): array {
    if(!is_file($path) || is_link($path)) return [];
    $decoded=json_decode((string)file_get_contents($path),true);
    if(!is_array($decoded) || !is_array($decoded['hashes']??null)) return [];

    $hashes=[];
    foreach($decoded['hashes'] as $relative=>$hash){
        if(!is_string($relative) || !is_string($hash)) continue;
        try{$relative=managed_relative_path($relative);}catch(Throwable){continue;}
        $hash=strtolower(trim($hash));
        if(preg_match('/^[a-f0-9]{64}$/',$hash)!==1) continue;
        $hashes[$relative]=$hash;
    }
    ksort($hashes,SORT_STRING);
    return $hashes;
}

function read_managed_update_hashes(string $root): array {
    $runtime=managed_runtime_manifest_state($root);
    if($runtime===null || (int)$runtime['format']<2) return [];

    $hashes=read_managed_file_hashes((string)$runtime['path']);
    $files=$runtime['files'];
    if(count($hashes)!==count($files)) return [];
    foreach($files as $relative){
        if(!isset($hashes[$relative])) return [];
    }
    return $hashes;
}

function write_managed_update_manifest(string $root,array $files,string $version,int $releaseRevision=0): void {
    $path=managed_manifest_path($root);
    $dir=dirname($path);
    if(!is_dir($dir)&&!mkdir($dir,0750,true)&&!is_dir($dir)){
        throw new RuntimeException('Yönetilen dosya manifest klasörü oluşturulamadı.');
    }

    $normalized=[];
    foreach($files as $relative) $normalized[]=managed_relative_path((string)$relative);
    sort($normalized,SORT_STRING);
    $normalized=array_values(array_unique($normalized));

    $hashes=[];
    foreach($normalized as $relative){
        $target=assert_managed_target_safe($root,$relative);
        if(!is_file($target) || is_link($target)){
            throw new RuntimeException('Yönetilen dosya hash baseline oluşturulamadı: '.$relative);
        }
        $hashes[$relative]=update_file_sha256($target,'Yönetilen dosya');
    }

    $json=json_encode([
        'format'=>2,
        'version'=>$version,
        'release_revision'=>max(0,$releaseRevision),
        'written_at'=>date(DATE_ATOM),
        'files'=>$normalized,
        'hashes'=>$hashes,
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

function nearest_existing_update_directory(string $path,string $root): string {
    $root=rtrim($root,'/\\');
    $current=$path;
    while(!is_dir($current)){
        $parent=dirname($current);
        if($parent===$current || strlen($parent)<strlen($root)){
            throw new RuntimeException('Güncelleme hedef klasörü güvenli biçimde çözümlenemedi.');
        }
        $current=$parent;
    }
    return $current;
}

function assert_update_activation_preflight(
    string $root,
    string $sourceRoot,
    array $newFiles,
    array $oldFiles,
    array $preserve
): array {
    $root=rtrim($root,'/\\');
    $sourceRoot=rtrim($sourceRoot,'/\\');
    $bytes=0;
    $checkedDirectories=[];

    $checkDirectory=static function(string $directory) use(&$checkedDirectories): void {
        $key=str_replace('\\','/',$directory);
        if(isset($checkedDirectories[$key])) return;
        if(!is_dir($directory) || is_link($directory) || !is_writable($directory)){
            throw new RuntimeException('Güncelleme hedef klasörü yazılabilir değil.');
        }
        $checkedDirectories[$key]=true;
    };

    foreach($newFiles as $relative){
        $relative=managed_relative_path((string)$relative);
        if(path_is_preserved($relative,$preserve)) continue;
        $source=$sourceRoot.'/'.$relative;
        if(!is_file($source) || is_link($source)){
            throw new RuntimeException('Güncelleme kaynak dosyası geçersiz: '.$relative);
        }
        $bytes+=max(0,(int)(filesize($source)?:0));

        $target=assert_managed_target_safe($root,$relative);
        if(is_link($target)){
            throw new RuntimeException('Güncelleme hedef dosyası sembolik bağlantı olamaz: '.$relative);
        }
        if(file_exists($target) && !is_file($target)){
            throw new RuntimeException('Güncelleme hedef yolu normal dosya değil: '.$relative);
        }
        $parent=nearest_existing_update_directory(dirname($target),$root);
        $checkDirectory($parent);
    }

    $newLookup=array_fill_keys($newFiles,true);
    foreach($oldFiles as $relative){
        $relative=managed_relative_path((string)$relative);
        if(isset($newLookup[$relative]) || path_is_preserved($relative,$preserve)) continue;
        $target=assert_managed_target_safe($root,$relative);
        if(!file_exists($target) && !is_link($target)) continue;
        if(is_link($target) || !is_file($target)){
            throw new RuntimeException('Eski yönetilen hedef normal dosya değil: '.$relative);
        }
        $checkDirectory(dirname($target));
    }

    assert_backup_disk_space($root,$bytes,'Güncelleme dosya aktivasyonu');
    return [
        'files'=>count($newFiles),
        'bytes'=>$bytes,
        'directories'=>count($checkedDirectories),
    ];
}

function verify_activated_update_files(string $sourceRoot,string $root,array $files,array $preserve): array {
    $verified=0;
    $bytes=0;
    foreach($files as $relative){
        $relative=managed_relative_path((string)$relative);
        if(path_is_preserved($relative,$preserve)) continue;
        $source=$sourceRoot.'/'.$relative;
        $target=assert_managed_target_safe($root,$relative);
        if(!is_file($target) || is_link($target)){
            throw new RuntimeException('Güncelleme sonrası dosya bulunamadı veya geçersiz: '.$relative);
        }
        $sourceHash=update_file_sha256($source,'Kaynak güncelleme dosyası');
        $targetHash=update_file_sha256($target,'Etkin güncelleme dosyası');
        if(!hash_equals($sourceHash,$targetHash)){
            throw new RuntimeException('Güncelleme sonrası dosya bütünlüğü doğrulanamadı: '.$relative);
        }
        $verified++;
        $bytes+=max(0,(int)(filesize($target)?:0));
    }
    return ['files'=>$verified,'bytes'=>$bytes];
}

function assert_stale_managed_files_safe(
    string $root,
    array $oldFiles,
    array $newFiles,
    array $preserve,
    array $oldHashes
): array {
    if($oldFiles===[]) return [];
    $newLookup=array_fill_keys($newFiles,true);
    $candidates=[];
    foreach($oldFiles as $relative){
        $relative=managed_relative_path((string)$relative);
        if(isset($newLookup[$relative]) || path_is_preserved($relative,$preserve)) continue;

        $target=assert_managed_target_safe($root,$relative);
        if(!file_exists($target) && !is_link($target)) continue;
        if(is_link($target) || !is_file($target)){
            throw new RuntimeException('Eski yönetilen hedef normal dosya değil; otomatik silme durduruldu: '.$relative);
        }

        $expected=strtolower(trim((string)($oldHashes[$relative]??'')));
        if(preg_match('/^[a-f0-9]{64}$/',$expected)!==1){
            throw new RuntimeException(
                'Eski yönetilen dosya için güvenilir hash baseline yok; otomatik silme durduruldu: '.$relative
            );
        }
        $actual=update_file_sha256($target,'Eski yönetilen dosya');
        if(!hash_equals($expected,$actual)){
            throw new RuntimeException(
                'Eski yönetilen dosya kurulumdan sonra değiştirilmiş; otomatik silme durduruldu: '.$relative
            );
        }
        $candidates[]=$relative;
    }
    sort($candidates,SORT_STRING);
    return $candidates;
}

function remove_stale_managed_files(
    string $root,
    array $oldFiles,
    array $newFiles,
    array $preserve,
    array $oldHashes=[]
): array {
    if($oldFiles===[]) return [];
    $newLookup=array_fill_keys($newFiles,true);
    $removed=[];
    foreach($oldFiles as $relative){
        $relative=managed_relative_path((string)$relative);
        if(isset($newLookup[$relative]) || path_is_preserved($relative,$preserve)) continue;

        $target=assert_managed_target_safe($root,$relative);
        if(!file_exists($target) && !is_link($target)) continue;
        if(is_link($target) || !is_file($target)){
            throw new RuntimeException('Eski yönetilen hedef normal dosya değil; otomatik silme durduruldu: '.$relative);
        }

        $expected=strtolower(trim((string)($oldHashes[$relative]??'')));
        if(preg_match('/^[a-f0-9]{64}$/',$expected)!==1){
            throw new RuntimeException(
                'Eski yönetilen dosya için güvenilir hash baseline yok; otomatik silme durduruldu: '.$relative
            );
        }
        $actual=update_file_sha256($target,'Eski yönetilen dosya');
        if(!hash_equals($expected,$actual)){
            throw new RuntimeException(
                'Eski yönetilen dosya silme öncesinde değiştirilmiş; otomatik silme durduruldu: '.$relative
            );
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

function project_backup_files(string $root,string $relative=''): Generator {
    $base=$relative===''?$root:$root.'/'.$relative;
    foreach(scandir($base)?:[] as $item){
        if($item==='.'||$item==='..') continue;
        $rel=ltrim($relative.'/'.$item,'/');
        if($rel==='storage'||str_starts_with($rel,'storage/')
            ||$rel==='.git'||str_starts_with($rel,'.git/')
            ||$rel==='config/local.php'||$rel==='.env'){
            continue;
        }
        $path=$root.'/'.$rel;
        if(is_link($path)) continue;
        if(is_dir($path)){
            yield from project_backup_files($root,$rel);
            continue;
        }
        if(is_file($path)){
            yield ['path'=>$path,'relative'=>$rel,'bytes'=>(int)(filesize($path)?:0)];
        }
    }
}

function project_backup_source_bytes(string $root): int {
    $total=0;
    foreach(project_backup_files($root) as $file){
        $total+=max(0,(int)($file['bytes']??0));
    }
    return $total;
}

function assert_backup_disk_space(string $path,int $estimatedBytes,string $label): void {
    $dir=is_dir($path)?$path:dirname($path);
    $free=@disk_free_space($dir);
    if(!is_float($free) && !is_int($free)) return;
    $required=max(16*1024*1024,(int)ceil(max(0,$estimatedBytes)*1.15));
    if((int)$free<$required){
        throw new RuntimeException(
            $label.' için yeterli boş disk alanı yok. Gerekli yaklaşık: '
            .number_format($required/1048576,1,'.','').' MB.'
        );
    }
}

function validate_project_backup(string $path): array {
    if(!class_exists('ZipArchive')) throw new RuntimeException('PHP ZipArchive eklentisi gerekli.');
    if(!is_file($path)||(int)(filesize($path)?:0)<128){
        throw new RuntimeException('Uygulama yedeği boş veya geçersiz.');
    }

    $zip=new ZipArchive();
    $flags=defined('ZipArchive::CHECKCONS')?(int)constant('ZipArchive::CHECKCONS'):0;
    if($zip->open($path,$flags)!==true){
        throw new RuntimeException('Uygulama yedeği tekrar açılamadı.');
    }
    try{
        if($zip->numFiles<5) throw new RuntimeException('Uygulama yedeği beklenenden az dosya içeriyor.');
        foreach(['version.json','src/updater.php','src/auth.php','login.php','index.php'] as $required){
            if($zip->locateName($required)===false){
                throw new RuntimeException('Uygulama yedeğinde kritik dosya eksik: '.$required);
            }
        }
        foreach(['config/local.php','.env','.git/config'] as $secret){
            if($zip->locateName($secret)!==false){
                throw new RuntimeException('Uygulama yedeği gizli yapılandırma dosyası içeriyor: '.$secret);
            }
        }
    }finally{
        $zip->close();
    }

    $hash=hash_file('sha256',$path);
    if(!is_string($hash)||strlen($hash)!==64){
        throw new RuntimeException('Uygulama yedeği SHA-256 değeri üretilemedi.');
    }
    return [
        'file'=>basename($path),
        'bytes'=>(int)(filesize($path)?:0),
        'sha256'=>$hash,
    ];
}

function create_project_backup(string $root,string $target): void {
    if(!class_exists('ZipArchive')) throw new RuntimeException('PHP ZipArchive eklentisi gerekli.');
    assert_backup_disk_space(dirname($target),project_backup_source_bytes($root),'Uygulama yedeği');

    $zip=new ZipArchive();
    if($zip->open($target,ZipArchive::CREATE|ZipArchive::OVERWRITE)!==true) throw new RuntimeException('Yedek ZIP olusturulamadi.');
    try{
        foreach(project_backup_files($root) as $file){
            $path=(string)$file['path'];
            $rel=(string)$file['relative'];
            if(!$zip->addFile($path,$rel)){
                throw new RuntimeException('Uygulama yedeğine dosya eklenemedi: '.$rel);
            }
        }
    }catch(Throwable $e){
        $zip->close();
        @unlink($target);
        throw $e;
    }
    if(!$zip->close()){
        @unlink($target);
        throw new RuntimeException('Uygulama yedeği kapatılamadı.');
    }
    validate_project_backup($target);
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

function normalize_db_backup_config(array $db): array {
    $host=trim((string)($db['host']??'localhost'));
    $port=max(1,min(65535,(int)($db['port']??3306)));
    $name=trim((string)($db['name']??''));
    $user=(string)($db['user']??'');
    $pass=(string)($db['pass']??'');
    foreach([$host,$name,$user] as $value){
        if($value==='' || str_contains($value,"\0") || str_contains($value,"\n") || str_contains($value,"\r")){
            throw new RuntimeException('Veritabanı yedeği için DB ayarları geçersiz.');
        }
    }
    return ['host'=>$host,'port'=>$port,'name'=>$name,'user'=>$user,'pass'=>$pass];
}

function mysql_option_quote(string $value): string {
    if(str_contains($value,"\0")) throw new RuntimeException('MySQL option değeri geçersiz.');
    $value=str_replace(
        ["\\","\"","\n","\r","\t"],
        ["\\\\","\\\"","\\n","\\r","\\t"],
        $value
    );
    return '"'.$value.'"';
}

function create_mysql_defaults_file(string $root,array $db): string {
    $dir=rtrim($root,'/\\').'/storage/updates';
    if(!is_dir($dir)&&!mkdir($dir,0750,true)&&!is_dir($dir)){
        throw new RuntimeException('MySQL geçici ayar klasörü oluşturulamadı.');
    }
    $path=$dir.'/.mysqldump-'.bin2hex(random_bytes(12)).'.cnf';
    $content="[client]\n"
        ."host=".mysql_option_quote((string)$db['host'])."\n"
        ."port=".(string)(int)$db['port']."\n"
        ."user=".mysql_option_quote((string)$db['user'])."\n"
        ."password=".mysql_option_quote((string)$db['pass'])."\n"
        ."default-character-set=utf8mb4\n";
    if(file_put_contents($path,$content,LOCK_EX)===false){
        throw new RuntimeException('MySQL geçici ayar dosyası yazılamadı.');
    }
    @chmod($path,0600);
    return $path;
}

function database_size_bytes(PDO $pdo): int {
    try{
        $stmt=$pdo->query("SELECT COALESCE(SUM(data_length+index_length),0)
            FROM information_schema.tables WHERE table_schema=DATABASE()");
        $size=(int)($stmt?$stmt->fetchColumn():0);
        if($stmt)$stmt->closeCursor();
        return max(0,$size);
    }catch(Throwable){
        return 0;
    }
}

function find_mysqldump_binary(array $updateConfig=[]): ?string {
    $configured=trim((string)($updateConfig['mysqldump_path']??''));
    $candidates=[];
    if($configured!=='') $candidates[]=$configured;
    foreach([
        '/usr/bin/mysqldump',
        '/usr/local/bin/mysqldump',
        '/usr/local/mysql/bin/mysqldump',
        '/opt/homebrew/bin/mysqldump',
    ] as $candidate) $candidates[]=$candidate;

    foreach(array_values(array_unique($candidates)) as $candidate){
        if(is_file($candidate) && is_executable($candidate)) return $candidate;
    }
    return null;
}

function create_database_backup(
    string $root,
    array $dbConfig,
    array $updateConfig=[],
    ?PDO $pdo=null
): string {
    if(!function_exists('proc_open')){
        throw new RuntimeException('Migration için veritabanı yedeği alınamıyor: proc_open kullanılamıyor.');
    }
    $binary=find_mysqldump_binary($updateConfig);
    if($binary===null){
        throw new RuntimeException(
            'Migration için veritabanı yedeği zorunlu; mysqldump bulunamadı. '
            .'update.mysqldump_path ayarlanmalı veya sunucuya mysqldump kurulmalı.'
        );
    }

    $db=normalize_db_backup_config($dbConfig);
    $dir=rtrim($root,'/\\').'/storage/backups';
    if(!is_dir($dir)&&!mkdir($dir,0750,true)&&!is_dir($dir)){
        throw new RuntimeException('Veritabanı yedek klasörü oluşturulamadı.');
    }

    $final=$dir.'/onceki_veritabani.sql';
    $tmp=$dir.'/onceki_veritabani.tmp.sql';
    $old=$dir.'/onceki_veritabani.old.sql';
    $stderrPath=$dir.'/onceki_veritabani.stderr.tmp';
    @unlink($tmp);
    @unlink($old);
    @unlink($stderrPath);

    if($pdo instanceof PDO){
        assert_backup_disk_space($dir,database_size_bytes($pdo),'Veritabanı yedeği');
    }

    $defaultsFile=create_mysql_defaults_file($root,$db);
    $cmd=[
        $binary,
        '--defaults-extra-file='.$defaultsFile,
        '--single-transaction',
        '--quick',
        '--triggers',
        '--hex-blob',
        '--skip-lock-tables',
        $db['name'],
    ];

    $descriptors=[
        0=>['pipe','r'],
        1=>['file',$tmp,'wb'],
        2=>['file',$stderrPath,'wb'],
    ];
    $process=null;
    $exit=1;
    try{
        $process=@proc_open($cmd,$descriptors,$pipes,null,null,['bypass_shell'=>true]);
        if(!is_resource($process)){
            throw new RuntimeException('mysqldump işlemi başlatılamadı.');
        }
        if(isset($pipes[0])&&is_resource($pipes[0])) fclose($pipes[0]);
        $exit=proc_close($process);
        $process=null;
    }finally{
        if(is_resource($process)){
            @proc_terminate($process);
            @proc_close($process);
        }
        @unlink($defaultsFile);
    }
    $stderr=is_file($stderrPath)?(string)file_get_contents($stderrPath,false,null,0,8192):'';
    @unlink($stderrPath);

    $size=is_file($tmp)?(int)(filesize($tmp)?:0):0;
    $head='';
    if($size>0){
        $fh=@fopen($tmp,'rb');
        if(is_resource($fh)){
            $head=(string)fread($fh,16384);
            fclose($fh);
        }
    }
    $looksLikeDump=$size>512 && (
        stripos($head,'MySQL dump')!==false
        || stripos($head,'MariaDB dump')!==false
        || stripos($head,'CREATE TABLE')!==false
    );
    if($exit!==0 || !$looksLikeDump){
        @unlink($tmp);
        error_log('[IlkAdim][db-backup] mysqldump exit='.(string)$exit.' '.mb_substr(trim($stderr),0,1000));
        throw new RuntimeException('Migration öncesi veritabanı yedeği doğrulanamadı; güncelleme durduruldu.');
    }
    @chmod($tmp,0600);

    if(is_file($final)&&!@rename($final,$old)){
        @unlink($tmp);
        throw new RuntimeException('Mevcut veritabanı yedeği güvenli biçimde değiştirilemedi.');
    }
    if(!@rename($tmp,$final)){
        if(is_file($old)) @rename($old,$final);
        @unlink($tmp);
        throw new RuntimeException('Yeni veritabanı yedeği etkinleştirilemedi.');
    }
    @chmod($final,0600);
    @unlink($old);
    return basename($final);
}

function backup_artifact_metadata(string $root,string $filename): ?array {
    $filename=basename(trim($filename));
    if($filename==='') return null;
    $path=rtrim($root,'/\\').'/storage/backups/'.$filename;
    if(!is_file($path)) return null;
    $hash=hash_file('sha256',$path);
    if(!is_string($hash)||strlen($hash)!==64){
        throw new RuntimeException('Yedek bütünlük SHA-256 değeri üretilemedi: '.$filename);
    }
    return [
        'file'=>$filename,
        'bytes'=>(int)(filesize($path)?:0),
        'sha256'=>$hash,
    ];
}

function write_recovery_manifest(string $root,array $state): string {
    $dir=rtrim($root,'/\\').'/storage/backups';
    if(!is_dir($dir)&&!mkdir($dir,0750,true)&&!is_dir($dir)){
        throw new RuntimeException('Recovery manifest klasörü oluşturulamadı.');
    }
    $path=$dir.'/recovery.json';
    $tmp=$path.'.tmp';
    $payload=[
        'format'=>1,
        'updated_at'=>date(DATE_ATOM),
    ]+$state;
    $json=json_encode($payload,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES|JSON_PRETTY_PRINT);
    if(!is_string($json)) throw new RuntimeException('Recovery manifest oluşturulamadı.');
    @unlink($tmp);
    if(file_put_contents($tmp,$json."\n",LOCK_EX)===false){
        throw new RuntimeException('Recovery manifest yazılamadı.');
    }
    @chmod($tmp,0600);
    if(!@rename($tmp,$path)){
        @unlink($tmp);
        throw new RuntimeException('Recovery manifest etkinleştirilemedi.');
    }
    @chmod($path,0600);
    return basename($path);
}

function legacy_membership_repair_needed(PDO $pdo): bool {
    if(!auth_table_exists($pdo,'kurum_kullanicilari')) return false;
    $cols=auth_column_map($pdo,'kurum_kullanicilari');
    foreach(['veli_id','ogretmen_id','ogrenci_id','yonetici_id'] as $column){
        if(isset($cols[$column])) return true;
    }
    return false;
}

function pending_migration_names(PDO $pdo,string $root,string $localVersion='0.0.0'): array {
    assert_historical_migration_history($pdo,$root,$localVersion);
    $retired=retired_automatic_migrations();
    $files=glob($root.'/database/migrations/*.sql')?:[];
    sort($files,SORT_NATURAL);
    $check=$pdo->prepare('SELECT 1 FROM sistem_migrations WHERE migration=? LIMIT 1');
    $pending=[];
    foreach($files as $file){
        $name=basename($file,'.sql');
        if(isset($retired[$name])) continue;
        $check->execute([$name]);
        $exists=(bool)$check->fetchColumn();
        $check->closeCursor();
        if(!$exists) $pending[]=$name;
    }
    return $pending;
}

function database_update_requires_backup(PDO $pdo,string $root,string $localVersion='0.0.0'): bool {
    if(!auth_table_exists($pdo,'ogrenciler')) return true;
    if(legacy_membership_repair_needed($pdo)) return true;
    return pending_migration_names($pdo,$root,$localVersion)!==[];
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

function migration_sequence_number(string $name): int {
    return preg_match('/^(\d{3})_/', $name, $m)===1 ? (int)$m[1] : 0;
}

function migration_sql_without_comments(string $raw): string {
    $sql=preg_replace('/\/\*.*?\*\//s',' ',$raw) ?? $raw;
    $sql=preg_replace('/^\s*--.*$/m',' ',$sql) ?? $sql;
    return str_replace(chr(96),'',$sql);
}

function assert_automatic_migration_safe(string $name,string $path): void {
    $raw=file_get_contents($path);
    if(!is_string($raw)) throw new RuntimeException('Migration okunamadı: '.$name);

    $sql=migration_sql_without_comments($raw);
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

    // 065 ve sonrası için daha sıkı sözleşme: şema daraltan/dönüştüren ALTER
    // otomatik zincirde çalışmaz. 065, kurum kapsamlı ilişki şemasını güvenli
    // biçimde tamamlamak için yalnızca açık marker ile iki dar kapsamlı ALTER
    // ailesine izin verir; bunun dışındaki DROP/MODIFY/CHANGE/RENAME yine fail-closed.
    if(migration_sequence_number($name)>=65){
        $allowTenantSchemaAlter=str_contains($raw,'ILKADIM_ALLOW_SAFE_TENANT_SCHEMA_ALTER');
        if($allowTenantSchemaAlter){
            $schemaScan=$sql;
            foreach([
                '/\\bALTER\\s+TABLE\\s+(?:veli_ogrenci|ogretmen_ogrenci)\\s+DROP\\s+PRIMARY\\s+KEY\\s*,\\s*ADD\\s+PRIMARY\\s+KEY\\s*\\([^;]*\\bkurum_id\\b[^;]*\\)/i',
                '/\\bALTER\\s+TABLE\\s+(?:veli_ogrenci|ogretmen_ogrenci)\\s+MODIFY\\s+COLUMN\\s+kurum_id\\b[^;]*\\bNOT\\s+NULL\\b[^;]*\\bDEFAULT\\s+0\\b/i',
            ] as $allowedPattern){
                $schemaScan=preg_replace($allowedPattern,' ',$schemaScan)??$schemaScan;
            }

            if(preg_match('/\\bRENAME\\s+TABLE\\b/i',$schemaScan)===1
                || preg_match('/\\bALTER\\s+TABLE\\b[^;]*\\b(?:DROP|MODIFY|CHANGE|RENAME)\\b/is',$schemaScan)===1){
                throw new RuntimeException(
                    'Migration '.$name.' otomatik güncellemede izin verilmeyen şema dönüşümü içeriyor.'
                );
            }
        }elseif(preg_match('/\\bRENAME\\s+TABLE\\b/i',$sql)===1
            || preg_match('/\\bALTER\\s+TABLE\\b[^;]*\\b(?:DROP|MODIFY|CHANGE|RENAME)\\b/is',$sql)===1){
            throw new RuntimeException(
                'Migration '.$name.' otomatik güncellemede şema daraltma/dönüştürme içeriyor.'
            );
        }

        $hasDelete=preg_match('/\\bDELETE\\s+(?:[A-Za-z0-9_]+\\s+FROM|FROM)\\b/i',$sql)===1;
        if($hasDelete){
            $allowDelete=str_contains($raw,'ILKADIM_ALLOW_TRANSACTIONAL_DELETE');
            $hasDdl=preg_match('/\\b(?:CREATE|ALTER|DROP|TRUNCATE|RENAME)\\s+TABLE\\b/i',$sql)===1;
            if(!$allowDelete || $hasDdl){
                throw new RuntimeException(
                    'Migration '.$name.' veri silme içeriyor; transaction marker ve DDL ayrımı gerekli.'
                );
            }
        }
    }
}

function migration_should_run_transactionally(string $name,string $path): bool {
    if(migration_sequence_number($name)<65) return false;
    $raw=file_get_contents($path);
    if(!is_string($raw)) return false;
    $sql=migration_sql_without_comments($raw);
    if(preg_match('/\b(?:CREATE|ALTER|DROP|TRUNCATE|RENAME)\s+TABLE\b/i',$sql)===1) return false;
    return preg_match('/\b(?:INSERT|UPDATE|DELETE)\b/i',$sql)===1;
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

    // Şema onarımı kullanıcı kimliği, e-posta veya parola üretmez/değiştirmez.
    // Test/demo hesapları updater sorumluluğu değildir.

}

function legacy_membership_profile_user_id(PDO $pdo,string $table,int $profileId): int {
    if($profileId<=0 || !auth_table_exists($pdo,$table)) return 0;
    $cols=auth_column_map($pdo,$table);
    if(!isset($cols['id'],$cols['kullanici_id'])) return 0;
    $stmt=$pdo->prepare("SELECT kullanici_id FROM `".$table."` WHERE id=? LIMIT 1");
    $stmt->execute([$profileId]);
    $userId=(int)($stmt->fetchColumn()?:0);
    $stmt->closeCursor();
    return $userId;
}

function legacy_membership_manager_user_id(PDO $pdo,int $legacyId): int {
    if($legacyId<=0) return 0;
    if(auth_table_exists($pdo,'yoneticiler')){
        $cols=auth_column_map($pdo,'yoneticiler');
        if(isset($cols['id'],$cols['kullanici_id'])){
            $stmt=$pdo->prepare('SELECT kullanici_id FROM yoneticiler WHERE id=? LIMIT 1');
            $stmt->execute([$legacyId]);
            $mapped=(int)($stmt->fetchColumn()?:0);
            $stmt->closeCursor();
            if($mapped>0) return $mapped;
        }
    }
    $stmt=$pdo->prepare("SELECT k.id
      FROM kullanicilar k
      LEFT JOIN kullanici_rolleri r ON r.kullanici_id=k.id
      WHERE k.id=? AND (
        k.ana_rol IN ('yonetici','super_admin')
        OR r.rol IN ('yonetici','super_admin')
      )
      LIMIT 1");
    $stmt->execute([$legacyId]);
    $mapped=(int)($stmt->fetchColumn()?:0);
    $stmt->closeCursor();
    return $mapped;
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
    if(!isset($cols['kurum_id'])){
        throw new RuntimeException('Eski kurum üyeliği tablosunda kurum_id yok; otomatik dönüşüm güvenli değil.');
    }
    if(!auth_table_exists($pdo,'kurumlar') || !auth_table_exists($pdo,'kullanicilar')){
        throw new RuntimeException('Eski kurum üyeliği dönüşümü için temel tablolar eksik.');
    }

    $inbound=(int)($pdo->query("SELECT COUNT(*) FROM information_schema.KEY_COLUMN_USAGE
      WHERE TABLE_SCHEMA=DATABASE()
        AND REFERENCED_TABLE_NAME='kurum_kullanicilari'
        AND TABLE_NAME<>'kurum_kullanicilari'")->fetchColumn()?:0);
    if($inbound>0){
        throw new RuntimeException('Eski kurum üyeliği tablosuna bağlı yabancı anahtarlar var; otomatik dönüşüm durduruldu.');
    }

    $backupTable='kurum_kullanicilari_legacy_197_backup';
    $stageTable='kurum_kullanicilari_v4_bridge';
    if(auth_table_exists($pdo,$backupTable)){
        throw new RuntimeException('Legacy kurum üyeliği yedek tablosu zaten var; tekrar dönüşüm güvenli değil.');
    }
    if(auth_table_exists($pdo,$stageTable)){
        $pdo->exec('DROP TABLE kurum_kullanicilari_v4_bridge');
    }

    $rows=$pdo->query('SELECT * FROM kurum_kullanicilari')->fetchAll(PDO::FETCH_ASSOC)?:[];
    $institutionCheck=$pdo->prepare('SELECT 1 FROM kurumlar WHERE id=? LIMIT 1');
    $userCheck=$pdo->prepare('SELECT 1 FROM kullanicilar WHERE id=? LIMIT 1');
    $members=[];

    foreach($rows as $index=>$row){
        $kurumId=(int)($row['kurum_id']??0);
        if($kurumId<=0){
            throw new RuntimeException('Legacy kurum üyeliği satırında geçersiz kurum_id var.');
        }
        $institutionCheck->execute([$kurumId]);
        $institutionExists=(bool)$institutionCheck->fetchColumn();
        $institutionCheck->closeCursor();
        if(!$institutionExists){
            throw new RuntimeException('Legacy kurum üyeliği mevcut olmayan kuruma bağlı: '.$kurumId);
        }

        $aktif=array_key_exists('aktif',$row)?((int)$row['aktif']===1?1:0):1;
        $created=trim((string)($row['olusturulma_tarihi']??''));
        if($created==='' || strtotime($created)===false) $created='';

        $resolvedForRow=0;
        $candidates=[];
        if(isset($cols['kullanici_id']) && (int)($row['kullanici_id']??0)>0){
            $role=trim((string)($row['kurum_rolu']??''));
            if(in_array($role,['yonetici','ogretmen','veli','ogrenci'],true)){
                $candidates[]=[$role,(int)$row['kullanici_id']];
            }
        }
        if(isset($cols['veli_id']) && (int)($row['veli_id']??0)>0){
            $candidates[]=['veli',legacy_membership_profile_user_id($pdo,'veliler',(int)$row['veli_id'])];
        }
        if(isset($cols['ogretmen_id']) && (int)($row['ogretmen_id']??0)>0){
            $candidates[]=['ogretmen',legacy_membership_profile_user_id($pdo,'ogretmenler',(int)$row['ogretmen_id'])];
        }
        if(isset($cols['ogrenci_id']) && (int)($row['ogrenci_id']??0)>0){
            $candidates[]=['ogrenci',legacy_membership_profile_user_id($pdo,'ogrenciler',(int)$row['ogrenci_id'])];
        }
        if(isset($cols['yonetici_id']) && (int)($row['yonetici_id']??0)>0){
            $candidates[]=['yonetici',legacy_membership_manager_user_id($pdo,(int)$row['yonetici_id'])];
        }

        foreach($candidates as [$role,$userId]){
            $userId=(int)$userId;
            if($userId<=0){
                throw new RuntimeException('Legacy kurum üyeliği kullanıcı eşlemesi çözülemedi; satır '.((int)$index+1).' / rol '.$role.'.');
            }
            $userCheck->execute([$userId]);
            $userExists=(bool)$userCheck->fetchColumn();
            $userCheck->closeCursor();
            if(!$userExists){
                throw new RuntimeException('Legacy kurum üyeliği kullanıcı kaydı bulunamadı: '.$userId);
            }
            $key=$kurumId.':'.$userId.':'.$role;
            if(!isset($members[$key])){
                $members[$key]=[
                    'kurum_id'=>$kurumId,'kullanici_id'=>$userId,'kurum_rolu'=>$role,
                    'aktif'=>$aktif,'created'=>$created,
                ];
            }elseif($aktif===1){
                $members[$key]['aktif']=1;
            }
            $resolvedForRow++;
        }
        if($resolvedForRow===0){
            throw new RuntimeException('Legacy kurum üyeliği satırı hiçbir kullanıcıya eşlenemedi; satır '.((int)$index+1).'.');
        }
    }
    $institutionCheck->closeCursor();
    $userCheck->closeCursor();

    $typeStmt=$pdo->prepare("SELECT COLUMN_TYPE FROM information_schema.columns
      WHERE table_schema=DATABASE() AND table_name=? AND column_name='id' LIMIT 1");
    $typeStmt->execute(['kurumlar']);
    $kurumType=(string)($typeStmt->fetchColumn()?:'BIGINT UNSIGNED');
    $typeStmt->closeCursor();
    $typeStmt->execute(['kullanicilar']);
    $kullaniciType=(string)($typeStmt->fetchColumn()?:'BIGINT UNSIGNED');
    $typeStmt->closeCursor();
    foreach([$kurumType,$kullaniciType] as $columnType){
        if(!preg_match('/^[a-zA-Z0-9(), ]+$/',$columnType)){
            throw new RuntimeException('Kurum üyeliği dönüşümü için geçersiz kolon tipi algılandı.');
        }
    }

    $pdo->exec("CREATE TABLE {$stageTable} (
        kurum_id {$kurumType} NOT NULL,
        kullanici_id {$kullaniciType} NOT NULL,
        kurum_rolu VARCHAR(30) NOT NULL,
        aktif TINYINT(1) NOT NULL DEFAULT 1,
        olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
        PRIMARY KEY (kurum_id,kullanici_id,kurum_rolu),
        KEY ix_kurum_kullanici_user (kullanici_id,aktif),
        KEY ix_kurum_kullanici_role (kurum_id,kurum_rolu,aktif),
        CONSTRAINT fk_kk_bridge_kurum FOREIGN KEY (kurum_id) REFERENCES kurumlar(id) ON DELETE CASCADE,
        CONSTRAINT fk_kk_bridge_user FOREIGN KEY (kullanici_id) REFERENCES kullanicilar(id) ON DELETE CASCADE
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci");

    try{
        $insertDefault=$pdo->prepare("INSERT INTO {$stageTable}
          (kurum_id,kullanici_id,kurum_rolu,aktif) VALUES (?,?,?,?)");
        $insertCreated=$pdo->prepare("INSERT INTO {$stageTable}
          (kurum_id,kullanici_id,kurum_rolu,aktif,olusturulma_tarihi) VALUES (?,?,?,?,?)");
        foreach($members as $member){
            if($member['created']!==''){
                $insertCreated->execute([$member['kurum_id'],$member['kullanici_id'],$member['kurum_rolu'],$member['aktif'],$member['created']]);
            }else{
                $insertDefault->execute([$member['kurum_id'],$member['kullanici_id'],$member['kurum_rolu'],$member['aktif']]);
            }
        }
        $insertDefault->closeCursor();
        $insertCreated->closeCursor();

        $stageCount=(int)($pdo->query("SELECT COUNT(*) FROM {$stageTable}")->fetchColumn()?:0);
        if($stageCount!==count($members)){
            throw new RuntimeException('Legacy kurum üyeliği staging doğrulaması başarısız.');
        }

        $pdo->exec("RENAME TABLE kurum_kullanicilari TO {$backupTable}, {$stageTable} TO kurum_kullanicilari");
        $newCols=auth_column_map($pdo,'kurum_kullanicilari');
        foreach($legacyColumns as $column){
            if(isset($newCols[$column])){
                throw new RuntimeException('Legacy kurum üyeliği kolonları dönüşüm sonrası kaldı.');
            }
        }
        $liveCount=(int)($pdo->query('SELECT COUNT(*) FROM kurum_kullanicilari')->fetchColumn()?:0);
        if($liveCount!==count($members)){
            throw new RuntimeException('Legacy kurum üyeliği canlı tablo doğrulaması başarısız.');
        }
    }catch(Throwable $e){
        if(auth_table_exists($pdo,$stageTable)){
            try{$pdo->exec('DROP TABLE kurum_kullanicilari_v4_bridge');}catch(Throwable){}
        }
        throw $e;
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

function recover_missing_064_checkpoint_after_1_1_98_bridge(PDO $pdo,string $root,string $localVersion): array {
    // 1.1.97 -> 1.2.1 legacy recovery'de de yalnız 064 checkpointi,
    // 001-063 geçmişi eksiksizse idempotent biçimde onarılabilir.
    if(!in_array($localVersion,['1.1.97','1.1.98'],true)) return [];

    $name='064_adimbot_rate_limit_ve_migration_checkpoint';
    $check=$pdo->prepare('SELECT 1 FROM sistem_migrations WHERE migration=? LIMIT 1');
    $check->execute([$name]);
    $already=(bool)$check->fetchColumn();
    $check->closeCursor();

    // Migration kaydı var ama 064'ün gerçek tabloyu içermediği bozuk bir
    // legacy durumda yalnız kayıt var diye recovery'yi atlama. Tablo eksikse
    // CREATE TABLE IF NOT EXISTS ile veri silmeden idempotent şema onarımı yap.
    // Tablo zaten varsa mevcut migration kaydına dokunma.
    if($already){
        if(auth_table_exists($pdo,'adimbot_rate_limitleri')) return [];

        $pdo->exec("CREATE TABLE IF NOT EXISTS adimbot_rate_limitleri (
            kanal VARCHAR(16) NOT NULL,
            kapsam VARCHAR(16) NOT NULL,
            kapsam_hash CHAR(64) NOT NULL,
            deneme_sayisi SMALLINT UNSIGNED NOT NULL DEFAULT 0,
            pencere_baslangici DATETIME NOT NULL,
            engel_bitis DATETIME NULL,
            son_deneme DATETIME NOT NULL,
            PRIMARY KEY (kanal,kapsam,kapsam_hash),
            KEY ix_adimbot_rate_engel (engel_bitis),
            KEY ix_adimbot_rate_son (son_deneme)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");

        if(!auth_table_exists($pdo,'adimbot_rate_limitleri')){
            throw new RuntimeException('064 migration kaydı mevcut ancak adimbot_rate_limitleri tablosu güvenli biçimde yeniden oluşturulamadı.');
        }
        return [];
    }

    // Yalnız 064 eksikse onar. 064 öncesindeki bütün non-retired geçmiş
    // eksiksiz değilse hiçbir değişiklik yapmadan dur.
    $retired=retired_automatic_migrations();
    $expected=[];
    foreach(glob(rtrim($root,'/\\').'/database/migrations/*.sql')?:[] as $file){
        $migration=basename($file,'.sql');
        $number=migration_sequence_number($migration);
        if($number<1 || $number>63 || isset($retired[$migration])) continue;
        $expected[$migration]=true;
    }

    $history=[];
    foreach($pdo->query('SELECT migration FROM sistem_migrations')?:[] as $row){
        if(isset($row['migration'])) $history[(string)$row['migration']]=true;
    }

    $missing=[];
    foreach(array_keys($expected) as $migration){
        if(!isset($history[$migration])) $missing[]=$migration;
    }
    if($missing!==[]){
        sort($missing,SORT_NATURAL);
        throw new RuntimeException(
            '064 checkpoint recovery durduruldu. Önceki migration geçmişinde eksik kayıt var: '
            .implode(', ',array_slice($missing,0,8))
            .(count($missing)>8?' ...':'')
        );
    }

    // 064'ün gerçek şema etkisi idempotent biçimde uygulanır. Eski migration
    // SQL'i tekrar oynatılmaz ve mevcut kullanıcı/kurum verisine dokunulmaz.
    $pdo->exec("CREATE TABLE IF NOT EXISTS adimbot_rate_limitleri (
        kanal VARCHAR(16) NOT NULL,
        kapsam VARCHAR(16) NOT NULL,
        kapsam_hash CHAR(64) NOT NULL,
        deneme_sayisi SMALLINT UNSIGNED NOT NULL DEFAULT 0,
        pencere_baslangici DATETIME NOT NULL,
        engel_bitis DATETIME NULL,
        son_deneme DATETIME NOT NULL,
        PRIMARY KEY (kanal,kapsam,kapsam_hash),
        KEY ix_adimbot_rate_engel (engel_bitis),
        KEY ix_adimbot_rate_son (son_deneme)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci");

    $insert=$pdo->prepare('INSERT IGNORE INTO sistem_migrations (migration) VALUES (?)');
    $insert->execute([$name]);
    $insert->closeCursor();

    return [$name];
}

function assert_historical_migration_history(PDO $pdo,string $root,string $localVersion): void {
    if(version_compare($localVersion,'1.1.98','<')) return;

    $retired=retired_automatic_migrations();
    $expected=[];
    foreach(glob($root.'/database/migrations/*.sql')?:[] as $file){
        $name=basename($file,'.sql');
        $number=migration_sequence_number($name);
        if($number<1 || $number>64 || isset($retired[$name])) continue;
        $expected[$name]=true;
    }
    if($expected===[]) return;

    $applied=[];
    foreach($pdo->query('SELECT migration FROM sistem_migrations')?:[] as $row){
        if(isset($row['migration'])) $applied[(string)$row['migration']]=true;
    }

    $missing=[];
    foreach(array_keys($expected) as $name){
        if(!isset($applied[$name])) $missing[]=$name;
    }
    if($missing!==[]){
        sort($missing,SORT_NATURAL);

        // 1.1.98 bridge, eski 1.1.97 kilidini aşarken migration SQL'lerini
        // bilinçli olarak paket dışı bırakmıştı. Bu nedenle yalnız 064
        // checkpointinin eksik olması recovery için geçerli tek istisnadır.
        // pending_migration_names bu kaydı "pending" görsün; böylece önce
        // doğrulanmış DB yedeği alınır, ardından run_pending_migrations içindeki
        // dar kapsamlı recovery 064'ü uygular. Başka tek bir eksik kayıt bile
        // varsa yine fail-closed davranılır.
        if($localVersion==='1.1.98'
            && $missing===['064_adimbot_rate_limit_ve_migration_checkpoint']){
            return;
        }

        throw new RuntimeException(
            'Migration geçmişi eksik veya tutarsız. Eski migrationlar tekrar çalıştırılmadı. Eksik: '
            .implode(', ',array_slice($missing,0,8))
            .(count($missing)>8?' ...':'')
        );
    }
}

function validate_tenant_relation_schema_guard(PDO $pdo,string $migrationRoot): void {
    $name='066_kurum_eslestirme_schema_guard';
    $file=rtrim($migrationRoot,'/\\').'/database/migrations/'.$name.'.sql';
    if(!is_file($file) || is_link($file)){
        throw new RuntimeException('Tenant şema doğrulama migration dosyası bulunamadı: '.$name);
    }
    assert_automatic_migration_safe($name,$file);
    run_migration_sql($pdo,$file);
}

function run_legacy_1_1_97_to_1_2_1_recovery(PDO $pdo,string $migrationRoot,string $localVersion): array {
    if($localVersion!=='1.1.97') return [];

    // Önce mevcut 1.1.97 tarihsel geçmişini doğrula ve yalnız eksik 064 checkpointini
    // idempotent biçimde tamamla. 001-063 hiçbir koşulda tekrar oynatılmaz.
    $applied=recover_missing_064_checkpoint_after_1_1_98_bridge($pdo,$migrationRoot,$localVersion);

    // 065'in beklediği yeni kurum üyeliği şemasını önce güvenli staging/rename
    // mekanizmasıyla hazırla. Bu adım başarısızsa tenant migrationlarına geçilmez.
    repair_legacy_institution_membership_schema($pdo);

    $targetMigrations=[
        '065_kurum_bazli_eslestirme_izolasyonu',
        '066_kurum_eslestirme_schema_guard',
    ];
    $check=$pdo->prepare('SELECT 1 FROM sistem_migrations WHERE migration=? LIMIT 1');
    $insert=$pdo->prepare('INSERT INTO sistem_migrations (migration) VALUES (?)');

    foreach($targetMigrations as $name){
        $check->execute([$name]);
        $already=(bool)$check->fetchColumn();
        $check->closeCursor();
        if($already) continue;

        $file=rtrim($migrationRoot,'/\\').'/database/migrations/'.$name.'.sql';
        if(!is_file($file) || is_link($file)){
            throw new RuntimeException('Legacy recovery migration dosyası bulunamadı: '.$name);
        }

        assert_automatic_migration_safe($name,$file);
        run_migration_sql($pdo,$file);
        $insert->execute([$name]);
        $insert->closeCursor();
        $applied[]=$name;
    }

    // Migration checkpoint'i mevcut olsa bile gerçek tenant şeması bozulmuş olabilir.
    // 066 veri değiştirmeyen guard'ı recovery sonunda yeniden çalıştırarak gerçek
    // postcondition'ı zorunlu kıl. Böylece bozuk checkpoint sessizce geçilemez.
    validate_tenant_relation_schema_guard($pdo,$migrationRoot);

    // 066 kaydı varsa 065'in de kaydı bulunmalıdır; ters tarihçe kabul edilmez.
    $check->execute(['065_kurum_bazli_eslestirme_izolasyonu']);
    $has065=(bool)$check->fetchColumn();
    $check->closeCursor();
    $check->execute(['066_kurum_eslestirme_schema_guard']);
    $has066=(bool)$check->fetchColumn();
    $check->closeCursor();
    if($has066 && !$has065){
        throw new RuntimeException('Legacy recovery migration geçmişi tutarsız: 066 var, 065 yok.');
    }

    return $applied;
}

function run_pending_migrations(PDO $pdo,string $root,string $localVersion='0.0.0'): array {
    $applied=recover_missing_064_checkpoint_after_1_1_98_bridge($pdo,$root,$localVersion);
    assert_historical_migration_history($pdo,$root,$localVersion);
    repair_legacy_institution_membership_schema($pdo);
    $retired=retired_automatic_migrations();
    $files=glob($root.'/database/migrations/*.sql')?:[]; sort($files,SORT_NATURAL);
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
            $insert->execute([$name]);
        }else{
            assert_automatic_migration_safe($name,$file);
            if(migration_should_run_transactionally($name,$file)){
                $started=false;
                try{
                    if(!$pdo->inTransaction()){
                        $pdo->beginTransaction();
                        $started=true;
                    }
                    run_migration_sql($pdo,$file);
                    $insert->execute([$name]);
                    if($started)$pdo->commit();
                }catch(Throwable $e){
                    if($started && $pdo->inTransaction())$pdo->rollBack();
                    throw $e;
                }
            }else{
                run_migration_sql($pdo,$file);
                $insert->execute([$name]);
            }
        }
        $applied[]=$name;
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

function assert_update_zip_safe(ZipArchive $zip,array $updateConfig=[]): array {
    $limits=update_package_limits($updateConfig);
    $entries=(int)$zip->numFiles;
    if($entries<=0) throw new RuntimeException('Güncelleme paketi boş.');
    if($entries>$limits['max_entries']){
        throw new RuntimeException('Güncelleme paketi dosya sayısı güvenlik sınırını aşıyor.');
    }

    $totalBytes=0;
    for($i=0;$i<$entries;$i++){
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

        $stat=$zip->statIndex($i);
        if(!is_array($stat)) throw new RuntimeException('Güncelleme paketi dosya bilgisi okunamadı.');
        $size=max(0,(int)($stat['size']??0));
        $compressed=max(0,(int)($stat['comp_size']??0));
        if($size>$limits['max_file_bytes']){
            throw new RuntimeException('Güncelleme paketi tek dosya boyutu güvenlik sınırını aşıyor: '.$normalized);
        }
        $totalBytes+=$size;
        if($totalBytes>$limits['max_uncompressed_bytes']){
            throw new RuntimeException('Güncelleme paketi açılmış toplam boyutu güvenlik sınırını aşıyor.');
        }
        if($size>=1024*1024 && $compressed>0 && ($size/$compressed)>$limits['max_compression_ratio']){
            throw new RuntimeException('Güncelleme paketi olağandışı sıkıştırma oranı içeriyor: '.$normalized);
        }

        if(method_exists($zip,'getExternalAttributesIndex')){
            $opsys=0;$attributes=0;
            $unixOpsys=defined('ZipArchive::OPSYS_UNIX')?(int)constant('ZipArchive::OPSYS_UNIX'):3;
            if($zip->getExternalAttributesIndex($i,$opsys,$attributes) && $opsys===$unixOpsys){
                $mode=($attributes>>16)&0170000;
                if($mode===0120000){
                    throw new RuntimeException('Güncelleme ZIP paketi sembolik bağlantı içeriyor.');
                }
                if($mode!==0 && $mode!==0100000 && $mode!==0040000){
                    throw new RuntimeException('Güncelleme ZIP paketi desteklenmeyen dosya türü içeriyor.');
                }
            }
        }
    }

    return ['entries'=>$entries,'uncompressed_bytes'=>$totalBytes];
}

function install_github_update(
    string $root,
    array $gh,
    array $preserve,
    array $dbConfig=[],
    array $updateConfig=[]
): array {
    [$owner,$repo,$branch]=github_repo_info($gh);
    $localVersion=read_app_version();
    $localRevision=read_local_release_revision($root,$localVersion);
    $remote=next_remote_version_info($gh,$localVersion,$localRevision);
    if(!release_identity_is_newer($remote,$localVersion,$localRevision)){
        return [
            'updated'=>false,
            'message'=>'Zaten guncel surum kullaniliyor.',
            'remote'=>$remote,
            'local'=>$localVersion,
            'local_revision'=>$localRevision,
            'migrations'=>[],
        ];
    }

    $targetCommit=trim((string)($remote['commit']??''));
    if(!preg_match('/^[a-f0-9]{40}$/i',$targetCommit)){
        // Eski updater sürümlerinde branch adı (ör. "main") commit alanına
        // sızabiliyordu. Kurulumdan önce gerçek HEAD SHA'ya çözümle.
        $targetCommit=github_branch_head_sha($gh);
        $remote['commit']=$targetCommit;
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
    $packageLimits=update_package_limits($updateConfig);
    $recoveryState=null;
    $recoveryManifestName='';
    $databaseMutationStarted=false;
    $fileActivationStarted=false;
    $preservedNewerUpdaterCore=false;
    $updateStage='preparing';
    $log=$pdo->prepare("INSERT INTO guncelleme_gecmisi (onceki_surumu,yeni_surumu,github_commit,durum) VALUES (?,?,?,'basladi')");
    $log->execute([$localVersion,$remote['version'],$remote['commit']]); $logId=(int)$pdo->lastInsertId();

    try{
        $recoveryState=[
            'from_version'=>$localVersion,
            'from_revision'=>$localRevision,
            'to_version'=>(string)$remote['version'],
            'to_revision'=>normalize_release_revision($remote['release_revision']??0),
            'target_commit'=>$targetCommit,
            'status'=>'preparing',
            'stage'=>$updateStage,
            'application_backup'=>null,
            'database_backup'=>null,
            'database_mutation_started'=>false,
            'pending_migrations'=>[],
            'legacy_membership_repair'=>false,
            'student_schema_missing'=>false,
            'preserved_newer_updater_core'=>false,
            'manual_restore_only'=>true,
        ];
        $recoveryManifestName=write_recovery_manifest($root,$recoveryState);

        $updateStage='application_backup';
        $existingHandoff=read_updater_core_handoff_marker($root,$targetCommit,(string)$remote['version']);
        $backupName=$existingHandoff!==null
            ? basename((string)$existingHandoff['application_backup'])
            : create_single_previous_backup($root);
        $recoveryState['status']='application_backup_ready';
        $recoveryState['stage']=$updateStage;
        $recoveryState['application_backup']=backup_artifact_metadata($root,$backupName);
        $recoveryManifestName=write_recovery_manifest($root,$recoveryState);
        // En son main paketini degil, siradaki surumun sabit commit paketini indir.
        $downloadUrl='https://codeload.github.com/'.rawurlencode($owner).'/'.rawurlencode($repo).'/zip/'.rawurlencode($targetCommit).'?cb='.(string)round(microtime(true)*1000);
        $updateStage='download';
        $recoveryState['stage']=$updateStage;
        $recoveryManifestName=write_recovery_manifest($root,$recoveryState);
        updater_http($downloadUrl,$gh,$zipPath,$packageLimits['max_download_bytes']);

        if(!class_exists('ZipArchive')) throw new RuntimeException('PHP ZipArchive eklentisi gerekli.');
        $zip=new ZipArchive();
        if($zip->open($zipPath)!==true) throw new RuntimeException('GitHub ZIP paketi acilamadi.');
        $updateStage='package_validation';
        $recoveryState['stage']=$updateStage;
        $recoveryManifestName=write_recovery_manifest($root,$recoveryState);
        $zipStats=assert_update_zip_safe($zip,$updateConfig);
        assert_backup_disk_space(dirname($extractDir),(int)$zipStats['uncompressed_bytes'],'Güncelleme paketi açılımı');
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
            'update-release.json',
            'update-managed-files.json',
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

        $releaseData=json_decode((string)file_get_contents($sourceRoot.'/update-release.json'),true);
        $manifestData=json_decode((string)file_get_contents($sourceRoot.'/update-managed-files.json'),true);
        $releaseVersion=is_array($releaseData)?trim((string)($releaseData['version']??'')):'';
        $manifestVersion=is_array($manifestData)?trim((string)($manifestData['version']??'')):'';
        $packageRevision=is_array($packageVersionData)?normalize_release_revision($packageVersionData['release_revision']??0):0;
        $releaseRevision=is_array($releaseData)?normalize_release_revision($releaseData['release_revision']??0):0;
        $manifestRevision=is_array($manifestData)?normalize_release_revision($manifestData['release_revision']??0):0;
        $expectedRevision=normalize_release_revision($remote['release_revision']??0);
        if($releaseVersion!==$packageVersion || $manifestVersion!==$packageVersion){
            throw new RuntimeException(
                'Güncelleme paketi sürüm metadata dosyaları birbiriyle eşleşmiyor.'
            );
        }
        if(version_compare($packageVersion,'1.1.105','>=') && (
            $packageRevision<1
            || $releaseRevision!==$packageRevision
            || $manifestRevision!==$packageRevision
            || $expectedRevision!==$packageRevision
        )){
            throw new RuntimeException(
                'Güncelleme paketi release revision metadata değerleri birbiriyle eşleşmiyor.'
            );
        }
        if(!is_array($manifestData['files']??null)){
            throw new RuntimeException('Güncelleme paketi yönetilen dosya manifesti geçersiz.');
        }

        // Daha yeni bir updater çekirdeği daha eski tarihsel paket kurulurken geriye düşürülmez.
        // Bu, recovery/bridge kurulumlarının güvenli çekirdeği kaybetmeden sıralı devam etmesini sağlar.
        $preservedNewerUpdaterCore=preserve_newer_live_updater_in_staging($root,$sourceRoot);
        $recoveryState['preserved_newer_updater_core']=$preservedNewerUpdaterCore;

        // Yalnız updater'ın daha önce yönettiği dosyalar stale cleanup adayıdır.
        // İlk manifest yoksa hiçbir canlı dosya silinmez; sadece yeni baseline kaydedilir.
        $oldManagedFiles=read_managed_update_manifest($root);
        $oldManagedHashes=read_managed_update_hashes($root);
        $newManagedFiles=collect_managed_update_files($sourceRoot,$preserve);
        assert_packaged_manifest_matches_tree($manifestData,$newManagedFiles);
        $stalePreflight=assert_stale_managed_files_safe(
            $root,$oldManagedFiles,$newManagedFiles,$preserve,$oldManagedHashes
        );
        $recoveryState['stale_file_preflight']=$stalePreflight;
        $recoveryManifestName=write_recovery_manifest($root,$recoveryState);

        // DB/migration aşamasından önce updater çekirdeğini güvenli biçimde el değiştir.
        // Bu PHP isteği bellekte eski kodla devam ettiği için burada temiz biçimde biter;
        // sonraki HTTP isteği yeni src/updater.php çekirdeğiyle aynı paketi sürdürür.
        $coreHandoff=prepare_updater_core_handoff(
            $root,$sourceRoot,$packageVersion,$targetCommit,$backupName
        );
        if($coreHandoff!==null){
            $updateStage='updater_core_handoff';
            $recoveryState['status']='retry_required';
            $recoveryState['stage']=$updateStage;
            $recoveryState['updater_core_handoff']=$coreHandoff;
            try{
                $recoveryManifestName=write_recovery_manifest($root,$recoveryState);
            }catch(Throwable $handoffRecoveryError){
                error_log('[IlkAdim][updater-core-handoff-recovery] '.$handoffRecoveryError->getMessage());
                $recoveryManifestName='';
            }
            $handoffMessage='Updater çekirdeği güvenli biçimde yenilendi; kurulum yeni çekirdekle yeniden başlatılacak.';
            try{
                $pdo->prepare("UPDATE guncelleme_gecmisi SET durum='yeniden_dene',mesaj=?,bitis_tarihi=NOW() WHERE id=?")
                    ->execute([$handoffMessage,$logId]);
            }catch(Throwable $handoffHistoryError){
                error_log('[IlkAdim][updater-core-handoff-history] '.$handoffHistoryError->getMessage());
            }
            @unlink($zipPath);
            delete_tree($extractDir);
            flock($updateLock,LOCK_UN);
            fclose($updateLock);
            return [
                'updated'=>false,
                'retry_required'=>true,
                'core_handoff'=>true,
                'message'=>$handoffMessage,
                'remote'=>$remote,
                'local'=>$localVersion,
                'local_revision'=>$localRevision,
                'backup'=>$backupName,
                'updater_backup'=>(string)($coreHandoff['updater_backup']??''),
                'recovery_manifest'=>$recoveryManifestName,
                'migrations'=>[],
            ];
        }

        assert_managed_copy_type_safe($root,$sourceRoot,$newManagedFiles,$oldManagedFiles,$preserve);
        $activationPreflight=assert_update_activation_preflight(
            $root,$sourceRoot,$newManagedFiles,$oldManagedFiles,$preserve
        );
        $recoveryState['activation_preflight']=$activationPreflight;
        $recoveryManifestName=write_recovery_manifest($root,$recoveryState);

        // 1.2.1 temiz recovery yalnız uygulama kodu/updater çekirdeğini yeniler.
        // 1.2.1 temiz recovery davranışı korunur; ancak 1.1.97'den gelen
        // kurulumlar için kod ağacını güncellemek tek başına yeterli değildir.
        // Bu özel legacy hattı yalnız doğrulanmış 001-063 geçmişi + 064 checkpoint
        // + legacy kurum üyeliği dönüşümü + 065 + 066 sırasını uygular.
        $isLegacy097Recovery=((string)($localVersion)==='1.1.97'
            && version_compare((string)($remote['version']??''),'1.2.1','>='));
        $isClean121Recovery=!$isLegacy097Recovery && ((string)($remote['version']??''))==='1.2.1';
        $preflightRecoveredMigrations=[];
        $pendingMigrations=[];
        $legacyRepairNeeded=false;
        $studentSchemaMissing=false;
        $requiresDbBackup=$isLegacy097Recovery;
        $dbBackupName='';
        $migrations=[];

        $updateStage=$isLegacy097Recovery?'database_recovery_preflight':'database_recovery_skip';
        $recoveryState['stage']=$updateStage;
        $recoveryState['pending_migrations']=[];
        $recoveryState['legacy_membership_repair']=$isLegacy097Recovery;
        $recoveryState['student_schema_missing']=false;
        $recoveryState['database_backup']=null;
        $recoveryState['legacy_097_recovery']=$isLegacy097Recovery;
        $recoveryState['status']='ready_before_mutation';
        $recoveryManifestName=write_recovery_manifest($root,$recoveryState);

        if($isLegacy097Recovery){
            $updateStage='database_backup';
            $recoveryState['stage']=$updateStage;
            $recoveryManifestName=write_recovery_manifest($root,$recoveryState);
            $dbBackupName=create_database_backup($root,$dbConfig,$updateConfig,$pdo);
            $recoveryState['database_backup']=backup_artifact_metadata($root,$dbBackupName);
            $recoveryState['status']='database_backup_ready';
            $recoveryManifestName=write_recovery_manifest($root,$recoveryState);

            $updateStage='legacy_database_recovery';
            $recoveryState['stage']=$updateStage;
            $recoveryState['database_mutation_started']=true;
            $recoveryManifestName=write_recovery_manifest($root,$recoveryState);
            $databaseMutationStarted=true;
            $migrations=run_legacy_1_1_97_to_1_2_1_recovery($pdo,$sourceRoot,$localVersion);
            $recoveryState['pending_migrations']=$migrations;
            $recoveryState['status']='database_recovery_complete';
            $recoveryManifestName=write_recovery_manifest($root,$recoveryState);
        }

        // Şema başarıyla hazırlandıktan sonra yeni uygulama dosyalarını etkinleştir.
        $updateStage='file_activation';
        $recoveryState['stage']=$updateStage;
        $recoveryManifestName=write_recovery_manifest($root,$recoveryState);
        $fileActivationStarted=true;
        copy_update_tree($sourceRoot,$root,$preserve);
        $activationVerification=verify_activated_update_files(
            $sourceRoot,$root,$newManagedFiles,$preserve
        );
        $recoveryState['activation_verification']=$activationVerification;
        $recoveryManifestName=write_recovery_manifest($root,$recoveryState);
        $removedManagedFiles=remove_stale_managed_files(
            $root,$oldManagedFiles,$newManagedFiles,$preserve,$oldManagedHashes
        );
        write_managed_update_manifest($root,$newManagedFiles,(string)$remote['version'],normalize_release_revision($remote['release_revision']??0));

        $pdo->prepare("INSERT INTO sistem_ayarlar (ayar_anahtari,ayar_degeri) VALUES ('uygulama_surumu',?) ON DUPLICATE KEY UPDATE ayar_degeri=VALUES(ayar_degeri)")->execute([$remote['version']]);
        $historyMessage='Guncelleme tamamlandi. Surum: '.(string)$remote['version'].' rev '.normalize_release_revision($remote['release_revision']??0).'; Yedek: '.$backupName;
        if($dbBackupName!=='') $historyMessage.='; DB yedek: '.$dbBackupName;
        if($removedManagedFiles!==[]) $historyMessage.='; temizlenen eski dosya: '.count($removedManagedFiles);
        if($preservedNewerUpdaterCore) $historyMessage.='; daha yeni updater çekirdeği korundu';
        $pdo->prepare("UPDATE guncelleme_gecmisi SET durum='basarili',mesaj=?,bitis_tarihi=NOW() WHERE id=?")->execute([$historyMessage,$logId]);
        clear_updater_core_handoff_marker($root);

        if(is_array($recoveryState)){
            $recoveryState['status']='update_completed';
            $recoveryState['stage']='completed';
            $recoveryState['completed_at']=date(DATE_ATOM);
            $recoveryState['applied_migrations']=$migrations;
            $recoveryState['removed_files']=$removedManagedFiles;
            $recoveryManifestName=write_recovery_manifest($root,$recoveryState);
        }

        @unlink($zipPath); delete_tree($extractDir);
        flock($updateLock,LOCK_UN); fclose($updateLock);
        return [
            'updated'=>true,
            'message'=>'Guncelleme basariyla kuruldu.',
            'remote'=>$remote,
            'local'=>$localVersion,
            'local_revision'=>$localRevision,
            'installed_revision'=>normalize_release_revision($remote['release_revision']??0),
            'backup'=>$backupName,
            'database_backup'=>$dbBackupName,
            'recovery_manifest'=>$recoveryManifestName,
            'migrations'=>$migrations,
            'removed_files'=>$removedManagedFiles,
            'managed_files'=>count($newManagedFiles),
            'preserved_newer_updater_core'=>$preservedNewerUpdaterCore,
        ];
    }catch(Throwable $e){
        error_log('[IlkAdim][updater] '.$e->getMessage());
        if(is_array($recoveryState)){
            $recoveryState['status']=$fileActivationStarted
                ?'update_failed_during_file_activation'
                :($databaseMutationStarted?'update_failed_after_database_mutation':'update_failed_before_mutation');
            $recoveryState['failed_at']=date(DATE_ATOM);
            $recoveryState['failure_stage']=$updateStage;
            $recoveryState['stage']='failed';
            $recoveryState['manual_review_required']=true;
            try{$recoveryManifestName=write_recovery_manifest($root,$recoveryState);}catch(Throwable $manifestError){
                error_log('[IlkAdim][recovery-manifest] '.$manifestError->getMessage());
            }
        }
        try{ $pdo->prepare("UPDATE guncelleme_gecmisi SET durum='hatali',mesaj=?,bitis_tarihi=NOW() WHERE id=?")->execute(['Guncelleme hatayla sonlandi. Ayrintilar sunucu gunlugune kaydedildi.',$logId]); }catch(Throwable $ignored){}
        @unlink($zipPath); delete_tree($extractDir);
        if(is_resource($updateLock)){flock($updateLock,LOCK_UN);fclose($updateLock);}
        throw $e;
    }
}
