'use strict';

const fs=require('fs');
const assert=require('assert');

const admin=fs.readFileSync('super-admin.php','utf8');
const chat=fs.readFileSync('adimbot-chat-ui.js','utf8');
const index=fs.readFileSync('index.php','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

for(const forbidden of [
  'paketler.php','lisans-yenilemeleri.php','demo-satis.php',
  'ticari-finans.php','ticari-dashboard.php','ticari-belgeler.php',
  'ticari-mutabakat','tahsilat-takvimi.php','tahsilat-risk.php'
]){
  assert(!admin.includes(forbidden),'super admin still exposes commercial module: '+forbidden);
}

for(const required of [
  'kurumlar.php?sekme=yoneticiler',
  'kurumlar.php?sekme=ogretmenler',
  'kurumlar.php?sekme=ogrenciler',
  'kurumlar.php?sekme=veliler',
  'global-eslestirme.php',
  'yasal-belgeler.php',
  'yonetici-yetkileri.php',
  'adimbot-ayarlari.php',
  'sistem-durum.php',
  'guncelleme.php'
]){
  assert(admin.includes(required),'core admin link missing: '+required);
}
assert(admin.includes('Açık Rıza & Yasal Metinler'));
assert(admin.includes('Ders, soru, içerik ve ödev hazırlayacak öğretmen hesaplarını yönet.'));

assert(!chat.includes('🔊 Tekrar dinle'));
assert(!chat.includes('data-adimbot-chat-clear'));
assert(!chat.includes('adb-chat-suggestions'));
assert(!chat.includes('saniye kaldı'));
assert(chat.includes("recognition.interimResults=true"));
assert(chat.includes('Date.now()-recordingSession.lastSpeechAt>=700'));
assert(chat.includes('Sustuktan hemen sonra sorun otomatik gönderilir.'));
assert(index.includes('student-progress-persistence.js'));
assert(!index.includes('test-progress-reset.js'));

assert(workflow.includes('node tests/adimbot-microphone-flow.cjs'));
assert(workflow.includes('node tests/super-admin-core-scope-210.cjs'));

assert.strictEqual(version.version,'1.2.83');
assert.strictEqual(version.release_revision,1);
assert.strictEqual(release.version,version.version);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.version,version.version);
assert.strictEqual(manifest.release_revision,version.release_revision);
assert(manifest.files.includes('tests/super-admin-core-scope-210.cjs'));
assert(manifest.files.length>=915);
assert.deepStrictEqual(manifest.files,[...manifest.files].sort());

console.log('PASS: super admin is education-focused and AdimBot voice UI stays instant and minimal');
