'use strict';
(() => {
  const safeArray=value=>Array.isArray(value)?value:[];
  let timer=0;

  const hashParts=()=>{
    let hash=location.hash||'';
    try{hash=decodeURIComponent(hash);}catch(_){}
    return hash.replace(/^#\/?/,'').split('/').filter(Boolean);
  };

  const currentLesson=()=>{
    const parts=hashParts();
    if(parts[0]!=='dersler'||!parts[1]||parts.length!==2)return null;
    return safeArray(window.LESSONS).find(lesson=>String(lesson?.id||'')===parts[1])||null;
  };

  const completedSet=()=>{
    const out=new Set();
    const add=list=>safeArray(list).forEach(value=>{
      const key=String(value||'').trim();
      if(key)out.add(key);
    });
    add(window.ILKADIM_COMPLETED_STEPS);
    add(window.ILKADIM_SERVER_STATE?.steps);
    try{
      const local=JSON.parse(localStorage.getItem('ilk-adim-profile')||'null');
      add(local?.steps);
    }catch(_){}
    return out;
  };

  const refresh=()=>{
    const lesson=currentLesson();
    if(!lesson?.curriculumEnabled)return;

    const modules=safeArray(lesson.modules);
    const links=[...document.querySelectorAll('#screen a.lesson-step')]
      .filter(link=>link instanceof HTMLAnchorElement);
    if(!modules.length||!links.length)return;

    const max=Math.min(modules.length,links.length);
    const groups=new Map();

    for(let i=0;i<max;i++){
      const meta=modules[i]?.curriculum;
      if(!meta?.topicCode)continue;
      const key=String(meta.topicCode);
      if(!groups.has(key))groups.set(key,{meta,indexes:[]});
      groups.get(key).indexes.push(i);
    }
    if(!groups.size)return;

    const completed=completedSet();

    for(const group of groups.values()){
      const indexes=group.indexes;
      const first=indexes[0];
      const representative=links[first];
      if(!representative)continue;

      let targetIndex=indexes.find(index=>!completed.has(String(lesson.id)+'-'+index));
      if(targetIndex===undefined)targetIndex=first;

      const target=links[targetIndex];
      if(target&&target!==representative){
        const href=target.getAttribute('href');
        if(href)representative.setAttribute('href',href);
      }

      representative.hidden=false;
      representative.removeAttribute('aria-hidden');
      representative.dataset.ilkadimStepIndex=String(targetIndex);
      representative.dataset.ilkadimTopicCode=String(group.meta.topicCode||'');
      representative.dataset.ilkadimSectionCode=String(group.meta.sectionCode||'');
      representative.setAttribute(
        'aria-label',
        String(group.meta.sectionTitle||'')+' — '+String(group.meta.topicTitle||'')+
        ' — '+String(group.meta.questionCount||indexes.length)+' soru'
      );

      for(const index of indexes){
        if(index===first)continue;
        const link=links[index];
        if(!link)continue;
        link.hidden=true;
        link.setAttribute('aria-hidden','true');
        link.tabIndex=-1;
        link.dataset.ilkadimStepIndex=String(index);
      }
    }
  };

  const schedule=()=>{
    clearTimeout(timer);
    timer=setTimeout(refresh,60);
  };

  const screen=document.getElementById('screen');
  if(screen)new MutationObserver(schedule).observe(screen,{childList:true,subtree:true});
  window.addEventListener('hashchange',schedule);
  window.addEventListener('pageshow',schedule);
  document.addEventListener('visibilitychange',()=>{if(!document.hidden)schedule();});

  if(document.readyState==='loading'){
    document.addEventListener('DOMContentLoaded',schedule,{once:true});
  }else{
    schedule();
  }

  window.IlkAdimCurriculumBridge=Object.freeze({refresh});
})();
