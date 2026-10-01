'use strict';

const fs=require('fs');
const assert=require('assert');

const page=fs.readFileSync('guncelleme.php','utf8');
const updater=fs.readFileSync('src/updater.php','utf8');
const css=fs.readFileSync('guncelleme-manuel.css','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

assert(page.includes("if ($action === 'manual_install')"),'manual AJAX action missing');
assert(page.includes("$_FILES['update_zip']"),'manual uploaded ZIP input missing');
assert(page.includes('is_uploaded_file($tmpName)'),'manual upload must require genuine HTTP upload');
assert(page.includes("strtolower((string)pathinfo($originalName,PATHINFO_EXTENSION))!=='zip'"),'ZIP extension guard missing');
assert(page.includes("install_github_update(") && page.includes("$tmpName\n            );"),'manual upload must reuse updater installer');
assert(page.includes('id="manualUpdateButton"'),'manual update button missing');
assert(page.includes('id="manualUpdateModal"'),'manual update modal missing');
assert(page.includes('id="manualUpdateFile"'),'manual ZIP picker missing');
assert(page.includes("body.append('update_zip', file, file.name)"),'manual request must send selected ZIP');
assert(page.includes("request('manual_install', manualFormData())"),'manual install request missing');

assert(updater.includes('const ILKADIM_UPDATER_CORE_GENERATION = 122;'),'updater generation must advance');
assert(updater.includes('function manual_update_package_identity('),'manual package identity validator missing');
assert(updater.includes('function update_zip_root_prefix('),'manual ZIP root detector missing');
assert(updater.includes('function manual_update_zip_managed_files('),'manual manifest/tree collector missing');
assert(updater.includes('assert_update_zip_safe($zip,$updateConfig)'),'manual ZIP must reuse package safety guard');
assert(updater.includes('assert_packaged_manifest_matches_tree($manifestData,$managedFiles)'),'manual ZIP manifest must match actual tree');
assert(updater.includes("'source'=>'manual_upload'"),'manual package source marker missing');
assert(updater.includes("?string $manualPackagePath=null"),'installer manual package parameter missing');
assert(updater.includes("if($manualMode){"),'manual installer branch missing');
assert(updater.includes("copy((string)$manualPackagePath,$zipPath)"),'manual package must be copied into guarded staging');
assert(updater.includes("hash_equals($expectedHash,strtolower($copiedHash))"),'manual package copy must be hash verified');
assert(updater.includes('release_identity_is_newer($remote,$localVersion,$localRevision)'),'manual downgrade/reinstall protection missing');

assert(css.includes('.manual-update-dialog'));
assert(css.includes('.manual-update-dropzone'));
assert(workflow.includes('node tests/manual-update-upload-131.cjs'));

assert(/^1\.2\.\d+$/.test(version.version),'release version must remain in the 1.2.x line');
assert(Number(version.version.split('.')[2])>=6,'manual update capability requires 1.2.6 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(Number(version.release_revision)>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);
assert(manifest.files.includes('guncelleme-manuel.css'));
assert(manifest.files.includes('tests/manual-update-upload-131.cjs'));
assert(manifest.files.includes('RELEASE-1.2.6.md'));

console.log('PASS: manual update ZIP upload, UI and guarded installer contract');
