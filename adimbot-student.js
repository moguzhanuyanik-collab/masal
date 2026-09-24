(()=> {
  const root=document.querySelector('[data-adimbot-student]');
  if(!root)return;
  const bubble=root.querySelector('[data-adimbot-bubble]');
  const stage=root.querySelector('[data-adimbot-stage]');
  const close=root.querySelector('[data-adimbot-close]');
  const mouth=root.querySelector('.adb-mouth-open');
  const key='ilkadim.adimbot.student.position.v1';
  const messages=[
    'Merhaba! Ben AdımBot 👋 Birlikte küçük adımlarla ilerleyelim.',
    'Bir derste zorlanırsan bana dokun; seni motive edeyim.',
    'Harika gidiyorsun! Biraz daha denersen başaracaksın.',
    'Bugün öğrendiğin her yeni şey seni bir adım ileri taşır.'
  ];

  let index=0,timer=0,dragging=false,moved=false,pointerId=null,startX=0,startY=0,startLeft=0,startTop=0;
  let pendingX=0,pendingY=0,frame=0,activeUtterance=null;
  let activeSpeechToken=0,activeOnEnd=null,activeOnStart=null,speechStarted=false;
  let gestureLoopTimer=0,gestureReleaseTimer=0,gestureIndex=0,lastGestureAt=0;
  const state={ready:true,speaking:false,dragging:false,hidden:false};

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
  const gestureClasses=['adb-gesture-left','adb-gesture-right','adb-gesture-open'];

  const clearSpeechGestures=()=>{
    clearTimeout(gestureLoopTimer);
    clearTimeout(gestureReleaseTimer);
    root.classList.remove(...gestureClasses);
  };

  const triggerSpeechGesture=()=>{
    if(dragging||!root.classList.contains('is-speaking'))return;
    const now=performance.now();
    if(now-lastGestureAt<1050)return;
    lastGestureAt=now;
    root.classList.remove(...gestureClasses);
    const gesture=gestureClasses[gestureIndex%gestureClasses.length];
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
    setState({speaking:false});
    if(typeof done==='function'){
      try{done({cancelled});}catch(error){console.error('AdımBot onEnd hatası:',error);}
    }
  };

  const beginSpeech=token=>{
    if(token!==activeSpeechToken||speechStarted)return;
    speechStarted=true;
    root.classList.add('is-speaking');
    setState({speaking:true});
    gestureIndex=(activeUtterance?.text?.length||0)%gestureClasses.length;
    lastGestureAt=0;
    triggerSpeechGesture();
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

    if(!voice)return true;

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
    utterance.rate=.95;
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
      const base=word.length>=8?.21:word.length<=3?.30:.25;
      const variation=(charIndex%3)*.015;
      mouth.style.animationDuration=(base+variation).toFixed(3)+'s';
      const afterWord=utterance.text.slice(charIndex+word.length,charIndex+word.length+2);
      if(word.length>=7||/[,.!?;:]/.test(afterWord))triggerSpeechGesture();
    };

    beginSpeech(token);
    timer=setTimeout(()=>finishSpeech(token,false),Math.max(3500,text.length*120));

    try{
      speech.speak(utterance);
      return true;
    }catch(error){
      console.error('AdımBot seslendirme başlatılamadı:',error);
      finishSpeech(token,true);
      return false;
    }
  };

  const clamp=(left,top)=>{
    const r=root.getBoundingClientRect();
    return {
      left:Math.max(6,Math.min(left,window.innerWidth-r.width-6)),
      top:Math.max(6,Math.min(top,window.innerHeight-r.height-6))
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

  try{
    const saved=JSON.parse(localStorage.getItem(key)||'null');
    if(saved&&Number.isFinite(saved.left)&&Number.isFinite(saved.top)){
      requestAnimationFrame(()=>setPosition(saved.left,saved.top,false));
    }
  }catch(_){}

  stage?.addEventListener('pointerdown',event=>{
    if(event.target.closest('[data-adimbot-close]'))return;
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
    try{stage.releasePointerCapture?.(pointerId);}catch(_){}
    pointerId=null;
    if(!moved){
      index=(index+1)%messages.length;
      speak(messages[index]);
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
    pointerId=null;
  });

  stage?.addEventListener('keydown',event=>{
    if(event.key==='Enter'||event.key===' '){
      event.preventDefault();
      index=(index+1)%messages.length;
      speak(messages[index]);
    }
  });

  close?.addEventListener('pointerdown',event=>event.stopPropagation());
  close?.addEventListener('click',event=>{
    event.stopPropagation();
    stopSpeaking();
    root.classList.add('is-hidden');
    setState({hidden:true});
  });

  window.addEventListener('resize',()=>{
    if(root.classList.contains('is-hidden'))return;
    const r=root.getBoundingClientRect();
    setPosition(r.left,r.top,true);
  });

  window.AdimBotStudent=Object.freeze({
    speak:(text,options={})=>{
      try{return speak(text,options);}catch(error){console.error('AdımBot speak hatası:',error);return false;}
    },
    stop:()=>{try{stopSpeaking();return true;}catch(error){console.error('AdımBot stop hatası:',error);return false;}},
    show:()=>{
      try{root.classList.remove('is-hidden');setState({hidden:false});return true;}
      catch(error){console.error('AdımBot show hatası:',error);return false;}
    },
    hide:()=>{
      try{stopSpeaking();root.classList.add('is-hidden');setState({hidden:true});return true;}
      catch(error){console.error('AdımBot hide hatası:',error);return false;}
    },
    isReady:()=>state.ready===true,
    getState:()=>({...state})
  });

  setTimeout(()=>speak(messages[0],{voice:false}),550);
})();