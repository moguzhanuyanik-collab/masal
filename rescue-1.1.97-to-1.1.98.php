<?php
declare(strict_types=1);

// İlkAdım 1.1.97 doğrudan updater-core kurtarma köprüsü.
// Bu dosya yalnızca src/updater.php çekirdeğini günceller.
// Veritabanına dokunmaz; migrationları normal Güncelleme Merkezi yürütür.

require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';

header('Cache-Control: no-store, no-cache, must-revalidate, max-age=0');
header('X-Content-Type-Options: nosniff');
header('X-Frame-Options: DENY');
header("Content-Security-Policy: default-src 'self'; style-src 'self' 'unsafe-inline'; form-action 'self'; frame-ancestors 'none'");

$user=authenticated_user();
if(!$user){
    header('Location: login.php');
    exit;
}
if(auth_effective_role($user)!=='super_admin'){
    http_response_code(403);
    exit('Bu işlem yalnızca Süper Admin tarafından kullanılabilir.');
}

function rescue_h(string $value): string {
    return htmlspecialchars($value,ENT_QUOTES,'UTF-8');
}

function rescue_installed_version(string $root): string {
    $path=rtrim($root,'/\\').'/version.json';
    if(!is_file($path)||is_link($path)) return '';
    $data=json_decode((string)file_get_contents($path),true);
    return is_array($data)?trim((string)($data['version']??'')):'';
}

function rescue_github_info(array $gh): array {
    $owner=trim((string)($gh['owner']??''));
    $repo=trim((string)($gh['repo']??''));
    $branch=trim((string)($gh['branch']??'main'))?:'main';
    if($owner===''||$repo==='') throw new RuntimeException('GitHub owner/repo ayarı yapılmamış.');
    foreach([$owner,$repo] as $value){
        if(!preg_match('/^[A-Za-z0-9_.-]+$/',$value)){
            throw new RuntimeException('GitHub ayarlarında geçersiz karakter var.');
        }
    }
    if(!preg_match('/^[A-Za-z0-9_.\\/-]+$/',$branch)){
        throw new RuntimeException('GitHub branch ayarı geçersiz.');
    }
    return [$owner,$repo,$branch];
}

function rescue_http(string $url,array $gh): string {
    if(!function_exists('curl_init')) throw new RuntimeException('PHP cURL eklentisi gerekli.');
    $ch=curl_init($url);
    if($ch===false) throw new RuntimeException('cURL başlatılamadı.');

    $headers=[
        'User-Agent: IlkAdim-Direct-097-Recovery/1.0',
        'Accept: application/vnd.github+json',
        'Cache-Control: no-cache, no-store, must-revalidate',
        'Pragma: no-cache',
    ];
    $token=trim((string)($gh['token']??''));
    if($token!=='') $headers[]='Authorization: Bearer '.$token;

    curl_setopt_array($ch,[
        CURLOPT_RETURNTRANSFER=>true,
        CURLOPT_FOLLOWLOCATION=>true,
        CURLOPT_CONNECTTIMEOUT=>15,
        CURLOPT_TIMEOUT=>120,
        CURLOPT_FAILONERROR=>false,
        CURLOPT_HTTPHEADER=>$headers,
        CURLOPT_FRESH_CONNECT=>true,
        CURLOPT_FORBID_REUSE=>true,
    ]);
    $body=curl_exec($ch);
    $status=(int)curl_getinfo($ch,CURLINFO_RESPONSE_CODE);
    $error=curl_error($ch);
    curl_close($ch);

    if($body===false||$status<200||$status>=300){
        throw new RuntimeException('GitHub isteği başarısız (HTTP '.$status.')'.($error!==''?': '.$error:''));
    }
    return (string)$body;
}

function rescue_branch_head_sha(array $gh): string {
    [$owner,$repo,$branch]=rescue_github_info($gh);
    $cb=(string)round(microtime(true)*1000);
    $url='https://api.github.com/repos/'.rawurlencode($owner).'/'.rawurlencode($repo)
        .'/commits/'.rawurlencode($branch).'?cb='.$cb;
    $data=json_decode(rescue_http($url,$gh),true);
    $sha=trim((string)($data['sha']??''));
    if(!preg_match('/^[a-f0-9]{40}$/i',$sha)){
        throw new RuntimeException('GitHub dal HEAD commit SHA değeri çözümlenemedi.');
    }
    return $sha;
}

function rescue_ref_file(array $gh,string $ref,string $path): string {
    [$owner,$repo]=rescue_github_info($gh);
    $encodedPath=implode('/',array_map('rawurlencode',explode('/',$path)));
    $cb=(string)round(microtime(true)*1000);
    $url='https://raw.githubusercontent.com/'.rawurlencode($owner).'/'.rawurlencode($repo)
        .'/'.$ref.'/'.$encodedPath.'?cb='.$cb;
    return rescue_http($url,$gh);
}

function rescue_validate_historical_sequence(array $history,array $expected,array $ignored=[]): void {
    $collapsed=[];
    foreach($history as $value){
        $value=trim((string)$value);
        if($value==='' || in_array($value,$ignored,true)) continue;
        if($collapsed===[] || $collapsed[count($collapsed)-1]!==$value) $collapsed[]=$value;
    }
    $expectedCount=count($expected);
    if($expectedCount===0) return;
    $limit=count($collapsed)-$expectedCount;
    for($start=0;$start<=$limit;$start++){
        $matches=true;
        for($offset=0;$offset<$expectedCount;$offset++){
            if(($collapsed[$start+$offset]??null)!==$expected[$offset]){$matches=false;break;}
        }
        if($matches) return;
    }
    throw new RuntimeException('1.1.97 recovery zinciri eksik, atlanmış veya sırası bozulmuş. Updater çekirdeği değiştirilmedi.');
}

function rescue_validate_historical_chain(array $gh): void {
    [$owner,$repo,$branch]=rescue_github_info($gh);
    // Aktif zincir: 1.1.98 -> 1.1.99 -> ... -> 1.1.117 -> 1.2.1.
    // 1.1.118 yoktur. 1.1.119 recovery-only artifact olarak tutulur.
    $expected=['1.1.98','1.1.99','1.1.100','1.1.101','1.1.102','1.1.103','1.1.104','1.1.105','1.1.106','1.1.107','1.1.108','1.1.109','1.1.110','1.1.111','1.1.112','1.1.113','1.1.114','1.1.115','1.1.116','1.1.117','1.2.1'];
    $recoveryOnly=['1.1.119'];
    $historyNewestFirst=[];$page=1;
    while($page<=20){
        $url='https://api.github.com/repos/'.rawurlencode($owner).'/'.rawurlencode($repo).'/commits?sha='.rawurlencode($branch).'&path=version.json&per_page=100&page='.$page.'&cb='.(string)round(microtime(true)*1000);
        $rows=json_decode(rescue_http($url,$gh),true);
        if(!is_array($rows)) throw new RuntimeException('GitHub tarihsel sürüm geçmişi okunamadı.');
        if($rows===[]) break;
        foreach($rows as $row){
            $sha=trim((string)($row['sha']??''));
            if(!preg_match('/^[a-f0-9]{40}$/i',$sha)) continue;
            try{$data=json_decode(rescue_ref_file($gh,$sha,'version.json'),true);}catch(Throwable){continue;}
            $v=is_array($data)?trim((string)($data['version']??'')):'';
            if($v!=='') $historyNewestFirst[]=$v;
        }
        if(count($rows)<100) break;
        $page++;
    }
    rescue_validate_historical_sequence(array_reverse($historyNewestFirst),$expected,$recoveryOnly);
}
function rescue_atomic_replace(string $source,string $target): void {
    $tmp=$target.'.ilkadim-direct-rescue-'.bin2hex(random_bytes(6)).'.tmp';
    @unlink($tmp);
    if(file_put_contents($tmp,$source,LOCK_EX)===false){
        throw new RuntimeException('Yeni updater geçici dosyası yazılamadı.');
    }
    @chmod($tmp,0644);

    $sourceHash=hash('sha256',$source);
    $tmpHash=hash_file('sha256',$tmp);
    if(!is_string($tmpHash)||!hash_equals($sourceHash,$tmpHash)){
        @unlink($tmp);
        throw new RuntimeException('Yeni updater SHA-256 doğrulaması başarısız.');
    }

    if(!@rename($tmp,$target)){
        @unlink($tmp);
        throw new RuntimeException('Yeni updater atomik olarak etkinleştirilemedi.');
    }
}

$root=__DIR__;
$installed=rescue_installed_version($root);
$done=false;
$error='';
$targetVersion='';
$targetCommit='';
$backupName='';

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)){
            throw new RuntimeException('Güvenlik doğrulaması başarısız.');
        }
        if($installed!=='1.1.97'){
            throw new RuntimeException('Bu kurtarma köprüsü yalnız kurulu sürüm 1.1.97 iken çalışır.');
        }

        $gh=app_config('github');
        if(!is_array($gh)) throw new RuntimeException('GitHub ayarları okunamadı.');

        $targetCommit=rescue_branch_head_sha($gh);
        rescue_validate_historical_chain($gh);
        $versionData=json_decode(rescue_ref_file($gh,$targetCommit,'version.json'),true);
        $releaseData=json_decode(rescue_ref_file($gh,$targetCommit,'update-release.json'),true);
        if(!is_array($versionData)||!is_array($releaseData)){
            throw new RuntimeException('GitHub hedef sürüm metadata dosyaları okunamadı.');
        }

        $targetVersion=trim((string)($versionData['version']??''));
        $releaseVersion=trim((string)($releaseData['version']??''));
        if($targetVersion===''||$targetVersion!==$releaseVersion){
            throw new RuntimeException('GitHub hedef sürüm metadata değerleri eşleşmiyor.');
        }
        if(version_compare($targetVersion,'1.2.2','<')){
            throw new RuntimeException('GitHub HEAD güvenli recovery updater sürümünden eski: '.$targetVersion);
        }

        $payload=rescue_ref_file($gh,$targetCommit,'src/updater.php');
        if($payload===''||!str_starts_with($payload,'<?php')){
            throw new RuntimeException('GitHub hedef updater dosyası geçersiz.');
        }

        foreach([
            'function github_branch_head_sha',
            'function run_legacy_1_1_97_to_1_2_1_recovery',
            'function prepare_updater_core_handoff',
            'function run_pending_migrations',
            'function next_remote_version_info',
        ] as $signature){
            if(strpos($payload,$signature)===false){
                throw new RuntimeException('Hedef updater güvenlik imzası eksik: '.$signature);
            }
        }

        $target=$root.'/src/updater.php';
        if(!is_file($target)||is_link($target)){
            throw new RuntimeException('Canlı updater dosyası güvenli bir normal dosya değil.');
        }

        $oldHash=hash_file('sha256',$target);
        if(!is_string($oldHash)||preg_match('/^[a-f0-9]{64}$/',$oldHash)!==1){
            throw new RuntimeException('Canlı updater SHA-256 değeri alınamadı.');
        }

        $backupDir=$root.'/storage/backups';
        if(!is_dir($backupDir)&&!mkdir($backupDir,0750,true)&&!is_dir($backupDir)){
            throw new RuntimeException('Updater yedek klasörü oluşturulamadı.');
        }

        $backupName='updater-before-direct-097-recovery-'.date('Ymd_His').'-'.substr($oldHash,0,12).'.php';
        $backup=$backupDir.'/'.$backupName;
        if(!copy($target,$backup)){
            throw new RuntimeException('Mevcut updater yedeklenemedi.');
        }
        @chmod($backup,0600);

        $backupHash=hash_file('sha256',$backup);
        if(!is_string($backupHash)||!hash_equals($oldHash,$backupHash)){
            @unlink($backup);
            throw new RuntimeException('Updater yedeği SHA-256 doğrulamasından geçemedi.');
        }

        $newHash=hash('sha256',$payload);
        $activated=false;
        try{
            rescue_atomic_replace($payload,$target);
            $activated=true;

            $liveHash=hash_file('sha256',$target);
            if(!is_string($liveHash)||!hash_equals($newHash,$liveHash)){
                throw new RuntimeException('Etkin updater SHA-256 doğrulamasından geçemedi.');
            }
        }catch(Throwable $activationError){
            if($activated){
                $restoreTmp=$target.'.ilkadim-direct-restore-'.bin2hex(random_bytes(6)).'.tmp';
                if(!copy($backup,$restoreTmp)||!@rename($restoreTmp,$target)){
                    @unlink($restoreTmp);
                    throw new RuntimeException('Updater etkinleştirme başarısız oldu ve eski updater otomatik geri yüklenemedi.',0,$activationError);
                }
            }
            $restored=hash_file('sha256',$target);
            if(!is_string($restored)||!hash_equals($oldHash,$restored)){
                throw new RuntimeException('Updater etkinleştirme başarısız oldu ve eski updater doğrulanamadı.',0,$activationError);
            }
            throw $activationError;
        }

        $auditDir=$root.'/storage/updates';
        if(!is_dir($auditDir)) @mkdir($auditDir,0750,true);
        if(is_dir($auditDir)){
            $audit=[
                'format'=>1,
                'created_at'=>date(DATE_ATOM),
                'installed_version'=>'1.1.97',
                'target_version'=>$targetVersion,
                'target_commit'=>$targetCommit,
                'mode'=>'direct-updater-core-recovery',
                'backup'=>$backupName,
                'old_sha256'=>$oldHash,
                'new_sha256'=>$newHash,
                'database_changed'=>false,
                'migrations_run'=>false,
            ];
            @file_put_contents(
                $auditDir.'/direct-097-recovery.json',
                json_encode($audit,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES|JSON_PRETTY_PRINT)."
",
                LOCK_EX
            );
        }

        $done=true;
    }catch(Throwable $e){
        error_log('[IlkAdim][direct-097-recovery] '.$e->getMessage());
        $error=$e->getMessage();
    }
}

$csrf=csrf_token();
?><!doctype html>
<html lang="tr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>1.1.97 Güvenli Güncelleme Kurtarma</title>
<style>
body{font-family:system-ui,-apple-system,sans-serif;background:#f6f7fb;color:#20243a;margin:0;padding:24px}
main{max-width:720px;margin:8vh auto;background:#fff;border-radius:24px;padding:28px;box-shadow:0 14px 50px rgba(38,45,90,.12)}
h1{margin-top:0}.muted{color:#69708a}.ok{background:#ecfdf3;color:#176b3a;padding:16px;border-radius:14px}.err{background:#fff1f1;color:#9c2d2d;padding:16px;border-radius:14px}
button,a.btn{display:inline-block;border:0;border-radius:14px;padding:14px 18px;background:#5b4ad6;color:#fff;text-decoration:none;font-weight:700}
code{background:#f1f2f7;padding:2px 6px;border-radius:6px}
</style></head><body><main>
<h1>1.1.97 Güvenli Güncelleme Kurtarma</h1>
<p class="muted">Kurulu sürüm: <strong><?=rescue_h($installed?:'okunamadı')?></strong></p>
<?php if($done):?>
<div class="ok">
<strong>Güncelleme çekirdeği güvenli biçimde yenilendi.</strong><br>
Hedef sürüm: <?=rescue_h($targetVersion)?><br>
Hedef commit: <code><?=rescue_h($targetCommit)?></code><br>
Yedek: <?=rescue_h($backupName)?>
</div>
<p>Bu adım veritabanına müdahale etmedi. Şimdi <strong>Güncelleme Merkezi</strong> üzerinden normal güncellemeyi başlat. Yeni updater, veritabanı migrationlarını kendi güvenli recovery akışıyla yönetecek.</p>
<a class="btn" href="guncelleme.php">Güncelleme Merkezine dön</a>
<?php else:?>
<?php if($error!==''):?><div class="err"><?=rescue_h($error)?></div><?php endif;?>
<p>Bu köprü yalnızca <code>src/updater.php</code> çekirdeğini değiştirir. GitHub'daki güncel ve doğrulanmış updater gerçek commit SHA üzerinden alınır; mevcut updater SHA-256 ile yedeklenir ve başarısızlıkta geri yüklenir.</p>
<form method="post"><input type="hidden" name="csrf" value="<?=rescue_h($csrf)?>"><button type="submit">Güvenli kurtarmayı başlat</button></form>
<?php endif;?>
</main></body></html>
