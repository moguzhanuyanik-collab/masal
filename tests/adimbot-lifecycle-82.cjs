const fs=require('node:fs'),vm=require('node:vm'),assert=require('node:assert/strict');
const source=fs.readFileSync(__dirname+'/../adimbot-student.js','utf8');
function harness(){
 let clock=0,id=0,jobs=new Map(),calls=[],events=[],classes=new Set();
 const style={setProperty(){},removeProperty(){}};
 const root={classList:{add(...v){v.forEach(x=>classes.add(x));},remove(...v){v.forEach(x=>classes.delete(x));},contains(x){return classes.has(x);},toggle(x,on){on?classes.add(x):classes.delete(x);}},style,dataset:{},querySelector(){return null;}};
 const engine={getVoices:()=>[{lang:'tr-TR',default:true}],speak(u){calls.push(u);},cancel(){},pause(){},resume(){},addEventListener(){}};
 const c={window:{speechSynthesis:engine,SpeechSynthesisUtterance:class{},dispatchEvent(e){events.push(e);}},SpeechSynthesisUtterance:class{constructor(text){this.text=text;}},CustomEvent:class{constructor(type,options){this.type=type;this.detail=options?.detail;}},root,bubble:{textContent:''},mouth:{style},preferences:{sound:true,rate:.95,minimized:false},motionPreference:{matches:false,addEventListener(type,f){this.change=f;}},state:{speaking:false},setState(v){Object.assign(c.state,v);},performance:{now:()=>clock},setTimeout(fn,ms){jobs.set(++id,{fn,ms});return id;},clearTimeout(i){jobs.delete(i);},console,dragging:false,pageSuspended:false,clearIdlePower(){},scheduleIdlePower(){},activeUtterance:null,activeSpeechToken:0,activeOnEnd:null,activeOnStart:null,speechStarted:false,speechPaused:false,longSpeechToken:0,longSpeechTimer:0,nextSpeechChunk:null,gapRemaining:0,gapStartedAt:0,speechLaunchTimer:0,activeSequenceDone:null,mouthRestTimer:0,lastBoundaryIndex:-1,activeSpeechRate:.95,pendingSpeechLaunch:null,speechTimeoutRemaining:0,speechTimeoutStartedAt:0,timer:0,gestureLoopTimer:0,gestureReleaseTimer:0,settleTimer:0,gestureIndex:0,lastGestureAt:0};
 vm.createContext(c);
 const start=source.indexOf('  const gestureClasses='),end=source.indexOf('  const viewportBounds=');
 vm.runInContext(source.slice(start,end)+'\nthis.api={speak,speakLong,stopSpeaking,pauseSpeaking,resumeSpeaking,triggerSpeechGesture,scheduleSpeechGestures};',c);
 function tick(ms){clock+=ms;const ready=[...jobs].filter(([,j])=>j.ms<=ms);for(const [i,j] of ready){if(jobs.delete(i))j.fn();}}
 return {c,api:c.api,calls,events,classes,jobs,tick,engine};
}
// 1: cancelled silent callbacks cannot finish or start a newer sequence.
{const h=harness();let ended=0;h.api.speak('Eski',{voice:false,onEnd(){ended++;}});h.api.stopSpeaking();h.tick(100);assert.equal(ended,0);}
// 2: delayed old sequence completion never schedules a new chunk.
{const h=harness();h.api.speakLong('Bir. İki.');const old=h.calls[0];h.api.speak('Yeni');old.onend();h.tick(300);assert.equal(h.calls.length,2);assert.equal(h.calls[1].text,'Yeni');}
// 3: cancelling an inter-sentence gap completes exactly once.
{const h=harness();let results=[];h.api.speakLong('Bir. İki.',{onEnd:x=>results.push(x)});h.calls[0].onend();h.api.stopSpeaking();h.api.stopSpeaking();h.tick(300);assert.equal(results.length,1);assert.equal(results[0].cancelled,true);}
// 4: preprocessing precedes chunking; the original visible message survives.
{const h=harness();h.api.speakLong('**Merhaba** 👋. 2 + 3 = 5.');assert.equal(h.calls[0].text,'Merhaba .');assert.equal(h.c.bubble.textContent,'**Merhaba** 👋. 2 + 3 = 5.');h.calls[0].onend();h.tick(240);assert.equal(h.calls[1].text,'2 artı 3 eşittir 5.');}
// 5,10: late Turkish voice loading and pause before launch.
{const h=harness();h.engine.getVoices=()=>[];h.api.speak('Merhaba');assert.equal(h.api.pauseSpeaking(),true);h.tick(200);assert.equal(h.calls.length,0);h.engine.getVoices=()=>[{lang:'tr-TR'}];assert.equal(h.api.resumeSpeaking(),true);assert.equal(h.calls.length,1);}
{const h=harness();h.engine.getVoices=()=>[{lang:'en-US'}];h.api.speak('Merhaba');assert.equal(h.calls.length,0);h.tick(1100);assert.equal(h.calls.length,1);}
// 6: changing the preference does not change an active utterance deadline/cadence.
{const h=harness();h.api.speak('Uzun kelimeler');let u=h.calls[0];h.c.preferences.rate=1.15;u.onstart();assert.equal(u.rate,.95);assert.equal(h.c.speechTimeoutRemaining,Math.max(5000,u.text.length*160/.95));}
// 7,8,14: sentence events/invalid indexes ignored, punctuation closes mouth.
{const h=harness();h.api.speak('Merhaba.');const u=h.calls[0];u.onstart();u.onboundary({name:'sentence',charIndex:0});assert.equal(h.c.lastBoundaryIndex,-1);u.onboundary({name:'word',charIndex:-1});assert.equal(h.c.lastBoundaryIndex,-1);u.onboundary({name:'word',charIndex:0});assert.equal(h.c.lastBoundaryIndex,0);const count=h.jobs.size;u.onboundary({name:'word',charIndex:0});assert.equal(h.jobs.size,count);h.tick(500);assert.equal(h.classes.has('adb-mouth-rest'),true);u.onend();assert.equal(h.classes.has('adb-mouth-rest'),false);}
// 9: constructor failure is handled and reported.
{const h=harness();h.c.SpeechSynthesisUtterance=class{constructor(){throw Error('unsupported');}};assert.equal(h.api.speak('Merhaba'),false);assert.equal(h.events.find(e=>e.type==='adimbot:speech-error').detail.reason,'unsupported');}
// 11: engine errors have useful fixed Turkish messages.
{for(const reason of ['network','not-allowed','audio-busy','audio-hardware','language-unavailable','voice-unavailable','text-too-long']){const h=harness();h.api.speak('Merhaba');h.calls[0].onerror({error:reason});const error=h.events.find(e=>e.type==='adimbot:speech-error');assert.equal(error.detail.reason,reason);assert.notEqual(error.detail.message,'Türkçe seslendirme başlatılamadı.');assert.equal(h.c.state.speaking,false);}}
// 12: speaking survives drag state and gesture scheduling resumes.
{const h=harness();h.api.speak('Merhaba');const u=h.calls[0];u.onstart();h.c.dragging=true;h.api.scheduleSpeechGestures(u);h.tick(900);h.c.dragging=false;h.api.scheduleSpeechGestures(u);assert.ok(h.c.gestureLoopTimer);assert.equal(h.c.activeUtterance,u);}
// 13: dynamic reduced motion clears active speech gestures.
{const h=harness();h.api.speak('Merhaba');h.calls[0].onstart();h.c.motionPreference.matches=true;h.c.motionPreference.change({matches:true});assert.equal([...h.classes].some(x=>x.startsWith('adb-gesture-')),false);h.api.triggerSpeechGesture('left',true);assert.equal(h.classes.has('adb-gesture-left'),false);}
// 15: pause applies to visual head and eyelids; reduced motion avoids opacity animation.
const css=fs.readFileSync(__dirname+'/../adimbot-student.css','utf8');
assert.match(css,/adb-is-speech-paused \.adb-visual,[\s\S]*?adb-is-speech-paused \.adb-lid\{animation-play-state:paused!important\}/);
assert.match(css,/@media\(prefers-reduced-motion:reduce\)\{\.adb-mouth-open\{transition:none\}\}/);
console.log('PASS: 15 lifecycle, text, error and animation scenarios; synthetic voice engine only.');
