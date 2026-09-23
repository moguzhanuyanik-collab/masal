<?php
declare(strict_types=1);
require __DIR__ . '/src/bootstrap.php';
require __DIR__ . '/src/auth.php';

app_session_start();
try { clear_remember_cookie(db()); } catch (Throwable) { clear_remember_cookie(); }

$_SESSION = [];
if (ini_get('session.use_cookies')) {
    $params = session_get_cookie_params();
    setcookie(
        session_name(),
        '',
        time() - 42000,
        $params['path'] ?: '/',
        $params['domain'] ?? '',
        (bool)$params['secure'],
        (bool)$params['httponly']
    );
}
session_destroy();
?>
<!DOCTYPE html>
<html lang="tr"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Çıkış — İlkAdım</title></head>
<body>
<script>
(async()=>{
  try{
    localStorage.removeItem('ilk-adim-profile');
    localStorage.removeItem('ilkadim-pwa34-active-student');
    localStorage.removeItem('ilkadim-pwa-last-route');
  }catch(e){}
  const tasks=[];
  if('serviceWorker' in navigator){
    tasks.push(navigator.serviceWorker.getRegistrations().then(registrations=>Promise.all(
      registrations.filter(reg=>new URL(reg.active?.scriptURL||reg.waiting?.scriptURL||reg.installing?.scriptURL||location.href).pathname.endsWith('/service-worker.js'))
        .map(reg=>reg.unregister())
    )));
  }
  if('caches' in window){
    tasks.push(caches.keys().then(keys=>Promise.all(keys.filter(key=>
      key.startsWith('ilkadim-static-')||key.startsWith('ilkadim-runtime-')
    ).map(key=>caches.delete(key)))));
  }
  if('indexedDB' in window)tasks.push(new Promise(resolve=>{
    const request=indexedDB.deleteDatabase('ilkadim-pwa34');
    request.onsuccess=request.onerror=request.onblocked=()=>resolve();
  }));
  const fallback=setTimeout(()=>location.replace('login.php'),2500);
  await Promise.allSettled(tasks);
  clearTimeout(fallback);
  location.replace('login.php');
})();
</script>
<noscript><a href="login.php">Giriş ekranına dön</a></noscript>
</body></html>
