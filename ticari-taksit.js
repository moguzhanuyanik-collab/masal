'use strict';

document.addEventListener('DOMContentLoaded',()=>{
  const form=document.querySelector('[data-tp-plan]');
  if(!form)return;
  const rows=form.querySelector('[data-tp-rows]');
  const add=form.querySelector('[data-tp-add]');
  if(!rows||!add)return;

  const renumber=()=>{
    [...rows.querySelectorAll('[data-tp-row]')].forEach((row,index)=>{
      const number=row.querySelector('[data-tp-number]');
      if(number)number.textContent=String(index+1);
    });
  };

  const wire=(row)=>{
    const remove=row.querySelector('[data-tp-remove]');
    if(remove)remove.addEventListener('click',()=>{
      if(rows.querySelectorAll('[data-tp-row]').length<=2)return;
      row.remove();
      renumber();
    });
  };

  [...rows.querySelectorAll('[data-tp-row]')].forEach(wire);

  add.addEventListener('click',()=>{
    const current=rows.querySelectorAll('[data-tp-row]').length;
    if(current>=24)return;
    const row=document.createElement('div');
    row.className='tp-plan-row';
    row.setAttribute('data-tp-row','');
    row.innerHTML='<span data-tp-number></span>'
      +'<input class="role-input" type="date" name="taksit_vade[]" required>'
      +'<input class="role-input" inputmode="decimal" name="taksit_tutar[]" required placeholder="0,00">'
      +'<input class="role-input" name="taksit_aciklama[]" maxlength="500" placeholder="Açıklama">'
      +'<button class="role-pill" type="button" data-tp-remove>Sil</button>';
    rows.appendChild(row);
    wire(row);
    renumber();
  });
});