<?php
declare(strict_types=1);

/**
 * İlkAdım 1.1.97 -> 1.1.98 updater rescue installer.
 *
 * Kullanım (CLI):
 *   php tools/apply-updater-1.1.98-rescue.php
 *
 * Bu araç:
 * - yalnız kurulu sürüm 1.1.97 ise çalışır,
 * - mevcut src/updater.php dosyasını SHA-256 ile yedekler,
 * - tools/updater-1.1.98-rescue.php dosyasını atomik olarak src/updater.php yapar,
 * - kaynak/hedef hash eşleşmesini doğrular,
 * - kullanıcı verisine veya veritabanına dokunmaz.
 */

$root=dirname(__DIR__);
$versionPath=$root.'/version.json';
$source=$root.'/tools/updater-1.1.98-rescue.php';
$target=$root.'/src/updater.php';
$backupDir=$root.'/storage/backups';

function fail110(string $message,int $code=1): never {
    fwrite(STDERR,$message.PHP_EOL);
    exit($code);
}

if(PHP_SAPI!=='cli'){
    http_response_code(403);
    exit('Bu kurtarma uygulayıcısı yalnız CLI üzerinden çalıştırılabilir.');
}
if(!is_file($versionPath) || !is_readable($versionPath)){
    fail110('version.json okunamadı.');
}
$versionData=json_decode((string)file_get_contents($versionPath),true);
$installed=is_array($versionData)?trim((string)($versionData['version']??'')):'';
if($installed!=='1.1.97'){
    fail110('Kurtarma yalnız 1.1.97 kurulumunda çalışır. Mevcut sürüm: '.($installed!==''?$installed:'bilinmiyor'));
}
if(!is_file($source) || !is_readable($source)){
    fail110('Rescue updater kaynağı bulunamadı: tools/updater-1.1.98-rescue.php');
}
if(!is_file($target) || !is_readable($target)){
    fail110('Mevcut src/updater.php bulunamadı.');
}
if(is_link($source) || is_link($target)){
    fail110('Sembolik bağlantı üzerinde kurtarma uygulanamaz.');
}
if(!is_dir($backupDir) && !mkdir($backupDir,0750,true) && !is_dir($backupDir)){
    fail110('Yedek klasörü oluşturulamadı.');
}

$sourceHash=hash_file('sha256',$source);
$targetHash=hash_file('sha256',$target);
if(!is_string($sourceHash) || strlen($sourceHash)!==64 || !is_string($targetHash) || strlen($targetHash)!==64){
    fail110('SHA-256 doğrulaması yapılamadı.');
}

$stamp=date('Ymd_His');
$backup=$backupDir.'/updater-before-1.1.98-rescue-'.$stamp.'-'.$targetHash.'.php';
if(!copy($target,$backup)){
    fail110('Mevcut updater yedeklenemedi.');
}
@chmod($backup,0600);

$tmp=dirname($target).'/.updater.1.1.98-rescue-'.bin2hex(random_bytes(6)).'.tmp';
@unlink($tmp);
try{
    if(!copy($source,$tmp)){
        fail110('Rescue updater geçici dosyaya yazılamadı.');
    }
    $tmpHash=hash_file('sha256',$tmp);
    if(!is_string($tmpHash) || !hash_equals($sourceHash,$tmpHash)){
        fail110('Rescue updater geçici dosya bütünlüğü doğrulanamadı.');
    }
    @chmod($tmp,0644);
    if(!rename($tmp,$target)){
        fail110('Rescue updater atomik olarak etkinleştirilemedi.');
    }
}finally{
    if(is_file($tmp) || is_link($tmp)) @unlink($tmp);
}

$finalHash=hash_file('sha256',$target);
if(!is_string($finalHash) || !hash_equals($sourceHash,$finalHash)){
    @copy($backup,$target);
    fail110('Etkinleştirme sonrası hash doğrulaması başarısız oldu; eski updater geri yüklendi.');
}

fwrite(STDOUT,"OK: 1.1.98 rescue updater etkinleştirildi.\n");
fwrite(STDOUT,"Yedek: ".$backup."\n");
fwrite(STDOUT,"Sonraki adım: yönetim panelinden 1.1.98 güncellemesini tekrar çalıştırın.\n");
