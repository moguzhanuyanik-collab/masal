<?php
declare(strict_types=1);
require dirname(__DIR__).'/src/updater.php';

function check99(bool $value,string $message): void {
    if(!$value) throw new RuntimeException($message);
}

$root=sys_get_temp_dir().'/ilkadim-db-backup-'.bin2hex(random_bytes(6));
if(!mkdir($root.'/storage/backups',0770,true) && !is_dir($root.'/storage/backups')){
    throw new RuntimeException('Temporary backup directory could not be created.');
}

$fake=$root.'/fake-mysqldump';
$script=<<<'SH'
#!/bin/sh
echo '-- MySQL dump 10.13'
echo 'CREATE TABLE `sample` (`id` int);'
i=0
while [ "$i" -lt 80 ]; do
  echo '-- İlkAdım backup validation filler line 012345678901234567890123456789'
  i=$((i+1))
done
exit 0
SH;
file_put_contents($fake,$script);
chmod($fake,0755);

$db=['host'=>'localhost','port'=>3306,'name'=>'ilk_adim_test','user'=>'tester','pass'=>'very-secret'];
$name=create_database_backup($root,$db,['mysqldump_path'=>$fake]);
$final=$root.'/storage/backups/'.$name;
check99($name==='onceki_veritabani.sql','Unexpected backup filename.');
check99(is_file($final),'Database backup file was not created.');
$body=(string)file_get_contents($final);
check99(str_contains($body,'MySQL dump'),'Dump header missing.');
check99(str_contains($body,'CREATE TABLE'),'Dump SQL marker missing.');
check99(!str_contains($body,'very-secret'),'Database password leaked into dump output.');

$before=hash_file('sha256',$final);
$failed=false;
try{
    create_database_backup($root,$db,['mysqldump_path'=>'/bin/false']);
}catch(RuntimeException){
    $failed=true;
}
check99($failed,'Failed mysqldump must stop the update.');
check99(is_file($final),'Existing good backup must survive a failed replacement.');
check99(hash_file('sha256',$final)===$before,'Existing good backup changed after failed replacement.');

delete_tree($root);
echo "PASS: native DB backup success, validation and atomic failure behavior\n";
