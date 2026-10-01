(()=>{'use strict';

document.querySelectorAll('.teacher-content-form').forEach(form=>{
 const lesson=form.querySelector('[name="ders_id"]');
 const module=form.querySelector('[name="ders_modulu_id"]');
 const type=form.querySelector('[name="icerik_turu"]');
 const questionBox=form.querySelector('[data-question-fields]');
 const homeworkBox=form.querySelector('[data-homework-fields]');
 const dueInput=form.querySelector('[name="teslim_tarihi"]');

 const syncModules=()=>{
  if(!lesson||!module)return;
  const id=lesson.value;
  [...module.options].forEach((opt,i)=>{
   if(i===0){opt.hidden=false;return;}
   opt.hidden=opt.dataset.lesson!==id;
  });
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
 syncModules();
 syncType();
});

document.querySelectorAll('[data-content-copy]').forEach(form=>{
 form.addEventListener('submit',event=>{
  if(!window.confirm('Bu içerik pasif bir kopya olarak oluşturulsun mu? Öğrenci yanıtları ve ödev durumları kopyalanmaz.')){
   event.preventDefault();
  }
 });
});
})();