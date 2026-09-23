(()=>{'use strict';
const lesson=document.querySelector('[name="ders_id"]');
const module=document.querySelector('[name="ders_modulu_id"]');
const type=document.querySelector('[name="icerik_turu"]');
const questionBox=document.querySelector('[data-question-fields]');
const syncModules=()=>{
 if(!lesson||!module)return;
 const id=lesson.value;
 [...module.options].forEach((opt,i)=>{if(i===0){opt.hidden=false;return;}opt.hidden=opt.dataset.lesson!==id;});
 if(module.selectedOptions[0]?.hidden)module.value='';
};
const syncType=()=>{if(questionBox)questionBox.hidden=type?.value!=='soru';};
lesson?.addEventListener('change',syncModules);
type?.addEventListener('change',syncType);
syncModules();syncType();
})();
