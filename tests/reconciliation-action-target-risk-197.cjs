'use strict';

const fs=require('fs');
const assert=require('assert');

const actionDomain=fs.readFileSync('src/ticari_mutabakat_aksiyon.php','utf8');
const page=fs.readFileSync('ticari-mutabakat-aksiyon.php','utf8');
const css=fs.readFileSync('ticari-mutabakat-aksiyon.css','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const releaseNote=fs.readFileSync('RELEASE-1.2.72.md','utf8');

assert(actionDomain.includes('function ma_target_risk_context('),
  'action-detail target-risk adapter missing');
assert(actionDomain.includes("function_exists('mi_target_risk_map')"),
  'action detail must reuse 1.2.71 current-owner/current-cycle resolver');
assert(actionDomain.includes('mi_target_risk_map($pdo,$actor,[$caseId])'),
  'action detail must resolve only selected case target context');
assert(actionDomain.includes('function ma_target_notification_label('),
  'target notification label helper missing');
assert(actionDomain.includes('function ma_target_notification_class('),
  'target notification style helper missing');
assert(actionDomain.includes("'okunmadi'=>'Bildirim Okunmadı'"),
  'unread target notification label missing');
assert(actionDomain.includes("'bekliyor'=>'Bildirim Bekliyor'"),
  'pending target notification label missing');
assert(actionDomain.includes("'uygulanmaz'=>'Bildirim Gerekmiyor'"),
  'not-applicable target notification label missing');

assert(page.includes("require __DIR__.'/src/ticari_mutabakat_saglik.php';"),
  'action page target chain missing health domain');
assert(page.includes("require __DIR__.'/src/ticari_mutabakat_performans.php';"),
  'action page target chain missing performance domain');
assert(page.includes("require __DIR__.'/src/ticari_mutabakat_hedef.php';"),
  'action page target chain missing target policy domain');
assert(page.includes("require __DIR__.'/src/ticari_mutabakat_hedef_risk.php';"),
  'action page target chain missing target-risk domain');
assert(page.includes("require __DIR__.'/src/ticari_mutabakat_is_kutusu.php';"),
  'action page must reuse inbox current notification resolver');

assert(page.includes('$targetRisk=$selected?ma_target_risk_context($pdo,$user,$selectedId):null;'),
  'selected-case target-risk context resolution missing');
assert(page.includes('HEDEF-RİSK BAĞLAMI'),'target-risk detail card missing');
assert(page.includes('Güncel Operasyon Hedefi'),'current target context heading missing');
assert(page.includes('Hedef Süre Kullanımı'),'target usage ratio field missing');
assert(page.includes('Döngü Başlangıcı'),'reopen-aware cycle field missing');
assert(page.includes('Bildirim Durumu'),'current notification state field missing');
assert(page.includes('Okunma Zamanı'),'recipient read timestamp field missing');
assert(page.includes('güncel sorumlu + güncel reopen döngüsü + güncel hedef-risk sinyaline ait bildirim'),
  'pending notification explanation must state current-owner/current-cycle/current-signal semantics');
assert(page.includes('recipient kaydında henüz okunmamış'),
  'unread recipient explanation missing');
assert(page.includes('Hedef Risk Bildirimleri →'),
  'action detail target notification center link missing');
assert(page.includes('Bildirim Sağlığı →'),
  'action detail notification health link missing');

assert(!page.includes("name="action" value="target"),
  'target-risk detail must not add a new write POST action');
assert(!page.includes("name="action" value="hedef"),
  'target-risk detail must not mutate target policy or notification state');
assert(css.includes('.ma-target-context'),'target-risk context styles missing');
assert(css.includes('.ma-target-grid'),'target-risk grid styles missing');

assert(workflow.includes('node tests/reconciliation-action-target-risk-197.cjs'),
  '197 source regression missing from quality gate');
assert(workflow.includes('php tests/reconciliation-action-target-risk-db-197.php'),
  '197 MariaDB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in 1.2.x');
assert(Number(version.version.split('.')[2])>=72,'action-detail target-risk integration requires 1.2.72 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert(releaseNote.includes('Migration zinciri'), 'release note migration chain statement missing');
assert(releaseNote.includes('090'), '1.2.72 must preserve migration chain 090');

for(const path of [
  'RELEASE-1.2.72.md',
  'tests/reconciliation-action-target-risk-197.cjs',
  'tests/reconciliation-action-target-risk-db-197.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

assert(!manifest.files.includes('database/migrations/091_mutabakat_aksiyon_hedef_risk.sql'),
  'read-only action-detail integration must not invent migration 091');

console.log('PASS: reconciliation action detail reuses current-owner/current-cycle target-risk notification context');
