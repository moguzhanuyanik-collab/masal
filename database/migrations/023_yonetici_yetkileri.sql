CREATE TABLE IF NOT EXISTS yonetici_yetkileri (
  kullanici_id BIGINT UNSIGNED NOT NULL,
  yetki VARCHAR(40) NOT NULL,
  olusturulma_tarihi DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (kullanici_id,yetki),
  CONSTRAINT fk_yy_kullanici FOREIGN KEY (kullanici_id) REFERENCES kullanicilar(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

-- Mevcut yöneticilerin erişimini güncelleme sırasında koru; sonra Süper Admin düzenleyebilir.
INSERT IGNORE INTO yonetici_yetkileri (kullanici_id,yetki)
SELECT k.id,p.yetki FROM kullanicilar k
JOIN (SELECT 'kurum_goruntule' yetki UNION ALL SELECT 'ogretmen_yonet' UNION ALL SELECT 'veli_yonet' UNION ALL SELECT 'ogrenci_yonet') p
WHERE k.ana_rol='yonetici' OR EXISTS(SELECT 1 FROM kullanici_rolleri r WHERE r.kullanici_id=k.id AND r.rol='yonetici');
