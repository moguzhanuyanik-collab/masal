<?php
declare(strict_types=1);

$bridge=file_get_contents(dirname(__DIR__).'/rescue-1.1.97-to-1.1.98.php');
$canonical=file_get_contents(dirname(__DIR__).'/tools/updater-1.1.98-rescue.php');
if(!is_string($bridge)||!is_string($canonical)) throw new RuntimeException('Rescue source missing.');

foreach([
    "auth_effective_role($user)!=='super_admin'",
    "verify_csrf($_POST['csrf']??null)",
    "$installed!=='1.1.97'",
    "is_link($target)",
    "hash_file('sha256',$target)",
    "hash_equals($oldHash,$backupHash)",
    "rename($tmp,$target)",
    "rescue_atomic_restore($backup,$target)",
    "'target_version'=>'1.1.98'",
] as $needle){
    if(strpos($bridge,$needle)===false) throw new RuntimeException('Missing web rescue contract: '.$needle);
}

$start=strpos($bridge,"<<<'ILKADIM_RESCUE_PAYLOAD_113'\n");
$end=strpos($bridge,"\nILKADIM_RESCUE_PAYLOAD_113;",$start===false?0:$start);
if($start===false || $end===false) throw new RuntimeException('Embedded rescue payload not found.');
$start+=strlen("<<<'ILKADIM_RESCUE_PAYLOAD_113'\n");
$decoded=substr($bridge,$start,$end-$start);
if($decoded!==$canonical){
    throw new RuntimeException('Embedded rescue payload differs from canonical 1.1.98 rescue updater.');
}

echo "PASS: 1.1.97 -> 1.1.98 authenticated web rescue bridge\n";
