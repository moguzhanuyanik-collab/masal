SET NAMES utf8mb4;

-- 1.1.114
-- Veli/öğretmen <-> öğrenci eşleştirmeleri artık kurum kapsamını fiziksel olarak
-- taşır. kurum_id=0 yalnızca global (kurum dışı) legacy eşleştirmeyi temsil eder.
-- Mevcut veriler silinmez:
--   * veli/öğrenci veya öğretmen/öğrenci çiftinin tek ortak aktif kurumu varsa
--     ilişki o kuruma bağlanır.
--   * birden fazla ortak kurum veya hiç ortak kurum yoksa ilişki global 0'a
--     alınır; tenant erişim katmanı bu kaydı kurum kullanıcısına açmaz.
-- Bu migration DELETE içermez ve updater tarafından yedek alınarak çalıştırılır.
-- ILKADIM_ALLOW_SAFE_TENANT_SCHEMA_ALTER

SET @kurum_id_type = (
  SELECT COLUMN_TYPE
  FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='kurumlar' AND column_name='id'
  LIMIT 1
);
SET @kurum_id_type = IFNULL(@kurum_id_type,'BIGINT UNSIGNED');

SET @has_vo_kurum = (
  SELECT COUNT(*)
  FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='veli_ogrenci' AND column_name='kurum_id'
);
SET @sql = IF(@has_vo_kurum=0,
  CONCAT('ALTER TABLE veli_ogrenci ADD COLUMN kurum_id ',@kurum_id_type,' NULL AFTER veli_id'),
  'SET @ilkadim_noop = 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_oo_kurum = (
  SELECT COUNT(*)
  FROM information_schema.columns
  WHERE table_schema=DATABASE() AND table_name='ogretmen_ogrenci' AND column_name='kurum_id'
);
SET @sql = IF(@has_oo_kurum=0,
  CONCAT('ALTER TABLE ogretmen_ogrenci ADD COLUMN kurum_id ',@kurum_id_type,' NULL AFTER ogretmen_id'),
  'SET @ilkadim_noop = 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

-- Tek ortak aktif kurum bulunan eski veli-öğrenci eşleştirmelerini güvenli biçimde
-- o kuruma bağla. Çoklu/ambiguous kurum durumunda seçim yapılmaz.
UPDATE veli_ogrenci vo
INNER JOIN (
  SELECT vo2.veli_id,vo2.ogrenci_id,MIN(kkv.kurum_id) kurum_id
  FROM veli_ogrenci vo2
  INNER JOIN veliler v
    ON v.id=vo2.veli_id AND v.aktif=1
  INNER JOIN ogrenciler o
    ON o.id=vo2.ogrenci_id AND o.aktif=1
  INNER JOIN kurum_kullanicilari kkv
    ON kkv.kullanici_id=v.kullanici_id
   AND kkv.kurum_rolu='veli'
   AND kkv.aktif=1
  INNER JOIN kurumlar k
    ON k.id=kkv.kurum_id
   AND k.aktif=1
  WHERE EXISTS (
    SELECT 1
    FROM kurum_kullanicilari kks
    WHERE kks.kullanici_id=o.kullanici_id
      AND kks.kurum_id=kkv.kurum_id
      AND kks.kurum_rolu='ogrenci'
      AND kks.aktif=1
  )
  GROUP BY vo2.veli_id,vo2.ogrenci_id
  HAVING COUNT(DISTINCT kkv.kurum_id)=1
) scoped
  ON scoped.veli_id=vo.veli_id
 AND scoped.ogrenci_id=vo.ogrenci_id
SET vo.kurum_id=scoped.kurum_id
WHERE vo.kurum_id IS NULL;

-- Tek ortak aktif kurum bulunan eski öğretmen-öğrenci eşleştirmelerini aynı şekilde
-- güvenli biçimde kuruma bağla.
UPDATE ogretmen_ogrenci oo
INNER JOIN (
  SELECT oo2.ogretmen_id,oo2.ogrenci_id,MIN(kko.kurum_id) kurum_id
  FROM ogretmen_ogrenci oo2
  INNER JOIN ogretmenler og
    ON og.id=oo2.ogretmen_id AND og.aktif=1
  INNER JOIN ogrenciler o
    ON o.id=oo2.ogrenci_id AND o.aktif=1
  INNER JOIN kurum_kullanicilari kko
    ON kko.kullanici_id=og.kullanici_id
   AND kko.kurum_rolu='ogretmen'
   AND kko.aktif=1
  INNER JOIN kurumlar k
    ON k.id=kko.kurum_id
   AND k.aktif=1
  WHERE EXISTS (
    SELECT 1
    FROM kurum_kullanicilari kks
    WHERE kks.kullanici_id=o.kullanici_id
      AND kks.kurum_id=kko.kurum_id
      AND kks.kurum_rolu='ogrenci'
      AND kks.aktif=1
  )
  GROUP BY oo2.ogretmen_id,oo2.ogrenci_id
  HAVING COUNT(DISTINCT kko.kurum_id)=1
) scoped
  ON scoped.ogretmen_id=oo.ogretmen_id
 AND scoped.ogrenci_id=oo.ogrenci_id
SET oo.kurum_id=scoped.kurum_id
WHERE oo.kurum_id IS NULL;

-- Çözülemeyen eski/global ilişkiler 0 kapsamına alınır. Bu satırlar yalnızca
-- global hesapların global eşleştirmelerinde kullanılabilir.
UPDATE veli_ogrenci SET kurum_id=0 WHERE kurum_id IS NULL;
UPDATE ogretmen_ogrenci SET kurum_id=0 WHERE kurum_id IS NULL;

-- Aynı kişi çifti birden fazla kurumda tutulabilsin diye eski iki kolonlu PK'ları
-- kurum kapsamını da içerecek şekilde genişlet.
SET @vo_pk = (
  SELECT GROUP_CONCAT(column_name ORDER BY seq_in_index)
  FROM information_schema.statistics
  WHERE table_schema=DATABASE() AND table_name='veli_ogrenci' AND index_name='PRIMARY'
);
SET @sql = IF(@vo_pk='veli_id,ogrenci_id',
  'ALTER TABLE veli_ogrenci DROP PRIMARY KEY, ADD PRIMARY KEY (veli_id,ogrenci_id,kurum_id)',
  'SET @ilkadim_noop = 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @oo_pk = (
  SELECT GROUP_CONCAT(column_name ORDER BY seq_in_index)
  FROM information_schema.statistics
  WHERE table_schema=DATABASE() AND table_name='ogretmen_ogrenci' AND index_name='PRIMARY'
);
SET @sql = IF(@oo_pk='ogretmen_id,ogrenci_id',
  'ALTER TABLE ogretmen_ogrenci DROP PRIMARY KEY, ADD PRIMARY KEY (ogretmen_id,ogrenci_id,kurum_id)',
  'SET @ilkadim_noop = 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT(
  'ALTER TABLE veli_ogrenci MODIFY COLUMN kurum_id ',@kurum_id_type,' NOT NULL DEFAULT 0'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @sql = CONCAT(
  'ALTER TABLE ogretmen_ogrenci MODIFY COLUMN kurum_id ',@kurum_id_type,' NOT NULL DEFAULT 0'
);
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_vo_scope_index = (
  SELECT COUNT(*)
  FROM information_schema.statistics
  WHERE table_schema=DATABASE() AND table_name='veli_ogrenci'
    AND index_name='ix_veli_ogrenci_kurum'
);
SET @sql = IF(@has_vo_scope_index=0,
  'ALTER TABLE veli_ogrenci ADD KEY ix_veli_ogrenci_kurum (kurum_id,ogrenci_id)',
  'SET @ilkadim_noop = 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;

SET @has_oo_scope_index = (
  SELECT COUNT(*)
  FROM information_schema.statistics
  WHERE table_schema=DATABASE() AND table_name='ogretmen_ogrenci'
    AND index_name='ix_ogretmen_ogrenci_kurum'
);
SET @sql = IF(@has_oo_scope_index=0,
  'ALTER TABLE ogretmen_ogrenci ADD KEY ix_ogretmen_ogrenci_kurum (kurum_id,ogrenci_id)',
  'SET @ilkadim_noop = 1');
PREPARE stmt FROM @sql;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
