'use strict';
(() => {
  const PROFILE_KEY='ilk-adim-profile';

  const readSteps=()=>{
    const steps=new Set();
    const add=value=>{
      if(!Array.isArray(value))return;
      value.forEach(item=>{
        const key=String(item||'').trim();
        if(key)steps.add(key);
      });
    };

    try{add(window.ILKADIM_SERVER_STATE?.steps);}catch(_){}
    try{
      const local=JSON.parse(localStorage.getItem(PROFILE_KEY)||'null');
      add(local?.steps);
    }catch(_){}
    return steps;
  };

  const protectCompletedQuestions=()=>{
    const lessons=Array.isArray(window.LESSONS)?window.LESSONS:[];
    if(!lessons.length)return 0;

    const completed=readSteps();
    let protectedCount=0;

    lessons.forEach(lesson=>{
      const code=String(lesson?.id||'').trim();
      if(!code||!Array.isArray(lesson?.modules))return;

      lesson.modules.forEach((mod,index)=>{
        if(!mod||typeof mod!=='object')return;
        const key=String(mod.stepKey||code+'-'+index);
        const done=mod.completed===true||completed.has(key);
        if(!done)return;

        mod.completed=true;
        mod.stepKey=key;
        mod.question='';
        mod.options=[];
        mod.answer=-1;
        protectedCount++;
      });
    });

    return protectedCount;
  };

  const refreshSoon=()=>{
    protectCompletedQuestions();
    setTimeout(protectCompletedQuestions,80);
    setTimeout(protectCompletedQuestions,260);
  };

  const observeScreen=()=>{
    const screen=document.getElementById('screen');
    if(!screen)return;

    new MutationObserver(mutations=>{
      let shouldRefresh=false;
      for(const mutation of mutations){
        if(mutation.type==='attributes'&&mutation.attributeName==='class'){
          const target=mutation.target;
          if(target instanceof Element&&(target.classList.contains('correct')||target.classList.contains('success'))){
            shouldRefresh=true;
            break;
          }
        }
      }
      if(shouldRefresh)refreshSoon();
    }).observe(screen,{subtree:true,attributes:true,attributeFilter:['class']});
  };

  protectCompletedQuestions();
  window.addEventListener('hashchange',refreshSoon);
  window.addEventListener('pageshow',refreshSoon);
  document.addEventListener('visibilitychange',()=>{
    if(!document.hidden)refreshSoon();
  });

  if(document.readyState==='loading'){
    document.addEventListener('DOMContentLoaded',()=>{
      protectCompletedQuestions();
      observeScreen();
    },{once:true});
  }else{
    observeScreen();
  }

  window.IlkAdimCompletedQuestionGuard=Object.freeze({
    refresh:()=>protectCompletedQuestions()
  });
})();
