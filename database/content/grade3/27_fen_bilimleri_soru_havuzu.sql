SET NAMES utf8mb4;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'fen3-bilgi','Bilimsel Bilgiye Nasıl Ulaşırız?','Bilimsel Bilgiye Nasıl Ulaşırız?','Soru sorma, gözlem, araştırma, deney ve güvenilir kaynaklardan yararlanma yollarını tanır.','Bir soruya cevap ararken gözlem ve araştırma yapılabilir.',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='fen3-kesif'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'fen3-bilim-insani','Bilim İnsanlarının Özellikleri','Bilim İnsanlarının Özellikleri','Merak, sabır, dürüstlük, sorgulama ve kanıta önem verme gibi özellikleri fark eder.','Bilim insanı sonucu değiştirmez, kanıta göre değerlendirir.',110,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='fen3-kesif'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'fen3-siniflandirma','Canlıları Sınıflandırıyorum','Canlıları Sınıflandırıyorum','Canlıları mikroskobik canlılar, mantarlar, bitkiler ve hayvanlar olarak temel düzeyde sınıflandırır.','Mantarlar bitki değildir; ayrı bir canlı grubudur.',200,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='fen3-canlilar'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'fen3-duyu-yasam','Duyu Organları ve Yaşam Döngüleri','Duyu Organları ve Yaşam Döngüleri','Çevreyi duyu organlarıyla algılamayı ve canlıların yaşam döngülerini yorumlar.','Kelebek yaşam döngüsünde yumurta, tırtıl, koza ve yetişkin evreleri bulunabilir.',210,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='fen3-canlilar'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'fen3-kayac','Kayaç, Maden ve Mineraller','Kayaç, Maden ve Mineraller','Kayaç, mineral ve maden kavramları arasındaki temel ilişkileri fark eder.','Bazı madenler kayaçlardan elde edilir.',300,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='fen3-yer'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'fen3-fosil','Fosiller ve Paleontoloji','Fosiller ve Paleontoloji','Fosillerin geçmiş canlılar hakkında bilgi verdiğini ve paleontologların fosilleri incelediğini bilir.','Fosil geçmişte yaşamış canlıların iz veya kalıntısı olabilir.',310,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='fen3-yer'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'fen3-madde-halleri','Katı, Sıvı ve Gaz','Katı, Sıvı ve Gaz','Maddeleri hâllerine ve gözlenebilir özelliklerine göre sınıflandırır.','Taş katı, su sıvı, hava gazdır.',400,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='fen3-madde'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'fen3-karisim','Karışımları Ayırıyorum','Karışımları Ayırıyorum','Basit karışımları uygun fiziksel yöntemlerle ayırmayı ve atık ayrıştırmayla ilişkilendirir.','Makarna-su süzme ile ayrılabilir.',410,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='fen3-madde'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'fen3-hareket','Hareket Türlerini Gözlüyorum','Hareket Türlerini Gözlüyorum','Hareket eden varlıkların hızlanma, yavaşlama, dönme ve yön değiştirme gibi hareketlerini gözler.','Salıncak ileri-geri hareket eder.',500,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='fen3-hareket'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'fen3-kuvvet','Kuvvetin Etkileri','Kuvvetin Etkileri','İtme ve çekmenin nesnelerin hareketini ve şeklini etkileyebileceğini fark eder.','Topa vurmak topun hareketini değiştirebilir.',510,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='fen3-hareket'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'fen3-elektrikli-arac','Elektrikli Araç Gereçler','Elektrikli Araç Gereçler','Günlük yaşamda elektrikle çalışan araçları ayırt eder ve kullanım amaçlarını fark eder.','Buzdolabı elektrikle çalışan bir araçtır.',600,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='fen3-elektrik'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'fen3-elektrik-guvenlik','Elektrikte Güvenlik ve Tasarruf','Elektrikte Güvenlik ve Tasarruf','Elektrikli araçları güvenli ve tasarruflu kullanma yollarını değerlendirir.','Islak elle prize dokunulmaz.',610,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='fen3-elektrik'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'fen3-toprak','Toprağın Oluşumu ve Yapısı','Toprağın Oluşumu ve Yapısı','Toprağın kayaçların parçalanması ve organik maddelerle oluşabileceğini gözlemler.','Toprak farklı büyüklükte tanecikler içerebilir.',700,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='fen3-toprak'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'fen3-bitki','Bitki Yetiştirme ve Tarım','Bitki Yetiştirme ve Tarım','Bitkinin gelişmesi için su, ışık, uygun sıcaklık ve toprak gibi koşulları ilişkilendirir.','Tohumun gelişimi için uygun koşullar gerekir.',710,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='fen3-toprak'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'fen3-habitat','Yaşam Alanları','Yaşam Alanları','Farklı yaşam alanlarının özelliklerini ve bu alanlardaki canlıları kanıta dayalı ilişkilendirir.','Balık sucul yaşam alanına uyumludur.',800,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='fen3-yasam'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',3,'fen3-biyo','Canlı Çeşitliliği ve Yaşam Alanlarını Koruma','Canlı Çeşitliliği ve Yaşam Alanlarını Koruma','Canlı çeşitliliğini gözler ve yaşam alanlarını korumaya yönelik davranışları sorgular.','Doğal alanı kirletmemek habitatı korumaya yardım eder.',810,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=3 AND b.kod='fen3-yasam'
WHERE d.kod='fen' OR d.ad='Fen Bilimleri'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),ornek_metni=VALUES(ornek_metni),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilgi-1','coktan_secmeli','Bir bitkinin ışıkta mı karanlıkta mı daha iyi büyüdüğünü öğrenmek için ne yapılabilir?','["Sonucu tahmin edip bırakmak","İki durumu kontrollü gözlemlemek","Bitkiyi hiç incelememek","Rastgele cevap seçmek"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilgi' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilgi-2','coktan_secmeli','Bilimsel bir soruya cevap ararken hangisi yararlıdır?','["Söylenti","Uydurma sonuç","Kaynağı belirsiz iddia","Gözlem ve güvenilir kaynak"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilgi' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilgi-3','coktan_secmeli','Bir deneyde sonuç beklenenden farklı çıkarsa ne yapılmalıdır?','["Sonuç değiştirilmelidir.","Sonuç olduğu gibi kaydedilip neden araştırılmalıdır.","Deney saklanmalıdır.","Başka sonuç yazılmalıdır."]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilgi' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilgi-4','coktan_secmeli','Gözlem ne demektir?','["Sonucu uydurmak","Sadece okumak","Hiç bakmamak","Bir olayı veya varlığı dikkatle incelemek"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilgi' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilgi-5','coktan_secmeli','Bir araştırmada ölçüm yapmak ne sağlar?','["Sadece tahmin","Karşılaştırılabilir veri","Renk değişimi","Oyunu bitirme"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilgi' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilgi-6','coktan_secmeli','Aynı deney birkaç kez yapılırsa ne sağlanabilir?','["Sonucu gizlemek","Malzemeyi azaltmak","Soruyu değiştirmek","Sonuçların tutarlılığını kontrol etmek"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilgi' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilgi-7','coktan_secmeli','Bilgi kaynağının güvenilir olması neden önemlidir?','["Rengini güzelleştirir.","Doğru bilgiye ulaşma olasılığını artırır.","Sayfayı büyütür.","Deneyi hızlandırır."]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilgi' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilgi-8','coktan_secmeli','Bir gözlemde tarih ve saat not etmek neden yararlı olabilir?','["Rengi seçmek için","Soruyu unutmak için","Malzemeyi saklamak için","Değişimi zaman içinde izlemek için"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilgi' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilgi-9','coktan_secmeli','Araştırma sorusu nasıl olmalıdır?','["Anlamsız","İncelenebilir ve anlaşılır","Cevabı önceden uydurulmuş","Hiç ölçülemeyen"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilgi' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilgi-10','coktan_secmeli','Bir bitkinin boyunu her gün ölçmek hangi veri türünü sağlar?','["Sadece görüş","Hayal ürünü veri","Rastgele bilgi","Ölçülebilir sayısal veri"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilgi' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilgi-11','coktan_secmeli','Deney yaparken güvenlik yönergesi neden izlenir?','["Sonucu değiştirmek için","Kendimizi ve çevremizi korumak için","Daha çok gürültü için","Malzemeyi kaybetmek için"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilgi' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilgi-12','coktan_secmeli','Bir bilgi iki farklı güvenilir kaynakta aynıysa ne yapılmış olur?','["Bilgi silinmiş olur.","Deney yapılmış sayılır.","Kaynaklar değersizleşir.","Bilgi doğrulanmış olur."]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilgi' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilgi-13','coktan_secmeli','Tahmin ile gözlem sonucu farklı olabilir mi?','["Hayır, asla","Evet","Sadece gece","Sadece bitkilerde"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilgi' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilgi-14','coktan_secmeli','Bilimsel bilgi yeni kanıtlarla değişebilir mi?','["Hayır","Sadece kitaplarda","Sadece çocuklarda","Evet"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilgi' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilgi-15','coktan_secmeli','Bir sorunun cevabını bulmak için en iyi başlangıç hangisidir?','["Cevabı uydurmak","Ne merak edildiğini açıkça belirlemek","Sonucu yazmak","Deneyi bitmiş saymak"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilgi' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilim-insani-1','coktan_secmeli','Bilim insanının önemli özelliklerinden biri hangisidir?','["Meraklı olmak","Sonuç uydurmak","Soru sormamak","Kanıtı önemsememek"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilim-insani' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilim-insani-2','coktan_secmeli','Bilim insanı yaptığı hatayı fark ederse ne yapmalıdır?','["Gizlemelidir.","Başkalarını suçlamalıdır.","Düzeltip yeniden değerlendirmelidir.","Aynı hatayı sürdürmelidir."]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilim-insani' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilim-insani-3','coktan_secmeli','Bir bilim insanı sonuçlarını neden paylaşır?','["Başkalarının inceleyip değerlendirebilmesi için","Sonucu gizlemek için","Sadece yarış kazanmak için","Deneyi unutmak için"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilim-insani' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilim-insani-4','coktan_secmeli','Kanıta önem vermek ne demektir?','["Söylentiye inanmak","Tahmini gerçek kabul etmek","Sonucu gözlem ve veriye dayandırmak","Sonucu değiştirmek"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilim-insani' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilim-insani-5','coktan_secmeli','Sabırlı olmak bilimsel çalışmada neden önemlidir?','["Bazı gözlem ve deneyler zaman alabilir.","Sonuç hemen uydurulur.","Soru sormaya gerek kalmaz.","Malzeme kullanılmaz."]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilim-insani' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilim-insani-6','coktan_secmeli','Bilim insanları tek başına çalışmak zorunda mıdır?','["Evet, her zaman","Sadece çocuklarla","Hayır, ekip çalışması da yapabilirler.","Sadece gece"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilim-insani' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilim-insani-7','coktan_secmeli','Dürüstlük bilimde neden önemlidir?','["Sonuçların güvenilir olması için","Daha hızlı bitirmek için","Rengi seçmek için","Soruları azaltmak için"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilim-insani' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilim-insani-8','coktan_secmeli','Bilim insanı yeni bir bilgi duyduğunda ne yapabilir?','["Hemen doğru kabul eder.","Kaynağı önemsemez.","Sorgulayıp kanıtını inceleyebilir.","Bilgiyi değiştirir."]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilim-insani' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilim-insani-9','coktan_secmeli','Bir problemi çözmek için farklı yollar denemek hangi özelliği gösterir?','["Yaratıcılık","Dikkatsizlik","Kabalık","İsraf"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilim-insani' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilim-insani-10','coktan_secmeli','Aynı soruyu tekrar incelemek hangi özelliği destekler?','["Vazgeçmek","Kopyalamak","Azim ve merak","Sonucu saklamak"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilim-insani' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilim-insani-11','coktan_secmeli','Bilimsel çalışmada not tutmak neden önemlidir?','["Gözlem ve sonuçları kaydetmek için","Soruyu unutmak için","Deneyi bozmak için","Malzemeyi gizlemek için"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilim-insani' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilim-insani-12','coktan_secmeli','Bir arkadaşının farklı sonucunu dinlemek neyi gösterir?','["Dışlama","Kabalık","Açık fikirlilik","Hile"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilim-insani' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilim-insani-13','coktan_secmeli','Bilim insanı “Bilmiyorum” diyebilir mi?','["Evet, araştırmaya devam edebilir.","Hayır, her şeyi bilmelidir.","Sadece öğrenci söyler.","Bilim buna izin vermez."]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilim-insani' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilim-insani-14','coktan_secmeli','Bir sonucu başkalarının da test edebilmesi neden iyidir?','["Deneyi yasaklamak için","Malzemeyi azaltmak için","Sonucun güvenilirliğini değerlendirmek için","Rengi değiştirmek için"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilim-insani' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bilim-insani-15','coktan_secmeli','Bilimsel merak nasıl başlayabilir?','["Bir olay hakkında soru sormakla","Hiç düşünmemekle","Cevabı ezberlemekle","Deneyi bırakmakla"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bilim-insani' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-sinif-1','coktan_secmeli','Hangisi bitkidir?','["Mantar","Kedi","Maya","Çam ağacı"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-siniflandirma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-sinif-2','coktan_secmeli','Hangisi hayvandır?','["Eğrelti otu","Kelebek","Mantar","Bakteri"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-siniflandirma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-sinif-3','coktan_secmeli','Mantarlar hangi grupta değerlendirilir?','["Bitki olarak her zaman","Hayvan olarak","Cansız olarak","Ayrı bir canlı grubu olarak"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-siniflandirma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-sinif-4','coktan_secmeli','Mikroskobik canlıların çoğu neden çıplak gözle görülmez?','["Işık saçmadıkları için","Çok küçük oldukları için","Hareket etmedikleri için","Renkleri olmadığı için"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-siniflandirma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-sinif-5','coktan_secmeli','Maya hangi gruba örnek verilebilir?','["Hayvanlar","Bitkiler","Madenler","Mantarlar"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-siniflandirma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-sinif-6','coktan_secmeli','Gül hangi canlı grubundadır?','["Hayvanlar","Bitkiler","Mantarlar","Mikroskobik canlılar"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-siniflandirma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-sinif-7','coktan_secmeli','Kedi hangi canlı grubundadır?','["Bitkiler","Mantarlar","Mineraller","Hayvanlar"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-siniflandirma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-sinif-8','coktan_secmeli','Canlıları sınıflandırmak ne sağlar?','["Canlıları yok etmeyi","Benzer ve farklı özellikleri düzenli incelemeyi","Renklerini değiştirmeyi","Hepsini aynı yapmayı"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-siniflandirma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-sinif-9','coktan_secmeli','Bir canlı hareket etmiyorsa kesin bitki midir?','["Evet","Sadece mantardır","Kesin cansızdır","Hayır"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-siniflandirma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-sinif-10','coktan_secmeli','Mantarın yeşil yaprakları olmadığı için bitki sayılmaması neyi gösterir?','["Tüm canlılar aynıdır.","Canlı gruplarının farklı özellikleri vardır.","Mantar cansızdır.","Bitkiler yaşamaz."]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-siniflandirma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-sinif-11','coktan_secmeli','Mikroskop ne işe yarar?','["Kütle ölçmeye","Saat okumaya","Elektrik üretmeye","Çok küçük yapıları büyüterek görmeye"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-siniflandirma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-sinif-12','coktan_secmeli','Hangisi canlıları sınıflandırmada kullanılabilir?','["Sadece isimleri","Gözlenebilir özellikleri","Sadece bulunduğu şehir","Sadece rengi"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-siniflandirma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-sinif-13','coktan_secmeli','Bitki ve hayvanların ortak özelliği hangisidir?','["İkisinin de kökü olması","İkisinin de yürüyebilmesi","İkisinin de mantar olması","Canlı olmaları"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-siniflandirma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-sinif-14','coktan_secmeli','Mantar ve bitkinin ortak özelliği?','["İkisinin de çiçek açması","İkisinin de canlı olması","İkisinin de hayvan olması","İkisinin de hareket etmesi"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-siniflandirma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-sinif-15','coktan_secmeli','Canlı grupları arasında karşılaştırma yapmak neyi kolaylaştırır?','["Elektrik ölçmeyi","Saat okumayı","Para hesabını","Sınıflandırmayı"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-siniflandirma' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-duyu-1','coktan_secmeli','Görme organımız hangisidir?','["Kulak","Burun","Göz","Dil"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-duyu-yasam' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-duyu-2','coktan_secmeli','İşitme organımız hangisidir?','["Kulak","Göz","Deri","Burun"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-duyu-yasam' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-duyu-3','coktan_secmeli','Koku alma organımız hangisidir?','["Kulak","Göz","Burun","El"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-duyu-yasam' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-duyu-4','coktan_secmeli','Tat alma organımız hangisidir?','["Dil","Burun","Kulak","Saç"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-duyu-yasam' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-duyu-5','coktan_secmeli','Dokunma duyusu en çok hangi organla ilişkilidir?','["Saç","Tırnak","Deri","Diş"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-duyu-yasam' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-duyu-6','coktan_secmeli','Çevremizdeki bir nesnenin sıcaklığını fark etmede hangi duyu kullanılır?','["Dokunma","Tatma","İşitme","Koklama"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-duyu-yasam' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-duyu-7','coktan_secmeli','Çok yüksek ses kulağımıza zarar verebilir mi?','["Hayır","Sadece gece","Evet","Sadece çocuklarda değil"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-duyu-yasam' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-duyu-8','coktan_secmeli','Güneşe doğrudan uzun süre bakmak güvenli midir?','["Hayır","Evet","Sadece öğlen","Sadece gözlük yoksa evet"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-duyu-yasam' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-duyu-9','coktan_secmeli','Kelebeğin yaşam döngüsünde ilk evre hangisi olabilir?','["Yetişkin kelebek","Koza","Yumurta","Kanat"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-duyu-yasam' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-duyu-10','coktan_secmeli','Kurbağanın yaşam döngüsünde yavru evrelerinden biri?','["İribaş","Tırtıl","Koza","Tohum"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-duyu-yasam' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-duyu-11','coktan_secmeli','Bitkinin yaşam döngüsü nasıl başlayabilir?','["Taşla","Madenle","Tohumla","Elektrikle"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-duyu-yasam' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-duyu-12','coktan_secmeli','Canlıların yaşam döngüleri aynı mıdır?','["Hayır, türlere göre farklı olabilir.","Evet, tamamen aynı","Sadece hayvanlarda vardır","Bitkilerde yoktur"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-duyu-yasam' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-duyu-13','coktan_secmeli','Duyu organlarını korumak neden önemlidir?','["Daha hızlı koşmak için","Kütleyi artırmak için","Çevreyi sağlıklı algılamak için","Suyu azaltmak için"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-duyu-yasam' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-duyu-14','coktan_secmeli','Kirli ellerle göze dokunmak uygun mudur?','["Hayır","Evet","Sadece okulda","Sadece sabah"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-duyu-yasam' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-duyu-15','coktan_secmeli','Bir canlının büyüme ve gelişme sürecine ne denebilir?','["Madenleşme","Elektriklenme","Yaşam döngüsünün bir parçası","Yuvarlama"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-duyu-yasam' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kayac-1','coktan_secmeli','Kayaç nedir?','["Sadece su","Doğada bulunan bir veya daha çok mineralden oluşabilen katı yapı","Canlı hayvan","Elektrikli araç"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kayac-2','coktan_secmeli','Mineral nedir?','["Sadece bitki","Müzik aleti","Trafik işareti","Kayaçları oluşturan doğal maddelerden biri"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kayac-3','coktan_secmeli','Maden ne için çıkarılabilir?','["Sadece oyun için","Ekonomik değeri olan doğal kaynak olarak","Suyu çoğaltmak için","Havayı boyamak için"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kayac-4','coktan_secmeli','Altın hangi gruba örnek olabilir?','["Bitki","Hayvan","Gaz","Maden"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kayac-5','coktan_secmeli','Mermer hangi alanda kullanılabilir?','["Sadece yiyecek","Yapı ve süsleme","Elektrik kablosu her zaman","Hava ölçümü"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kayac-6','coktan_secmeli','Kayaçların hepsi aynı görünür mü?','["Evet","Sadece gri olur","Sadece yumuşaktır","Hayır"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kayac-7','coktan_secmeli','Mineraller kayaçların yapısında bulunabilir mi?','["Hayır","Evet","Sadece suda","Sadece havada"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kayac-8','coktan_secmeli','Madenleri çıkarırken çevreyi korumak neden önemlidir?','["Daha çok atık üretmek için","Sadece hız için","Rengi değiştirmek için","Doğal yaşamı ve kaynakları korumak için"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kayac-9','coktan_secmeli','Kömür bir yer altı kaynağı mıdır?','["Hayır","Evet","Bitkidir","Hayvandır"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kayac-10','coktan_secmeli','Kayaçları inceleyen bilim dalları geçmiş ve yer yapısı hakkında bilgi verebilir mi?','["Hayır","Sadece hava durumu verir","Sadece trafikle ilgilidir","Evet"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kayac-11','coktan_secmeli','Kayaçların parçalanması neye katkı sağlayabilir?','["Elektrik üretimine doğrudan","Toprak oluşumuna","Saat yapımına","Yağmurun durmasına"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kayac-12','coktan_secmeli','Bir mineralin sertlik veya renk özelliği gözlenebilir mi?','["Hayır","Sadece kokusu","Sadece sesi","Evet"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kayac-13','coktan_secmeli','Doğal kaynakları bilinçli kullanmak neyi destekler?','["İsrafı","Sürdürülebilirliği","Kirliliği","Kaybı"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kayac-14','coktan_secmeli','Madenler sınırsız mıdır?','["Evet","Sadece altın sınırsız","Sadece kömür sınırsız","Hayır"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kayac-15','coktan_secmeli','Yer altı kaynaklarının çıkarılması planlanırken ne düşünülmelidir?','["Sadece renk","Çevresel etkiler","Sadece isim","Sadece hava sıcaklığı"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kayac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-fosil-1','coktan_secmeli','Fosil nedir?','["Geçmişte yaşamış canlıların taşlaşmış kalıntı veya izleri","Yeni canlı","Madenî para","Elektrikli araç"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-fosil' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-fosil-2','coktan_secmeli','Fosilleri inceleyen bilim insanına ne denir?','["Astronot","Mimar","Paleontolog","Müzisyen"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-fosil' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-fosil-3','coktan_secmeli','Fosiller bize ne hakkında bilgi verebilir?','["Geçmişte yaşamış canlılar ve çevreler","Yarınki hava kesin","Gelecek fiyatlar","Saat bilgisi"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-fosil' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-fosil-4','coktan_secmeli','Her canlı kalıntısı fosilleşir mi?','["Evet","Sadece bitkiler","Hayır","Sadece kuşlar"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-fosil' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-fosil-5','coktan_secmeli','Ayak izi fosil olabilir mi?','["Evet, uygun koşullarda iz fosili olabilir.","Hayır","Sadece kemik fosildir","Sadece yaprak fosildir"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-fosil' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-fosil-6','coktan_secmeli','Fosil oluşumu genellikle uzun zaman alır mı?','["Hayır, birkaç dakika","Bir saat","Evet","Bir gün"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-fosil' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-fosil-7','coktan_secmeli','Dinozor fosilleri neyi gösterir?','["Geçmişte yaşamış canlıları","Günümüzde yaşayan tüm hayvanları","Elektrik üretimini","Toprak ölçümünü"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-fosil' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-fosil-8','coktan_secmeli','Fosil bulduğumuzda ne yapmalıyız?','["Kırmak","Eve götürüp satmak","Uzmanlara veya yetkili kurumlara bildirmek","Boyamak"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-fosil' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-fosil-9','coktan_secmeli','Paleontolog fosili neden dikkatle inceler?','["Canlı ve geçmiş çevre hakkında bilgi toplamak için","Rengini değiştirmek için","Hız ölçmek için","Suyu artırmak için"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-fosil' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-fosil-10','coktan_secmeli','Bitki yaprağı izi fosil olabilir mi?','["Hayır","Sadece kemik olur","Evet","Bitkiler fosilleşmez"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-fosil' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-fosil-11','coktan_secmeli','Fosiller kayaçların içinde bulunabilir mi?','["Evet","Hayır","Sadece suda","Sadece ağaçta"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-fosil' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-fosil-12','coktan_secmeli','Fosiller geçmiş yaşamı anlamada kanıt sayılır mı?','["Hayır","Sadece söylentidir","Evet","Oyundur"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-fosil' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-fosil-13','coktan_secmeli','Fosil ile günümüzdeki canlıları karşılaştırmak ne sağlayabilir?','["Benzerlik ve farklılıkları görmeyi","Elektrik ölçmeyi","Para saymayı","Hava sıcaklığını artırmayı"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-fosil' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-fosil-14','coktan_secmeli','Fosiller neden korunmalıdır?','["Kırılmaları için","Satılmaları için","Bilimsel ve kültürel değer taşıdıkları için","Renkleri için"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-fosil' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-fosil-15','coktan_secmeli','Paleontoloji hangi konuyla ilgilenir?','["Geçmiş canlıların fosilleriyle","Müzik notalarıyla","Trafik işaretleriyle","Para birimleriyle"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-fosil' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-madde-1','coktan_secmeli','Taş hangi madde hâline örnektir?','["Sıvı","Gaz","Karışım","Katı"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-madde-halleri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-madde-2','coktan_secmeli','Su oda sıcaklığında genellikle hangi hâldedir?','["Katı","Sıvı","Gaz","Mineral"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-madde-halleri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-madde-3','coktan_secmeli','Hava hangi madde hâline örnektir?','["Katı","Sıvı","Kayaç","Gaz"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-madde-halleri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-madde-4','coktan_secmeli','Katıların belirli şekli olabilir mi?','["Hayır","Evet","Sadece suyun","Sadece gazın"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-madde-halleri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-madde-5','coktan_secmeli','Sıvılar bulundukları kabın şeklini alabilir mi?','["Hayır","Sadece katılar","Hiçbir madde","Evet"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-madde-halleri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-madde-6','coktan_secmeli','Gazlar bulundukları ortama yayılabilir mi?','["Hayır","Evet","Sadece katılar","Sadece taşlar"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-madde-halleri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-madde-7','coktan_secmeli','Süt hangi hâldedir?','["Katı","Gaz","Maden","Sıvı"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-madde-halleri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-madde-8','coktan_secmeli','Buz hangi hâldedir?','["Sıvı","Katı","Gaz","Mantar"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-madde-halleri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-madde-9','coktan_secmeli','Su buharı hangi hâldedir?','["Katı","Sıvı","Mineral","Gaz"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-madde-halleri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-madde-10','coktan_secmeli','Maddeleri sınıflandırırken hangi özellik kullanılabilir?','["Sadece adı","Hâli ve gözlenebilir özellikleri","Sadece fiyatı","Sadece nereden alındığı"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-madde-halleri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-madde-11','coktan_secmeli','Kum taneleri tek tek katı mıdır?','["Hayır, sıvıdır","Gazdır","Canlıdır","Evet"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-madde-halleri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-madde-12','coktan_secmeli','Bal sıvı gibi akabilir mi?','["Hayır","Evet","Katıdır","Gazdır"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-madde-halleri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-madde-13','coktan_secmeli','Bir maddenin hâli sıcaklığa bağlı değişebilir mi?','["Hayır","Sadece rengi değişir","Sadece adı değişir","Evet"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-madde-halleri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-madde-14','coktan_secmeli','Buz eridiğinde ne olur?','["Gaz kesin olur","Sıvı suya dönüşür","Taşa dönüşür","Maden olur"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-madde-halleri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-madde-15','coktan_secmeli','Su donduğunda ne olur?','["Gaz olur","Canlı olur","Kayaç olur","Katı hâle geçer"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-madde-halleri' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-karisim-1','coktan_secmeli','Makarna ile su karışımı nasıl ayrılabilir?','["Mıknatıs","Buharlaşma her durumda","Süzme","Eleme"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-karisim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-karisim-2','coktan_secmeli','Kum ile iri taş karışımı nasıl ayrılabilir?','["Eleme","Mıknatıs","Dondurma","Yakma"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-karisim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-karisim-3','coktan_secmeli','Demir ataş ile plastik düğme karışımı nasıl ayrılabilir?','["Süzme","Eleme çok küçükse","Mıknatıs","Kaynatma"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-karisim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-karisim-4','coktan_secmeli','Pirinç ile taş parçaları nasıl ayrılabilir?','["Ayıklama","Elektrik","Dondurma","Yakma"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-karisim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-karisim-5','coktan_secmeli','Karışım nedir?','["Tek bir saf nesne her zaman","Sadece su","İki veya daha fazla maddenin bir araya gelmesi","Sadece gaz"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-karisim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-karisim-6','coktan_secmeli','Karışımı ayırırken maddelerin özelliklerinden yararlanılır mı?','["Evet","Hayır","Sadece renk","Sadece isim"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-karisim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-karisim-7','coktan_secmeli','Geri dönüşüm için atıkları ayırmak karışım ayırmaya benzer mi?','["Hayır","Hiç ilişkisi yok","Evet","Sadece sıvılarda"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-karisim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-karisim-8','coktan_secmeli','Kâğıt, cam ve plastik atıklar neden ayrı toplanır?','["Geri dönüşümü kolaylaştırmak için","Daha çok çöp üretmek için","Renkleri değiştirmek için","Suyu kirletmek için"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-karisim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-karisim-9','coktan_secmeli','Eleme hangi farktan yararlanır?','["Koku","Ses","Tanecik büyüklüğü","Zaman"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-karisim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-karisim-10','coktan_secmeli','Mıknatıs hangi tür maddeyi ayırmada işe yarayabilir?','["Demir içeren maddeleri","Her plastiği","Her sıvıyı","Kâğıdı"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-karisim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-karisim-11','coktan_secmeli','Süzgeç neyi tutabilir?','["Gazı her zaman","Elektriği","Sıvıdan büyük katı parçaları","Işığı"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-karisim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-karisim-12','coktan_secmeli','Atık pilleri diğer çöplerden ayrı toplamak neden önemlidir?','["Çevre ve geri kazanım için","Renkleri farklı diye","Daha ağır diye","Ses çıkardığı için"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-karisim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-karisim-13','coktan_secmeli','Karışım ayırma yöntemi seçerken ne düşünülmelidir?','["Sadece kap rengi","Saat","Maddelerin özellikleri","Hava durumu"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-karisim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-karisim-14','coktan_secmeli','Deneyde güvenlik için ne yapılmalıdır?','["Uygun araç ve yetişkin yönergesi kullanılmalıdır.","Maddeler tadılmalıdır.","Gözlere yaklaştırılmalıdır.","Rastgele karıştırılmalıdır."]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-karisim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-karisim-15','coktan_secmeli','Karışımı ayırdıktan sonra maddeler yeniden kullanılabilir mi?','["Asla","Sadece su","Bazı durumlarda evet","Sadece demir"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-karisim' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-hareket-1','coktan_secmeli','Hızlanan bir bisikletin hareketi nasıl değişir?','["Durur","Bir sürede daha fazla yol alır.","Geri gider zorunlu","Şekli değişir"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-hareket' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-hareket-2','coktan_secmeli','Yavaşlayan araçta ne olur?','["Hızı artar","Kütlesi kaybolur","Rengi değişir","Hızı azalır."]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-hareket' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-hareket-3','coktan_secmeli','Viraj alan araba ne yapar?','["Donar","Yön değiştirir.","Erir","Maddenin hâli değişir"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-hareket' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-hareket-4','coktan_secmeli','Salıncak hangi harekete örnek olabilir?','["Sadece dönme","Erime","Buharlaşma","İleri-geri hareket"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-hareket' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-hareket-5','coktan_secmeli','Dönen topaç hangi harekete örnektir?','["Sadece doğrusal","Dönme","Erime","Donma"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-hareket' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-hareket-6','coktan_secmeli','Hareket eden nesnenin gelecekteki konumu tahmin edilebilir mi?','["Asla","Kesin her zaman","Sadece gece","Gözleme göre yaklaşık tahmin edilebilir."]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-hareket' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-hareket-7','coktan_secmeli','Hızlı giden top daha kısa sürede uzaklaşabilir mi?','["Hayır","Evet","Sadece kırmızıysa","Sadece ağırsa"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-hareket' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-hareket-8','coktan_secmeli','Duran bir nesne harekete başlayabilir mi?','["Hayır","Sadece canlıysa","Sadece sıvıysa","Evet, kuvvet etkisiyle"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-hareket' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-hareket-9','coktan_secmeli','Hareketi tanımlarken neye bakabiliriz?','["Sadece renge","Konum değişimine","Sadece kokuya","Sadece isme"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-hareket' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-hareket-10','coktan_secmeli','Bir koşucu yavaşlayıp durursa hareketinde ne olur?','["Hızı sürekli artar","Rengi değişir","Kütlesi yok olur","Hızı azalır ve sıfıra yaklaşır."]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-hareket' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-hareket-11','coktan_secmeli','Yuvarlanan bilye hangi hareketi yapar?','["Sadece erir","Dönerek ilerleyebilir.","Buharlaşır","Donar"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-hareket' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-hareket-12','coktan_secmeli','Bir nesne aynı hızla düz gidiyorsa yönü değişiyor mudur?','["Evet sürekli","Kesin dönüyor","Bilinemez her zaman","Hayır"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-hareket' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-hareket-13','coktan_secmeli','Bir araç geri geri hareket edebilir mi?','["Hayır","Evet","Sadece bisiklet","Sadece uçak"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-hareket' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-hareket-14','coktan_secmeli','Hareket gözlemi yaparken güvenli mesafe neden önemlidir?','["Daha hızlı olmak için","Rengi görmek için","Sesi artırmak için","Kazaları önlemek için"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-hareket' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-hareket-15','coktan_secmeli','Hareket eden bir top duvara çarpınca yön değiştirebilir mi?','["Hayır","Evet","Sadece yumuşaksa","Sadece mavi ise"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-hareket' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kuvvet-1','coktan_secmeli','Kapıyı itmek hangi kuvvet türüne örnektir?','["İtme","Çekme","Erime","Süzme"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kuvvet' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kuvvet-2','coktan_secmeli','Çekmeceyi açmak hangi kuvvet türüne örnektir?','["İtme","Donma","Çekme","Eleme"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kuvvet' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kuvvet-3','coktan_secmeli','Topa vurmak topun ne özelliğini değiştirebilir?','["Hareketini","Maddesini her zaman","Rengini","Canlılığını"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kuvvet' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kuvvet-4','coktan_secmeli','Hamuru sıkmak neyi değiştirebilir?','["Türünü","Canlı grubunu","Şeklini","Madenini"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kuvvet' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kuvvet-5','coktan_secmeli','Kuvvet duran bir nesneyi hareket ettirebilir mi?','["Evet","Hayır","Sadece gazları","Sadece bitkileri"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kuvvet' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kuvvet-6','coktan_secmeli','Kuvvet hareketli nesneyi durdurabilir mi?','["Hayır","Sadece canlıları","Evet","Sadece sıvıları"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kuvvet' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kuvvet-7','coktan_secmeli','Kuvvet yön değiştirebilir mi?','["Evet","Hayır","Sadece rengi","Sadece kokuyu"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kuvvet' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kuvvet-8','coktan_secmeli','Bir topu daha güçlü itmek hareketini etkileyebilir mi?','["Hayır","Sadece şeklini yok eder","Evet","Top canlı olur"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kuvvet' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kuvvet-9','coktan_secmeli','Esnek bir süngeri sıkınca ne olur?','["Şekli geçici değişebilir.","Maden olur","Canlı olur","Gaz olur"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kuvvet' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kuvvet-10','coktan_secmeli','Duvarı itsek duvar hareket etmeyebilir. Bu kuvvet uygulamadığımız anlamına gelir mi?','["Evet","Sadece çocuklarda","Hayır","Duvar sıvıdır"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kuvvet' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kuvvet-11','coktan_secmeli','Fren yapmak hareketli bisiklete nasıl etki eder?','["Yavaşlatır veya durdurur.","Hızlandırır","Uçurur","Eritir"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kuvvet' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kuvvet-12','coktan_secmeli','Rüzgâr yaprakları hareket ettirebilir mi?','["Hayır","Sadece taşları","Evet","Sadece suyu"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kuvvet' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kuvvet-13','coktan_secmeli','Kuvvetin etkisini gözlemek için ne karşılaştırılır?','["Kuvvet öncesi ve sonrası hareket/şekil","Sadece renk","Sadece isim","Sadece fiyat"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kuvvet' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kuvvet-14','coktan_secmeli','Aşırı kuvvet uygulamak nesneye zarar verebilir mi?','["Hayır","Sadece plastik değil","Evet","Sadece gece"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kuvvet' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-kuvvet-15','coktan_secmeli','Kuvvet uygularken güvenlik neden önemlidir?','["Yaralanmayı ve hasarı önlemek için","Daha hızlı sonuç için","Sesi artırmak için","Rengi değiştirmek için"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-kuvvet' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-arac-1','coktan_secmeli','Hangisi elektrikle çalışır?','["Tahta kaşık","Kâğıt defter","Silgi","Buzdolabı"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrikli-arac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-arac-2','coktan_secmeli','Hangisi elektrikle çalışabilir?','["Taş","Televizyon","Cetvel","Makas"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrikli-arac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-arac-3','coktan_secmeli','Elektrikli süpürgenin amacı nedir?','["Yemek pişirmek","Su taşımak","Kitap okumak","Temizliğe yardımcı olmak"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrikli-arac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-arac-4','coktan_secmeli','Çamaşır makinesi hangi enerjiyle çalışır?','["Sadece insan gücü","Elektrik","Rüzgâr doğrudan","Toprak"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrikli-arac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-arac-5','coktan_secmeli','Telefon şarj cihazı ne için kullanılır?','["Suyu ısıtmak","Yiyecek pişirmek","Taş kesmek","Bataryaya enerji aktarmak"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrikli-arac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-arac-6','coktan_secmeli','Lamba elektrik enerjisini neye dönüştürebilir?','["Toprağa","Işığa","Madene","Canlıya"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrikli-arac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-arac-7','coktan_secmeli','Elektrikli araçların hepsi aynı işi mi yapar?','["Evet","Sadece ışık verir","Sadece ısıtır","Hayır"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrikli-arac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-arac-8','coktan_secmeli','Fırın elektrikle çalışabilir mi?','["Hayır","Evet","Sadece odunla çalışır","Fırın araç değildir"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrikli-arac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-arac-9','coktan_secmeli','Bilgisayar elektrikli bir araç mıdır?','["Hayır","Canlıdır","Madenidir","Evet"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrikli-arac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-arac-10','coktan_secmeli','Elektrik kesilince bazı araçların çalışmaması neyi gösterir?','["Canlı olduklarını","Elektriğe ihtiyaç duyduklarını","Gaz olduklarını","Maden olduklarını"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrikli-arac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-arac-11','coktan_secmeli','Pil kullanan el feneri elektrik enerjisi kullanır mı?','["Hayır","Sadece ışık enerjisi vardır","Elektrikle ilgisi yoktur","Evet"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrikli-arac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-arac-12','coktan_secmeli','Elektrikli oyuncaklar güvenli kullanılmalı mıdır?','["Hayır","Evet","Sadece yetişkinler","Kuralsız kullanılabilir"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrikli-arac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-arac-13','coktan_secmeli','Saç kurutma makinesi hangi amaçla kullanılır?','["Yemek pişirmeye","Suyu dondurmaya","Taşı kesmeye","Saçı kurutmaya"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrikli-arac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-arac-14','coktan_secmeli','Elektrikli araç seçerken enerji verimliliği önemli olabilir mi?','["Hayır","Evet","Sadece rengi önemli","Sadece fiyatı"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrikli-arac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-arac-15','coktan_secmeli','Elektrikli araçlar yaşamı kolaylaştırabilir mi?','["Hayır","Her zaman zorlaştırır","Sadece okulda","Evet"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrikli-arac' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-elektrik-1','coktan_secmeli','Prize ıslak elle dokunmak güvenli midir?','["Evet","Sadece gündüz","Hayır","Sadece çocuklar için"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrik-guvenlik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-elektrik-2','coktan_secmeli','Prizlere yabancı cisim sokmak doğru mudur?','["Hayır","Evet","Sadece metal değilse","Sadece okulda"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrik-guvenlik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-elektrik-3','coktan_secmeli','Hasarlı elektrik kablosu görülürse ne yapılmalı?','["Dokunup onarılmalı","Su dökülmeli","Yetişkine haber verilmeli ve kullanılmamalı","Kullanılmaya devam edilmeli"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrik-guvenlik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-elektrik-4','coktan_secmeli','Kullanılmayan odanın ışığını kapatmak ne sağlar?','["Enerji tasarrufu","Daha çok tüketim","Elektrik üretimi","Odayı büyütme"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrik-guvenlik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-elektrik-5','coktan_secmeli','Televizyon izlenmiyorsa ne yapılabilir?','["Açık bırakılmalı","Ses artırılmalı","Kapatılabilir.","Prizle oynanmalı"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrik-guvenlik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-elektrik-6','coktan_secmeli','Elektrikli araçları sudan uzak tutmak neden önemlidir?','["Elektrik çarpması riskini azaltmak için","Rengini korumak için","Sesi azaltmak için","Daha ağır yapmak için"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrik-guvenlik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-elektrik-7','coktan_secmeli','Ampul seçerken enerji verimli ürünler ne sağlayabilir?','["Daha çok israf","Daha çok atık her zaman","Daha az elektrik tüketimi","Elektriği yok eder"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrik-guvenlik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-elektrik-8','coktan_secmeli','Fişi kablosundan çekmek doğru mudur?','["Hayır","Evet","Sadece hızlıca","Sadece çocuklar için"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrik-guvenlik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-elektrik-9','coktan_secmeli','Elektrik arızasında kimden yardım istenmelidir?','["Arkadaştan rastgele","Kendimiz açmalıyız","Yetkin bir yetişkin/uzman","Oyuncaktan"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrik-guvenlik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-elektrik-10','coktan_secmeli','Tasarruf neden önemlidir?','["Kaynakları ve bütçeyi korumaya yardım eder.","Daha çok tüketim için","Kirliliği artırmak için","Sadece faturayı büyütmek için"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrik-guvenlik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-elektrik-11','coktan_secmeli','Gündüz yeterli güneş varsa ışıkları kapatmak uygun mudur?','["Hayır","Sadece gece","Evet","Güneş elektrik değildir diye olmaz"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrik-guvenlik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-elektrik-12','coktan_secmeli','Şarjı dolmuş cihazı gereksiz bağlı bırakmamak neyi destekler?','["Bilinçli enerji kullanımını","İsrafı","Daha çok tüketimi","Kabloyu bozmayı"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrik-guvenlik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-elektrik-13','coktan_secmeli','Elektrik güvenliği kuralları kimler için önemlidir?','["Sadece çocuklar","Sadece yetişkinler","Herkes için","Sadece elektrikçiler"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrik-guvenlik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-elektrik-14','coktan_secmeli','Elektrikli cihaz kullanmadan önce neye bakılabilir?','["Kullanım ve güvenlik yönergelerine","Sadece rengine","Sadece markasına","Sadece sesine"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrik-guvenlik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-elektrik-15','coktan_secmeli','Yangın riski olan elektrik arızasında ne yapılmalıdır?','["Su dökmek","Kabloya dokunmak","Güvenli uzaklaşıp yetişkine/acil birime haber vermek","Saklamak"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-elektrik-guvenlik' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-toprak-1','coktan_secmeli','Toprak oluşumunda kayaçların parçalanması etkili olabilir mi?','["Hayır","Evet","Sadece elektrik","Sadece rüzgâr yoksa"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-toprak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-toprak-2','coktan_secmeli','Toprakta organik madde bulunabilir mi?','["Hayır","Toprak sadece taştır","Sadece su vardır","Evet"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-toprak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-toprak-3','coktan_secmeli','Toprakların rengi ve yapısı farklı olabilir mi?','["Hayır","Evet","Hepsi aynıdır","Sadece siyah olur"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-toprak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-toprak-4','coktan_secmeli','Toprağı gözlerken hangi özellik incelenebilir?','["Sadece sesi","Sadece adı","Sadece fiyatı","Renk ve tanecik yapısı"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-toprak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-toprak-5','coktan_secmeli','Kumlu toprakta tanecikler nasıl olabilir?','["Her zaman yapışkan","Daha iri hissedilebilir.","Tamamen sıvı","Gaz"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-toprak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-toprak-6','coktan_secmeli','Kilce zengin toprak ıslakken nasıl olabilir?','["Gaz","Madenî","Uçucu","Daha yapışkan"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-toprak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-toprak-7','coktan_secmeli','Toprak canlılar için önemli midir?','["Hayır","Evet","Sadece taşlar için","Sadece araçlar için"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-toprak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-toprak-8','coktan_secmeli','Toprak erozyonla taşınabilir mi?','["Hayır","Sadece donabilir","Toprak hareket etmez","Evet"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-toprak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-toprak-9','coktan_secmeli','Bitki örtüsü toprağı korumaya yardım eder mi?','["Hayır","Evet","Toprağı yok eder","Sadece rengi değiştirir"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-toprak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-toprak-10','coktan_secmeli','Toprağa çöp atmak doğru mudur?','["Evet","Sadece plastik","Sadece küçük çöp","Hayır"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-toprak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-toprak-11','coktan_secmeli','Toprakta su tutulabilir mi?','["Hayır","Evet","Sadece gaz tutulur","Toprak suyu iter her zaman"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-toprak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-toprak-12','coktan_secmeli','Toprağın üst katmanında canlı kalıntıları bulunabilir mi?','["Hayır","Sadece metal","Sadece cam","Evet"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-toprak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-toprak-13','coktan_secmeli','Toprak oluşumu kısa sürede mi gerçekleşir?','["Birkaç saniyede","Genellikle uzun süreçte","Bir dakikada","Her zaman bir günde"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-toprak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-toprak-14','coktan_secmeli','Toprağı korumak tarım için önemli midir?','["Hayır","Sadece şehir için","Tarım topraksız her zaman","Evet"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-toprak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-toprak-15','coktan_secmeli','Toprak gözlemi yaparken numuneye zarar vermeden incelemek mümkün müdür?','["Hayır","Evet","Mutlaka yakılmalı","Mutlaka atılmalı"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-toprak' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bitki-1','coktan_secmeli','Bitkinin büyümesi için temel ihtiyaçlardan biri?','["Su","Plastik","Cam","Metal"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bitki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bitki-2','coktan_secmeli','Bitkiler ışığa ihtiyaç duyabilir mi?','["Hayır","Sadece gece","Evet","Sadece kök"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bitki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bitki-3','coktan_secmeli','Uygun sıcaklık bitki gelişimini etkileyebilir mi?','["Evet","Hayır","Sadece saksı rengi","Sadece etiket"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bitki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bitki-4','coktan_secmeli','Tohumun çimlenmesi için uygun koşullar gerekir mi?','["Hayır","Sadece ses","Evet","Sadece ışık her durumda"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bitki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bitki-5','coktan_secmeli','Bitkinin kökü ne işe yarar?','["Su ve mineral alımına yardım eder, bitkiyi tutar.","Uçar","Ses çıkarır","Işık üretir"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bitki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bitki-6','coktan_secmeli','Yapraklar bitki için önemli midir?','["Hayır","Sadece süs","Evet","Canlı değildir"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bitki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bitki-7','coktan_secmeli','Bitkiyi aşırı sulamak her zaman iyi midir?','["Hayır","Evet","Ne kadar çok o kadar iyi","Sadece kışın"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bitki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bitki-8','coktan_secmeli','Tarımda toprağın uygunluğu önemli midir?','["Hayır","Sadece hava","Evet","Sadece araç"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bitki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bitki-9','coktan_secmeli','Bir bitkinin gelişimini ölçmek için ne yapılabilir?','["Boyu düzenli ölçülebilir.","Rengi uydurulur","Hiç gözlenmez","Sadece adı yazılır"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bitki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bitki-10','coktan_secmeli','Aynı tür iki bitkiden birine su verip diğerine vermemek neyi araştırabilir?','["Toprak rengini","Saksı fiyatını","Suyun gelişime etkisini","Havanın sesini"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bitki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bitki-11','coktan_secmeli','Bitkiler yaşam döngüsünde tohum oluşturabilir mi?','["Evet","Hayır","Sadece hayvanlar","Sadece mantarlar"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bitki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bitki-12','coktan_secmeli','Tarım ürünlerini yetiştirirken su tasarrufu önemli midir?','["Hayır","Sadece şehirde","Evet","Sadece yağmurda"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bitki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bitki-13','coktan_secmeli','Toprağın verimini korumak neden önemlidir?','["Sürdürülebilir tarım için","Daha çok atık için","Sadece renk için","Elektrik üretmek için"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bitki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bitki-14','coktan_secmeli','Fidan dikildikten sonra bakım gerekir mi?','["Hayır","Sadece bir kez bakılır","Evet","Sulama zararlıdır her zaman"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bitki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-bitki-15','coktan_secmeli','Bitkinin gelişimi için tek bir etken yeterli midir?','["Hayır, birden fazla koşul önemlidir.","Evet sadece su","Evet sadece ışık","Evet sadece saksı"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-bitki' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-habitat-1','coktan_secmeli','Balığın doğal yaşam alanına örnek?','["Çöl kumu her zaman","Ağaç dalı","Kaya içi","Su"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-habitat' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-habitat-2','coktan_secmeli','Devenin yaşama uyumlu olduğu alan?','["Derin deniz","Kurak/çöl ortamı","Kutup buzulu","Göl dibi"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-habitat' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-habitat-3','coktan_secmeli','Kutup ayısı hangi yaşam alanına uyumludur?','["Sıcak çöl","Tropik deniz dibi","Şehir içi her zaman","Soğuk kutup bölgeleri"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-habitat' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-habitat-4','coktan_secmeli','Kurbağa su ve kara ortamlarını kullanabilir mi?','["Hayır","Evet","Sadece çöl","Sadece ağaç"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-habitat' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-habitat-5','coktan_secmeli','Orman yaşam alanında hangi canlı bulunabilir?','["Balina","Mercan","Ahtapot","Sincap"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-habitat' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-habitat-6','coktan_secmeli','Deniz yaşam alanında hangisi bulunabilir?','["Çam ağacı","Ahtapot","Deve","Tavuk"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-habitat' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-habitat-7','coktan_secmeli','Yaşam alanı nedir?','["Sadece oyun alanı","Sadece yuva adı","Sadece şehir","Canlının yaşadığı ve ihtiyaçlarını karşıladığı ortam"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-habitat' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-habitat-8','coktan_secmeli','Canlının besin bulması yaşam alanıyla ilişkili midir?','["Hayır","Evet","Sadece rengiyle","Sadece adıyla"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-habitat' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-habitat-9','coktan_secmeli','Yaşam alanı değişirse canlı etkilenebilir mi?','["Hayır","Canlılar etkilenmez","Sadece taşlar","Evet"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-habitat' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-habitat-10','coktan_secmeli','Bir gölette su kirliliği artarsa canlılar etkilenebilir mi?','["Hayır","Evet","Sadece insanlar","Hiç kimse"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-habitat' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-habitat-11','coktan_secmeli','Yaşam alanı özelliklerini belirlemek için ne yapılabilir?','["Tahmin edip bırakma","Canlıları rahatsız etme","Çevreyi değiştirme","Gözlem ve kanıt toplama"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-habitat' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-habitat-12','coktan_secmeli','Kuş yuvasını gözlerken nasıl davranılmalıdır?','["Yuvayı bozarak","Uzaktan ve rahatsız etmeden","Yumurtayı alarak","Yüksek sesle"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-habitat' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-habitat-13','coktan_secmeli','Bir canlının yaşadığı yer onun habitatı olarak adlandırılabilir mi?','["Hayır","Sadece insanlar için","Sadece bitkiler için","Evet"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-habitat' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-habitat-14','coktan_secmeli','Su sıcaklığındaki büyük değişim su canlılarını etkileyebilir mi?','["Hayır","Evet","Sadece taşları","Sadece tekneleri"]',1,'Bilimsel bilgi ve gözlem kullanılır.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-habitat' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-habitat-15','coktan_secmeli','Yaşam alanında besin, su ve barınak önemli olabilir mi?','["Hayır","Sadece renk","Sadece ses","Evet"]',3,'Bilimsel bilgi ve gözlem kullanılır.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-habitat' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-biyo-1','coktan_secmeli','Canlı çeşitliliği neyi anlatır?','["Sadece tek canlıyı","Sadece bitkileri","Bir alanda farklı canlı türlerinin bulunmasını","Sadece hayvanları"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-biyo' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-biyo-2','coktan_secmeli','Bir ormanda farklı kuş, böcek ve bitkilerin bulunması neyi gösterir?','["Canlı çeşitliliğini","Elektrik tasarrufunu","Kütleyi","Zamanı"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-biyo' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-biyo-3','coktan_secmeli','Yaşam alanlarını korumak neden önemlidir?','["Sadece turizm için","Atık artırmak için","Canlıların yaşamlarını sürdürebilmesi için","Canlıları uzaklaştırmak için"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-biyo' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-biyo-4','coktan_secmeli','Ormana çöp bırakmak doğru mudur?','["Hayır","Evet","Sadece kâğıt","Sadece küçük çöp"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-biyo' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-biyo-5','coktan_secmeli','Sulak alanların kurutulması canlıları etkileyebilir mi?','["Hayır","Sadece insanları","Evet","Hiçbir şeyi"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-biyo' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-biyo-6','coktan_secmeli','Doğal alanlarda yüksek ses yapmak bazı canlıları rahatsız edebilir mi?','["Evet","Hayır","Sadece bitkileri","Ses etkisizdir"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-biyo' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-biyo-7','coktan_secmeli','Yerli bitkileri korumak canlı çeşitliliğine katkı sağlayabilir mi?','["Hayır","Sadece şehirde","Evet","Bitkiler canlı değildir"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-biyo' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-biyo-8','coktan_secmeli','Atıkları doğaya bırakmamak neyi destekler?','["Yaşam alanlarının korunmasını","Kirliliği","İsrafı","Canlıların azalmasını"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-biyo' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-biyo-9','coktan_secmeli','Canlı sayısındaki azalma neden araştırılmalıdır?','["Rengi belirlemek için","Saat ölçmek için","Yaşam alanındaki değişimleri anlamak için","Para hesabı için"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,9,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-biyo' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-biyo-10','coktan_secmeli','Bir parkta farklı türlerin sayısını kaydetmek ne sağlar?','["Çeşitlilik hakkında veri","Elektrik üretir","Suyu artırır","Toprağı yok eder"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,10,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-biyo' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-biyo-11','coktan_secmeli','Nesli azalan canlıları korumak neden önemlidir?','["Sadece fotoğraf çekmek için","Sadece oyun için","Canlı çeşitliliğini sürdürmek için","Elektrik için"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,11,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-biyo' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-biyo-12','coktan_secmeli','Ağaç kesiminin artması orman canlılarını etkileyebilir mi?','["Evet","Hayır","Sadece ağaçlar etkilenir","Hiçbir etkisi yok"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,12,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-biyo' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-biyo-13','coktan_secmeli','Bir yaşam alanını korumak için en uygun davranış?','["Çöp bırakmak","Yuvaları bozmak","Kirliliği azaltmak ve doğal yapıyı korumak","Canlıları toplamak"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,13,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-biyo' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-biyo-14','coktan_secmeli','Canlı çeşitliliği gözlenirken canlılara zarar verilmeli mi?','["Hayır","Evet","Sadece küçük canlılara","Sadece bitkilere"]',0,'Bilimsel bilgi ve gözlem kullanılır.',1,14,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-biyo' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'fen3-biyo-15','coktan_secmeli','Koruma planında bilimsel gözlem ve veri yararlı mıdır?','["Hayır","Sadece tahmin yeter","Evet","Veri gereksizdir"]',2,'Bilimsel bilgi ve gözlem kullanılır.',1,15,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=3 AND k.konu_kodu='fen3-biyo' AND (d.kod='fen' OR d.ad='Fen Bilimleri')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;
