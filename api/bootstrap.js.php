<?php
declare(strict_types=1);
require dirname(__DIR__) . '/src/bootstrap.php';
require dirname(__DIR__) . '/src/auth.php';

header('Content-Type: application/javascript; charset=utf-8');
header('Cache-Control: no-store, max-age=0');

$user=authenticated_user();
$studentId=authenticated_student_id();
if (!$user || $studentId===null) {
    $target=$user?auth_role_home($user):'login.php';
    echo "window.location.replace(".json_encode($target,JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES).");\n";
    exit;
}

$root=dirname(__DIR__);
$dbConnected=false;
$lessons=[];
$state=null;
$summary=null;
$completedSteps=[];
$studentGrade=1;
$educationStage='temel_egitim';
$error=null;

try {
    $pdo=db();

    $gradeStmt=$pdo->prepare('SELECT egitim_kademesi,sinif_seviyesi FROM ogrenciler WHERE id=? AND aktif=1 LIMIT 1');
    $gradeStmt->execute([$studentId]);
    $studentRow=$gradeStmt->fetch();
    $educationStage=(string)($studentRow['egitim_kademesi']??'temel_egitim');
    if($educationStage!=='temel_egitim') $educationStage='temel_egitim';
    $studentGrade=max(1,min(8,(int)($studentRow['sinif_seviyesi']??1)));

    $lessonStmt=$pdo->prepare('SELECT d.*,sd.haftalik_saat AS sinif_haftalik_saat,sd.sira AS sinif_sira FROM dersler d INNER JOIN sinif_dersleri sd ON sd.ders_id=d.id WHERE d.aktif=1 AND sd.aktif=1 AND sd.kademe_kodu=? AND sd.sinif_seviyesi=? ORDER BY sd.sira,d.id');
    $lessonStmt->execute([$educationStage,$studentGrade]);
    $rows=$lessonStmt->fetchAll();
    $moduleStmt=$pdo->prepare('SELECT * FROM ders_modulleri WHERE ders_id=? AND kademe_kodu=? AND sinif_seviyesi=? AND aktif=1 ORDER BY sira,id');

    foreach ($rows as $row) {
        $moduleStmt->execute([(int)$row['id'],$educationStage,$studentGrade]);
        $modules=[];
        foreach ($moduleStmt->fetchAll() as $m) {
            $opts=json_decode((string)$m['secenekler_json'],true);
            $modules[]=[
                'title'=>$m['baslik'],
                'subtitle'=>$m['alt_baslik'],
                'emoji'=>$m['emoji'],
                'reading'=>$m['okuma_metni'],
                'example'=>$m['ornek_metni'],
                'question'=>$m['soru'],
                'options'=>is_array($opts)?$opts:[],
                'answer'=>(int)$m['dogru_cevap_indeksi'],
                'explanation'=>$m['aciklama'],
            ];
        }
        $lessons[]=[
            'id'=>$row['kod'],
            'name'=>$row['ad'],
            'hours'=>(int)($row['sinif_haftalik_saat']??$row['haftalik_saat']),
            'emoji'=>$row['emoji'],
            'art'=>$row['sanat'],
            'artClass'=>$row['sanat_sinifi'],
            'color'=>$row['renk'],
            'ink'=>$row['yazi_renk'],
            'description'=>$row['aciklama'],
            'modules'=>$modules,
        ];
    }

    $state=load_student_state($pdo,$studentId);

    $gradeSteps=[];
    try {
        $completedStmt=$pdo->prepare('SELECT ders_kodu,modul_indeksi FROM ogrenci_ilerleme WHERE ogrenci_id=? AND sinif_seviyesi=? AND tamamlandi=1 ORDER BY ders_kodu,modul_indeksi');
        $completedStmt->execute([$studentId,$studentGrade]);
        foreach ($completedStmt->fetchAll() as $completedRow) {
            $code=trim((string)($completedRow['ders_kodu'] ?? ''));
            $index=(int)($completedRow['modul_indeksi'] ?? -1);
            if ($code!=='' && $index>=0) {
                $key=$code.'-'.$index;
                $completedSteps[$key]=true;
                $gradeSteps[]=$key;
            }
        }
    } catch (Throwable) {}

    if (is_array($state)) {
        if ($gradeSteps!==[] || $studentGrade!==1) {
            $state['steps']=$gradeSteps;
        } else {
            foreach ((array)($state['steps'] ?? []) as $stepKey) {
                $stepKey=trim((string)$stepKey);
                if ($stepKey!=='') $completedSteps[$stepKey]=true;
            }
        }

        try {
            $attemptStmt=$pdo->prepare('SELECT ders_kodu,soru_anahtari,secilen_cevap,dogru,sure_ms,cevap_tarihi FROM ogrenci_cevaplari WHERE ogrenci_id=? AND sinif_seviyesi=? ORDER BY id');
            $attemptStmt->execute([$studentId,$studentGrade]);
            $gradeAttempts=[];
            foreach ($attemptStmt->fetchAll() as $attemptRow) {
                $selected=json_decode((string)($attemptRow['secilen_cevap']??'null'),true);
                $at=strtotime((string)($attemptRow['cevap_tarihi']??''));
                $gradeAttempts[]=[
                    'lesson'=>(string)($attemptRow['ders_kodu']??''),
                    'index'=>(string)($attemptRow['soru_anahtari']??''),
                    'selected'=>$selected,
                    'correct'=>(int)($attemptRow['dogru']??0)===1,
                    'ms'=>(int)($attemptRow['sure_ms']??0),
                    'at'=>$at!==false?$at*1000:(int)round(microtime(true)*1000),
                ];
            }
            if ($gradeAttempts!==[] || $studentGrade!==1) $state['attempts']=$gradeAttempts;
        } catch (Throwable) {}
    }

    $summary=function_exists('student_database_summary')?student_database_summary($pdo,$studentId):null;
    $dbConnected=true;
} catch (Throwable $e) {
    $error=$e->getMessage();
    $fallback=$root.'/database/lessons.json';
    if (is_file($fallback)) {
        $decoded=json_decode((string)file_get_contents($fallback),true);
        if (is_array($decoded)) $lessons=$decoded;
    }
}

$flags=JSON_UNESCAPED_UNICODE|JSON_UNESCAPED_SLASHES;
echo 'window.LESSONS='.json_encode($lessons,$flags).";\n";
echo 'window.ILKADIM_CURRENT_USER_ID='.json_encode((int)$user['id'],$flags).";\n";
echo 'window.ILKADIM_CURRENT_USER_NAME='.json_encode((string)($user['ad_soyad']??''),$flags).";\n";
echo 'window.ILKADIM_CURRENT_USER_ROLE='.json_encode((string)$user['ana_rol'],$flags).";\n";
echo 'window.ILKADIM_CURRENT_USER_ROLES='.json_encode(array_values((array)$user['roles']),$flags).";\n";
echo 'window.ILKADIM_CURRENT_STUDENT_ID='.json_encode($studentId,$flags).";\n";
echo 'window.ILKADIM_CURRENT_GRADE='.json_encode($studentGrade,$flags).";\n";
echo 'window.ILKADIM_CURRENT_EDUCATION_STAGE='.json_encode($educationStage,$flags).";\n";
echo 'window.ILKADIM_CSRF_TOKEN='.json_encode(csrf_token(),$flags).";\n";
echo 'window.ILKADIM_DB_CONNECTED='.($dbConnected?'true':'false').";\n";
echo 'window.ILKADIM_DB_ERROR='.json_encode($error,$flags).";\n";
echo 'window.ILKADIM_DB_SUMMARY='.json_encode($summary,$flags).";\n";
echo 'window.ILKADIM_COMPLETED_STEPS='.json_encode(array_values(array_keys($completedSteps)),$flags).";\n";

if ($dbConnected&&is_array($state)) {
    echo 'window.ILKADIM_SERVER_STATE='.json_encode($state,$flags).";\n";
    echo "try{localStorage.setItem('ilk-adim-profile',JSON.stringify(window.ILKADIM_SERVER_STATE));}catch(e){}\n";
}
