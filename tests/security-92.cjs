'use strict';

const fs=require('fs');
const assert=require('assert');

const auth=fs.readFileSync('src/auth.php','utf8');
const login=fs.readFileSync('login.php','utf8');
const migration=fs.readFileSync('database/migrations/063_login_rate_limit.sql','utf8');
const groq=fs.readFileSync('src/adimbot_groq.php','utf8');
const ai=fs.readFileSync('api/adimbot-ai.php','utf8');
const voice=fs.readFileSync('api/adimbot-transcribe.php','utf8');
const updater=fs.readFileSync('src/updater.php','utf8');

assert(auth.includes("$threshold=$scope==='email'?5:30;"));
assert(auth.includes("$blockSeconds=$scope==='email'?600:900;"));
assert(auth.includes("if(trim($ip)!=='')"));
assert(auth.includes("DELETE FROM giris_guvenlik WHERE kapsam='email'"));
assert(login.includes("$passwordVerified=false;"));
assert(login.includes("$passwordVerified=is_array($user);"));
assert(login.includes("auth_login_rate_failure($pdo,$email,$ip)"));
assert(migration.includes("CREATE TABLE IF NOT EXISTS giris_guvenlik"));
assert(groq.includes("function adimbot_retry_after_seconds"));
assert(groq.includes("CURLOPT_HEADERFUNCTION"));
assert(ai.includes("adimbot_ai_provider_error($status,$curlErrno,$responseBody,$providerRetryAfter)"));
assert(ai.includes("adimbot_ai_embedded_error($decoded['error'],$providerRetryAfter)"));
assert(voice.includes("voice_provider_error($status,$body,$providerRetryAfter)"));
assert(updater.includes("LOCK_EX|LOCK_NB"));
assert(updater.includes("flock($updateLock,LOCK_UN)"));

console.log('1.1.92 security source checks passed');
