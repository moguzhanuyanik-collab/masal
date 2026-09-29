<?php
declare(strict_types=1);

require dirname(__DIR__) . '/src/auth.php';

header('Content-Type: application/json; charset=utf-8');
header('Cache-Control: no-store, max-age=0');
header('X-Content-Type-Options: nosniff');

function adimbot_ai_json(array $payload, int $status=200): never {
    http_response_code($status);
    echo json_encode($payload, JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES);
    exit;
}

function adimbot_ai_clean(mixed $value, int $max=400): string {
    $text=trim(preg_replace('/\s+/u',' ',strip_tags((string)$value)) ?? '');
    if (mb_strlen($text)>$max) $text=mb_substr($text,0,$max);
    return trim($text);
}

function adimbot_ai_redact(string $text): string {
    $text=preg_replace('/\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/iu','[e-posta gizlendi]',$text) ?? $text;
    $text=preg_replace('/(?:https?:\/\/|www\.)\S+/iu','[bağlantı gizlendi]',$text) ?? $text;
    $text=preg_replace('/(?<!\d)(?:\+?90[\s.\-]?)?(?:0?[2-5]\d{2})[\s.\-]?\d{3}[\s.\-]?\d{2}[\s.\-]?\d{2}(?!\d)/u','[telefon gizlendi]',$text) ?? $text;
    $text=preg_replace('/(?<!\d)\d{11}(?!\d)/u','[kimlik bilgisi gizlendi]',$text) ?? $text;
    return $text;
}

function adimbot_ai_extract_text(array $response): string {
    if (isset($response['output_text']) && is_string($response['output_text'])) {
        return adimbot_ai_clean($response['output_text'],600);
    }
    $parts=[];
    foreach (($response['output'] ?? []) as $item) {
        if (!is_array($item) || ($item['type'] ?? '')!=='message') continue;
        foreach (($item['content'] ?? []) as $content) {
            if (!is_array($content)) continue;
            $text=$content['text'] ?? '';
            if (is_string($text) && trim($text)!=='') $parts[]=$text;
        }
    }
    return adimbot_ai_clean(implode(' ',$parts),600);
}

function adimbot_ai_extract_chat_text(array $response): string {
    $message=$response['choices'][0]['message']['content'] ?? '';
    if (is_string($message)) return adimbot_ai_clean($message,600);
    return '';
}

function adimbot_ai_extract_gemini_text(array $response): string {
    $parts=$response['candidates'][0]['content']['parts'] ?? [];
    if (!is_array($parts)) return '';
    $texts=[];
    foreach ($parts as $part) {
        if (is_array($part) && empty($part['thought']) && is_string($part['text'] ?? null)) $texts[]=$part['text'];
    }
    return adimbot_ai_clean(implode(' ',$texts),600);
}

function adimbot_ai_input_safety(string $text): ?array {
    if (preg_match('/(?:intihar|kendimi\s+öldür|canıma\s+kıy|kendime\s+zarar|yaşamak\s+istemiyorum)/iu',$text)) {
        return ['reason'=>'self_harm','text'=>'Bunu tek başına taşıma. Hemen yanında güvendiğin bir yetişkine, ailenden birine veya öğretmenine haber ver.'];
    }
    if (preg_match('/(?:adres(?:in|ini)?|telefon(?:un|unu|\s*numara)|e[- ]?posta(?:n|nı)?|şifre(?:n|ni)?|tc\s*(?:kimlik)?|kimlik\s*numara|konum(?:un|unu)?)/iu',$text)) {
        return ['reason'=>'privacy','text'=>'Kişisel bilgilerini paylaşmana gerek yok. Adres, telefon, e-posta, şifre veya kimlik bilgisi istemeden devam edelim.'];
    }
    if (preg_match('/(?:whatsapp|instagram|telegram|discord|snapchat|buluş(?:alım|mak)|görüşelim|beni\s+ara|seni\s+arayayım|özelden\s+yaz)/iu',$text)) {
        return ['reason'=>'contact','text'=>'Seni başka bir uygulamaya, kişiye veya buluşmaya yönlendirmeyeceğim. Burada dersine yardımcı olabilirim.'];
    }
    if (preg_match('/(?:doğru\s+cevap|cevabı\s+(?:söyle|ver)|hangi\s+şık|cevap\s+ne|doğru\s+şık|şık\s+hangisi)/iu',$text)) {
        return ['reason'=>'answer_key','text'=>'Cevabı doğrudan söylemeyeyim. Sorudaki önemli kelimeleri bulalım ve seçenekleri birlikte eleyelim.'];
    }
    if (preg_match('/(?:uyuşturucu|silah\s+yap|bomba\s+yap|birini\s+öldür|cinsel\s+ilişki|çıplak\s+foto)/iu',$text)) {
        return ['reason'=>'unsafe','text'=>'Bu konu için yanında güvendiğin bir yetişkinden yardım istemen daha doğru olur. İstersen dersine geri dönelim.'];
    }
    return null;
}

function adimbot_ai_readable_output(string $text): string {
    $value=strip_tags($text);
    $value=preg_replace('/\*\*([^*]+)\*\*/u','$1',$value) ?? $value;
    $value=preg_replace('/__([^_]+)__/u','$1',$value) ?? $value;
    $value=preg_replace('/`([^`]+)`/u','$1',$value) ?? $value;
    $value=preg_replace('/^\s*(?:#{1,6}|>|[•-])\s+/mu','',$value) ?? $value;
    $value=adimbot_ai_clean($value,600);
    $sentences=preg_split('/(?<=[.!?])\s+/u',$value,-1,PREG_SPLIT_NO_EMPTY);
    if(is_array($sentences) && count($sentences)>4) $value=implode(' ',array_slice($sentences,0,4));
    return trim($value);
}

function adimbot_ai_safe_output(string $text, bool $hasActiveQuestion=false): array {
    $value=adimbot_ai_readable_output($text);
    if ($value==='') return ['ok'=>false,'text'=>'Şu anda yanıt oluşturamadım. İstersen soruyu başka türlü soralım.','reason'=>'empty'];

    if (preg_match('/(?:telefon(?:unu| numaranı)|adres(?:ini|ini söyle)|e[- ]?posta(?:nı| adresini)|şifre(?:ni)?|tc\s*(?:kimlik)?)/iu',$value)) {
        return ['ok'=>false,'text'=>'Kişisel bilgilerini paylaşmana gerek yok. Dersine güvenli şekilde devam edelim.','reason'=>'privacy'];
    }
    if (preg_match('/(?:https?:\/\/|www\.|whatsapp|instagram|telegram|discord|snapchat|özelden\s+yaz|buluşalım)/iu',$value)) {
        return ['ok'=>false,'text'=>'Seni başka bir uygulamaya veya kişiye yönlendirmeyeceğim. Burada dersine yardımcı olabilirim.','reason'=>'external_contact'];
    }
    if (preg_match('/(?:doğru\s+(?:cevap|şık)|cevap\s+[A-D]\s*şıkkı|cevap\s*[:\-]\s*[A-D])/iu',$value)) {
        return ['ok'=>false,'text'=>'Cevabı doğrudan söylemeyeyim. Bir ipucu vereyim ve birlikte düşünelim.','reason'=>'answer_key'];
    }
    if ($hasActiveQuestion && preg_match('/(?:cevap|sonuç|doğru\s+(?:seçenek|şık))\s*(?:(?:şudur|olur)\s*|[:\-]\s*)?(?:[A-D]\b|\d+(?:[.,]\d+)?\b|bir\b|iki\b|üç\b|dört\b|beş\b|altı\b|yedi\b|sekiz\b|dokuz\b|on\b)/iu',$value)) {
        return ['ok'=>false,'text'=>'Sonucu doğrudan vermeyeyim. İlk adımı birlikte bulalım: soruda bizden ne istendiğini söyleyebilir misin?','reason'=>'answer_key'];
    }
    return ['ok'=>true,'text'=>adimbot_ai_redact($value),'reason'=>'ok'];
}

function adimbot_ai_normalize_repeat(string $text): string {
    $value=mb_strtolower(adimbot_ai_clean($text,600),'UTF-8');
    return preg_replace('/[^\pL\pN]+/u','',$value) ?? $value;
}

function adimbot_ai_repeats_previous(string $reply, array $previous): bool {
    $normalized=adimbot_ai_normalize_repeat($reply);
    if($normalized==='') return false;
    foreach($previous as $item){
        $candidate=adimbot_ai_normalize_repeat((string)$item);
        if($candidate==='' ) continue;
        if($normalized===$candidate) return true;
        if(mb_strlen($normalized)<40 || mb_strlen($candidate)<40) continue;
        similar_text($normalized,$candidate,$percent);
        if($percent>=88.0) return true;
    }
    return false;
}

function adimbot_ai_provider_error(int $status, int $curlErrno): never {
    if ($curlErrno===CURLE_OPERATION_TIMEDOUT || $status===408 || $status===504) {
        adimbot_ai_json(['ok'=>false,'message'=>'Yapay zekâ yanıtı zamanında gelmedi.','reason'=>'provider_timeout'],504);
    }
    if ($curlErrno!==0) {
        adimbot_ai_json(['ok'=>false,'message'=>'Yapay zekâ sağlayıcısına bağlantı kurulamadı.','reason'=>'provider_connection_error'],502);
    }
    if ($status===429) {
        adimbot_ai_json(['ok'=>false,'message'=>'AdımBot kullanım sınırına ulaştı. Biraz sonra tekrar dene.','reason'=>'provider_rate_limit'],429);
    }
    if ($status===401 || $status===403) {
        adimbot_ai_json(['ok'=>false,'message'=>'Yapay zekâ erişim anahtarı sağlayıcı tarafından reddedildi.','reason'=>'provider_auth_error'],502);
    }
    if ($status===400 || $status===404) {
        adimbot_ai_json(['ok'=>false,'message'=>'Seçilen yapay zekâ modeli veya istek ayarı sağlayıcı tarafından kabul edilmedi.','reason'=>'provider_config_error'],502);
    }
    if ($status>=500) {
        adimbot_ai_json(['ok'=>false,'message'=>'Yapay zekâ sağlayıcısı geçici olarak yanıt veremiyor.','reason'=>'provider_unavailable'],503);
    }
    adimbot_ai_json(['ok'=>false,'message'=>'AdımBot şu anda yapay zekâ yanıtına ulaşamadı.','reason'=>'provider_error'],502);
}

app_session_start();

if ($_SERVER['REQUEST_METHOD']!=='POST') {
    adimbot_ai_json(['ok'=>false,'message'=>'Yalnızca POST desteklenir.'],405);
}

$role=(string)($_SESSION['aktif_rol'] ?? '');
$studentId=(int)($_SESSION['ogrenci_id'] ?? 0);
$userId=(int)($_SESSION['kullanici_id'] ?? 0);
if ($role!=='ogrenci' || $studentId<=0 || $userId<=0) {
    adimbot_ai_json(['ok'=>false,'message'=>'Bu özellik yalnızca öğrenci hesabında kullanılabilir.'],403);
}

$csrf=(string)($_SERVER['HTTP_X_CSRF_TOKEN'] ?? '');
if (!verify_csrf($csrf)) {
    adimbot_ai_json(['ok'=>false,'message'=>'Oturum doğrulaması yenilenmeli. Sayfayı yenileyip tekrar deneyebilirsin.','reason'=>'csrf'],403);
}

$contentType=strtolower((string)($_SERVER['CONTENT_TYPE'] ?? ''));
if ($contentType!=='' && !str_starts_with($contentType,'application/json')) {
    adimbot_ai_json(['ok'=>false,'message'=>'Geçersiz istek biçimi.','reason'=>'content_type'],415);
}

$origin=(string)($_SERVER['HTTP_ORIGIN'] ?? '');
if ($origin!=='') {
    $host=(string)($_SERVER['HTTP_HOST'] ?? '');
    $originHost=(string)(parse_url($origin,PHP_URL_HOST) ?? '');
    if ($originHost==='' || strcasecmp(preg_replace('/:\d+$/','',$host) ?? $host,$originHost)!==0) {
        adimbot_ai_json(['ok'=>false,'message'=>'Geçersiz istek kaynağı.'],403);
    }
}

$raw=file_get_contents('php://input');
if (!is_string($raw) || strlen($raw)>12000) {
    adimbot_ai_json(['ok'=>false,'message'=>'İstek çok büyük.'],413);
}
$payload=json_decode($raw,true);
if (!is_array($payload)) {
    adimbot_ai_json(['ok'=>false,'message'=>'Geçersiz JSON.'],400);
}

$message=adimbot_ai_redact(adimbot_ai_clean($payload['message'] ?? '',400));
if ($message==='') {
    adimbot_ai_json(['ok'=>false,'message'=>'Bir soru yazmalısın.'],400);
}

if (($blocked=adimbot_ai_input_safety($message))!==null) {
    adimbot_ai_json(['ok'=>true,'blocked'=>true,'reason'=>$blocked['reason'],'text'=>$blocked['text']]);
}

$config=require dirname(__DIR__) . '/config/app.php';
$ai=is_array($config['ai'] ?? null)?$config['ai']:[];
$enabled=($ai['enabled'] ?? true)!==false;
$provider=strtolower(trim((string)($ai['provider'] ?? 'openai')));
$apiKey=match ($provider) {
    'groq'=>trim((string)(($ai['groq_api_key'] ?? '') ?: getenv('GROQ_API_KEY'))),
    'gemini'=>trim((string)(($ai['gemini_api_key'] ?? '') ?: getenv('GEMINI_API_KEY'))),
    default=>trim((string)(getenv('OPENAI_API_KEY') ?: ($ai['api_key'] ?? ''))),
};
$model=trim((string)($ai['model'] ?? 'gpt-6-astra'));
$timeout=max(5,min(40,(int)($ai['timeout_seconds'] ?? 20)));

if (!$enabled || !in_array($provider,['openai','groq','gemini'],true) || $model==='' || $apiKey==='' || $apiKey==='OPENAI_API_ANAHTARINIZ') {
    adimbot_ai_json([
        'ok'=>false,
        'configured'=>false,
        'reason'=>'provider_disabled',
        'text'=>'AdımBot yapay zekâ bağlantısı henüz yapılandırılmamış. Profildeki diğer AdımBot özelliklerini kullanmaya devam edebilirsin.'
    ],503);
}
if (!function_exists('curl_init')) {
    adimbot_ai_json(['ok'=>false,'message'=>'Sunucuda yapay zekâ bağlantısı için cURL etkin değil.','reason'=>'curl_missing'],500);
}
$modelInvalid=($provider==='gemini' && !preg_match('/^gemini-[A-Za-z0-9._-]+$/D',$model))
    || ($provider==='groq' && (str_starts_with($model,'gemini-') || str_starts_with($model,'gpt-')))
    || ($provider==='openai' && (str_starts_with($model,'gemini-') || str_starts_with($model,'llama-')));
if ($modelInvalid) {
    adimbot_ai_json(['ok'=>false,'message'=>'Seçilen model sohbet sağlayıcısıyla uyumlu değil.','reason'=>'provider_config_error'],500);
}

$now=time();
$window=600;
$requests=is_array($_SESSION['adimbot_ai_requests'] ?? null)?$_SESSION['adimbot_ai_requests']:[];
$requests=array_values(array_filter(array_map('intval',$requests),static fn(int $ts):bool=>$ts>$now-$window));
$limit=max(3,min(60,(int)($ai['max_requests_per_10_minutes'] ?? 20)));
if (count($requests)>=$limit) {
    $_SESSION['adimbot_ai_requests']=$requests;
    adimbot_ai_json(['ok'=>false,'message'=>'AdımBot biraz dinlensin. Birkaç dakika sonra tekrar deneyebilirsin.','reason'=>'rate_limit'],429);
}
$requests[]=$now;
$_SESSION['adimbot_ai_requests']=$requests;
session_write_close();

$context=is_array($payload['context'] ?? null)?$payload['context']:[];
$allowed=[];
foreach (['screen'=>80,'lesson'=>80,'topic'=>80,'activity'=>80,'question'=>240,'practiceLesson'=>80,'reviewLesson'=>80,'reviewReason'=>24,'learningMode'=>20] as $key=>$max) {
    if (!isset($context[$key])) continue;
    $value=adimbot_ai_redact(adimbot_ai_clean($context[$key],$max));
    if ($value!=='') $allowed[$key]=$value;
}
foreach (['completedSteps','gamesCompleted','readingsCompleted','lessonAttempts','lessonCorrect','lessonWrong','lessonSteps'] as $key) {
    if (!isset($context[$key]) || !is_numeric($context[$key])) continue;
    $allowed[$key]=max(0,min(9999,(int)round((float)$context[$key])));
}

$contextText='';
foreach ($allowed as $key=>$value) {
    $contextText.=$key.': '.$value."\n";
}

$history=is_array($payload['history'] ?? null)?$payload['history']:[];
$historyLines=[];
$previousAssistantReplies=[];
foreach (array_slice($history,-6) as $item) {
    if (!is_array($item)) continue;
    $role=(string)($item['role'] ?? '');
    if (!in_array($role,['user','assistant'],true)) continue;
    $text=adimbot_ai_redact(adimbot_ai_clean($item['text'] ?? '',300));
    if ($text==='') continue;
    if (adimbot_ai_input_safety($text)!==null) continue;
    if ($role==='assistant') $previousAssistantReplies[]=$text;
    $historyLines[]=($role==='user'?'Öğrenci':'AdımBot').': '.$text;
}
$historyText=implode("\n",$historyLines);

$instructions=<<<'TXT'
Sen İlkAdım adlı 1. sınıf eğitim uygulamasındaki AdımBot'sun.
Türkçe, kısa, sıcak, çocukların anlayacağı basit cümlelerle konuş.
Yeni mesaja doğrudan karşılık ver. Bağlamda olmayan ders, kişi, başarı veya olay uydurma; yeterli bilgi yoksa tek bir kısa soru sor.
Önceki AdımBot yanıtını aynen veya küçük değişikliklerle tekrarlama. Her yanıta aynı selam, övgü ya da başlangıç kalıbıyla başlama.
Öğrenciye öğretici ipucu ver; aktif soru/şık varsa doğru cevabı veya doğru şıkkı doğrudan söyleme.
Önce düşünmesini sağlayan bir ipucu, gerekirse küçük bir örnek ver.
Ekran bağlamındaki ders, konu, etkinlik, aktif soru ve öğrenme ilerlemesini birlikte kullan; ancak öğrenciyi "zayıf", "başarısız" veya benzeri bir etiketle tanımlama.
İlerleme sayıları yalnızca desteğin seviyesini ayarlamak içindir; öğrenciyle kıyaslama yapma ve gereksiz yere sayıları tekrar etme.
learningMode "together" ise tek seferde yalnızca bir küçük düşünme adımı sor ve öğrencinin yanıtını bekle; soruyu onun yerine çözme.
practiceLesson varsa bunu kesin bir yetersizlik olarak değil, biraz daha pratik yapılabilecek ders bağlamı olarak ele al.
reviewLesson varsa bunu geçmiş denemelerden gelen kısa tekrar fırsatı olarak kullan; öğrenciyi etiketleme, kıyaslama yapma ve önce küçük bir tekrar öner.
reviewReason yalnızca tekrar zamanlamasını ayarlamak içindir; bunu öğrenciye teknik kod olarak söyleme.
Adres, telefon, e-posta, şifre, kimlik, tam ad, konum veya özel iletişim bilgisi isteme.
Dış bağlantı verme, başka uygulamaya/kişiye yönlendirme, özel iletişim veya buluşma teklif etme.
HTML, Markdown linki, kod, URL, araç çağrısı, komut veya uygulama eylemi üretme.
Yanıtı mümkünse 1-4 kısa cümlede ve en fazla 600 karakterde tut.
Tehlikeli veya yaşa uygun olmayan bir konuda güvendiği bir yetişkinden yardım istemesini söyle.
TXT;

$input="Ekran bağlamı:\n".($contextText!==''?$contextText:"Genel öğrenci ekranı\n");
if ($historyText!=='') {
    $input.="\nKısa sohbet geçmişi:\n".$historyText."\n";
}
$input.="\nÖğrencinin yeni mesajı:\n".$message;

$request=$provider==='gemini'
    ?['systemInstruction'=>['parts'=>[['text'=>$instructions]]],
       'contents'=>[['role'=>'user','parts'=>[['text'=>$input]]]],
       'generationConfig'=>['maxOutputTokens'=>600]]
    :($provider==='groq'
    ?['model'=>$model,'messages'=>[
        ['role'=>'system','content'=>$instructions],
        ['role'=>'user','content'=>$input],
    ],'max_tokens'=>220]
    :['model'=>$model,'instructions'=>$instructions,'input'=>$input,'max_output_tokens'=>220]);

$endpoint=match ($provider) {
    'groq'=>'https://api.groq.com/openai/v1/chat/completions',
    'gemini'=>'https://generativelanguage.googleapis.com/v1beta/models/'.rawurlencode($model).':generateContent',
    default=>'https://api.openai.com/v1/responses',
};
$ch=curl_init($endpoint);
curl_setopt_array($ch,[
    CURLOPT_POST=>true,
    CURLOPT_RETURNTRANSFER=>true,
    CURLOPT_CONNECTTIMEOUT=>8,
    CURLOPT_TIMEOUT=>$timeout,
    CURLOPT_HTTPHEADER=>$provider==='gemini'
        ?['x-goog-api-key: '.$apiKey,'Content-Type: application/json']
        :['Authorization: Bearer '.$apiKey,'Content-Type: application/json'],
    CURLOPT_POSTFIELDS=>json_encode($request,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES),
]);
$responseBody=curl_exec($ch);
$curlErrno=curl_errno($ch);
$status=(int)curl_getinfo($ch,CURLINFO_RESPONSE_CODE);
curl_close($ch);

if (!is_string($responseBody) || $responseBody==='' || $status<200 || $status>=300) {
    adimbot_ai_provider_error($status,$curlErrno);
}

$decoded=json_decode($responseBody,true);
if (!is_array($decoded)) {
    adimbot_ai_json(['ok'=>false,'message'=>'Yapay zekâ yanıtı okunamadı.','reason'=>'invalid_provider_response'],502);
}

$text=match ($provider) {
    'groq'=>adimbot_ai_extract_chat_text($decoded),
    'gemini'=>adimbot_ai_extract_gemini_text($decoded),
    default=>adimbot_ai_extract_text($decoded),
};
$safe=adimbot_ai_safe_output($text,isset($allowed['question']));
if ($safe['ok'] && adimbot_ai_repeats_previous($safe['text'],$previousAssistantReplies)) {
    $safe=['ok'=>false,'text'=>'Aynı şeyi tekrarlamak istemiyorum. Takıldığın kısmı bir cümleyle söyler misin?','reason'=>'repeated_response'];
}

adimbot_ai_json([
    'ok'=>true,
    'configured'=>true,
    'blocked'=>!$safe['ok'],
    'reason'=>$safe['reason'],
    'text'=>$safe['text'],
]);
