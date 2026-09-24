(()=> {
  const root=document.querySelector('[data-adimbot]');
  if(!root)return;
  const bubble=root.querySelector('[data-adimbot-bubble]');
  const stage=root.querySelector('[data-adimbot-stage]');
  const close=root.querySelector('[data-adimbot-close]');
  const key='ilkadim.adimbot.superadmin.position.v1';
  const messages=[
    'Merhaba! Ben AdımBot 👋 Beni istediğin yere sürükleyebilirsin.',
    'Kısa dokunursan konuşurum; sürüklersen yerimi değiştiririm.',
    'Bugün küçük bir adım bile büyük ilerleme demek.',
    'Bu sadece deneme alanı; beğenirsek öğrenci tarafına güvenle taşırız.'
  ];

  let index=0,timer=0,dragging=false,moved=false,pointerId=null,startX=0,startY=0,startLeft=0,startTop=0;
  let pendingX=0,pendingY=0,frame=0;

  const stopSpeaking=()=>{
    clearTimeout(timer);
    root.classList.remove('is-speaking');
  };

  const speak=(message)=>{
    if(!bubble)return;
    bubble.textContent=message;
    root.classList.add('is-ready','is-speaking');
    clearTimeout(timer);
    timer=setTimeout(()=>root.classList.remove('is-speaking'),1700);
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

  setTimeout(()=>speak(messages[0]),550);
})();