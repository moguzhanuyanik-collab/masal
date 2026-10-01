<?php
declare(strict_types=1);

/**
 * İlkAdım 1.1.96 -> 1.1.97 updater rescue installer.
 *
 * Kullanım (CLI):
 *   php tools/apply-updater-1.1.97-rescue.php
 *
 * Bu araç:
 * - yalnız kurulu sürüm 1.1.96 ise çalışır,
 * - mevcut src/updater.php dosyasını SHA-256 ile yedekler,
 * - tools/updater-1.1.97-rescue.php dosyasını atomik olarak src/updater.php yapar,
 * - kaynak/hedef hash eşleşmesini doğrular,
 * - kullanıcı verisine veya veritabanına dokunmaz.
 */

$root=dirname(__DIR__);
$versionPath=$root.'/version.json';
$source=$root.'/tools/updater-1.1.97-rescue.php';
$target=$root.'/src/updater.php';
$backupDir=$root.'/storage/backups';

function fail107(string $message,int $code=1): never {
    fwrite(STDERR,$message.PHP_EOL);
    exit($code);
}

if(PHP_SAPI!=='cli'){
    http_response_code(403);
    exit('Bu kurtarma uygulayıcısı yalnız CLI üzerinden çalıştırılabilir.');
}
if(!is_file($versionPath) || !is_readable($versionPath)){
    fail107('version.json okunamadı.');
}
$versionData=json_decode((string)file_get_contents($versionPath),true);
$installed=is_array($versionData)?trim((string)($versionData['version']??'')):'';
if($installed!=='1.1.96'){
    fail107('Kurtarma yalnız 1.1.96 kurulumunda çalışır. Mevcut sürüm: '.($installed!==''?$installed:'bilinmiyor'));
}
if(!is_file($source) || !is_readable($source)){
    fail107('Rescue updater kaynağı bulunamadı: tools/updater-1.1.97-rescue.php');
}
if(!is_file($target) || !is_readable($target)){
    fail107('Mevcut src/updater.php bulunamadı.');
}
if(is_link($source) || is_link($target)){
    fail107('Sembolik bağlantı üzerinde kurtarma uygulanamaz.');
}
if(!is_dir($backupDir) && !mkdir($backupDir,0750,true) && !is_dir($backupDir)){
    fail107('Yedek klasörü oluşturulamadı.');
}

$sourceHash=hash_file('sha256',$source);
$targetHash=hash_file('sha256',$target);
if(!is_string($sourceHash) || strlen($sourceHash)!==64 || !is_string($targetHash) || strlen($targetHash)!==64){
    fail107('SHA-256 doğrulaması yapılamadı.');
}

$stamp=date('Ymd_His');
$backup=$backupDir.'/updater-before-1.1.97-rescue-'.$stamp.'-'.$targetHash.'.php';
if(!copy($target,$backup)){
    fail107('Mevcut updater yedeklenemedi.');
}
@chmod($backup,0600);

$tmp=dirname($target).'/.updater.1.1.97-rescue-'.bin2hex(random_bytes(6)).'.tmp';
@unlink($tmp);
try{
    if(!copy($source,$tmp)){
        fail107('Rescue updater geçici dosyaya yazılamadı.');
    }
    $tmpHash=hash_file('sha256',$tmp);
    if(!is_string($tmpHash) || !hash_equals($sourceHash,$tmpHash)){
        fail107('Rescue updater geçici dosya bütünlüğü doğrulanamadı.');
    }
    @chmod($tmp,0644);
    if(!rename($tmp,$target)){
        fail107('Rescue updater atomik olarak etkinleştirilemedi.');
    }
}finally{
    if(is_file($tmp) || is_link($tmp)) @unlink($tmp);
}

$finalHash=hash_file('sha256',$target);
if(!is_string($finalHash) || !hash_equals($sourceHash,$finalHash)){
    @copy($backup,$target);
    fail107('Etkinleştirme sonrası hash doğrulaması başarısız oldu; eski updater geri yüklendi.');
}

fwrite(STDOUT,"OK: 1.1.97 rescue updater etkinleştirildi.\n");
fwrite(STDOUT,"Yedek: ".$backup."\n");
fwrite(STDOUT,"Sonraki adım: yönetim panelinden 1.1.97 güncellemesini tekrar çalıştırın.\n");
