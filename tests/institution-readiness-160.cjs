'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/kurum_hazirlik.php','utf8');
const manager=fs.readFileSync('yonetici-paneli.php','utf8');
const detail=fs.readFileSync('kurum-detay.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(domain.includes('function kh_status('),'readiness domain missing');
assert(domain.includes("kurum_id=? AND kurum_rolu='ogretmen' AND aktif=1"),'teacher readiness must be tenant scoped');
assert(domain.includes("kurum_id=? AND kurum_rolu='ogrenci' AND aktif=1"),'student readiness must be tenant scoped');
assert(domain.includes("kurum_id=? AND kurum_rolu='veli' AND aktif=1"),'parent readiness must be tenant scoped');
assert(domain.includes('WHERE kso.kurum_id=?'),'class assignment readiness must be tenant scoped');
assert(domain.includes('kk.kurum_id=oi.kurum_id'),'teacher content readiness must validate institution membership');
assert(domain.includes('WHERE oi.kurum_id=? AND oi.aktif=1'),'content readiness must be tenant scoped and active');
assert(domain.includes("'percent'=>$percent"),'readiness percentage missing');

assert(manager.includes("require __DIR__.'/src/kurum_hazirlik.php';"),'manager panel readiness dependency missing');
assert(manager.includes('$readiness=$hasInstitution?kh_status($pdo,$institutionId)'), 'manager readiness computation missing');
assert(manager.includes('KURULUM DURUMU') && manager.includes('Kurum Hazırlık'),'manager readiness UI missing');
assert(detail.includes("require __DIR__.'/src/kurum_hazirlik.php';"),'institution detail readiness dependency missing');
assert(detail.includes('$readiness=kh_status($pdo,$institutionId);'),'institution detail readiness computation missing');
assert(detail.includes('KURULUM DURUMU') && detail.includes('Kurum Hazırlık'),'institution detail readiness UI missing');

assert(workflow.includes('node tests/institution-readiness-160.cjs'),'readiness source test missing from quality gate');
assert(workflow.includes('php tests/institution-readiness-db-160.php'),'readiness DB test missing from quality gate');
assert(version.version.startsWith('1.2.'),'release version must remain in the 1.2.x line');
assert(Number(version.version.split('.')[2])>=35,'institution readiness requires 1.2.35 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
for(const path of ['RELEASE-1.2.35.md','src/kurum_hazirlik.php','tests/institution-readiness-160.cjs','tests/institution-readiness-db-160.php']){
  assert(manifest.files.includes(path),'manifest missing '+path);
}

console.log('PASS: institution readiness onboarding source contract');
