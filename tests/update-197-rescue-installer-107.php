<?php
declare(strict_types=1);

$installer=file_get_contents(dirname(__DIR__).'/tools/apply-updater-1.1.97-rescue.php');
$rollback=file_get_contents(dirname(__DIR__).'/tools/rollback-updater-1.1.97-rescue.php');
if(!is_string($installer)||!is_string($rollback)) throw new RuntimeException('Rescue araçları okunamadı.');

$checks=[
    "installed!=='1.1.96'",
    "hash_file('sha256'",
    "updater-before-1.1.97-rescue-",
    "rename(\$tmp,\$target)",
    "PHP_SAPI!=='cli'",
];
foreach($checks as $needle){
    if(strpos($installer,$needle)===false) throw new RuntimeException('Installer kontrolü eksik: '.$needle);
}
if(strpos($rollback,"storage/backups")===false) throw new RuntimeException('Rollback backup guard eksik.');
if(strpos($rollback,"hash_file('sha256'")===false) throw new RuntimeException('Rollback hash kontrolü eksik.');

echo "PASS: 1.1.97 rescue installer/rollback source guards\n";
