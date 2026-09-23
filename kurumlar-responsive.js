(()=>{'use strict';
const root=document.getElementById('km-content');
if(!root)return;

const decorate=()=>{
  root.querySelectorAll('.km-table').forEach(table=>{
    const labels=[...table.querySelectorAll('thead th')].map(th=>(th.textContent||'').replace(/\s+/g,' ').trim());
    table.querySelectorAll('tbody tr').forEach(row=>{
      [...row.children].forEach((cell,index)=>{
        if(cell.tagName!=='TD')return;
        if(cell.hasAttribute('colspan')){
          cell.removeAttribute('data-label');
          return;
        }
        cell.dataset.label=labels[index]||'';
      });
    });
  });
};

new MutationObserver(decorate).observe(root,{childList:true,subtree:true});
document.addEventListener('DOMContentLoaded',decorate);
window.addEventListener('resize',decorate);
decorate();
})();
