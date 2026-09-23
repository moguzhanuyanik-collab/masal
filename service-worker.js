'use strict';

self.addEventListener('install',event=>{
  event.waitUntil(self.skipWaiting());
});

self.addEventListener('activate',event=>{
  event.waitUntil((async()=>{
    try{
      const keys=await caches.keys();
      await Promise.all(keys.filter(key=>key.startsWith('ilkadim-')).map(key=>caches.delete(key)));
    }catch(e){}
    try{await self.registration.unregister();}catch(e){}
    try{
      const clients=await self.clients.matchAll({type:'window',includeUncontrolled:true});
      for(const client of clients){
        try{client.postMessage({type:'PWA_ROLLBACK_COMPLETE'});}catch(e){}
      }
    }catch(e){}
  })());
});
