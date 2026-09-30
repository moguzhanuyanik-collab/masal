const fs=require('fs');
const assert=require('assert');

const migration=fs.readFileSync('database/migrations/065_kurum_bazli_eslestirme_izolasyonu.sql','utf8');
const auth=fs.readFileSync('src/auth.php','utf8');
const matching=fs.readFileSync('src/kurumlar_modulu.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');

assert(!/\\bDELETE\\s+FROM\\b/i.test(migration),'065 migration must not delete data');
assert(migration.includes('ADD COLUMN kurum_id'),'065 migration must add institution scope');
assert(migration.includes('UPDATE veli_ogrenci vo'),'065 migration must backfill parent relations');
assert(migration.includes('UPDATE ogretmen_ogrenci oo'),'065 migration must backfill teacher relations');
assert(migration.includes('SET kurum_id=0 WHERE kurum_id IS NULL'),'065 migration must preserve unresolved/global relations');
assert(migration.includes('PRIMARY KEY (veli_id,ogrenci_id,kurum_id)'),'parent relation PK must include institution');
assert(migration.includes('PRIMARY KEY (ogretmen_id,ogrenci_id,kurum_id)'),'teacher relation PK must include institution');

assert(auth.includes('AND vo.kurum_id=vk.kurum_id'),'parent access must require relation institution');
assert(auth.includes('AND vo.kurum_id=0'),'global parent access must remain explicitly global');
assert(auth.includes('WHERE oo.kurum_id=kt.kurum_id'),'teacher access must require relation institution');

assert(matching.includes('vo.kurum_id=k.id'),'matching list must be institution-scoped');
assert(matching.includes('oo.kurum_id=k.id'),'teacher matching list must be institution-scoped');
assert(matching.includes('INSERT IGNORE INTO veli_ogrenci (veli_id,ogrenci_id,kurum_id)'),'parent matching writes institution');
assert(fs.readFileSync('src/kurum_yonetimi.php','utf8').includes('INSERT IGNORE INTO veli_ogrenci (veli_id,ogrenci_id,kurum_id) VALUES (?,?,0)'),'global parent relation must use scope zero');
assert(matching.includes('INSERT IGNORE INTO ogretmen_ogrenci (ogretmen_id,ogrenci_id,kurum_id)'),'teacher matching writes institution');
assert(matching.includes('WHERE vo.ogrenci_id=? AND vo.kurum_id=?'),'parent matching delete must stay in institution');
assert(matching.includes('WHERE oo.ogrenci_id=? AND oo.kurum_id=?'),'teacher matching delete must stay in institution');

assert(workflow.includes('mariadb:11.4'),'CI must provide MariaDB integration service');
assert(workflow.includes('tests/tenant-isolation-db-115.php'),'CI must run DB tenant integration');

console.log('1.1.114 tenant relation schema checks passed');


const globalPage=fs.readFileSync('global-eslestirme.php','utf8');
const globalManager=fs.readFileSync('src/kurum_yonetimi.php','utf8');
assert(globalPage.includes('DELETE FROM veli_ogrenci WHERE veli_id=? AND ogrenci_id=? AND kurum_id=0'),'global unlink must only remove global relation');
assert(globalPage.includes('SELECT veli_id,ogrenci_id FROM veli_ogrenci WHERE kurum_id=0'),'global listing must ignore institution relations');
assert(globalManager.includes('LEFT JOIN veli_ogrenci vo ON vo.ogrenci_id=o.id AND vo.kurum_id=0'),'global student list must only join global relations');
assert(globalManager.includes('LEFT JOIN veli_ogrenci vo ON vo.veli_id=v.id AND vo.kurum_id=0'),'global parent list must only join global relations');
assert(globalManager.includes('INSERT IGNORE INTO veli_ogrenci (veli_id,ogrenci_id,kurum_id) VALUES (?,?,0)'),'global link creation must explicitly write scope zero');
