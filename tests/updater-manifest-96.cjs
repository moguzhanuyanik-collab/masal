'use strict';

const fs=require('fs');
const assert=require('assert');
const {execFileSync}=require('child_process');

const updater=fs.readFileSync('src/updater.php','utf8');
const status=fs.readFileSync('sistem-durum.php','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));

for(const fn of [
  'managed_relative_path',
  'collect_managed_update_files',
  'read_managed_update_manifest',
  'write_managed_update_manifest',
  'assert_managed_target_safe',
  'remove_stale_managed_files',
  'assert_managed_copy_type_safe',
  'assert_update_zip_safe'
]){
  assert(updater.includes('function '+fn+'('),fn+' missing');
}

assert(updater.includes("read_managed_file_list(rtrim($root,'/\\\\').'/update-managed-files.json')"));
assert(updater.includes("path_is_preserved($relative,$preserve)"));
assert(updater.includes("Güncelleme paketi sembolik bağlantı içeriyor"));
assert(updater.includes("Güncelleme ZIP paketi yol kaçışı içeriyor"));
assert(
  updater.includes("remove_stale_managed_files($root,$oldManagedFiles,$newManagedFiles,$preserve)") ||
  updater.includes("remove_stale_managed_files(\n            $root,$oldManagedFiles,$newManagedFiles,$preserve,$oldManagedHashes")
);
assert(
  updater.includes("write_managed_update_manifest($root,$newManagedFiles,(string)$remote['version'])") ||
  updater.includes("write_managed_update_manifest($root,$newManagedFiles,(string)$remote['version'],normalize_release_revision($remote['release_revision']??0))")
);
assert(updater.includes("'removed_files'=>$removedManagedFiles"));
assert(updater.includes("'managed_files'=>count($newManagedFiles)"));

assert(status.includes("src/bootstrap.php"));
assert(status.includes("database/schema.sql"));
assert(status.includes("database/seed.sql"));
assert(status.includes("update-managed-files.json"));

const tracked=execFileSync('git',['ls-files'],{encoding:'utf8'})
  .split(/\r?\n/)
  .filter(Boolean)
  .filter(path=>path!=='config/local.php'
    && !path.startsWith('storage/')
    && !path.startsWith('assets/')
    && !path.startsWith('v4/'))
  .sort();

const listed=[...manifest.files].sort();
assert.deepStrictEqual(listed,tracked,'update-managed-files.json must match deploy-managed tracked files');
assert.strictEqual(manifest.format,1);
assert(['1.1.96','1.1.119','1.2.1'].includes(manifest.version));
assert(listed.includes('update-managed-files.json'));
assert(listed.includes('src/updater.php'));
assert(listed.includes('version.json'));
assert(['1.1.96','1.1.119','1.2.1'].includes(version.version));

console.log('1.1.96 updater manifest safety checks passed');
