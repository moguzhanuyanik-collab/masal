'use strict';

const fs=require('fs');
const assert=require('assert');

const domain=fs.readFileSync('src/kurum_lisanslari.php','utf8');
const api=fs.readFileSync('api/adimbot-ai.php','utf8');
const page=fs.readFileSync('paketler.php','utf8');
const migration=fs.readFileSync('database/migrations/072_adimbot_kurum_ai_kotasi.sql','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));

assert(domain.includes('function kl_ai_usage_ready('),'AI usage table readiness helper missing');
assert(domain.includes('function kl_ai_quota_institution('),'AI quota institution resolver missing');
assert(domain.includes('function kl_ai_quota_reserve('),'atomic quota reservation missing');
assert(domain.includes("kk.kurum_rolu='ogrenci'"),'quota institution resolution must use student membership');
assert(domain.includes("count($licensed)===1?$licensed[0]:null"),'ambiguous multi-institution users must not be assigned arbitrarily');
assert(domain.includes('LIMIT 1 FOR UPDATE'),'AI quota usage row must be locked atomically');
assert(domain.includes("if($enforced && $used>=$limit)"),'quota exhaustion guard missing');
assert(domain.includes("'reason'=>'quota_exhausted'"),'quota exhaustion result missing');
assert(domain.includes("kullanim_sayisi=?"),'AI usage increment missing');
assert(domain.includes("if(!kl_ai_usage_ready($pdo))"),'missing quota migration must fail open');
assert(domain.includes("return [\n            'tracked'=>false,'enforced'=>false,'blocked'=>false"),'quota errors must not silently hard-lock the application');

assert(api.includes("require_once dirname(__DIR__) . '/src/kurum_lisanslari.php';"),'AdımBot API must load package/license quota domain');
assert(api.includes('$quotaResult=kl_ai_quota_reserve($pdo,$userId,$studentId,$provider,$model);'),'AdımBot provider path must reserve monthly quota');
assert(api.includes("'reason'=>'institution_ai_quota'"),'quota exhausted API reason missing');
assert(api.includes("'quota'=>$quotaPublic"),'AdımBot response must expose public quota state');
assert(api.indexOf('adimbot_rate_limit_check_and_record(') < api.indexOf('$quotaResult=kl_ai_quota_reserve('),
  'short-window rate limit must run before monthly quota reservation');
assert(api.indexOf('$quotaResult=kl_ai_quota_reserve(') < api.indexOf('$request=$provider==='),
  'monthly quota reservation must happen before provider request construction/sending');

assert(page.includes('AI KULLANIM MERKEZİ'),'Super Admin AI usage center missing');
assert(page.includes('kl_ai_usage_summary($pdo,(int)$license[\'kurum_id\'])'),'AI usage center must read institution monthly usage');
assert(page.includes('Kota doldu'),'quota exhausted admin state missing');

assert(migration.includes('CREATE TABLE IF NOT EXISTS adimbot_ai_kullanimlari'),'AI usage migration table missing');
assert(migration.includes('PRIMARY KEY (kurum_id,donem_baslangici)'),'one atomic usage row per institution/month required');
assert(migration.includes('kullanim_sayisi INT UNSIGNED NOT NULL DEFAULT 0'),'usage counter missing');

assert(workflow.includes('node tests/adimbot-license-quota-162.cjs'),'AI quota source regression missing from quality gate');
assert(workflow.includes('php tests/adimbot-license-quota-db-162.php'),'AI quota DB regression missing from quality gate');

assert(version.version.startsWith('1.2.'),'release version must remain in the 1.2.x line');
assert(Number(version.version.split('.')[2])>=37,'AI license quota capability requires 1.2.37 or newer');
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);

for(const path of [
  'RELEASE-1.2.37.md',
  'database/migrations/072_adimbot_kurum_ai_kotasi.sql',
  'tests/adimbot-license-quota-162.cjs',
  'tests/adimbot-license-quota-db-162.php'
]) assert(manifest.files.includes(path),'manifest missing '+path);

console.log('PASS: AdımBot institution monthly AI quota source contract');
