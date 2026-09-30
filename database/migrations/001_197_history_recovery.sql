-- İlkAdım 1.1.97 -> 1.1.98 migration-history recovery bridge.
-- Yalnız aktif update gerçekten 1.1.97'den 1.1.98'e gidiyorsa ve
-- 1.1.97'nin geç şema izleri mevcutsa eksik geçmiş kayıtlarını normalize eder.
-- Kullanıcı verisini silmez veya içerik tablolarını yeniden üretmez.

SET @ilkadim_197_active_update = (
    SELECT COUNT(*)
    FROM guncelleme_gecmisi
    WHERE onceki_surumu='1.1.97'
      AND yeni_surumu='1.1.98'
      AND durum='basladi'
);

SET @ilkadim_197_schema_markers = (
    SELECT COUNT(*)
    FROM information_schema.tables
    WHERE table_schema=DATABASE()
      AND table_name IN (
        'giris_guvenlik',
        'ders_bolumleri',
        'ders_konulari',
        'ders_sorulari',
        'sinif_dersleri'
      )
);

SET @ilkadim_197_recovery_ok = IF(
    @ilkadim_197_active_update >= 1
    AND @ilkadim_197_schema_markers = 5,
    1,
    0
);

SET @ilkadim_197_guard_sql = IF(
    @ilkadim_197_recovery_ok = 1,
    'SELECT 1',
    'SELECT * FROM __ilkadim_197_recovery_precondition_failed__ LIMIT 1'
);
PREPARE ilkadim_197_guard_stmt FROM @ilkadim_197_guard_sql;
EXECUTE ilkadim_197_guard_stmt;
DEALLOCATE PREPARE ilkadim_197_guard_stmt;

INSERT IGNORE INTO sistem_migrations (migration) VALUES
('002_utf8mb4_unicode'),
('003_gercek_veri_takibi'),
('004_ogrenci_giris_sistemi'),
('005_auth_repair'),
('008_kaliteli_1_sinif_ders_modulleri'),
('009_61_ozgun_1_sinif_modulu'),
('010_matematik_simge_ve_dersler_ui'),
('011_etkinlik_oyunlari_ve_35_gorev'),
('012_etkinlik_simge_ve_tekrar_oynama'),
('013_ilk_uc_oyun_veritabani'),
('014_15_yeni_etkinlik_150_gorev'),
('016_pwa_offline_sync'),
('017_v4_ozellikler'),
('018_gercek_yetkilendirme'),
('019_kurum_ve_rol_panelleri'),
('020_global_ve_kurum_kullanicilarini_ayir'),
('021_ogretmenim_icerikleri'),
('022_veli_ogretmen_telefon_uyumluluk'),
('023_yonetici_yetkileri'),
('029_sinif_bazli_icerik'),
('030_temel_egitim_1_8'),
('031_meb_soru_havuzu_aktivasyonu'),
('033_grade3_meb_icerik_aktivasyonu'),
('034_grade4_meb_icerik_aktivasyonu'),
('035_grade5_meb_icerik_aktivasyonu'),
('036_grade6_schema'),
('037_grade6_turkce'),
('038_grade6_matematik'),
('039_grade6_ingilizce'),
('040_grade6_fen'),
('041_grade6_sosyal'),
('042_grade6_dkab'),
('043_grade6_bilisim'),
('044_grade6_diger'),
('045_grade7_schema'),
('046_grade7_turkce'),
('047_grade7_matematik'),
('048_grade7_ingilizce'),
('049_grade7_fen'),
('050_grade7_sosyal'),
('051_grade7_dkab'),
('052_grade7_teknoloji_tasarim'),
('053_grade7_diger'),
('054_grade8_schema'),
('055_grade8_turkce'),
('056_grade8_matematik'),
('057_grade8_ingilizce'),
('058_grade8_fen'),
('059_grade8_inkilap'),
('060_grade8_dkab'),
('061_grade8_teknoloji_tasarim'),
('062_grade8_diger'),
('063_login_rate_limit');
