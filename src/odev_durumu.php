<?php
declare(strict_types=1);

function hw_status(array $row,?DateTimeImmutable $now=null,?string $fallbackDueAt=null): string {
    $completed=(int)($row['tamamlandi']??$row['odev_tamamlandi']??0)===1;
    if($completed) return 'completed';

    $dueRaw=trim((string)($row['teslim_tarihi']??$fallbackDueAt??''));
    if($dueRaw!==''){
        try{
            $dueAt=new DateTimeImmutable($dueRaw);
            if($dueAt<($now??new DateTimeImmutable('now'))) return 'overdue';
        }catch(Throwable){}
    }
    return 'pending';
}

function hw_status_label(string $status): string {
    return match($status){
        'completed'=>'Tamamlandı',
        'overdue'=>'Gecikti',
        default=>'Bekliyor',
    };
}

function hw_status_icon(string $status): string {
    return match($status){
        'completed'=>'✅',
        'overdue'=>'⏰',
        default=>'📝',
    };
}

function hw_summary(array $rows,?DateTimeImmutable $now=null,?string $fallbackDueAt=null): array {
    $summary=['total'=>0,'completed'=>0,'overdue'=>0,'pending'=>0];
    foreach($rows as $row){
        if(!is_array($row)) continue;
        $summary['total']++;
        $status=hw_status($row,$now,$fallbackDueAt);
        $summary[$status]++;
    }
    return $summary;
}

function hw_filter(array $rows,string $status,?DateTimeImmutable $now=null,?string $fallbackDueAt=null): array {
    if(!in_array($status,['completed','overdue','pending'],true)) return array_values($rows);
    return array_values(array_filter(
        $rows,
        static fn(array $row): bool => hw_status($row,$now,$fallbackDueAt)===$status
    ));
}
