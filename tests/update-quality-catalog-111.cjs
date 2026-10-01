'use strict';
const fs=require('fs');
const assert=require('assert');

const catalog=JSON.parse(fs.readFileSync('quality/update-quality-500.json','utf8'));
const md=fs.readFileSync('QUALITY-500.md','utf8');
const version=JSON.parse(fs.readFileSync('version.json','utf8'));

assert.strictEqual(catalog.format,1);
assert.strictEqual(catalog.total,500);
assert.strictEqual(catalog.items.length,500);
assert.strictEqual(new Set(catalog.items.map(x=>x.id)).size,500);
assert.deepStrictEqual(catalog.items.map(x=>x.id),Array.from({length:500},(_,i)=>'Q'+String(i+1).padStart(3,'0')));
assert.strictEqual(catalog.categories.length,10);
assert(catalog.categories.every(x=>x.count===50));
assert.strictEqual(catalog.items.filter(x=>x.status==='implemented').length,40);
assert.strictEqual(catalog.items.filter(x=>x.status==='planned').length,460);
assert(catalog.items.every(x=>['P0','P1','P2'].includes(x.priority)));
assert(catalog.items.every(x=>typeof x.acceptance==='string' && x.acceptance.length>20));
assert(md.includes('Q001') && md.includes('Q500'));
assert.strictEqual(catalog.version,version.version);
assert.strictEqual(catalog.release_revision,version.release_revision);

console.log('PASS: 500-item quality/update catalog contract');
