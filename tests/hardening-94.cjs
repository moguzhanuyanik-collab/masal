'use strict';

const fs=require('fs');
const assert=require('assert');

const install=fs.readFileSync('install.php','utf8');
const updater=fs.readFileSync('src/updater.php','utf8');
const updatePage=fs.readFileSync('guncelleme.php','utf8');
const activities=fs.readFileSync('api/activities.php','utf8');
const state=fs.readFileSync('api/state.php','utf8');
const kurumApi=fs.readFileSync('api/kurumlar-modulu.php','utf8');
const login=fs.readFileSync('login.php','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));

assert(install.includes("database/schema.sql"));
assert(install.includes("database/seed.sql"));
assert(install.includes("run_sql_file($pdo,$schemaPath)"));
assert(install.includes("run_sql_file($pdo,$seedPath)"));
assert(install.indexOf("run_sql_file($pdo,$seedPath)") < install.indexOf("$configPath=$root.'/config/local.php'"));
assert(install.includes("file_put_contents($configTmp,$local,LOCK_EX)"));
assert(install.includes("@rename($configTmp,$configPath)"));
assert(install.includes("$e instanceof PDOException"));

assert(updater.includes("function ensure_runtime_storage_guard"));
assert(updater.includes("Require all denied"));
assert(updater.includes("$rel==='config/local.php'"));
assert(updater.includes("$rel==='.env'"));
assert(updater.includes("str_starts_with($rel,'storage/')"));
assert(updater.includes("Guncelleme hatayla sonlandi. Ayrintilar sunucu gunlugune kaydedildi."));
assert(!updater.includes("execute([$e->getMessage(),$logId])"));

assert(updatePage.includes("update_public_error_message"));
assert(updatePage.includes("ensure_runtime_storage_guard(__DIR__)"));
assert(updatePage.includes("Sunucuda yalnızca bir önceki uygulama sürümünün tek yedeği tutulur."));

assert(!activities.includes("'detail'=>$e->getMessage()"));
assert(!state.includes("'detail'=>$e->getMessage()"));
assert(!kurumApi.includes("['ok'=>false,'message'=>$e->getMessage()]"));
assert(login.includes("catch (PDOException $e)"));
assert(login.includes("catch (RuntimeException $e)"));

assert(/^1\.1\.(?:9[4-9]|[1-9][0-9]{2,})$/.test(String(version.version)) || /^1\.2\.\d+$/.test(String(version.version)),'version must be 1.1.94 or newer');

console.log('1.1.94 hardening checks passed');
