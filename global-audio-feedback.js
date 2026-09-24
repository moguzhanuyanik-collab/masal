'use strict';
(() => {
  let speakingText='';
  const spokenState=new WeakMap();
  let activeMotion=null;
  let activeMotionCard=null;
  let armedCard=null;
  let armTimer=null;

  const clean=value=>String(value||'')
    .replace(/[\u{1F1E6}-\u{1F1FF}]/gu,' ')
    .replace(/[\u{1F300}-\u{1FAFF}]/gu,' ')
    .replace(/[\u2600-\u27BF]/gu,' ')
    .replace(/[\u2190-\u21FF]/gu,' ')
    .replace(/[\u2300-\u23FF]/gu,' ')
    .replace(/[\u25A0-\u25FF]/gu,' ')
    .replace(/[\uFE0E\uFE0F\u200D]/gu,' ')
    .replace(/\s+/g,' ')
    .trim();

  const stopCardMotion=()=>{
    try{if(activeMotion)activeMotion.cancel();}catch{}
    activeMotion=null;
    activeMotionCard=null;
  };

  const startCardMotion=card=>{
    stopCardMotion();
    if(!card||typeof card.animate!=='function')return;
    if(document.documentElement.classList.contains('reduce-motion'))return;
    if(window.matchMedia&&window.matchMedia('(prefers-reduced-motion: reduce)').matches)return;
    activeMotionCard=card;
    activeMotion=card.animate([
      {transform:'translateX(0) scale(1)'},
      {transform:'translateX(-2px) scale(1.008)'},
      {transform:'translateX(2px) scale(1.008)'},
      {transform:'translateX(0) scale(1)'}
    ],{
      duration:720,
      iterations:Infinity,
      easing:'ease-in-out'
    });
  };

  const botApi=()=>window.AdimBotStudent||null;
  const canSpeak=()=>{
    const bot=botApi();
    if(!bot||typeof bot.speak!=='function')return false;
    return typeof bot.isReady==='function'?bot.isReady()===true:true;
  };

  const stopSpeech=()=>{
    const bot=botApi();
    if(bot&&typeof bot.stop==='function'){
      try{bot.stop();}catch(error){console.error('AdımBot durdurma hatası:',error);}
    }
    speakingText='';
    stopCardMotion();
  };

  const speak=(text,motionCard=null,onEnd=null)=>{
    const value=clean(text);
    if(!value||!canSpeak())return false;

    stopSpeech();
    speakingText=value;
    if(motionCard)startCardMotion(motionCard);

    const done=({cancelled=false}={})=>{
      if(speakingText===value)speakingText='';
      if(activeMotionCard===motionCard)stopCardMotion();
      if(typeof onEnd==='function'){
        try{onEnd({cancelled});}catch(error){console.error('AdımBot etkileşim onEnd hatası:',error);}
      }
    };

    try{
      const ok=botApi().speak(value,{onEnd:done})!==false;
      if(!ok){
        speakingText='';
        if(activeMotionCard===motionCard)stopCardMotion();
      }
      return ok;
    }catch(error){
      console.error('AdımBot etkileşim konuşma hatası:',error);
      speakingText='';
      if(activeMotionCard===motionCard)stopCardMotion();
      return false;
    }
  };

  const spokenCardSelector=[
    '.app-nav a[href]',
    '#screen a[href]',
    'a.game-tile',
    '.course-row > a',
    'a.home-course',
    'a.home-game',
    'a.resume-card',
    'a.lesson-step',
    '.story-list > a',
    'a.reading-entry',
    'a.island',
    'a.mina-card',
    '.daily-tasks > a',
    '.answers .answer',
    '.teacher-group > summary',
    '.teacher-lesson > summary',
    '.teacher-topic > summary'
  ].join(',');

  const spokenTextSelector=[
    '.game-intro',
    '.puzzle-question',
    '.teacher-content-card h3',
    '.teacher-content-card p',
    '.teacher-question > strong',
    '.teacher-explanation'
  ].join(',');

  const clearArmTimer=()=>{
    if(armTimer){clearTimeout(armTimer);armTimer=null;}
  };

  const disarmCard=card=>{
    clearArmTimer();
    if(!card||armedCard===card)armedCard=null;
  };

  const scheduleDisarm=card=>{
    clearArmTimer();
    armTimer=setTimeout(()=>{
      if(armedCard===card)armedCard=null;
    },5000);
  };

  const cardSpeechText=card=>{
    if(!card)return '';
    const titleEl=card.querySelector?.('h1,h2,h3,strong');
    const descEl=card.querySelector?.('p');
    const smallEl=card.querySelector?.('small');
    const title=clean(titleEl?.textContent);
    const desc=clean(descEl?.textContent);
    const small=clean(smallEl?.textContent);
    const composed=[title,desc||small].filter(Boolean).join('. ');
    return composed||clean(card.getAttribute?.('aria-label'))||clean(card.textContent);
  };

  const removeLegacyCardSpeakers=scope=>{
    (scope||document).querySelectorAll?.('.activity-speech-icon,[data-speech-kind="activity-card"]').forEach(el=>el.remove());
  };

  const handleSpokenCardClick=e=>{
    const target=e.target;
    if(!(target instanceof Element))return;
    const card=target.closest(spokenCardSelector);
    if(!card)return;
    if(target.closest('input,select,textarea,label'))return;

    // Progressive enhancement: AdımBot yoksa mevcut öğrenci davranışına hiç karışma.
    if(!canSpeak())return;

    if(armedCard===card){
      disarmCard(card);
      stopSpeech();
      return;
    }

    e.preventDefault();
    e.stopImmediatePropagation();

    disarmCard(armedCard);
    armedCard=card;
    const text=cardSpeechText(card);
    const ok=speak(text,card,()=>scheduleDisarm(card));
    if(!ok){
      disarmCard(card);
      // Ses katmanı çalışmazsa ikinci tık zorunluluğu bırakma.
      if(card instanceof HTMLAnchorElement && card.href)location.href=card.href;
    }
  };

  const handleSpokenTextClick=e=>{
    if(!canSpeak())return;
    const target=e.target;
    if(!(target instanceof Element))return;
    if(target.closest(spokenCardSelector))return;
    if(target.closest('button,input,select,textarea,label,a[href]'))return;
    const item=target.closest(spokenTextSelector);
    if(!item)return;
    const text=clean(item.textContent);
    if(text)speak(text);
  };

  const isActivityGame=()=>location.hash.startsWith('#/oyun/');

  const decorateActivities=()=>{
    removeLegacyCardSpeakers(document);
  };

  document.addEventListener('click',e=>{
    handleSpokenCardClick(e);
    handleSpokenTextClick(e);
  },true);

  // A correct answer changes both its class and the feedback text.
  // Merge both mutations into one announcement after the DOM has settled.
  const pendingFeedback=new Map();
  const announcedFeedback=new WeakMap();

  const feedbackFor=target=>{
    let scope=target.closest('.question-card,#game-board,.game-screen,.screen-content');
    while(scope){
      const feedback=scope.querySelector('.feedback,.game-feedback');
      if(feedback)return feedback;
      scope=scope.parentElement?.closest('.question-card,#game-board,.game-screen,.screen-content')||null;
    }
    return null;
  };

  const defaultFeedback=state=>state==='correct'
    ? 'Harika, doğru cevap!'
    : 'Olmadı, tekrar deneyelim.';

  const queueFeedback=(feedback,state='',answer=null)=>{
    if(!feedback)return;
    const pending=pendingFeedback.get(feedback);
    if(pending){
      if(state)pending.state=state;
      if(answer)pending.answer=answer;
      return;
    }
    const item={state,answer};
    pendingFeedback.set(feedback,item);
    requestAnimationFrame(()=>{
      pendingFeedback.delete(feedback);
      if(!isActivityGame()||!feedback.isConnected)return;
      const content=clean(feedback.textContent);
      const instruction=/^(biraz düşün|bir cevap seç|cevabını seç)/i.test(content);
      const text=content&&!instruction?content:(item.state?defaultFeedback(item.state):'');
      if(!text)return;
      const previous=announcedFeedback.get(feedback);
      if(previous&&previous.text===text&&(!item.answer||previous.answer===item.answer))return;
      announcedFeedback.set(feedback,{text,answer:item.answer});
      speak(text);
    });
  };

  const speakAnswerState=target=>{
    if(!(target instanceof HTMLElement)||!target.classList.contains('answer'))return;
    const state=target.classList.contains('correct')?'correct':target.classList.contains('incorrect')?'incorrect':'';
    if(!state||spokenState.get(target)===state)return;
    spokenState.set(target,state);

    if(isActivityGame()){
      const feedback=feedbackFor(target);
      if(feedback){
        queueFeedback(feedback,state,target);
      }else{
        requestAnimationFrame(()=>{
          if(isActivityGame())speak(defaultFeedback(state));
        });
      }
      return;
    }

    // Keep the existing speech behavior for exercises outside the games.
    requestAnimationFrame(()=>{
      const feedback=feedbackFor(target);
      const text=clean(feedback?.textContent);
      speak(text||defaultFeedback(state));
    });
  };

  const speakFeedbackElement=target=>{
    if(!(target instanceof HTMLElement)||!isActivityGame())return;
    queueFeedback(target);
  };

  const observer=new MutationObserver(mutations=>{
    let needsDecorate=false;
    for(const mutation of mutations){
      if(mutation.type==='attributes'&&mutation.attributeName==='class'){
        speakAnswerState(mutation.target);
      }
      if(mutation.type==='childList'||mutation.type==='characterData'){
        needsDecorate=true;
        const el=mutation.target instanceof HTMLElement ? mutation.target : mutation.target.parentElement;
        const feedback=el?.closest?.('.feedback,.game-feedback');
        if(feedback && isActivityGame()) requestAnimationFrame(()=>speakFeedbackElement(feedback));
      }
    }
    if(needsDecorate)requestAnimationFrame(()=>{removeLegacyCardSpeakers(document);decorateActivities();});
  });

  const start=()=>{
    observer.observe(document.body,{
      subtree:true,
      attributes:true,
      attributeFilter:['class'],
      childList:true,
      characterData:true
    });
    removeLegacyCardSpeakers(document);
    decorateActivities();
  };

  window.addEventListener('hashchange',()=>{
    stopSpeech();
    clearArmTimer();
    armedCard=null;
    pendingFeedback.clear();
    setTimeout(()=>{removeLegacyCardSpeakers(document);decorateActivities();},0);
  });
  window.addEventListener('pagehide',()=>{
    stopSpeech();
    clearArmTimer();
    armedCard=null;
  });

  if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',start);
  else start();
})();
