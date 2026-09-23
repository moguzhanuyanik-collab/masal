'use strict';
(() => {
  const FLAG='ilkadim-pwa-rollback-1.0.31';

  async function cleanup(){
    let changed=false;

    try{
      if('serviceWorker' in navigator){
        const registrations=await navigator.serviceWorker.getRegistrations();
        for(const registration of registrations){
          const scope=String(registration.scope||'');
          if(scope.includes(location.host)){
            const ok=await registration.unregister();
            changed=changed||ok;
          }
        }
      }
    }catch(e){}

    try{
      if('caches' in window){
        const keys=await caches.keys();
        for(const key of keys){
          if(key.startsWith('ilkadim-')){
            const ok=await caches.delete(key);
            changed=changed||ok;
          }
        }
      }
    }catch(e){}

    try{
      localStorage.removeItem('ilkadim-pwa-last-route');
      localStorage.removeItem('ilkadim-pwa-device-key');
    }catch(e){}

    try{
      if(changed && sessionStorage.getItem(FLAG)!=='1'){
        sessionStorage.setItem(FLAG,'1');
        location.reload();
      }
    }catch(e){}
  }

  if(document.readyState==='loading'){
    document.addEventListener('DOMContentLoaded',cleanup,{once:true});
  }else{
    cleanup();
  }
})();
