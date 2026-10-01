'use strict';

const fs=require('fs');
const assert=require('assert');

const api=fs.readFileSync('api/kurumlar-modulu.php','utf8');
const matching=fs.readFileSync('src/kurumlar_modulu.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

assert(api.includes("$rows=km_matching_rows($pdo,$institutionId);"));
assert(api.includes("$matchingOptions=km_matching_options($pdo,$institutionId);"));
assert(!api.includes("$rows=[];\\n                $matchingOptions=['ogrenciler'=>[],'veliler'=>[],'ogretmenler'=>[]];"),
  'Eşleştirme filtresi boşken sonuçlar yapay olarak boşaltılmamalı.');

assert(matching.includes("DELETE FROM veli_ogrenci WHERE ogrenci_id=? AND kurum_id=?"));
assert(matching.includes("DELETE FROM ogretmen_ogrenci WHERE ogrenci_id=? AND kurum_id=?"));
const saveStart=matching.indexOf('function km_save_matching');
const deleteStart=matching.indexOf('function km_delete_matching',saveStart);
assert(saveStart>=0 && deleteStart>saveStart,'km_save_matching sınırları bulunamadı.');
const saveBlock=matching.slice(saveStart,deleteStart);
assert(!saveBlock.includes('INNER JOIN kurum_kullanicilari'),
  'Eşleştirme temizliği pasif üyelik JOIN\'ine bağlı olmamalı.');

assert(api.includes('$mysqlError=(int)($e->errorInfo[1]??0);'));
assert(api.includes("if($mysqlError===1452)"));
assert(api.includes("elseif($mysqlError===1062)"));

assert(['1.1.117','1.2.1','1.2.2'].includes(version.version));
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(Number.isInteger(version.release_revision) && version.release_revision>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);
assert(manifest.files.includes('tests/tenant-matching-crud-117.cjs'));
assert(manifest.files.includes('RELEASE-1.1.117.md'));
assert(workflow.includes('node tests/tenant-matching-crud-117.cjs'));

console.log('PASS: tenant matching CRUD regression contract');
