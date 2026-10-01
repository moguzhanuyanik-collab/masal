<?php
declare(strict_types=1);

require dirname(__DIR__).'/src/updater.php';

function check116(bool $value,string $message): void {
    if(!$value) throw new RuntimeException($message);
}

$tenantMigration=dirname(__DIR__).'/database/migrations/065_kurum_bazli_eslestirme_izolasyonu.sql';
try{
    assert_automatic_migration_safe('065_kurum_bazli_eslestirme_izolasyonu',$tenantMigration);
}catch(Throwable $e){
    throw new RuntimeException('065 tenant schema migration güvenlik katmanından geçemedi: '.$e->getMessage(),0,$e);
}

$root=sys_get_temp_dir().'/ilkadim-migration-safety-'.bin2hex(random_bytes(6));
@mkdir($root,0770,true);

$safe=$root.'/safe.sql';
file_put_contents($safe,<<<'SQL'
SET @sql = 'ALTER TABLE veli_ogrenci DROP PRIMARY KEY, ADD PRIMARY KEY (veli_id,ogrenci_id,kurum_id)';
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
SET @sql = 'ALTER TABLE veli_ogrenci MODIFY COLUMN kurum_id BIGINT UNSIGNED NOT NULL DEFAULT 0';
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
-- ILKADIM_ALLOW_SAFE_TENANT_SCHEMA_ALTER
SQL);
assert_automatic_migration_safe('065_test_safe_tenant_schema',$safe);

$unsafeWithoutMarker=$root.'/unsafe-no-marker.sql';
file_put_contents($unsafeWithoutMarker,<<<'SQL'
ALTER TABLE veli_ogrenci MODIFY COLUMN kurum_id BIGINT UNSIGNED NOT NULL DEFAULT 0;
SQL);
$rejected=false;
try{
    assert_automatic_migration_safe('065_test_unsafe_without_marker',$unsafeWithoutMarker);
}catch(RuntimeException $e){
    $rejected=true;
}
check116($rejected,'Marker olmadan şema dönüşümü kabul edildi.');

$unsafeWithMarker=$root.'/unsafe-with-marker.sql';
file_put_contents($unsafeWithMarker,<<<'SQL'
-- ILKADIM_ALLOW_SAFE_TENANT_SCHEMA_ALTER
ALTER TABLE veli_ogrenci DROP COLUMN kurum_id;
SQL);
$rejected=false;
try{
    assert_automatic_migration_safe('065_test_unsafe_with_marker',$unsafeWithMarker);
}catch(RuntimeException $e){
    $rejected=true;
}
check116($rejected,'Marker, izin verilmeyen ALTER TABLE işlemini bypass etti.');

@unlink($safe);
@unlink($unsafeWithoutMarker);
@unlink($unsafeWithMarker);
@rmdir($root);

echo "PASS: tenant schema migration updater safety contract\\n";
