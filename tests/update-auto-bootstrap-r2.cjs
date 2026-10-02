'use strict';

const fs=require('fs');
const assert=require('assert');

const page=fs.readFileSync('guncelleme.php','utf8');
const auto=fs.readFileSync('guncelleme-auto.js','utf8');
const workflow=fs.readFileSync('.github/workflows/quality.yml','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const release=JSON.parse(fs.readFileSync('update-release.json','utf8'));
const manifest=JSON.parse(fs.readFileSync('update-managed-files.json','utf8'));

assert(/<script src="guncelleme-auto\.js\?v=[^"]+"><\/script>/.test(page));
assert(page.includes("window.dispatchEvent(new Event('ilkadim-updater-ready'))"));
assert(!page.includes('\n    checkUpdate();\n'));
assert(auto.includes("const STORAGE_KEY='ilkadim:auto-update:v2'"));
assert(auto.includes("await u.request('check')"));
assert(auto.includes("await u.request('install')"));
assert(auto.includes("window.location.replace(nextUrl.toString())"));
assert(auto.includes("MAX_HANDOFF_RETRIES=3"));
assert(auto.includes("MAX_RELEASES=50"));
assert(auto.includes("function identityReached("));

const versionParts=String(version.version).split('.').map(Number);
assert(versionParts.length===3 && versionParts[0]===1 && versionParts[1]===2 && versionParts[2]>=79);
if(version.version==='1.2.79') assert(Number(version.release_revision)>=2);

assert.strictEqual(release.version,version.version);
assert.strictEqual(release.release_revision,version.release_revision);
assert.strictEqual(manifest.version,version.version);
assert.strictEqual(manifest.release_revision,version.release_revision);
assert(manifest.files.includes('guncelleme-auto.js'));
assert(manifest.files.includes('RELEASE-1.2.79-R2.md'));
assert(manifest.files.includes('tests/update-auto-bootstrap-r2.cjs'));
assert(manifest.files.length>=901);
assert.deepStrictEqual(manifest.files,[...manifest.files].sort());
assert.strictEqual(new Set(manifest.files).size,manifest.files.length);
assert(workflow.includes('node tests/update-auto-bootstrap-r2.cjs'));

console.log('PASS: automatic updater bootstrap remains compatible with current and later 1.2.x releases');
