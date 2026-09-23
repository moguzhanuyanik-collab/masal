<?php
declare(strict_types=1);

require dirname(__DIR__).'/src/bootstrap.php';
require dirname(__DIR__).'/src/auth.php';
require dirname(__DIR__).'/src/kurum_yonetimi.php';
require dirname(__DIR__).'/src/kurumlar_modulu.php';

header('Content-Type: application/json; charset=utf-8');
header('Cache-Control: no-store, max-age=0');

function km_api_response(array $payload,int $status=200): never {
    http_response_code($status);
    echo json_encode($payload,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES);
    exit;
}

$user=authenticated_user();
if(!$user){
    km_api_response(['ok'=>false,'message'=>'Oturum süresi dolmuş. Yeniden giriş yap.','auth_required'=>true],401);
}
if(!auth_is_effective_role($user,'super_admin')){
    km_api_response(['ok'=>false,'message'=>'Bu modülü yalnızca Süper Admin kullanabilir.'],403);
}

$pdo=db();
$sections=km_sections();
$section=(string)($_REQUEST['section']??'kurumlar');
if(!isset($sections[$section])) $section='kurumlar';

try{
    if($_SERVER['REQUEST_METHOD']==='GET'){
        $institutionId=max(0,(int)($_GET['kurum_id']??0));
        $rows=$section==='kurumlar'
            ?km_institution_rows($pdo)
            :km_member_rows($pdo,(string)$sections[$section]['role'],$institutionId);

        km_api_response([
            'ok'=>true,
            'section'=>$section,
            'section_label'=>$sections[$section]['label'],
            'section_icon'=>$sections[$section]['icon'],
            'rows'=>$rows,
            'institutions'=>km_active_institutions($pdo),
            'filter_institution_id'=>$institutionId,
        ]);
    }

    if($_SERVER['REQUEST_METHOD']!=='POST'){
        km_api_response(['ok'=>false,'message'=>'Desteklenmeyen istek.'],405);
    }

    if(!verify_csrf($_POST['csrf']??null)){
        km_api_response(['ok'=>false,'message'=>'Güvenlik doğrulaması başarısız. Sayfayı yenileyip tekrar dene.'],419);
    }

    $action=(string)($_POST['action']??'');

    if($section==='kurumlar'){
        if($action==='create'){
            $id=km_create_institution($pdo,$user,$_POST);
            km_api_response(['ok'=>true,'message'=>'Kurum eklendi.','id'=>$id]);
        }
        if($action==='update'){
            $id=(int)($_POST['kurum_id']??0);
            km_update_institution($pdo,$user,$id,$_POST);
            km_api_response(['ok'=>true,'message'=>'Kurum güncellendi.']);
        }
        if($action==='delete'){
            $id=(int)($_POST['kurum_id']??0);
            $result=km_delete_institution($pdo,$user,$id);
            km_api_response([
                'ok'=>true,
                'message'=>'Kurum pasife alındı. '.$result['users'].' kullanıcı hesabı da pasife çekildi.'
            ]);
        }
        km_api_response(['ok'=>false,'message'=>'Geçersiz kurum işlemi.'],400);
    }

    $role=(string)$sections[$section]['role'];
    if($action==='create'){
        $id=km_create_member($pdo,$user,$role,$_POST);
        km_api_response(['ok'=>true,'message'=>$sections[$section]['label'].' bölümüne kullanıcı eklendi.','id'=>$id]);
    }
    if($action==='update'){
        $userId=(int)($_POST['kullanici_id']??0);
        $oldInstitutionId=(int)($_POST['eski_kurum_id']??0);
        km_update_member($pdo,$user,$role,$userId,$oldInstitutionId,$_POST);
        km_api_response(['ok'=>true,'message'=>'Kullanıcı güncellendi.']);
    }
    if($action==='delete'){
        $userId=(int)($_POST['kullanici_id']??0);
        $institutionId=(int)($_POST['kurum_id']??0);
        $result=km_delete_member($pdo,$user,$role,$userId,$institutionId);
        km_api_response([
            'ok'=>true,
            'message'=>$result['account_deactivated']
                ?'Kullanıcı kurumdan silindi ve başka aktif kurumu olmadığı için hesabı pasife alındı.'
                :'Kullanıcı bu kurumdan silindi. Diğer aktif kurum üyelikleri korundu.'
        ]);
    }

    km_api_response(['ok'=>false,'message'=>'Geçersiz kullanıcı işlemi.'],400);
}catch(PDOException $e){
    $message=$e->getCode()==='23000'
        ?'Bu e-posta, kurum kodu veya üyelik zaten kullanılıyor.'
        :'Veritabanı işlemi tamamlanamadı.';
    km_api_response(['ok'=>false,'message'=>$message],400);
}catch(Throwable $e){
    km_api_response(['ok'=>false,'message'=>$e->getMessage()],400);
}
