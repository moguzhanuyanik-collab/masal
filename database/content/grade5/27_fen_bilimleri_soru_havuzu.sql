SET NAMES utf8mb4;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'fen5-gunes-ay','Güneş, Dünya ve Ay','Güneş, Dünya ve Ay','Güneş, Dünya ve Ay kavramlarını gözlem, deney ve günlük yaşamla ilişkilendirir.','',10,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='fen5-gok'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'fen5-ay-hareket','Ay''ın Hareketleri ve Evreleri','Ay''ın Hareketleri ve Evreleri','Ay''ın Hareketleri ve Evreleri kavramlarını gözlem, deney ve günlük yaşamla ilişkilendirir.','',20,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='fen5-gok'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'fen5-kuvvet-olcme','Kuvvet ve Kuvvetin Ölçülmesi','Kuvvet ve Kuvvetin Ölçülmesi','Kuvvet ve Kuvvetin Ölçülmesi kavramlarını gözlem, deney ve günlük yaşamla ilişkilendirir.','',30,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='fen5-kuvvet'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'fen5-surtunme','Sürtünme Kuvveti','Sürtünme Kuvveti','Sürtünme Kuvveti kavramlarını gözlem, deney ve günlük yaşamla ilişkilendirir.','',40,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='fen5-kuvvet'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'fen5-hucre','Hücre ve Temel Yapıları','Hücre ve Temel Yapıları','Hücre ve Temel Yapıları kavramlarını gözlem, deney ve günlük yaşamla ilişkilendirir.','',50,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='fen5-canli'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'fen5-canli-organizasyon','Hücreden Organizmaya','Hücreden Organizmaya','Hücreden Organizmaya kavramlarını gözlem, deney ve günlük yaşamla ilişkilendirir.','',60,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='fen5-canli'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'fen5-yayilma','Işığın Yayılması','Işığın Yayılması','Işığın Yayılması kavramlarını gözlem, deney ve günlük yaşamla ilişkilendirir.','',70,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='fen5-isik'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'fen5-golge','Gölge ve Işık-Madde Etkileşimi','Gölge ve Işık-Madde Etkileşimi','Gölge ve Işık-Madde Etkileşimi kavramlarını gözlem, deney ve günlük yaşamla ilişkilendirir.','',80,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='fen5-isik'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'fen5-tanecik','Maddenin Tanecikli Yapısı','Maddenin Tanecikli Yapısı','Maddenin Tanecikli Yapısı kavramlarını gözlem, deney ve günlük yaşamla ilişkilendirir.','',90,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='fen5-madde'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'fen5-hal-degisim','Hâl Değişimi ve Isı','Hâl Değişimi ve Isı','Hâl Değişimi ve Isı kavramlarını gözlem, deney ve günlük yaşamla ilişkilendirir.','',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='fen5-madde'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'fen5-devre','Elektrik Devre Elemanları','Elektrik Devre Elemanları','Elektrik Devre Elemanları kavramlarını gözlem, deney ve günlük yaşamla ilişkilendirir.','',110,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='fen5-elektrik'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'fen5-iletken','İletken ve Yalıtkan Maddeler','İletken ve Yalıtkan Maddeler','İletken ve Yalıtkan Maddeler kavramlarını gözlem, deney ve günlük yaşamla ilişkilendirir.','',120,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='fen5-elektrik'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'fen5-cevre','İnsan-Çevre Etkileşimi','İnsan-Çevre Etkileşimi','İnsan-Çevre Etkileşimi kavramlarını gözlem, deney ve günlük yaşamla ilişkilendirir.','',130,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='fen5-surdur'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',5,'fen5-geri-donusum','Atık, Geri Dönüşüm ve Sürdürülebilirlik','Atık, Geri Dönüşüm ve Sürdürülebilirlik','Atık, Geri Dönüşüm ve Sürdürülebilirlik kavramlarını gözlem, deney ve günlük yaşamla ilişkilendirir.','',140,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=5 AND b.kod='fen5-surdur'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-1','coktan_secmeli','Güneş nedir?','["Bir yıldız","Gezegen","Uydu","Kuyruklu yıldız"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-gunes-ay' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-2','coktan_secmeli','Ay, Dünya''nın doğal uydusu mudur?','["Hayır","Bir yıldızdır","Evet","Bir gezegendir"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-gunes-ay' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-3','coktan_secmeli','Ay''ın Dünya etrafındaki hareketine ne denir?','["Dolanma","Donma","Yansıma","Erime"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-ay-hareket' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-4','coktan_secmeli','Ay''ın görünüşünün değişmesine ne denir?','["Mevsimler","İklim","Evreler","Gölge kirliliği"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-ay-hareket' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-5','coktan_secmeli','Kuvvetin birimi nedir?','["Newton","Metre","Litre","Gram"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-kuvvet-olcme' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-6','coktan_secmeli','Kuvveti ölçen araç nedir?','["Termometre","Terazi","Dinamometre","Cetvel"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-kuvvet-olcme' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-7','coktan_secmeli','Sürtünme hareketi nasıl etkileyebilir?','["Yavaşlatabilir","Her zaman hızlandırır","Kütleyi yok eder","Rengi değiştirir"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-surtunme' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-8','coktan_secmeli','Araç frenlerinde sürtünmeden yararlanılır mı?','["Hayır","Sadece ışık","Evet","Sadece ses"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-surtunme' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-9','coktan_secmeli','Canlıların temel yapı birimi nedir?','["Hücre","Doku","Organ","Sistem"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-hucre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-10','coktan_secmeli','Bitki hücresinde hücre duvarı bulunabilir mi?','["Hayır","Sadece hayvan hücresinde","Evet","Hiçbir hücrede"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-hucre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-11','coktan_secmeli','Benzer hücreler ne oluşturabilir?','["Doku","Sistem","Organizma doğrudan","Atom"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-canli-organizasyon' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-12','coktan_secmeli','Organlar birlikte ne oluşturabilir?','["Sadece doku","Mineral","Sistem","Işık"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-canli-organizasyon' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-13','coktan_secmeli','Işık genellikle nasıl yayılır?','["Doğrusal yollar boyunca","Sadece dairesel","Hiç yayılmaz","Sadece suda"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-yayilma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-14','coktan_secmeli','Ayna ışığı yansıtabilir mi?','["Hayır","Sadece emer","Evet","Işıkla ilgisiz"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-yayilma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-15','coktan_secmeli','Tam gölge nasıl oluşur?','["Işığın opak cisim tarafından engellenmesiyle","Sesin artmasıyla","Suyun donmasıyla","Mıknatısla"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-golge' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-16','coktan_secmeli','Saydam madde ışığı geçirebilir mi?','["Hayır","Sadece metaller","Evet","Sadece taşlar"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,16,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-golge' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-17','coktan_secmeli','Maddeler taneciklerden oluşur mu?','["Evet","Hayır","Sadece sıvılar","Sadece gazlar"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,17,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-tanecik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-18','coktan_secmeli','Gaz tanecikleri bulundukları kaba yayılabilir mi?','["Hayır","Sadece katılar","Evet","Gaz taneciksizdir"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,18,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-tanecik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-19','coktan_secmeli','Erime hangi hâl değişimidir?','["Katıdan sıvıya","Sıvıdan katıya","Gazdan sıvıya","Sıvıdan gaza"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,19,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-hal-degisim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-20','coktan_secmeli','Buharlaşma hangi yönde gerçekleşir?','["Gazdan sıvıya","Katıdan sıvıya","Sıvıdan gaza","Gazdan katıya"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,20,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-hal-degisim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-21','coktan_secmeli','Pil devrede ne sağlar?','["Elektrik enerjisi kaynağı","Sadece ışık","Sadece anahtar görevi","Kablo görevi"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,21,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-22','coktan_secmeli','Anahtar ne yapar?','["Enerji üretir","Işık üretir","Devreyi açıp kapatır","Direnci ölçer"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,22,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-23','coktan_secmeli','Bakır iletken midir?','["Evet","Hayır","Sadece yalıtkan","Mıknatıs değildir diye hayır"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,23,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-iletken' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-24','coktan_secmeli','Plastik genellikle yalıtkan mıdır?','["Hayır","İyi iletkendir","Evet","Sadece sıvıdır"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,24,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-iletken' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-25','coktan_secmeli','Biyoçeşitlilik neyi anlatır?','["Canlı çeşitliliğini","Sadece insan sayısını","Sadece bitki boyunu","Sadece hava durumunu"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,25,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-cevre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-26','coktan_secmeli','Habitat kaybı canlıları etkiler mi?','["Hayır","Sadece taşları","Evet","Hiçbir şeyi"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,26,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-cevre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-27','coktan_secmeli','Geri dönüşüm ne sağlar?','["Bazı atıkların tekrar değerlendirilmesini","Atığı artırır","Kaynağı yok eder","Suyu kirletir"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,27,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-geri-donusum' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-1-28','coktan_secmeli','Atık pil ayrı toplanmalı mıdır?','["Hayır","Toprağa atılır","Evet","Suya bırakılır"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,28,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-geri-donusum' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-1','coktan_secmeli','Güneş nedir? Günlük yaşam örneğini düşün.','["Gezegen","Bir yıldız","Uydu","Kuyruklu yıldız"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,101,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-gunes-ay' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-2','coktan_secmeli','Ay, Dünya''nın doğal uydusu mudur? Günlük yaşam örneğini düşün.','["Hayır","Bir yıldızdır","Bir gezegendir","Evet"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,102,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-gunes-ay' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-3','coktan_secmeli','Ay''ın Dünya etrafındaki hareketine ne denir? Günlük yaşam örneğini düşün.','["Donma","Dolanma","Yansıma","Erime"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,103,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-ay-hareket' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-4','coktan_secmeli','Ay''ın görünüşünün değişmesine ne denir? Günlük yaşam örneğini düşün.','["Mevsimler","İklim","Gölge kirliliği","Evreler"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,104,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-ay-hareket' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-5','coktan_secmeli','Kuvvetin birimi nedir? Günlük yaşam örneğini düşün.','["Metre","Newton","Litre","Gram"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,105,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-kuvvet-olcme' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-6','coktan_secmeli','Kuvveti ölçen araç nedir? Günlük yaşam örneğini düşün.','["Termometre","Terazi","Cetvel","Dinamometre"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,106,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-kuvvet-olcme' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-7','coktan_secmeli','Sürtünme hareketi nasıl etkileyebilir? Günlük yaşam örneğini düşün.','["Her zaman hızlandırır","Yavaşlatabilir","Kütleyi yok eder","Rengi değiştirir"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,107,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-surtunme' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-8','coktan_secmeli','Araç frenlerinde sürtünmeden yararlanılır mı? Günlük yaşam örneğini düşün.','["Hayır","Sadece ışık","Sadece ses","Evet"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,108,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-surtunme' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-9','coktan_secmeli','Canlıların temel yapı birimi nedir? Günlük yaşam örneğini düşün.','["Doku","Hücre","Organ","Sistem"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,109,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-hucre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-10','coktan_secmeli','Bitki hücresinde hücre duvarı bulunabilir mi? Günlük yaşam örneğini düşün.','["Hayır","Sadece hayvan hücresinde","Hiçbir hücrede","Evet"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,110,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-hucre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-11','coktan_secmeli','Benzer hücreler ne oluşturabilir? Günlük yaşam örneğini düşün.','["Sistem","Doku","Organizma doğrudan","Atom"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,111,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-canli-organizasyon' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-12','coktan_secmeli','Organlar birlikte ne oluşturabilir? Günlük yaşam örneğini düşün.','["Sadece doku","Mineral","Işık","Sistem"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,112,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-canli-organizasyon' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-13','coktan_secmeli','Işık genellikle nasıl yayılır? Günlük yaşam örneğini düşün.','["Sadece dairesel","Doğrusal yollar boyunca","Hiç yayılmaz","Sadece suda"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,113,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-yayilma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-14','coktan_secmeli','Ayna ışığı yansıtabilir mi? Günlük yaşam örneğini düşün.','["Hayır","Sadece emer","Işıkla ilgisiz","Evet"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,114,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-yayilma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-15','coktan_secmeli','Tam gölge nasıl oluşur? Günlük yaşam örneğini düşün.','["Sesin artmasıyla","Işığın opak cisim tarafından engellenmesiyle","Suyun donmasıyla","Mıknatısla"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,115,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-golge' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-16','coktan_secmeli','Saydam madde ışığı geçirebilir mi? Günlük yaşam örneğini düşün.','["Hayır","Sadece metaller","Sadece taşlar","Evet"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,116,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-golge' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-17','coktan_secmeli','Maddeler taneciklerden oluşur mu? Günlük yaşam örneğini düşün.','["Hayır","Evet","Sadece sıvılar","Sadece gazlar"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,117,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-tanecik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-18','coktan_secmeli','Gaz tanecikleri bulundukları kaba yayılabilir mi? Günlük yaşam örneğini düşün.','["Hayır","Sadece katılar","Gaz taneciksizdir","Evet"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,118,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-tanecik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-19','coktan_secmeli','Erime hangi hâl değişimidir? Günlük yaşam örneğini düşün.','["Sıvıdan katıya","Katıdan sıvıya","Gazdan sıvıya","Sıvıdan gaza"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,119,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-hal-degisim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-20','coktan_secmeli','Buharlaşma hangi yönde gerçekleşir? Günlük yaşam örneğini düşün.','["Gazdan sıvıya","Katıdan sıvıya","Gazdan katıya","Sıvıdan gaza"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,120,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-hal-degisim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-21','coktan_secmeli','Pil devrede ne sağlar? Günlük yaşam örneğini düşün.','["Sadece ışık","Elektrik enerjisi kaynağı","Sadece anahtar görevi","Kablo görevi"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,121,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-22','coktan_secmeli','Anahtar ne yapar? Günlük yaşam örneğini düşün.','["Enerji üretir","Işık üretir","Direnci ölçer","Devreyi açıp kapatır"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,122,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-23','coktan_secmeli','Bakır iletken midir? Günlük yaşam örneğini düşün.','["Hayır","Evet","Sadece yalıtkan","Mıknatıs değildir diye hayır"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,123,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-iletken' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-24','coktan_secmeli','Plastik genellikle yalıtkan mıdır? Günlük yaşam örneğini düşün.','["Hayır","İyi iletkendir","Sadece sıvıdır","Evet"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,124,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-iletken' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-25','coktan_secmeli','Biyoçeşitlilik neyi anlatır? Günlük yaşam örneğini düşün.','["Sadece insan sayısını","Canlı çeşitliliğini","Sadece bitki boyunu","Sadece hava durumunu"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,125,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-cevre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-26','coktan_secmeli','Habitat kaybı canlıları etkiler mi? Günlük yaşam örneğini düşün.','["Hayır","Sadece taşları","Hiçbir şeyi","Evet"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,126,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-cevre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-27','coktan_secmeli','Geri dönüşüm ne sağlar? Günlük yaşam örneğini düşün.','["Atığı artırır","Bazı atıkların tekrar değerlendirilmesini","Kaynağı yok eder","Suyu kirletir"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,127,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-geri-donusum' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-2-28','coktan_secmeli','Atık pil ayrı toplanmalı mıdır? Günlük yaşam örneğini düşün.','["Hayır","Toprağa atılır","Suya bırakılır","Evet"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',1,128,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-geri-donusum' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-1','coktan_secmeli','Güneş nedir? Bir deney veya gözlem bağlamında değerlendir.','["Gezegen","Uydu","Bir yıldız","Kuyruklu yıldız"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,201,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-gunes-ay' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-2','coktan_secmeli','Ay, Dünya''nın doğal uydusu mudur? Bir deney veya gözlem bağlamında değerlendir.','["Evet","Hayır","Bir yıldızdır","Bir gezegendir"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,202,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-gunes-ay' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-3','coktan_secmeli','Ay''ın Dünya etrafındaki hareketine ne denir? Bir deney veya gözlem bağlamında değerlendir.','["Donma","Yansıma","Dolanma","Erime"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,203,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-ay-hareket' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-4','coktan_secmeli','Ay''ın görünüşünün değişmesine ne denir? Bir deney veya gözlem bağlamında değerlendir.','["Evreler","Mevsimler","İklim","Gölge kirliliği"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,204,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-ay-hareket' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-5','coktan_secmeli','Kuvvetin birimi nedir? Bir deney veya gözlem bağlamında değerlendir.','["Metre","Litre","Newton","Gram"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,205,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-kuvvet-olcme' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-6','coktan_secmeli','Kuvveti ölçen araç nedir? Bir deney veya gözlem bağlamında değerlendir.','["Dinamometre","Termometre","Terazi","Cetvel"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,206,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-kuvvet-olcme' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-7','coktan_secmeli','Sürtünme hareketi nasıl etkileyebilir? Bir deney veya gözlem bağlamında değerlendir.','["Her zaman hızlandırır","Kütleyi yok eder","Yavaşlatabilir","Rengi değiştirir"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,207,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-surtunme' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-8','coktan_secmeli','Araç frenlerinde sürtünmeden yararlanılır mı? Bir deney veya gözlem bağlamında değerlendir.','["Evet","Hayır","Sadece ışık","Sadece ses"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,208,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-surtunme' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-9','coktan_secmeli','Canlıların temel yapı birimi nedir? Bir deney veya gözlem bağlamında değerlendir.','["Doku","Organ","Hücre","Sistem"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,209,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-hucre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-10','coktan_secmeli','Bitki hücresinde hücre duvarı bulunabilir mi? Bir deney veya gözlem bağlamında değerlendir.','["Evet","Hayır","Sadece hayvan hücresinde","Hiçbir hücrede"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,210,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-hucre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-11','coktan_secmeli','Benzer hücreler ne oluşturabilir? Bir deney veya gözlem bağlamında değerlendir.','["Sistem","Organizma doğrudan","Doku","Atom"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,211,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-canli-organizasyon' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-12','coktan_secmeli','Organlar birlikte ne oluşturabilir? Bir deney veya gözlem bağlamında değerlendir.','["Sistem","Sadece doku","Mineral","Işık"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,212,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-canli-organizasyon' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-13','coktan_secmeli','Işık genellikle nasıl yayılır? Bir deney veya gözlem bağlamında değerlendir.','["Sadece dairesel","Hiç yayılmaz","Doğrusal yollar boyunca","Sadece suda"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,213,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-yayilma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-14','coktan_secmeli','Ayna ışığı yansıtabilir mi? Bir deney veya gözlem bağlamında değerlendir.','["Evet","Hayır","Sadece emer","Işıkla ilgisiz"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,214,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-yayilma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-15','coktan_secmeli','Tam gölge nasıl oluşur? Bir deney veya gözlem bağlamında değerlendir.','["Sesin artmasıyla","Suyun donmasıyla","Işığın opak cisim tarafından engellenmesiyle","Mıknatısla"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,215,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-golge' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-16','coktan_secmeli','Saydam madde ışığı geçirebilir mi? Bir deney veya gözlem bağlamında değerlendir.','["Evet","Hayır","Sadece metaller","Sadece taşlar"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,216,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-golge' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-17','coktan_secmeli','Maddeler taneciklerden oluşur mu? Bir deney veya gözlem bağlamında değerlendir.','["Hayır","Sadece sıvılar","Evet","Sadece gazlar"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,217,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-tanecik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-18','coktan_secmeli','Gaz tanecikleri bulundukları kaba yayılabilir mi? Bir deney veya gözlem bağlamında değerlendir.','["Evet","Hayır","Sadece katılar","Gaz taneciksizdir"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,218,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-tanecik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-19','coktan_secmeli','Erime hangi hâl değişimidir? Bir deney veya gözlem bağlamında değerlendir.','["Sıvıdan katıya","Gazdan sıvıya","Katıdan sıvıya","Sıvıdan gaza"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,219,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-hal-degisim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-20','coktan_secmeli','Buharlaşma hangi yönde gerçekleşir? Bir deney veya gözlem bağlamında değerlendir.','["Sıvıdan gaza","Gazdan sıvıya","Katıdan sıvıya","Gazdan katıya"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,220,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-hal-degisim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-21','coktan_secmeli','Pil devrede ne sağlar? Bir deney veya gözlem bağlamında değerlendir.','["Sadece ışık","Sadece anahtar görevi","Elektrik enerjisi kaynağı","Kablo görevi"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,221,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-22','coktan_secmeli','Anahtar ne yapar? Bir deney veya gözlem bağlamında değerlendir.','["Devreyi açıp kapatır","Enerji üretir","Işık üretir","Direnci ölçer"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,222,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-23','coktan_secmeli','Bakır iletken midir? Bir deney veya gözlem bağlamında değerlendir.','["Hayır","Sadece yalıtkan","Evet","Mıknatıs değildir diye hayır"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,223,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-iletken' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-24','coktan_secmeli','Plastik genellikle yalıtkan mıdır? Bir deney veya gözlem bağlamında değerlendir.','["Evet","Hayır","İyi iletkendir","Sadece sıvıdır"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,224,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-iletken' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-25','coktan_secmeli','Biyoçeşitlilik neyi anlatır? Bir deney veya gözlem bağlamında değerlendir.','["Sadece insan sayısını","Sadece bitki boyunu","Canlı çeşitliliğini","Sadece hava durumunu"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,225,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-cevre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-26','coktan_secmeli','Habitat kaybı canlıları etkiler mi? Bir deney veya gözlem bağlamında değerlendir.','["Evet","Hayır","Sadece taşları","Hiçbir şeyi"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,226,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-cevre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-27','coktan_secmeli','Geri dönüşüm ne sağlar? Bir deney veya gözlem bağlamında değerlendir.','["Atığı artırır","Kaynağı yok eder","Bazı atıkların tekrar değerlendirilmesini","Suyu kirletir"]',2,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,227,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-geri-donusum' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-3-28','coktan_secmeli','Atık pil ayrı toplanmalı mıdır? Bir deney veya gözlem bağlamında değerlendir.','["Evet","Hayır","Toprağa atılır","Suya bırakılır"]',0,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,228,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-geri-donusum' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-1','coktan_secmeli','Güneş nedir? En uygun bilimsel açıklamayı seç.','["Gezegen","Uydu","Kuyruklu yıldız","Bir yıldız"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,301,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-gunes-ay' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-2','coktan_secmeli','Ay, Dünya''nın doğal uydusu mudur? En uygun bilimsel açıklamayı seç.','["Hayır","Evet","Bir yıldızdır","Bir gezegendir"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,302,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-gunes-ay' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-3','coktan_secmeli','Ay''ın Dünya etrafındaki hareketine ne denir? En uygun bilimsel açıklamayı seç.','["Donma","Yansıma","Erime","Dolanma"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,303,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-ay-hareket' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-4','coktan_secmeli','Ay''ın görünüşünün değişmesine ne denir? En uygun bilimsel açıklamayı seç.','["Mevsimler","Evreler","İklim","Gölge kirliliği"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,304,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-ay-hareket' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-5','coktan_secmeli','Kuvvetin birimi nedir? En uygun bilimsel açıklamayı seç.','["Metre","Litre","Gram","Newton"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,305,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-kuvvet-olcme' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-6','coktan_secmeli','Kuvveti ölçen araç nedir? En uygun bilimsel açıklamayı seç.','["Termometre","Dinamometre","Terazi","Cetvel"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,306,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-kuvvet-olcme' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-7','coktan_secmeli','Sürtünme hareketi nasıl etkileyebilir? En uygun bilimsel açıklamayı seç.','["Her zaman hızlandırır","Kütleyi yok eder","Rengi değiştirir","Yavaşlatabilir"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,307,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-surtunme' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-8','coktan_secmeli','Araç frenlerinde sürtünmeden yararlanılır mı? En uygun bilimsel açıklamayı seç.','["Hayır","Evet","Sadece ışık","Sadece ses"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,308,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-surtunme' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-9','coktan_secmeli','Canlıların temel yapı birimi nedir? En uygun bilimsel açıklamayı seç.','["Doku","Organ","Sistem","Hücre"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,309,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-hucre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-10','coktan_secmeli','Bitki hücresinde hücre duvarı bulunabilir mi? En uygun bilimsel açıklamayı seç.','["Hayır","Evet","Sadece hayvan hücresinde","Hiçbir hücrede"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,310,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-hucre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-11','coktan_secmeli','Benzer hücreler ne oluşturabilir? En uygun bilimsel açıklamayı seç.','["Sistem","Organizma doğrudan","Atom","Doku"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,311,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-canli-organizasyon' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-12','coktan_secmeli','Organlar birlikte ne oluşturabilir? En uygun bilimsel açıklamayı seç.','["Sadece doku","Sistem","Mineral","Işık"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,312,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-canli-organizasyon' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-13','coktan_secmeli','Işık genellikle nasıl yayılır? En uygun bilimsel açıklamayı seç.','["Sadece dairesel","Hiç yayılmaz","Sadece suda","Doğrusal yollar boyunca"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,313,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-yayilma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-14','coktan_secmeli','Ayna ışığı yansıtabilir mi? En uygun bilimsel açıklamayı seç.','["Hayır","Evet","Sadece emer","Işıkla ilgisiz"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,314,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-yayilma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-15','coktan_secmeli','Tam gölge nasıl oluşur? En uygun bilimsel açıklamayı seç.','["Sesin artmasıyla","Suyun donmasıyla","Mıknatısla","Işığın opak cisim tarafından engellenmesiyle"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,315,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-golge' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-16','coktan_secmeli','Saydam madde ışığı geçirebilir mi? En uygun bilimsel açıklamayı seç.','["Hayır","Evet","Sadece metaller","Sadece taşlar"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,316,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-golge' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-17','coktan_secmeli','Maddeler taneciklerden oluşur mu? En uygun bilimsel açıklamayı seç.','["Hayır","Sadece sıvılar","Sadece gazlar","Evet"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,317,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-tanecik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-18','coktan_secmeli','Gaz tanecikleri bulundukları kaba yayılabilir mi? En uygun bilimsel açıklamayı seç.','["Hayır","Evet","Sadece katılar","Gaz taneciksizdir"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,318,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-tanecik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-19','coktan_secmeli','Erime hangi hâl değişimidir? En uygun bilimsel açıklamayı seç.','["Sıvıdan katıya","Gazdan sıvıya","Sıvıdan gaza","Katıdan sıvıya"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,319,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-hal-degisim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-20','coktan_secmeli','Buharlaşma hangi yönde gerçekleşir? En uygun bilimsel açıklamayı seç.','["Gazdan sıvıya","Sıvıdan gaza","Katıdan sıvıya","Gazdan katıya"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,320,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-hal-degisim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-21','coktan_secmeli','Pil devrede ne sağlar? En uygun bilimsel açıklamayı seç.','["Sadece ışık","Sadece anahtar görevi","Kablo görevi","Elektrik enerjisi kaynağı"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,321,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-22','coktan_secmeli','Anahtar ne yapar? En uygun bilimsel açıklamayı seç.','["Enerji üretir","Devreyi açıp kapatır","Işık üretir","Direnci ölçer"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,322,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-devre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-23','coktan_secmeli','Bakır iletken midir? En uygun bilimsel açıklamayı seç.','["Hayır","Sadece yalıtkan","Mıknatıs değildir diye hayır","Evet"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,323,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-iletken' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-24','coktan_secmeli','Plastik genellikle yalıtkan mıdır? En uygun bilimsel açıklamayı seç.','["Hayır","Evet","İyi iletkendir","Sadece sıvıdır"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,324,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-iletken' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-25','coktan_secmeli','Biyoçeşitlilik neyi anlatır? En uygun bilimsel açıklamayı seç.','["Sadece insan sayısını","Sadece bitki boyunu","Sadece hava durumunu","Canlı çeşitliliğini"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,325,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-cevre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-26','coktan_secmeli','Habitat kaybı canlıları etkiler mi? En uygun bilimsel açıklamayı seç.','["Hayır","Evet","Sadece taşları","Hiçbir şeyi"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,326,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-cevre' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-27','coktan_secmeli','Geri dönüşüm ne sağlar? En uygun bilimsel açıklamayı seç.','["Atığı artırır","Kaynağı yok eder","Suyu kirletir","Bazı atıkların tekrar değerlendirilmesini"]',3,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,327,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-geri-donusum' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g5f-4-28','coktan_secmeli','Atık pil ayrı toplanmalı mıdır? En uygun bilimsel açıklamayı seç.','["Hayır","Evet","Toprağa atılır","Suya bırakılır"]',1,'Fen bilimleri kavramı gözlem ve kanıta göre değerlendirilir.',2,328,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=5 AND k.konu_kodu='fen5-geri-donusum' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

