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

function ilkadim_topic_icon(string $code,string $fallback='📘'): string {
    static $icons=[
        // 1. sınıf Türkçe — harf konularında doğrudan harfin kendisi
        'tr-harf-a'=>'A','tr-harf-n'=>'N','tr-harf-e'=>'E','tr-harf-t'=>'T',
        'tr-harf-i'=>'İ','tr-harf-l'=>'L','tr-harf-o'=>'O','tr-harf-k'=>'K',
        'tr-harf-u'=>'U','tr-harf-r'=>'R','tr-harf-ı'=>'I','tr-harf-m'=>'M',
        'tr-harf-ü'=>'Ü','tr-harf-s'=>'S','tr-harf-ö'=>'Ö','tr-harf-y'=>'Y',
        'tr-harf-d'=>'D','tr-harf-z'=>'Z','tr-harf-ç'=>'Ç','tr-harf-b'=>'B',
        'tr-harf-g'=>'G','tr-harf-c'=>'C','tr-harf-ş'=>'Ş','tr-harf-p'=>'P',
        'tr-harf-h'=>'H','tr-harf-v'=>'V','tr-harf-ğ'=>'Ğ','tr-harf-f'=>'F',
        'tr-harf-j'=>'J',
        'tr-heceler'=>'🧩',
        'tr-kelime-olusturma'=>'🔤',
        'tr-cumle-noktalama'=>'✍️',
        'tr-okudugunu-anlama'=>'📖',

        // 1. sınıf Matematik
        'mat-sayilar-0-20'=>'🔢',
        'mat-once-sonra'=>'↔️',
        'mat-karsilastirma'=>'≷',
        'mat-ritmik'=>'🔁',
        'mat-oruntu'=>'🧩',
        'mat-tahmin'=>'🎯',
        'mat-uzunluk'=>'📏',
        'mat-kutle'=>'⚖️',
        'mat-para'=>'₺',
        'mat-toplama'=>'➕',
        'mat-cikarma'=>'➖',
        'mat-esitlik'=>'🟰',
        'mat-problem'=>'🧠',
        'mat-yon-konum'=>'🧭',
        'mat-sekiller'=>'🔺',
        'mat-veri-okuma'=>'📊',

        // 1. sınıf Hayat Bilgisi / Görsel Sanatlar / Müzik / Beden
        'hb-okul'=>'🏫','hb-saglik'=>'🛡️','hb-aile'=>'👨‍👩‍👧','hb-ulkem'=>'🇹🇷','hb-doga'=>'🌿','hb-bilim'=>'🔬',
        'gs-hayat'=>'🎨','gs-dil'=>'🖌️','gs-sanatci'=>'🖼️','gs-cizim-konu'=>'✏️','gs-renk'=>'🌈','gs-milli'=>'🇹🇷','gs-muze'=>'🏛️',
        'muz-dil'=>'🎵','muz-kultur'=>'🎼',
        'be-hareket-konu'=>'🏃','be-kural-konu'=>'🎯','be-ritim-konu'=>'💃','be-saglik-konu'=>'💪',

        // 2. sınıf Türkçe
        'tr2-baglam'=>'📚','tr2-nezaket'=>'💬','tr2-noktalama'=>'❗','tr2-ataturk-metin'=>'🇹🇷',
        'tr2-olay-sirasi'=>'🔢','tr2-tahmin'=>'🔮','tr2-konu-baslik'=>'📖','tr2-kitap-bolum'=>'📚',
        'tr2-cumle'=>'✍️','tr2-yazim'=>'📝','tr2-yonerge'=>'📋','tr2-bilgi-cikarim'=>'🧠',
        'tr2-kultur-metin'=>'🏛️','tr2-sozcuk-iliski'=>'🔗','tr2-haklar-metin'=>'⚖️','tr2-metin-anlama'=>'🔍',

        // 2. sınıf Matematik
        'mat2-100'=>'🔢','mat2-basamak'=>'🔟','mat2-karsilastirma'=>'≷','mat2-yuvarlama'=>'🎯',
        'mat2-ritmik'=>'🔁','mat2-oruntu'=>'🧩','mat2-tahmin'=>'🎯','mat2-kesir'=>'🍕',
        'mat2-para'=>'₺','mat2-zaman'=>'⏰','mat2-uzunluk'=>'📏','mat2-kutle'=>'⚖️',
        'mat2-toplama'=>'➕','mat2-cikarma'=>'➖','mat2-esitlik'=>'🟰','mat2-carpma'=>'✖️',
        'mat2-bolme'=>'➗','mat2-problem'=>'🧠','mat2-cisimler'=>'🧊','mat2-sekiller'=>'🔺',
        'mat2-sivi'=>'🥛','mat2-yon'=>'🧭','mat2-simetri'=>'🦋','mat2-veri'=>'📊',

        // 2. sınıf İngilizce
        'eng2-greetings'=>'👋','eng2-school-people'=>'🧑‍🏫','eng2-school-places'=>'🏫','eng2-days'=>'📅',
        'eng2-celebrations'=>'🎉','eng2-instructions'=>'📋','eng2-objects'=>'✏️','eng2-colours'=>'🌈',
        'eng2-body'=>'🧍','eng2-clothes'=>'👕','eng2-age-birthday'=>'🎂','eng2-weather'=>'🌤️',
        'eng2-family-members'=>'👨‍👩‍👧','eng2-appearance'=>'🪞','eng2-rooms'=>'🏠','eng2-furniture'=>'🛋️',
        'eng2-pets'=>'🐾','eng2-food'=>'🍎',

        // 2. sınıf diğer dersler
        'hb2-okul-konu'=>'🏫','hb2-saglik-konu'=>'🛡️','hb2-aile-konu'=>'👨‍👩‍👧','hb2-ulkem-konu'=>'🇹🇷','hb2-doga-konu'=>'🌿','hb2-bilim-konu'=>'🔬',
        'gs2-hayat-konu'=>'🎨','gs2-dil-konu'=>'🖌️','gs2-sanatci-konu'=>'🖼️','gs2-cizim-konu'=>'✏️','gs2-renk-konu'=>'🌈','gs2-milli-konu'=>'🇹🇷','gs2-muze-konu'=>'🏛️',
        'muz2-dil-konu'=>'🎵','muz2-kultur-konu'=>'🎼',
        'be2-hareket-konu'=>'🏃','be2-kural-konu'=>'🎯','be2-ritim-konu'=>'💃','be2-saglik-konu'=>'💪',
    ];
    if(isset($icons[$code])) return $icons[$code];

    // Üst sınıflar için konu kodundan simge eşlemesi; öğrenci HTML/CSS yapısını değiştirmez.
    $patternIcons=[
        'mat4-cevre'=>'📏','mat5-cevre'=>'📏',
        'para'=>'₺','kesir'=>'🍕','yuzde'=>'%','ondalik'=>'0,1',
        'toplama'=>'➕','cikarma'=>'➖','carpma'=>'✖️','bolme'=>'➗',
        'esitlik'=>'🟰','denklem'=>'🟰','oran'=>'📊','oruntu'=>'🧩',
        'olasilik'=>'🎲','veri'=>'📊','istatistik'=>'📊','aci'=>'📐',
        'alan'=>'◻️','hacim'=>'🧊','uzunluk'=>'📏','kutle'=>'⚖️',
        'sivi'=>'🥛','zaman'=>'⏰','dogal'=>'🔢','asal'=>'🔢','carpan'=>'🔢',
        'karsilastir'=>'≷','yuvarlama'=>'🎯',
        'ana-fikir'=>'💡','cikarim'=>'🧠','ozet'=>'📝','baglam'=>'📚',
        'deyim'=>'💬','atasoz'=>'💬','noktalama'=>'❗','yazim'=>'✍️',
        'paragraf'=>'📄','yonerge'=>'📋','kronoloji'=>'🕰️','kaynak'=>'🔎',
        'iletisim'=>'💬','gorsel'=>'🖼️','lider'=>'🧭',
        'gunes'=>'☀️','tutulma'=>'🌑','gok'=>'🌌','dunya'=>'🌍',
        'hucre'=>'🔬','sindirim'=>'🍽️','dolasim'=>'❤️','solunum'=>'🫁',
        'kuvvet'=>'💪','surtunme'=>'🛞','miknatis'=>'🧲','madde'=>'⚗️',
        'isi'=>'🌡️','isik'=>'💡','ses'=>'🔊','elektrik'=>'⚡','devre'=>'⚡',
        'geri-donusum'=>'♻️','cevre'=>'🌿',
        'harita'=>'🗺️','konum'=>'🧭','hak'=>'⚖️','demokrasi'=>'🗳️',
        'ekonomi'=>'💰','butce'=>'💰','kultur'=>'🏛️','miras'=>'🏛️',
        'teknoloji'=>'💻',
        'classroom'=>'🧑‍🏫','school'=>'🏫','family'=>'👨‍👩‍👧',
        'weather'=>'🌦️','city'=>'🏙️','space'=>'🚀','future'=>'🔮',
        'travel'=>'✈️','health'=>'❤️','hobbies'=>'🎯','friend'=>'🤝',
        'namaz'=>'🕌','kuran'=>'📖','allah'=>'✨','peygamber'=>'🕊️',
        'ahlak'=>'🤝','cami'=>'🕌',
        'algoritma'=>'🧩','program'=>'💻','siber'=>'🔐','ai-'=>'🤖',
        'ag-'=>'🌐','dijital'=>'📱',
        'ritim'=>'🎵','muzik'=>'🎼','sanat'=>'🎨','hareket'=>'🏃',
        'zindelik'=>'💪','adil'=>'🤝',
    ];
    foreach($patternIcons as $needle=>$icon){
        if(str_contains($code,$needle)) return $icon;
    }

    return $fallback!==''?$fallback:'📘';
}

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
    $lessonStmt->closeCursor();

    $curriculumReady=false;
    try {
        $tableCheck=$pdo->prepare('SELECT COUNT(*) FROM information_schema.tables WHERE table_schema=DATABASE() AND table_name=?');
        $requiredTables=['ders_bolumleri','ders_konulari','ders_sorulari'];
        $curriculumReady=true;
        foreach($requiredTables as $requiredTable){
            $tableCheck->execute([$requiredTable]);
            $exists=(int)$tableCheck->fetchColumn()>0;
            $tableCheck->closeCursor();
            if(!$exists){$curriculumReady=false;break;}
        }
    } catch (Throwable) {
        $curriculumReady=false;
    }

    $moduleStmt=$pdo->prepare('SELECT * FROM ders_modulleri WHERE ders_id=? AND kademe_kodu=? AND sinif_seviyesi=? AND aktif=1 ORDER BY sira,id');
    $sectionStmt=$curriculumReady?$pdo->prepare('SELECT id,kod,ad,aciklama,tur,sira FROM ders_bolumleri WHERE ders_id=? AND kademe_kodu=? AND sinif_seviyesi=? AND aktif=1 ORDER BY sira,id'):null;
    $topicStmt=$curriculumReady?$pdo->prepare('SELECT id,bolum_id,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira FROM ders_konulari WHERE ders_id=? AND bolum_id=? AND kademe_kodu=? AND sinif_seviyesi=? AND aktif=1 ORDER BY sira,id'):null;
    $questionStmt=$curriculumReady?$pdo->prepare('SELECT id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,gorsel_anahtari,ses_metni,sira FROM ders_sorulari WHERE konu_id=? AND aktif=1 ORDER BY sira,id'):null;

    foreach ($rows as $row) {
        $modules=[];
        $curriculum=[];

        if($curriculumReady&&$sectionStmt&&$topicStmt&&$questionStmt){
            try {
                $sectionStmt->execute([(int)$row['id'],$educationStage,$studentGrade]);
                $sections=$sectionStmt->fetchAll();
                $sectionStmt->closeCursor();

                foreach($sections as $section){
                    $sectionTopics=[];
                    $topicStmt->execute([(int)$row['id'],(int)$section['id'],$educationStage,$studentGrade]);
                    $topics=$topicStmt->fetchAll();
                    $topicStmt->closeCursor();

                    foreach($topics as $topic){
                        $questionStmt->execute([(int)$topic['id']]);
                        $questions=$questionStmt->fetchAll();
                        $questionStmt->closeCursor();
                        $questionCount=count($questions);
                        if($questionCount<1) continue;

                        $startIndex=count($modules);
                        $topicIcon=ilkadim_topic_icon((string)$topic['konu_kodu'],(string)($row['emoji']??''));
                        foreach($questions as $questionIndex=>$q){
                            $opts=json_decode((string)$q['secenekler_json'],true);
                            $modules[]=[
                                'title'=>(string)$topic['ad'],
                                'subtitle'=>(string)$section['ad'].' • '.$questionCount.' soru',
                                'emoji'=>$topicIcon,
                                'reading'=>(string)($topic['anlatim']?:$topic['aciklama']),
                                'example'=>(string)($topic['ornek_metni']??''),
                                'question'=>(string)$q['soru'],
                                'options'=>is_array($opts)?array_values($opts):[],
                                'answer'=>(int)$q['dogru_cevap_indeksi'],
                                'explanation'=>(string)($q['aciklama']??''),
                                'curriculum'=>[
                                    'sectionId'=>(int)$section['id'],
                                    'sectionCode'=>(string)$section['kod'],
                                    'sectionTitle'=>(string)$section['ad'],
                                    'topicId'=>(int)$topic['id'],
                                    'topicCode'=>(string)$topic['konu_kodu'],
                                    'topicTitle'=>(string)$topic['ad'],
                                    'topicIcon'=>$topicIcon,
                                    'questionId'=>(int)$q['id'],
                                    'questionCode'=>(string)$q['soru_kodu'],
                                    'questionIndex'=>(int)$questionIndex,
                                    'questionCount'=>$questionCount,
                                ],
                            ];
                        }

                        $sectionTopics[]=[
                            'id'=>(int)$topic['id'],
                            'code'=>(string)$topic['konu_kodu'],
                            'title'=>(string)$topic['ad'],
                            'icon'=>$topicIcon,
                            'description'=>(string)($topic['aciklama']??''),
                            'startIndex'=>$startIndex,
                            'questionCount'=>$questionCount,
                        ];
                    }

                    if($sectionTopics!==[]){
                        $curriculum[]=[
                            'id'=>(int)$section['id'],
                            'code'=>(string)$section['kod'],
                            'title'=>(string)$section['ad'],
                            'description'=>(string)($section['aciklama']??''),
                            'type'=>(string)($section['tur']??'tema'),
                            'topics'=>$sectionTopics,
                        ];
                    }
                }
            } catch (Throwable) {
                $modules=[];
                $curriculum=[];
            }
        }

        if($modules===[]){
            $moduleStmt->execute([(int)$row['id'],$educationStage,$studentGrade]);
            $legacyModules=$moduleStmt->fetchAll();
            $moduleStmt->closeCursor();
            foreach ($legacyModules as $m) {
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
            'curriculumEnabled'=>$curriculum!==[],
            'curriculum'=>$curriculum,
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
