const fs=require('fs');
const assert=require('assert');

const migration=fs.readFileSync('database/migrations/066_kurum_eslestirme_schema_guard.sql','utf8');
const dbTest=fs.readFileSync('tests/tenant-isolation-db-115.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));

assert(migration.includes('ilkadim_relation_guard_sql'),'066 migration must contain a fail-closed schema guard');
assert(migration.includes('veli_id,ogrenci_id,kurum_id'),'parent primary key postcondition must be checked');
assert(migration.includes('ogretmen_id,ogrenci_id,kurum_id'),'teacher primary key postcondition must be checked');
assert(migration.includes('ix_veli_ogrenci_kurum'),'parent tenant index postcondition must be checked');
assert(migration.includes('ix_ogretmen_ogrenci_kurum'),'teacher tenant index postcondition must be checked');
assert(migration.includes('id=0'),'global scope zero must not collide with a real institution');
assert(migration.includes('__ilkadim_tenant_relation_schema_guard_failed__'),'guard must fail closed');
assert(dbTest.includes('066_kurum_eslestirme_schema_guard.sql'),'DB integration test must execute migration 066');
assert(workflow.includes('tenant-isolation-db-115.php'),'CI must keep the real MariaDB tenant test');
assert(version.version==='1.1.115','release version must advance to 1.1.115');

console.log('1.1.115 tenant schema guard checks passed');
