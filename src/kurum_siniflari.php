<?php
declare(strict_types=1);

function ksg_validate_input(array $input): array {
    $name=trim((string)($input['ad']??''));
    $type=(string)($input['tur']??'sinif');
    $grade=(int)($input['sinif_seviyesi']??0);

    if(mb_strlen($name)<2 || mb_strlen($name)>120) throw new RuntimeException('Sınıf / grup adını kontrol et.');
    if(!in_array($type,['sinif','grup'],true)) throw new RuntimeException('Geçersiz sınıf / grup türü.');
    if($type==='sinif' && ($grade<1 || $grade>8)) throw new RuntimeException('Sınıf için 1 ile 8 arasında seviye seç.');
    if($type==='grup' && ($grade<0 || $grade>8)) throw new RuntimeException('Grup sınıf seviyesi geçersiz.');

    return [$name,$type,$grade>0?$grade:null];
}

function ksg_update(PDO $pdo,array $actor,int $institutionId,int $groupId,array $input): void {
    if($institutionId<=0 || $groupId<=0) throw new RuntimeException('Sınıf / grup bulunamadı.');
    [$name,$type,$grade]=ksg_validate_input($input);

    $stmt=$pdo->prepare('SELECT id FROM kurum_siniflari WHERE id=? AND kurum_id=? LIMIT 1');
    $stmt->execute([$groupId,$institutionId]);
    $exists=(bool)$stmt->fetchColumn();
    $stmt->closeCursor();
    if(!$exists) throw new RuntimeException('Sınıf / grup bulunamadı.');

    if($grade!==null){
        $stmt=$pdo->prepare("SELECT COUNT(*)
            FROM kurum_sinif_ogrencileri kso
            INNER JOIN ogrenciler o ON o.id=kso.ogrenci_id
            WHERE kso.kurum_sinif_id=? AND kso.kurum_id=? AND o.sinif_seviyesi<>?");
        $stmt->execute([$groupId,$institutionId,$grade]);
        $mismatch=(int)($stmt->fetchColumn()?:0);
        $stmt->closeCursor();
        if($mismatch>0){
            throw new RuntimeException('Yeni sınıf seviyesine uymayan öğrenciler var. Önce bu öğrencileri gruptan çıkar.');
        }
    }

    $stmt=$pdo->prepare('UPDATE kurum_siniflari SET ad=?,tur=?,sinif_seviyesi=? WHERE id=? AND kurum_id=?');
    $stmt->execute([$name,$type,$grade,$groupId,$institutionId]);
    $stmt->closeCursor();

    auth_audit($pdo,(int)$actor['id'],null,'kurum_sinif_guncelle','Kurum '.$institutionId.' / Sınıf-Grup #'.$groupId.' / '.$type);
}
