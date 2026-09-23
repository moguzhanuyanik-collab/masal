'use strict';
(() => {
  let speakingText='';
  const spokenState=new WeakMap();

  const clean=value=>String(value||'')
    .replace(/[★⭐✨🎉💡💜✅❌🔊🌱]/gu,' ')
    .replace(/\s+/g,' ')
    .trim();

  const speak=text=>{
    const value=clean(text);
    if(!value||!('speechSynthesis' in window)||typeof SpeechSynthesisUtterance==='undefined')return;
    if(value===speakingText&&window.speechSynthesis.speaking)return;
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
  };

  const feedbackFor=target=>{
    const scope=target.closest('.question-card,#game-board,.game-screen,.screen-content')||document;
    return scope.querySelector('.feedback');
  };

  const speakAnswerState=target=>{
    if(!(target instanceof HTMLElement)||!target.classList.contains('answer'))return;
    const state=target.classList.contains('correct')?'correct':target.classList.contains('incorrect')?'incorrect':'';
    if(!state||spokenState.get(target)===state)return;
    spokenState.set(target,state);

    requestAnimationFrame(()=>{
      const feedback=feedbackFor(target);
      const text=clean(feedback&&feedback.textContent);
      if(text){
        speak(text);
      }else{
        speak(state==='correct'?'Harika, doğru cevap!':'Olmadı, tekrar deneyelim.');
      }
    });
  };

  let memoryLast='';
  const speakMemoryFeedback=target=>{
    if(!(target instanceof HTMLElement)||!target.classList.contains('game-feedback'))return;
    requestAnimationFrame(()=>{
      const text=clean(target.textContent);
      if(!text||text===memoryLast)return;
      memoryLast=text;
      speak(text);
    });
  };

  const observer=new MutationObserver(mutations=>{
    for(const mutation of mutations){
      if(mutation.type==='attributes'&&mutation.attributeName==='class'){
        speakAnswerState(mutation.target);
        continue;
      }
      if(mutation.type==='childList'||mutation.type==='characterData'){
        const el=mutation.target instanceof HTMLElement
          ? mutation.target
          : mutation.target.parentElement;
        const feedback=el&&el.closest ? el.closest('.game-feedback') : null;
        if(feedback)speakMemoryFeedback(feedback);
      }
    }
  });

  const start=()=>{
    observer.observe(document.body,{
      subtree:true,
      attributes:true,
      attributeFilter:['class'],
      childList:true,
      characterData:true
    });
  };

  window.addEventListener('hashchange',()=>{
    if('speechSynthesis' in window)window.speechSynthesis.cancel();
    speakingText='';
    memoryLast='';
  });
  window.addEventListener('pagehide',()=>{
    if('speechSynthesis' in window)window.speechSynthesis.cancel();
  });

  if(document.readyState==='loading')document.addEventListener('DOMContentLoaded',start);
  else start();
})();
