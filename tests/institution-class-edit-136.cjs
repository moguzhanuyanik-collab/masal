'use strict';

const fs=require('fs');
const assert=require('assert');

const page=fs.readFileSync('kurum-siniflari.php','utf8');
const domain=fs.readFileSync('src/kurum_siniflari.php','utf8');
const js=fs.readFileSync('kurum-siniflari.js','utf8');
const css=fs.readFileSync('kurum-siniflari.css','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(page.includes("require __DIR__.'/src/kurum_siniflari.php';"),'classes page must use tested update domain helper');
assert(page.includes("elseif($action==='update')"),'class/group update action missing');
assert(page.includes('ksg_update($pdo,$user,$institutionId,$groupId,$_POST)'),'update action must use domain guard');
assert(page.includes('data-class-edit'),'class/group edit control missing');
assert(page.includes('data-class-dialog'),'class/group edit dialog missing');
assert(page.includes('kurum-siniflari.js?v=1.2.11'),'class/group edit JS must be loaded');
assert(page.includes('kurum-siniflari.css?v=1.2.11'),'changed class/group CSS must be cache busted');

assert(domain.includes('function ksg_validate_input('),'class/group validator missing');
assert(domain.includes('function ksg_update('),'class/group update domain function missing');
assert(domain.includes("WHERE kso.kurum_sinif_id=? AND kso.kurum_id=? AND o.sinif_seviyesi<>?"),'grade mismatch query must be tenant scoped');
assert(domain.includes('Yeni sınıf seviyesine uymayan öğrenciler var.'),'grade mismatch must block update');
assert(domain.includes("UPDATE kurum_siniflari SET ad=?,tur=?,sinif_seviyesi=? WHERE id=? AND kurum_id=?"),'group update must be tenant scoped');
assert(domain.includes("'kurum_sinif_guncelle'"),'class/group update must be audited');

assert(js.includes('dialog.showModal()'),'class/group edit modal open behavior missing');
assert(js.includes("if(type.value==='sinif' && grade.value==='0') grade.value='1';"),'class UI must not leave grade empty');
assert(css.includes('.class-group-edit-dialog'),'edit modal styling missing');

assert(workflow.includes('node tests/institution-class-edit-136.cjs'),'class edit source regression must run in quality gate');
assert(workflow.includes('php tests/institution-class-edit-db-136.php'),'class edit DB regression must run in quality gate');

assert(/^1\.2\.\d+$/.test(version.version),'release version must remain in the 1.2.x line');
assert(Number(version.version.split('.')[2])>=11,'class/group edit capability requires 1.2.11 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(Number(version.release_revision)>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);

for(const path of [
  'RELEASE-1.2.11.md',
  'src/kurum_siniflari.php',
  'kurum-siniflari.js',
  'tests/institution-class-edit-136.cjs',
  'tests/institution-class-edit-db-136.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: institution class/group edit source contract');
