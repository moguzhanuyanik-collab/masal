'use strict';
const fs=require('fs');
const assert=require('assert');

const migration=fs.readFileSync('database/migrations/066_kurum_eslestirme_schema_guard.sql','utf8');
const dbTest=fs.readFileSync('tests/tenant-isolation-db-115.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

assert(migration.includes('ilkadim_relation_guard_sql'),'066 migration must contain a fail-closed schema guard');
assert(migration.includes('veli_id,ogrenci_id,kurum_id'),'parent relation primary key postcondition must be checked');
assert(migration.includes('ogretmen_id,ogrenci_id,kurum_id'),'teacher relation primary key postcondition must be checked');
assert(migration.includes('ix_veli_ogrenci_kurum'),'parent tenant index postcondition must be checked');
assert(migration.includes('ix_ogretmen_ogrenci_kurum'),'teacher tenant index postcondition must be checked');
assert(migration.includes('id=0'),'global scope zero must not collide with a real institution');
assert(migration.includes('__ilkadim_tenant_relation_schema_guard_failed__'),'guard must fail closed');
assert(migration.includes('SET @ilkadim_relation_guard_passed = 1'),'successful guard path must not return an unbuffered result set');
assert(dbTest.includes('066_kurum_eslestirme_schema_guard.sql'),'DB integration test must execute migration 066');
assert(workflow.includes('node tests/tenant-schema-guard-116.cjs'),'CI must run the schema guard regression');
assert(['1.1.116','1.2.1','1.2.2'].includes(version.version));
assert(['1.1.116','1.2.1','1.2.2'].includes(release.version));
assert(['1.1.116','1.2.1','1.2.2'].includes(manifest.version));
assert(Number.isInteger(version.release_revision) && version.release_revision>=1);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);

console.log('PASS: tenant schema guard contract');
