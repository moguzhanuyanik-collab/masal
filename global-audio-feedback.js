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

  const react=(type,context={},onEnd=null)=>{
    const bot=botApi();
    if(!bot||typeof bot.react!=='function'||!canSpeak())return false;
    stopSpeech();
    try{
      return bot.react(type,context,{onEnd:({cancelled=false}={})=>{
        if(typeof onEnd==='function'){
          try{onEnd({cancelled});}catch(error){console.error('AdımBot tepki onEnd hatası:',error);}
        }
      }})!==false;
    }catch(error){
      console.error('AdımBot karakter tepkisi başlatılamadı:',error);
      return false;
    }
  };

  // Legacy selectors are only used to auto-label current UI.
  // Runtime behavior itself depends on the stable data-adimbot-read contract.
  const autoActionSelector=[
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
    '.teacher-option',
    '.teacher-group > summary',
    '.teacher-lesson > summary',
    '.teacher-topic > summary'
  ].join(',');

  const autoTextSelector=[
    '.game-intro',
    '.puzzle-question',
    '.teacher-content-card h3',
    '.teacher-content-card p',
    '.teacher-question > strong',
    '.teacher-explanation'
  ].join(',');

  const optionPrefix=index=>{
    const letters='ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    return letters[index]||String(index+1);
  };

  const markQuestionReadables=scope=>{
    const rootScope=scope&&scope.querySelectorAll?scope:document;

    rootScope.querySelectorAll?.('.puzzle-question,.teacher-question > strong').forEach(question=>{
      if(question.closest('[data-adimbot-student],[data-adimbot-ignore]'))return;
      const text=clean(question.textContent);
      question.setAttribute('data-adimbot-read','text');
      if(text)question.setAttribute('data-adimbot-text','Soru: '+text);
    });

    const answerGroups=[
      ...rootScope.querySelectorAll?.('.answers')||[]
    ];
    answerGroups.forEach(group=>{
      [...group.querySelectorAll('.answer')].forEach((answer,index)=>{
        if(answer.closest('[data-adimbot-student],[data-adimbot-ignore]'))return;
        const text=clean(answer.textContent);
        answer.setAttribute('data-adimbot-read','action');
        if(text)answer.setAttribute('data-adimbot-text',optionPrefix(index)+' seçeneği: '+text);
      });
    });

    rootScope.querySelectorAll?.('.teacher-question form').forEach(form=>{
      [...form.querySelectorAll('.teacher-option')].forEach((option,index)=>{
        if(option.closest('[data-adimbot-student],[data-adimbot-ignore]'))return;
        const text=clean(option.querySelector('span')?.textContent||option.textContent);
        option.setAttribute('data-adimbot-read','action');
        if(text)option.setAttribute('data-adimbot-text',optionPrefix(index)+' seçeneği: '+text);
      });
    });
  };

  const markReadableElements=scope=>{
    const rootScope=scope&&scope.querySelectorAll?scope:document;
    rootScope.querySelectorAll?.(autoActionSelector).forEach(el=>{
      if(el.closest('[data-adimbot-student],[data-adimbot-ignore]'))return;
      if(!el.hasAttribute('data-adimbot-read'))el.setAttribute('data-adimbot-read','action');
    });
    rootScope.querySelectorAll?.(autoTextSelector).forEach(el=>{
      if(el.closest('[data-adimbot-student],[data-adimbot-ignore]'))return;
      if(el.closest('[data-adimbot-read="action"]'))return;
      if(!el.hasAttribute('data-adimbot-read'))el.setAttribute('data-adimbot-read','text');
    });
    markQuestionReadables(rootScope);
  };

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
    const explicit=clean(card.getAttribute?.('data-adimbot-text'));
    if(explicit)return explicit;
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

  const handleReadableClick=e=>{
    const target=e.target;
    if(!(target instanceof Element)||!canSpeak())return;

    const item=target.closest('[data-adimbot-read]');
    if(!item||item.closest('[data-adimbot-student],[data-adimbot-ignore]'))return;
    if(target.closest('input,select,textarea'))return;
    if(target.closest('label')&&item!==target.closest('label'))return;

    const mode=item.getAttribute('data-adimbot-read');

    if(mode==='action'){
      if(armedCard===item){
        disarmCard(item);
        stopSpeech();
        return; // second click continues to the original action
      }

      e.preventDefault();
      e.stopImmediatePropagation();

      disarmCard(armedCard);
      armedCard=item;
      const text=cardSpeechText(item);
      const ok=speak(text,item,()=>scheduleDisarm(item));
      if(!ok)disarmCard(item);
      return;
    }

    if(mode==='text'){
      const text=cardSpeechText(item);
      if(text)speak(text);
    }
  };
  const isActivityGame=()=>location.hash.startsWith('#/oyun/');

  const decorateActivities=()=>{
    removeLegacyCardSpeakers(document);
    markReadableElements(document);
  };

  document.addEventListener('click',handleReadableClick,true);

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

  const reactToAnswer=state=>{
    const type=state==='correct'?'success':'retry';
    return react(type)||speak(defaultFeedback(state));
  };

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
      const text=content&&!instruction?content:'';
      const signature=text||(item.state?defaultFeedback(item.state):'');
      if(!signature)return;
      const previous=announcedFeedback.get(feedback);
      if(previous&&previous.text===signature&&(!item.answer||previous.answer===item.answer))return;
      announcedFeedback.set(feedback,{text:signature,answer:item.answer});
      if(text)speak(text);
      else if(item.state)reactToAnswer(item.state);
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
          if(isActivityGame())reactToAnswer(state);
        });
      }
      return;
    }

    // Keep the existing speech behavior for exercises outside the games.
    requestAnimationFrame(()=>{
      const feedback=feedbackFor(target);
      const text=clean(feedback?.textContent);
      if(text)speak(text);
      else reactToAnswer(state);
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
        if(feedback && isActivityGame() && !pendingFeedback.has(feedback)){
          requestAnimationFrame(()=>speakFeedbackElement(feedback));
        }
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
    decorateActivities();
    window.AdimBotReadable=Object.freeze({
      refresh:()=>markReadableElements(document),
      register:(element,mode='action',text='')=>{
        if(!(element instanceof Element))return false;
        if(mode!=='action'&&mode!=='text')return false;
        element.setAttribute('data-adimbot-read',mode);
        if(text)element.setAttribute('data-adimbot-text',String(text));
        return true;
      },
      ignore:element=>{
        if(!(element instanceof Element))return false;
        element.setAttribute('data-adimbot-ignore','1');
        return true;
      }
    });
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
