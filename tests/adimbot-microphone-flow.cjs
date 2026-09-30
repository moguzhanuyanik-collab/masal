const fs=require('node:fs'),vm=require('node:vm'),assert=require('node:assert/strict');
const source=fs.readFileSync(__dirname+'/../adimbot-chat-ui.js','utf8');
function create(provider='groq'){
 let now=1000,id=0,jobs=new Map(),listener,sent=[],stops=0,started=0;
 const status={textContent:''},mic={textContent:'',setAttribute(k,v){this[k]=v;},addEventListener(_,f){listener=f;}};
 const track={readyState:'live',enabled:true,addEventListener(){},stop(){stops++;}};
 const stream={getTracks:()=>[track],getAudioTracks:()=>[track]};
 const c={console,voiceConfig:{enabled:true,input:provider},chatBusy:false,voiceRetryUntil:0,voiceRequestController:null,voiceGeneration:0,voiceSession:null,modal:{hidden:false,querySelector:()=>mic},mic,status,navigator:{onLine:true,mediaDevices:{getUserMedia:async()=>stream}},window:{MediaRecorder:true,AdimBotStudent:{stop(){},emote(){},clearEmotion(){}}},Date:{now:()=>now},setTimeout(f,ms){jobs.set(++id,{f,ms});return id;},setInterval(f,ms){jobs.set(++id,{f,ms});return id;},clearTimeout(i){jobs.delete(i);},clearInterval(i){jobs.delete(i);},clean:v=>String(v||'').trim(),cooldownRemaining:()=>0,recognized:t=>sent.push(t),microphoneStartMessage:()=> 'Cihaz hatası',browserRecognitionMessage:()=> 'Tanıma hatası',createAudioRecorder(){started++;return {state:'inactive',start(){this.state='recording';},stop(){this.state='inactive';}};},Uint8Array,Promise};
 vm.createContext(c);
 vm.runInContext(source.slice(source.indexOf('  const stopTracks='),source.indexOf('  const clean=')),c);
 vm.runInContext(source.slice(source.indexOf("    mic?.addEventListener('click'"),source.indexOf('    const syncConnection=')),c);
 return {c,status,mic,jobs,stream,click:()=>listener(),time:()=>now,advance:ms=>now+=ms,stops:()=>stops,started:()=>started};
}
async function run(){
 {const h=create('unknown');await h.click();assert.equal(h.started(),0);assert.match(h.status.textContent,/geçersiz/);}
 {const h=create(' GROQ ');await h.click();assert.equal(h.started(),1);}
 {const h=create('browser');let rec;h.c.window.SpeechRecognition=class{constructor(){rec=this;}start(){}stop(){}};await h.click();assert.equal(h.c.voiceSession.pending,true);assert.match(h.status.textContent,/izni bekleniyor/);h.advance(5000);rec.onstart();assert.equal(h.c.voiceSession.startedAt,h.time());assert.equal(h.c.voiceSession.pending,false);assert.ok([...h.jobs.values()].some(x=>x.ms===15000));rec.onresult({results:[{isFinal:true,0:{transcript:'Merhaba'}}]});rec.onresult({results:[{isFinal:true,0:{transcript:'Merhaba'}}]});assert.deepEqual(h.c.voiceSession,null);assert.equal(h.jobs.size,0);}
 {const h=create();let resolve;h.c.navigator.mediaDevices.getUserMedia=()=>new Promise(r=>resolve=r);const p=h.click();assert.equal(h.mic['aria-label'],'Mikrofon isteğini iptal et');await h.click();resolve(h.stream);await p;assert.equal(h.started(),0);assert.equal(h.stops(),1);assert.equal(h.jobs.size,0);}
 {const h=create();let resolve;h.c.navigator.mediaDevices.getUserMedia=()=>new Promise(r=>resolve=r);const p=h.click();assert.ok(h.c.voiceSession.countdownTimer);resolve(h.stream);await p;assert.equal(h.jobs.size,2);}
 {const h=create();let loud=true;h.c.window.AudioContext=class{constructor(){this.state='running';}createAnalyser(){return {fftSize:256,getByteTimeDomainData(a){a.fill(loud?145:128);}};}createMediaStreamSource(){return {connect(){}};}resume(){}close(){return Promise.resolve();}};await h.click();const session=h.c.voiceSession,meter=h.jobs.get(session.meterTimer).f;meter();h.advance(160);meter();h.advance(160);meter();assert.equal(session.detectedSpeech,true);loud=false;h.advance(1801);meter();assert.equal(h.c.voiceSession,null);assert.equal(session.recorder.state,'inactive');assert.equal(h.jobs.size,0);}
 {const h=create();await h.click();const old=h.c.voiceSession,timer=h.jobs.get(old.timer).f;h.c.voiceGeneration++;h.c.voiceSession={new:true};timer();assert.equal(h.c.voiceSession.new,true);}
 console.log('PASS: provider normalization, recognition permission/start/result ownership, pending cancel, permission timer cleanup, automatic silence stop and stale recording timeout.');
}
run().catch(e=>{console.error(e);process.exitCode=1;});
