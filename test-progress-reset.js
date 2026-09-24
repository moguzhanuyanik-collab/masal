'use strict';
(() => {
  const MARKER='ilkadim-progress-reset-v1.1.32';
  try{
    if(localStorage.getItem(MARKER)==='1')return;
  }catch(_){}

  const emptyProgress=state=>{
    if(!state||typeof state!=='object')return state;
    state.steps=[];
    state.attempts=[];
    state.history=[];
    state.games=[];
    state.readings=[];
    state.days=[];
    state.claimed=[];
    state.usage={};
    return state;
  };

  try{
    const key='ilk-adim-profile';
    const raw=localStorage.getItem(key);
    if(raw){
      const state=JSON.parse(raw);
      localStorage.setItem(key,JSON.stringify(emptyProgress(state)));
    }
  }catch(_){}

  if(window.ILKADIM_SERVER_STATE&&typeof window.ILKADIM_SERVER_STATE==='object'){
    emptyProgress(window.ILKADIM_SERVER_STATE);
  }
  window.ILKADIM_COMPLETED_STEPS=[];

  // Eski çevrimdışı paket ve bekleyen işlemler, sıfırlanan ilerlemeyi yeniden
  // sunucuya göndermesin. İçerik daha sonra Profil > Uygulamayı Kur'dan indirilebilir.
  try{
    if('indexedDB' in window)indexedDB.deleteDatabase('ilkadim-pwa34');
  }catch(_){}

  try{localStorage.setItem(MARKER,'1');}catch(_){}
})();
