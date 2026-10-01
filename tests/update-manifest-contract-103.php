<?php
declare(strict_types=1);
require dirname(__DIR__).'/src/updater.php';

function check103(bool $value,string $message): void {
    if(!$value) throw new RuntimeException($message);
}

$actual=['a.php','dir/b.js','update-managed-files.json'];
$valid=['format'=>1,'version'=>'1.1.103','files'=>$actual];
assert_packaged_manifest_matches_tree($valid,$actual);

$missing=false;
try{
    assert_packaged_manifest_matches_tree(
        ['format'=>1,'version'=>'1.1.103','files'=>['a.php','update-managed-files.json']],
        $actual
    );
}catch(RuntimeException $e){
    $missing=str_contains($e->getMessage(),'manifestte eksik');
}
check103($missing,'Missing manifest entry was not rejected.');

$phantom=false;
try{
    assert_packaged_manifest_matches_tree(
        ['format'=>1,'version'=>'1.1.103','files'=>array_merge($actual,['ghost.php'])],
        $actual
    );
}catch(RuntimeException $e){
    $phantom=str_contains($e->getMessage(),'pakette bulunmayan');
}
check103($phantom,'Phantom manifest entry was not rejected.');

$duplicate=false;
try{
    normalized_packaged_manifest_files([
        'format'=>1,
        'files'=>['a.php','a.php','update-managed-files.json'],
    ]);
}catch(RuntimeException $e){
    $duplicate=str_contains($e->getMessage(),'tekrarlı');
}
check103($duplicate,'Duplicate manifest entry was not rejected.');

$badFormat=false;
try{
    normalized_packaged_manifest_files(['format'=>2,'files'=>$actual]);
}catch(RuntimeException $e){
    $badFormat=str_contains($e->getMessage(),'formatı');
}
check103($badFormat,'Unsupported manifest format was not rejected.');

echo "PASS: packaged managed-file manifest exact-tree contract\n";
