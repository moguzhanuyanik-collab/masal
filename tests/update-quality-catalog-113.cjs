'use strict';
const fs=require('fs');
const assert=require('assert');
const a=JSON.parse(fs.readFileSync('quality/update-quality-500.json','utf8'));
const b=JSON.parse(fs.readFileSync('quality/update-quality-500-v2.json','utf8'));
const c=JSON.parse(fs.readFileSync('quality/update-quality-500-v3.json','utf8'));
const index=JSON.parse(fs.readFileSync('quality/quality-index.json','utf8'));
const version=JSON.parse(fs.readFileSync('version.json','utf8'));
const all=[...a.items,...b.items,...c.items];

assert.strictEqual(c.items.length,500);
assert.strictEqual(c.items[0].id,'Q1001');
assert.strictEqual(c.items[499].id,'Q1500');
assert.strictEqual(all.length,1500);
assert.strictEqual(new Set(all.map(x=>x.id)).size,1500);
for(let i=0;i<1500;i++){
  const n=i+1;
  const expected='Q'+String(n).padStart(n>=1000?4:3,'0');
  assert.strictEqual(all[i].id,expected);
}
assert.strictEqual(c.categories.length,10);
assert(c.categories.every(x=>x.count===50));
assert.strictEqual(c.items.filter(x=>x.status==='implemented').length,14);
assert.strictEqual(c.items.filter(x=>x.status==='planned').length,486);
assert.strictEqual(index.total,1500);
assert.strictEqual(index.implemented,66);
assert.strictEqual(index.planned,1434);
assert.strictEqual(c.version,'1.1.113');
assert.strictEqual(c.release_revision,1);
assert.strictEqual(index.version,version.version);
assert.strictEqual(index.release_revision,version.release_revision);
console.log('PASS: Q001-Q1500 quality catalog continuity');
