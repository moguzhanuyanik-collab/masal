const fs=require('node:fs'),vm=require('node:vm'),assert=require('node:assert/strict');
const source=fs.readFileSync(__dirname+'/../adimbot-student.js','utf8');
const context={};vm.createContext(context);
vm.runInContext(source.slice(source.indexOf('  const prepareSpeechText='),source.indexOf('  const speechChunks='))+'this.prepare=prepareSpeechText;',context);
const cases=[
 ['Saat 14:30.','Saat 14 saat 30 dakika.'],
 ['09:00','9 saat 0 dakika'],
 ['%25 ve 12,5%','yüzde 25 ve yüzde 12,5'],
 ['Hava 23°C.','Hava 23 derece Celsius.'],
 ['5cm','5 santimetre'],['2,5 mm','2,5 milimetre'],['3km','3 kilometre'],
 ['4kg','4 kilogram'],['8mg','8 miligram'],['10ml','10 mililitre'],
 ['5 ± 2','5 artı eksi 2'],['2² ve 3³','2 karesi ve 3 küpü'],
 ['- Elma\n* Armut\n• Muz','Elma Armut Muz'],['> Merhaba','Merhaba'],
 ['24:61 ve 123:45','24:61 ve 123:45'],['5cmden ve XML','5cmden ve XML'],
 ['2 > 1','2 büyüktür 1'],['-5°C','-5 derece Celsius'],
 ['Dr. Ayşe 3.14 yazdı.','Dr. Ayşe 3.14 yazdı.'],
 ['**Merhaba** 👋 2 + 2 = 4','Merhaba 2 artı 2 eşittir 4']
];
for(const [input,expected] of cases){assert.equal(context.prepare(input),expected,input);assert.equal(context.prepare(expected),expected,'idempotent '+input);}
console.log('PASS: 20 Turkish notation and unchanged-text cases; all expansions idempotent.');
const harnessSource=fs.readFileSync(__dirname+'/adimbot-lifecycle-82.cjs','utf8');
const harness=new Function('require','__dirname',harnessSource.slice(0,harnessSource.indexOf('// 1:'))+'return harness;')(require,__dirname);
{
 const h=harness();h.api.speak('Baba geldi');const u=h.calls[0];u.onstart();u.onboundary({name:'word',charIndex:0});
 assert.equal(h.classes.has('adb-mouth-rest'),true);h.tick(80);assert.equal(h.classes.has('adb-mouth-rest'),false);
 u.onboundary({name:'word',charIndex:5});assert.equal(h.classes.has('adb-mouth-rest'),false);
 h.api.stopSpeaking();h.tick(200);assert.equal(h.classes.has('adb-mouth-rest'),false);
}
{
 const h=harness();h.c.motionPreference.matches=true;h.api.speak('Baba');const u=h.calls[0];u.onstart();u.onboundary({name:'word',charIndex:0});assert.equal(h.classes.has('adb-mouth-rest'),false);
}
// Mouth scale is observable through the style values, independent of browser audio.
{
 const h=harness(),values={};h.c.mouth.style.setProperty=(k,v)=>values[k]=Number(v);
 h.api.speak('aaaaaaa',{gentle:true});h.calls[0].onboundary({name:'word',charIndex:0});assert.ok(values['--adb-mouth-open-y']<=.96);
 h.api.speak('aaaaaaa');h.calls[1].onboundary({name:'word',charIndex:0});assert.ok(values['--adb-mouth-open-y']>.96);
}
{
 const c={idlePowerTimer:0,pageSuspended:false,preferences:{minimized:false},state:{speaking:false,emotion:'listen'},dragging:false,root:{classList:{add(){c.idle=true;}}},setTimeout(fn){c.callback=fn;return 1;},clearTimeout(){}};
 vm.createContext(c);vm.runInContext(source.slice(source.indexOf('  const scheduleIdlePower='),source.indexOf('  const wakeAdimBot='))+'this.schedule=scheduleIdlePower;',c);
 c.schedule();assert.equal(c.callback,undefined);c.state.emotion='idle';c.schedule();c.state.emotion='transcribe';c.callback();assert.notEqual(c.idle,true);
}
const css=fs.readFileSync(__dirname+'/../adimbot-student.css','utf8');
assert.equal((css.match(/{/g)||[]).length,(css.match(/}/g)||[]).length);
assert.match(css,/max-height:500px/);assert.match(css,/min-height:48px;flex:1 1 48px/);
assert.match(css,/adb-student-widget \*\{transition:none!important/);
assert.match(css,/adb-is-speaking \.adb-lid\{animation-duration:calc/);
assert.match(css,/emotion="think"\] \.adb-lid-right\{animation:adbEmotionThinkBlink/);
console.log('PASS: lip closure, stop/reduced-motion guards, gentle mouth scale, listening idle protection; CSS source checks.');
