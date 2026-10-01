<?php
declare(strict_types=1);

$bridge=file_get_contents(dirname(__DIR__).'/rescue-1.1.97-to-1.1.98.php');
if(!is_string($bridge)) throw new RuntimeException('Rescue source missing.');

$needles=[
 'auth_effective_role($user)!==\'super_admin\'',
 'verify_csrf($_POST[\'csrf\']??null)',
 '$installed!==\'1.1.97\'',
 'rescue_branch_head_sha',
 'rescue_ref_file',
 'hash_equals($oldHash,$backupHash)',
 'rescue_atomic_replace($payload,$target)',
 '\'mode\'=>\'direct-updater-core-recovery\'',
 '\'database_changed\'=>false',
 '\'migrations_run\'=>false',
];

foreach($needles as $needle){
 if(strpos($bridge,$needle)===false) throw new RuntimeException('Missing direct web rescue contract: '.$needle);
}

if(strpos($bridge,'DROP TABLE')!==false
    ||strpos($bridge,'DELETE FROM')!==false
    ||strpos($bridge,'ALTER TABLE')!==false){
    throw new RuntimeException('Direct rescue DB yıkıcı SQL içeriyor.');
}

echo "PASS: authenticated direct 1.1.97 updater-core web rescue\n";
