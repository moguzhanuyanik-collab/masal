SET NAMES utf8mb4;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Harfleri Tanıyorum','Harfler ve Sesler','🔤','Kelimeler harflerden oluşur. Her harfin bir adı ve söylerken çıkardığımız bir sesi vardır. Bir kelimenin başındaki harfi fark etmek okumayı kolaylaştırır.','Elma kelimesi E harfiyle başlar. E-l-m-a diye yavaşça söyleyince ilk sesi daha kolay duyarız.','“Elma” kelimesi hangi harfle başlar?','["E","A","M","L"]',0,'Elma kelimesinin ilk harfi E''dir. Kelimeyi yavaş söyle: E-l-m-a.',101,1
FROM dersler d WHERE (d.kod IN ('turkce') OR d.ad='Türkçe') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'İlk Sesi Buluyorum','Sesleri Dinliyorum','👂','Bir kelimeyi söylerken önce hangi sesi duyduğumuzu bulabiliriz. İlk sesi bulmak, yeni kelimeleri okumaya hazırlanırken çok işimize yarar.','Arı kelimesini yavaşça söyle: A-rı. Duyduğumuz ilk ses A sesidir.','“Arı” kelimesinin ilk sesi hangisidir?','["R","I","A","T"]',2,'Arı sözcüğünü söylerken önce A sesini duyarız.',102,1
FROM dersler d WHERE (d.kod IN ('turkce') OR d.ad='Türkçe') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Hecelere Ayırıyorum','Heceler','👏','Kelimeleri söylerken ağzımızdan küçük ses grupları çıkar. Bu gruplara hece deriz. Kelimeyi söylerken alkışlamak heceleri bulmaya yardım eder.','Ka-lem derken iki bölüm duyarız: ka ve lem. Bu yüzden kalem iki hecelidir.','“Kalem” kelimesi kaç hecedir?','["1","2","3","4"]',1,'Kalem kelimesini ka-lem diye iki parçaya ayırırız. Bu nedenle 2 hecedir.',103,1
FROM dersler d WHERE (d.kod IN ('turkce') OR d.ad='Türkçe') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Kelime Oluşturuyorum','Heceleri Birleştiriyorum','🧩','Heceleri doğru sırayla birleştirince anlamlı kelimeler oluşturabiliriz. Önce ilk heceyi, sonra ikinci heceyi okuyup birlikte söyleriz.','ki + tap hecelerini yan yana getirirsek kitap kelimesi oluşur.','“ki + tap” birleşince hangi kelime oluşur?','["kitap","kapı","kita","takip"]',0,'ki ve tap heceleri doğru sırayla birleştiğinde kitap olur.',104,1
FROM dersler d WHERE (d.kod IN ('turkce') OR d.ad='Türkçe') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Anlamlı Cümle Kuruyorum','Cümleler','💬','Cümle, bize bir düşünceyi ya da olayı anlatan anlamlı kelime grubudur. Kelimeler doğru sırada olduğunda cümleyi kolayca anlarız.','“Ali top oynadı.” bize Ali''nin ne yaptığını açıkça anlatan anlamlı bir cümledir.','Hangisi anlamlı bir cümledir?','["Top Ali kırmızı.","Ali top oynadı.","Oynadı top Ali mi.","Topun Ali."]',1,'“Ali top oynadı.” söz dizimi doğru ve anlamı açık bir cümledir.',105,1
FROM dersler d WHERE (d.kod IN ('turkce') OR d.ad='Türkçe') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Büyük Harfle Başlıyorum','Yazım Kuralları','🔠','Cümleye başlarken ilk harfi büyük yazarız. Kişi adları da büyük harfle başlar. Bu kural yazımızı daha düzenli ve anlaşılır yapar.','“Ayşe okula gitti.” cümlesinde hem Ayşe adı hem de cümlenin başlangıcı büyük harfle yazılmıştır.','Hangisi doğru yazılmıştır?','["ayşe okula gitti.","Ayşe okula gitti.","ayşe Okula gitti.","AYŞE okula gitti."]',1,'Kişi adı olan Ayşe büyük harfle başlamalıdır. Cümlenin ilk harfi de büyük olmalıdır.',106,1
FROM dersler d WHERE (d.kod IN ('turkce') OR d.ad='Türkçe') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Nokta Kullanıyorum','Noktalama İşaretleri','🔴','Bir şeyi anlatan cümlemiz tamamlandığında sonuna nokta koyarız. Nokta, cümlenin bittiğini gösterir.','“Bugün okula gittim.” cümlesi bir bilgi verdiği için sonunda nokta vardır.','“Bugün okula gittim__” cümlesinin sonuna hangisi gelmelidir?','[".","?","!",","]',0,'Bu cümle bir soru sormuyor; bir bilgi veriyor. Bu yüzden sonuna nokta gelir.',107,1
FROM dersler d WHERE (d.kod IN ('turkce') OR d.ad='Türkçe') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Soru İşaretini Tanıyorum','Noktalama İşaretleri','❓','Birine soru sorduğumuz cümlelerin sonuna soru işareti koyarız. Kim, ne, nerede, nasıl gibi sözcükler bize soru cümlesini fark ettirebilir.','“Senin adın ne?” bir soru cümlesidir ve sonunda soru işareti vardır.','“Senin adın ne__” cümlesinin sonuna hangisi gelmelidir?','[".",",","?","!"]',2,'“Senin adın ne?” bir soru soruyor. Bu yüzden sonuna soru işareti gelir.',108,1
FROM dersler d WHERE (d.kod IN ('turkce') OR d.ad='Türkçe') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Kim, Nerede, Ne Yapıyor?','Cümleyi Anlıyorum','🔎','Bir cümleyi anlamak için üç küçük soru sorabiliriz: Kim? Nerede? Ne yapıyor? Bu sorular cümledeki önemli bilgileri bulmamızı sağlar.','“Ece parkta koşuyor.” cümlesinde kim: Ece, nerede: parkta, ne yapıyor: koşuyor.','“Ece parkta koşuyor.” Ece nerede?','["Evde","Parkta","Okulda","Markette"]',1,'Cümlede açıkça “Ece parkta koşuyor.” deniyor. Bu nedenle cevap parktadır.',109,1
FROM dersler d WHERE (d.kod IN ('turkce') OR d.ad='Türkçe') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Olayları Sıralıyorum','Önce - Sonra','⏱️','Bir olayın önce ve sonra olan bölümleri vardır. Olayları doğru sıraya koymak hem anlatmayı hem de okuduğumuzu anlamayı kolaylaştırır.','Sabah önce uyanırız, sonra hazırlanırız, daha sonra okula gideriz.','Sabah yaptıklarımızın en başında hangisi vardır?','["Okula gitmek","Uyumak","Uyanmak","Akşam yemeği yemek"]',2,'Sabah güne başlamak için önce uyanırız. Diğer işler bundan sonra gelir.',110,1
FROM dersler d WHERE (d.kod IN ('turkce') OR d.ad='Türkçe') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Zıt Anlamlı Kelimeler','Kelime Bilgisi','↔️','Bazı kelimeler birbirinin tam tersini anlatır. Bu kelimelere zıt anlamlı kelimeler deriz.','Büyük ve küçük birbirinin zıttıdır. Sıcak ve soğuk da zıt anlamlıdır.','“Büyük” kelimesinin zıt anlamlısı hangisidir?','["Uzun","Küçük","Geniş","Yüksek"]',1,'Büyük kelimesinin tam tersini anlatan kelime küçüktür.',111,1
FROM dersler d WHERE (d.kod IN ('turkce') OR d.ad='Türkçe') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Kısa Metni Anlıyorum','Okuduğunu Anlama','📖','Okurken önemli bilgileri aklımızda tutarız. Metinde geçen kişi, yer, renk ve olaylarla ilgili sorulara metinden cevap bulabiliriz.','Mert sabah kahvaltısını yaptı. Kırmızı topunu alıp bahçeye çıktı. Bahçede arkadaşı Can ile oynadı.','Metne göre Mert''in topu hangi renktir?','["Mavi","Kırmızı","Yeşil","Sarı"]',1,'Metinde “kırmızı topunu” ifadesi geçiyor. Cevabı doğrudan metinden bulabiliriz.',112,1
FROM dersler d WHERE (d.kod IN ('turkce') OR d.ad='Türkçe') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'0''dan 10''a Sayılar','Sayıları Tanıyorum','🔢','Sayılar bize kaç tane olduğunu gösterir. Nesneleri tek tek sayarken her nesne için bir sayı söyleriz ve son söylediğimiz sayı toplam miktarı gösterir.','🍎🍎🍎🍎 dört elmadır. Elmaların her birini bir kez sayarız: 1, 2, 3, 4.','🍎🍎🍎🍎 kaç elma vardır?','["3","4","5","6"]',1,'Dört elmayı tek tek saydığımızda 1, 2, 3, 4 deriz. Toplam 4 elma vardır.',101,1
FROM dersler d WHERE (d.kod IN ('matematik') OR d.ad='Matematik') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'11''den 20''ye Sayılar','Sayıları Tanıyorum','2️⃣','10''dan sonra 11 ile devam ederiz. 11''den 20''ye kadar olan sayıları sırayla söyleyebilir ve yazabiliriz.','11, 12, 13, 14, 15 diye saymaya devam ederiz.','14 sayısından sonra hangi sayı gelir?','["13","14","15","16"]',2,'Sayıları birer ileri saydığımızda 14''ten sonra 15 gelir.',102,1
FROM dersler d WHERE (d.kod IN ('matematik') OR d.ad='Matematik') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Önceki ve Sonraki Sayı','Sayı Sırası','⬅️➡️','Sayı doğrusunda bir sayının hemen solundaki sayı ondan bir eksik, hemen sağındaki sayı ise bir fazladır.','7, 8, 9 sıralamasında 8''in öncesi 7, sonrası 9''dur.','8 sayısından hemen önce hangi sayı vardır?','["6","7","9","10"]',1,'8''den bir geri sayarsak 7''ye geliriz. Bu yüzden 8''in önceki sayısı 7''dir.',103,1
FROM dersler d WHERE (d.kod IN ('matematik') OR d.ad='Matematik') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Büyük ve Küçük Sayılar','Karşılaştırma','🐊','İki sayıyı karşılaştırırken sayıların büyüklüğüne bakarız. Sayı doğrusunda daha ileride olan sayı daha büyüktür.','9, 6''dan büyüktür. Çünkü 9''a ulaşmak için 6''dan sonra 7, 8 ve 9 diye ilerleriz.','Hangisi daha büyüktür: 6 mı 9 mu?','["6","9","İkisi eşit","Hiçbiri"]',1,'9 sayısı 6''dan daha büyüktür.',104,1
FROM dersler d WHERE (d.kod IN ('matematik') OR d.ad='Matematik') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Eşitliği Tanıyorum','= İşareti','⚖️','İki tarafta aynı sayı ya da aynı miktar varsa eşittir işaretini kullanırız. Eşittir işareti iki tarafın aynı olduğunu söyler.','5 = 5 ifadesinde iki tarafta da aynı sayı vardır.','5 __ 5 boşluğuna hangi işaret gelmelidir?','["<",">","=","+"]',2,'5 ile 5 aynı değerdedir. Bu yüzden eşittir işareti kullanılır.',105,1
FROM dersler d WHERE (d.kod IN ('matematik') OR d.ad='Matematik') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Onluk ve Birlik','Basamakları Keşfediyorum','🔟','10 tane birlik bir onluk oluşturur. 10''dan büyük sayıları bir onluk ve kalan birlikler olarak düşünebiliriz.','13 sayısı 1 onluk ve 3 birlikten oluşur: 10 + 3 = 13.','13 sayısı kaç onluk ve kaç birlikten oluşur?','["1 onluk 3 birlik","3 onluk 1 birlik","1 onluk 2 birlik","2 onluk 3 birlik"]',0,'13 = 10 + 3 olduğu için 1 onluk ve 3 birlik vardır.',106,1
FROM dersler d WHERE (d.kod IN ('matematik') OR d.ad='Matematik') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Toplama Yapıyorum','Toplama İşlemi','➕','Toplama, iki grubu bir araya getirmektir. Birinci gruptaki nesnelerle ikinci gruptaki nesneleri birlikte sayarız.','🍎🍎 + 🍎🍎🍎 = 5 elma. Yani 2 + 3 = 5.','4 + 3 kaçtır?','["5","6","7","8"]',2,'4''ün üzerine üç sayı ilerleriz: 5, 6, 7. Bu nedenle 4 + 3 = 7.',107,1
FROM dersler d WHERE (d.kod IN ('matematik') OR d.ad='Matematik') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Toplama Problemi Çözüyorum','Problemler','🎈','Bir problemde yeni nesneler ekleniyor ya da iki grup birleşiyorsa toplama yapabiliriz. Önce verilen sayıları bulur, sonra toplarız.','3 balona 2 balon daha eklenirse 3 + 2 = 5 balon olur.','3 balon vardı. 2 balon daha geldi. Toplam kaç balon oldu?','["4","5","6","7"]',1,'“Daha geldi” ifadesi miktarın arttığını gösterir. 3 + 2 = 5.',108,1
FROM dersler d WHERE (d.kod IN ('matematik') OR d.ad='Matematik') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Çıkarma Yapıyorum','Çıkarma İşlemi','➖','Çıkarma, bir gruptan bazı nesneleri ayırmak ya da eksiltmektir. Kalan miktarı bulmak için çıkarma yaparız.','8 elmadan 3 elma alınırsa 8 - 3 = 5 elma kalır.','8 - 3 kaçtır?','["4","5","6","7"]',1,'8''den üç kez geri sayarız: 7, 6, 5. Sonuç 5''tir.',109,1
FROM dersler d WHERE (d.kod IN ('matematik') OR d.ad='Matematik') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Çıkarma Problemi Çözüyorum','Problemler','🍎','Bir problemde nesneler gidiyor, kullanılıyor ya da azalıyor ise çıkarma yapabiliriz. Soruda “kaç kaldı?” ifadesi de bize ipucu verir.','7 elmadan 2''si yenirse 7 - 2 = 5 elma kalır.','7 elmadan 2''si yenirse kaç elma kalır?','["4","5","6","7"]',1,'Elma sayısı azaldığı için çıkarma yaparız: 7 - 2 = 5.',110,1
FROM dersler d WHERE (d.kod IN ('matematik') OR d.ad='Matematik') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Geometrik Şekilleri Tanıyorum','Şekiller','🔺','Çevremizde daire, üçgen, kare ve dikdörtgene benzeyen birçok nesne vardır. Şekilleri kenar ve köşe sayılarına bakarak ayırt edebiliriz.','Üçgenin 3 kenarı ve 3 köşesi vardır. Karenin 4 kenarı ve 4 köşesi vardır.','3 kenarı olan şekil hangisidir?','["Daire","Üçgen","Kare","Dikdörtgen"]',1,'Üçgen adından da anlaşılacağı gibi 3 kenara sahiptir.',111,1
FROM dersler d WHERE (d.kod IN ('matematik') OR d.ad='Matematik') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Örüntüyü Tamamlıyorum','Örüntüler','🟣','Örüntü, belirli bir kurala göre tekrar eden şekil, renk ya da sayılardan oluşur. Tekrar eden bölümü bulursak sıradaki parçayı tahmin edebiliriz.','🔴🔵🔴🔵 dizisinde kırmızı ve mavi sırayla tekrar eder.','🔴🔵🔴🔵__ sırada ne gelmelidir?','["🔴","🔵","🟢","🟡"]',0,'Kural kırmızı-mavi şeklinde tekrar ediyor. Maviden sonra yeniden kırmızı gelir.',112,1
FROM dersler d WHERE (d.kod IN ('matematik') OR d.ad='Matematik') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Kendimi Tanıyorum','Ben Eşsizim','🙂','Hepimizin adı, sevdiği şeyler, becerileri ve özellikleri farklı olabilir. Farklılıklarımız bizi özel yapar ve birbirimize saygı duymamız gerekir.','Bir arkadaşımız resim yapmayı, diğeri koşmayı çok iyi yapabilir. İkisi de farklı ve değerlidir.','Her insanın özellikleri aynı olmak zorunda mıdır?','["Evet","Hayır","Sadece okulda","Sadece evde"]',1,'İnsanların görünüşleri, ilgi alanları ve yetenekleri farklı olabilir. Bu doğaldır.',101,1
FROM dersler d WHERE (d.kod IN ('hayat','hayat_bilgisi','hayat-bilgisi') OR d.ad='Hayat Bilgisi') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Ailemde Yardımlaşıyorum','Ailem','🏠','Ailede herkes yaşına uygun sorumluluklar alabilir. Yardımlaşmak işleri kolaylaştırır ve aile bireylerinin birbirine destek olmasını sağlar.','Oyuncaklarını toplamak, sofraya peçete koymak ya da odanı düzenlemek yaşına uygun sorumluluklardır.','Evde görevleri paylaşmak neden önemlidir?','["Yardımlaşmak için","Daha çok dağınıklık için","Kimse çalışmasın diye","Sadece oyun için"]',0,'Görevleri paylaşmak aile içinde yardımlaşmayı ve düzeni artırır.',102,1
FROM dersler d WHERE (d.kod IN ('hayat','hayat_bilgisi','hayat-bilgisi') OR d.ad='Hayat Bilgisi') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Sınıf Kurallarına Uyuyorum','Okulum','🏫','Sınıf kuralları herkesin güvenli ve rahat öğrenmesine yardımcı olur. Konuşmak istediğimizde sıramızı bekler ve söz isteriz.','Öğretmen bir soru sorduğunda cevap vermek için parmak kaldırmak sınıf düzenini korur.','Sınıfta söz almak için ne yapmalıyız?','["Bağırmalıyız","Parmak kaldırmalıyız","Yerimizden koşmalıyız","Arkadaşımızı itmeliyiz"]',1,'Parmak kaldırmak söz istediğimizi nazik ve düzenli biçimde gösterir.',103,1
FROM dersler d WHERE (d.kod IN ('hayat','hayat_bilgisi','hayat-bilgisi') OR d.ad='Hayat Bilgisi') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'İyi Bir Arkadaş Oluyorum','Arkadaşlık','🤝','İyi arkadaşlar birbirini dinler, paylaşır ve saygılı konuşur. Bir arkadaşımız konuşurken onun sözünü kesmeden dinlemek önemlidir.','Arkadaşın bir şey anlatırken yüzüne bakıp onu dinlemek saygılı bir davranıştır.','Arkadaşımız konuşurken ne yapmalıyız?','["Sözünü kesmeliyiz","Dinlemeliyiz","Uzaklaşmalıyız","Bağırmalıyız"]',1,'Dinlemek, arkadaşımıza değer verdiğimizi ve ona saygı duyduğumuzu gösterir.',104,1
FROM dersler d WHERE (d.kod IN ('hayat','hayat_bilgisi','hayat-bilgisi') OR d.ad='Hayat Bilgisi') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Sağlıklı Yaşamı Seçiyorum','Temizlik ve Sağlık','🧼','Ellerimizi temiz tutmak, dişlerimizi fırçalamak, yeterli uyumak ve dengeli beslenmek sağlığımızı korur.','Yemekten önce ellerimizi sabun ve suyla yıkamak mikropların yiyeceklere taşınmasını azaltır.','Yemekten önce ne yapmalıyız?','["Ellerimizi yıkamalıyız","Koşmalıyız","Televizyon açmalıyız","Oyuncakları dağıtmalıyız"]',0,'Yemekten önce ellerimizi yıkamak sağlıklı bir alışkanlıktır.',105,1
FROM dersler d WHERE (d.kod IN ('hayat','hayat_bilgisi','hayat-bilgisi') OR d.ad='Hayat Bilgisi') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Trafikte Güvendeyim','Yaya Güvenliği','🚦','Karşıya geçerken yaya geçidini kullanır, trafik ışıklarına dikkat eder ve yolun güvenli olduğundan emin oluruz. Koşarak yola çıkmayız.','Yaya geçidine geldiğimizde önce durur, trafiği kontrol eder ve güvenliyse karşıya geçeriz.','Karşıya geçmek için en güvenli yer hangisidir?','["Arabaların arası","Yolun ortası","Yaya geçidi","Herhangi bir yer"]',2,'Yaya geçidi, yayaların karşıya daha güvenli geçmesi için ayrılmış yerdir.',106,1
FROM dersler d WHERE (d.kod IN ('hayat','hayat_bilgisi','hayat-bilgisi') OR d.ad='Hayat Bilgisi') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Evde Güvenli Davranıyorum','Güvenlik','⚠️','Elektrik prizleri, ilaçlar ve kesici araçlar çocuklar için tehlikeli olabilir. Bunlarla büyüklerin izni ve yardımı olmadan oynamayız.','Prize oyuncak ya da metal bir cisim sokmak elektrik çarpmasına neden olabilir ve çok tehlikelidir.','Prize yabancı bir cisim sokmak güvenli midir?','["Evet","Hayır","Sadece gündüz","Sadece oyuncaksa"]',1,'Prize hiçbir yabancı cisim sokmamalıyız. Elektrik ciddi şekilde yaralayabilir.',107,1
FROM dersler d WHERE (d.kod IN ('hayat','hayat_bilgisi','hayat-bilgisi') OR d.ad='Hayat Bilgisi') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Çevremi Koruyorum','Temiz Çevre','♻️','Çevremizi temiz tutmak insanlar, hayvanlar ve bitkiler için önemlidir. Çöpleri yere atmak yerine uygun çöp kutusuna atarız.','Parkta yediğimiz yiyeceğin paketini yanımızdaki çöp kutusuna atmak doğru bir davranıştır.','Çöpümüzü nereye atmalıyız?','["Yere","Sokağa","Çöp kutusuna","Ağacın altına"]',2,'Çöpleri çöp kutusuna atmak çevrenin temiz kalmasına yardımcı olur.',108,1
FROM dersler d WHERE (d.kod IN ('hayat','hayat_bilgisi','hayat-bilgisi') OR d.ad='Hayat Bilgisi') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Ana Renkleri Tanıyorum','Renkler','🎨','Kırmızı, sarı ve mavi temel olarak öğrendiğimiz ana renklerdir. Bu renkleri resimlerimizde tek başına ya da başka renklerle birlikte kullanabiliriz.','Bir güneşi sarı, bir gökyüzünü mavi, bir elmayı kırmızı boyayabiliriz.','Aşağıdakilerden hangisi ana renklerden biridir?','["Yeşil","Mor","Kırmızı","Turuncu"]',2,'Kırmızı ana renklerden biridir. Yeşil, mor ve turuncu ise renklerin karışımıyla elde edilebilir.',101,1
FROM dersler d WHERE (d.kod IN ('gorsel','gorsel_sanatlar','gorsel-sanatlar') OR d.ad='Görsel Sanatlar') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Renkleri Karıştırıyorum','Yeni Renkler','🟢','Bazı renkleri karıştırınca yeni renkler oluşur. Renk denemeleri yapmak resimlerimizde daha fazla seçenek kullanmamızı sağlar.','Sarı ile maviyi karıştırdığımızda yeşil elde ederiz.','Sarı ile mavi karışınca hangi renk oluşur?','["Yeşil","Kırmızı","Siyah","Pembe"]',0,'Sarı ve mavi boyalar karıştırıldığında yeşil renk oluşur.',102,1
FROM dersler d WHERE (d.kod IN ('gorsel','gorsel_sanatlar','gorsel-sanatlar') OR d.ad='Görsel Sanatlar') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Çizgi Çeşitlerini Keşfediyorum','Çizgiler','〰️','Resim yaparken düz, eğri, kırık ve dalgalı çizgiler kullanabiliriz. Farklı çizgiler resme farklı hareketler ve biçimler verir.','Deniz dalgalarını çizerken dalgalı çizgiler kullanabiliriz.','Dalga gibi ilerleyen çizgi hangisidir?','["Düz çizgi","Dalgalı çizgi","Nokta","Kare"]',1,'Dalgalı çizgi yukarı ve aşağı kıvrılarak ilerler ve su dalgalarına benzer.',103,1
FROM dersler d WHERE (d.kod IN ('gorsel','gorsel_sanatlar','gorsel-sanatlar') OR d.ad='Görsel Sanatlar') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Şekillerle Resim Yapıyorum','Şekiller','☀️','Daire, üçgen, kare ve dikdörtgen gibi şekilleri birleştirerek yeni resimler oluşturabiliriz.','Daireden güneş, üçgenden çatı, kareden pencere yaparak bir ev resmi oluşturabiliriz.','Güneşi çizerken hangi temel şekilden yararlanabiliriz?','["Daire","Üçgen","Kare","Dikdörtgen"]',0,'Güneşin yuvarlak biçimini göstermek için daire kullanabiliriz.',104,1
FROM dersler d WHERE (d.kod IN ('gorsel','gorsel_sanatlar','gorsel-sanatlar') OR d.ad='Görsel Sanatlar') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Desen Oluşturuyorum','Tekrar Eden Şekiller','✨','Bir şekil ya da renk belli bir sırayla tekrar ederse desen oluşturabiliriz. Desenin kuralını bulduğumuzda sıradaki parçayı seçebiliriz.','⭐⚪⭐⚪ dizisinde yıldız ve daire sırayla tekrar eder.','⭐⚪⭐⚪__ sırada hangisi gelmelidir?','["⭐","⚪","🔺","🟩"]',0,'Desen yıldız-daire şeklinde tekrar ediyor. Bu nedenle sırada yıldız vardır.',105,1
FROM dersler d WHERE (d.kod IN ('gorsel','gorsel_sanatlar','gorsel-sanatlar') OR d.ad='Görsel Sanatlar') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Sesleri Dinliyorum','Ses Kaynakları','👂','Çevremizde insanlar, hayvanlar, doğa ve müzik aletleri farklı sesler çıkarır. Bir sesi dikkatle dinleyerek kaynağını tahmin edebiliriz.','Davula vurulduğunda titreşim oluşur ve kulağımız bir ses duyar.','Davul çalındığında ne duyarız?','["Renk","Ses","Koku","Işık"]',1,'Davul bir müzik aletidir ve çalındığında ses çıkarır.',101,1
FROM dersler d WHERE (d.kod IN ('muzik') OR d.ad='Müzik') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Hızlı ve Yavaş Müziği Ayırıyorum','Tempo','🏃','Müzikte bazı bölümler hızlı, bazı bölümler yavaş olabilir. Müziğin hızına tempo diyebiliriz.','Hızlı bir ritimde daha çabuk, yavaş bir ritimde daha sakin hareket edebiliriz.','Koşmak mı yürümek mi daha hızlı bir harekettir?','["Yürümek","Koşmak","İkisi aynı","Hiçbiri"]',1,'Koşarken adımlarımız yürümeye göre daha hızlıdır. Hızlı tempo fikrini böyle karşılaştırabiliriz.',102,1
FROM dersler d WHERE (d.kod IN ('muzik') OR d.ad='Müzik') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Ritim Tekrar Ediyorum','Ritim','👏','Ritim, seslerin ve vuruşların belli bir düzen içinde tekrar etmesidir. Dinlediğimiz kısa bir ritmi alkışla tekrar edebiliriz.','👏👏 — 👏👏 düzeninde iki alkışlık grup tekrar ediyor.','👏👏 — 👏👏 dizisi nasıl devam etmelidir?','["👏👏","👏","Sessizlik","👏👏👏👏"]',0,'Ritimde iki alkışlık grup tekrar ettiği için yine iki alkış gelir.',103,1
FROM dersler d WHERE (d.kod IN ('muzik') OR d.ad='Müzik') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'İnce ve Kalın Sesleri Ayırıyorum','Ses Özellikleri','🐦','Bazı sesler ince, bazı sesler kalın duyulur. İnce sesler daha tiz, kalın sesler daha tok duyulabilir.','Küçük bir kuşun ötüşü çoğu zaman ince; büyük bir davulun sesi daha kalın duyulabilir.','Küçük bir kuşun sesi genellikle nasıldır?','["İnce","Kalın","Sessiz olmak zorunda","Görünmez"]',0,'Küçük kuşların ötüşleri çoğu zaman ince seslere örnektir.',104,1
FROM dersler d WHERE (d.kod IN ('muzik') OR d.ad='Müzik') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Çalgıları Tanıyorum','Müzik Aletleri','🎸','Müzik yapmak için gitar, davul, piyano ve flüt gibi farklı çalgılar kullanılır. Her çalgının sesi ve çalınış biçimi farklıdır.','Gitarın tellerine dokunarak, davula vurarak ses çıkarabiliriz.','Hangisi bir müzik aletidir?','["Masa","Gitar","Kalem","Çanta"]',1,'Gitar, telleri olan bir müzik aletidir.',105,1
FROM dersler d WHERE (d.kod IN ('muzik') OR d.ad='Müzik') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Isınmayı Unutmuyorum','Harekete Hazırlık','🤸','Hareketli bir oyuna ya da spora başlamadan önce vücudumuzu yavaş hareketlerle hazırlamak önemlidir. Buna ısınma deriz.','Kolları yavaşça çevirme, yerinde yürüme ve hafif esneme birer ısınma örneğidir.','Spora başlamadan önce ne yapmalıyız?','["Isınmalıyız","Hemen çok hızlı koşmalıyız","Hiç hareket etmemeliyiz","Sadece oturmalıyız"]',0,'Isınma hareketleri vücudumuzu yapacağımız etkinliğe hazırlar.',101,1
FROM dersler d WHERE (d.kod IN ('beden','beden_egitimi','beden-egitimi','beden-egitimi-ve-oyun') OR d.ad='Beden Eğitimi ve Oyun') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Sağımı Solumu Biliyorum','Yönler','↔️','Sağ ve sol yönlerini bilmek hareketleri takip etmeyi kolaylaştırır. Bir yönü öğrenirken kendi bedenimizden yardım alabiliriz.','Sağ elimizin karşı tarafında sol elimiz vardır.','Sağ elimizin karşı tarafındaki elimiz hangisidir?','["Sağ","Sol","Yukarı","Aşağı"]',1,'Vücudumuzun iki yanında sağ ve sol yönleri bulunur. Sağ elin diğer tarafında sol el vardır.',102,1
FROM dersler d WHERE (d.kod IN ('beden','beden_egitimi','beden-egitimi','beden-egitimi-ve-oyun') OR d.ad='Beden Eğitimi ve Oyun') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Dengemi Koruyorum','Denge','⚖️','Denge, hareket ederken ya da dururken bedenimizi kontrollü tutabilmektir. Yavaş ve dikkatli hareket etmek dengeyi kolaylaştırır.','Tek ayak üzerinde birkaç saniye durmaya çalışmak bir denge çalışmasıdır.','Tek ayak üzerinde durmak hangi beceriyi geliştirir?','["Denge","Okuma","Boyama","Şarkı söyleme"]',0,'Tek ayak üzerinde dururken bedenimizi kontrollü tutmaya çalışırız. Bu bir denge çalışmasıdır.',103,1
FROM dersler d WHERE (d.kod IN ('beden','beden_egitimi','beden-egitimi','beden-egitimi-ve-oyun') OR d.ad='Beden Eğitimi ve Oyun') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Topla Hareket Ediyorum','Atma ve Yakalama','⚽','Top oyunlarında topu yuvarlayabilir, atabilir, yakalayabilir ve arkadaşımıza gönderebiliriz. Hareket ederken çevremize dikkat ederiz.','Topu kontrollü biçimde bir arkadaşımıza göndermeye pas vermek denir.','Topu arkadaşımıza göndermeye ne denir?','["Pas","Uyku","Boyama","Okuma"]',0,'Topu takım arkadaşımıza kontrollü şekilde göndermek pas vermektir.',104,1
FROM dersler d WHERE (d.kod IN ('beden','beden_egitimi','beden-egitimi','beden-egitimi-ve-oyun') OR d.ad='Beden Eğitimi ve Oyun') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Oyun Kurallarına Uyuyorum','Adil Oyun','🎯','Oyunların herkes için eğlenceli ve güvenli olması için kurallara uyarız. Sıramızı bekler, arkadaşlarımıza saygılı davranırız.','Bir oyunda sıra arkadaşımızdaysa onun oynamasını beklemek doğru davranıştır.','Oyunda sırayı beklemek doğru mudur?','["Evet","Hayır","Sadece kazanırken","Sadece öğretmen bakarken"]',0,'Sırayı beklemek oyunun adil ve düzenli devam etmesine yardımcı olur.',105,1
FROM dersler d WHERE (d.kod IN ('beden','beden_egitimi','beden-egitimi','beden-egitimi-ve-oyun') OR d.ad='Beden Eğitimi ve Oyun') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Farklı Olanı Buluyorum','Dikkat Oyunu','🔍','Dikkat oyunlarında nesnelerin renk, şekil ya da türlerine bakarız. Diğerlerinden farklı olanı bulmak için bütün seçenekleri tek tek karşılaştırırız.','🍎🍎🍌🍎 dizisinde yalnızca muz diğerlerinden farklıdır.','🍎🍎🍌🍎 dizisinde farklı olan hangisidir?','["🍎","🍌","İkisi de aynı","Hiçbiri"]',1,'Üç tane elma, bir tane muz vardır. Bu nedenle farklı olan muzdur.',101,1
FROM dersler d WHERE (d.kod IN ('serbest','serbest_etkinlikler','serbest-etkinlikler') OR d.ad='Serbest Etkinlikler') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Hafızamı Çalıştırıyorum','Hafıza Oyunu','🧠','Bir resmi kısa süre inceleyip sonra gördüklerimizi hatırlamak hafızamızı çalıştırır. Nesneleri isimleriyle tekrar etmek hatırlamayı kolaylaştırabilir.','Kısa süre için “kedi - top - yıldız” sözcüklerine bakıp sonra bunlardan birini hatırlamaya çalışabiliriz.','“Kedi - top - yıldız” grubunda hangisi vardı?','["Balık","Top","Araba","Ağaç"]',1,'Verilen üçlüde kedi, top ve yıldız vardı. Seçenekler içinde doğru cevap toptur.',102,1
FROM dersler d WHERE (d.kod IN ('serbest','serbest_etkinlikler','serbest-etkinlikler') OR d.ad='Serbest Etkinlikler') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Resim ve Kelimeyi Eşleştiriyorum','Eşleştirme','🐶','Bir resmi doğru kelimeyle eşleştirirken resimde ne gördüğümüzü söyler ve yazılı seçenekleri dikkatle okuruz.','🐶 resmi bir köpeği gösterir. Bu resmi “köpek” kelimesiyle eşleştiririz.','🐶 hangi kelimeyle eşleşir?','["Kedi","Köpek","Kuş","Balık"]',1,'🐶 simgesi köpeği gösterir. Bu yüzden doğru eşleşme köpektir.',103,1
FROM dersler d WHERE (d.kod IN ('serbest','serbest_etkinlikler','serbest-etkinlikler') OR d.ad='Serbest Etkinlikler') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Sayı Kuralını Buluyorum','Mantık Oyunu','🧩','Bazı sayı dizileri belirli bir kurala göre ilerler. Sayılar arasındaki farkı bulursak sıradaki sayıyı tahmin edebiliriz.','1, 3, 5 dizisinde her seferinde 2 ekleniyor. Bu nedenle sonraki sayı 7''dir.','1, 3, 5, __ dizisinde hangi sayı gelmelidir?','["6","7","8","9"]',1,'Dizi ikişer artıyor: 1, 3, 5, 7.',104,1
FROM dersler d WHERE (d.kod IN ('serbest','serbest_etkinlikler','serbest-etkinlikler') OR d.ad='Serbest Etkinlikler') ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Hikâyeyi Tamamlıyorum','Hayal Gücü','☔','Bir hikâyeyi tamamlarken önce verilen ipuçlarını düşünürüz. Devam cümlesi, önceki olayla uyumlu olmalıdır.','“Yağmur başladı. Ece çantasını açtı...” cümlesinden sonra yağmurla ilgili uygun bir olay gelmesini bekleriz.','“Yağmur başladı. Ece çantasından...” cümlesi en uygun nasıl tamamlanır?','["şemsiyesini çıkardı.","topunu denize attı.","uyumaya başladı.","kalemini yedi."]',0,'Yağmur başladığı için çantasından şemsiye çıkarması olayın akışına en uygun seçenektir.',105,1
FROM dersler d WHERE (d.kod IN ('serbest','serbest_etkinlikler','serbest-etkinlikler') OR d.ad='Serbest Etkinlikler') ORDER BY d.id LIMIT 1;

