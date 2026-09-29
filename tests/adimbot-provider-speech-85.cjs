const fs=require('node:fs'),vm=require('node:vm'),assert=require('node:assert/strict');
const bridge=fs.readFileSync(__dirname+'/../adimbot-ai-bridge.js','utf8'),source=fs.readFileSync(__dirname+'/../adimbot-student.js','utf8'),chat=fs.readFileSync(__dirname+'/../adimbot-chat-ui.js','utf8');
function aiHarness(fetch){let id=0,jobs=new Map();const c={window:{ILKADIM_CSRF_TOKEN:'test_csrf',dispatchEvent(){}},navigator:{onLine:true},CustomEvent:class{},AbortController,Date,Error,TypeError,fetch,setTimeout(f,ms){jobs.set(++id,{f,ms});return id;},clearTimeout(i){jobs.delete(i);}};vm.createContext(c);vm.runInContext(bridge,c);return {c,api:c.window.AdimBotAI,jobs};}
const old=fs.readFileSync(__dirname+'/adimbot-lifecycle-82.cjs','utf8');
const speechHarness=vm.runInNewContext(old.slice(old.indexOf('function harness(){'),old.indexOf('// 1:'))+'harness',{source,vm,console});
async function run(){
 // 1: timeout during body parsing keeps its diagnosis.
 {let rejectBody;const h=aiHarness(async()=>({ok:true,status:200,json:()=>new Promise((_,r)=>rejectBody=r)}));const p=h.api.ask('Merhaba');await new Promise(setImmediate);[...h.jobs.values()][0].f();rejectBody(Object.assign(Error('abort'),{name:'AbortError'}));const r=await p;assert.equal(r.reason,'timeout');assert.equal(h.jobs.size,0);}
 // 2: malformed quota response retains numeric retry header.
 {const h=aiHarness(async()=>({ok:false,status:429,headers:{get:()=> '27'},json:async()=>{throw Error('bad json');}}));const r=await h.api.ask('Merhaba');assert.equal(r.reason,'provider_rate_limit');assert.equal(r.retryAfter,27);}
 // 3: invalid payload types are rejected rather than spoken.
 for(const text of [{secret:'hidden'},['metin'],null,5,'']){const h=aiHarness(async()=>({ok:true,status:200,json:async()=>({ok:true,text})}));const r=await h.api.ask('Merhaba');assert.equal(r.reason,'invalid_response');assert.doesNotMatch(r.text,/hidden|object Object/);}
 // 4: HTTP-date retry header survives provider error.
 {const date=new Date(Date.now()+30000).toUTCString();const h=aiHarness(async()=>({ok:false,status:429,headers:{get:()=>date},json:async()=>({ok:false,reason:'provider_rate_limit'})}));const r=await h.api.ask('Merhaba');assert.ok(r.retryAfter>=29&&r.retryAfter<=30);}
 // 5: cancellation wins even if a mocked provider returns late success.
 {let resolveBody;const h=aiHarness(async()=>({ok:true,status:200,json:()=>new Promise(r=>resolveBody=r)}));const ctl=new AbortController();const p=h.api.ask('Merhaba',{},[],{signal:ctl.signal});await new Promise(setImmediate);ctl.abort();resolveBody({ok:true,text:'Geç yanıt'});const r=await p;assert.equal(r.reason,'cancelled');assert.doesNotMatch(r.text,/Geç yanıt/);}
 // Existing child-safety regressions remain enabled and pass.
 {const h=aiHarness(()=>{throw Error('unexpected network');});for(const [key,value] of Object.entries(h.api.selfTest()))assert.equal(value,true,key);}
 // 6,7: execute actual offline/pagehide callbacks.
 {let cancelled=0;const status={textContent:'',dataset:{}};const c={status,navigator:{onLine:false},chatRequest:{},voiceSession:null,voiceRequestController:null,chatBusy:true,cancelChat:restore=>{assert.equal(restore,true);cancelled++;},stopVoice(){},window:{addEventListener(type,fn){if(type==='pagehide')this.hide=fn;}}};vm.createContext(c);const a=chat.indexOf('    const syncConnection='),b=chat.indexOf("    input?.addEventListener('compositionstart'",a);vm.runInContext(chat.slice(a,b)+'this.sync=syncConnection;',c);c.sync();assert.equal(cancelled,1);const start=chat.indexOf("    window.addEventListener('pagehide',()=>{"),end=chat.indexOf('    syncConnection();',start);vm.runInContext(chat.slice(start,end),c);c.window.hide();assert.equal(cancelled,2);}
 // 8: reduced motion never creates a gesture-loop timer.
 {const h=speechHarness();h.c.motionPreference.matches=true;h.api.speak('Merhaba');h.calls[0].onstart();assert.equal(h.c.gestureLoopTimer,0);}
 // 9: the real gesture handler restarts only arm animation without reading layout.
 {const h=speechHarness();let restarted=0;h.c.root.querySelector=()=>({getAnimations:()=>[{set currentTime(v){assert.equal(v,0);restarted++;}}]});Object.defineProperty(h.c.root,'offsetWidth',{get(){throw Error('forced layout');}});h.api.speak('Merhaba');h.calls[0].onstart();assert.ok(restarted>0);}
 // 10: queued utterance can pause before onstart; delayed start stays paused.
 {const h=speechHarness();h.api.speak('Merhaba');const u=h.calls[0];assert.equal(h.api.pauseSpeaking(),true);u.onstart();assert.equal(h.c.state.speaking,false);assert.equal(h.c.state.paused,true);h.api.resumeSpeaking();assert.equal(h.c.state.speaking,true);assert.equal(h.c.state.paused,false);}
 // 11: an onStart callback opening a new speech does not lose the new watchdog.
 {const h=speechHarness();h.api.speak('Eski',{onStart(){h.api.speak('Yeni');}});h.calls[0].onstart();const watchdog=[...h.jobs.values()].filter(j=>j.ms===6000);assert.equal(watchdog.length,1);assert.equal(h.c.activeUtterance,h.calls[1]);}
 // 12: emoji-only long message remains visible and finishes cleanly.
 {const h=speechHarness();let result;assert.equal(h.api.speakLong('👋',{onEnd:r=>result=r}),true);assert.equal(h.c.bubble.textContent,'👋');assert.equal(h.calls.length,0);assert.equal(result.cancelled,false);}
 // 13: only Markdown link caption is spoken; original display preserved.
 {const h=speechHarness();h.api.speak('[Başlık](https://example.com/path)');assert.equal(h.calls[0].text,'Başlık');assert.equal(h.c.bubble.textContent,'[Başlık](https://example.com/path)');}
 // 14: decomposed and composed Turkish letters produce identical cadence.
 {const a=speechHarness(),b=speechHarness();a.api.speak('go\u0308r');b.api.speak('gör');assert.equal(a.calls[0].text,b.calls[0].text);const start=source.indexOf('  const tuneMouthForWord='),end=source.indexOf('  const speech=',start);vm.runInContext('this.tune=tuneMouthForWord;',a.c);vm.runInContext('this.tune=tuneMouthForWord;',b.c);a.c.tune('go\u0308r',0);b.c.tune('gör',0);assert.equal(a.c.mouth.style.animationDuration,b.c.mouth.style.animationDuration);}
 // 15: comparison symbols get natural Turkish words, no calculation.
 {const h=speechHarness();h.api.speak('5 ≥ 3, 2 < 4, 1 ≠ 0');assert.equal(h.calls[0].text,'5 büyük veya eşittir 3, 2 küçüktür 4, 1 eşit değildir 0');}
 console.log('PASS: provider/body/cancellation/retry, safety self-test, offline cleanup, gesture scheduling and Turkish speech scenarios.');
}
run().catch(e=>{console.error(e);process.exitCode=1;});
