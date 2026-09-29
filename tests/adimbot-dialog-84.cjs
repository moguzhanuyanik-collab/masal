const fs=require('node:fs'),vm=require('node:vm'),assert=require('node:assert/strict');
const s=fs.readFileSync(__dirname+'/../adimbot-chat-ui.js','utf8');
class El{
 constructor(){this.hidden=false;this.disabled=false;this.tabIndex=0;this.isConnected=true;this.children=[];this.listeners={};this.dataset={};this.value='';this.clientHeight=100;this.scrollHeight=100;this.scrollTop=0;this.visible=true;}
 addEventListener(n,f){this.listeners[n]=f;}
 dispatchEvent(e){this.listeners[e.type]?.(e);}
 setAttribute(k,v){this[k]=v;}
 removeAttribute(k){delete this[k];}
 append(...v){for(const x of v)this.appendChild(x);}
 appendChild(v){v.parent=this;this.children.push(v);this.scrollHeight+=20;}
 remove(){this.parent.children.splice(this.parent.children.indexOf(this),1);}
 get firstElementChild(){return this.children[0];}
 getClientRects(){return this.visible?[{}]:[];}
 closest(){return this.ancestorHidden?{}:null;}
 focus(){this.focused=(this.focused||0)+1;}
}
function h(){
 let id=0,jobs=new Map(),stops=0,clears=0,emotions=[];
 const input=new El(),panel=new El(),box=new El(),status=new El(),counter=new El(),submit=new El(),form=new El(),pauseA=new El(),pauseB=new El();
 form.querySelector=()=>submit;
 const modal=new El();modal.hidden=false;modal.querySelector=q=>({'[data-adimbot-chat-input]':input,'.adb-chat-dialog':panel,'[data-adimbot-chat-messages]':box,'[data-adimbot-chat-form]':form,'[data-adimbot-chat-status]':status}[q]||null);modal.querySelectorAll=()=>[];
 const bot={stop(){stops++;},clearEmotion(){clears++;},emote(t){emotions.push(t);},isPaused(){return c.paused||false;}};
 const c={modal,input,box,status,counter,form,chatRequest:null,chatGeneration:0,chatBusy:false,focusGeneration:0,lastTrigger:null,inputComposing:false,retryMessage:'',chatRetryUntil:0,voiceSession:null,voiceRequestController:null,window:{AdimBotStudent:bot,addEventListener(){}},document:{activeElement:null,documentElement:{classList:{add(){},remove(){}}},createElement:()=>new El()},Element:El,HTMLElement:El,Event:class{constructor(type){this.type=type;}},AbortController,console,navigator:{onLine:true},getComputedStyle:el=>({display:el.display||'block',visibility:el.visibility||'visible'}),setTimeout(f,ms){jobs.set(++id,{f,ms});return id;},clearTimeout(i){jobs.delete(i);},stopVoice(){},rollbackPendingUser(){},sessionStorage:{removeItem(){}},scopedKey:x=>x,HISTORY_KEY:'history',setTogetherActive(){},clean:x=>String(x||'').trim(),buildModal:()=>modal,captureContext(){},currentContext:()=>({}),togetherActive:()=>false};
 vm.createContext(c);
 vm.runInContext(s.slice(s.indexOf('  const cancelChat='),s.indexOf('  const stopTracks='))+'this.cancel=cancelChat;',c);
 vm.runInContext(s.slice(s.indexOf('  const appendMessage='),s.indexOf('  const readHistory='))+'this.append=appendMessage;',c);
 vm.runInContext(s.slice(s.indexOf('  const clearHistory='),s.indexOf('  const buildModal='))+'this.clear=clearHistory;',c);
 vm.runInContext(s.slice(s.indexOf('  const focusables='),s.indexOf("  document.addEventListener('click'"))+'this.api={open,close,focusables};',c);
 function tick(){const tasks=[...jobs];jobs.clear();for(const [,t] of tasks)t.f();}
 return {c,input,panel,box,status,counter,form,modal,pauseA,pauseB,jobs,tick,stops:()=>stops,clears:()=>clears,emotions};
}
async function run(){
 // 1: closing actually stops playback, clears expression, hides dialog.
 {const t=h();t.c.api.close();assert.equal(t.stops(),1);assert.ok(t.clears());assert.equal(t.modal.hidden,true);}
 // 2: clear stops speech and resets pending question/counter through input event.
 {const t=h();t.input.value='Yarım soru';t.input.addEventListener('input',()=>t.counter.textContent=t.input.value.length+' / 400');t.c.clear();assert.equal(t.stops(),1);assert.equal(t.input.value,'');assert.equal(t.counter.textContent,'0 / 400');}
 // 3,4: cancel owns and clears its emotion timer and expression.
 {const t=h();const controller=new AbortController();const emotionTimer=t.c.setTimeout(()=>{throw Error('stale thought');},1500);t.c.chatRequest={controller,message:'Soru',emotionTimer};t.c.cancel();t.tick();assert.equal(controller.signal.aborted,true);assert.ok(t.clears());assert.equal(t.c.chatGeneration,1);}
 // 6: delayed open focus never enters a closed dialog.
 {const t=h();t.c.api.open();t.c.api.close();t.tick();assert.equal(t.input.focused,undefined);}
 // 7: close's delayed focus never steals from a re-opened dialog.
 {const t=h();const trigger=new El();t.c.api.open(trigger);t.c.api.close();t.c.api.open(trigger);t.tick();assert.equal(trigger.focused,undefined);assert.equal(t.input.focused,1);}
 // 8: ancestors, disabled, negative tab index and invisible layout excluded.
 {const t=h();const valid=new El(),hidden=new El(),disabled=new El(),negative=new El(),cssHidden=new El(),noLayout=new El();hidden.ancestorHidden=true;disabled.disabled=true;negative.tabIndex=-1;cssHidden.visibility='hidden';noLayout.visible=false;t.modal.querySelectorAll=()=>[valid,hidden,disabled,negative,cssHidden,noLayout];assert.deepEqual(Array.from(t.c.api.focusables()),[valid]);}
 // 9: real Tab handler falls back to dialog and catches focus outside controls.
 {const t=h();t.c.document.addEventListener=(type,fn)=>{if(type==='keydown')t.c.keydown=fn;};vm.runInContext(s.slice(s.indexOf("  document.addEventListener('keydown'"),s.indexOf("  window.addEventListener('hashchange'")),t.c);let prevented=false;t.c.keydown({key:'Tab',preventDefault(){prevented=true;}});assert.equal(prevented,true);assert.equal(t.panel.focused,1);const button=new El();t.modal.querySelectorAll=()=>[button];t.c.keydown({key:'Tab',preventDefault(){}});assert.equal(button.focused,1);}
 // 10: explicit question label and dialog fallback tab index.
 assert.match(s,/aria-label="AdımBot’a soracağın soru"/);assert.match(s,/aria-describedby="adb-chat-desc" tabindex="-1"/);
 // 11: actual IME handlers prevent composing Enter only.
 {const t=h();vm.runInContext(s.slice(s.indexOf("    input?.addEventListener('compositionstart'"),s.indexOf("    input?.addEventListener('input'")),t.c);t.input.listeners.compositionstart();let blocked=0;t.input.listeners.keydown({key:'Enter',preventDefault(){blocked++;}});t.input.listeners.compositionend();t.input.listeners.keydown({key:'Enter',preventDefault(){blocked++;}});assert.equal(blocked,1);}
 // 12: old-message reading stays put; bottom-following and own questions scroll.
 {const t=h();t.box.scrollHeight=1000;t.box.scrollTop=100;t.box.clientHeight=200;t.c.append(t.box,'bot','Yeni yanıt',{speakable:false});assert.equal(t.box.scrollTop,100);t.c.append(t.box,'user','Sorum');assert.equal(t.box.scrollTop,t.box.scrollHeight);}
 // 13: all pause controls follow authoritative engine pause state.
 {const t=h();t.modal.querySelectorAll=()=>[t.pauseA,t.pauseB];vm.runInContext(s.slice(s.indexOf('    const syncPauseControls='),s.indexOf('    const voiceConfig='))+'this.sync=syncPauseControls;',t.c);t.c.paused=true;t.c.sync();assert.equal(t.pauseA.textContent,'▶️ Devam');assert.equal(t.pauseB['aria-label'],'AdımBot sesini devam ettir');t.c.paused=false;t.c.sync();assert.equal(t.pauseA.textContent,'⏸ Duraklat');}
 // 5,14: execute the real submit handler with failed and blocked provider results.
 for(const mode of ['failure','blocked']){
  const t=h();t.c.refreshTogetherButton=()=>{};t.c.refreshContextBadge=()=>{};t.c.cooldownRemaining=()=>0;t.c.readHistory=()=>[];t.c.remember=()=>{};t.c.learningContext=()=>({});t.c.retryAfterSeconds=()=>0;t.c.retryableChatReasons=new Set();t.c.window.AdimBotAI={ask:async()=>mode==='blocked'?{ok:false,blocked:true,text:'Birlikte düşünelim.'}:{ok:false,reason:'provider_error',text:'Bağlantı yok.'},deliver:x=>x};t.input.value='Soru';
  const start=s.indexOf("    form?.addEventListener('submit',async event=>{"),end=s.indexOf('\n    return modal;',start);let code=s.slice(start,end).replace("    form?.addEventListener('submit',async event=>{",'this.submit=async event=>{').trim();code=code.slice(0,-3)+'};';vm.runInContext(code,t.c);await t.c.submit({preventDefault(){}});assert.equal(t.c.chatBusy,false);if(mode==='failure'){assert.ok(t.clears());assert.equal(t.emotions.includes('surprised'),false);}else{assert.equal(t.emotions.includes('encourage'),true);assert.equal(t.emotions.includes('surprised'),false);}
 }
 // 15: held-rest thought animation, existing reduced motion still wins via !important.
 const css=fs.readFileSync(__dirname+'/../adimbot-student.css','utf8');assert.match(css,/animation:adbThoughtfulRest 3.6s/);assert.match(css,/28%,76%\{transform:translateY\(-.7px\) rotate\(-.9deg\)\}/);assert.match(css,/animation:none!important/);assert.equal((css.match(/{/g)||[]).length,(css.match(/}/g)||[]).length);
 console.log('PASS: dialog cancellation, focus races/trap, IME, scroll, speech controls, response expressions and thought CSS.');
}
run().catch(e=>{console.error(e);process.exitCode=1;});
