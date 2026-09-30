'use strict';
const fs=require('fs');
const assert=require('assert');

const paths=[
  'quality/update-quality-500.json',
  'quality/update-quality-500-v2.json',
  'quality/update-quality-500-v3.json'
];
const catalogs=paths.map(p=>JSON.parse(fs.readFileSync(p,'utf8')));
const index=JSON.parse(fs.readFileSync('quality/quality-index.json','utf8'));
const md=fs.readFileSync('QUALITY-500-V3.md','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));

assert(catalogs.every(c=>c.items.length===500));
const all=catalogs.flatMap(c=>c.items);
assert.strictEqual(all.length,1500);
assert.strictEqual(new Set(all.map(x=>x.id)).size,1500);
assert.deepStrictEqual(all.map(x=>x.id),Array.from({length:1500},(_,i)=>'Q'+String(i+1).padStart(i+1<1000?3:4,'0')));
const third=catalogs[2];
assert.strictEqual(third.items[0].id,'Q1001');
assert.strictEqual(third.items[499].id,'Q1500');
assert.strictEqual(third.categories.length,10);
assert(third.categories.every(x=>x.count===50));
assert.strictEqual(third.items.filter(x=>x.status==='implemented').length,15);
assert.strictEqual(third.items.filter(x=>x.status==='planned').length,485);
assert.strictEqual(index.total,1500);
assert.strictEqual(index.implemented,67);
assert.strictEqual(index.planned,1433);
assert(md.includes('Q1001')&&md.includes('Q1500'));
assert.strictEqual(third.version,'1.1.113');
assert.strictEqual(third.release_revision,1);
assert.strictEqual(index.version,'1.1.113');
assert.strictEqual(index.release_revision,1);
console.log('PASS: Q001-Q1500 quality catalog continuity');
