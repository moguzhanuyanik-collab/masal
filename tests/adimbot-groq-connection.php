<?php
declare(strict_types=1);
if (PHP_SAPI!=='cli') { http_response_code(404); exit; }
require dirname(__DIR__).'/src/adimbot_groq.php';
function check(bool $value,string $message): void { if (!$value) throw new RuntimeException($message); }
$retired=json_encode(['error'=>['code'=>'model_decommissioned','message'=>'retired']]);
$payload=['model'=>'llama-3.1-8b-instant','messages'=>[['role'=>'user','content'=>'Merhaba']],'max_tokens'=>220];
$calls=[];
$transport=function(array $p,string $key,int $timeout) use (&$calls,$retired): array {
    $calls[]=$p;
    check($key==='test-key','Key changed');
    check($timeout>0 && $timeout<=20,'Deadline exceeded');
    return count($calls)===1
        ?['body'=>$retired,'status'=>400,'errno'=>0]
        :['body'=>'{"choices":[{"message":{"content":"Merhaba"},"finish_reason":"stop"}]}','status'=>200,'errno'=>0];
};
$result=adimbot_groq_request($payload,'test-key',20,$transport);
check(count($calls)===2 && $result['status']===200 && $result['migrated'],'Migration did not succeed');
check($calls[1]['model']==='openai/gpt-oss-20b','Wrong replacement');
check($calls[1]['messages']===$payload['messages'],'Conversation changed');
check(!isset($calls[1]['max_tokens']) && $calls[1]['max_completion_tokens']===1024,'Wrong token configuration');
check($calls[1]['include_reasoning']===false && $calls[1]['reasoning_effort']==='low','Reasoning configuration');
check(adimbot_groq_replacement('llama-3.3-70b-versatile',400,$retired)==='openai/gpt-oss-120b','70B migration');
foreach ([
    ['body'=>'{}','status'=>200,'errno'=>0], // enterprise still works
    ['body'=>$retired,'status'=>401,'errno'=>0],
    ['body'=>$retired,'status'=>403,'errno'=>0],
    ['body'=>$retired,'status'=>429,'errno'=>0],
    ['body'=>'{"error":{"code":"model_not_found"}}','status'=>404,'errno'=>0],
    ['body'=>'<html>bad gateway</html>','status'=>502,'errno'=>0],
    ['body'=>false,'status'=>0,'errno'=>28],
] as $response) {
    $count=0;
    adimbot_groq_request($payload,'test-key',20,function() use (&$count,$response): array { $count++; return $response; });
    check($count===1,'Unexpected retry on success/auth/access/quota/unknown model/network error');
}
$count=0;
adimbot_groq_request($payload,'test-key',20,function() use (&$count,$retired): array { $count++; return ['body'=>$retired,'status'=>400,'errno'=>0]; });
check($count===2,'Unbounded retry');
check(adimbot_groq_replacement('custom-model',400,$retired)===null,'Custom model replaced');
check(adimbot_provider_reason(400,$retired)==='provider_model_retired','Retired classification');
check(adimbot_provider_reason(401,'{}')==='provider_auth_error','Authentication classification');
check(adimbot_provider_reason(403,'{}')==='provider_permission_error','Permission classification');
check(adimbot_provider_reason(400,'{"error":{"code":"invalid_api_key"}}')==='provider_auth_error','Embedded authentication classification');
check(adimbot_provider_reason(400,'{"error":{"code":[]}}')==='provider_config_error','Malformed code handling');
check(adimbot_provider_reason(200,['error'=>['status'=>'RESOURCE_EXHAUSTED']])==='provider_rate_limit','Embedded quota classification');
check(adimbot_provider_reason(200,['error'=>['code'=>401]])==='provider_auth_error','Embedded numeric authentication classification');
check(adimbot_provider_reason(200,['error'=>['code'=>403]])==='provider_permission_error','Embedded numeric permission classification');
check(adimbot_provider_reason(200,['error'=>['code'=>'model_deprecated']])==='provider_model_retired','Embedded retired model classification');
check(adimbot_provider_reason(200,['error'=>['code'=>'model_not_found']])==='provider_model_unavailable','Embedded unavailable model classification');
check(adimbot_provider_reason(200,['error'=>['status'=>'INVALID_ARGUMENT']])==='provider_config_error','Embedded configuration classification');
echo "PASS: Groq model migration, payload, deadline, retry boundaries and error classification\n";
