-- İlkAdım 1.1.93
-- RETIRED: Bu migration geçmişte eski kurum_kullanicilari tablosunu DROP ederek
-- yeniden oluşturuyordu. Veri içeren canlı tablolarda kurum eşleşmesi kaybı
-- oluşturabileceği için otomatik ve manuel çalıştırmada artık no-op'tur.
--
-- Güncel updater:
-- - tablo boşsa güvenli şema onarımı yapabilir,
-- - tablo veri içeriyorsa güncellemeyi durdurur ve kontrollü veri dönüşümü ister.
SET NAMES utf8mb4;
SET @ilkadim_retired_000 = 1;
