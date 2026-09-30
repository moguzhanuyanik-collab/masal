'use strict';
const fs=require('fs');
const assert=require('assert');

const a=JSON.parse(fs.readFileSync('quality/update-quality-500.json','utf8'));
const b=JSON.parse(fs.readFileSync('quality/update-quality-500-v2.json','utf8'));
const index=JSON.parse(fs.readFileSync('quality/quality-index.json','utf8'));
const md=fs.readFileSync('QUALITY-500-V2.md','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));

assert.strictEqual(a.items.length,500);
assert.strictEqual(b.items.length,500);
assert.strictEqual(b.items[0].id,'Q501');
assert.strictEqual(b.items[499].id,'Q1000');
const all=[...a.items,...b.items];
assert.strictEqual(all.length,1000);
assert.strictEqual(new Set(all.map(x=>x.id)).size,1000);
assert.deepStrictEqual(all.map(x=>x.id),Array.from({length:1000},(_,i)=>'Q'+String(i+1).padStart(3,'0')));
assert.strictEqual(b.categories.length,10);
assert(b.categories.every(x=>x.count===50));
assert.strictEqual(b.items.filter(x=>x.status==='implemented').length,12);
assert.strictEqual(b.items.filter(x=>x.status==='planned').length,488);
assert(b.items.every(x=>['P0','P1','P2'].includes(x.priority)));
assert(b.items.every(x=>typeof x.acceptance==='string' && x.acceptance.length>30));
assert(index.total>=1000);
assert(index.implemented>=52);
assert(index.planned>=948);
assert(Array.isArray(index.catalogs));
assert(index.catalogs.some(x=>x.path==='quality/update-quality-500.json' && x.range==='Q001-Q500'));
assert(index.catalogs.some(x=>x.path==='quality/update-quality-500-v2.json' && x.range==='Q501-Q1000'));
assert(md.includes('Q501') && md.includes('Q1000'));
assert.strictEqual(b.version,'1.1.112');
assert.strictEqual(b.release_revision,1);
assert(typeof index.version==='string' && index.version.length>0);
assert(Number.isInteger(index.release_revision) && index.release_revision>=1);

console.log('PASS: Q001-Q1000 quality catalog continuity');
