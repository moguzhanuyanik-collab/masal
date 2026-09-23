(()=>{'use strict';
const dialog=document.getElementById('institution-dialog');
const form=document.getElementById('institution-form');
if(!dialog||!form)return;
const title=document.getElementById('institution-dialog-title');
const action=form.querySelector('[name="action"]');
const id=form.querySelector('[name="kurum_id"]');
const fields=['ad','kod','tur','icerik_kaynagi','email','telefon','adres'];
const resetCreate=()=>{
 form.reset(); action.value='create'; id.value='0';
 if(title)title.textContent='Yeni Kurum Ekle';
 const t=form.querySelector('[name="tur"]');if(t)t.value='okul';
 const k=form.querySelector('[name="icerik_kaynagi"]');if(k)k.value='kurum';
};
const openDialog=()=>{if(typeof dialog.showModal==='function')dialog.showModal();else dialog.setAttribute('open','open');};
document.querySelectorAll('[data-institution-create]').forEach(btn=>btn.addEventListener('click',()=>{resetCreate();openDialog();}));
document.querySelectorAll('[data-institution-edit]').forEach(btn=>btn.addEventListener('click',()=>{
 form.reset();action.value='update';id.value=btn.dataset.id||'0';if(title)title.textContent='Kurumu Güncelle';
 fields.forEach(name=>{const el=form.querySelector('[name="'+name+'"]');if(el)el.value=btn.dataset[name]||'';});
 openDialog();
}));
document.querySelectorAll('[data-institution-close]').forEach(btn=>btn.addEventListener('click',()=>dialog.close()));
dialog.addEventListener('click',e=>{if(e.target===dialog)dialog.close();});
document.querySelectorAll('[data-institution-disable]').forEach(btn=>btn.addEventListener('click',e=>{
 const name=btn.dataset.name||'Bu kurum';
 if(!window.confirm(name+' pasife alınsın mı? Kurumdaki üyelikler ve yalnızca bu kuruma bağlı kullanıcı hesapları da pasif olacaktır.'))e.preventDefault();
}));
})();
