<?php
declare(strict_types=1);

function vpd_item_status(array $item,?DateTimeImmutable $now=null): string {
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

function vpd_filter(array $contents,string $status='tum',?DateTimeImmutable $now=null): array {
    if(!in_array($status,['tum','attention','waiting','completed','info'],true)) $status='tum';
    if($status==='tum') return array_values($contents);

    return array_values(array_filter(
        $contents,
        static fn(array $item): bool => vpd_item_status($item,$now)===$status
    ));
}

function vpd_summary(array $contents,?DateTimeImmutable $now=null): array {
    $summary=[
        'all'=>count($contents),
        'questions'=>0,
        'answered'=>0,
        'correct'=>0,
        'wrong'=>0,
        'question_waiting'=>0,
        'homeworks'=>0,
        'completed'=>0,
        'overdue'=>0,
        'homework_waiting'=>0,
        'info'=>0,
        'attention'=>0,
        'waiting'=>0,
    ];

    foreach($contents as $item){
        if(!is_array($item)) continue;
        $type=(string)($item['icerik_turu']??'');
        $status=vpd_item_status($item,$now);

        if($status==='attention') $summary['attention']++;
        elseif($status==='waiting') $summary['waiting']++;
        elseif($status==='info') $summary['info']++;

        if($type==='soru'){
            $summary['questions']++;
            if($item['secilen_cevap_indeksi']===null){
                $summary['question_waiting']++;
            }else{
                $summary['answered']++;
                if((int)($item['cevap_dogru']??0)===1) $summary['correct']++;
                else $summary['wrong']++;
            }
            continue;
        }

        if($type==='odev'){
            $summary['homeworks']++;
            if((int)($item['odev_tamamlandi']??0)===1){
                $summary['completed']++;
            }elseif($status==='attention'){
                $summary['overdue']++;
            }else{
                $summary['homework_waiting']++;
            }
            continue;
        }
    }

    $summary['question_accuracy']=$summary['answered']>0
        ?(int)round($summary['correct']*100/$summary['answered'])
        :null;
    $summary['homework_completion']=$summary['homeworks']>0
        ?(int)round($summary['completed']*100/$summary['homeworks'])
        :null;

    return $summary;
}

function vpd_status_label(string $status): string {
    return match($status){
        'attention'=>'Dikkat gerekiyor',
        'completed'=>'Tamamlandı',
        'info'=>'Bilgi içeriği',
        default=>'Bekliyor',
    };
}

function vpd_status_class(string $status): string {
    return match($status){
        'attention'=>'warn',
        'completed'=>'ok',
        'info'=>'info',
        default=>'',
    };
}
