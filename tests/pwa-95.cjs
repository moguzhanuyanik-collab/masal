'use strict';

const fs=require('fs');
const assert=require('assert');

const sw=fs.readFileSync('service-worker.js','utf8');
const offlineHtml=fs.readFileSync('offline-v4.html','utf8');
const offlineJs=fs.readFileSync('offline-v4.js','utf8');
const pwa=fs.readFileSync('pwa-v4.js','utf8');
const index=fs.readFileSync('index.php','utf8');
const bootstrap=fs.readFileSync('api/bootstrap.js.php','utf8');
const logout=fs.readFileSync('logout.php','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));

assert(sw.includes("const CACHE='ilkadim-static-1.1.95';"));
assert(sw.includes("const ALLOWED_PATHS="));
assert(sw.includes("caches.match(req,{ignoreSearch:true})"));
assert(sw.includes("'./offline-v4.js'"));
assert(sw.includes("'./pwa-store.js'"));
assert(sw.includes("'./v4-offline.css'"));
assert(!sw.includes("offline-v4.js?v="));
assert(!sw.includes("pwa-store.js?v="));

assert(offlineHtml.includes('./v4-offline.css?v=1.1.95'));
assert(offlineHtml.includes('./pwa-store.js?v=1.1.95'));
assert(offlineHtml.includes('./offline-v4.js?v=1.1.95'));

assert(index.includes("$assetVersion=static function"));
assert(index.includes("styles.css?v=<?=$assetVersion('styles.css')?>"));
assert(index.includes("app-runtime.js?v=<?=$assetVersion('app-runtime.js')?>"));
assert(index.includes("pwa-v4.js?v=<?=$assetVersion('pwa-v4.js')?>"));
assert(index.includes("manifest.webmanifest?v=<?=$assetVersion('manifest.webmanifest')?>"));
assert(!index.includes('pwa-v4.js?v=1.0.34'));
assert(!index.includes('manifest.webmanifest?v=1.0.46'));

assert(bootstrap.includes("error_log('[IlkAdim][bootstrap-js] '"));
assert(bootstrap.includes("$error='Öğrenci verileri şu anda veritabanından yüklenemedi.';"));
assert(!bootstrap.includes("$error=$e->getMessage();"));

assert(pwa.includes("çevrimdışı paket ve bekleyen kayıtlar bu cihazdan silinecek"));
assert(pwa.includes("localStorage.removeItem('ilkadim-pwa34-active-student')"));
assert(logout.includes("indexedDB.deleteDatabase('ilkadim-pwa34')"));

assert(offlineJs.includes("const y=d.getFullYear();"));
assert(offlineJs.includes("const m=String(d.getMonth()+1).padStart(2,'0');"));
assert(!offlineJs.includes("toISOString().slice(0,10)"));

const vp=String(version.version).split('.').map(Number);
assert(vp.length===3 && vp.every(Number.isFinite),'version must be semver-like');
assert(vp[0]>1 || (vp[0]===1 && vp[1]>1) || (vp[0]===1 && vp[1]===1 && vp[2]>=95),'version must be 1.1.95 or newer');

console.log('1.1.95 PWA hardening checks passed');
