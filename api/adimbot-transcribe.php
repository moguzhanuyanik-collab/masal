<?php
declare(strict_types=1);
require dirname(__DIR__).'/src/auth.php';

header('Content-Type: application/json; charset=utf-8');
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');
function voice_result(array $data, int $status=200): never {
    http_response_code($status);
    echo json_encode($data,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES);
    exit;
}
app_session_start();
if ($_SERVER['REQUEST_METHOD']!=='POST') voice_result(['ok'=>false,'reason'=>'method'],405);
if (($_SESSION['aktif_rol'] ?? '')!=='ogrenci' || (int)($_SESSION['ogrenci_id'] ?? 0)<1 || (int)($_SESSION['kullanici_id'] ?? 0)<1) voice_result(['ok'=>false,'reason'=>'auth'],403);
if (!verify_csrf((string)($_SERVER['HTTP_X_CSRF_TOKEN'] ?? ''))) voice_result(['ok'=>false,'reason'=>'csrf'],403);
$origin=(string)($_SERVER['HTTP_ORIGIN'] ?? '');
if ($origin!=='') {
    $host=(string)($_SERVER['HTTP_HOST'] ?? '');
    $originHost=(string)(parse_url($origin,PHP_URL_HOST) ?? '');
    if ($originHost==='' || strcasecmp(preg_replace('/:\d+$/','',$host) ?? $host,$originHost)!==0) voice_result(['ok'=>false,'reason'=>'origin'],403);
}
$config=require dirname(__DIR__).'/config/app.php';
$ai=is_array($config['ai'] ?? null)?$config['ai']:[];
$provider=(string)($ai['voice_input'] ?? 'browser');
if (($ai['enabled'] ?? true)===false || ($ai['voice_enabled'] ?? true)===false || !in_array($provider,['groq','gemini'],true)) voice_result(['ok'=>false,'reason'=>'disabled'],403);
if ((int)($_SERVER['CONTENT_LENGTH'] ?? 0)>2200000) voice_result(['ok'=>false,'reason'=>'size'],413);
$file=$_FILES['audio'] ?? null;
if (!is_array($file) || ($file['error'] ?? -1)!==UPLOAD_ERR_OK || !is_uploaded_file((string)($file['tmp_name'] ?? ''))) voice_result(['ok'=>false,'reason'=>'upload'],400);
$size=(int)($file['size'] ?? 0);
if ($size<100 || $size>1600000) voice_result(['ok'=>false,'reason'=>'size'],413);
if (!class_exists(finfo::class)) voice_result(['ok'=>false,'reason'=>'format'],500);
$detected=(new finfo(FILEINFO_MIME_TYPE))->file($file['tmp_name']);
$mimes=['audio/webm'=>'webm','video/webm'=>'webm','audio/ogg'=>'ogg','application/ogg'=>'ogg','audio/mp4'=>'m4a','video/mp4'=>'m4a','audio/x-m4a'=>'m4a','audio/mpeg'=>'mp3','audio/wav'=>'wav','audio/x-wav'=>'wav'];
if (!is_string($detected) || !isset($mimes[$detected])) voice_result(['ok'=>false,'reason'=>'format'],415);
$times=is_array($_SESSION['adimbot_voice_requests'] ?? null)?$_SESSION['adimbot_voice_requests']:[];
$times=array_values(array_filter(array_map('intval',$times),static fn(int $t):bool=>$t>time()-600));
if (count($times)>=max(3,min(30,(int)($ai['max_requests_per_10_minutes'] ?? 20)))) voice_result(['ok'=>false,'reason'=>'rate_limit'],429);
$times[]=time();
$_SESSION['adimbot_voice_requests']=$times;
session_write_close();
if (!function_exists('curl_init')) voice_result(['ok'=>false,'reason'=>'curl_missing'],500);

$key=$provider==='groq' ? trim((string)(getenv('GROQ_API_KEY') ?: ($ai['groq_api_key'] ?? ''))) : trim((string)(getenv('GEMINI_API_KEY') ?: ($ai['gemini_api_key'] ?? '')));
if ($key==='') voice_result(['ok'=>false,'reason'=>'provider_disabled'],503);
$timeout=max(10,min(45,(int)($ai['timeout_seconds'] ?? 20)));
if ($provider==='groq') {
    $model=(string)($ai['voice_transcription_model'] ?? 'whisper-large-v3-turbo');
    if (!in_array($model,['whisper-large-v3-turbo','whisper-large-v3'],true)) voice_result(['ok'=>false,'reason'=>'model'],500);
    $request=['file'=>new CURLFile($file['tmp_name'],$detected,'speech.'.$mimes[$detected]),'model'=>$model,'language'=>'tr','response_format'=>'json'];
    $url='https://api.groq.com/openai/v1/audio/transcriptions';
    $headers=['Authorization: Bearer '.$key];
} else {
    $url='https://generativelanguage.googleapis.com/v1beta/models/gemini-3.5-flash-lite:generateContent';
    $headers=['x-goog-api-key: '.$key,'Content-Type: application/json'];
    $request=json_encode(['contents'=>[['parts'=>[
        ['text'=>'Bu Türkçe ses kaydını yalnızca yazıya çevir. Yorum, yanıt veya ek açıklama yazma.'],
        ['inline_data'=>['mime_type'=>$detected==='video/webm'?'audio/webm':($detected==='video/mp4'?'audio/mp4':$detected),'data'=>base64_encode((string)file_get_contents($file['tmp_name']))]],
    ]]]]],JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES);
}
$ch=curl_init($url);
curl_setopt_array($ch,[CURLOPT_POST=>true,CURLOPT_RETURNTRANSFER=>true,CURLOPT_CONNECTTIMEOUT=>8,CURLOPT_TIMEOUT=>$timeout,CURLOPT_HTTPHEADER=>$headers,CURLOPT_POSTFIELDS=>$request]);
$body=curl_exec($ch);
$status=(int)curl_getinfo($ch,CURLINFO_RESPONSE_CODE);
curl_close($ch);
if ($status===429) voice_result(['ok'=>false,'reason'=>'provider_rate_limit'],429);
if ($status===401 || $status===403) voice_result(['ok'=>false,'reason'=>'provider_auth_error'],502);
if ($status<200 || $status>=300 || !is_string($body)) voice_result(['ok'=>false,'reason'=>'provider_error'],502);
$decoded=json_decode($body,true);
if (!is_array($decoded)) voice_result(['ok'=>false,'reason'=>'provider_error'],502);
$text=$provider==='groq' ? ($decoded['text'] ?? '') : ($decoded['candidates'][0]['content']['parts'][0]['text'] ?? '');
if (!is_string($text)) $text='';
$text=trim(preg_replace('/\s+/u',' ',strip_tags($text)) ?? '');
if (mb_strlen($text)>400) $text=mb_substr($text,0,400);
if ($text==='') voice_result(['ok'=>false,'reason'=>'empty'],422);
voice_result(['ok'=>true,'text'=>$text]);
