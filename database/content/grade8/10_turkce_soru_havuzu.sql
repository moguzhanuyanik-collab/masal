SET NAMES utf8mb4;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tr8-ana','Ana Fikir, Konu ve Başlık','Ana Fikir, Konu ve Başlık','Ana Fikir, Konu ve Başlık becerilerini LGS düzeyinde metin ve bağlamlarla uygular.','',10,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tr8-anlama'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-1-1','coktan_secmeli','“Kentte bisiklet yollarının artması, kısa mesafelerde otomobil kullanımını azaltmış; hava kalitesi de iyileşmiştir.” Ana fikir?','["Bisiklet altyapısı çevre ve ulaşım açısından yarar sağlayabilir.","Otomobiller tamamen yasaklanmalıdır.","Bisiklet yalnız spor içindir.","Kentte hava hiç kirlenmez."]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-ana' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-1-2','coktan_secmeli','“Bir işi küçük adımlara bölmek, başlamayı kolaylaştırır ve ilerlemeyi görünür kılar.” En uygun başlık?','["Plansız Çalışmak","Zamanı Durdurmak","Küçük Adımlarla İlerlemek","Başarıdan Kaçmak"]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-ana' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-1-3','coktan_secmeli','Bir metnin konusu ile ana fikri arasındaki fark nedir?','["Konu ne anlatıldığını, ana fikir ne mesaj verildiğini gösterir.","İkisi her zaman aynıdır.","Konu sadece başlıktır.","Ana fikir kişi adıdır."]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-ana' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-1-4','coktan_secmeli','“Kütüphanede sessizlik yalnız bireysel rahatlık için değil, ortak çalışma hakkına saygı için de gereklidir.” Ana fikir?','["Kütüphaneler sadece yetişkinler içindir.","Sessizlik öğrenmeyi engeller.","Ortak alan kuralları başkalarının haklarını da korur.","Kurallar gereksizdir."]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-ana' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-1-5','coktan_secmeli','Bir paragrafta örnekler aynı düşünceyi destekliyorsa ana fikir nasıl bulunur?','["Örneklerin ortak olarak desteklediği düşünce belirlenir.","En uzun örnek seçilir.","İlk sözcük alınır.","Noktalama sayılır."]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-ana' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-1-6','coktan_secmeli','Başlık seçiminde en önemli ölçüt?','["En uzun olması","Yabancı sözcük içermesi","Metnin temel konusu ve mesajıyla uyum","Sadece şaşırtıcı olması"]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-ana' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-1-7','coktan_secmeli','“Teknolojiyi bilinçli kullanmak, ondan vazgeçmek değil; amaç ve süreyi yönetmektir.” Ana fikir?','["Bilinçli teknoloji kullanımı denge gerektirir.","Teknoloji tamamen bırakılmalıdır.","Süre önemli değildir.","Teknoloji yalnız eğlencedir."]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-ana' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-1-8','coktan_secmeli','Bir metnin ana fikri hangi bölümde olabilir?','["Sadece ilk cümlede","Sadece son cümlede","Metnin herhangi bir bölümünde açık ya da örtük olabilir.","Sadece başlıkta"]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-ana' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tr8-cikarim','Çıkarım, Tahmin ve Yorum','Çıkarım, Tahmin ve Yorum','Çıkarım, Tahmin ve Yorum becerilerini LGS düzeyinde metin ve bağlamlarla uygular.','',20,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tr8-anlama'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-2-1','coktan_secmeli','Ayşe, toplantıda hiç konuşmadı ama herkes çıktıktan sonra önerilerini yazılı olarak gönderdi. Ne çıkarılabilir?','["Hiç düşüncesi yoktur.","Düşüncelerini farklı bir iletişim yoluyla ifade etmeyi tercih etmiş olabilir.","Toplantıya katılmamıştır.","Yazmayı bilmiyordur."]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-2-2','coktan_secmeli','Bir yazar aynı olayı iki karakterin gözünden farklı anlatıyorsa ne vurgulanabilir?','["Gerçeğin yok olduğu","Olayın hiç yaşanmadığı","Karakterlerin aynı düşündüğü","Bakış açısının yorumu etkileyebileceği"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-2-3','coktan_secmeli','Metinde “Henüz erken ama sonuçlar umut verici.” deniyorsa yazarın tutumu?','["Kesin reddetme","Temkinli iyimserlik","Tam umutsuzluk","Kayıtsızlık"]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-2-4','coktan_secmeli','Bir öğrenci kaynakların yayın tarihlerini ve kurumlarını karşılaştırıyor. Amacı?','["Metni uzatmak","Kaynağı gizlemek","Sadece yazım kontrolü yapmak","Bilginin güvenilirlik ve güncelliğini değerlendirmek"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-2-5','coktan_secmeli','“Sokaklar ıslaktı, insanlar şemsiyelerini kapatıyordu.” Ne çıkarılabilir?','["Kar yağıyor kesin.","Yağmur yeni durmuş olabilir.","Hava çok sıcak kesin.","Gece yarısıdır kesin."]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-2-6','coktan_secmeli','Bir karakter hatasından sonra özür dileyip zararı telafi etmeye çalışıyor. Hangi özellik öne çıkar?','["Umursamazlık","Kibir","Duyarsızlık","Sorumluluk alma"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-2-7','coktan_secmeli','Metindeki verilere aykırı bir sonuç çıkarılabilir mi?','["Evet, her çıkarım doğrudur.","Hayır, çıkarım metin kanıtlarıyla uyumlu olmalıdır.","Sadece başlığa göre olur.","Kanıt gerekmez."]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-2-8','coktan_secmeli','Bir metnin sonunda çözülmeyen sorun bırakılması ne oluşturabilir?','["Kesin bilgi","Tanım","Sayısal veri","Merak ve devam beklentisi"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-cikarim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tr8-yapi','Metnin Yapısı ve Paragraf Akışı','Metnin Yapısı ve Paragraf Akışı','Metnin Yapısı ve Paragraf Akışı becerilerini LGS düzeyinde metin ve bağlamlarla uygular.','',30,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tr8-anlama'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-3-1','coktan_secmeli','Paragrafın giriş cümlesi genellikle ne yapar?','["Sonucu mutlaka verir.","Kaynakçayı gösterir.","Konuyu açar ve sonraki düşüncelere zemin hazırlar.","Sadece örnek sıralar."]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-yapi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-3-2','coktan_secmeli','Bir cümle paragrafın ana düşüncesiyle ilgisizse neyi bozar?','["Anlam bütünlüğünü","Yazı puntosunu","Kâğıt boyunu","Sözcük kökünü"]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-yapi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-3-3','coktan_secmeli','“Öncelikle... Bunun yanında... Sonuç olarak...” ifadeleri ne sağlar?','["Sözcükleri eş anlamlı yapar.","Cümleyi soru yapar.","Düşünceler arasında geçiş ve düzen","Metni şiire çevirir."]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-yapi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-3-4','coktan_secmeli','Paragrafta neden-sonuç sırasının ters verilmesi her zaman yanlış mıdır?','["Hayır, anlatım amacına göre sonuç önce verilebilir.","Evet, daima yanlıştır.","Sadece şiirde olur.","Neden-sonuç kullanılamaz."]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-yapi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-3-5','coktan_secmeli','Bir paragraf iki farklı ana düşünceye dağılıyorsa ne yapılabilir?','["Noktalama kaldırılır.","Başlık silinir.","İki paragrafa ayrılabilir.","Tüm cümleler birleştirilir."]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-yapi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-3-6','coktan_secmeli','Bağlantı ifadeleri neye yardım eder?','["Cümleler ve fikirler arasındaki ilişkiyi göstermeye","Yazarın yaşını bulmaya","Sadece yazımı uzatmaya","Sayıları toplamaya"]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-yapi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-3-7','coktan_secmeli','Sonuç cümlesi önceki düşüncelerle ilişkili olmalı mıdır?','["Hayır","Sadece yeni konu açmalıdır.","Evet","Paragrafla ilgisiz olabilir."]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-yapi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-3-8','coktan_secmeli','Paragraf akışında zaman sırası kullanılan metin türüne örnek?','["Olay anlatımı","Sadece sözlük maddesi","Sadece formül listesi","Sadece adres"]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-yapi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tr8-baglam','Bağlamda Sözcük Anlamı','Bağlamda Sözcük Anlamı','Bağlamda Sözcük Anlamı becerilerini LGS düzeyinde metin ve bağlamlarla uygular.','',40,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tr8-soz'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-4-1','coktan_secmeli','“Projenin kapsamı giderek genişledi.” kapsam ne demektir?','["Sadece süresi","Sadece rengi","Sadece maliyeti","İçerdiği alan ve sınırlar"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-4-2','coktan_secmeli','“Eleştirisini yapıcı bir dille sundu.” yapıcı ne demektir?','["Kırıcı","Geliştirmeye katkı sağlayan","Belirsiz","İlgisiz"]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-4-3','coktan_secmeli','“Bu iddia yeterli kanıtla desteklenmiyor.” iddia ne demektir?','["Sadece soru","Kesin yasa","Kişi adı","Doğruluğu savunulan görüş"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-4-4','coktan_secmeli','“Sorunu kökten çözmek için kalıcı önlem gerekir.” kalıcı ne demektir?','["Geçici","Uzun süre etkisini sürdüren","Rastgele","Gizli"]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-4-5','coktan_secmeli','“Yazar, olayları yalın bir dille aktarmış.” yalın ne demektir?','["Karmaşık","Süslü zorunlu","Eksik","Sade ve anlaşılır"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-4-6','coktan_secmeli','“Veriler birbirini doğruluyor.” doğrulamak ne demektir?','["Gizlemek","Gerçekliğini desteklemek","Değiştirmek","Silmek"]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-4-7','coktan_secmeli','“Bu karar toplumda yankı uyandırdı.” yankı uyandırmak ne anlatır?','["Sesin fiziksel yansıması zorunlu","Hiç fark edilmemek","Kararı geri almak","Geniş ilgi ve tepki oluşturmak"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-4-8','coktan_secmeli','Bağlam, bilinmeyen sözcüğün anlamını bulmada nasıl kullanılır?','["Sadece harf sayılır.","Çevresindeki cümle ve sözcüklerin verdiği ipuçları incelenir.","Sözcük atlanır.","Rastgele anlam seçilir."]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-baglam' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tr8-deyim','Deyim, Atasözü ve Söz Sanatları','Deyim, Atasözü ve Söz Sanatları','Deyim, Atasözü ve Söz Sanatları becerilerini LGS düzeyinde metin ve bağlamlarla uygular.','',50,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tr8-soz'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-5-1','coktan_secmeli','“İğneyle kuyu kazmak” neyi anlatır?','["Çok zor ve sabır isteyen işle uğraşmayı","Hızlı sonuç almayı","Kuyuda çalışmayı zorunlu","İşi bırakmayı"]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-5-2','coktan_secmeli','“Acele işe şeytan karışır.” neyi öğütler?','["Her işi ertelemeyi","Hiç başlamamayı","İşleri düşünmeden acele yapmamayı","Sadece hızlı çalışmayı"]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-5-3','coktan_secmeli','“Söz gümüşse sükût altındır.” hangi düşünceyi vurgular?','["Bazı durumlarda susmanın daha değerli olabileceğini","Konuşmanın daima yanlış olduğunu","Altının gümüşten pahalı olduğunu sadece","Söz vermemeyi"]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-5-4','coktan_secmeli','“Dağ gibi sorun” ifadesinde hangi sanat vardır?','["Kişileştirme","Konuşturma","Benzetme","Abartma yoktur"]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-5-5','coktan_secmeli','“Rüzgâr pencerede öfkeyle bağırıyordu.” hangi sanat?','["Kişileştirme","Sadece gerçek anlam","Karşılaştırma","Tanım"]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-5-6','coktan_secmeli','“Dünyalar kadar işim var.” hangi anlatım?','["Benzetme zorunlu","Tanım","Abartma","Nesnel veri"]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-5-7','coktan_secmeli','Atasözü ile deyim arasındaki temel farklardan biri?','["Atasözü çoğu zaman yargı/öğüt bildirir; deyim bir durumu kalıplaşmış biçimde anlatır.","İkisi tamamen aynıdır.","Deyim mutlaka cümledir.","Atasözü anlam taşımaz."]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-5-8','coktan_secmeli','Söz sanatları metne ne katabilir?','["Sadece uzunluk","Sadece noktalama","Anlatım gücü ve çağrışım","Yazarın adresi"]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-deyim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tr8-anlam-iliski','Sözcükler Arası Anlam İlişkileri','Sözcükler Arası Anlam İlişkileri','Sözcükler Arası Anlam İlişkileri becerilerini LGS düzeyinde metin ve bağlamlarla uygular.','',60,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tr8-soz'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-6-1','coktan_secmeli','“olasılık” sözcüğüne yakın anlamlı?','["kesinlik","ihtimal","engel","sonuç"]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-anlam-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-6-2','coktan_secmeli','“artmak” sözcüğünün zıt anlamlısı?','["çoğalmak","yükselmek","gelişmek","azalmak"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-anlam-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-6-3','coktan_secmeli','“ince” hangi cümlede farklı anlamda kullanılmıştır?','["İnce ip kolay koptu.","İnce bir davranışla herkesi rahatlattı.","İnce dal eğildi.","İnce kâğıt yırtıldı."]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-anlam-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-6-4','coktan_secmeli','“yüz” sözcüğü sesteş midir?','["Hayır","Sadece sayıdır","Sadece organ adıdır","Evet; sayı, çehre ve yüzmek fiiliyle farklı anlamlarda kullanılabilir."]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-anlam-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-6-5','coktan_secmeli','Genel anlamlı sözcüğe örnek?','["serçe","canlı","çam ağacı","tekir kedi"]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-anlam-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-6-6','coktan_secmeli','Özel anlamlı sözcüğe örnek?','["şehir","ülke","yer","Ankara"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-anlam-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-6-7','coktan_secmeli','“Taşıt” ile “otobüs” arasında nasıl ilişki vardır?','["Eş anlamlıdır.","Taşıt genel, otobüs daha özel anlamlıdır.","Zıt anlamlıdır.","Sesteştir."]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-anlam-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-6-8','coktan_secmeli','“sert” sözcüğü “sert eleştiri” ifadesinde hangi anlamdadır?','["Sadece fiziksel sertlik","Terim anlam","Özel ad","Mecaz anlam"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-anlam-iliski' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tr8-fiilimsi','Fiilimsiler','Fiilimsiler','Fiilimsiler becerilerini LGS düzeyinde metin ve bağlamlarla uygular.','',70,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tr8-dil'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-7-1','coktan_secmeli','“Koşarak eve geldi.” fiilimsi hangisidir?','["eve","geldi","koşarak","o"]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-fiilimsi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-7-2','coktan_secmeli','“Okumak insanı geliştirir.” fiilimsi?','["okumak","insanı","geliştirir","o"]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-fiilimsi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-7-3','coktan_secmeli','“Gülen çocuk bize baktı.” fiilimsi?','["çocuk","bize","gülen","baktı"]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-fiilimsi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-7-4','coktan_secmeli','İsim-fiil eklerinden biri?','["-mak/-mek","-dı/-di","-yor","-acak sadece kip"]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-fiilimsi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-7-5','coktan_secmeli','Sıfat-fiil bir ismi niteleyebilir mi?','["Hayır","Sadece yüklem olur","Evet","İsimle ilişkisi yoktur"]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-fiilimsi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-7-6','coktan_secmeli','Zarf-fiil cümlede eylemin nasıl/ne zaman yapıldığını bildirebilir mi?','["Evet","Hayır","Sadece isimdir","Sadece özne olur"]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-fiilimsi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-7-7','coktan_secmeli','“Ders bitince eve gideceğiz.” fiilimsi?','["ders","eve","bitince","gideceğiz"]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-fiilimsi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-7-8','coktan_secmeli','Fiilimsi çekimli fiil midir?','["Hayır","Evet","Her zaman yüklemdir","Kip eki almak zorundadır"]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-fiilimsi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tr8-cumle-ogeleri','Cümlenin Ögeleri','Cümlenin Ögeleri','Cümlenin Ögeleri becerilerini LGS düzeyinde metin ve bağlamlarla uygular.','',80,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tr8-dil'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-8-1','coktan_secmeli','“Öğrenciler sabah kütüphanede kitap okudu.” özne?','["sabah","kütüphanede","kitap","Öğrenciler"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-cumle-ogeleri' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-8-2','coktan_secmeli','Aynı cümlede yüklem?','["Öğrenciler","okudu","kitap","sabah"]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-cumle-ogeleri' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-8-3','coktan_secmeli','“Ayşe arkadaşına güzel bir hediye verdi.” nesne?','["Ayşe","arkadaşına","verdi","güzel bir hediye"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-cumle-ogeleri' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-8-4','coktan_secmeli','“Toplantı yarın okul salonunda yapılacak.” yer tamlayıcısı?','["yarın","okul salonunda","toplantı","yapılacak"]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-cumle-ogeleri' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-8-5','coktan_secmeli','“Çocuk soruyu dikkatlice çözdü.” zarf tamlayıcısı?','["çocuk","soruyu","çözdü","dikkatlice"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-cumle-ogeleri' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-8-6','coktan_secmeli','Gizli özne cümlede açıkça yazılmayabilir mi?','["Hayır","Evet","Özne her zaman yazılır","Gizli özne yoktur"]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-cumle-ogeleri' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-8-7','coktan_secmeli','“Akşam bize gelecekler.” gizli özne?','["biz","akşam","bize","onlar"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-cumle-ogeleri' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-8-8','coktan_secmeli','Cümlenin temel ögeleri hangileridir?','["Nesne ve zarf","Özne ve yüklem","Yer tamlayıcısı ve nesne","Sadece nesne"]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-cumle-ogeleri' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tr8-cumle-tur','Cümle Türleri ve Anlam İlişkileri','Cümle Türleri ve Anlam İlişkileri','Cümle Türleri ve Anlam İlişkileri becerilerini LGS düzeyinde metin ve bağlamlarla uygular.','',90,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tr8-dil'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-9-1','coktan_secmeli','“Çalışırsan başarırsın.” hangi anlam ilişkisi?','["Koşul-sonuç","Neden-sonuç","Karşılaştırma","Tanım"]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-cumle-tur' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-9-2','coktan_secmeli','“Yağmur yağdığı için maç ertelendi.” ilişki?','["Koşul","Amaç-sonuç","Neden-sonuç","Karşılaştırma"]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-cumle-tur' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-9-3','coktan_secmeli','“Kitap almak için kırtasiyeye gitti.” ilişki?','["Amaç-sonuç","Neden-sonuç","Koşul","Tanım"]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-cumle-tur' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-9-4','coktan_secmeli','“Bu yol ötekinden daha kısa.” ilişki?','["Koşul","Neden","Karşılaştırma","Amaç"]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-cumle-tur' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-9-5','coktan_secmeli','“Keşke bizimle gelseydin.” hangi anlam?','["Hayıflanma/istek","Kesinlik","Emir","Tanım"]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-cumle-tur' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-9-6','coktan_secmeli','“Sanırım bugün yağmur yağacak.” ne bildirir?','["Kesinlik","Emir","Olasılık/tahmin","Neden"]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-cumle-tur' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-9-7','coktan_secmeli','“Bunu mutlaka bitireceğim.” ne bildirir?','["Kararlılık","Pişmanlık","Olasılık","Şaşkınlık"]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-cumle-tur' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-9-8','coktan_secmeli','Olumlu bir cümle biçimce olumsuz sözcük içermeden olumsuz anlam taşıyabilir mi?','["Hayır","Sadece soruda","Evet, anlam ve bağlama göre.","Cümlede anlam yoktur"]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-cumle-tur' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tr8-hikaye','Hikâye Edici Metin','Hikâye Edici Metin','Hikâye Edici Metin becerilerini LGS düzeyinde metin ve bağlamlarla uygular.','',100,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tr8-metin'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-10-1','coktan_secmeli','Hikâyede çatışma neyi ifade eder?','["Sadece kavga etmeyi","Kişiler, amaçlar veya durumlar arasındaki temel karşıtlığı","Başlığı","Yazarın hayatını"]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-hikaye' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-10-2','coktan_secmeli','Anlatıcı ile yazar aynı olmak zorunda mıdır?','["Evet her zaman","Sadece romanda farklıdır","Anlatıcı yoktur","Hayır"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-hikaye' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-10-3','coktan_secmeli','Birinci kişi anlatımında hangi zamir sık görülür?','["o","ben","siz","onlar"]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-hikaye' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-10-4','coktan_secmeli','Mekân anlatım atmosferini etkileyebilir mi?','["Hayır","Sadece zamanı etkiler","Mekân önemli değildir","Evet"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-hikaye' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-10-5','coktan_secmeli','Geriye dönüş tekniği ne yapar?','["Geleceği kesin söyler.","Anlatıyı geçmişteki bir olaya götürür.","Metni bitirir.","Karakteri siler."]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-hikaye' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-10-6','coktan_secmeli','Karakterin iç konuşması neyi gösterebilir?','["Sadece dış görünüşünü","Yazarın adresini","Sayfa sayısını","Düşünce ve duygularını"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-hikaye' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-10-7','coktan_secmeli','Hikâyede düğüm bölümü neyi artırabilir?','["Kaynakçayı","Merak ve çatışmayı","Sadece kişi sayısını","Yazım kuralını"]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-hikaye' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-10-8','coktan_secmeli','Çözüm bölümü her sorunu tamamen çözmek zorunda mıdır?','["Evet her zaman","Sadece masalda","Hikâyede çözüm olmaz","Hayır"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-hikaye' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tr8-bilgi','Bilgilendirici ve Tartışmacı Metin','Bilgilendirici ve Tartışmacı Metin','Bilgilendirici ve Tartışmacı Metin becerilerini LGS düzeyinde metin ve bağlamlarla uygular.','',110,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tr8-metin'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-11-1','coktan_secmeli','Bilgilendirici metinde kanıt kullanmak ne sağlar?','["Sadece metni uzatır.","Başlığı değiştirir.","İddianın güvenilirliğini destekler.","Duyguyu yok eder."]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-bilgi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-11-2','coktan_secmeli','Tartışmacı metinde karşı görüşe yer verilebilir mi?','["Evet","Hayır","Sadece kendi görüşü olur","Karşı görüş yasaktır"]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-bilgi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-11-3','coktan_secmeli','Nesnel ifade hangisidir?','["Bu film harika.","En güzel şehir burası.","Su deniz seviyesinde yaklaşık 100°C''de kaynar.","Bu kitap sıkıcı."]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-bilgi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-11-4','coktan_secmeli','Bir yazıda kaynak gösterilmesi neden önemlidir?','["Bilginin dayanağını ve izlenebilirliğini artırır.","Metni gizler.","Yazarı anonim yapar.","Sadece biçim verir."]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-bilgi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-11-5','coktan_secmeli','Tanımlama ne yapar?','["Olay sıralar.","Sadece duygu bildirir.","Bir kavramın ne olduğunu açıklar.","Soru sorar."]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-bilgi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-11-6','coktan_secmeli','Örneklendirme ne işe yarar?','["Soyut düşünceyi somutlaştırmaya yardım eder.","Ana fikri gizler.","Kaynağı siler.","Cümleyi anlamsızlaştırır."]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-bilgi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-11-7','coktan_secmeli','Sayısal veri hangi metinlerde kanıt olarak kullanılabilir?','["Sadece şiirde","Hiçbir metinde","Bilgilendirici ve tartışmacı metinlerde","Sadece masalda"]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-bilgi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-11-8','coktan_secmeli','Görüş ile olgu ayrımı neden önemlidir?','["Kanıtlanabilir bilgi ile kişisel değerlendirmeyi ayırmaya yardım eder.","Metni uzatır.","Başlığı seçer.","Noktalama belirler."]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-bilgi' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tr8-siir','Şiir ve Edebi Sanatlar','Şiir ve Edebi Sanatlar','Şiir ve Edebi Sanatlar becerilerini LGS düzeyinde metin ve bağlamlarla uygular.','',120,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tr8-metin'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-12-1','coktan_secmeli','Şiirde “gece beni dinledi” ifadesi hangi sanat?','["Tanım","Nesnel anlatım","Sadece benzetme","Kişileştirme"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-siir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-12-2','coktan_secmeli','“Aslan gibi cesur” hangi sanat?','["Kişileştirme","Benzetme","Konuşturma","Abartma"]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-siir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-12-3','coktan_secmeli','Şiirde imge ne sağlar?','["Sadece bilgi listesi","Sadece tarih","Sadece kaynakça","Çağrışım ve özgün anlatım"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-siir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-12-4','coktan_secmeli','Dize nedir?','["Paragraf","Şiirin satırlarından her biri","Başlık","Bölüm sonu"]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-siir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-12-5','coktan_secmeli','Kafiye şiirde ses benzerliği sağlayabilir mi?','["Hayır","Sadece düz yazıda","Şiirde ses yoktur","Evet"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-siir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-12-6','coktan_secmeli','Şiirin teması neyi gösterir?','["Yazarın adresini","İşlenen temel duygu veya düşünceyi","Sadece ölçüyü","Sayfa sayısını"]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-siir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-12-7','coktan_secmeli','Serbest şiirde ölçü zorunlu mudur?','["Evet her zaman","Sadece 8''li hece","Şiir ölçüsüz olamaz","Hayır"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-siir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-12-8','coktan_secmeli','Şiiri yorumlarken sözcüklerin çağrışımı dikkate alınmalı mıdır?','["Hayır","Evet","Sadece sözlük anlamı","Sadece başlık"]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-siir' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tr8-grafik','Grafik, Tablo ve İnfografik Okuma','Grafik, Tablo ve İnfografik Okuma','Grafik, Tablo ve İnfografik Okuma becerilerini LGS düzeyinde metin ve bağlamlarla uygular.','',130,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tr8-gorsel'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-13-1','coktan_secmeli','Bir grafikte eksenlerin farklı ölçek kullanması yorumu etkileyebilir mi?','["Evet","Hayır","Ölçek önemsiz","Sadece renk etkiler"]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-grafik' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-13-2','coktan_secmeli','Sütun grafiğinde en yüksek sütun neyi gösterir?','["En küçük değeri","Ortalamayı zorunlu","En büyük değeri","Kaynağı"]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-grafik' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-13-3','coktan_secmeli','Tabloda 2024=120, 2025=150 ise artış kaçtır?','["30","270","25","120"]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-grafik' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-13-4','coktan_secmeli','Bir grafiğin kaynağı neden önemlidir?','["Rengi seçmek için","Başlığı kısaltmak için","Verinin nereden geldiğini değerlendirmek için","Sütunu büyütmek için"]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-grafik' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-13-5','coktan_secmeli','Yüzde grafiğinde toplam genellikle kaçtır?','["%100","%50","%10","%360"]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-grafik' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-13-6','coktan_secmeli','Aynı veriyi farklı grafiklerle göstermek mümkün müdür?','["Hayır","Tek grafik türü vardır","Evet","Sadece tablo olur"]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-grafik' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-13-7','coktan_secmeli','Grafikte kesik eksen kullanılması algıyı değiştirebilir mi?','["Evet","Hayır","Eksen görünmez","Veri aynı diye algı değişmez"]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-grafik' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-13-8','coktan_secmeli','İnfografikte simgeler ve kısa metin birlikte kullanılabilir mi?','["Hayır","Sadece uzun paragraf","Evet","Sadece sayı"]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-grafik' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tr8-medya','Medya Metni, Reklam ve Güvenilirlik','Medya Metni, Reklam ve Güvenilirlik','Medya Metni, Reklam ve Güvenilirlik becerilerini LGS düzeyinde metin ve bağlamlarla uygular.','',140,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tr8-gorsel'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-14-1','coktan_secmeli','Bir haber başlığının aşırı iddialı olması tek başına haberin doğru olduğunu gösterir mi?','["Evet","Hayır","Başlık büyükse doğrudur","Çok paylaşılmışsa doğrudur"]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-medya' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-14-2','coktan_secmeli','Reklamın amacı ürün veya fikre yönelik tutumu etkilemek olabilir mi?','["Hayır","Sadece bilgi verir","Reklamın amacı yoktur","Evet"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-medya' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-14-3','coktan_secmeli','Kaynağı olmayan istatistik paylaşımı nasıl değerlendirilmelidir?','["Kesin doğru","Temkinli; kaynak doğrulanmalıdır.","Kesin yanlış","Sadece beğeni sayısına göre"]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-medya' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-14-4','coktan_secmeli','Sponsorlu içerik ile bağımsız haber aynı şey midir?','["Evet","Her zaman","Sadece sosyal medyada","Hayır"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-medya' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-14-5','coktan_secmeli','Medya metninde kullanılan görsel seçimi algıyı etkileyebilir mi?','["Hayır","Evet","Sadece yazı etkiler","Görsel önemsiz"]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-medya' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-14-6','coktan_secmeli','Bir bilginin farklı güvenilir kaynaklarda doğrulanması ne sağlar?','["Bilgiyi gereksiz yapar.","Kaynağı siler.","Yazarı değiştirir.","Güvenilirlik değerlendirmesini güçlendirir."]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-medya' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-14-7','coktan_secmeli','Başlık ile içerik uyuşmuyorsa ne yapılmalıdır?','["Sadece başlığa inanılmalıdır.","İçerik ve kaynak ayrıntılı incelenmelidir.","Hemen paylaşılmalıdır.","Kaynak kapatılmalıdır."]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-medya' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-14-8','coktan_secmeli','Manipülatif dil ne yapabilir?','["Her zaman nesneldir.","Sadece yazım hatasıdır.","Anlam taşımaz.","Okuyucunun duygu ve yargısını yönlendirmeye çalışabilir."]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-medya' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tr8-coklu','Çoklu Ortam ve Görsel Yorumlama','Çoklu Ortam ve Görsel Yorumlama','Çoklu Ortam ve Görsel Yorumlama becerilerini LGS düzeyinde metin ve bağlamlarla uygular.','',150,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tr8-gorsel'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-15-1','coktan_secmeli','Bir videoda söz, görüntü ve müzik birlikte mesaj oluşturabilir mi?','["Hayır","Sadece söz önemlidir","Evet","Sadece müzik"]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-coklu' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-15-2','coktan_secmeli','Görseldeki bir ayrıntı metindeki bilgiyi tamamlayabilir mi?','["Evet","Hayır","Görsel ve metin ilgisizdir","Sadece süs olur"]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-coklu' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-15-3','coktan_secmeli','Bir afişte büyük puntolu ifade genellikle neyi amaçlar?','["Kaynağı gizlemeyi","Metni uzatmayı","Dikkati ana mesaja çekmeyi","Sadece boşluk doldurmayı"]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-coklu' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-15-4','coktan_secmeli','Renk seçimi duygu ve vurgu oluşturabilir mi?','["Evet","Hayır","Renk yalnız baskı maliyetidir","Mesajı etkilemez"]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-coklu' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-15-5','coktan_secmeli','Altyazı videonun erişilebilirliğini artırabilir mi?','["Hayır","Sadece görüntüyü küçültür","Evet","Sadece müzik için"]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-coklu' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-15-6','coktan_secmeli','Bir görselin kırpılması bağlamı değiştirebilir mi?','["Evet","Hayır","Görsel her durumda aynı anlamdadır","Kırpma sadece boyut etkiler"]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-coklu' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-15-7','coktan_secmeli','Harita üzerindeki lejant ne işe yarar?','["Yönleri siler.","Haritayı büyütür.","Sembol ve renklerin anlamını açıklar.","Kaynağı değiştirir."]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-coklu' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-15-8','coktan_secmeli','Çoklu ortam içeriğini değerlendirirken tüm bileşenler birlikte incelenmeli midir?','["Evet","Hayır","Sadece başlık","Sadece ses"]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-coklu' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tr8-paragraf','Paragraf Bütünlüğü ve Metin Oluşturma','Paragraf Bütünlüğü ve Metin Oluşturma','Paragraf Bütünlüğü ve Metin Oluşturma becerilerini LGS düzeyinde metin ve bağlamlarla uygular.','',160,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tr8-yazma'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-16-1','coktan_secmeli','Paragrafta konu dışı cümle neyi bozar?','["Yazı tipini","Sayfa boyunu","Sözcük kökünü","Anlam bütünlüğünü"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-paragraf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-16-2','coktan_secmeli','Bir metnin girişinde ayrıntılı sonuç verilmesi her zaman gerekli midir?','["Evet","Hayır","Sadece şiirde","Sonuç girişte zorunludur"]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-paragraf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-16-3','coktan_secmeli','Geçiş ifadeleri paragraflar arası ilişkiyi güçlendirir mi?','["Hayır","Sadece noktalama","Metni böler","Evet"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-paragraf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-16-4','coktan_secmeli','Taslak oluşturmak yazma sürecini kolaylaştırabilir mi?','["Hayır","Evet","Yazmayı yavaşlatır sadece","Taslak gereksizdir"]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-paragraf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-16-5','coktan_secmeli','Paragraftaki her cümle ana düşünceyi doğrudan tekrar etmeli midir?','["Evet aynı cümle olmalı","Cümleler ilgisiz olmalı","Ana düşünce kullanılmaz","Hayır, açıklama ve örneklerle destekleyebilir."]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-paragraf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-16-6','coktan_secmeli','Sonuç paragrafında ana düşünce toparlanabilir mi?','["Hayır","Evet","Sadece yeni konu açılır","Sonuç yazılmaz"]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-paragraf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-16-7','coktan_secmeli','Metin oluştururken hedef okuyucu düşünülmeli midir?','["Hayır","Okuyucu önemsiz","Sadece yazar önemlidir","Evet"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-paragraf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-16-8','coktan_secmeli','Yazı bittikten sonra gereksiz tekrarlar çıkarılabilir mi?','["Hayır","Evet","İlk metin değişmez","Tekrarlar zorunludur"]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-paragraf' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tr8-yazim','Yazım ve Noktalama','Yazım ve Noktalama','Yazım ve Noktalama becerilerini LGS düzeyinde metin ve bağlamlarla uygular.','',170,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tr8-yazma'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-17-1','coktan_secmeli','Bağlaç olan “de” nasıl yazılır?','["Ayrı","Her zaman bitişik","Kesmeyle","Tireyle"]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-17-2','coktan_secmeli','Bağlaç olan “ki” çoğunlukla nasıl yazılır?','["Her zaman bitişik","Kesmeyle","Ayrı","Rakamla"]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-17-3','coktan_secmeli','Soru eki “mi” nasıl yazılır?','["Ayrı","Her zaman bitişik","Kesmeyle","Tireyle"]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-17-4','coktan_secmeli','Özel ada gelen çekim eki çoğu durumda nasıl ayrılır?','["Virgülle","Noktayla","Kesme işaretiyle","Ayrılmaz"]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-17-5','coktan_secmeli','Açıklama veya örnek sıralanacaksa hangi işaret kullanılabilir?','[":","?","!","''"]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-17-6','coktan_secmeli','Ara sözleri ayırmak için virgül kullanılabilir mi?','["Hayır","Sadece nokta","Evet","Ara söz yoktur"]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-17-7','coktan_secmeli','Doğrudan aktarılan sözlerde tırnak işareti kullanılabilir mi?','["Evet","Hayır","Sadece kesme","Sadece iki nokta yeter"]',0,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-17-8','coktan_secmeli','Yazım kılavuzu tereddüt edilen sözcüklerde başvurulacak kaynak mıdır?','["Hayır","Sadece sözlü anlatım","Evet","Yazım kaynak gerektirmez"]',2,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-yazim' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_konulari (ders_id,bolum_id,kademe_kodu,sinif_seviyesi,konu_kodu,ad,aciklama,anlatim,ornek_metni,sira,aktif)
SELECT d.id,b.id,'temel_egitim',8,'tr8-sunum','Sunum, Tartışma ve Görüş Geliştirme','Sunum, Tartışma ve Görüş Geliştirme','Sunum, Tartışma ve Görüş Geliştirme becerilerini LGS düzeyinde metin ve bağlamlarla uygular.','',180,1
FROM dersler d INNER JOIN ders_bolumleri b ON b.ders_id=d.id AND b.kademe_kodu='temel_egitim' AND b.sinif_seviyesi=8 AND b.kod='tr8-yazma'
WHERE d.kod='turkce' OR d.ad='Türkçe'
ON DUPLICATE KEY UPDATE bolum_id=VALUES(bolum_id),ad=VALUES(ad),anlatim=VALUES(anlatim),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-18-1','coktan_secmeli','Sunumda ana mesajın açık olması neden önemlidir?','["Slaytı uzatır.","Dinleyicinin içeriği izlemesini kolaylaştırır.","Kaynağı gizler.","Sadece süreyi artırır."]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,1,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-sunum' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-18-2','coktan_secmeli','Bir görüşü savunurken kanıt kullanmak gerekir mi?','["Hayır","Ses yüksekliği yeter","Tekrar yeter","Evet"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,2,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-sunum' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-18-3','coktan_secmeli','Karşı görüşü çarpıtmadan aktarmak neden önemlidir?','["Tartışmayı uzatmak için","Adil ve sağlıklı tartışma için","Rakibi küçümsemek için","Kaynağı gizlemek için"]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',1,3,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-sunum' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-18-4','coktan_secmeli','Sunumda slaytları metinle aşırı doldurmak uygun mudur?','["Evet her zaman","Sadece küçük puntoyla","Görsel kullanılmamalı","Genellikle hayır"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,4,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-sunum' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-18-5','coktan_secmeli','Dinleyici sorularına yanıt verirken ne yapılmalıdır?','["Soruyu görmezden gelmek","Soruyu anlayıp açık ve saygılı cevap vermek","Kişiye saldırmak","Konuyu değiştirmek"]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,5,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-sunum' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-18-6','coktan_secmeli','Kaynakların sunum sonunda belirtilmesi doğru mudur?','["Hayır","Kaynak gizlenmeli","Sadece görsellerde","Evet"]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',2,6,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-sunum' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-18-7','coktan_secmeli','Beden dili ve ses tonu sunumu etkiler mi?','["Hayır","Evet","Sadece slayt önemlidir","Konuşmacı önemli değildir"]',1,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,7,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-sunum' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

INSERT INTO ders_sorulari (konu_id,soru_kodu,soru_turu,soru,secenekler_json,dogru_cevap_indeksi,aciklama,zorluk,sira,aktif)
SELECT k.id,'g8t-18-8','coktan_secmeli','Tartışmada fikir değiştirmek başarısızlık mıdır?','["Evet her zaman","Fikir değişmez","Kanıt önemsiz","Hayır; güçlü kanıt karşısında görüş güncellenebilir."]',3,'Metin, dil bilgisi veya bağlam ipuçları kullanılarak cevaplanır.',3,8,1
FROM ders_konulari k INNER JOIN dersler d ON d.id=k.ders_id
WHERE k.kademe_kodu='temel_egitim' AND k.sinif_seviyesi=8 AND k.konu_kodu='tr8-sunum' AND (d.kod='turkce' OR d.ad='Türkçe')
ON DUPLICATE KEY UPDATE soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),aciklama=VALUES(aciklama),zorluk=VALUES(zorluk),sira=VALUES(sira),aktif=1;

