(()=> {
  const root=document.querySelector('[data-adimbot]');
  if(!root)return;
  const bubble=root.querySelector('[data-adimbot-bubble]');
  const stage=root.querySelector('[data-adimbot-stage]');
  const close=root.querySelector('[data-adimbot-close]');
  const mouth=root.querySelector('.adb-mouth-open');
  const key='ilkadim.adimbot.superadmin.position.v1';
  const messages=[
    'Merhaba! Ben AdımBot 👋 Beni istediğin yere sürükleyebilirsin.',
    'Kısa dokunursan konuşurum; sürüklersen yerimi değiştiririm.',
    'Bugün küçük bir adım bile büyük ilerleme demek.',
    'Bu sadece deneme alanı; beğenirsek öğrenci tarafına güvenle taşırız.'
  ];

  let index=0,timer=0,dragging=false,moved=false,pointerId=null,startX=0,startY=0,startLeft=0,startTop=0;
  let pendingX=0,pendingY=0,frame=0,activeUtterance=null;

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

  const stopSpeaking=()=>{
    clearTimeout(timer);
    activeUtterance=null;
    resetMouthCadence();
    try{speech?.cancel();}catch(_){}
    root.classList.remove('is-speaking');
  };

  const speak=(message,{voice=true}={})=>{
    if(!bubble)return;
    stopSpeaking();
    bubble.textContent=message;
    root.classList.add('is-ready');

    if(!voice)return;

    if(!speech){
      root.classList.add('is-speaking');
      timer=setTimeout(()=>root.classList.remove('is-speaking'),1700);
      return;
    }

    refreshVoices();
    const utterance=new SpeechSynthesisUtterance(message.replace('👋','').trim());
    activeUtterance=utterance;
    utterance.lang='tr-TR';
    utterance.rate=.95;
    utterance.pitch=1.04;
    utterance.volume=1;

    const selectedVoice=pickTurkishVoice();
    if(selectedVoice)utterance.voice=selectedVoice;

    const finish=()=>{
      if(activeUtterance!==utterance)return;
      clearTimeout(timer);
      activeUtterance=null;
      resetMouthCadence();
      root.classList.remove('is-speaking');
    };

    utterance.onstart=()=>{
      if(activeUtterance!==utterance)return;
      root.classList.add('is-speaking');
    };
    utterance.onend=finish;
    utterance.onerror=finish;
    utterance.onboundary=event=>{
      if(activeUtterance!==utterance||!mouth)return;
      const charIndex=Number.isFinite(event.charIndex)?event.charIndex:0;
      const remaining=utterance.text.slice(charIndex);
      const word=(remaining.match(/^[^\\s.,!?;:]+/)||[''])[0];
      const base=word.length>=8?.21:word.length<=3?.30:.25;
      const variation=(charIndex%3)*.015;
      mouth.style.animationDuration=(base+variation).toFixed(3)+'s';
    };

    root.classList.add('is-speaking');
    timer=setTimeout(finish,Math.max(3500,message.length*120));

    try{
      speech.speak(utterance);
    }catch(_){
      activeUtterance=null;
      clearTimeout(timer);
      root.classList.add('is-speaking');
      timer=setTimeout(()=>root.classList.remove('is-speaking'),1700);
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
  });

  window.addEventListener('resize',()=>{
    if(root.classList.contains('is-hidden'))return;
    const r=root.getBoundingClientRect();
    setPosition(r.left,r.top,true);
  });

  setTimeout(()=>speak(messages[0],{voice:false}),550);
})();