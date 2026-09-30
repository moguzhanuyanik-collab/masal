'use strict';
importScripts('./pwa-store.js');

const CACHE='ilkadim-static-1.1.95';
const STATIC=[
 './offline-v4.html',
 './offline-v4.js',
 './v4-offline.css',
 './pwa-store.js',
 './manifest.webmanifest',
 './ilkadim-logo.svg',
 './ilkadim-logo-192.png',
 './ilkadim-logo-512.png'
];
const ALLOWED_PATHS=new Set(STATIC.map(x=>new URL(x,self.registration.scope).pathname));

self.addEventListener('install',event=>{
 event.waitUntil(caches.open(CACHE).then(async cache=>{
   const results=await Promise.allSettled(STATIC.map(url=>cache.add(new Request(url,{cache:'reload'}))));
   if(results.slice(0,4).some(r=>r.status!=='fulfilled'))throw Error('Offline core assets missing');
   await self.skipWaiting();
 }));
});

self.addEventListener('activate',event=>{
 event.waitUntil((async()=>{
  const names=await caches.keys();
  await Promise.all(names.filter(n=>n.startsWith('ilkadim-static-')&&n!==CACHE).map(n=>caches.delete(n)));
  await self.clients.claim();
 })());
});

self.addEventListener('fetch',event=>{
 const req=event.request,u=new URL(req.url);
 if(req.method!=='GET'||u.origin!==self.location.origin||u.pathname.includes('/api/'))return;

 if(req.mode==='navigate'){
  event.respondWith(fetch(req).catch(async()=>{
   const cached=await caches.match(
    new Request(new URL('./offline-v4.html',self.registration.scope).href),
    {ignoreSearch:true}
   );
   return cached||new Response('Çevrimdışı paket henüz hazırlanmadı.',{
    status:503,
    headers:{'Content-Type':'text/plain;charset=utf-8'}
   });
  }));
  return;
 }

 if(ALLOWED_PATHS.has(u.pathname)){
  event.respondWith(
   caches.match(req,{ignoreSearch:true}).then(cached=>cached||fetch(req))
  );
 }
});

self.addEventListener('sync',event=>{
 if(event.tag!=='ilkadim-pwa34-sync')return;
 event.waitUntil((async()=>{
  const store=self.IlkAdimPwaStore;
  let auth;
  try{
   const r=await fetch('./api/offline-sync.php',{credentials:'same-origin',cache:'no-store'});
   if(!r.ok)return;
   auth=await r.json();
   if(!auth.ok||!Number.isInteger(auth.student_id))return;
  }catch{return;}

  const tasks=await store.getPending(auth.student_id);
  for(const op of tasks){
   try{
    const r=await fetch('./api/offline-sync.php',{
     method:'POST',
     credentials:'same-origin',
     headers:{'Content-Type':'application/json','X-CSRF-Token':auth.csrf},
     body:JSON.stringify(op),
     cache:'no-store'
    });
    if(!r.ok)break;
    const data=await r.json();
    if(!data.ok||data.student_id!==op.student_id)break;
    await store.removePending(op.op_id);
    const pack=await store.getPack(op.student_id);
    if(pack){
     pack.progress=store.mergeProgress(pack.progress,store.progressFrom(data.state));
     await store.savePack(pack);
    }
   }catch{break;}
  }
 })());
});
