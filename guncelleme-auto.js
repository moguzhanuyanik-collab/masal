'use strict';

(() => {
    const STORAGE_KEY='ilkadim:auto-update:v2';
    const MAX_RELEASES=50;
    const MAX_HANDOFF_RETRIES=3;
    let running=false;
    let autoTimer=null;
    let autoConsumed=false;
    let reloading=false;

    function ui(){
        const value=window.ILKADIM_UPDATE_UI;
        if(!value || typeof value.request!=='function') throw new Error('Güncelleme arayüzü hazır değil.');
        return value;
    }
    function readState(){
        try{ const raw=window.localStorage.getItem(STORAGE_KEY); return raw?JSON.parse(raw):null; }
        catch(_){ return null; }
    }
    function writeState(value){
        try{ window.localStorage.setItem(STORAGE_KEY,JSON.stringify(value)); }catch(_){}
    }
    function clearState(){
        try{ window.localStorage.removeItem(STORAGE_KEY); }catch(_){}
    }
    function parts(version){
        return String(version||'').split('.').map(v=>Math.max(0,parseInt(v,10)||0));
    }
    function compareVersions(a,b){
        const x=parts(a),y=parts(b),n=Math.max(x.length,y.length,3);
        for(let i=0;i<n;i+=1){
            const av=x[i]||0,bv=y[i]||0;
            if(av>bv) return 1;
            if(av<bv) return -1;
        }
        return 0;
    }
    function identityReached(data,version,revision){
        const cmp=compareVersions(data&&data.local_version,version);
        if(cmp>0) return true;
        if(cmp<0) return false;
        return Number(data&&data.local_revision||0)>=Number(revision||0);
    }
    async function requestInstall(targetVersion,targetRevision){
        const u=ui();
        let retries=0;
        while(true){
            try{
                const data=await u.request('install');
                if(data.retry_required===true){
                    if(retries>=MAX_HANDOFF_RETRIES) throw new Error(data.message||'Updater yeniden deneme sınırına ulaştı.');
                    retries+=1;
                    u.statusTitle.textContent='Updater çekirdeği yenileniyor';
                    u.statusText.textContent='Yeni çekirdekle otomatik devam ediliyor...';
                    await new Promise(resolve=>setTimeout(resolve,350));
                    continue;
                }
                return data;
            }catch(error){
                let check;
                try{
                    check=await u.request('check');
                    u.applyState(check);
                }catch(_){ throw error; }
                if(identityReached(check,targetVersion,targetRevision)){
                    return {
                        ok:true,
                        reconciled:true,
                        local_version:check.local_version,
                        local_revision:check.local_revision,
                        remote_version:check.remote_version,
                        remote_revision:check.remote_revision,
                        remote_name:check.remote_name,
                        commit:check.commit,
                        update_available:check.update_available,
                        message:'Kurulum sunucuda tamamlandı ve sürüm yeniden doğrulandı.'
                    };
                }
                throw error;
            }
        }
    }
    async function start(options={}){
        const u=ui();
        const automatic=options.automatic===true;
        if(running || u.isBusy()) return;

        if(!automatic){
            autoConsumed=true;
            if(autoTimer!==null){ clearTimeout(autoTimer); autoTimer=null; }
        }else if(autoConsumed){
            return;
        }else{
            autoConsumed=true;
        }

        const previous=readState();
        if(automatic && previous && (previous.status==='paused' || previous.status==='error')){
            u.statusTitle.textContent='Otomatik güncelleme bekliyor';
            u.statusText.textContent='Önceki işlem durdurulmuş veya hata vermiş. Tekrar başlatmak için güncelleme düğmesini kullan.';
            return;
        }

        running=true;
        u.setBusy(true,'install');

        try{
            const check=await u.request('check');
            u.applyState(check);

            if(!check.update_available){
                clearState();
                u.statusTitle.textContent='Sistem güncel';
                u.statusText.textContent='GitHub üzerinde kurulabilecek yeni sürüm yok.';
                return;
            }

            const installedCount=Math.max(0,Number(previous&&previous.installed_count||0));
            if(installedCount>=MAX_RELEASES) throw new Error('Otomatik güncelleme 50 sürümlük güvenlik sınırına ulaştı.');

            const targetVersion=String(check.remote_version||'');
            const targetRevision=Number(check.remote_revision||0);
            const label=targetVersion+(targetRevision>0?' rev '+targetRevision:'');

            writeState({
                status:'running',
                installed_count:installedCount,
                target_version:targetVersion,
                target_revision:targetRevision
            });
            u.statusTitle.textContent=label+' kuruluyor';
            u.statusText.textContent='Yedek, doğrulama ve kurulum adımları çalışıyor...';

            const result=await requestInstall(targetVersion,targetRevision);
            u.applyState(result);

            writeState({
                status:'running',
                installed_count:installedCount+1,
                last_success_version:String(result.local_version||targetVersion),
                last_success_revision:Number(result.local_revision||targetRevision)
            });

            u.statusTitle.textContent='Sürüm kuruldu';
            u.statusText.textContent='Güncelleme motoru yeni sürüm koduyla otomatik devam edecek.';
            reloading=true;
            running=false;
            u.setBusy(false);

            const nextUrl=new URL(window.location.href);
            nextUrl.searchParams.set('auto_resume','1');
            nextUrl.searchParams.set('_',String(Date.now()));
            window.location.replace(nextUrl.toString());
        }catch(error){
            writeState({status:'error',message:error&&error.message?error.message:'Bilinmeyen güncelleme hatası.'});
            u.statusTitle.textContent='Güncelleme durdu';
            u.statusText.textContent='Sonraki sürüme geçilmedi.';
            u.showMessage('Güncelleme hatası',error&&error.message?error.message:'Güncelleme tamamlanamadı.');
        }finally{
            if(!reloading){ running=false; u.setBusy(false); }
        }
    }

    window.addEventListener('beforeunload',event=>{
        if(!running || reloading) return;
        event.preventDefault();
        event.returnValue='';
    });

    window.ILKADIM_AUTO_UPDATE={start,isRunning:()=>running,compareVersions,identityReached};

    window.addEventListener('ilkadim-updater-ready',()=>{
        const u=ui();
        if(u.elements.checkButton) u.elements.checkButton.addEventListener('click',()=>start({automatic:false}));
        if(u.elements.installButton) u.elements.installButton.addEventListener('click',()=>start({automatic:false}));
        autoTimer=setTimeout(()=>{ autoTimer=null; start({automatic:true}); },450);
    },{once:true});
})();