<?php
declare(strict_types=1);
require __DIR__.'/src/bootstrap.php';
require __DIR__.'/src/auth.php';

$user=require_role('super_admin');
header('Cache-Control: no-store, max-age=0');
header('Pragma: no-cache');
header('X-Content-Type-Options: nosniff');
function aa_h(string $value): string { return htmlspecialchars($value,ENT_QUOTES,'UTF-8'); }
function aa_placeholder_key(string $value): bool {
    $normalized=strtoupper(trim($value," \t\n\r\0\x0B<>[]{}'\""));
    return preg_match('/^(?:(?:GROQ|GEMINI|OPENAI)[_ -]?)?API[_ -]?(?:KEY|ANAHTARI|ANAHTARINIZ)$/D',$normalized)===1
        || preg_match('/^(?:YOUR[_ -]?API[_ -]?KEY|CHANGE[_ -]?ME|ANAHTARI[_ -]?BURAYA[_ -]?YAZ)$/D',$normalized)===1;
}
function aa_settings_fingerprint(string $file): string {
    if(!is_file($file)) return '';
    $hash=hash_file('sha256',$file);
    return is_string($hash)?$hash:'';
}
function aa_provider_test_text(string $provider,array $decoded): string {
    if($provider==='groq') return trim((string)($decoded['choices'][0]['message']['content']??''));
    if($provider==='gemini'){
        $parts=[];
        foreach((array)($decoded['candidates'][0]['content']['parts']??[]) as $part){
            if(is_array($part) && empty($part['thought']) && is_string($part['text']??null)) $parts[]=$part['text'];
        }
        return trim(implode(' ',$parts));
    }
    if(is_string($decoded['output_text']??null)) return trim($decoded['output_text']);
    $parts=[];
    foreach((array)($decoded['output']??[]) as $item){
        foreach((array)($item['content']??[]) as $content){
            if(is_string($content['text']??null)) $parts[]=$content['text'];
        }
    }
    return trim(implode(' ',$parts));
}
function aa_embedded_error_message(mixed $error): string {
    if($error===null) return '';
    if(!is_array($error)) return 'sağlayıcı geçerli bir hata yanıtı döndürmedi';
    $code=strtoupper((string)($error['code']??$error['status']??$error['type']??''));
    if(in_array($code,['402','429'],true)||preg_match('/(?:RESOURCE_EXHAUSTED|RATE_LIMIT|QUOTA|TOO_MANY_REQUESTS)/',$code)) return 'sağlayıcı kotası, bakiyesi veya istek sınırı testi engelledi';
    if(in_array($code,['401','403'],true)||preg_match('/(?:UNAUTHENTICATED|PERMISSION_DENIED|INVALID_API_KEY|AUTH)/',$code)) return 'API anahtarı sağlayıcı tarafından reddedildi';
    if(in_array($code,['400','404','422'],true)||preg_match('/(?:INVALID_ARGUMENT|NOT_FOUND|MODEL|BAD_REQUEST)/',$code)) return 'model kimliği veya istek ayarı sağlayıcı tarafından kabul edilmedi';
    return 'sağlayıcı isteği tamamlayamadı';
}
function aa_test_provider(string $provider,string $model,string $apiKey): string {
    if(!function_exists('curl_init')) throw new RuntimeException('Aday ayarlar uygulanmadı: sunucuda cURL kapalı olduğu için bağlantı test edilemedi.');
    if($apiKey==='') throw new RuntimeException('Aday ayarlar uygulanmadı: seçilen sağlayıcının API anahtarı bulunamadı.');
    $prompt='Yalnızca TAMAM yaz.';
    if($provider==='gemini'){
        $url='https://generativelanguage.googleapis.com/v1beta/models/'.rawurlencode($model).':generateContent';
        $headers=['x-goog-api-key: '.$apiKey,'Content-Type: application/json'];
        $payload=['contents'=>[['parts'=>[['text'=>$prompt]]]],'generationConfig'=>['maxOutputTokens'=>8]];
    }elseif($provider==='groq'){
        $url='https://api.groq.com/openai/v1/chat/completions';
        $headers=['Authorization: Bearer '.$apiKey,'Content-Type: application/json'];
        $payload=['model'=>$model,'messages'=>[['role'=>'user','content'=>$prompt]],'max_tokens'=>8];
    }else{
        $url='https://api.openai.com/v1/responses';
        $headers=['Authorization: Bearer '.$apiKey,'Content-Type: application/json'];
        $payload=['model'=>$model,'input'=>$prompt,'max_output_tokens'=>8];
    }
    $ch=curl_init($url);
    if($ch===false) throw new RuntimeException('Aday ayarlar uygulanmadı: bağlantı testi başlatılamadı.');
    curl_setopt_array($ch,[CURLOPT_POST=>true,CURLOPT_RETURNTRANSFER=>true,CURLOPT_CONNECTTIMEOUT=>6,CURLOPT_TIMEOUT=>15,CURLOPT_HTTPHEADER=>$headers,CURLOPT_POSTFIELDS=>json_encode($payload,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES)]);
    $body=curl_exec($ch);
    $errno=curl_errno($ch);
    $status=(int)curl_getinfo($ch,CURLINFO_RESPONSE_CODE);
    curl_close($ch);
    if($errno===CURLE_OPERATION_TIMEDOUT || $status===408 || $status===504) throw new RuntimeException('Aday ayarlar uygulanmadı: bağlantı testi zaman aşımına uğradı; önceki ayarlar korundu.');
    if($errno!==0) throw new RuntimeException('Aday ayarlar uygulanmadı: sağlayıcıya ağ bağlantısı kurulamadı; önceki ayarlar korundu.');
    if($status===401 || $status===403) throw new RuntimeException('Aday ayarlar uygulanmadı: API anahtarı sağlayıcı tarafından reddedildi; önceki ayarlar korundu.');
    if($status===402 || $status===429) throw new RuntimeException('Aday ayarlar uygulanmadı: sağlayıcı kotası, bakiyesi veya istek sınırı testi engelledi; önceki ayarlar korundu.');
    if($status===400 || $status===404 || $status===422) throw new RuntimeException('Aday ayarlar uygulanmadı: model kimliği veya istek ayarı sağlayıcı tarafından kabul edilmedi; önceki ayarlar korundu.');
    if($status<200 || $status>=300) throw new RuntimeException('Aday ayarlar uygulanmadı: sağlayıcı geçici olarak yanıt veremedi; önceki ayarlar korundu.');
    $decoded=is_string($body)?json_decode($body,true):null;
    unset($body);
    if(!is_array($decoded)) throw new RuntimeException('Aday ayarlar uygulanmadı: sağlayıcı geçerli bir sohbet yanıtı üretmedi; önceki ayarlar korundu.');
    $embeddedError=aa_embedded_error_message($decoded['error']??null);
    if($embeddedError!=='') throw new RuntimeException('Aday ayarlar uygulanmadı: '.$embeddedError.'; önceki ayarlar korundu.');
    $incomplete=($provider==='groq' && (string)($decoded['choices'][0]['finish_reason']??'')==='length')
        || ($provider==='gemini' && (string)($decoded['candidates'][0]['finishReason']??'')==='MAX_TOKENS')
        || ($provider==='openai' && ((string)($decoded['status']??'')==='incomplete' || isset($decoded['incomplete_details'])));
    if($incomplete) throw new RuntimeException('Aday ayarlar uygulanmadı: sağlayıcının test yanıtı tamamlanmadan kesildi; önceki ayarlar korundu.');
    if(aa_provider_test_text($provider,$decoded)==='') throw new RuntimeException('Aday ayarlar uygulanmadı: sağlayıcı geçerli bir sohbet yanıtı üretmedi; önceki ayarlar korundu.');
    return 'Bağlantı testi başarılı: '.strtoupper($provider).' anahtarı ve '.$model.' modeli doğrulandı.';
}
function aa_test_voice_provider(string $provider,string $model,string $apiKey): string {
    if(!function_exists('curl_init')) throw new RuntimeException('Aday ses ayarları uygulanmadı: sunucuda cURL kapalı olduğu için konuşma modeli test edilemedi.');
    if($apiKey==='') throw new RuntimeException('Aday ses ayarları uygulanmadı: konuşma sağlayıcısının API anahtarı bulunamadı.');
    $sampleRate=8000;
    $audio=str_repeat("\0\0",$sampleRate);
    $wav='RIFF'.pack('V',36+strlen($audio)).'WAVEfmt '.pack('VvvVVvv',16,1,1,$sampleRate,$sampleRate*2,2,16).'data'.pack('V',strlen($audio)).$audio;
    $temp=null;
    try{
        if($provider==='groq'){
            $temp=tempnam(sys_get_temp_dir(),'adimbot_voice_');
            if($temp===false || file_put_contents($temp,$wav)!==strlen($wav)) throw new RuntimeException('Konuşma testi için geçici ses kaydı oluşturulamadı.');
            $url='https://api.groq.com/openai/v1/audio/transcriptions';
            $headers=['Authorization: Bearer '.$apiKey];
            $payload=['file'=>new CURLFile($temp,'audio/wav','adimbot-test.wav'),'model'=>$model,'language'=>'tr','response_format'=>'json'];
        }else{
            $url='https://generativelanguage.googleapis.com/v1beta/models/'.rawurlencode($model).':generateContent';
            $headers=['x-goog-api-key: '.$apiKey,'Content-Type: application/json'];
            $payload=json_encode(['contents'=>[['parts'=>[
                ['text'=>'Bu test sesini yalnızca yazıya çevir; konuşma yoksa boş bırak.'],
                ['inline_data'=>['mime_type'=>'audio/wav','data'=>base64_encode($wav)]],
            ]]]]],JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES);
        }
        $ch=curl_init($url);
        if($ch===false) throw new RuntimeException('Konuşma sağlayıcısı testi başlatılamadı.');
        curl_setopt_array($ch,[CURLOPT_POST=>true,CURLOPT_RETURNTRANSFER=>true,CURLOPT_CONNECTTIMEOUT=>6,CURLOPT_TIMEOUT=>20,CURLOPT_HTTPHEADER=>$headers,CURLOPT_POSTFIELDS=>$payload]);
        $body=curl_exec($ch);
        $errno=curl_errno($ch);
        $status=(int)curl_getinfo($ch,CURLINFO_RESPONSE_CODE);
        curl_close($ch);
    }finally{
        if(is_string($temp) && is_file($temp)) @unlink($temp);
    }
    if($errno===CURLE_OPERATION_TIMEDOUT || $status===408 || $status===504) throw new RuntimeException('Sohbet bağlantısı doğrulandı ancak konuşma modeli testi zaman aşımına uğradı; aday ayarlar uygulanmadı.');
    if($errno!==0) throw new RuntimeException('Sohbet bağlantısı doğrulandı ancak konuşma sağlayıcısına ağ bağlantısı kurulamadı; aday ayarlar uygulanmadı.');
    if($status===401 || $status===403) throw new RuntimeException('Sohbet bağlantısı doğrulandı ancak konuşma sağlayıcısının API anahtarı reddedildi; aday ayarlar uygulanmadı.');
    if($status===402 || $status===429) throw new RuntimeException('Sohbet bağlantısı doğrulandı ancak konuşma sağlayıcısının kotası veya bakiyesi testi engelledi; aday ayarlar uygulanmadı.');
    if($status===400 || $status===404 || $status===422) throw new RuntimeException('Sohbet bağlantısı doğrulandı ancak seçilen konuşma modeli veya istek ayarı kabul edilmedi; aday ayarlar uygulanmadı.');
    if($status<200 || $status>=300) throw new RuntimeException('Sohbet bağlantısı doğrulandı ancak konuşma sağlayıcısı geçici olarak yanıt veremedi; aday ayarlar uygulanmadı.');
    $decoded=is_string($body)?json_decode($body,true):null;
    unset($body);
    if(!is_array($decoded)) throw new RuntimeException('Sohbet bağlantısı doğrulandı ancak konuşma modeli yanıtı okunamadı.');
    $embeddedError=aa_embedded_error_message($decoded['error']??null);
    if($embeddedError!=='') throw new RuntimeException('Sohbet bağlantısı doğrulandı ancak '.$embeddedError.'; aday ayarlar uygulanmadı.');
    return 'Konuşma uç noktası gerçek test kaydıyla doğrulandı: '.strtoupper($provider).' '.$model.'.';
}
$message='';
$error='';
$config=require __DIR__.'/config/app.php';
$ai=is_array($config['ai']??null)?$config['ai']:[];
$settingsFile=__DIR__.'/storage/adimbot-ai.php';

if($_SERVER['REQUEST_METHOD']==='POST'){
    try{
        if(!verify_csrf($_POST['csrf']??null)) throw new RuntimeException('Oturum doğrulaması başarısız. Sayfayı yenileyin.');
        $provider=strtolower(trim((string)($_POST['provider']??'')));
        $model=trim((string)($_POST['model']??''));
        $newKey=trim((string)($_POST['groq_api_key']??''));
        $newGeminiKey=trim((string)($_POST['gemini_api_key']??''));
        $enabled=isset($_POST['enabled']);
        $voiceEnabled=isset($_POST['voice_enabled']);
        $voiceInput=trim((string)($_POST['voice_input']??'browser'));
        $transcriptionModel=trim((string)($_POST['voice_transcription_model']??'whisper-large-v3-turbo'));
        $geminiVoiceModel=trim((string)($_POST['voice_gemini_model']??'gemini-3.5-flash-lite'));
        $timeoutSeconds=(int)($_POST['timeout_seconds']??20);
        $limit=(int)($_POST['max_requests_per_10_minutes']??20);
        if(!in_array($provider,['groq','openai','gemini'],true)) throw new RuntimeException('Sağlayıcı seçimi geçersiz.');
        if(!preg_match('~^[A-Za-z0-9._/-]{2,100}$~D',$model)) throw new RuntimeException('Model adı geçersiz.');
        if($provider==='groq' && (str_starts_with($model,'gpt-') || str_starts_with($model,'gemini-'))) throw new RuntimeException('Groq için Groq model kimliğini seçin.');
        if($provider==='gemini' && !preg_match('/^gemini-[A-Za-z0-9._-]+$/D',$model)) throw new RuntimeException('Gemini model kimliği gemini- ile başlamalı.');
        if($provider==='openai' && (str_starts_with($model,'gemini-') || str_starts_with($model,'llama-'))) throw new RuntimeException('OpenAI için OpenAI model kimliğini seçin.');
        if($newKey!=='' && (strlen($newKey)>512 || preg_match('/\s/',$newKey))) throw new RuntimeException('API anahtarını kontrol edin.');
        if($newGeminiKey!=='' && (strlen($newGeminiKey)>512 || preg_match('/\s/',$newGeminiKey))) throw new RuntimeException('Gemini API anahtarını kontrol edin.');
        if($newKey!=='' && aa_placeholder_key($newKey)) throw new RuntimeException('Örnek Groq anahtarı kaydedilemez; sağlayıcı panelindeki gerçek anahtarı girin.');
        if($newGeminiKey!=='' && aa_placeholder_key($newGeminiKey)) throw new RuntimeException('Örnek Gemini anahtarı kaydedilemez; sağlayıcı panelindeki gerçek anahtarı girin.');
        if(!in_array($voiceInput,['browser','groq','gemini'],true)) throw new RuntimeException('Mikrofon yöntemi geçersiz.');
        if(!in_array($transcriptionModel,['whisper-large-v3-turbo','whisper-large-v3'],true)) throw new RuntimeException('Groq konuşma modeli geçersiz.');
        if(!preg_match('/^gemini-[A-Za-z0-9._-]+$/D',$geminiVoiceModel)) throw new RuntimeException('Gemini konuşma modeli geçersiz.');
        if($timeoutSeconds<5 || $timeoutSeconds>40) throw new RuntimeException('Bağlantı zaman aşımı 5 ile 40 saniye arasında olmalı.');
        if($limit<3 || $limit>60) throw new RuntimeException('10 dakikalık sınır 3 ile 60 arasında olmalı.');

        $dir=dirname($settingsFile);
        if(!is_dir($dir) && !mkdir($dir,0750,true) && !is_dir($dir)) throw new RuntimeException('Ayar klasörü oluşturulamadı.');
        $lock=fopen($dir.'/adimbot-ai.lock','c');
        if($lock===false || !flock($lock,LOCK_EX)) throw new RuntimeException('Ayar dosyası kilitlenemedi.');
        try{
            $saved=is_file($settingsFile)?require $settingsFile:[];
            if(!is_array($saved)) throw new RuntimeException('Mevcut ayarlar okunamadı.');
            $settingsFingerprint=aa_settings_fingerprint($settingsFile);
            $groqKey=$newKey!==''?$newKey:trim((string)($saved['groq_api_key']??($ai['groq_api_key']??'')));
            if(isset($_POST['clear_groq_key'])) $groqKey='';
            $geminiKey=$newGeminiKey!==''?$newGeminiKey:trim((string)($saved['gemini_api_key']??($ai['gemini_api_key']??'')));
            if(isset($_POST['clear_gemini_key'])) $geminiKey='';
            if(aa_placeholder_key($groqKey)) $groqKey='';
            if(aa_placeholder_key($geminiKey)) $geminiKey='';
            if($provider==='groq' && $enabled && $groqKey==='' && trim((string)(getenv('GROQ_API_KEY')?:''))==='') {
                throw new RuntimeException('Groq için API anahtarı girin veya sunucuda GROQ_API_KEY tanımlayın.');
            }
            if($provider==='gemini' && $enabled && $geminiKey==='' && trim((string)(getenv('GEMINI_API_KEY')?:''))==='') {
                throw new RuntimeException('Gemini için API anahtarı girin veya sunucuda GEMINI_API_KEY tanımlayın.');
            }
            if($voiceEnabled && $voiceInput==='groq' && $groqKey==='' && trim((string)(getenv('GROQ_API_KEY')?:''))==='') throw new RuntimeException('Groq konuşma tanıma için Groq anahtarı gerekli.');
            if($voiceEnabled && $voiceInput==='gemini' && $geminiKey==='' && trim((string)(getenv('GEMINI_API_KEY')?:''))==='') throw new RuntimeException('Gemini konuşma tanıma için Gemini anahtarı gerekli.');
            $candidate=$saved;
            $candidate['provider']=$provider;
            $candidate['model']=$model;
            $candidate['enabled']=$enabled;
            $candidate['max_requests_per_10_minutes']=$limit;
            $candidate['groq_api_key']=$groqKey;
            $candidate['gemini_api_key']=$geminiKey;
            $candidate['voice_enabled']=$voiceEnabled;
            $candidate['voice_input']=$voiceInput;
            $candidate['voice_transcription_model']=$transcriptionModel;
            $candidate['voice_gemini_model']=$geminiVoiceModel;
            $candidate['timeout_seconds']=$timeoutSeconds;
        }finally{
            flock($lock,LOCK_UN);
            fclose($lock);
        }
        if(($_POST['action']??'save')==='save_test'){
            if(!$enabled) throw new RuntimeException('Bağlantıyı etkinleştirmek için AdımBot AI yanıtları açık kutusunu işaretleyip tekrar test edin. Kapalı ayarlar uygulanmadı.');
            $testKey=match($provider){
                'groq'=>trim((string)($groqKey!==''?$groqKey:getenv('GROQ_API_KEY'))),
                'gemini'=>trim((string)($geminiKey!==''?$geminiKey:getenv('GEMINI_API_KEY'))),
                default=>trim((string)(getenv('OPENAI_API_KEY')?:($ai['api_key']??''))),
            };
            $testMessage=aa_test_provider($provider,$model,$testKey);
            if($voiceEnabled && $voiceInput!=='browser'){
                $voiceModel=$voiceInput==='groq'?$transcriptionModel:$geminiVoiceModel;
                $voiceKey=$voiceInput==='groq'
                    ?trim((string)($groqKey!==''?$groqKey:getenv('GROQ_API_KEY')))
                    :trim((string)($geminiKey!==''?$geminiKey:getenv('GEMINI_API_KEY')));
                $voiceTestMessage=aa_test_voice_provider($voiceInput,$voiceModel,$voiceKey);
            }
        }
        $lock=fopen($dir.'/adimbot-ai.lock','c');
        if($lock===false || !flock($lock,LOCK_EX)) throw new RuntimeException('Ayar dosyası kilitlenemedi.');
        $temp=null;
        try{
            if(!hash_equals($settingsFingerprint,aa_settings_fingerprint($settingsFile))){
                throw new RuntimeException('Ayarlar test sırasında başka bir yönetici tarafından değiştirildi. Yeni değerleri görüp işlemi yeniden deneyin.');
            }
            $temp=tempnam($dir,'adimbot_');
            if($temp===false) throw new RuntimeException('Ayar dosyası oluşturulamadı.');
            $contents="<?php\ndeclare(strict_types=1);\nreturn ".var_export($candidate,true).";\n";
            if(file_put_contents($temp,$contents)!==strlen($contents) || !chmod($temp,0600) || !rename($temp,$settingsFile)){
                throw new RuntimeException('Ayarlar kaydedilemedi.');
            }
            $temp=null;
        }finally{
            if(is_string($temp) && is_file($temp)) @unlink($temp);
            flock($lock,LOCK_UN);
            fclose($lock);
        }
        if(function_exists('opcache_invalidate')) @opcache_invalidate($settingsFile,true);
        $message='AdımBot ayarları kaydedildi.';
        if(!$enabled) $message.=' Dikkat: Yapay zekâ sohbeti kapalı; robot sağlayıcıya soru göndermez.';
        if(isset($testMessage)) $message.=' '.$testMessage;
        if(isset($voiceTestMessage)) $message.=' '.$voiceTestMessage;
        $config=require __DIR__.'/config/app.php';
        $ai=is_array($config['ai']??null)?$config['ai']:[];
    }catch(Throwable $e){
        $error=$e instanceof RuntimeException?$e->getMessage():'Ayarlar kaydedilemedi.';
        $config=require __DIR__.'/config/app.php';
        $ai=is_array($config['ai']??null)?$config['ai']:[];
    }
}

$provider=(string)($ai['provider']??'openai');
$displaySaved=is_file($settingsFile)?require $settingsFile:[];
if(!is_array($displaySaved)) $displaySaved=[];
$groqStored=trim((string)($displaySaved['groq_api_key']??''))!=='' && !aa_placeholder_key((string)$displaySaved['groq_api_key']);
$groqLocal=!$groqStored && trim((string)($ai['groq_api_key']??''))!=='' && !aa_placeholder_key((string)$ai['groq_api_key']);
$groqEnvironment=trim((string)(getenv('GROQ_API_KEY')?:''))!=='' && !aa_placeholder_key((string)getenv('GROQ_API_KEY'));
$geminiStored=trim((string)($displaySaved['gemini_api_key']??''))!=='' && !aa_placeholder_key((string)$displaySaved['gemini_api_key']);
$geminiLocal=!$geminiStored && trim((string)($ai['gemini_api_key']??''))!=='' && !aa_placeholder_key((string)$ai['gemini_api_key']);
$geminiEnvironment=trim((string)(getenv('GEMINI_API_KEY')?:''))!=='' && !aa_placeholder_key((string)getenv('GEMINI_API_KEY'));
$keySet=$groqStored || $groqLocal || $groqEnvironment;
$geminiKeySet=$geminiStored || $geminiLocal || $geminiEnvironment;
$groqKeySource=$groqStored?'panelde korumalı ayar dosyasında kayıtlı':($groqLocal?'sunucu yerel yapılandırmasında tanımlı':($groqEnvironment?'sunucu ortam değişkeninde tanımlı':'henüz tanımlı değil'));
$geminiKeySource=$geminiStored?'panelde korumalı ayar dosyasında kayıtlı':($geminiLocal?'sunucu yerel yapılandırmasında tanımlı':($geminiEnvironment?'sunucu ortam değişkeninde tanımlı':'henüz tanımlı değil'));
?><!doctype html><html lang="tr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">
<title>AdımBot Yapay Zekâ Ayarları — İlkAdım</title><link rel="stylesheet" href="super-admin-pages.css?v=1.0.72"></head>
<body class="sa-subpage"><?php require __DIR__.'/src/super_admin_icons.php'; ?>
<div class="app-shell"><header class="app-topbar"><a class="sa-page-brand" href="super-admin.php"><span class="sa-brand-mark">İA</span><span><strong>İlkAdım</strong><small>AdımBot Ayarları</small></span></a></header>
<main id="screen"><div class="screen-content"><section class="subpage-intro"><span><svg><use href="#sa-settings"/></svg></span><h1>AdımBot Yapay Zekâ</h1><p>Sohbet ve mikrofon sağlayıcısını yönetin. API anahtarları tarayıcıya gönderilmez.</p></section>
<?php if($message!==''):?><div class="role-note"><p><?=aa_h($message)?></p></div><?php endif;?>
<?php if($error!==''):?><div class="role-note"><p><?=aa_h($error)?></p></div><?php endif;?>
<form method="post" class="settings-block" autocomplete="off"><input type="hidden" name="csrf" value="<?=aa_h(csrf_token())?>">
<label class="field-label" for="provider">Sohbet sağlayıcısı</label><select class="text-input" id="provider" name="provider"><option value="groq" <?=$provider==='groq'?'selected':''?>>Groq</option><option value="gemini" <?=$provider==='gemini'?'selected':''?>>Gemini</option><option value="openai" <?=$provider==='openai'?'selected':''?>>OpenAI (mevcut ayar)</option></select>
<label class="field-label" for="model">Model kimliği</label><input class="text-input" id="model" name="model" list="ai-models" maxlength="100" required value="<?=aa_h((string)($ai['model']??''))?>"><datalist id="ai-models"><option value="llama-3.1-8b-instant"><option value="llama-3.3-70b-versatile"><option value="gemini-3.5-flash-lite"><option value="gemini-3.8-flash"></datalist>
<p class="little-note">Ücretsiz katman hesabınıza ve seçilen modele bağlıdır. Geçerli kota ve ücretleri sağlayıcının panelinden kontrol edin.</p>
<label class="field-label" for="groq-key">Groq API anahtarı</label><input class="text-input" id="groq-key" type="password" name="groq_api_key" maxlength="512" placeholder="<?=($keySet?'Anahtar kayıtlı — değiştirmek için yenisini girin':'Groq anahtarınızı girin')?>" autocomplete="new-password">
<p class="little-note">Anahtar: <?=aa_h($groqKeySource)?>. Boş bırakılırsa mevcut panel anahtarı korunur. Ücretsiz planın istek ve token sınırları Groq hesabınıza bağlıdır.</p>
<label class="field-label"><input type="checkbox" name="clear_groq_key" value="1"> Kayıtlı Groq anahtarını kaldır</label>
<label class="field-label" for="gemini-key">Gemini API anahtarı</label><input class="text-input" id="gemini-key" type="password" name="gemini_api_key" maxlength="512" placeholder="<?=$geminiKeySet?'Anahtar kayıtlı — değiştirmek için yenisini girin':'Gemini anahtarınızı girin'?>" autocomplete="new-password">
<p class="little-note">Gemini anahtarı: <?=aa_h($geminiKeySource)?>. Boş bırakılırsa mevcut panel anahtarı korunur.</p>
<label class="field-label"><input type="checkbox" name="clear_gemini_key" value="1"> Kayıtlı Gemini anahtarını kaldır</label>
<label class="field-label"><input type="checkbox" name="enabled" value="1" <?=($ai['enabled']??true)?'checked':''?>> AdımBot AI yanıtları açık</label>
<label class="field-label"><input type="checkbox" name="voice_enabled" value="1" <?=($ai['voice_enabled']??true)?'checked':''?>> Öğrencinin mikrofonla sohbeti açık</label>
<label class="field-label" for="voice-input">Konuşmayı metne çevirme</label><select class="text-input" id="voice-input" name="voice_input"><option value="browser" <?=($ai['voice_input']??'browser')==='browser'?'selected':''?>>Tarayıcı (uyumlu cihazlarda)</option><option value="groq" <?=($ai['voice_input']??'')==='groq'?'selected':''?>>Groq Whisper (ses Groq'a gönderilir)</option><option value="gemini" <?=($ai['voice_input']??'')==='gemini'?'selected':''?>>Gemini (ses Google'a gönderilir)</option></select>
<label class="field-label" for="transcription-model">Groq konuşma tanıma modeli</label><select class="text-input" id="transcription-model" name="voice_transcription_model"><option value="whisper-large-v3-turbo" <?=($ai['voice_transcription_model']??'whisper-large-v3-turbo')==='whisper-large-v3-turbo'?'selected':''?>>Whisper Large V3 Turbo</option><option value="whisper-large-v3" <?=($ai['voice_transcription_model']??'')==='whisper-large-v3'?'selected':''?>>Whisper Large V3</option></select>
<label class="field-label" for="gemini-voice-model">Gemini konuşma tanıma modeli</label><input class="text-input" id="gemini-voice-model" name="voice_gemini_model" maxlength="100" value="<?=aa_h((string)($ai['voice_gemini_model']??'gemini-3.5-flash-lite'))?>">
<p class="little-note">Robotun Türkçe yanıt sesi cihazın seslendirme motorundan gelir. Mikrofon yalnız düğmeye dokununca açılır; kısa kayıtlar kalıcı olarak saklanmaz. Groq/Gemini seçilirse kayıt seçilen sağlayıcıya gönderilir.</p>
<label class="field-label" for="timeout-seconds">API bağlantı zaman aşımı (saniye)</label><input class="text-input" id="timeout-seconds" type="number" name="timeout_seconds" min="5" max="40" value="<?=(int)($ai['timeout_seconds']??20)?>">
<label class="field-label" for="limit">Öğrenci başına 10 dakikalık istek sınırı</label><input class="text-input" id="limit" type="number" name="max_requests_per_10_minutes" min="3" max="60" value="<?=(int)($ai['max_requests_per_10_minutes']??20)?>">
<button class="button primary full" type="submit" name="action" value="save">Ayarları Kaydet</button>
<button class="button full" type="submit" name="action" value="save_test">Kaydet ve Bağlantıyı Test Et</button></form>
<p class="little-note">Groq hesabının ücretsiz kotası biterse AdımBot geçici olarak sınır mesajı gösterir. Ücretli sağlayıcıya otomatik geçiş yapılmaz.</p>
</div></main><nav class="app-nav" aria-label="Süper Admin menüsü"><a href="super-admin.php"><span><svg><use href="#sa-home"/></svg></span>Panel</a><a href="sistem-durum.php"><span><svg><use href="#sa-database"/></svg></span>Durum</a><a class="active" href="adimbot-ayarlari.php"><span><svg><use href="#sa-settings"/></svg></span>AdımBot</a><a href="guncelleme.php"><span><svg><use href="#sa-refresh"/></svg></span>Güncelle</a><a href="super-admin-profil.php"><span><svg><use href="#sa-user"/></svg></span>Profil</a></nav></div>
<script>document.getElementById('provider').addEventListener('change',function(){const field=document.getElementById('model');if(this.value==='groq')field.value='llama-3.1-8b-instant';if(this.value==='gemini')field.value='gemini-3.5-flash-lite';if(this.value==='openai')field.value='gpt-5.6-luna';});</script>
</body></html>
