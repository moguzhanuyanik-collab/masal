'use strict';
(() => {
  const safeArray=value=>Array.isArray(value)?value:[];
  const PROFILE_KEY='ilk-adim-profile';
  let timer=0;

  const hashParts=value=>{
    let hash='';
    try{
      hash=new URL(value||location.href,location.href).hash||'';
    }catch(_){
      hash=String(value||location.hash||'');
    }
    try{hash=decodeURIComponent(hash);}catch(_){}
    return hash.replace(/^#\/?/,'').split('/').filter(Boolean);
  };

  const lessonFromContext=()=>{
    const lessons=safeArray(window.LESSONS);
    const ids=new Set(lessons.map(item=>String(item?.id||'')).filter(Boolean));
    const direct=hashParts(location.href).find(part=>ids.has(part));
    if(direct)return lessons.find(item=>String(item?.id||'')===direct)||null;

    for(const link of document.querySelectorAll('#screen a.lesson-step')){
      const id=hashParts(link.getAttribute('href')||link.href||'').find(part=>ids.has(part));
      if(id)return lessons.find(item=>String(item?.id||'')===id)||null;
    }

    const screenText=String(document.getElementById('screen')?.innerText||'').toLocaleLowerCase('tr-TR');
    return lessons.find(item=>{
      const name=String(item?.name||'').trim().toLocaleLowerCase('tr-TR');
      return name!==''&&screenText.includes(name);
    })||null;
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
      const local=JSON.parse(localStorage.getItem(PROFILE_KEY)||'null');
      add(local?.steps);
    }catch(_){}
    return out;
  };

  const replaceCounters=(screen,totalTopics,completedTopics)=>{
    if(!screen||!totalTopics)return;
    const walker=document.createTreeWalker(screen,NodeFilter.SHOW_TEXT);
    const nodes=[];
    while(walker.nextNode())nodes.push(walker.currentNode);

    for(const node of nodes){
      const value=String(node.nodeValue||'');
      let next=value;
      next=next.replace(/\b\d+\s+mini\s+konu\b/gi,totalTopics+' konu');
      next=next.replace(/\b\d+\s*\/\s*\d+\s+adım\b/gi,completedTopics+' / '+totalTopics+' konu');
      if(next!==value)node.nodeValue=next;
    }
  };

  const refresh=()=>{
    const screen=document.getElementById('screen');
    if(!screen)return;

    const lesson=lessonFromContext();
    if(!lesson?.curriculumEnabled)return;

    const modules=safeArray(lesson.modules);
    const links=[...screen.querySelectorAll('a.lesson-step')]
      .filter(link=>link instanceof HTMLAnchorElement);
    if(!modules.length||!links.length)return;

    // Önce yalnız bu köprünün daha önce yönettiği kartları sıfırla.
    for(const link of links){
      if(link.dataset.ilkadimCurriculumManaged!=='1')continue;
      link.hidden=false;
      link.removeAttribute('aria-hidden');
      link.tabIndex=0;
      link.style.removeProperty('display');
      delete link.dataset.ilkadimCurriculumManaged;
    }

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
    let completedTopics=0;

    for(const group of groups.values()){
      const indexes=group.indexes;
      const first=indexes[0];
      const representative=links[first];
      if(!representative)continue;

      const topicComplete=indexes.every(index=>completed.has(String(lesson.id)+'-'+index));
      if(topicComplete)completedTopics++;

      let targetIndex=indexes.find(index=>!completed.has(String(lesson.id)+'-'+index));
      if(targetIndex===undefined)targetIndex=first;

      const target=links[targetIndex];
      if(target&&target!==representative){
        const href=target.getAttribute('href');
        if(href)representative.setAttribute('href',href);
      }

      representative.hidden=false;
      representative.removeAttribute('aria-hidden');
      representative.style.removeProperty('display');
      representative.dataset.ilkadimCurriculumManaged='1';
      representative.dataset.ilkadimStepIndex=String(targetIndex);
      representative.dataset.ilkadimTopicCode=String(group.meta.topicCode||'');
      representative.dataset.ilkadimSectionCode=String(group.meta.sectionCode||'');
      representative.dataset.ilkadimQuestionCount=String(group.meta.questionCount||indexes.length);
      representative.setAttribute(
        'aria-label',
        String(group.meta.sectionTitle||'')+' — '+String(group.meta.topicTitle||'')+
        ' — '+String(group.meta.questionCount||indexes.length)+' soru'
      );

      // Aynı konuya ait diğer sorular ders listesinde ayrı kart olarak görünmez.
      // Inline !important kullanımı mevcut lesson-step CSS'inin hidden özelliğini
      // ezmesini engeller; CSS dosyasına dokunmadan tasarım korunur.
      for(const index of indexes){
        if(index===first)continue;
        const link=links[index];
        if(!link)continue;
        link.dataset.ilkadimCurriculumManaged='1';
        link.dataset.ilkadimStepIndex=String(index);
        link.dataset.ilkadimTopicCode=String(group.meta.topicCode||'');
        link.hidden=true;
        link.setAttribute('aria-hidden','true');
        link.tabIndex=-1;
        link.style.setProperty('display','none','important');
      }
    }

    replaceCounters(screen,groups.size,completedTopics);
  };

  const schedule=()=>{
    clearTimeout(timer);
    timer=setTimeout(refresh,80);
  };

  const screen=document.getElementById('screen');
  if(screen)new MutationObserver(schedule).observe(screen,{childList:true,subtree:true,characterData:true});
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
