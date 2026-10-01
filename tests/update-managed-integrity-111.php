<?php
declare(strict_types=1);
require dirname(__DIR__).'/src/updater.php';

function check111(bool $ok,string $message): void {
    if(!$ok) throw new RuntimeException($message);
}

$root=sys_get_temp_dir().'/ilkadim-managed-integrity-'.bin2hex(random_bytes(6));
@mkdir($root.'/storage/updates',0770,true);
file_put_contents($root.'/version.json',json_encode(['version'=>'1.1.110','release_revision'=>4]));
file_put_contents($root.'/stale.txt','original');
file_put_contents($root.'/keep.txt','keep');

write_managed_update_manifest($root,['keep.txt','stale.txt'],'1.1.110',4);
$hashes=read_managed_update_hashes($root);
check111(isset($hashes['stale.txt'],$hashes['keep.txt']),'Runtime managed hashes missing.');
check111(count($hashes)===2,'Unexpected runtime managed hash count.');

$old=['keep.txt','stale.txt'];
$new=['keep.txt'];
$safe=assert_stale_managed_files_safe($root,$old,$new,[],$hashes);
check111($safe===['stale.txt'],'Expected stale preflight candidate missing.');

file_put_contents($root.'/stale.txt','user-modified');
$blocked=false;
try{
    assert_stale_managed_files_safe($root,$old,$new,[],$hashes);
}catch(Throwable){
    $blocked=true;
}
check111($blocked,'Modified stale managed file was not blocked.');

file_put_contents($root.'/stale.txt','original');
$removed=remove_stale_managed_files($root,$old,$new,[],$hashes);
check111($removed===['stale.txt'],'Verified stale file was not removed.');
check111(!file_exists($root.'/stale.txt'),'Verified stale file still exists.');
check111(file_exists($root.'/keep.txt'),'Current managed file was removed unexpectedly.');

delete_tree($root);

// Handoff marker must reject a backup changed after marker creation.
$root=sys_get_temp_dir().'/ilkadim-handoff-integrity-'.bin2hex(random_bytes(6));
$source=$root.'/source';
@mkdir($root.'/src',0770,true);
@mkdir($source.'/src',0770,true);
@mkdir($root.'/storage/backups',0770,true);
file_put_contents($root.'/src/updater.php',"<?php\n// old\n");
file_put_contents($source.'/src/updater.php',"<?php\n// new\n");
file_put_contents($root.'/storage/backups/onceki_surum.zip','backup');

$commit=str_repeat('c',40);
$state=prepare_updater_core_handoff($root,$source,'1.1.112',$commit,'onceki_surum.zip');
check111(is_array($state),'Handoff state missing.');
check111(preg_match('/^[a-f0-9]{64}$/',(string)($state['application_backup_sha256']??''))===1,'Handoff backup hash missing.');
check111((int)($state['application_backup_bytes']??0)>0,'Handoff backup byte count missing.');
check111(read_updater_core_handoff_marker($root,$commit)!==null,'Fresh handoff marker rejected.');

file_put_contents($root.'/storage/backups/onceki_surum.zip','tampered');
check111(read_updater_core_handoff_marker($root,$commit)===null,'Tampered handoff backup was accepted.');

delete_tree($root);
echo "PASS: managed stale-file and handoff backup integrity\n";
