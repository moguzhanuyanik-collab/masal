'use strict';

(() => {
  const RESET_MARKER='ilkadim-explicit-progress-reset';
  const nativeFetch=window.fetch.bind(window);

  document.addEventListener('click',event=>{
    const target=event.target;
    if(!(target instanceof Element))return;
    const reset=target.closest('#confirm-reset');
    if(!reset)return;
    try{sessionStorage.setItem(RESET_MARKER,'1');}catch(_){}
  },true);

  window.fetch=function(input,init){
    try{
      const url=typeof input==='string'?input:(input&&input.url)||'';
      const method=String(init&&init.method||'GET').toUpperCase();
      if(/(?:^|\/)api\/state\.php(?:\?|$)/.test(url)&&method==='POST'&&init&&typeof init.body==='string'){
        let explicitReset=false;
        try{explicitReset=sessionStorage.getItem(RESET_MARKER)==='1';}catch(_){}
        if(explicitReset){
          const payload=JSON.parse(init.body);
          if(payload&&typeof payload==='object'){
            payload.reset_progress=true;
            init={...init,body:JSON.stringify(payload)};
            try{sessionStorage.removeItem(RESET_MARKER);}catch(_){}
          }
        }
      }
    }catch(_){}
    return nativeFetch(input,init);
  };

  const mergeUniqueStrings=(a,b)=>{
    const out=[];
    const seen=new Set();
    [...(Array.isArray(a)?a:[]),...(Array.isArray(b)?b:[])].forEach(value=>{
      const key=String(value||'').trim();
      if(!key||seen.has(key))return;
      seen.add(key);
      out.push(key);
    });
    return out;
  };

  try{
    const server=window.ILKADIM_SERVER_STATE;
    if(server&&typeof server==='object'){
      const raw=localStorage.getItem('ilk-adim-profile');
      const local=raw?JSON.parse(raw):{};
      if(local&&typeof local==='object'){
        server.steps=mergeUniqueStrings(server.steps,local.steps);
        server.games=mergeUniqueStrings(server.games,local.games);
        localStorage.setItem('ilk-adim-profile',JSON.stringify(server));
      }
    }
  }catch(_){}

  window.IlkAdimProgressPersistence=Object.freeze({
    markExplicitReset(){
      try{sessionStorage.setItem(RESET_MARKER,'1');}catch(_){}
    }
  });
})();