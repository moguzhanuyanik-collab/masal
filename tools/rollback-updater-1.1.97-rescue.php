<?php
declare(strict_types=1);

/**
 * İlkAdım updater rescue rollback helper.
 *
 * Kullanım:
 *   php tools/rollback-updater-1.1.97-rescue.php /tam/yol/updater-before-1.1.97-rescue-....php
 */
if(PHP_SAPI!=='cli'){
    http_response_code(403);
    exit('Bu araç yalnız CLI üzerinden çalıştırılabilir.');
}
$root=dirname(__DIR__);
$target=$root.'/src/updater.php';
$backup=(string)($argv[1]??'');
if($backup==='' || !is_file($backup) || !is_readable($backup)){
    fwrite(STDERR,"Geçerli updater yedek yolu verin.\n");
    exit(1);
}
$realBackup=realpath($backup);
$backupRoot=realpath($root.'/storage/backups');
if($realBackup===false || $backupRoot===false || !str_starts_with(str_replace('\\','/',$realBackup),rtrim(str_replace('\\','/',$backupRoot),'/').'/')){
    fwrite(STDERR,"Yedek yalnız storage/backups altından seçilebilir.\n");
    exit(1);
}
$tmp=dirname($target).'/.updater.rollback-'.bin2hex(random_bytes(6)).'.tmp';
@unlink($tmp);
if(!copy($realBackup,$tmp)){
    fwrite(STDERR,"Rollback geçici dosyası yazılamadı.\n");
    exit(1);
}
$backupHash=hash_file('sha256',$realBackup);
$tmpHash=hash_file('sha256',$tmp);
if(!is_string($backupHash)||!is_string($tmpHash)||!hash_equals($backupHash,$tmpHash)){
    @unlink($tmp);
    fwrite(STDERR,"Rollback hash doğrulaması başarısız.\n");
    exit(1);
}
if(!rename($tmp,$target)){
    @unlink($tmp);
    fwrite(STDERR,"Rollback atomik olarak etkinleştirilemedi.\n");
    exit(1);
}
fwrite(STDOUT,"OK: updater yedekten geri yüklendi.\n");
