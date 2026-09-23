'use strict';
((scope)=>{
 const DB='ilkadim-pwa34', VERSION=1;
 const open=()=>new Promise((resolve,reject)=>{
  const r=indexedDB.open(DB,VERSION);
  r.onupgradeneeded=()=>{
   const db=r.result;
   if(!db.objectStoreNames.contains('packs'))db.createObjectStore('packs',{keyPath:'studentId'});
   if(!db.objectStoreNames.contains('pending')){
    const p=db.createObjectStore('pending',{keyPath:'op_id'});
    p.createIndex('studentId','studentId',{unique:false});
   }
  };
  r.onsuccess=()=>resolve(r.result);r.onerror=()=>reject(r.error||Error('Cihaz veritabanı açılamadı.'));
 });
 const transaction=async(names,mode,fn)=>{
  const db=await open();
  return new Promise((resolve,reject)=>{
   const tx=db.transaction(names,mode);let output;
   try{output=fn(tx);}catch(err){tx.abort();reject(err);return;}
   tx.oncomplete=()=>{db.close();resolve(output);};
   tx.onerror=()=>{db.close();reject(tx.error||Error('Cihaz kaydı başarısız.'));};
   tx.onabort=()=>{db.close();reject(tx.error||Error('Cihaz kaydı iptal edildi.'));};
  });
 };
 const query=async(store,key=null)=>{
  const db=await open();
  return new Promise((resolve,reject)=>{
   const tx=db.transaction(store,'readonly'),r=key===null?tx.objectStore(store).getAll():tx.objectStore(store).get(key);
   r.onsuccess=()=>resolve(r.result);
   r.onerror=()=>reject(r.error||Error('Cihaz kaydı okunamadı.'));
   tx.oncomplete=()=>db.close();tx.onerror=()=>db.close();
  });
 };
 const unique=items=>[...new Set(items)];
 const progressFrom=state=>({
  steps:Array.isArray(state?.steps)?state.steps.filter(x=>typeof x==='string'):[],
  games:Array.isArray(state?.games)?state.games.filter(x=>typeof x==='string'):[]
 });
 const mergeProgress=(a,b)=>({steps:unique([...(a?.steps||[]),...(b?.steps||[])]),games:unique([...(a?.games||[]),...(b?.games||[])])});
 const uuid=()=>typeof crypto?.randomUUID==='function'?crypto.randomUUID():
  'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g,c=>{
   const r=crypto.getRandomValues(new Uint8Array(1))[0]%16;return (c==='x'?r:(r&3|8)).toString(16);
  });
 scope.IlkAdimPwaStore={
  DB,open,progressFrom,mergeProgress,uuid,
  getPack:id=>query('packs',id),
  getPending:async(id)=>((await query('pending'))||[]).filter(p=>p.studentId===id).sort((a,b)=>a.created-b.created),
  savePack:pack=>transaction(['packs'],'readwrite',tx=>tx.objectStore('packs').put(pack)),
  saveOfflineEvent:(pack,event)=>transaction(['packs','pending'],'readwrite',tx=>{
    tx.objectStore('packs').put(pack);tx.objectStore('pending').put(event);
  }),
  removePending:id=>transaction(['pending'],'readwrite',tx=>tx.objectStore('pending').delete(id))
 };
})(typeof self!=='undefined'?self:window);
