<?php
declare(strict_types=1);
$src=file_get_contents(dirname(__DIR__).'/tools/updater-1.1.98-rescue.php');
$apply=file_get_contents(dirname(__DIR__).'/tools/apply-updater-1.1.98-rescue.php');
if(!is_string($src)||!is_string($apply)) throw new RuntimeException('1.1.98 rescue files missing.');
foreach([
  "return \$localVersion==='1.1.97' && \$remoteVersion==='1.1.98';",
  "function apply_1_1_98_recovery",
  "'001_197_history_recovery'",
  "'064_adimbot_rate_limit_ve_migration_checkpoint'",
] as $needle){
  if(strpos($src,$needle)===false) throw new RuntimeException('Missing rescue contract: '.$needle);
}
if(strpos($apply,"installed!=='1.1.97'")===false) throw new RuntimeException('Installer version guard missing.');
echo "PASS: 1.1.97 -> 1.1.98 rescue updater contract\n";
