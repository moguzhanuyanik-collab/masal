(()=>{'use strict';
const lesson=document.querySelector('[name="ders_id"]');
const module=document.querySelector('[name="ders_modulu_id"]');
const type=document.querySelector('[name="icerik_turu"]');
const questionBox=document.querySelector('[data-question-fields]');
const homeworkBox=document.querySelector('[data-homework-fields]');
const dueInput=document.querySelector('[name="teslim_tarihi"]');
const syncModules=()=>{
 if(!lesson||!module)return;
 const id=lesson.value;
 [...module.options].forEach((opt,i)=>{if(i===0){opt.hidden=false;return;}opt.hidden=opt.dataset.lesson!==id;});
 if(module.selectedOptions[0]?.hidden)module.value='';
};
const syncType=()=>{
 if(questionBox)questionBox.hidden=type?.value!=='soru';
 const isHomework=type?.value==='odev';
 if(homeworkBox)homeworkBox.hidden=!isHomework;
 if(dueInput&&!isHomework)dueInput.value='';
};
lesson?.addEventListener('change',syncModules);
type?.addEventListener('change',syncType);
syncModules();syncType();
})();
