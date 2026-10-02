<?php
declare(strict_types=1);
require dirname(__DIR__).'/src/updater.php';

function check104(bool $value,string $message): void {
    if(!$value) throw new RuntimeException($message);
}

$base=sys_get_temp_dir().'/ilkadim-activation-'.bin2hex(random_bytes(6));
$source=$base.'/source';
$live=$base.'/live';
@mkdir($source.'/nested',0770,true);
@mkdir($live.'/nested',0770,true);
file_put_contents($source.'/existing.txt',"new-existing\n");
file_put_contents($source.'/nested/new.txt',"brand-new\n");
file_put_contents($live.'/existing.txt',"old-existing\n");

$files=['existing.txt','nested/new.txt'];
$preflight=assert_update_activation_preflight($live,$source,$files,['old.txt'],[]);
check104($preflight['files']===2,'Preflight file count mismatch.');
check104($preflight['bytes']>0,'Preflight byte count missing.');

copy_update_tree($source,$live,[]);
check104(file_get_contents($live.'/existing.txt')==="new-existing\n",'Existing file was not replaced.');
check104(file_get_contents($live.'/nested/new.txt')==="brand-new\n",'New file was not activated.');

$verified=verify_activated_update_files($source,$live,$files,[]);
check104($verified['files']===2,'Verification file count mismatch.');

file_put_contents($live.'/existing.txt',"tampered\n");
$repaired=verify_activated_update_files($source,$live,$files,[]);
check104($repaired['files']===2,'Repair verification file count mismatch.');
check104(($repaired['repaired_count']??0)===1,'Tampered target should be repaired exactly once.');
check104(in_array('existing.txt',$repaired['repaired_files']??[],true),'Repaired file list missing tampered target.');
check104(file_get_contents($live.'/existing.txt')==="new-existing\n",'Tampered target was not restored from verified source.');

$symlinkRejected=true;
if(function_exists('symlink')){
    @unlink($live.'/existing.txt');
    if(@symlink($source.'/existing.txt',$live.'/existing.txt')){
        $symlinkRejected=false;
        try{
            verify_activated_update_files($source,$live,$files,[]);
        }catch(RuntimeException $e){
            $symlinkRejected=str_contains($e->getMessage(),'sembolik bağlantı');
        }
        @unlink($live.'/existing.txt');
    }
}
check104($symlinkRejected,'Unsafe symlink target was not rejected.');

delete_tree($base);
echo "PASS: activation preflight, atomic replacement, one-shot repair and SHA-256 verification\n";
