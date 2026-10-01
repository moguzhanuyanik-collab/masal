<?php
declare(strict_types=1);
require dirname(__DIR__).'/src/updater.php';

function check112(bool $ok,string $message): void {
    if(!$ok) throw new RuntimeException($message);
}

$root=sys_get_temp_dir().'/ilkadim-continuity-'.bin2hex(random_bytes(6));
$source=$root.'/source';
@mkdir($root.'/src',0770,true);
@mkdir($source.'/src',0770,true);
@mkdir($root.'/storage/backups',0770,true);
@mkdir($root.'/storage/updates',0770,true);

file_put_contents($root.'/version.json',json_encode(['version'=>'1.1.111','release_revision'=>4]));
file_put_contents($root.'/update-managed-files.json',json_encode(['format'=>1,'version'=>'1.1.111','release_revision'=>4,'files'=>['keep.txt']]));
file_put_contents($root.'/keep.txt','keep');
write_managed_update_manifest($root,['keep.txt'],'1.1.111',4);

$state=managed_runtime_manifest_state($root);
check112(is_array($state),'Matching runtime managed manifest rejected.');
$hashes=read_managed_update_hashes($root);
check112(isset($hashes['keep.txt']),'Managed hash baseline missing.');

$runtimePath=managed_manifest_path($root);
$runtime=json_decode((string)file_get_contents($runtimePath),true);
$runtime['release_revision']=3;
file_put_contents($runtimePath,json_encode($runtime));
check112(managed_runtime_manifest_state($root)===null,'Revision-mismatched runtime manifest trusted.');
check112(read_managed_update_hashes($root)===[],'Revision-mismatched hashes trusted.');
check112(read_managed_update_manifest($root)===['keep.txt'],'Packaged fallback manifest was not used.');

write_managed_update_manifest($root,['keep.txt'],'1.1.111',4);
$runtime=json_decode((string)file_get_contents($runtimePath),true);
$runtime['hashes']=[];
file_put_contents($runtimePath,json_encode($runtime));
check112(read_managed_update_hashes($root)===[],'Partial hash coverage trusted.');

file_put_contents($root.'/src/updater.php',"<?php\n// old\n");
file_put_contents($source.'/src/updater.php',"<?php\n// new\n");
file_put_contents($root.'/storage/backups/onceki_surum.zip','backup');
$commit=str_repeat('d',40);
$handoff=prepare_updater_core_handoff($root,$source,'1.1.112',$commit,'onceki_surum.zip');
check112(is_array($handoff),'Handoff was not prepared.');
check112(read_updater_core_handoff_marker($root,$commit,'1.1.112')!==null,'Fresh handoff rejected.');

$markerPath=updater_core_handoff_marker_path($root);
$marker=json_decode((string)file_get_contents($markerPath),true);
$marker['updated_at']=date(DATE_ATOM,time()-updater_core_handoff_max_age_seconds()-60);
file_put_contents($markerPath,json_encode($marker));
check112(read_updater_core_handoff_marker($root,$commit,'1.1.112')===null,'Expired handoff marker trusted.');

$marker['updated_at']=date(DATE_ATOM);
file_put_contents($markerPath,json_encode($marker));
file_put_contents($root.'/storage/backups/'.(string)$handoff['updater_backup'],'tampered-updater-backup');
check112(read_updater_core_handoff_marker($root,$commit,'1.1.112')===null,'Tampered updater backup trusted.');

delete_tree($root);
echo "PASS: 1.1.112 handoff continuity and runtime manifest identity\n";
