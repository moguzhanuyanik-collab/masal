'use strict';
(() => {
  const PROFILE_KEY='ilk-adim-profile';
  let scheduled=0;

  const safeArray=value=>Array.isArray(value)?value:[];

  const readCompleted=()=>{
    const set=new Set();
    const add=list=>safeArray(list).forEach(value=>{
      const key=String(value||'').trim();
      if(key)set.add(key);
    });

    add(window.ILKADIM_COMPLETED_STEPS);
    add(window.ILKADIM_SERVER_STATE?.steps);

    try{
      const local=JSON.parse(localStorage.getItem(PROFILE_KEY)||'null');
      add(local?.steps);
    }catch(_){}

    return set;
  };

  const lessonIds=()=>safeArray(window.LESSONS)
    .map(lesson=>String(lesson?.id||'').trim())
    .filter(Boolean);

  const hashParts=value=>{
    let hash='';
    try{
      hash=new URL(value||location.href,location.href).hash||'';
    }catch(_){
      hash=String(value||'');
    }

    try{hash=decodeURIComponent(hash);}catch(_){}
    return hash.replace(/^#\/?/,'').split('/').filter(Boolean);
  };

  const courseFromLocation=()=>{
    const ids=new Set(lessonIds());
    return hashParts(location.href).find(part=>ids.has(part))||'';
  };

  const stepLinks=()=>[...document.querySelectorAll('#screen a.lesson-step')]
    .filter(link=>link instanceof HTMLAnchorElement);

  const stepKeyFor=(link,index,currentCourse)=>{
    const ids=new Set(lessonIds());
    const parts=hashParts(link.href||link.getAttribute('href')||'');
    const course=parts.find(part=>ids.has(part))||currentCourse;
    if(!course)return '';
    return course+'-'+index;
  };

  const markVisibleSteps=()=>{
    if(!location.hash.startsWith('#/dersler'))return;
    const links=stepLinks();
    if(!links.length)return;

    const completed=readCompleted();
    const currentCourse=courseFromLocation();

    links.forEach((link,index)=>{
      const key=stepKeyFor(link,index,currentCourse);
      if(key&&completed.has(key)){
        link.dataset.ilkadimCompletedStep=key;
      }else{
        delete link.dataset.ilkadimCompletedStep;
      }
    });
  };

  const schedule=()=>{
    clearTimeout(scheduled);
    scheduled=setTimeout(markVisibleSteps,50);
  };

  const nextIncompleteLink=(links,currentIndex,completed,currentCourse)=>{
    for(let i=currentIndex+1;i<links.length;i++){
      const key=stepKeyFor(links[i],i,currentCourse);
      if(!key||!completed.has(key))return links[i];
    }
    return null;
  };

  document.addEventListener('click',event=>{
    const target=event.target;
    if(!(target instanceof Element))return;

    const link=target.closest('#screen a.lesson-step');
    if(!(link instanceof HTMLAnchorElement))return;

    const links=stepLinks();
    const index=links.indexOf(link);
    if(index<0)return;

    const currentCourse=courseFromLocation();
    const completed=readCompleted();
    const key=stepKeyFor(link,index,currentCourse);
    if(!key||!completed.has(key))return;

    event.preventDefault();
    event.stopImmediatePropagation();

    const next=nextIncompleteLink(links,index,completed,currentCourse);
    if(next){
      const href=next.getAttribute('href');
      if(href)location.href=href;
    }
  },true);

  const screen=document.getElementById('screen');
  if(screen){
    new MutationObserver(schedule).observe(screen,{childList:true,subtree:true});
  }

  window.addEventListener('hashchange',schedule);
  window.addEventListener('pageshow',schedule);
  document.addEventListener('visibilitychange',()=>{
    if(!document.hidden)schedule();
  });

  if(document.readyState==='loading'){
    document.addEventListener('DOMContentLoaded',schedule,{once:true});
  }else{
    schedule();
  }

  window.IlkAdimCompletedStepSkip=Object.freeze({
    refresh:markVisibleSteps,
    completed:()=>[...readCompleted()]
  });
})();
