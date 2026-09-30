'use strict';

const fs=require('fs');
const assert=require('assert');

const installer=fs.readFileSync('install.php','utf8');
const updater=fs.readFileSync('guncelleme.php','utf8');
const index=fs.readFileSync('index.php','utf8');
const teacher=fs.readFileSync('ogretmenim.php','utf8');
const transcribe=fs.readFileSync('api/adimbot-transcribe.php','utf8');
const chat=fs.readFileSync('adimbot-chat-ui.js','utf8');
const sw=fs.readFileSync('service-worker.js','utf8');

assert(installer.includes("$locked = is_file($lockFile);"));
assert(installer.includes("hash_equals($installCsrf, (string)($_POST['csrf'] ?? ''))"));
assert(installer.includes('name="csrf" value="<?=h($installCsrf)?>"'));
assert(updater.includes("verify_csrf($csrf)"));
assert(updater.includes("'X-CSRF-Token': csrfToken"));
assert(index.includes("hash_file('sha256',__DIR__.'/adimbot-student.css')"));
assert(teacher.includes("hash_file('sha256',__DIR__.'/adimbot-student.css')"));
assert(transcribe.includes("voice_result(['ok'=>false,'reason'=>'too_long'],422)"));
assert(chat.includes("too_long:'Söylediğin soru biraz uzun oldu."));
assert(sw.includes("const CACHE='ilkadim-static-1.1.91';"));

console.log('1.1.91 hardening source checks passed');
