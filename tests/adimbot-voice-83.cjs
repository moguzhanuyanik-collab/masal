const fs=require('node:fs'),vm=require('node:vm'),assert=require('node:assert/strict');
const s=fs.readFileSync(__dirname+'/../adimbot-chat-ui.js','utf8');
function create(){
 let id=0,jobs=new Map(),emotions=[],trackStops=0;
 const mic={disabled:false,textContent:'',setAttribute(k,v){this[k]=v;}};
 const status={textContent:''};
 const c={voiceSession:null,voiceGeneration:1,voiceRequestController:null,voiceRetryUntil:0,modal:{hidden:false,querySelector(){return mic;}},window:{AdimBotStudent:{emote(t){emotions.push(t);},clearEmotion(){emotions.push('idle');}}},Promise,Date,Blob,FormData,AbortController,Error,TypeError,console,mic,status,navigator:{onLine:true},setTimeout(f,ms){jobs.set(++id,{f,ms});return id;},setInterval(f,ms){jobs.set(++id,{f,ms,repeat:true});return id;},clearTimeout(i){jobs.delete(i);},clearInterval(i){jobs.delete(i);},clean:v=>String(v||'').trim()};
 vm.createContext(c);
 vm.runInContext(s.slice(s.indexOf('  const stopTracks='),s.indexOf('  const clean='))+'this.stopVoice=stopVoice;this.stopTracks=stopTracks;this.release=releaseVoiceRequest;this.show=showVoiceEmotion;',c);
 vm.runInContext(s.slice(s.indexOf('  const retryAfterSeconds='),s.indexOf('  const privacySafeText='))+'this.retry=retryAfterSeconds;',c);
 vm.runInContext(s.slice(s.indexOf('  const voiceErrorMessage='),s.indexOf('  const retryableChatReasons=')),c);
 const stream={getTracks(){return [{stop(){trackStops++;}}];}};
 function installRecorder(session){
   c.stream=stream;c.recordingSession=session;c.recorder=session.recorder;c.chunks=session.chunks;c.mime='audio/webm';c.generation=1;c.recognized=t=>{c.transcript=t;};
   const start=s.indexOf('        recorder.ondataavailable='),end=s.indexOf('        recorder.start(1000);',start);
   vm.runInContext(s.slice(start,end),c);
 }
 return {c,mic,status,jobs,emotions,stream,installRecorder,stops:()=>trackStops};
}
async function run(){
 // 1,2,3,5,11: autonomous cleanup, paused stop, independent track shutdown, discard, rejected context close.
 {const h=create();const sess={recorder:{state:'paused',stop(){this.state='inactive';}},stream:h.stream,chunks:[new Blob(['x'])],audioContext:{close:()=>Promise.reject(Error('close'))},timer:1,countdownTimer:2,meterTimer:3,muteTimer:4};for(const key of ['timer','countdownTimer','meterTimer','muteTimer'])sess[key]=h.c.setTimeout(()=>{throw Error('leaked timer');},100);h.c.voiceSession=sess;h.c.stopVoice(true);assert.equal(h.jobs.size,0);assert.equal(sess.recorder.state,'inactive');assert.equal(sess.chunks.length,0);assert.equal(h.stops(),1);assert.equal(h.c.voiceSession,null);await Promise.resolve();}
 {const h=create();let closed=0;h.c.stopTracks({getTracks:()=>[{stop(){throw Error('first');}},{stop(){closed++;}}]});assert.equal(closed,1);}
 // 4: bound memory before appending oversized chunks.
 {const h=create();const sess={recorder:{state:'recording',stop(){this.state='inactive';}},stream:h.stream,chunks:[],bytes:0,startedAt:Date.now()-1000};h.c.voiceSession=sess;h.installRecorder(sess);sess.recorder.ondataavailable({data:new Blob(['a'.repeat(1600001)])});assert.equal(sess.tooLarge,true);assert.equal(sess.chunks.length,0);assert.equal(sess.recorder.state,'inactive');await sess.recorder.onstop();assert.match(h.status.textContent,/çok büyük/);}
 // 6,7: final-only browser results and duplicate/stale events are ignored.
 {const h=create();const recognition={};h.c.recognition=recognition;h.c.browserSession={recognition};h.c.voiceSession=h.c.browserSession;h.c.generation=1;let sent=[];h.c.recognized=t=>sent.push(t);const start=s.indexOf('          recognition.onresult='),end=s.indexOf('          recognition.onerror=',start);vm.runInContext(s.slice(start,end),h.c);recognition.onresult({results:[Object.assign([{transcript:'taslak'}],{isFinal:false})]});assert.equal(sent.length,0);const event={results:[Object.assign([{transcript:'tam soru'}],{isFinal:true})]};recognition.onresult(event);recognition.onresult(event);assert.deepEqual(sent,['tam soru']);}
 // 8: parsing retains lock; timeout survives fetch headers and covers JSON.
 {const h=create();const sess={recorder:{state:'inactive'},stream:h.stream,chunks:[new Blob(['a'.repeat(200)])],bytes:200,startedAt:Date.now()-1000};h.c.voiceSession=sess;h.installRecorder(sess);let resolveJson;h.c.fetch=async()=>({ok:true,json:()=>new Promise(r=>resolveJson=r)});const promise=sess.recorder.onstop();await new Promise(setImmediate);assert.ok(h.c.voiceRequestController);assert.equal(h.mic.disabled,true);assert.ok([...h.jobs.values()].some(j=>j.ms===50000));resolveJson({ok:true,text:'Merhaba'});await promise;assert.equal(h.c.transcript,'Merhaba');assert.equal(h.c.voiceRequestController,null);assert.equal(h.mic.disabled,false);assert.equal(h.jobs.size,0);assert.ok(h.emotions.includes('transcribe'));assert.equal(h.emotions.at(-1),'idle');}
 // Parsing timeout aborts and unlocks with the timeout-specific diagnosis.
 {const h=create();const sess={recorder:{state:'inactive'},stream:h.stream,chunks:[new Blob(['a'.repeat(200)])],startedAt:Date.now()-1000};h.c.voiceSession=sess;h.installRecorder(sess);h.c.fetch=async(_,options)=>({ok:true,json:()=>new Promise((_,reject)=>options.signal.addEventListener('abort',()=>reject(Object.assign(Error('abort'),{name:'AbortError'}))))});const p=sess.recorder.onstop();await new Promise(setImmediate);const deadline=[...h.jobs.values()].find(j=>j.ms===50000);deadline.f();await p;assert.match(h.status.textContent,/uzun sürdü/);assert.equal(h.c.voiceRequestController,null);assert.equal(h.mic.disabled,false);}
 // 9: old request release never changes a newer microphone lock.
 {const h=create();const old=new AbortController(),fresh=new AbortController();h.c.voiceRequestController=fresh;h.mic.disabled=true;h.c.release(old,1);assert.equal(h.c.voiceRequestController,fresh);assert.equal(h.mic.disabled,true);}
 // 10: late failure cannot alter current cooldown/status.
 {const h=create();const sess={recorder:{state:'inactive'},stream:h.stream,chunks:[new Blob(['a'.repeat(200)])],startedAt:Date.now()-1000};h.c.voiceSession=sess;h.installRecorder(sess);let rejectJson;h.c.fetch=async()=>({ok:true,json:()=>new Promise((_,r)=>rejectJson=r)});const p=sess.recorder.onstop();await new Promise(setImmediate);h.c.voiceGeneration=2;h.c.voiceRequestController=new AbortController();h.c.voiceRetryUntil=12345;h.status.textContent='Yeni kayıt';rejectJson(Error('old'));await p;assert.equal(h.c.voiceRetryUntil,12345);assert.equal(h.status.textContent,'Yeni kayıt');assert.equal(h.mic.disabled,true);}
 // 12: numeric and RFC HTTP-date Retry-After values.
 {const h=create();assert.equal(h.c.retry('2.2'),3);assert.equal(h.c.retry('9999'),600);assert.equal(h.c.retry('invalid'),0);const date=new Date(Date.now()+30000).toUTCString();assert.ok(h.c.retry(date)>=29&&h.c.retry(date)<=30);assert.equal(h.c.retry(new Date(Date.now()-1000).toUTCString()),0);}
 // 13: UI distinguishes fixed engine errors, not arbitrary event messages.
 {const h=create();h.c.status.dataset={};h.c.event=null;vm.runInContext(s.slice(s.indexOf('    const speechErrorHandler='),s.indexOf("    window.addEventListener('adimbot:speech-error'"))+'this.errorHandler=speechErrorHandler;',h.c);for(const reason of ['network','audio-busy','audio-hardware','language-unavailable','voice-unavailable','text-too-long']){h.c.errorHandler({detail:{reason,message:'API_SECRET'}});assert.doesNotMatch(h.status.textContent,/API_SECRET/);assert.notEqual(h.status.textContent,'Sesli okuma başlatılamadı. Cihazın ses ayarlarını kontrol edebilirsin.');}}
 // Autonomous onstop cleans recorder timers and microphone state even without Stop.
 {const h=create();const sess={recorder:{state:'inactive'},stream:h.stream,chunks:[],startedAt:Date.now()-200};h.c.voiceSession=sess;h.installRecorder(sess);await sess.recorder.onstop();assert.equal(h.c.voiceSession,null);assert.equal(h.mic['aria-pressed'],'false');assert.equal(h.stops(),1);}
 // 14,15: distinct listen/transcribe expressions, without screen transforms; reduced motion preserved.
 const student=fs.readFileSync(__dirname+'/../adimbot-student.js','utf8'),css=fs.readFileSync(__dirname+'/../adimbot-student.css','utf8');
 assert.match(student,/emotionTypes=new Set\(\[[^\]]*'listen','transcribe'/);
 assert.match(css,/data-adimbot-emotion="listen"[^\n]*\.adb-visual\{animation:adbListenPose/);
 assert.match(css,/data-adimbot-emotion="transcribe"[^\n]*\.adb-pulse\{animation:adbEmotionWaitPulse/);
 assert.match(css,/@media\(prefers-reduced-motion:reduce\)/);
 assert.equal((css.match(/{/g)||[]).length,(css.match(/}/g)||[]).length);
 console.log('PASS: microphone cleanup, bounds, recognition, request ownership, JSON locking, cooldowns, error UI and expression source checks.');
}
run().catch(e=>{console.error(e);process.exitCode=1;});
