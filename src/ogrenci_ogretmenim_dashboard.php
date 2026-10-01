<?php
declare(strict_types=1);

function std_institutions(array $contents): array {
    $map=[];
    foreach($contents as $row){
        if(!is_array($row)) continue;
        $id=(int)($row['kurum_id']??0);
        if($id<=0) continue;
        $map[$id]=[
            'id'=>$id,
            'ad'=>(string)($row['kurum_adi']??('Kurum #'.$id)),
        ];
    }
    $rows=array_values($map);
    usort($rows,static function(array $a,array $b): int {
        $byName=strcasecmp((string)$a['ad'],(string)$b['ad']);
        return $byName!==0?$byName:((int)$a['id']<=>(int)$b['id']);
    });
    return $rows;
}

function std_item_status(array $item,?DateTimeImmutable $now=null): string {
    $now=$now??new DateTimeImmutable('now');
    $type=(string)($item['icerik_turu']??'');

    if($type==='soru'){
        if($item['secilen_cevap_indeksi']===null) return 'waiting';
        return (int)($item['cevap_dogru']??0)===1?'completed':'attention';
    }

    if($type==='odev'){
        if((int)($item['odev_tamamlandi']??0)===1) return 'completed';
        $due=trim((string)($item['teslim_tarihi']??''));
        if($due!==''){
            try{
                if((new DateTimeImmutable($due))<$now) return 'attention';
            }catch(Throwable){}
        }
        return 'waiting';
    }

    return 'info';
}

function std_filter_contents(
    array $contents,
    int $institutionId=0,
    string $type='tum',
    string $status='tum',
    ?DateTimeImmutable $now=null
): array {
    $allowedTypes=['tum','soru','tekrar','odev','not','diger'];
    $allowedStatuses=['tum','waiting','attention','completed','info'];
    if(!in_array($type,$allowedTypes,true)) $type='tum';
    if(!in_array($status,$allowedStatuses,true)) $status='tum';

    return array_values(array_filter(
        $contents,
        static function(array $row) use ($institutionId,$type,$status,$now): bool {
            if($institutionId>0 && (int)($row['kurum_id']??0)!==$institutionId) return false;
            if($type!=='tum' && (string)($row['icerik_turu']??'')!==$type) return false;
            if($status!=='tum' && std_item_status($row,$now)!==$status) return false;
            return true;
        }
    ));
}

function std_summary(array $contents,?DateTimeImmutable $now=null): array {
    $summary=[
        'total'=>count($contents),
        'questions'=>0,
        'question_answered'=>0,
        'question_correct'=>0,
        'question_wrong'=>0,
        'question_waiting'=>0,
        'homeworks'=>0,
        'homework_completed'=>0,
        'homework_overdue'=>0,
        'homework_waiting'=>0,
        'info'=>0,
    ];

    foreach($contents as $row){
        if(!is_array($row)) continue;
        $type=(string)($row['icerik_turu']??'');
        $status=std_item_status($row,$now);

        if($type==='soru'){
            $summary['questions']++;
            if($status==='waiting'){
                $summary['question_waiting']++;
            }else{
                $summary['question_answered']++;
                if($status==='completed') $summary['question_correct']++;
                else $summary['question_wrong']++;
            }
            continue;
        }

        if($type==='odev'){
            $summary['homeworks']++;
            if($status==='completed') $summary['homework_completed']++;
            elseif($status==='attention') $summary['homework_overdue']++;
            else $summary['homework_waiting']++;
            continue;
        }

        $summary['info']++;
    }

    $summary['question_accuracy']=$summary['question_answered']>0
        ?(int)round($summary['question_correct']*100/$summary['question_answered'])
        :0;
    $summary['homework_completion']=$summary['homeworks']>0
        ?(int)round($summary['homework_completed']*100/$summary['homeworks'])
        :0;
    $summary['action_waiting']=$summary['question_waiting']+$summary['homework_waiting'];
    $summary['attention']=$summary['question_wrong']+$summary['homework_overdue'];

    return $summary;
}

function std_status_label(string $status): string {
    return match($status){
        'completed'=>'Tamamlandı',
        'attention'=>'Dikkat gerekiyor',
        'info'=>'Bilgi içeriği',
        default=>'Bekliyor',
    };
}
