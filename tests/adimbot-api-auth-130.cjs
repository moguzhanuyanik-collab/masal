'use strict';

const fs=require('fs');
const assert=require('assert');

const ai=fs.readFileSync('api/adimbot-ai.php','utf8');
const voice=fs.readFileSync('api/adimbot-transcribe.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

for (const [name,source] of [['chat',ai],['voice',voice]]) {
  const bootstrap=source.indexOf('/src/bootstrap.php');
  const auth=source.indexOf('/src/auth.php');
  assert(bootstrap>=0 && auth>bootstrap, name+' endpoint must bootstrap DB/config before auth');
  assert(source.includes('$user=authenticated_user();'), name+' endpoint must revalidate the live account');
  assert(source.includes("auth_effective_role($user)!=='ogrenci'"), name+' endpoint must enforce current effective student role');
  assert(source.includes('auth_student_id_for_user($pdo,'), name+' endpoint must resolve an active student profile from DB');
  assert(!source.includes("$_SESSION['aktif_rol'] ??"), name+' endpoint must not authorize from stale role session state');
}

assert(ai.includes("adimbot_rate_limit_check_and_record(\n            $pdo,\n            'chat',"));
assert(voice.includes("adimbot_rate_limit_check_and_record(\n            $pdo,\n            'voice',\n            $studentId,"));
assert(workflow.includes('for file in tests/adimbot-*.cjs; do'));
assert(/^1\.2\.\d+$/.test(String(version.version)));
assert.strictEqual(release.version,version.version);
assert.strictEqual(manifest.version,version.version);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.release_revision,version.release_revision);
assert(manifest.files.includes('tests/adimbot-api-auth-130.cjs'));
assert(manifest.files.includes('RELEASE-1.2.4.md'));

console.log('PASS: AdımBot live-account auth and persistent DB rate-limit contract');
