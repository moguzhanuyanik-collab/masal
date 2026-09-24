(()=> {
  const root=document.querySelector('[data-adimbot-student]');
  if(!root)return;
  const bubble=root.querySelector('[data-adimbot-bubble]');
  const stage=root.querySelector('[data-adimbot-stage]');
  const close=root.querySelector('[data-adimbot-close]');
  const help=root.querySelector('[data-adimbot-help]');
  const settingsButton=root.querySelector('[data-adimbot-settings]');
  const settingsPanel=root.querySelector('[data-adimbot-settings-panel]');
  const soundInput=root.querySelector('[data-adimbot-sound]');
  const rateInput=root.querySelector('[data-adimbot-rate]');
  const guideInput=root.querySelector('[data-adimbot-guide]');
  const visibleInput=root.querySelector('[data-adimbot-visible]');
  const restoreButton=root.querySelector('[data-adimbot-restore]');
  const mouth=root.querySelector('.adb-mouth-open');
  const key='ilkadim.adimbot.student.position.v1';
  const settingsKey='ilkadim.adimbot.settings.v1';
  const characterPhrases=Object.freeze({
    greeting:[
      'Merhaba! Ben AdımBot 👋 Birlikte küçük adımlarla ilerleyelim.',
      'Hazırsan başlayalım. Bugün yeni bir şey öğrenebiliriz.'
    ],
    motivation:[
      'Harika gidiyorsun! Biraz daha denersen başaracaksın.',
      'Küçük bir adım daha. Yapabilirsin!',
      'Denemeye devam et. Her deneme seni geliştirir.'
    ],
    success:[
      'Harika! Doğru yaptın.',
      'Süpersin! Güzel bir iş çıkardın.',
      'Tebrikler! Bir adım daha ilerledin.'
    ],
    retry:[
      'Olmadıysa sorun değil. Bir daha deneyelim.',
      'Bir kez daha düşün. Yapabilirsin.',
      'Hadi tekrar deneyelim. Sana güveniyorum.'
    ],
    help:[
      'Buradayım. İstersen ekrandaki bölümleri sana okuyabilirim.',
      'Yardıma ihtiyacın olursa bana dokunabilirsin.'
    ],
    lessonStart:[
      'Derse başlayalım. Hazırsan ilk adımı atalım.',
      'Yeni bir ders başlıyor. Birlikte yapabiliriz.'
    ],
    lessonEnd:[
      'Dersi tamamladın. Emeğine sağlık!',
      'Bugünkü çalışmayı bitirdin. Harika ilerledin.'
    ]
  });
  const reactionCursor=Object.create(null);

  const safeArray=value=>Array.isArray(value)?value:[];
  const readProfileState=()=>{
    try{
      const local=JSON.parse(localStorage.getItem('ilk-adim-profile')||'null');
      if(local&&typeof local==='object')return local;
    }catch(_){}
    return window.ILKADIM_SERVER_STATE&&typeof window.ILKADIM_SERVER_STATE==='object'
      ?window.ILKADIM_SERVER_STATE
      :{};
  };

  const studentContext=()=>{
    const stateData=readProfileState();
    const summary=window.ILKADIM_DB_SUMMARY&&typeof window.ILKADIM_DB_SUMMARY==='object'
      ?window.ILKADIM_DB_SUMMARY
      :{};

    const fullName=String(
      window.ILKADIM_CURRENT_USER_NAME
      ||stateData.name
      ||stateData.ad_soyad
      ||''
    ).trim();
    const firstName=fullName.split(/\s+/).filter(Boolean)[0]||'';

    const steps=safeArray(stateData.steps);
    const games=safeArray(stateData.games);
    const readings=safeArray(stateData.readings);
    const claimed=safeArray(stateData.claimed);

    const calculatedStars=steps.length+games.length+readings.length+(claimed.length*2);
    const summaryStars=Number(summary.stars);
    const summarySteps=Number(summary.completed_steps);
    const summaryGames=Number(summary.games);
    const summaryReadings=Number(summary.readings);
    const summaryBadges=Number(summary.badges);

    return {
      name:firstName,
      fullName,
      stars:Number.isFinite(summaryStars)?Math.max(calculatedStars,summaryStars):calculatedStars,
      completedSteps:Number.isFinite(summarySteps)?Math.max(steps.length,summarySteps):steps.length,
      games:Number.isFinite(summaryGames)?Math.max(games.length,summaryGames):games.length,
      readings:Number.isFinite(summaryReadings)?Math.max(readings.length,summaryReadings):readings.length,
      badges:Number.isFinite(summaryBadges)?Math.max(0,summaryBadges):0
    };
  };

  const chooseCharacterPhrase=(type,context={})=>{
    const list=characterPhrases[type];
    if(!Array.isArray(list)||!list.length)return '';
    const cursor=reactionCursor[type]||0;
    reactionCursor[type]=cursor+1;

    const personal={...studentContext(),...context};
    const name=String(personal.name||'').trim();
    const label=String(personal.label||'').trim();
    const stars=Math.max(0,Number(personal.stars)||0);
    const completedSteps=Math.max(0,Number(personal.completedSteps)||0);
    const games=Math.max(0,Number(personal.games)||0);

    let phrase=list[cursor%list.length];

    if(type==='greeting'&&name){
      phrase=cursor%2===0
        ?`Merhaba ${name}! Ben AdımBot. Birlikte küçük adımlarla ilerleyelim.`
        :`${name}, hazırsan bugün yeni bir şey öğrenelim.`;
    }

    if(type==='success'&&name){
      if(stars>=5&&cursor%3===2)phrase=`${name}, ${stars} yıldızın var. Harika ilerliyorsun!`;
      else phrase=cursor%2===0?`${name}, harika! Doğru yaptın.`:`Süpersin ${name}! Güzel bir iş çıkardın.`;
    }

    if(type==='motivation'){
      const prefix=name?`${name}, `:'';
      if(completedSteps>=5)phrase=`${prefix}${completedSteps} çalışma adımı tamamladın. Harika ilerliyorsun!`;
      else if(games>=2)phrase=`${prefix}${games} etkinlik tamamladın. Böyle devam!`;
      else if(stars>0)phrase=`${prefix}${stars} yıldız topladın. Bir küçük adım daha atalım!`;
      else if(name)phrase=`${name}, hazırsan birlikte yeni bir adım atalım.`;
    }

    if(label&&type==='lessonStart')phrase=`${name?name+', ':''}${label} dersine başlayalım. Hazırsan ilk adımı atalım.`;
    if(label&&type==='lessonEnd')phrase=`${name?name+', ':''}${label} çalışmasını tamamladın. Harika ilerledin!`;
    return phrase;
  };

  const messages=[
    characterPhrases.greeting[0],
    characterPhrases.help[0],
    characterPhrases.motivation[0],
    characterPhrases.motivation[1]
  ];

  let index=0,timer=0,dragging=false,moved=false,pointerId=null,startX=0,startY=0,startLeft=0,startTop=0;
  let pendingX=0,pendingY=0,frame=0,activeUtterance=null;
  let activeSpeechToken=0,activeOnEnd=null,activeOnStart=null,speechStarted=false;
  let gestureLoopTimer=0,gestureReleaseTimer=0,settleTimer=0,gestureIndex=0,lastGestureAt=0;
  const defaultSettings=Object.freeze({sound:true,rate:.95,minimized:false});
  let preferences={...defaultSettings};
  try{
    const savedSettings=JSON.parse(localStorage.getItem(settingsKey)||'null');
    if(savedSettings&&typeof savedSettings==='object'){
      preferences.sound=savedSettings.sound!==false;
      const savedRate=Number(savedSettings.rate);
      preferences.rate=Number.isFinite(savedRate)?Math.min(1.15,Math.max(.75,savedRate)):.95;
      preferences.minimized=savedSettings.minimized===true;
    }
  }catch(_){}

  const savePreferences=()=>{
    try{localStorage.setItem(settingsKey,JSON.stringify(preferences));}catch(_){}
  };

  const state={
    ready:true,speaking:false,dragging:false,hidden:false,mood:'idle',guide:false,
    sound:preferences.sound,rate:preferences.rate,minimized:preferences.minimized
  };

  const emitState=()=>{
    try{window.dispatchEvent(new CustomEvent('adimbot:statechange',{detail:{...state}}));}catch(_){}
  };

  const setState=patch=>{
    let changed=false;
    for(const [name,value] of Object.entries(patch)){
      if(state[name]!==value){state[name]=value;changed=true;}
    }
    if(changed)emitState();
  };

  const syncSettingsUi=()=>{
    if(soundInput)soundInput.checked=preferences.sound;
    if(rateInput)rateInput.value=String(preferences.rate);
    if(visibleInput)visibleInput.checked=!preferences.minimized;
    if(guideInput){
      let active=state.guide===true;
      try{active=window.AdimBotGuide?.isActive?.()===true||active;}catch(_){}
      guideInput.checked=active;
    }
  };

  const setMinimized=(minimized,{save=true}={})=>{
    preferences.minimized=minimized===true;
    root.classList.toggle('is-minimized',preferences.minimized);
    root.classList.remove('is-settings-open');
    if(preferences.minimized)stopSpeaking();
    setState({minimized:preferences.minimized,hidden:false});
    if(save)savePreferences();
    syncSettingsUi();
    return true;
  };

  const setSound=enabled=>{
    preferences.sound=enabled!==false;
    if(!preferences.sound)stopSpeaking();
    setState({sound:preferences.sound});
    savePreferences();
    syncSettingsUi();
    return true;
  };

  const setRate=value=>{
    const rate=Number(value);
    preferences.rate=Number.isFinite(rate)?Math.min(1.15,Math.max(.75,rate)):.95;
    setState({rate:preferences.rate});
    savePreferences();
    syncSettingsUi();
    return true;
  };
  const gestureClasses=['adb-gesture-left','adb-gesture-right','adb-gesture-open'];

  const clearSpeechGestures=()=>{
    clearTimeout(gestureLoopTimer);
    clearTimeout(gestureReleaseTimer);
    clearTimeout(settleTimer);
    root.classList.remove(...gestureClasses,'adb-speech-settle');
  };

  const triggerSpeechGesture=(preferred='auto',force=false)=>{
    if(dragging||!root.classList.contains('is-speaking'))return;
    const now=performance.now();
    if(!force&&now-lastGestureAt<880)return;
    lastGestureAt=now;
    root.classList.remove(...gestureClasses);

    let gesture;
    if(preferred==='left')gesture='adb-gesture-left';
    else if(preferred==='right')gesture='adb-gesture-right';
    else if(preferred==='open')gesture='adb-gesture-open';
    else gesture=gestureClasses[gestureIndex%gestureClasses.length];

    gestureIndex++;
    void root.offsetWidth;
    root.classList.add(gesture);
    clearTimeout(gestureReleaseTimer);
    gestureReleaseTimer=setTimeout(()=>root.classList.remove(gesture),760);
  };

  const scheduleSpeechGestures=utterance=>{
    clearTimeout(gestureLoopTimer);
    const delays=[1250,1750,1450,2050];
    const run=()=>{
      if(activeUtterance!==utterance||dragging)return;
      triggerSpeechGesture();
      gestureLoopTimer=setTimeout(run,delays[gestureIndex%delays.length]);
    };
    gestureLoopTimer=setTimeout(run,900);
  };

  const resetMouthCadence=()=>{
    if(!mouth)return;
    mouth.style.animationDuration='';
    mouth.style.removeProperty('--adb-mouth-open-y');
    mouth.style.removeProperty('--adb-mouth-mid-y');
  };

  const tuneMouthForWord=(word,charIndex)=>{
    if(!mouth||!word)return;
    const letters=word.replace(/[^A-Za-zÇĞİÖŞÜçğıöşü]/g,'');
    const length=Math.max(1,letters.length);
    const vowels=(letters.match(/[aeıioöuüAEIİOÖUÜ]/g)||[]).length;
    const vowelRatio=vowels/length;

    const base=length>=9?.205:length<=2?.31:length<=4?.275:.24;
    const variation=(charIndex%4)*.01;
    const openness=Math.min(1.10,Math.max(.86,.88+(vowelRatio*.18)+(length>=7?.045:0)));
    const middle=Math.max(.82,openness-.12);

    mouth.style.animationDuration=(base+variation).toFixed(3)+'s';
    mouth.style.setProperty('--adb-mouth-open-y',openness.toFixed(3));
    mouth.style.setProperty('--adb-mouth-mid-y',middle.toFixed(3));
  };
  const speech=('speechSynthesis' in window&&'SpeechSynthesisUtterance' in window)?window.speechSynthesis:null;
  let voices=[];

  const refreshVoices=()=>{
    voices=speech?.getVoices?.()||[];
  };

  const pickTurkishVoice=()=>{
    const turkish=voices.filter(voice=>/^tr(?:-|$)/i.test(voice.lang));
    return turkish.find(voice=>/^tr-TR$/i.test(voice.lang)&&voice.localService)
      ||turkish.find(voice=>voice.localService)
      ||turkish.find(voice=>/^tr-TR$/i.test(voice.lang))
      ||turkish[0]
      ||null;
  };

  refreshVoices();
  speech?.addEventListener?.('voiceschanged',refreshVoices);

  const finishSpeech=(token,cancelled=false)=>{
    if(token!==activeSpeechToken)return;
    clearTimeout(timer);
    const done=activeOnEnd;
    activeUtterance=null;
    activeOnEnd=null;
    activeOnStart=null;
    speechStarted=false;
    resetMouthCadence();
    clearSpeechGestures();
    root.classList.remove('is-speaking');
    if(!cancelled&&!dragging){
      root.classList.add('adb-speech-settle');
      settleTimer=setTimeout(()=>root.classList.remove('adb-speech-settle'),460);
    }
    if(root.dataset.adimbotMood)delete root.dataset.adimbotMood;
    setState({speaking:false,mood:'idle'});
    if(typeof done==='function'){
      try{done({cancelled});}catch(error){console.error('AdımBot onEnd hatası:',error);}
    }
  };

  const beginSpeech=token=>{
    if(token!==activeSpeechToken||speechStarted)return;
    speechStarted=true;
    root.classList.add('is-speaking');
    setState({speaking:true});
    const spokenText=activeUtterance?.text||'';
    gestureIndex=spokenText.length%gestureClasses.length;
    lastGestureAt=0;
    const openingGesture=/\?$/.test(spokenText)?'open':/!$/.test(spokenText)?'right':'open';
    triggerSpeechGesture(openingGesture,true);
    if(activeUtterance)scheduleSpeechGestures(activeUtterance);
    if(typeof activeOnStart==='function'){
      try{activeOnStart();}catch(error){console.error('AdımBot onStart hatası:',error);}
    }
  };

  const stopSpeaking=()=>{
    const token=activeSpeechToken;
    const hadActive=state.speaking||activeUtterance!==null;
    if(hadActive)finishSpeech(token,true);
    else{
      clearTimeout(timer);
      resetMouthCadence();
      clearSpeechGestures();
      root.classList.remove('is-speaking');
      setState({speaking:false});
    }
    try{speech?.cancel();}catch(_){}
  };
  const speak=(message,{voice=true,onStart=null,onEnd=null}={})=>{
    if(!bubble)return false;
    const text=String(message||'').trim();
    if(!text)return false;

    stopSpeaking();
    bubble.textContent=text;
    root.classList.add('is-ready');

    if(!voice||!preferences.sound){
      if(typeof onStart==='function'){
        try{onStart();}catch(error){console.error('AdımBot sessiz onStart hatası:',error);}
      }
      if(typeof onEnd==='function'){
        setTimeout(()=>{
          try{onEnd({cancelled:false,silent:true});}catch(error){console.error('AdımBot sessiz onEnd hatası:',error);}
        },80);
      }
      return true;
    }

    const token=++activeSpeechToken;
    activeOnStart=typeof onStart==='function'?onStart:null;
    activeOnEnd=typeof onEnd==='function'?onEnd:null;
    speechStarted=false;

    if(!speech){
      beginSpeech(token);
      timer=setTimeout(()=>finishSpeech(token,false),1700);
      return true;
    }

    refreshVoices();
    const utterance=new SpeechSynthesisUtterance(text.replace('👋','').trim());
    activeUtterance=utterance;
    utterance.lang='tr-TR';
    utterance.rate=preferences.rate;
    utterance.pitch=1.04;
    utterance.volume=1;

    const selectedVoice=pickTurkishVoice();
    if(selectedVoice)utterance.voice=selectedVoice;

    utterance.onstart=()=>beginSpeech(token);
    utterance.onend=()=>finishSpeech(token,false);
    utterance.onerror=()=>finishSpeech(token,false);
    utterance.onboundary=event=>{
      if(activeSpeechToken!==token||activeUtterance!==utterance||!mouth)return;
      const charIndex=Number.isFinite(event.charIndex)?event.charIndex:0;
      const remaining=utterance.text.slice(charIndex);
      const word=(remaining.match(/^[^\\s.,!?;:]+/)||[''])[0];
      if(!word)return;

      tuneMouthForWord(word,charIndex);

      const afterWord=utterance.text.slice(charIndex+word.length,charIndex+word.length+3);
      if(/\?/.test(afterWord))triggerSpeechGesture('open');
      else if(/!/.test(afterWord))triggerSpeechGesture(gestureIndex%2?'right':'left');
      else if(/[,;:]/.test(afterWord))triggerSpeechGesture(gestureIndex%2?'left':'right');
      else if(word.length>=8)triggerSpeechGesture(gestureIndex%2?'right':'left');
    };

    beginSpeech(token);
    timer=setTimeout(()=>finishSpeech(token,false),Math.max(3500,text.length*120));

    try{
      try{speech.resume?.();}catch(_){}
      speech.speak(utterance);
      return true;
    }catch(error){
      console.error('AdımBot seslendirme başlatılamadı:',error);
      finishSpeech(token,true);
      return false;
    }
  };

  const viewportBounds=()=>{
    const vv=window.visualViewport;
    const left=Number(vv?.offsetLeft)||0;
    const top=Number(vv?.offsetTop)||0;
    const width=Math.max(1,Number(vv?.width)||window.innerWidth||1);
    const height=Math.max(1,Number(vv?.height)||window.innerHeight||1);
    return {left,top,right:left+width,bottom:top+height,width,height};
  };

  const clamp=(left,top)=>{
    const r=root.getBoundingClientRect();
    const viewport=viewportBounds();
    const margin=6;
    const maxLeft=Math.max(viewport.left+margin,viewport.right-r.width-margin);
    const maxTop=Math.max(viewport.top+margin,viewport.bottom-r.height-margin);
    return {
      left:Math.max(viewport.left+margin,Math.min(left,maxLeft)),
      top:Math.max(viewport.top+margin,Math.min(top,maxTop))
    };
  };

  const setPosition=(left,top,save=false)=>{
    const p=clamp(left,top);
    root.style.left=p.left+'px';
    root.style.top=p.top+'px';
    root.style.right='auto';
    root.style.bottom='auto';
    if(save){
      try{localStorage.setItem(key,JSON.stringify(p));}catch(_){}
    }
  };

  const queuePosition=(left,top)=>{
    pendingX=left;
    pendingY=top;
    if(frame)return;
    frame=requestAnimationFrame(()=>{
      frame=0;
      setPosition(pendingX,pendingY,false);
    });
  };

  let safePositionTimer=0;
  const safeSelectors=[
    '.app-nav',
    '#screen .answers',
    '#screen .teacher-question form',
    '#screen .teacher-option',
    '#screen .button.primary',
    '#screen .button.danger',
    '#screen button[type="submit"]',
    '#screen input:not([type="hidden"])',
    '#screen select',
    '#screen textarea',
    'dialog[open]',
    '.confirm-dialog[open]'
  ].join(',');

  const visibleRect=el=>{
    if(!(el instanceof Element)||el.closest('[data-adimbot-student]'))return null;
    const style=getComputedStyle(el);
    if(style.display==='none'||style.visibility==='hidden'||Number(style.opacity)===0)return null;
    const rect=el.getBoundingClientRect();
    if(rect.width<2||rect.height<2)return null;
    const viewport=viewportBounds();
    if(rect.bottom<viewport.top||rect.top>viewport.bottom||rect.right<viewport.left||rect.left>viewport.right)return null;
    return rect;
  };

  const overlapArea=(a,b)=>{
    const width=Math.max(0,Math.min(a.right,b.right)-Math.max(a.left,b.left));
    const height=Math.max(0,Math.min(a.bottom,b.bottom)-Math.max(a.top,b.top));
    return width*height;
  };

  const ensureSafePosition=({save=true}={})=>{
    if(dragging||preferences.minimized||root.classList.contains('is-hidden'))return false;
    const robot=root.getBoundingClientRect();
    if(robot.width<2||robot.height<2)return false;

    const obstacles=[...document.querySelectorAll(safeSelectors)]
      .map(visibleRect)
      .filter(Boolean);
    if(!obstacles.length)return false;

    const current={
      left:robot.left,top:robot.top,right:robot.right,bottom:robot.bottom,
      width:robot.width,height:robot.height
    };
    const currentScore=obstacles.reduce((sum,rect)=>sum+overlapArea(current,rect),0);
    if(currentScore===0)return false;

    const navRect=visibleRect(document.querySelector('.app-nav'));
    const viewport=viewportBounds();
    const margin=10;
    const topSafe=Math.max(viewport.top+margin,viewport.top+Math.min(72,viewport.height*.08));
    const viewportBottom=viewport.bottom-margin;
    const usableBottom=navRect?Math.max(topSafe+robot.height+10,navRect.top-10):viewportBottom;
    const bottomTop=Math.max(topSafe,usableBottom-robot.height);
    const rightLeft=Math.max(viewport.left+margin,viewport.right-robot.width-margin);
    const leftLeft=viewport.left+margin;

    const candidates=[
      {left:rightLeft,top:bottomTop},
      {left:leftLeft,top:bottomTop},
      {left:rightLeft,top:topSafe},
      {left:leftLeft,top:topSafe}
    ].map(p=>{
      const clamped=clamp(p.left,p.top);
      const rect={
        left:clamped.left,top:clamped.top,
        right:clamped.left+robot.width,bottom:clamped.top+robot.height,
        width:robot.width,height:robot.height
      };
      return {
        ...clamped,
        score:obstacles.reduce((sum,o)=>sum+overlapArea(rect,o),0)
      };
    }).sort((a,b)=>a.score-b.score);

    const best=candidates[0];
    if(!best||best.score>=currentScore)return false;
    setPosition(best.left,best.top,save);
    return true;
  };

  const scheduleSafePosition=(delay=90)=>{
    clearTimeout(safePositionTimer);
    safePositionTimer=setTimeout(()=>ensureSafePosition({save:true}),delay);
  };

  try{
    const saved=JSON.parse(localStorage.getItem(key)||'null');
    if(saved&&Number.isFinite(saved.left)&&Number.isFinite(saved.top)){
      requestAnimationFrame(()=>{
        setPosition(saved.left,saved.top,false);
        scheduleSafePosition(140);
      });
    }else{
      scheduleSafePosition(320);
    }
  }catch(_){scheduleSafePosition(320);}

  stage?.addEventListener('pointerdown',event=>{
    if(event.target.closest('button,input,select,label,[data-adimbot-settings-panel]'))return;
    stopSpeaking();
    pointerId=event.pointerId;
    dragging=true;
    moved=false;
    setState({dragging:true});
    const r=root.getBoundingClientRect();
    startLeft=r.left;
    startTop=r.top;
    startX=event.clientX;
    startY=event.clientY;
    root.classList.add('is-dragging');
    stage.setPointerCapture?.(pointerId);
    event.preventDefault();
  });

  stage?.addEventListener('pointermove',event=>{
    if(!dragging||event.pointerId!==pointerId)return;
    const dx=event.clientX-startX;
    const dy=event.clientY-startY;
    if(Math.hypot(dx,dy)>5)moved=true;
    queuePosition(startLeft+dx,startTop+dy);
    event.preventDefault();
  });

  const end=event=>{
    if(!dragging||event.pointerId!==pointerId)return;
    dragging=false;
    setState({dragging:false});
    root.classList.remove('is-dragging');
    if(frame){cancelAnimationFrame(frame);frame=0;setPosition(pendingX,pendingY,false);}
    const r=root.getBoundingClientRect();
    setPosition(r.left,r.top,true);
    scheduleSafePosition(80);
    try{stage.releasePointerCapture?.(pointerId);}catch(_){}
    pointerId=null;
    if(!moved){
      const guide=window.AdimBotGuide;
      if(guide&&typeof guide.request==='function'){
        guide.request();
      }else{
        index=(index+1)%messages.length;
        speak(messages[index]);
      }
    }
    event.preventDefault();
  };

  stage?.addEventListener('pointerup',end);
  stage?.addEventListener('pointercancel',end);
  stage?.addEventListener('lostpointercapture',event=>{
    if(!dragging||event.pointerId!==pointerId)return;
    dragging=false;
    setState({dragging:false});
    root.classList.remove('is-dragging');
    if(frame){cancelAnimationFrame(frame);frame=0;setPosition(pendingX,pendingY,false);}
    const r=root.getBoundingClientRect();
    setPosition(r.left,r.top,true);
    scheduleSafePosition(80);
    pointerId=null;
  });

  stage?.addEventListener('keydown',event=>{
    if(event.key==='Enter'||event.key===' '){
      event.preventDefault();
      const guide=window.AdimBotGuide;
      if(guide&&typeof guide.request==='function')guide.request();
      else{
        index=(index+1)%messages.length;
        speak(messages[index]);
      }
    }
  });

  help?.addEventListener('pointerdown',event=>event.stopPropagation());
  help?.addEventListener('click',event=>{
    event.stopPropagation();
    root.classList.remove('is-settings-open');
    try{
      const helper=window.AdimBotHelp;
      if(helper&&typeof helper.request==='function'){
        helper.request();
        return;
      }
    }catch(error){console.error('AdımBot yardım isteği hatası:',error);}
    react('help');
  });

  settingsButton?.addEventListener('pointerdown',event=>event.stopPropagation());
  settingsButton?.addEventListener('click',event=>{
    event.stopPropagation();
    root.classList.toggle('is-settings-open');
    syncSettingsUi();
  });

  settingsPanel?.addEventListener('pointerdown',event=>event.stopPropagation());
  settingsPanel?.addEventListener('click',event=>event.stopPropagation());

  soundInput?.addEventListener('change',()=>setSound(soundInput.checked));
  rateInput?.addEventListener('change',()=>setRate(rateInput.value));
  visibleInput?.addEventListener('change',()=>{
    if(visibleInput.checked)setMinimized(false);
    else setMinimized(true);
  });
  guideInput?.addEventListener('change',()=>{
    try{
      if(guideInput.checked)window.AdimBotGuide?.start?.();
      else window.AdimBotGuide?.stop?.({silent:true});
    }catch(error){console.error('AdımBot rehber ayarı hatası:',error);}
    setState({guide:guideInput.checked});
  });

  restoreButton?.addEventListener('click',event=>{
    event.stopPropagation();
    setMinimized(false);
  });

  close?.addEventListener('pointerdown',event=>event.stopPropagation());
  close?.addEventListener('click',event=>{
    event.stopPropagation();
    root.classList.remove('is-settings-open');
    setMinimized(true);
  });

  window.addEventListener('resize',()=>{
    if(root.classList.contains('is-hidden'))return;
    const r=root.getBoundingClientRect();
    setPosition(r.left,r.top,true);
    scheduleSafePosition(100);
  });

  window.addEventListener('hashchange',()=>scheduleSafePosition(180));

  let pageSuspended=false;
  const suspendAdimBot=()=>{
    if(pageSuspended)return;
    pageSuspended=true;
    stopSpeaking();
    clearTimeout(safePositionTimer);
    if(frame){cancelAnimationFrame(frame);frame=0;}
    if(dragging){
      dragging=false;
      pointerId=null;
      setState({dragging:false});
      root.classList.remove('is-dragging');
    }
  };

  const resumeAdimBot=()=>{
    pageSuspended=false;
    refreshVoices();
    try{speech?.resume?.();}catch(_){}
    scheduleSafePosition(120);
  };

  document.addEventListener('visibilitychange',()=>{
    if(document.hidden)suspendAdimBot();
    else resumeAdimBot();
  });
  window.addEventListener('pagehide',suspendAdimBot);
  window.addEventListener('pageshow',()=>resumeAdimBot());
  window.addEventListener('orientationchange',()=>{
    stopSpeaking();
    scheduleSafePosition(180);
    setTimeout(()=>scheduleSafePosition(420),420);
  });

  window.visualViewport?.addEventListener?.('resize',()=>scheduleSafePosition(100));
  window.visualViewport?.addEventListener?.('scroll',()=>scheduleSafePosition(80));

  const safeObserver=new MutationObserver(()=>{
    if(!dragging&&!preferences.minimized)scheduleSafePosition(160);
  });
  const screen=document.querySelector('#screen');
  if(screen)safeObserver.observe(screen,{subtree:true,childList:true,attributes:true,attributeFilter:['class','open']});

  document.addEventListener('click',event=>{
    if(!root.classList.contains('is-settings-open'))return;
    if(event.target instanceof Node&&root.contains(event.target))return;
    root.classList.remove('is-settings-open');
  });

  const react=(type,context={},options={})=>{
    const phrase=chooseCharacterPhrase(type,context);
    if(!phrase)return false;
    root.dataset.adimbotMood=type;
    setState({mood:type});
    return speak(phrase,options);
  };

  window.AdimBotStudent=Object.freeze({
    speak:(text,options={})=>{
      try{return speak(text,options);}catch(error){console.error('AdımBot speak hatası:',error);return false;}
    },
    react:(type,context={},options={})=>{
      try{return react(String(type||''),context,options);}catch(error){console.error('AdımBot react hatası:',error);return false;}
    },
    phrase:(type,context={})=>{
      try{return chooseCharacterPhrase(String(type||''),context);}catch(_){return '';}
    },
    stop:()=>{try{stopSpeaking();return true;}catch(error){console.error('AdımBot stop hatası:',error);return false;}},
    show:()=>{
      try{root.classList.remove('is-hidden');setMinimized(false);setState({hidden:false});return true;}
      catch(error){console.error('AdımBot show hatası:',error);return false;}
    },
    hide:()=>{
      try{return setMinimized(true);}
      catch(error){console.error('AdımBot hide hatası:',error);return false;}
    },
    minimize:()=>{try{return setMinimized(true);}catch(_){return false;}},
    restore:()=>{try{return setMinimized(false);}catch(_){return false;}},
    setSound:enabled=>{try{return setSound(enabled);}catch(_){return false;}},
    setRate:value=>{try{return setRate(value);}catch(_){return false;}},
    getSettings:()=>({...preferences}),
    ensureSafePosition:()=>{try{return ensureSafePosition({save:true});}catch(_){return false;}},
    isReady:()=>state.ready===true,
    getState:()=>({...state}),
    setGuideMode:active=>{
      try{setState({guide:active===true});syncSettingsUi();return true;}
      catch(error){console.error('AdımBot guide state hatası:',error);return false;}
    },
    help:()=>{
      try{
        const helper=window.AdimBotHelp;
        if(helper&&typeof helper.request==='function')return helper.request();
        return react('help');
      }catch(error){console.error('AdımBot help API hatası:',error);return false;}
    },
    motivate:()=>{
      try{return react('motivation');}
      catch(error){console.error('AdımBot motivate API hatası:',error);return false;}
    },
    context:()=>{
      try{return {...studentContext()};}
      catch(_){return {name:'',fullName:'',stars:0,completedSteps:0,games:0,readings:0,badges:0};}
    },
    characterTypes:()=>Object.keys(characterPhrases)
  });

  setMinimized(preferences.minimized,{save:false});
  syncSettingsUi();
  setTimeout(()=>speak(chooseCharacterPhrase('greeting'),{voice:false}),550);
})();