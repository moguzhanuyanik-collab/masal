const fs=require('node:fs'),vm=require('node:vm'),assert=require('node:assert/strict');
const s=fs.readFileSync(__dirname+'/../adimbot-student.js','utf8');
function harness(){
 let id=0,frames=new Map(),timers=new Map(),stored=new Map(),classes=new Set(),reads=0,schedules=0;
 const stage={listeners:{},setAttribute(){},addEventListener(type,fn){this.listeners[type]=fn;},setPointerCapture(){},releasePointerCapture(){}};
 const root={style:{},classList:{add(x){classes.add(x);},remove(x){classes.delete(x);},contains(x){return classes.has(x);}},getBoundingClientRect(){return {left:parseFloat(root.style.left)||80,top:parseFloat(root.style.top)||100,width:184,height:180};}};
 const window={innerWidth:400,innerHeight:800,visualViewport:{offsetLeft:0,offsetTop:0,width:400,height:800,listeners:{},addEventListener(t,f){this.listeners[t]=f;}},listeners:{},addEventListener(t,f){this.listeners[t]=f;},AdimBotGuide:{request(){reads++;}}};
 const c={stage,root,window,document:{documentElement:{clientWidth:400,clientHeight:800}},preferences:{minimized:false},state:{speaking:false},motionPreference:{matches:false},pageSuspended:false,dragging:false,moved:false,pointerId:null,startLeft:0,startTop:0,startX:0,startY:0,pendingX:0,pendingY:0,manualPosition:false,frame:0,viewportFrame:0,dragSettleTimer:0,activeUtterance:null,speechPaused:false,key:'position',localStorage:{setItem(k,v){stored.set(k,v);},removeItem(k){stored.delete(k);}},setState(v){Object.assign(c.state,v);},clearSpeechGestures(){},scheduleSpeechGestures(){schedules++;},wakeAdimBot(){},scheduleSafePosition(){},requestAnimationFrame(f){frames.set(++id,f);return id;},cancelAnimationFrame(i){frames.delete(i);},setTimeout(f,ms){timers.set(++id,{f,ms});return id;},clearTimeout(i){timers.delete(i);},messages:['Merhaba'],index:0,speak(){reads++;}};
 vm.createContext(c);
 vm.runInContext(s.slice(s.indexOf('  const viewportBounds='),s.indexOf('  let safePositionTimer='))+'this.bounds=viewportBounds;',c);
 vm.runInContext(s.slice(s.indexOf("  stage?.setAttribute('aria-label'"),s.indexOf("  help?.addEventListener('pointerdown'")),c);
 vm.runInContext(s.slice(s.indexOf('  const refreshViewportPosition='),s.indexOf("  window.addEventListener('hashchange'")),c);
 vm.runInContext(s.slice(s.indexOf("  window.visualViewport?.addEventListener?.('resize'"),s.indexOf('  const safeObserver=')),c);
 function event(type,extra={}){return {type,pointerType:'touch',isPrimary:true,button:0,pointerId:1,clientX:100,clientY:120,target:{closest:()=>null},preventDefault(){},...extra};}
 function trigger(type,extra){stage.listeners[type](event(type,extra));}
 function flush(){const jobs=[...frames];frames.clear();for(const [,f] of jobs)f();}
 return {c,stage,root,window,stored,classes,frames,timers,event,trigger,flush,reads:()=>reads,schedules:()=>schedules};
}
// 1: right click is ignored.
{const h=harness();h.trigger('pointerdown',{pointerType:'mouse',button:2});assert.equal(h.c.dragging,false);}
// 2: a second finger cannot steal an active pointer.
{const h=harness();h.trigger('pointerdown');h.trigger('pointerdown',{pointerId:2,isPrimary:false});assert.equal(h.c.pointerId,1);}
// 3: pointer cancellation never speaks or starts a guide.
{const h=harness();h.trigger('pointerdown');h.trigger('pointercancel');assert.equal(h.reads(),0);assert.equal(h.c.dragging,false);}
// 4: small pointer jitter leaves coordinates and persistence unchanged.
{const h=harness();h.trigger('pointerdown');h.trigger('pointermove',{clientX:103,clientY:121});assert.equal(h.frames.size,0);assert.equal(h.c.moved,false);h.trigger('pointerup');assert.equal(h.stored.size,0);}
// 5: failed pointer capture cleans state and resumes existing speech gestures.
{const h=harness();h.c.activeUtterance={};h.stage.setPointerCapture=()=>{throw Error('capture denied');};h.trigger('pointerdown');assert.equal(h.c.dragging,false);assert.equal(h.c.pointerId,null);assert.equal(h.classes.has('adb-is-dragging'),false);assert.equal(h.schedules(),1);}
// 6: ordinary tap keeps automatic position mode and does not write a new position.
{const h=harness();h.trigger('pointerdown');h.trigger('pointerup');assert.equal(h.reads(),1);assert.equal(h.c.manualPosition,false);assert.equal(h.stored.size,0);}
// 7: arrows and Shift move within bounds and persist.
{const h=harness();h.trigger('keydown',{key:'ArrowRight'});assert.equal(h.root.style.left,'88px');h.trigger('keydown',{key:'ArrowDown',shiftKey:true});assert.equal(h.root.style.top,'124px');assert.equal(h.c.manualPosition,true);assert.equal(h.stored.size,1);}
// 8: Home restores CSS placement and clears saved position.
{const h=harness();h.trigger('keydown',{key:'ArrowRight'});h.trigger('keydown',{key:'Home'});assert.equal(h.stored.size,0);assert.equal(h.c.manualPosition,false);assert.equal(h.root.style.left,'');}
// 9: focus outline is visible and independent of animated motion.
const css=fs.readFileSync(__dirname+'/../adimbot-student.css','utf8');assert.match(css,/\.adb-stage:focus-visible\{outline:3px solid #2178b8/);
// 10: visual viewport offset/keyboard height determine the clamp, not layout height.
{const h=harness();Object.assign(h.window.visualViewport,{offsetLeft:20,offsetTop:200,width:320,height:280});const b=h.c.bounds();assert.equal(b.bottom,480);assert.equal(b.left,20);h.trigger('keydown',{key:'ArrowDown',shiftKey:true});assert.equal(h.root.style.top,'206px');}
// 11: manual placement is clamped on resize without changing saved preference.
{const h=harness();h.c.manualPosition=true;h.root.style.top='650px';h.window.visualViewport.height=350;h.window.listeners.resize();h.flush();assert.equal(h.root.style.top,'164px');assert.equal(h.stored.size,0);}
// 12: viewport panning clamps and coalesces high-frequency events into one frame.
{const h=harness();h.c.manualPosition=true;h.window.visualViewport.offsetTop=300;h.window.visualViewport.listeners.scroll();h.window.visualViewport.listeners.scroll();assert.equal(h.frames.size,1);h.flush();assert.equal(h.root.style.top,'306px');}
// 13: resume calls the real clamp refresh after clearing suspension.
{const h=harness();h.c.clearIdlePower=()=>{};h.c.stopSpeaking=()=>{};h.c.safePositionTimer=0;h.c.refreshVoices=()=>{};h.c.speech=null;h.c.scheduleIdlePower=()=>{};const a=s.indexOf('  const suspendAdimBot='),b=s.indexOf("  document.addEventListener('visibilitychange'",a);vm.runInContext(s.slice(a,b)+'this.suspend=suspendAdimBot;this.resume=resumeAdimBot;',h.c);h.c.manualPosition=true;h.c.suspend();h.root.style.top='650px';h.window.visualViewport.height=350;h.c.resume();h.flush();assert.equal(h.root.style.top,'164px');}
// 14: actual drop has a short settle; reduced motion and speaking suppress it.
for(const mode of ['idle','reduced','speaking']){const h=harness();h.c.motionPreference.matches=mode==='reduced';h.c.state.speaking=mode==='speaking';h.trigger('pointerdown');h.trigger('pointermove',{clientX:150});h.trigger('pointerup',{clientX:150});assert.equal(h.classes.has('adb-drag-settle'),mode==='idle');assert.equal(h.stored.size,1);}
assert.match(css,/adbDragSettle .28s ease-out 1/);assert.match(css,/animation:none!important/);
// 15: holding Enter/Space doesn't repeatedly start speech, arrow repeat remains useful.
{const h=harness();h.trigger('keydown',{key:'Enter',repeat:true});h.trigger('keydown',{key:' ',repeat:true});assert.equal(h.reads(),0);h.trigger('keydown',{key:'Enter',repeat:false});assert.equal(h.reads(),1);}
assert.equal((css.match(/{/g)||[]).length,(css.match(/}/g)||[]).length);
console.log('PASS: pointer cancellation/ownership, jitter, capture errors, keyboard movement, visual viewport bounds, resume and settle guards.');
