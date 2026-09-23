'use strict';
(() => {
  let speakingText='';
  const spokenState=new WeakMap();

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

  const speak=text=>{
    const value=clean(text);
    if(!value||!('speechSynthesis' in window)||typeof SpeechSynthesisUtterance==='undefined')return false;
    if(value===speakingText&&window.speechSynthesis.speaking)return true;
    window.speechSynthesis.cancel();
    const utterance=new SpeechSynthesisUtterance(value);
    utterance.lang='tr-TR';
    utterance.rate=0.86;
    utterance.pitch=1.03;
    const voices=window.speechSynthesis.getVoices();
    const trVoice=voices.find(v=>/^tr(?:-|_)/i.test(v.lang||''));
    if(trVoice)utterance.voice=trVoice;
    speakingText=value;
    utterance.onend=()=>{if(speakingText===value)speakingText='';};
    utterance.onerror=()=>{if(speakingText===value)speakingText='';};
    window.speechSynthesis.speak(utterance);
    return true;
  };

  const isActivityGame=()=>location.hash.startsWith('#/oyun/');
  const iconButton=(label,kind,text)=>{
    const b=document.createElement('button');
    b.type='button';
    b.className='icon-button activity-speech-icon';
    b.setAttribute('aria-label',label);
    b.dataset.speechKind=kind;
    b.dataset.speechText=text;
    b.textContent='🔊';
    return b;
  };

  const decorateIntro=scope=>{
    const intro=scope.querySelector('.game-intro');
    if(!intro||intro.querySelector('[data-speech-kind="intro"]'))return;
    const title=clean(intro.querySelector('h1')?.textContent);
    const desc=clean(intro.querySelector('p')?.textContent);
    const text=[title,desc].filter(Boolean).join('. ');
    if(text)intro.appendChild(iconButton('Anlatımı dinle','intro',text));
  };

  const decorateQuestions=scope=>{
    const questions=[...scope.querySelectorAll('.puzzle-question')];
    questions.forEach(q=>{
      if(q.parentElement?.querySelector('[data-speech-for-question="'+(q.dataset.speechId||'')+'"]'))return;
      if(!q.dataset.speechId)q.dataset.speechId='q'+Math.random().toString(36).slice(2);
      if(scope.querySelector('[data-speech-for-question="'+q.dataset.speechId+'"]'))return;
      const b=iconButton('Soruyu dinle','question',clean(q.textContent));
      b.dataset.speechForQuestion=q.dataset.speechId;
      q.insertAdjacentElement('afterend',b);
    });
  };

  const decorateAnswers=scope=>{
    [...scope.querySelectorAll('.answers .answer')].forEach(answer=>{
      if(answer.dataset.speechDecorated==='1')return;
      answer.dataset.speechDecorated='1';
      const text=clean(answer.textContent);
      const b=iconButton('Bu şıkkı dinle','option',text);
      b.addEventListener('click',e=>{
        e.preventDefault();
        e.stopPropagation();
        speak(text);
      });
      answer.insertAdjacentElement('beforebegin',b);
    });
  };

  const decorateActivities=()=>{
    if(!isActivityGame())return;
    const screen=document.getElementById('screen');
    if(!screen)return;
    decorateIntro(screen);
    decorateQuestions(screen);
    decorateAnswers(screen);
  };

  document.addEventListener('click',e=>{
    const b=e.target.closest?.('.activity-speech-icon');
    if(!b)return;
    e.preventDefault();
    e.stopPropagation();
    speak(b.dataset.speechText||'');
  },true);

  const feedbackFor=target=>{
    const scope=target.closest('.question-card,#game-board,.game-screen,.screen-content')||document;
    return scope.querySelector('.feedback,.game-feedback');
  };

  const speakAnswerState=target=>{
    if(!(target instanceof HTMLElement)||!target.classList.contains('answer'))return;
    const state=target.classList.contains('correct')?'correct':target.classList.contains('incorrect')?'incorrect':'';
    if(!state||spokenState.get(target)===state)return;
    spokenState.set(target,state);

    requestAnimationFrame(()=>{
      const feedback=feedbackFor(target);
      const text=clean(feedback&&feedback.textContent);
      speak(text || (state==='correct'?'Harika, doğru cevap!':'Olmadı, tekrar deneyelim.'));
    });
  };

  let feedbackLast='';
  const speakFeedbackElement=target=>{
    if(!(target instanceof HTMLElement))return;
    const text=clean(target.textContent);
    if(!text||text===feedbackLast)return;
    feedbackLast=text;
    speak(text);
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
    if(needsDecorate)requestAnimationFrame(decorateActivities);
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
  };

  window.addEventListener('hashchange',()=>{
    if('speechSynthesis' in window)window.speechSynthesis.cancel();
    speakingText='';
    feedbackLast='';
    setTimeout(decorateActivities,0);
  });
  window.addEventListener('pagehide',()=>{
    if('speechSynthesis' in window)window.speechSynthesis.cancel();
  });

  if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',start);
  else start();
})();
