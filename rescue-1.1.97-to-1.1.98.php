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

const ILKADIM_LEGACY_097_BOOTSTRAP_COMMIT='2c86df240cde635812e12d35cafbb10fe99471d1';
const ILKADIM_LEGACY_097_TARGET_COMMIT='6a0f372871e6dbd2b71d2efef121fbf2dfb2f82c';

function rescue_bootstrap_commit(): string {
    $commit=ILKADIM_LEGACY_097_BOOTSTRAP_COMMIT;
    if(!preg_match('/^[a-f0-9]{40}$/i',$commit)){
        throw new RuntimeException('Sabit recovery bootstrap commit SHA değeri geçersiz.');
    }
    return $commit;
}

function rescue_ref_file(array $gh,string $ref,string $path): string {
    [$owner,$repo]=rescue_github_info($gh);
    $encodedPath=implode('/',array_map('rawurlencode',explode('/',$path)));
    $cb=(string)round(microtime(true)*1000);
    $url='https://raw.githubusercontent.com/'.rawurlencode($owner).'/'.rawurlencode($repo)
        .'/'.$ref.'/'.$encodedPath.'?cb='.$cb;
    return rescue_http($url,$gh);
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

        // 1.1.97 rescue mutable main HEAD'e veya tarihsel commit taramasına
        // güvenmez. Bootstrap updater immutable SHA'dan alınır.
        $targetCommit=rescue_bootstrap_commit();
        $versionData=json_decode(rescue_ref_file($gh,$targetCommit,'version.json'),true);
        $releaseData=json_decode(rescue_ref_file($gh,$targetCommit,'update-release.json'),true);
        $manifestData=json_decode(rescue_ref_file($gh,$targetCommit,'update-managed-files.json'),true);
        if(!is_array($versionData)||!is_array($releaseData)||!is_array($manifestData)){
            throw new RuntimeException('Sabit recovery bootstrap metadata dosyaları okunamadı.');
        }

        $targetVersion=trim((string)($versionData['version']??''));
        $releaseVersion=trim((string)($releaseData['version']??''));
        $manifestVersion=trim((string)($manifestData['version']??''));
        $targetRevision=(int)($versionData['release_revision']??0);
        $releaseRevision=(int)($releaseData['release_revision']??0);
        $manifestRevision=(int)($manifestData['release_revision']??0);
        if($targetVersion!=='1.2.9'
            || $releaseVersion!==$targetVersion
            || $manifestVersion!==$targetVersion
            || $targetRevision<1
            || $releaseRevision!==$targetRevision
            || $manifestRevision!==$targetRevision){
            throw new RuntimeException('Sabit recovery bootstrap 1.2.9 metadata doğrulaması başarısız.');
        }

        $manifestFiles=is_array($manifestData['files']??null)?$manifestData['files']:[];
        foreach([
            'src/updater.php',
            'RELEASE-1.2.9.md',
            'tests/recovery-direct-097-121-136.cjs',
        ] as $required){
            if(!in_array($required,$manifestFiles,true)){
                throw new RuntimeException('Sabit recovery bootstrap managed manifest eksik: '.$required);
            }
        }

        $payload=rescue_ref_file($gh,$targetCommit,'src/updater.php');
        if($payload===''||!str_starts_with($payload,'<?php')){
            throw new RuntimeException('GitHub hedef updater dosyası geçersiz.');
        }

        foreach([
            'function run_legacy_1_1_97_to_1_2_1_recovery',
            'function prepare_updater_core_handoff',
            'function run_pending_migrations',
            'function next_remote_version_info',
            "const ILKADIM_LEGACY_097_RECOVERY_121_COMMIT='6a0f372871e6dbd2b71d2efef121fbf2dfb2f82c';",
            'function legacy_097_direct_121_recovery_release',
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
                'mode'=>'direct-updater-core-recovery-pinned',
                'bootstrap_commit'=>ILKADIM_LEGACY_097_BOOTSTRAP_COMMIT,
                'target_121_commit'=>ILKADIM_LEGACY_097_TARGET_COMMIT,
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
