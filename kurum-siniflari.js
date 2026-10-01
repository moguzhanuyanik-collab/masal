'use strict';

document.addEventListener('DOMContentLoaded',()=>{
  const dialog=document.querySelector('[data-class-dialog]');
  if(!(dialog instanceof HTMLDialogElement)) return;

  const id=dialog.querySelector('[data-class-id]');
  const name=dialog.querySelector('[data-class-name]');
  const type=dialog.querySelector('[data-class-type]');
  const grade=dialog.querySelector('[data-class-grade]');

  const syncGrade=()=>{
    if(!(type instanceof HTMLSelectElement) || !(grade instanceof HTMLSelectElement)) return;
    if(type.value==='sinif' && grade.value==='0') grade.value='1';
  };

  document.querySelectorAll('[data-class-edit]').forEach(button=>{
    button.addEventListener('click',()=>{
      if(id) id.value=button.dataset.id||'0';
      if(name) name.value=button.dataset.name||'';
      if(type) type.value=button.dataset.type||'sinif';
      if(grade) grade.value=button.dataset.grade||'0';
      syncGrade();
      dialog.showModal();
    });
  });

  type?.addEventListener('change',syncGrade);
  dialog.querySelector('[data-class-close]')?.addEventListener('click',()=>dialog.close());
  dialog.addEventListener('click',event=>{ if(event.target===dialog) dialog.close(); });
});
