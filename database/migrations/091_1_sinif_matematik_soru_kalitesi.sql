SET NAMES utf8mb4;

-- 1. sınıf Matematik soru kalite düzeltmesi.
-- Soru kodları, kayıt kimlikleri, seçenekler ve doğru cevap indeksleri korunur.
-- Yalnız soru metni ve açıklama, çocuğa uygun somut/günlük yaşam diliyle iyileştirilir.
-- Tablo yoksa güvenli biçimde oluşturulur; içerik yoksa UPDATE'ler doğal olarak 0 satır etkiler.

CREATE TABLE IF NOT EXISTS ders_konulari (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  ders_id BIGINT UNSIGNED NOT NULL,
  bolum_id BIGINT UNSIGNED NULL,
  kademe_kodu VARCHAR(30) NOT NULL DEFAULT 'temel_egitim',
  sinif_seviyesi TINYINT UNSIGNED NOT NULL,
  konu_kodu VARCHAR(120) NOT NULL,
  ad VARCHAR(190) NOT NULL,
  aciklama TEXT NULL,
  anlatim TEXT NULL,
  ornek_metni TEXT NULL,
  sira INT NOT NULL DEFAULT 0,
  aktif TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ders_konu (ders_id,kademe_kodu,sinif_seviyesi,konu_kodu),
  KEY ix_ders_konu_sira (kademe_kodu,sinif_seviyesi,ders_id,aktif,sira),
  KEY ix_ders_konu_bolum (bolum_id,aktif,sira)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS ders_sorulari (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  konu_id BIGINT UNSIGNED NOT NULL,
  soru_kodu VARCHAR(160) NOT NULL,
  soru_turu VARCHAR(30) NOT NULL DEFAULT 'coktan_secmeli',
  soru TEXT NOT NULL,
  secenekler_json LONGTEXT NOT NULL,
  dogru_cevap_indeksi TINYINT UNSIGNED NOT NULL,
  aciklama TEXT NULL,
  zorluk TINYINT UNSIGNED NOT NULL DEFAULT 1,
  gorsel_anahtari VARCHAR(190) NULL,
  ses_metni TEXT NULL,
  sira INT NOT NULL DEFAULT 0,
  aktif TINYINT(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (id),
  UNIQUE KEY uk_ders_soru_kodu (soru_kodu),
  KEY ix_ders_soru_konu (konu_id,aktif,sira)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sepette hiç elma yok. Sepetteki elma sayısını hangi sayı gösterir?',
    s.aciklama='Hiç nesne olmadığında miktarı 0 sayısı gösterir.'
WHERE s.soru_kodu='mat-sayi-0'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='🍎 Burada kaç tane var?',
    s.aciklama='Nesneleri birer birer sayınca 1 tane olduğunu buluruz.'
WHERE s.soru_kodu='mat-sayi-1'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='⭐⭐ Burada kaç tane var?',
    s.aciklama='Nesneleri birer birer sayınca 2 tane olduğunu buluruz.'
WHERE s.soru_kodu='mat-sayi-2'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='⚽⚽⚽ Burada kaç tane var?',
    s.aciklama='Nesneleri birer birer sayınca 3 tane olduğunu buluruz.'
WHERE s.soru_kodu='mat-sayi-3'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='🐟🐟🐟🐟 Burada kaç tane var?',
    s.aciklama='Nesneleri birer birer sayınca 4 tane olduğunu buluruz.'
WHERE s.soru_kodu='mat-sayi-4'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='🌼🌼🌼🌼🌼 Burada kaç tane var?',
    s.aciklama='Nesneleri birer birer sayınca 5 tane olduğunu buluruz.'
WHERE s.soru_kodu='mat-sayi-5'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='🍎🍎🍎🍎🍎🍎 Burada kaç tane var?',
    s.aciklama='Nesneleri birer birer sayınca 6 tane olduğunu buluruz.'
WHERE s.soru_kodu='mat-sayi-6'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='⭐⭐⭐⭐⭐⭐⭐ Burada kaç tane var?',
    s.aciklama='Nesneleri birer birer sayınca 7 tane olduğunu buluruz.'
WHERE s.soru_kodu='mat-sayi-7'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='⚽⚽⚽⚽⚽⚽⚽⚽ Burada kaç tane var?',
    s.aciklama='Nesneleri birer birer sayınca 8 tane olduğunu buluruz.'
WHERE s.soru_kodu='mat-sayi-8'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='🐟🐟🐟🐟🐟🐟🐟🐟🐟 Burada kaç tane var?',
    s.aciklama='Nesneleri birer birer sayınca 9 tane olduğunu buluruz.'
WHERE s.soru_kodu='mat-sayi-9'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir onluk kaç birlik eder?',
    s.aciklama='Bir onluk, 10 birlikten oluşur.'
WHERE s.soru_kodu='mat-sayi-10'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='1 onluk ve 1 birlik birlikte hangi sayıyı oluşturur?',
    s.aciklama='1 onluk 10''dur. 10 ile 1 birliği birleştirince 11 olur.'
WHERE s.soru_kodu='mat-sayi-11'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='1 onluk ve 2 birlik birlikte hangi sayıyı oluşturur?',
    s.aciklama='1 onluk 10''dur. 10 ile 2 birliği birleştirince 12 olur.'
WHERE s.soru_kodu='mat-sayi-12'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='1 onluk ve 3 birlik birlikte hangi sayıyı oluşturur?',
    s.aciklama='1 onluk 10''dur. 10 ile 3 birliği birleştirince 13 olur.'
WHERE s.soru_kodu='mat-sayi-13'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='1 onluk ve 4 birlik birlikte hangi sayıyı oluşturur?',
    s.aciklama='1 onluk 10''dur. 10 ile 4 birliği birleştirince 14 olur.'
WHERE s.soru_kodu='mat-sayi-14'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='1 onluk ve 5 birlik birlikte hangi sayıyı oluşturur?',
    s.aciklama='1 onluk 10''dur. 10 ile 5 birliği birleştirince 15 olur.'
WHERE s.soru_kodu='mat-sayi-15'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='1 onluk ve 6 birlik birlikte hangi sayıyı oluşturur?',
    s.aciklama='1 onluk 10''dur. 10 ile 6 birliği birleştirince 16 olur.'
WHERE s.soru_kodu='mat-sayi-16'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='1 onluk ve 7 birlik birlikte hangi sayıyı oluşturur?',
    s.aciklama='1 onluk 10''dur. 10 ile 7 birliği birleştirince 17 olur.'
WHERE s.soru_kodu='mat-sayi-17'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='1 onluk ve 8 birlik birlikte hangi sayıyı oluşturur?',
    s.aciklama='1 onluk 10''dur. 10 ile 8 birliği birleştirince 18 olur.'
WHERE s.soru_kodu='mat-sayi-18'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='1 onluk ve 9 birlik birlikte hangi sayıyı oluşturur?',
    s.aciklama='1 onluk 10''dur. 10 ile 9 birliği birleştirince 19 olur.'
WHERE s.soru_kodu='mat-sayi-19'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='1 onluk ve 10 birlik birlikte hangi sayıyı oluşturur?',
    s.aciklama='1 onluk 10''dur. 10 ile 10 birliği birleştirince 20 olur.'
WHERE s.soru_kodu='mat-sayi-20'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı treninde 0, 1, 2 vagonları yan yana. 1''in hemen önündeki sayı hangisidir?',
    s.aciklama='1''den bir adım geri gidince 0 sayısına geliriz.'
WHERE s.soru_kodu='mat-once-1'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 1''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?',
    s.aciklama='1''den bir adım ileri gidince 2 sayısına ulaşırız.'
WHERE s.soru_kodu='mat-sonra-1'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı treninde 1, 2, 3 vagonları yan yana. 2''in hemen önündeki sayı hangisidir?',
    s.aciklama='2''den bir adım geri gidince 1 sayısına geliriz.'
WHERE s.soru_kodu='mat-once-2'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 2''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?',
    s.aciklama='2''den bir adım ileri gidince 3 sayısına ulaşırız.'
WHERE s.soru_kodu='mat-sonra-2'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı treninde 2, 3, 4 vagonları yan yana. 3''in hemen önündeki sayı hangisidir?',
    s.aciklama='3''den bir adım geri gidince 2 sayısına geliriz.'
WHERE s.soru_kodu='mat-once-3'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 3''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?',
    s.aciklama='3''den bir adım ileri gidince 4 sayısına ulaşırız.'
WHERE s.soru_kodu='mat-sonra-3'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı treninde 3, 4, 5 vagonları yan yana. 4''in hemen önündeki sayı hangisidir?',
    s.aciklama='4''den bir adım geri gidince 3 sayısına geliriz.'
WHERE s.soru_kodu='mat-once-4'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 4''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?',
    s.aciklama='4''den bir adım ileri gidince 5 sayısına ulaşırız.'
WHERE s.soru_kodu='mat-sonra-4'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı treninde 4, 5, 6 vagonları yan yana. 5''in hemen önündeki sayı hangisidir?',
    s.aciklama='5''den bir adım geri gidince 4 sayısına geliriz.'
WHERE s.soru_kodu='mat-once-5'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 5''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?',
    s.aciklama='5''den bir adım ileri gidince 6 sayısına ulaşırız.'
WHERE s.soru_kodu='mat-sonra-5'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı treninde 5, 6, 7 vagonları yan yana. 6''in hemen önündeki sayı hangisidir?',
    s.aciklama='6''den bir adım geri gidince 5 sayısına geliriz.'
WHERE s.soru_kodu='mat-once-6'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 6''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?',
    s.aciklama='6''den bir adım ileri gidince 7 sayısına ulaşırız.'
WHERE s.soru_kodu='mat-sonra-6'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı treninde 6, 7, 8 vagonları yan yana. 7''in hemen önündeki sayı hangisidir?',
    s.aciklama='7''den bir adım geri gidince 6 sayısına geliriz.'
WHERE s.soru_kodu='mat-once-7'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 7''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?',
    s.aciklama='7''den bir adım ileri gidince 8 sayısına ulaşırız.'
WHERE s.soru_kodu='mat-sonra-7'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı treninde 7, 8, 9 vagonları yan yana. 8''in hemen önündeki sayı hangisidir?',
    s.aciklama='8''den bir adım geri gidince 7 sayısına geliriz.'
WHERE s.soru_kodu='mat-once-8'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 8''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?',
    s.aciklama='8''den bir adım ileri gidince 9 sayısına ulaşırız.'
WHERE s.soru_kodu='mat-sonra-8'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı treninde 8, 9, 10 vagonları yan yana. 9''in hemen önündeki sayı hangisidir?',
    s.aciklama='9''den bir adım geri gidince 8 sayısına geliriz.'
WHERE s.soru_kodu='mat-once-9'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 9''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?',
    s.aciklama='9''den bir adım ileri gidince 10 sayısına ulaşırız.'
WHERE s.soru_kodu='mat-sonra-9'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı treninde 9, 10, 11 vagonları yan yana. 10''in hemen önündeki sayı hangisidir?',
    s.aciklama='10''den bir adım geri gidince 9 sayısına geliriz.'
WHERE s.soru_kodu='mat-once-10'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 10''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?',
    s.aciklama='10''den bir adım ileri gidince 11 sayısına ulaşırız.'
WHERE s.soru_kodu='mat-sonra-10'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı treninde 10, 11, 12 vagonları yan yana. 11''in hemen önündeki sayı hangisidir?',
    s.aciklama='11''den bir adım geri gidince 10 sayısına geliriz.'
WHERE s.soru_kodu='mat-once-11'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 11''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?',
    s.aciklama='11''den bir adım ileri gidince 12 sayısına ulaşırız.'
WHERE s.soru_kodu='mat-sonra-11'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı treninde 11, 12, 13 vagonları yan yana. 12''in hemen önündeki sayı hangisidir?',
    s.aciklama='12''den bir adım geri gidince 11 sayısına geliriz.'
WHERE s.soru_kodu='mat-once-12'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 12''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?',
    s.aciklama='12''den bir adım ileri gidince 13 sayısına ulaşırız.'
WHERE s.soru_kodu='mat-sonra-12'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı treninde 12, 13, 14 vagonları yan yana. 13''in hemen önündeki sayı hangisidir?',
    s.aciklama='13''den bir adım geri gidince 12 sayısına geliriz.'
WHERE s.soru_kodu='mat-once-13'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 13''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?',
    s.aciklama='13''den bir adım ileri gidince 14 sayısına ulaşırız.'
WHERE s.soru_kodu='mat-sonra-13'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı treninde 13, 14, 15 vagonları yan yana. 14''in hemen önündeki sayı hangisidir?',
    s.aciklama='14''den bir adım geri gidince 13 sayısına geliriz.'
WHERE s.soru_kodu='mat-once-14'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 14''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?',
    s.aciklama='14''den bir adım ileri gidince 15 sayısına ulaşırız.'
WHERE s.soru_kodu='mat-sonra-14'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı treninde 14, 15, 16 vagonları yan yana. 15''in hemen önündeki sayı hangisidir?',
    s.aciklama='15''den bir adım geri gidince 14 sayısına geliriz.'
WHERE s.soru_kodu='mat-once-15'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 15''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?',
    s.aciklama='15''den bir adım ileri gidince 16 sayısına ulaşırız.'
WHERE s.soru_kodu='mat-sonra-15'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı treninde 15, 16, 17 vagonları yan yana. 16''in hemen önündeki sayı hangisidir?',
    s.aciklama='16''den bir adım geri gidince 15 sayısına geliriz.'
WHERE s.soru_kodu='mat-once-16'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 16''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?',
    s.aciklama='16''den bir adım ileri gidince 17 sayısına ulaşırız.'
WHERE s.soru_kodu='mat-sonra-16'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı treninde 16, 17, 18 vagonları yan yana. 17''in hemen önündeki sayı hangisidir?',
    s.aciklama='17''den bir adım geri gidince 16 sayısına geliriz.'
WHERE s.soru_kodu='mat-once-17'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 17''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?',
    s.aciklama='17''den bir adım ileri gidince 18 sayısına ulaşırız.'
WHERE s.soru_kodu='mat-sonra-17'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı treninde 17, 18, 19 vagonları yan yana. 18''in hemen önündeki sayı hangisidir?',
    s.aciklama='18''den bir adım geri gidince 17 sayısına geliriz.'
WHERE s.soru_kodu='mat-once-18'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 18''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?',
    s.aciklama='18''den bir adım ileri gidince 19 sayısına ulaşırız.'
WHERE s.soru_kodu='mat-sonra-18'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı treninde 18, 19, 20 vagonları yan yana. 19''in hemen önündeki sayı hangisidir?',
    s.aciklama='19''den bir adım geri gidince 18 sayısına geliriz.'
WHERE s.soru_kodu='mat-once-19'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 19''den bir adım ileri gidiyorsun. Hangi sayıya ulaşırsın?',
    s.aciklama='19''den bir adım ileri gidince 20 sayısına ulaşırız.'
WHERE s.soru_kodu='mat-sonra-19'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir kutuda 1 boncuk, diğer kutuda 2 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?',
    s.aciklama='2, 1''den büyüktür; daha çok boncuğu gösterir.'
WHERE s.soru_kodu='mat-buyuk-1'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir tabakta 1 kurabiye, diğerinde 2 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?',
    s.aciklama='1, 2''den küçüktür; daha az kurabiyeyi gösterir.'
WHERE s.soru_kodu='mat-kucuk-1'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir kutuda 1 boncuk, diğer kutuda 4 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?',
    s.aciklama='4, 1''den büyüktür; daha çok boncuğu gösterir.'
WHERE s.soru_kodu='mat-buyuk-2'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir tabakta 1 kurabiye, diğerinde 4 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?',
    s.aciklama='1, 4''den küçüktür; daha az kurabiyeyi gösterir.'
WHERE s.soru_kodu='mat-kucuk-2'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir kutuda 1 boncuk, diğer kutuda 6 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?',
    s.aciklama='6, 1''den büyüktür; daha çok boncuğu gösterir.'
WHERE s.soru_kodu='mat-buyuk-3'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir tabakta 1 kurabiye, diğerinde 6 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?',
    s.aciklama='1, 6''den küçüktür; daha az kurabiyeyi gösterir.'
WHERE s.soru_kodu='mat-kucuk-3'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir kutuda 3 boncuk, diğer kutuda 4 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?',
    s.aciklama='4, 3''den büyüktür; daha çok boncuğu gösterir.'
WHERE s.soru_kodu='mat-buyuk-4'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir tabakta 3 kurabiye, diğerinde 4 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?',
    s.aciklama='3, 4''den küçüktür; daha az kurabiyeyi gösterir.'
WHERE s.soru_kodu='mat-kucuk-4'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir kutuda 3 boncuk, diğer kutuda 6 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?',
    s.aciklama='6, 3''den büyüktür; daha çok boncuğu gösterir.'
WHERE s.soru_kodu='mat-buyuk-5'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir tabakta 3 kurabiye, diğerinde 6 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?',
    s.aciklama='3, 6''den küçüktür; daha az kurabiyeyi gösterir.'
WHERE s.soru_kodu='mat-kucuk-5'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir kutuda 3 boncuk, diğer kutuda 8 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?',
    s.aciklama='8, 3''den büyüktür; daha çok boncuğu gösterir.'
WHERE s.soru_kodu='mat-buyuk-6'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir tabakta 3 kurabiye, diğerinde 8 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?',
    s.aciklama='3, 8''den küçüktür; daha az kurabiyeyi gösterir.'
WHERE s.soru_kodu='mat-kucuk-6'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir kutuda 5 boncuk, diğer kutuda 6 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?',
    s.aciklama='6, 5''den büyüktür; daha çok boncuğu gösterir.'
WHERE s.soru_kodu='mat-buyuk-7'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir tabakta 5 kurabiye, diğerinde 6 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?',
    s.aciklama='5, 6''den küçüktür; daha az kurabiyeyi gösterir.'
WHERE s.soru_kodu='mat-kucuk-7'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir kutuda 5 boncuk, diğer kutuda 8 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?',
    s.aciklama='8, 5''den büyüktür; daha çok boncuğu gösterir.'
WHERE s.soru_kodu='mat-buyuk-8'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir tabakta 5 kurabiye, diğerinde 8 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?',
    s.aciklama='5, 8''den küçüktür; daha az kurabiyeyi gösterir.'
WHERE s.soru_kodu='mat-kucuk-8'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir kutuda 5 boncuk, diğer kutuda 10 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?',
    s.aciklama='10, 5''den büyüktür; daha çok boncuğu gösterir.'
WHERE s.soru_kodu='mat-buyuk-9'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir tabakta 5 kurabiye, diğerinde 10 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?',
    s.aciklama='5, 10''den küçüktür; daha az kurabiyeyi gösterir.'
WHERE s.soru_kodu='mat-kucuk-9'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir kutuda 7 boncuk, diğer kutuda 8 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?',
    s.aciklama='8, 7''den büyüktür; daha çok boncuğu gösterir.'
WHERE s.soru_kodu='mat-buyuk-10'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir tabakta 7 kurabiye, diğerinde 8 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?',
    s.aciklama='7, 8''den küçüktür; daha az kurabiyeyi gösterir.'
WHERE s.soru_kodu='mat-kucuk-10'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir kutuda 7 boncuk, diğer kutuda 10 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?',
    s.aciklama='10, 7''den büyüktür; daha çok boncuğu gösterir.'
WHERE s.soru_kodu='mat-buyuk-11'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir tabakta 7 kurabiye, diğerinde 10 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?',
    s.aciklama='7, 10''den küçüktür; daha az kurabiyeyi gösterir.'
WHERE s.soru_kodu='mat-kucuk-11'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir kutuda 7 boncuk, diğer kutuda 12 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?',
    s.aciklama='12, 7''den büyüktür; daha çok boncuğu gösterir.'
WHERE s.soru_kodu='mat-buyuk-12'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir tabakta 7 kurabiye, diğerinde 12 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?',
    s.aciklama='7, 12''den küçüktür; daha az kurabiyeyi gösterir.'
WHERE s.soru_kodu='mat-kucuk-12'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir kutuda 9 boncuk, diğer kutuda 10 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?',
    s.aciklama='10, 9''den büyüktür; daha çok boncuğu gösterir.'
WHERE s.soru_kodu='mat-buyuk-13'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir tabakta 9 kurabiye, diğerinde 10 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?',
    s.aciklama='9, 10''den küçüktür; daha az kurabiyeyi gösterir.'
WHERE s.soru_kodu='mat-kucuk-13'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir kutuda 9 boncuk, diğer kutuda 12 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?',
    s.aciklama='12, 9''den büyüktür; daha çok boncuğu gösterir.'
WHERE s.soru_kodu='mat-buyuk-14'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir tabakta 9 kurabiye, diğerinde 12 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?',
    s.aciklama='9, 12''den küçüktür; daha az kurabiyeyi gösterir.'
WHERE s.soru_kodu='mat-kucuk-14'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir kutuda 9 boncuk, diğer kutuda 14 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?',
    s.aciklama='14, 9''den büyüktür; daha çok boncuğu gösterir.'
WHERE s.soru_kodu='mat-buyuk-15'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir tabakta 9 kurabiye, diğerinde 14 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?',
    s.aciklama='9, 14''den küçüktür; daha az kurabiyeyi gösterir.'
WHERE s.soru_kodu='mat-kucuk-15'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir kutuda 11 boncuk, diğer kutuda 12 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?',
    s.aciklama='12, 11''den büyüktür; daha çok boncuğu gösterir.'
WHERE s.soru_kodu='mat-buyuk-16'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir tabakta 11 kurabiye, diğerinde 12 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?',
    s.aciklama='11, 12''den küçüktür; daha az kurabiyeyi gösterir.'
WHERE s.soru_kodu='mat-kucuk-16'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir kutuda 11 boncuk, diğer kutuda 14 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?',
    s.aciklama='14, 11''den büyüktür; daha çok boncuğu gösterir.'
WHERE s.soru_kodu='mat-buyuk-17'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir tabakta 11 kurabiye, diğerinde 14 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?',
    s.aciklama='11, 14''den küçüktür; daha az kurabiyeyi gösterir.'
WHERE s.soru_kodu='mat-kucuk-17'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir kutuda 11 boncuk, diğer kutuda 16 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?',
    s.aciklama='16, 11''den büyüktür; daha çok boncuğu gösterir.'
WHERE s.soru_kodu='mat-buyuk-18'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir tabakta 11 kurabiye, diğerinde 16 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?',
    s.aciklama='11, 16''den küçüktür; daha az kurabiyeyi gösterir.'
WHERE s.soru_kodu='mat-kucuk-18'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir kutuda 13 boncuk, diğer kutuda 14 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?',
    s.aciklama='14, 13''den büyüktür; daha çok boncuğu gösterir.'
WHERE s.soru_kodu='mat-buyuk-19'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir tabakta 13 kurabiye, diğerinde 14 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?',
    s.aciklama='13, 14''den küçüktür; daha az kurabiyeyi gösterir.'
WHERE s.soru_kodu='mat-kucuk-19'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir kutuda 13 boncuk, diğer kutuda 16 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?',
    s.aciklama='16, 13''den büyüktür; daha çok boncuğu gösterir.'
WHERE s.soru_kodu='mat-buyuk-20'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir tabakta 13 kurabiye, diğerinde 16 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?',
    s.aciklama='13, 16''den küçüktür; daha az kurabiyeyi gösterir.'
WHERE s.soru_kodu='mat-kucuk-20'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir kutuda 13 boncuk, diğer kutuda 18 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?',
    s.aciklama='18, 13''den büyüktür; daha çok boncuğu gösterir.'
WHERE s.soru_kodu='mat-buyuk-21'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir tabakta 13 kurabiye, diğerinde 18 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?',
    s.aciklama='13, 18''den küçüktür; daha az kurabiyeyi gösterir.'
WHERE s.soru_kodu='mat-kucuk-21'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir kutuda 15 boncuk, diğer kutuda 16 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?',
    s.aciklama='16, 15''den büyüktür; daha çok boncuğu gösterir.'
WHERE s.soru_kodu='mat-buyuk-22'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir tabakta 15 kurabiye, diğerinde 16 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?',
    s.aciklama='15, 16''den küçüktür; daha az kurabiyeyi gösterir.'
WHERE s.soru_kodu='mat-kucuk-22'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir kutuda 15 boncuk, diğer kutuda 18 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?',
    s.aciklama='18, 15''den büyüktür; daha çok boncuğu gösterir.'
WHERE s.soru_kodu='mat-buyuk-23'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir tabakta 15 kurabiye, diğerinde 18 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?',
    s.aciklama='15, 18''den küçüktür; daha az kurabiyeyi gösterir.'
WHERE s.soru_kodu='mat-kucuk-23'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir kutuda 15 boncuk, diğer kutuda 20 boncuk var. Daha çok boncuğu gösteren sayı hangisidir?',
    s.aciklama='20, 15''den büyüktür; daha çok boncuğu gösterir.'
WHERE s.soru_kodu='mat-buyuk-24'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir tabakta 15 kurabiye, diğerinde 20 kurabiye var. Daha az kurabiyeyi gösteren sayı hangisidir?',
    s.aciklama='15, 20''den küçüktür; daha az kurabiyeyi gösterir.'
WHERE s.soru_kodu='mat-kucuk-24'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='⭐⭐⭐⭐⭐ Bu gruba hızlıca baktığında yaklaşık kaç tane görüyorsun?',
    s.aciklama='Önce tahmin ederiz, sonra sayarak kontrol ederiz. Burada 5 tane vardır.'
WHERE s.soru_kodu='mat-tahmin-1'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='🔵🔵🔵🔵🔵🔵🔵🔵🔵🔵 Bu gruba hızlıca baktığında yaklaşık kaç tane görüyorsun?',
    s.aciklama='Önce tahmin ederiz, sonra sayarak kontrol ederiz. Burada 10 tane vardır.'
WHERE s.soru_kodu='mat-tahmin-2'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='🍎🍎🍎🍎🍎🍎🍎 Bu gruba hızlıca baktığında yaklaşık kaç tane görüyorsun?',
    s.aciklama='Önce tahmin ederiz, sonra sayarak kontrol ederiz. Burada 7 tane vardır.'
WHERE s.soru_kodu='mat-tahmin-3'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='🌼🌼 Bu gruba hızlıca baktığında yaklaşık kaç tane görüyorsun?',
    s.aciklama='Önce tahmin ederiz, sonra sayarak kontrol ederiz. Burada 2 tane vardır.'
WHERE s.soru_kodu='mat-tahmin-4'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='⭐⭐⭐ Bu gruba hızlıca baktığında yaklaşık kaç tane görüyorsun?',
    s.aciklama='Önce tahmin ederiz, sonra sayarak kontrol ederiz. Burada 3 tane vardır.'
WHERE s.soru_kodu='mat-tahmin-5'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='🔵🔵🔵🔵 Bu gruba hızlıca baktığında yaklaşık kaç tane görüyorsun?',
    s.aciklama='Önce tahmin ederiz, sonra sayarak kontrol ederiz. Burada 4 tane vardır.'
WHERE s.soru_kodu='mat-tahmin-6'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='🍎🍎 Bu gruba hızlıca baktığında yaklaşık kaç tane görüyorsun?',
    s.aciklama='Önce tahmin ederiz, sonra sayarak kontrol ederiz. Burada 2 tane vardır.'
WHERE s.soru_kodu='mat-tahmin-7'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='🌼🌼🌼🌼 Bu gruba hızlıca baktığında yaklaşık kaç tane görüyorsun?',
    s.aciklama='Önce tahmin ederiz, sonra sayarak kontrol ederiz. Burada 4 tane vardır.'
WHERE s.soru_kodu='mat-tahmin-8'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='30 cm''lik bir cetvel ile küçük bir silgiyi karşılaştırıyoruz. Hangisi daha uzundur?',
    s.aciklama='Cetvel, küçük bir silgiden daha uzundur.'
WHERE s.soru_kodu='mat-uzunluk-1'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kalem ve silginin uçlarını aynı hizaya getirdik. Kalem daha ileri uzanıyor. Hangisi daha uzundur?',
    s.aciklama='Uçları aynı hizadayken daha ileri uzanan kalem daha uzundur.'
WHERE s.soru_kodu='mat-uzunluk-2'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Masayı kaç karış olduğunu sayarak ölçmek hangi tür ölçmedir?',
    s.aciklama='Karış kişiden kişiye değişebildiği için standart olmayan bir ölçme aracıdır.'
WHERE s.soru_kodu='mat-uzunluk-3'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kitabın uzunluğunu standart olmayan bir araçla ölçmek için ne yapabiliriz?',
    s.aciklama='Aynı boydaki ataşları boşluk bırakmadan yan yana dizerek uzunluğu karşılaştırabiliriz.'
WHERE s.soru_kodu='mat-uzunluk-4'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir ders kitabı ile tek bir kâğıt yaprağını elinde karşılaştırırsan hangisi daha ağır hissedilir?',
    s.aciklama='Ders kitabı tek bir kâğıt yaprağından daha ağırdır.'
WHERE s.soru_kodu='mat-kutle-1'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir nesnenin ağır ya da hafif olması hangi özelliğiyle ilgilidir?',
    s.aciklama='Ağır ve hafif karşılaştırması kütle ile ilgilidir.'
WHERE s.soru_kodu='mat-kutle-3'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Aynı çanta ne zaman daha ağır olur?',
    s.aciklama='Çantaya kitaplar koyulduğunda kütlesi artar ve daha ağır olur.'
WHERE s.soru_kodu='mat-kutle-4'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Ece''nin 1 çıkartması vardı. 1 tane daha aldı. Şimdi kaç çıkartması var?',
    s.aciklama='1 ile 1''yi bir araya getirince 2 olur.'
WHERE s.soru_kodu='mat-top-1'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 1''den başla, 2 adım ileri git. Hangi sayıya ulaşırsın?',
    s.aciklama='1 ile 2''yi bir araya getirince 3 olur.'
WHERE s.soru_kodu='mat-top-2'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 1 kırmızı ve 3 mavi boncuk var. Toplam kaç boncuk var?',
    s.aciklama='1 ile 3''yi bir araya getirince 4 olur.'
WHERE s.soru_kodu='mat-top-3'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Masada 1 kalem vardı. Yanına 4 kalem daha koyduk. Masada kaç kalem oldu?',
    s.aciklama='1 ile 4''yi bir araya getirince 5 olur.'
WHERE s.soru_kodu='mat-top-4'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir sepette 1, diğer sepette 5 elma var. İki sepette toplam kaç elma var?',
    s.aciklama='1 ile 5''yi bir araya getirince 6 olur.'
WHERE s.soru_kodu='mat-top-5'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Ece''nin 1 çıkartması vardı. 6 tane daha aldı. Şimdi kaç çıkartması var?',
    s.aciklama='1 ile 6''yi bir araya getirince 7 olur.'
WHERE s.soru_kodu='mat-top-6'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 1''den başla, 7 adım ileri git. Hangi sayıya ulaşırsın?',
    s.aciklama='1 ile 7''yi bir araya getirince 8 olur.'
WHERE s.soru_kodu='mat-top-7'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 1 kırmızı ve 8 mavi boncuk var. Toplam kaç boncuk var?',
    s.aciklama='1 ile 8''yi bir araya getirince 9 olur.'
WHERE s.soru_kodu='mat-top-8'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Masada 1 kalem vardı. Yanına 9 kalem daha koyduk. Masada kaç kalem oldu?',
    s.aciklama='1 ile 9''yi bir araya getirince 10 olur.'
WHERE s.soru_kodu='mat-top-9'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir sepette 1, diğer sepette 10 elma var. İki sepette toplam kaç elma var?',
    s.aciklama='1 ile 10''yi bir araya getirince 11 olur.'
WHERE s.soru_kodu='mat-top-10'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Ece''nin 2 çıkartması vardı. 1 tane daha aldı. Şimdi kaç çıkartması var?',
    s.aciklama='2 ile 1''yi bir araya getirince 3 olur.'
WHERE s.soru_kodu='mat-top-11'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 2''den başla, 2 adım ileri git. Hangi sayıya ulaşırsın?',
    s.aciklama='2 ile 2''yi bir araya getirince 4 olur.'
WHERE s.soru_kodu='mat-top-12'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 2 kırmızı ve 3 mavi boncuk var. Toplam kaç boncuk var?',
    s.aciklama='2 ile 3''yi bir araya getirince 5 olur.'
WHERE s.soru_kodu='mat-top-13'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Masada 2 kalem vardı. Yanına 4 kalem daha koyduk. Masada kaç kalem oldu?',
    s.aciklama='2 ile 4''yi bir araya getirince 6 olur.'
WHERE s.soru_kodu='mat-top-14'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir sepette 2, diğer sepette 5 elma var. İki sepette toplam kaç elma var?',
    s.aciklama='2 ile 5''yi bir araya getirince 7 olur.'
WHERE s.soru_kodu='mat-top-15'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Ece''nin 2 çıkartması vardı. 6 tane daha aldı. Şimdi kaç çıkartması var?',
    s.aciklama='2 ile 6''yi bir araya getirince 8 olur.'
WHERE s.soru_kodu='mat-top-16'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 2''den başla, 7 adım ileri git. Hangi sayıya ulaşırsın?',
    s.aciklama='2 ile 7''yi bir araya getirince 9 olur.'
WHERE s.soru_kodu='mat-top-17'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 2 kırmızı ve 8 mavi boncuk var. Toplam kaç boncuk var?',
    s.aciklama='2 ile 8''yi bir araya getirince 10 olur.'
WHERE s.soru_kodu='mat-top-18'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Masada 2 kalem vardı. Yanına 9 kalem daha koyduk. Masada kaç kalem oldu?',
    s.aciklama='2 ile 9''yi bir araya getirince 11 olur.'
WHERE s.soru_kodu='mat-top-19'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir sepette 2, diğer sepette 10 elma var. İki sepette toplam kaç elma var?',
    s.aciklama='2 ile 10''yi bir araya getirince 12 olur.'
WHERE s.soru_kodu='mat-top-20'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Ece''nin 3 çıkartması vardı. 1 tane daha aldı. Şimdi kaç çıkartması var?',
    s.aciklama='3 ile 1''yi bir araya getirince 4 olur.'
WHERE s.soru_kodu='mat-top-21'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 3''den başla, 2 adım ileri git. Hangi sayıya ulaşırsın?',
    s.aciklama='3 ile 2''yi bir araya getirince 5 olur.'
WHERE s.soru_kodu='mat-top-22'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 3 kırmızı ve 3 mavi boncuk var. Toplam kaç boncuk var?',
    s.aciklama='3 ile 3''yi bir araya getirince 6 olur.'
WHERE s.soru_kodu='mat-top-23'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Masada 3 kalem vardı. Yanına 4 kalem daha koyduk. Masada kaç kalem oldu?',
    s.aciklama='3 ile 4''yi bir araya getirince 7 olur.'
WHERE s.soru_kodu='mat-top-24'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir sepette 3, diğer sepette 5 elma var. İki sepette toplam kaç elma var?',
    s.aciklama='3 ile 5''yi bir araya getirince 8 olur.'
WHERE s.soru_kodu='mat-top-25'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Ece''nin 3 çıkartması vardı. 6 tane daha aldı. Şimdi kaç çıkartması var?',
    s.aciklama='3 ile 6''yi bir araya getirince 9 olur.'
WHERE s.soru_kodu='mat-top-26'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 3''den başla, 7 adım ileri git. Hangi sayıya ulaşırsın?',
    s.aciklama='3 ile 7''yi bir araya getirince 10 olur.'
WHERE s.soru_kodu='mat-top-27'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 3 kırmızı ve 8 mavi boncuk var. Toplam kaç boncuk var?',
    s.aciklama='3 ile 8''yi bir araya getirince 11 olur.'
WHERE s.soru_kodu='mat-top-28'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Masada 3 kalem vardı. Yanına 9 kalem daha koyduk. Masada kaç kalem oldu?',
    s.aciklama='3 ile 9''yi bir araya getirince 12 olur.'
WHERE s.soru_kodu='mat-top-29'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir sepette 3, diğer sepette 10 elma var. İki sepette toplam kaç elma var?',
    s.aciklama='3 ile 10''yi bir araya getirince 13 olur.'
WHERE s.soru_kodu='mat-top-30'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Ece''nin 4 çıkartması vardı. 1 tane daha aldı. Şimdi kaç çıkartması var?',
    s.aciklama='4 ile 1''yi bir araya getirince 5 olur.'
WHERE s.soru_kodu='mat-top-31'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 4''den başla, 2 adım ileri git. Hangi sayıya ulaşırsın?',
    s.aciklama='4 ile 2''yi bir araya getirince 6 olur.'
WHERE s.soru_kodu='mat-top-32'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 4 kırmızı ve 3 mavi boncuk var. Toplam kaç boncuk var?',
    s.aciklama='4 ile 3''yi bir araya getirince 7 olur.'
WHERE s.soru_kodu='mat-top-33'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Masada 4 kalem vardı. Yanına 4 kalem daha koyduk. Masada kaç kalem oldu?',
    s.aciklama='4 ile 4''yi bir araya getirince 8 olur.'
WHERE s.soru_kodu='mat-top-34'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir sepette 4, diğer sepette 5 elma var. İki sepette toplam kaç elma var?',
    s.aciklama='4 ile 5''yi bir araya getirince 9 olur.'
WHERE s.soru_kodu='mat-top-35'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Ece''nin 4 çıkartması vardı. 6 tane daha aldı. Şimdi kaç çıkartması var?',
    s.aciklama='4 ile 6''yi bir araya getirince 10 olur.'
WHERE s.soru_kodu='mat-top-36'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 4''den başla, 7 adım ileri git. Hangi sayıya ulaşırsın?',
    s.aciklama='4 ile 7''yi bir araya getirince 11 olur.'
WHERE s.soru_kodu='mat-top-37'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 4 kırmızı ve 8 mavi boncuk var. Toplam kaç boncuk var?',
    s.aciklama='4 ile 8''yi bir araya getirince 12 olur.'
WHERE s.soru_kodu='mat-top-38'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Masada 4 kalem vardı. Yanına 9 kalem daha koyduk. Masada kaç kalem oldu?',
    s.aciklama='4 ile 9''yi bir araya getirince 13 olur.'
WHERE s.soru_kodu='mat-top-39'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir sepette 4, diğer sepette 10 elma var. İki sepette toplam kaç elma var?',
    s.aciklama='4 ile 10''yi bir araya getirince 14 olur.'
WHERE s.soru_kodu='mat-top-40'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Ece''nin 5 çıkartması vardı. 1 tane daha aldı. Şimdi kaç çıkartması var?',
    s.aciklama='5 ile 1''yi bir araya getirince 6 olur.'
WHERE s.soru_kodu='mat-top-41'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 5''den başla, 2 adım ileri git. Hangi sayıya ulaşırsın?',
    s.aciklama='5 ile 2''yi bir araya getirince 7 olur.'
WHERE s.soru_kodu='mat-top-42'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 5 kırmızı ve 3 mavi boncuk var. Toplam kaç boncuk var?',
    s.aciklama='5 ile 3''yi bir araya getirince 8 olur.'
WHERE s.soru_kodu='mat-top-43'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Masada 5 kalem vardı. Yanına 4 kalem daha koyduk. Masada kaç kalem oldu?',
    s.aciklama='5 ile 4''yi bir araya getirince 9 olur.'
WHERE s.soru_kodu='mat-top-44'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir sepette 5, diğer sepette 5 elma var. İki sepette toplam kaç elma var?',
    s.aciklama='5 ile 5''yi bir araya getirince 10 olur.'
WHERE s.soru_kodu='mat-top-45'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Ece''nin 5 çıkartması vardı. 6 tane daha aldı. Şimdi kaç çıkartması var?',
    s.aciklama='5 ile 6''yi bir araya getirince 11 olur.'
WHERE s.soru_kodu='mat-top-46'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 5''den başla, 7 adım ileri git. Hangi sayıya ulaşırsın?',
    s.aciklama='5 ile 7''yi bir araya getirince 12 olur.'
WHERE s.soru_kodu='mat-top-47'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 5 kırmızı ve 8 mavi boncuk var. Toplam kaç boncuk var?',
    s.aciklama='5 ile 8''yi bir araya getirince 13 olur.'
WHERE s.soru_kodu='mat-top-48'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Masada 5 kalem vardı. Yanına 9 kalem daha koyduk. Masada kaç kalem oldu?',
    s.aciklama='5 ile 9''yi bir araya getirince 14 olur.'
WHERE s.soru_kodu='mat-top-49'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir sepette 5, diğer sepette 10 elma var. İki sepette toplam kaç elma var?',
    s.aciklama='5 ile 10''yi bir araya getirince 15 olur.'
WHERE s.soru_kodu='mat-top-50'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Ece''nin 6 çıkartması vardı. 1 tane daha aldı. Şimdi kaç çıkartması var?',
    s.aciklama='6 ile 1''yi bir araya getirince 7 olur.'
WHERE s.soru_kodu='mat-top-51'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 6''den başla, 2 adım ileri git. Hangi sayıya ulaşırsın?',
    s.aciklama='6 ile 2''yi bir araya getirince 8 olur.'
WHERE s.soru_kodu='mat-top-52'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 6 kırmızı ve 3 mavi boncuk var. Toplam kaç boncuk var?',
    s.aciklama='6 ile 3''yi bir araya getirince 9 olur.'
WHERE s.soru_kodu='mat-top-53'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Masada 6 kalem vardı. Yanına 4 kalem daha koyduk. Masada kaç kalem oldu?',
    s.aciklama='6 ile 4''yi bir araya getirince 10 olur.'
WHERE s.soru_kodu='mat-top-54'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir sepette 6, diğer sepette 5 elma var. İki sepette toplam kaç elma var?',
    s.aciklama='6 ile 5''yi bir araya getirince 11 olur.'
WHERE s.soru_kodu='mat-top-55'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Ece''nin 6 çıkartması vardı. 6 tane daha aldı. Şimdi kaç çıkartması var?',
    s.aciklama='6 ile 6''yi bir araya getirince 12 olur.'
WHERE s.soru_kodu='mat-top-56'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 6''den başla, 7 adım ileri git. Hangi sayıya ulaşırsın?',
    s.aciklama='6 ile 7''yi bir araya getirince 13 olur.'
WHERE s.soru_kodu='mat-top-57'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 6 kırmızı ve 8 mavi boncuk var. Toplam kaç boncuk var?',
    s.aciklama='6 ile 8''yi bir araya getirince 14 olur.'
WHERE s.soru_kodu='mat-top-58'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Masada 6 kalem vardı. Yanına 9 kalem daha koyduk. Masada kaç kalem oldu?',
    s.aciklama='6 ile 9''yi bir araya getirince 15 olur.'
WHERE s.soru_kodu='mat-top-59'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir sepette 6, diğer sepette 10 elma var. İki sepette toplam kaç elma var?',
    s.aciklama='6 ile 10''yi bir araya getirince 16 olur.'
WHERE s.soru_kodu='mat-top-60'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Ece''nin 7 çıkartması vardı. 1 tane daha aldı. Şimdi kaç çıkartması var?',
    s.aciklama='7 ile 1''yi bir araya getirince 8 olur.'
WHERE s.soru_kodu='mat-top-61'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 7''den başla, 2 adım ileri git. Hangi sayıya ulaşırsın?',
    s.aciklama='7 ile 2''yi bir araya getirince 9 olur.'
WHERE s.soru_kodu='mat-top-62'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 7 kırmızı ve 3 mavi boncuk var. Toplam kaç boncuk var?',
    s.aciklama='7 ile 3''yi bir araya getirince 10 olur.'
WHERE s.soru_kodu='mat-top-63'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Masada 7 kalem vardı. Yanına 4 kalem daha koyduk. Masada kaç kalem oldu?',
    s.aciklama='7 ile 4''yi bir araya getirince 11 olur.'
WHERE s.soru_kodu='mat-top-64'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir sepette 7, diğer sepette 5 elma var. İki sepette toplam kaç elma var?',
    s.aciklama='7 ile 5''yi bir araya getirince 12 olur.'
WHERE s.soru_kodu='mat-top-65'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Ece''nin 7 çıkartması vardı. 6 tane daha aldı. Şimdi kaç çıkartması var?',
    s.aciklama='7 ile 6''yi bir araya getirince 13 olur.'
WHERE s.soru_kodu='mat-top-66'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 7''den başla, 7 adım ileri git. Hangi sayıya ulaşırsın?',
    s.aciklama='7 ile 7''yi bir araya getirince 14 olur.'
WHERE s.soru_kodu='mat-top-67'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 7 kırmızı ve 8 mavi boncuk var. Toplam kaç boncuk var?',
    s.aciklama='7 ile 8''yi bir araya getirince 15 olur.'
WHERE s.soru_kodu='mat-top-68'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Masada 7 kalem vardı. Yanına 9 kalem daha koyduk. Masada kaç kalem oldu?',
    s.aciklama='7 ile 9''yi bir araya getirince 16 olur.'
WHERE s.soru_kodu='mat-top-69'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bir sepette 7, diğer sepette 10 elma var. İki sepette toplam kaç elma var?',
    s.aciklama='7 ile 10''yi bir araya getirince 17 olur.'
WHERE s.soru_kodu='mat-top-70'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='2 balondan 1 tanesi patladı. Kaç balon kaldı?',
    s.aciklama='2''dan 1 çıkarınca 1 kalır.'
WHERE s.soru_kodu='mat-cik-1'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 3''den 1 adım geri git. Hangi sayıya ulaşırsın?',
    s.aciklama='3''dan 1 çıkarınca 2 kalır.'
WHERE s.soru_kodu='mat-cik-2'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 3 kalem vardı. 2 kalemi aldık. Kutuda kaç kalem kaldı?',
    s.aciklama='3''dan 2 çıkarınca 1 kalır.'
WHERE s.soru_kodu='mat-cik-3'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bahçede 4 kuş vardı. 1 kuş uçtu. Kaç kuş kaldı?',
    s.aciklama='4''dan 1 çıkarınca 3 kalır.'
WHERE s.soru_kodu='mat-cik-4'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Tabakta 4 kurabiye vardı. 2 tanesi yenildi. Kaç kurabiye kaldı?',
    s.aciklama='4''dan 2 çıkarınca 2 kalır.'
WHERE s.soru_kodu='mat-cik-5'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='4 balondan 3 tanesi patladı. Kaç balon kaldı?',
    s.aciklama='4''dan 3 çıkarınca 1 kalır.'
WHERE s.soru_kodu='mat-cik-6'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 5''den 1 adım geri git. Hangi sayıya ulaşırsın?',
    s.aciklama='5''dan 1 çıkarınca 4 kalır.'
WHERE s.soru_kodu='mat-cik-7'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 5 kalem vardı. 2 kalemi aldık. Kutuda kaç kalem kaldı?',
    s.aciklama='5''dan 2 çıkarınca 3 kalır.'
WHERE s.soru_kodu='mat-cik-8'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bahçede 5 kuş vardı. 3 kuş uçtu. Kaç kuş kaldı?',
    s.aciklama='5''dan 3 çıkarınca 2 kalır.'
WHERE s.soru_kodu='mat-cik-9'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Tabakta 6 kurabiye vardı. 1 tanesi yenildi. Kaç kurabiye kaldı?',
    s.aciklama='6''dan 1 çıkarınca 5 kalır.'
WHERE s.soru_kodu='mat-cik-10'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='6 balondan 2 tanesi patladı. Kaç balon kaldı?',
    s.aciklama='6''dan 2 çıkarınca 4 kalır.'
WHERE s.soru_kodu='mat-cik-11'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 6''den 3 adım geri git. Hangi sayıya ulaşırsın?',
    s.aciklama='6''dan 3 çıkarınca 3 kalır.'
WHERE s.soru_kodu='mat-cik-12'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 6 kalem vardı. 4 kalemi aldık. Kutuda kaç kalem kaldı?',
    s.aciklama='6''dan 4 çıkarınca 2 kalır.'
WHERE s.soru_kodu='mat-cik-13'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bahçede 7 kuş vardı. 1 kuş uçtu. Kaç kuş kaldı?',
    s.aciklama='7''dan 1 çıkarınca 6 kalır.'
WHERE s.soru_kodu='mat-cik-14'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Tabakta 7 kurabiye vardı. 2 tanesi yenildi. Kaç kurabiye kaldı?',
    s.aciklama='7''dan 2 çıkarınca 5 kalır.'
WHERE s.soru_kodu='mat-cik-15'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='7 balondan 3 tanesi patladı. Kaç balon kaldı?',
    s.aciklama='7''dan 3 çıkarınca 4 kalır.'
WHERE s.soru_kodu='mat-cik-16'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 7''den 5 adım geri git. Hangi sayıya ulaşırsın?',
    s.aciklama='7''dan 5 çıkarınca 2 kalır.'
WHERE s.soru_kodu='mat-cik-17'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 8 kalem vardı. 1 kalemi aldık. Kutuda kaç kalem kaldı?',
    s.aciklama='8''dan 1 çıkarınca 7 kalır.'
WHERE s.soru_kodu='mat-cik-18'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bahçede 8 kuş vardı. 2 kuş uçtu. Kaç kuş kaldı?',
    s.aciklama='8''dan 2 çıkarınca 6 kalır.'
WHERE s.soru_kodu='mat-cik-19'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Tabakta 8 kurabiye vardı. 3 tanesi yenildi. Kaç kurabiye kaldı?',
    s.aciklama='8''dan 3 çıkarınca 5 kalır.'
WHERE s.soru_kodu='mat-cik-20'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='8 balondan 4 tanesi patladı. Kaç balon kaldı?',
    s.aciklama='8''dan 4 çıkarınca 4 kalır.'
WHERE s.soru_kodu='mat-cik-21'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 8''den 6 adım geri git. Hangi sayıya ulaşırsın?',
    s.aciklama='8''dan 6 çıkarınca 2 kalır.'
WHERE s.soru_kodu='mat-cik-22'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 9 kalem vardı. 1 kalemi aldık. Kutuda kaç kalem kaldı?',
    s.aciklama='9''dan 1 çıkarınca 8 kalır.'
WHERE s.soru_kodu='mat-cik-23'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bahçede 9 kuş vardı. 2 kuş uçtu. Kaç kuş kaldı?',
    s.aciklama='9''dan 2 çıkarınca 7 kalır.'
WHERE s.soru_kodu='mat-cik-24'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Tabakta 9 kurabiye vardı. 3 tanesi yenildi. Kaç kurabiye kaldı?',
    s.aciklama='9''dan 3 çıkarınca 6 kalır.'
WHERE s.soru_kodu='mat-cik-25'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='9 balondan 5 tanesi patladı. Kaç balon kaldı?',
    s.aciklama='9''dan 5 çıkarınca 4 kalır.'
WHERE s.soru_kodu='mat-cik-26'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 9''den 7 adım geri git. Hangi sayıya ulaşırsın?',
    s.aciklama='9''dan 7 çıkarınca 2 kalır.'
WHERE s.soru_kodu='mat-cik-27'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 10 kalem vardı. 1 kalemi aldık. Kutuda kaç kalem kaldı?',
    s.aciklama='10''dan 1 çıkarınca 9 kalır.'
WHERE s.soru_kodu='mat-cik-28'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bahçede 10 kuş vardı. 2 kuş uçtu. Kaç kuş kaldı?',
    s.aciklama='10''dan 2 çıkarınca 8 kalır.'
WHERE s.soru_kodu='mat-cik-29'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Tabakta 10 kurabiye vardı. 3 tanesi yenildi. Kaç kurabiye kaldı?',
    s.aciklama='10''dan 3 çıkarınca 7 kalır.'
WHERE s.soru_kodu='mat-cik-30'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='10 balondan 4 tanesi patladı. Kaç balon kaldı?',
    s.aciklama='10''dan 4 çıkarınca 6 kalır.'
WHERE s.soru_kodu='mat-cik-31'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 10''den 6 adım geri git. Hangi sayıya ulaşırsın?',
    s.aciklama='10''dan 6 çıkarınca 4 kalır.'
WHERE s.soru_kodu='mat-cik-32'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 10 kalem vardı. 8 kalemi aldık. Kutuda kaç kalem kaldı?',
    s.aciklama='10''dan 8 çıkarınca 2 kalır.'
WHERE s.soru_kodu='mat-cik-33'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bahçede 11 kuş vardı. 1 kuş uçtu. Kaç kuş kaldı?',
    s.aciklama='11''dan 1 çıkarınca 10 kalır.'
WHERE s.soru_kodu='mat-cik-34'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Tabakta 11 kurabiye vardı. 2 tanesi yenildi. Kaç kurabiye kaldı?',
    s.aciklama='11''dan 2 çıkarınca 9 kalır.'
WHERE s.soru_kodu='mat-cik-35'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='11 balondan 3 tanesi patladı. Kaç balon kaldı?',
    s.aciklama='11''dan 3 çıkarınca 8 kalır.'
WHERE s.soru_kodu='mat-cik-36'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 11''den 5 adım geri git. Hangi sayıya ulaşırsın?',
    s.aciklama='11''dan 5 çıkarınca 6 kalır.'
WHERE s.soru_kodu='mat-cik-37'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 11 kalem vardı. 7 kalemi aldık. Kutuda kaç kalem kaldı?',
    s.aciklama='11''dan 7 çıkarınca 4 kalır.'
WHERE s.soru_kodu='mat-cik-38'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bahçede 11 kuş vardı. 9 kuş uçtu. Kaç kuş kaldı?',
    s.aciklama='11''dan 9 çıkarınca 2 kalır.'
WHERE s.soru_kodu='mat-cik-39'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Tabakta 12 kurabiye vardı. 1 tanesi yenildi. Kaç kurabiye kaldı?',
    s.aciklama='12''dan 1 çıkarınca 11 kalır.'
WHERE s.soru_kodu='mat-cik-40'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='12 balondan 2 tanesi patladı. Kaç balon kaldı?',
    s.aciklama='12''dan 2 çıkarınca 10 kalır.'
WHERE s.soru_kodu='mat-cik-41'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 12''den 3 adım geri git. Hangi sayıya ulaşırsın?',
    s.aciklama='12''dan 3 çıkarınca 9 kalır.'
WHERE s.soru_kodu='mat-cik-42'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 12 kalem vardı. 4 kalemi aldık. Kutuda kaç kalem kaldı?',
    s.aciklama='12''dan 4 çıkarınca 8 kalır.'
WHERE s.soru_kodu='mat-cik-43'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bahçede 12 kuş vardı. 6 kuş uçtu. Kaç kuş kaldı?',
    s.aciklama='12''dan 6 çıkarınca 6 kalır.'
WHERE s.soru_kodu='mat-cik-44'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Tabakta 12 kurabiye vardı. 8 tanesi yenildi. Kaç kurabiye kaldı?',
    s.aciklama='12''dan 8 çıkarınca 4 kalır.'
WHERE s.soru_kodu='mat-cik-45'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='12 balondan 10 tanesi patladı. Kaç balon kaldı?',
    s.aciklama='12''dan 10 çıkarınca 2 kalır.'
WHERE s.soru_kodu='mat-cik-46'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 13''den 1 adım geri git. Hangi sayıya ulaşırsın?',
    s.aciklama='13''dan 1 çıkarınca 12 kalır.'
WHERE s.soru_kodu='mat-cik-47'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 13 kalem vardı. 2 kalemi aldık. Kutuda kaç kalem kaldı?',
    s.aciklama='13''dan 2 çıkarınca 11 kalır.'
WHERE s.soru_kodu='mat-cik-48'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bahçede 13 kuş vardı. 3 kuş uçtu. Kaç kuş kaldı?',
    s.aciklama='13''dan 3 çıkarınca 10 kalır.'
WHERE s.soru_kodu='mat-cik-49'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Tabakta 13 kurabiye vardı. 5 tanesi yenildi. Kaç kurabiye kaldı?',
    s.aciklama='13''dan 5 çıkarınca 8 kalır.'
WHERE s.soru_kodu='mat-cik-50'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='13 balondan 7 tanesi patladı. Kaç balon kaldı?',
    s.aciklama='13''dan 7 çıkarınca 6 kalır.'
WHERE s.soru_kodu='mat-cik-51'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 13''den 9 adım geri git. Hangi sayıya ulaşırsın?',
    s.aciklama='13''dan 9 çıkarınca 4 kalır.'
WHERE s.soru_kodu='mat-cik-52'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 13 kalem vardı. 11 kalemi aldık. Kutuda kaç kalem kaldı?',
    s.aciklama='13''dan 11 çıkarınca 2 kalır.'
WHERE s.soru_kodu='mat-cik-53'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bahçede 14 kuş vardı. 1 kuş uçtu. Kaç kuş kaldı?',
    s.aciklama='14''dan 1 çıkarınca 13 kalır.'
WHERE s.soru_kodu='mat-cik-54'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Tabakta 14 kurabiye vardı. 2 tanesi yenildi. Kaç kurabiye kaldı?',
    s.aciklama='14''dan 2 çıkarınca 12 kalır.'
WHERE s.soru_kodu='mat-cik-55'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='14 balondan 3 tanesi patladı. Kaç balon kaldı?',
    s.aciklama='14''dan 3 çıkarınca 11 kalır.'
WHERE s.soru_kodu='mat-cik-56'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 14''den 4 adım geri git. Hangi sayıya ulaşırsın?',
    s.aciklama='14''dan 4 çıkarınca 10 kalır.'
WHERE s.soru_kodu='mat-cik-57'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 14 kalem vardı. 6 kalemi aldık. Kutuda kaç kalem kaldı?',
    s.aciklama='14''dan 6 çıkarınca 8 kalır.'
WHERE s.soru_kodu='mat-cik-58'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bahçede 14 kuş vardı. 8 kuş uçtu. Kaç kuş kaldı?',
    s.aciklama='14''dan 8 çıkarınca 6 kalır.'
WHERE s.soru_kodu='mat-cik-59'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Tabakta 14 kurabiye vardı. 10 tanesi yenildi. Kaç kurabiye kaldı?',
    s.aciklama='14''dan 10 çıkarınca 4 kalır.'
WHERE s.soru_kodu='mat-cik-60'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='14 balondan 12 tanesi patladı. Kaç balon kaldı?',
    s.aciklama='14''dan 12 çıkarınca 2 kalır.'
WHERE s.soru_kodu='mat-cik-61'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 15''den 1 adım geri git. Hangi sayıya ulaşırsın?',
    s.aciklama='15''dan 1 çıkarınca 14 kalır.'
WHERE s.soru_kodu='mat-cik-62'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 15 kalem vardı. 2 kalemi aldık. Kutuda kaç kalem kaldı?',
    s.aciklama='15''dan 2 çıkarınca 13 kalır.'
WHERE s.soru_kodu='mat-cik-63'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bahçede 15 kuş vardı. 3 kuş uçtu. Kaç kuş kaldı?',
    s.aciklama='15''dan 3 çıkarınca 12 kalır.'
WHERE s.soru_kodu='mat-cik-64'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Tabakta 15 kurabiye vardı. 5 tanesi yenildi. Kaç kurabiye kaldı?',
    s.aciklama='15''dan 5 çıkarınca 10 kalır.'
WHERE s.soru_kodu='mat-cik-65'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='15 balondan 7 tanesi patladı. Kaç balon kaldı?',
    s.aciklama='15''dan 7 çıkarınca 8 kalır.'
WHERE s.soru_kodu='mat-cik-66'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Sayı yolunda 15''den 9 adım geri git. Hangi sayıya ulaşırsın?',
    s.aciklama='15''dan 9 çıkarınca 6 kalır.'
WHERE s.soru_kodu='mat-cik-67'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda 15 kalem vardı. 11 kalemi aldık. Kutuda kaç kalem kaldı?',
    s.aciklama='15''dan 11 çıkarınca 4 kalır.'
WHERE s.soru_kodu='mat-cik-68'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Bahçede 15 kuş vardı. 13 kuş uçtu. Kaç kuş kaldı?',
    s.aciklama='15''dan 13 çıkarınca 2 kalır.'
WHERE s.soru_kodu='mat-cik-69'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Tabakta 16 kurabiye vardı. 1 tanesi yenildi. Kaç kurabiye kaldı?',
    s.aciklama='16''dan 1 çıkarınca 15 kalır.'
WHERE s.soru_kodu='mat-cik-70'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='1 kırmızı boncuk ile 1 mavi boncuğu birleştiriyoruz. 1 + 1 = __ boşluğuna hangi sayı gelir?',
    s.aciklama='İki grubu birleştirince 2 boncuk olur.'
WHERE s.soru_kodu='mat-esit-2'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='1 kırmızı boncuk ile 2 mavi boncuğu birleştiriyoruz. 1 + 2 = __ boşluğuna hangi sayı gelir?',
    s.aciklama='İki grubu birleştirince 3 boncuk olur.'
WHERE s.soru_kodu='mat-esit-3'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='2 kırmızı boncuk ile 2 mavi boncuğu birleştiriyoruz. 2 + 2 = __ boşluğuna hangi sayı gelir?',
    s.aciklama='İki grubu birleştirince 4 boncuk olur.'
WHERE s.soru_kodu='mat-esit-4'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='2 kırmızı boncuk ile 3 mavi boncuğu birleştiriyoruz. 2 + 3 = __ boşluğuna hangi sayı gelir?',
    s.aciklama='İki grubu birleştirince 5 boncuk olur.'
WHERE s.soru_kodu='mat-esit-5'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='3 kırmızı boncuk ile 3 mavi boncuğu birleştiriyoruz. 3 + 3 = __ boşluğuna hangi sayı gelir?',
    s.aciklama='İki grubu birleştirince 6 boncuk olur.'
WHERE s.soru_kodu='mat-esit-6'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='3 kırmızı boncuk ile 4 mavi boncuğu birleştiriyoruz. 3 + 4 = __ boşluğuna hangi sayı gelir?',
    s.aciklama='İki grubu birleştirince 7 boncuk olur.'
WHERE s.soru_kodu='mat-esit-7'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='4 kırmızı boncuk ile 4 mavi boncuğu birleştiriyoruz. 4 + 4 = __ boşluğuna hangi sayı gelir?',
    s.aciklama='İki grubu birleştirince 8 boncuk olur.'
WHERE s.soru_kodu='mat-esit-8'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='4 kırmızı boncuk ile 5 mavi boncuğu birleştiriyoruz. 4 + 5 = __ boşluğuna hangi sayı gelir?',
    s.aciklama='İki grubu birleştirince 9 boncuk olur.'
WHERE s.soru_kodu='mat-esit-9'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='5 kırmızı boncuk ile 5 mavi boncuğu birleştiriyoruz. 5 + 5 = __ boşluğuna hangi sayı gelir?',
    s.aciklama='İki grubu birleştirince 10 boncuk olur.'
WHERE s.soru_kodu='mat-esit-10'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='5 kırmızı boncuk ile 6 mavi boncuğu birleştiriyoruz. 5 + 6 = __ boşluğuna hangi sayı gelir?',
    s.aciklama='İki grubu birleştirince 11 boncuk olur.'
WHERE s.soru_kodu='mat-esit-11'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='6 kırmızı boncuk ile 6 mavi boncuğu birleştiriyoruz. 6 + 6 = __ boşluğuna hangi sayı gelir?',
    s.aciklama='İki grubu birleştirince 12 boncuk olur.'
WHERE s.soru_kodu='mat-esit-12'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda toplam 5 top olmalı. İçinde 4 top var. Kaç top daha eklemeliyiz? __ + 4 = 5',
    s.aciklama='4''a 1 eklersek 5 olur. Eksik sayı 1''dir.'
WHERE s.soru_kodu='mat-bilinmeyen-5'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda toplam 6 top olmalı. İçinde 2 top var. Kaç top daha eklemeliyiz? __ + 2 = 6',
    s.aciklama='2''a 4 eklersek 6 olur. Eksik sayı 4''dir.'
WHERE s.soru_kodu='mat-bilinmeyen-6'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda toplam 7 top olmalı. İçinde 3 top var. Kaç top daha eklemeliyiz? __ + 3 = 7',
    s.aciklama='3''a 4 eklersek 7 olur. Eksik sayı 4''dir.'
WHERE s.soru_kodu='mat-bilinmeyen-7'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda toplam 8 top olmalı. İçinde 4 top var. Kaç top daha eklemeliyiz? __ + 4 = 8',
    s.aciklama='4''a 4 eklersek 8 olur. Eksik sayı 4''dir.'
WHERE s.soru_kodu='mat-bilinmeyen-8'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda toplam 9 top olmalı. İçinde 2 top var. Kaç top daha eklemeliyiz? __ + 2 = 9',
    s.aciklama='2''a 7 eklersek 9 olur. Eksik sayı 7''dir.'
WHERE s.soru_kodu='mat-bilinmeyen-9'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda toplam 10 top olmalı. İçinde 3 top var. Kaç top daha eklemeliyiz? __ + 3 = 10',
    s.aciklama='3''a 7 eklersek 10 olur. Eksik sayı 7''dir.'
WHERE s.soru_kodu='mat-bilinmeyen-10'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda toplam 11 top olmalı. İçinde 4 top var. Kaç top daha eklemeliyiz? __ + 4 = 11',
    s.aciklama='4''a 7 eklersek 11 olur. Eksik sayı 7''dir.'
WHERE s.soru_kodu='mat-bilinmeyen-11'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda toplam 12 top olmalı. İçinde 2 top var. Kaç top daha eklemeliyiz? __ + 2 = 12',
    s.aciklama='2''a 10 eklersek 12 olur. Eksik sayı 10''dir.'
WHERE s.soru_kodu='mat-bilinmeyen-12'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda toplam 13 top olmalı. İçinde 3 top var. Kaç top daha eklemeliyiz? __ + 3 = 13',
    s.aciklama='3''a 10 eklersek 13 olur. Eksik sayı 10''dir.'
WHERE s.soru_kodu='mat-bilinmeyen-13'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda toplam 14 top olmalı. İçinde 4 top var. Kaç top daha eklemeliyiz? __ + 4 = 14',
    s.aciklama='4''a 10 eklersek 14 olur. Eksik sayı 10''dir.'
WHERE s.soru_kodu='mat-bilinmeyen-14'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kutuda toplam 15 top olmalı. İçinde 2 top var. Kaç top daha eklemeliyiz? __ + 2 = 15',
    s.aciklama='2''a 13 eklersek 15 olur. Eksik sayı 13''dir.'
WHERE s.soru_kodu='mat-bilinmeyen-15'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kitap masanın üstünde. Masa, kitabın hangi tarafındadır?',
    s.aciklama='Kitap masanın üstündeyse masa kitabın altındadır.'
WHERE s.soru_kodu='mat-yon-1'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='“Sağ elini kaldır.” denirse hangi tarafını kullanırsın?',
    s.aciklama='Sağ el, vücudumuzun sağ tarafındadır.'
WHERE s.soru_kodu='mat-yon-2'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Arkadaşın tam önünde duruyor. Ona yaklaşmak için hangi yöne yürürsün?',
    s.aciklama='Önümüzdeki bir şeye yaklaşmak için ileri yürürüz.'
WHERE s.soru_kodu='mat-yon-4'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='“Bir adım geri at.” denirse hangi yöne gidersin?',
    s.aciklama='Geri adım atmak geriye doğru hareket etmektir.'
WHERE s.soru_kodu='mat-yon-5'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Oyuncak sol tarafında. Ona dönmek için hangi yöne dönersin?',
    s.aciklama='Sol taraftaki nesneye ulaşmak için sola döneriz.'
WHERE s.soru_kodu='mat-yon-6'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Lamba başımızın üzerinde. Lamba hangi konumdadır?',
    s.aciklama='Başımızın üzerindeki nesne yukarıdadır.'
WHERE s.soru_kodu='mat-yon-8'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='▭ Bu işaret hangi şekle benzer?',
    s.aciklama='▭ işareti dikdörtgene benzer.'
WHERE s.soru_kodu='mat-sekil-9'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Karenin kaç kenarı ve kaç köşesi vardır?',
    s.aciklama='Karenin 4 kenarı ve 4 köşesi vardır.'
WHERE s.soru_kodu='mat-sekil-11'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kırmızı: 🔴🔴🔴🔴🔴🔴  Yeşil: 🟢🟢🟢. Kırmızı nesneler yeşillerden kaç tane fazladır?',
    s.aciklama='6 kırmızıdan 3 yeşili eşleştirince 3 kırmızı fazla kalır.'
WHERE s.soru_kodu='mat-veri-7'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kedi sayısı için dört çizgi çizildi: ||||. Bu çetele kaç kediyi gösterir?',
    s.aciklama='Dört çizgi, 4 kediyi gösterir.'
WHERE s.soru_kodu='mat-veri-8'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');

UPDATE ders_sorulari s
INNER JOIN ders_konulari k ON k.id=s.konu_id
INNER JOIN dersler d ON d.id=k.ders_id
SET s.soru='Kitap: 📚📚📚📚📚📚📚  Kalem: ✏️✏️✏️✏️. Hangisi daha azdır?',
    s.aciklama='4 kalem, 7 kitaptan daha azdır.'
WHERE s.soru_kodu='mat-veri-9'
  AND k.kademe_kodu='temel_egitim'
  AND k.sinif_seviyesi=1
  AND (d.kod='matematik' OR d.ad='Matematik');
