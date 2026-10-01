<?php
declare(strict_types=1);
$bridge=file_get_contents(dirname(__DIR__).'/rescue-1.1.97-to-1.1.98.php');
$canonical=file_get_contents(dirname(__DIR__).'/tools/updater-1.1.98-rescue.php');
if(!is_string($bridge)||!is_string($canonical)) throw new RuntimeException('Rescue source missing.');
$needles=[
 'auth_effective_role($user)!==\'super_admin\'',
 'verify_csrf($_POST[\'csrf\']??null)',
 '$installed!==\'1.1.97\'',
 'hash_equals($oldHash,$backupHash)',
 'rescue_atomic_restore($backup,$target)',
 '\'mode\'=>\'lossless-web-rescue\'',
 'kurum_kullanicilari_legacy_197_backup',
];
foreach($needles as $needle){
 if(strpos($bridge,$needle)===false) throw new RuntimeException('Missing web rescue contract: '.$needle);
}
$start=strpos($bridge,"<<<'ILKADIM_LOSSLESS_RESCUE_113'\n");
$end=strpos($bridge,"\nILKADIM_LOSSLESS_RESCUE_113;",$start===false?0:$start);
if($start===false||$end===false) throw new RuntimeException('Embedded payload missing.');
$start+=strlen("<<<'ILKADIM_LOSSLESS_RESCUE_113'\n");
$payload=substr($bridge,$start,$end-$start);
if($payload!==$canonical) throw new RuntimeException('Embedded lossless rescue differs from canonical updater.');
echo "PASS: authenticated lossless web rescue 1.1.97 -> 1.1.98\n";
