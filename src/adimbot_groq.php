<?php
declare(strict_types=1);

// Groq's free/developer Llama endpoints retired on 2026-08-16.
// Enterprise endpoints are left alone unless Groq explicitly rejects the model as retired.
function adimbot_groq_replacement(string $model, int $status, mixed $body): ?string {
    if (!in_array($status,[400,404,410],true) || !is_string($body)) return null;
    $data=json_decode($body,true);
    $code=$data['error']['code'] ?? null;
    if (!is_string($code) || !in_array(strtolower($code),['model_decommissioned','model_deprecated'],true)) return null;
    return match ($model) {
        'llama-3.1-8b-instant'=>'openai/gpt-oss-20b',
        'llama-3.3-70b-versatile'=>'openai/gpt-oss-120b',
        default=>null,
    };
}

function adimbot_groq_payload(array $payload): array {
    if (in_array($payload['model'] ?? '',['openai/gpt-oss-20b','openai/gpt-oss-120b'],true)) {
        unset($payload['max_tokens'],$payload['reasoning_format']);
        $payload['max_completion_tokens']=1024;
        $payload['reasoning_effort']='low';
        $payload['include_reasoning']=false;
    }
    return $payload;
}

function adimbot_groq_http(array $payload, string $key, int $timeout): array {
    $json=json_encode($payload,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES);
    if (!is_string($json)) return ['body'=>false,'status'=>0,'errno'=>CURLE_FAILED_INIT];
    $ch=curl_init('https://api.groq.com/openai/v1/chat/completions');
    if ($ch===false) return ['body'=>false,'status'=>0,'errno'=>CURLE_FAILED_INIT];
    try {
        if (!curl_setopt_array($ch,[
            CURLOPT_POST=>true,CURLOPT_RETURNTRANSFER=>true,
            CURLOPT_CONNECTTIMEOUT=>min(8,$timeout),CURLOPT_TIMEOUT=>$timeout,
            CURLOPT_HTTPHEADER=>['Authorization: Bearer '.$key,'Content-Type: application/json'],
            CURLOPT_POSTFIELDS=>$json,
        ])) return ['body'=>false,'status'=>0,'errno'=>CURLE_FAILED_INIT];
        $body=curl_exec($ch);
        return ['body'=>$body,'status'=>(int)curl_getinfo($ch,CURLINFO_RESPONSE_CODE),'errno'=>curl_errno($ch)];
    } finally {
        curl_close($ch);
    }
}

function adimbot_groq_request(array $payload, string $key, int $timeout, ?callable $transport=null): array {
    $transport=$transport ?? 'adimbot_groq_http';
    $start=microtime(true);
    $payload=adimbot_groq_payload($payload);
    $result=$transport($payload,$key,$timeout);
    $result['model']=(string)$payload['model'];
    $result['migrated']=false;
    $replacement=($result['errno'] ?? 0)===0
        ?adimbot_groq_replacement($result['model'],(int)$result['status'],$result['body']):null;
    // At most one retry, within the original deadline, with the same key and provider.
    $remaining=(int)floor($timeout-(microtime(true)-$start));
    if ($replacement!==null && $remaining>=1) {
        $payload['model']=$replacement;
        $result=$transport(adimbot_groq_payload($payload),$key,$remaining);
        $result['model']=$replacement;
        $result['migrated']=true;
    }
    return $result;
}

// Only allowlisted classifications leave the server; never forward raw provider messages.
function adimbot_provider_reason(int $status, mixed $body): string {
    $data=is_array($body)?$body:(is_string($body)?json_decode($body,true):null);
    $error=is_array($data)?($data['error'] ?? null):null;
    $code=is_array($error)?($error['code'] ?? $error['status'] ?? $error['type'] ?? ''):'';
    $code=is_scalar($code)?strtolower((string)$code):'';
    if (in_array($status,[402,429],true) || in_array($code,['402','429','resource_exhausted','rate_limit','rate_limit_exceeded','quota_exceeded','too_many_requests'],true)) return 'provider_rate_limit';
    if ($status>=500) return 'provider_unavailable';
    if ($status===410 || in_array($code,['410','model_decommissioned','model_deprecated','model_retired'],true)) return 'provider_model_retired';
    if (in_array($code,['404','model_not_found','model_not_available','not_found'],true)) return 'provider_model_unavailable';
    if (in_array($code,['403','model_permission_denied','model_not_allowed','permission_denied'],true) || $status===403) return 'provider_permission_error';
    if (in_array($code,['401','invalid_api_key','api_key_invalid','unauthenticated'],true) || $status===401) return 'provider_auth_error';
    if (in_array($code,['400','422','invalid_argument','bad_request','unprocessable_entity'],true)) return 'provider_config_error';
    if (in_array($status,[400,404,422],true)) return 'provider_config_error';
    return 'provider_error';
}
