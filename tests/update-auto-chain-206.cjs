'use strict';

const fs=require('fs');
const assert=require('assert');

const page=fs.readFileSync('guncelleme.php','utf8');
const auto=fs.readFileSync('guncelleme-auto.js','utf8');
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

assert(page.includes('<script src="guncelleme-auto.js?v=1.2.80"></script>'));
assert(page.includes("window.dispatchEvent(new Event('ilkadim-updater-ready'))"));
assert(auto.includes("await u.request('check')"));
assert(auto.includes("await u.request('install')"));
assert(auto.includes("window.location.replace(nextUrl.toString())"));
assert(auto.includes("MAX_RELEASES=50"));
assert(manifest.files.includes('guncelleme-auto.js'));
assert(manifest.files.includes('tests/update-auto-chain-206.cjs'));

console.log('PASS: automatic updater survives 1.2.80 release transition');
