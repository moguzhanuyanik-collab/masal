'use strict';

document.addEventListener('DOMContentLoaded',()=>{
  const dialog=document.querySelector('[data-member-dialog]');
  if(!(dialog instanceof HTMLDialogElement)) return;

  const id=dialog.querySelector('[data-member-id]');
  const name=dialog.querySelector('[data-member-name]');
  const email=dialog.querySelector('[data-member-email]');
  const phone=dialog.querySelector('[data-member-phone]');
  const grade=dialog.querySelector('[data-member-grade]');

  document.querySelectorAll('[data-member-edit]').forEach(button=>{
    button.addEventListener('click',()=>{
      if(id) id.value=button.dataset.id||'0';
      if(name) name.value=button.dataset.name||'';
      if(email) email.value=button.dataset.email||'';
      if(phone) phone.value=button.dataset.phone||'';
      if(grade) grade.value=button.dataset.grade||'1';
      dialog.showModal();
    });
  });

  const close=()=>{ if(dialog.open) dialog.close(); };
  dialog.querySelector('[data-member-close]')?.addEventListener('click',close);
  dialog.addEventListener('click',event=>{
    if(event.target===dialog) close();
  });

  document.querySelectorAll('[data-member-delete]').forEach(form=>{
    form.addEventListener('submit',event=>{
      if(!window.confirm('Bu kullanıcı kurumdan çıkarılsın mı? Kayıt fiziksel olarak silinmez.')){
        event.preventDefault();
      }
    });
  });
});
