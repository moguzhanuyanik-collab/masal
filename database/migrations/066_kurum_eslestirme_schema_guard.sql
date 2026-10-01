SET NAMES utf8mb4;

-- İlkAdım 1.1.115
-- Migration 065 sonrasında kurum kapsamlı eşleştirme şemasının gerçekten oluştuğunu
-- fail-closed doğrular. Bu migration veri değiştirmez.
--
-- 065 beklenmeyen bir legacy primary-key düzeniyle karşılaşırsa sessizce mevcut
-- primary key'i koruyabiliyordu. Bu guard, böyle bir kurulumun güncelleme zincirinde
-- "başarılı" kabul edilmesini engeller.
-- Global kapsam 0'dır; gerçek kurum kimlikleri 0 olamaz.

SET @ilkadim_kurum_id_type = (
  SELECT COLUMN_TYPE
  FROM information_schema.columns
  WHERE table_schema=DATABASE()
    AND table_name='kurumlar'
    AND column_name='id'
  LIMIT 1
);

SET @ilkadim_vo_pk = (
  SELECT GROUP_CONCAT(column_name ORDER BY seq_in_index)
  FROM information_schema.statistics
  WHERE table_schema=DATABASE()
    AND table_name='veli_ogrenci'
    AND index_name='PRIMARY'
);

SET @ilkadim_oo_pk = (
  SELECT GROUP_CONCAT(column_name ORDER BY seq_in_index)
  FROM information_schema.statistics
  WHERE table_schema=DATABASE()
    AND table_name='ogretmen_ogrenci'
    AND index_name='PRIMARY'
);

SET @ilkadim_relation_guard_sql = IF(
  COALESCE(@ilkadim_kurum_id_type,'') <> ''
  AND (
    SELECT COUNT(*)
    FROM information_schema.columns
    WHERE table_schema=DATABASE()
      AND table_name='veli_ogrenci'
      AND column_name='kurum_id'
      AND COLUMN_TYPE=@ilkadim_kurum_id_type
      AND IS_NULLABLE='NO'
      AND COALESCE(COLUMN_DEFAULT,'')='0'
  )=1
  AND (
    SELECT COUNT(*)
    FROM information_schema.columns
    WHERE table_schema=DATABASE()
      AND table_name='ogretmen_ogrenci'
      AND column_name='kurum_id'
      AND COLUMN_TYPE=@ilkadim_kurum_id_type
      AND IS_NULLABLE='NO'
      AND COALESCE(COLUMN_DEFAULT,'')='0'
  )=1
  AND @ilkadim_vo_pk='veli_id,ogrenci_id,kurum_id'
  AND @ilkadim_oo_pk='ogretmen_id,ogrenci_id,kurum_id'
  AND (
    SELECT GROUP_CONCAT(column_name ORDER BY seq_in_index)
    FROM information_schema.statistics
    WHERE table_schema=DATABASE()
      AND table_name='veli_ogrenci'
      AND index_name='ix_veli_ogrenci_kurum'
  )='kurum_id,ogrenci_id'
  AND (
    SELECT GROUP_CONCAT(column_name ORDER BY seq_in_index)
    FROM information_schema.statistics
    WHERE table_schema=DATABASE()
      AND table_name='ogretmen_ogrenci'
      AND index_name='ix_ogretmen_ogrenci_kurum'
  )='kurum_id,ogrenci_id'
  AND (
    SELECT COUNT(*)
    FROM kurumlar
    WHERE id=0
  )=0
  AND (
    SELECT COUNT(*)
    FROM veli_ogrenci vo
    LEFT JOIN kurumlar k ON k.id=vo.kurum_id
    WHERE vo.kurum_id<>0
      AND k.id IS NULL
  )=0
  AND (
    SELECT COUNT(*)
    FROM ogretmen_ogrenci oo
    LEFT JOIN kurumlar k ON k.id=oo.kurum_id
    WHERE oo.kurum_id<>0
      AND k.id IS NULL
  )=0,
  'SET @ilkadim_relation_guard_passed = 1',
  'SELECT * FROM __ilkadim_tenant_relation_schema_guard_failed__ LIMIT 1'
);

PREPARE ilkadim_relation_guard_stmt FROM @ilkadim_relation_guard_sql;
EXECUTE ilkadim_relation_guard_stmt;
DEALLOCATE PREPARE ilkadim_relation_guard_stmt;
