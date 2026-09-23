SET NAMES utf8mb4;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Sondaki Sesi Buluyorum','Ses Farkındalığı','🔚','Bir kelimeyi yavaşça söylediğimizde en son duyduğumuz sesi bulabiliriz. Sondaki sesi fark etmek kelimeleri çözümlemeyi kolaylaştırır.','“Top” kelimesini yavaşça söyle: t-o-p. En son p sesini duyarız.','“Kitap” kelimesinin son sesi hangisidir?','["K","T","A","P"]',3,'Kitap kelimesi p sesiyle biter: ki-tap.',201,1
FROM dersler d
WHERE (d.kod IN ('turkce') OR d.ad='Türkçe')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Sondaki Sesi Buluyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Aynı Sesle Başlayan Kelimeler','Ses Farkındalığı','🔊','Bazı kelimeler aynı sesle başlar. Kelimelerin ilk seslerini karşılaştırarak aynı sesle başlayanları bulabiliriz.','Masa ve muz kelimeleri m sesiyle başlar.','Hangisi “masa” ile aynı sesle başlar?','["Muz","Kedi","Arı","Top"]',0,'Masa ve muz kelimelerinin ikisi de m sesiyle başlar.',202,1
FROM dersler d
WHERE (d.kod IN ('turkce') OR d.ad='Türkçe')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Aynı Sesle Başlayan Kelimeler')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Tek Heceli Kelimeler','Hece Bilgisi','1️⃣','Bazı kelimeleri söylerken tek bir hece duyarız. Bu kelimelere tek heceli kelime diyebiliriz.','“Top” kelimesini tek nefeste ve tek parça söyleriz. Bu nedenle tek hecelidir.','Hangisi tek heceli bir kelimedir?','["Kalem","Masa","Top","Araba"]',2,'Top kelimesi tek hecedir. Diğer seçenekler birden fazla heceden oluşur.',203,1
FROM dersler d
WHERE (d.kod IN ('turkce') OR d.ad='Türkçe')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Tek Heceli Kelimeler')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Eksik Heceyi Tamamlıyorum','Hece Bilgisi','🧩','Bir kelimenin eksik hecesini bulmak için kelimeyi tamamlanmış hâliyle düşünür ve hangi ses grubunun eksik olduğunu belirleriz.','“ki + __ = kitap” işleminde eksik hece “tap”tır.','“o + __ = okul” kelimesinde eksik hece hangisidir?','["kul","ka","ta","ma"]',0,'O ve kul heceleri birleşince okul kelimesi oluşur.',204,1
FROM dersler d
WHERE (d.kod IN ('turkce') OR d.ad='Türkçe')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Eksik Heceyi Tamamlıyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Hece Sayısını Karşılaştırıyorum','Hece Bilgisi','👏','Kelimeleri hecelerine ayırdıktan sonra hangisinin daha çok hecesi olduğunu karşılaştırabiliriz.','Ka-lem iki hece, a-ra-ba üç hecedir. Araba daha çok heceye sahiptir.','Hangisinin hece sayısı daha fazladır?','["Top","Kalem","Araba","Su"]',2,'Araba a-ra-ba şeklinde 3 hecedir ve seçenekler içinde en fazla heceye sahiptir.',205,1
FROM dersler d
WHERE (d.kod IN ('turkce') OR d.ad='Türkçe')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Hece Sayısını Karşılaştırıyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Resme Uygun Kelimeyi Seçiyorum','Kelime ve Görsel','🖼️','Bir görsele bakıp ne gördüğümüzü söyleyebilir, sonra doğru yazılmış kelimeyi seçebiliriz.','🐱 görselini gördüğümüzde “kedi” kelimesini seçeriz.','🍎 görseline uygun kelime hangisidir?','["Elma","Armut","Masa","Top"]',0,'🍎 bir elmayı gösterir. Bu nedenle doğru kelime elmadır.',206,1
FROM dersler d
WHERE (d.kod IN ('turkce') OR d.ad='Türkçe')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Resme Uygun Kelimeyi Seçiyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Eksik Kelimeyi Tamamlıyorum','Cümle Bilgisi','✍️','Bir cümlede eksik olan kelimeyi bulmak için cümlenin anlamını düşünürüz. Seçtiğimiz kelime cümleyi anlamlı hâle getirmelidir.','“Kuş gökyüzünde __.” cümlesini “uçar” kelimesiyle tamamlayabiliriz.','“Balık suda __.” cümlesini hangi kelime tamamlar?','["uçar","yüzer","koşar","yazar"]',1,'Balıkların suda yaptığı hareket yüzmektir. Bu nedenle “yüzer” doğru cevaptır.',207,1
FROM dersler d
WHERE (d.kod IN ('turkce') OR d.ad='Türkçe')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Eksik Kelimeyi Tamamlıyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Ünlem İşaretini Tanıyorum','Noktalama İşaretleri','❗','Sevinç, şaşırma, korku ya da güçlü bir seslenme anlatan cümlelerin sonunda ünlem işareti kullanılabilir.','“Yaşasın, kazandık!” cümlesinde güçlü bir sevinç olduğu için ünlem kullanılır.','“Eyvah, kalemim düştü__” cümlesinin sonuna hangisi gelir?','[".","?","!",","]',2,'“Eyvah” güçlü bir duygu bildirir. Bu nedenle cümlenin sonunda ünlem işareti uygundur.',208,1
FROM dersler d
WHERE (d.kod IN ('turkce') OR d.ad='Türkçe')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Ünlem İşaretini Tanıyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Virgülü Tanıyorum','Noktalama İşaretleri','⏸️','Virgül, aynı görevdeki sözcükleri sıralarken aralarında kısa bir duraklama yapmamızı sağlar.','“Çantamda kalem, silgi, defter var.” cümlesinde sıralanan nesneler virgülle ayrılır.','Hangisinde virgül doğru kullanılmıştır?','["Elma armut muz aldım.","Elma, armut, muz aldım.","Elma? armut? muz aldım.","Elma! armut! muz aldım."]',1,'Sıralanan elma, armut ve muz kelimeleri virgülle ayrılır.',209,1
FROM dersler d
WHERE (d.kod IN ('turkce') OR d.ad='Türkçe')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Virgülü Tanıyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Görselden Cümle Kuruyorum','Anlatım','🖼️','Bir görsele bakarken kim var, nerede ve ne yapıyor sorularını düşünerek anlamlı bir cümle kurabiliriz.','Parkta top oynayan bir çocuk için “Çocuk parkta top oynuyor.” diyebiliriz.','🐦🌳 görseli için en uygun cümle hangisidir?','["Kuş ağaçta duruyor.","Balık denizde yüzüyor.","Çocuk kitap okuyor.","Araba yolda gidiyor."]',0,'Görselde kuş ve ağaç olduğu için “Kuş ağaçta duruyor.” en uygun cümledir.',210,1
FROM dersler d
WHERE (d.kod IN ('turkce') OR d.ad='Türkçe')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Görselden Cümle Kuruyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Cümleye Uygun Görseli Buluyorum','Anlama','🎯','Bir cümleyi okuyup cümlede anlatılan nesne ve hareketleri düşünerek uygun görseli seçebiliriz.','“Kedi süt içiyor.” cümlesine süt içen bir kedi görseli uygundur.','“Çocuk kitap okuyor.” cümlesine hangi görsel uygundur?','["👧📖","🐶⚽","🚗🛣️","🐟🌊"]',0,'Kitap okuyan çocuğu gösteren 👧📖 görseli cümleyle eşleşir.',211,1
FROM dersler d
WHERE (d.kod IN ('turkce') OR d.ad='Türkçe')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Cümleye Uygun Görseli Buluyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Metne Başlık Seçiyorum','Okuduğunu Anlama','🏷️','Başlık, metnin genel olarak ne anlattığını kısa biçimde söyler. Metni okuduktan sonra en uygun başlığı seçebiliriz.','Ece küçük bir fidan dikti, her gün suladı ve yeni yaprakların çıktığını gördü. Bu metne “Ece''nin Fidanı” başlığı uygundur.','“Ali her sabah kedisine mama ve su veriyor.” metnine en uygun başlık hangisidir?','["Ali''nin Kedisi","Karlı Gün","Yeni Araba","Denizde Yüzme"]',0,'Metin Ali ve kedisinin bakımından söz ettiği için “Ali''nin Kedisi” en uygun başlıktır.',212,1
FROM dersler d
WHERE (d.kod IN ('turkce') OR d.ad='Türkçe')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Metne Başlık Seçiyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Sonra Ne Olacağını Tahmin Ediyorum','Okuduğunu Anlama','🔮','Bir olayın devamını tahmin ederken metindeki ipuçlarını kullanırız. Tahminimiz olayın akışına uygun olmalıdır.','“Gökyüzü karardı ve yağmur damlaları düştü.” cümlesinden sonra birinin şemsiye açması uygun bir tahmindir.','“Ece çok susadı ve mutfağa gitti.” Sonra ne yapması en uygundur?','["Su içmesi","Uyuması","Top oynaması","Bisiklete binmesi"]',0,'Susayan birinin mutfağa gitmesinden sonra su içmesi olayın doğal devamıdır.',213,1
FROM dersler d
WHERE (d.kod IN ('turkce') OR d.ad='Türkçe')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Sonra Ne Olacağını Tahmin Ediyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Dinlediğimi Anlıyorum','Dinleme','🎧','Birini dinlerken önemli kişi, yer ve olayları aklımızda tutarız. Dinleme sonunda bu bilgilerle ilgili soruları cevaplayabiliriz.','“Mina okuldan sonra parka gitti.” cümlesini dinlersek Mina''nın nereye gittiğini hatırlayabiliriz.','“Can sabah süt içti.” cümlesine göre Can ne içti?','["Su","Süt","Meyve suyu","Çay"]',1,'Cümlede Can''ın süt içtiği açıkça söyleniyor.',214,1
FROM dersler d
WHERE (d.kod IN ('turkce') OR d.ad='Türkçe')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Dinlediğimi Anlıyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Kısa Bir Cümle Yazıyorum','Yazma','📝','Kısa bir cümle yazarken büyük harfle başlar, kelimeler arasında boşluk bırakır ve cümlenin sonuna uygun noktalama işareti koyarız.','“Ece koşuyor.” kısa, anlamlı ve doğru yazılmış bir cümledir.','Hangisi doğru yazılmış kısa bir cümledir?','["ali koşuyor","Ali koşuyor.","Ali koşuyor","ali Koşuyor."]',1,'“Ali koşuyor.” büyük harfle başlar ve noktayla biter.',215,1
FROM dersler d
WHERE (d.kod IN ('turkce') OR d.ad='Türkçe')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Kısa Bir Cümle Yazıyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Sıra Sayılarını Kullanıyorum','Birinci - İkinci - Üçüncü','🥇','Bir yarışta ya da sırada nesnelerin yerini anlatmak için birinci, ikinci, üçüncü gibi sıra sayıları kullanırız.','🏃‍♀️🏃‍♂️🏃 sıralamasında en öndeki kişi birincidir.','Bir yarışta birinciden hemen sonra gelen kişi kaçıncıdır?','["Birinci","İkinci","Üçüncü","Dördüncü"]',1,'Birincinin hemen arkasındaki kişi ikinci sıradadır.',201,1
FROM dersler d
WHERE (d.kod IN ('matematik') OR d.ad='Matematik')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Sıra Sayılarını Kullanıyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Nesneleri Gruplayarak Sayıyorum','Kolay Sayma','🧺','Çok sayıda nesneyi sayarken onları küçük gruplara ayırmak işimizi kolaylaştırabilir.','10 kalemi iki gruba ayırıp 5 ve 5 olarak sayabiliriz: 5 + 5 = 10.','8 nesneyi eşit iki gruba ayırırsak her grupta kaç nesne olur?','["2","3","4","5"]',2,'8 nesne iki eşit gruba ayrıldığında 4 ve 4 olur.',202,1
FROM dersler d
WHERE (d.kod IN ('matematik') OR d.ad='Matematik')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Nesneleri Gruplayarak Sayıyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Tahmin Et Sonra Say','Tahmin','🎯','Bir grup nesneye kısa süre bakıp kaç tane olduğunu tahmin edebilir, sonra tek tek sayarak tahminimizi kontrol edebiliriz.','Bir kutuda yaklaşık 6 düğme olduğunu düşünebilir, sonra sayıp gerçek sayıyı bulabiliriz.','Tahminimizi kontrol etmek için ne yapmalıyız?','["Nesneleri saymalıyız","Gözümüzü kapatmalıyız","Kutuyu saklamalıyız","Rengi değiştirmeliyiz"]',0,'Tahmin ile gerçek sayıyı karşılaştırmak için nesneleri sayarız.',203,1
FROM dersler d
WHERE (d.kod IN ('matematik') OR d.ad='Matematik')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Tahmin Et Sonra Say')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'İkişer Ritmik Sayıyorum','Ritmik Sayma','2️⃣','İkişer ritmik sayarken her adımda sayıya 2 ekleriz.','2, 4, 6, 8 şeklinde ilerleriz.','2, 4, 6, 8, __ dizisinde hangi sayı gelir?','["9","10","11","12"]',1,'Her adımda 2 ekleniyor. 8 + 2 = 10.',204,1
FROM dersler d
WHERE (d.kod IN ('matematik') OR d.ad='Matematik')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='İkişer Ritmik Sayıyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Beşer Ritmik Sayıyorum','Ritmik Sayma','5️⃣','Beşer ritmik sayarken her seferinde 5 ekleriz.','5, 10, 15, 20 şeklinde sayabiliriz.','5, 10, 15, __ dizisinde hangi sayı gelir?','["16","18","20","25"]',2,'15''e 5 eklersek 20 olur.',205,1
FROM dersler d
WHERE (d.kod IN ('matematik') OR d.ad='Matematik')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Beşer Ritmik Sayıyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Onar Ritmik Sayıyorum','Ritmik Sayma','🔟','Onar ritmik sayarken her adımda 10 ekleriz. Bu sayma biçimi büyük miktarları hızlı saymamıza yardım eder.','10, 20, 30, 40 diye ilerleriz.','10, 20, 30, __ dizisinde hangi sayı gelir?','["35","40","45","50"]',1,'Her adımda 10 ekleniyor. 30 + 10 = 40.',206,1
FROM dersler d
WHERE (d.kod IN ('matematik') OR d.ad='Matematik')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Onar Ritmik Sayıyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'20''den Geri Sayıyorum','Geri Sayma','⬇️','Geri sayarken her adımda bir eksik sayıyı söyleriz.','20, 19, 18, 17 şeklinde devam ederiz.','20, 19, 18, __ dizisinde hangi sayı gelir?','["16","17","18","19"]',1,'18''den bir geri sayınca 17 gelir.',207,1
FROM dersler d
WHERE (d.kod IN ('matematik') OR d.ad='Matematik')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='20''den Geri Sayıyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Sayıyı Farklı Biçimlerde Gösteriyorum','Sayı Gösterimleri','🧮','Bir sayıyı rakamla, nesnelerle ya da parçalarına ayırarak gösterebiliriz.','7 sayısını “5 + 2” biçiminde de gösterebiliriz.','8 sayısını hangi işlem doğru gösterir?','["5 + 3","4 + 3","2 + 5","6 + 1"]',0,'5 + 3 = 8 olduğu için doğru gösterim budur.',208,1
FROM dersler d
WHERE (d.kod IN ('matematik') OR d.ad='Matematik')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Sayıyı Farklı Biçimlerde Gösteriyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Sıfırla Topluyorum','Toplama','0️⃣','Bir sayıya sıfır eklediğimizde miktar değişmez. Çünkü sıfır yeni bir nesne eklemez.','6 + 0 = 6''dır.','9 + 0 kaçtır?','["0","8","9","10"]',2,'Sıfır eklemek sayıyı değiştirmez. 9 + 0 = 9.',209,1
FROM dersler d
WHERE (d.kod IN ('matematik') OR d.ad='Matematik')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Sıfırla Topluyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'10''a Tamamlıyorum','Toplama','🔟','Bir sayıya kaç eklersek 10 olduğunu bulabiliriz. Sayıdan 10''a kadar ileri saymak bize yardımcı olur.','7''den 10''a 8, 9, 10 diye üç adım vardır. Bu yüzden 7 + 3 = 10.','6''ya kaç eklersek 10 olur?','["2","3","4","5"]',2,'6''dan 10''a dört adım vardır: 7, 8, 9, 10. Bu nedenle 6 + 4 = 10.',210,1
FROM dersler d
WHERE (d.kod IN ('matematik') OR d.ad='Matematik')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='10''a Tamamlıyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Eksik Toplananı Buluyorum','Toplama','❔','Bir toplama işleminde sonuç ve bir sayı verildiğinde eksik sayıyı bulabiliriz.','3 + __ = 7 işleminde 3''ten 7''ye dört adım ilerleriz. Eksik sayı 4''tür.','5 + __ = 9 işleminde eksik sayı kaçtır?','["2","3","4","5"]',2,'5''in üzerine 4 eklersek 9 olur. Eksik toplanan 4''tür.',211,1
FROM dersler d
WHERE (d.kod IN ('matematik') OR d.ad='Matematik')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Eksik Toplananı Buluyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Toplama ve Çıkarma İlişkisini Kuruyorum','İşlemler','🔄','Toplama ve çıkarma birbirine bağlı işlemlerdir. Bir toplamadan yararlanarak çıkarma sonucunu bulabiliriz.','4 + 3 = 7 ise 7 - 3 = 4 olduğunu da biliriz.','2 + 5 = 7 ise 7 - 5 kaçtır?','["1","2","3","5"]',1,'Toplam 7''den 5 çıkarıldığında diğer toplanan olan 2 kalır.',212,1
FROM dersler d
WHERE (d.kod IN ('matematik') OR d.ad='Matematik')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Toplama ve Çıkarma İlişkisini Kuruyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Uzun ve Kısayı Karşılaştırıyorum','Ölçme','📏','İki nesnenin uzunluklarını yan yana getirerek hangisinin daha uzun ya da kısa olduğunu karşılaştırabiliriz.','Bir kalem cetvelden daha kısaysa “kalem daha kısa” deriz.','Bir ip 8 karış, başka bir ip 5 karış ise hangisi daha uzundur?','["5 karışlık ip","8 karışlık ip","İkisi eşit","Bilinmez"]',1,'8, 5''ten büyük olduğu için 8 karışlık ip daha uzundur.',213,1
FROM dersler d
WHERE (d.kod IN ('matematik') OR d.ad='Matematik')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Uzun ve Kısayı Karşılaştırıyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Ağır ve Hafifi Tahmin Ediyorum','Ölçme','⚖️','Nesneleri kaldırmadan önce hangisinin daha ağır olduğunu tahmin edebilir, sonra karşılaştırarak kontrol edebiliriz.','Bir kitap genellikle bir yaprak kâğıttan daha ağırdır.','Hangisinin daha ağır olması beklenir?','["Bir tüy","Bir kitap","Bir pamuk parçası","Bir peçete"]',1,'Bir kitap, diğer seçeneklere göre genellikle daha ağırdır.',214,1
FROM dersler d
WHERE (d.kod IN ('matematik') OR d.ad='Matematik')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Ağır ve Hafifi Tahmin Ediyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Nesne Grafiğini Okuyorum','Veri','📊','Nesne grafiğinde her resim bir sayıyı temsil eder. Satırlardaki resimleri sayarak hangi seçeneğin daha çok olduğunu bulabiliriz.','Elma: 🍎🍎🍎🍎, Muz: 🍌🍌, Çilek: 🍓🍓🍓. En çok elma seçilmiştir.','Elma 🍎🍎🍎🍎, Muz 🍌🍌, Çilek 🍓🍓🍓. En çok hangisi seçilmiştir?','["Elma","Muz","Çilek","Hepsi eşit"]',0,'Elma satırında 4 resim vardır ve bu sayı diğerlerinden fazladır.',215,1
FROM dersler d
WHERE (d.kod IN ('matematik') OR d.ad='Matematik')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Nesne Grafiğini Okuyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Öğretmenimle ve Arkadaşlarımla Tanışıyorum','Okul Hayatı','👋','Okula başladığımızda öğretmenimiz ve arkadaşlarımızla tanışırız. Kendimizi adımızı söyleyerek nazikçe tanıtabiliriz.','“Merhaba, benim adım Ece.” demek uygun bir tanışma cümlesidir.','Yeni bir arkadaşla tanışırken hangisini söylemek uygundur?','["Merhaba, benim adım Ali.","Çekil önümden.","Ben konuşmam.","Oyuncağını ver."]',0,'Kendimizi nazikçe tanıtmak iyi bir başlangıçtır.',201,1
FROM dersler d
WHERE (d.kod IN ('hayat','hayat_bilgisi','hayat-bilgisi') OR d.ad='Hayat Bilgisi')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Öğretmenimle ve Arkadaşlarımla Tanışıyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Okulun Bölümlerini Tanıyorum','Okul Hayatı','🏫','Okulda sınıf, kütüphane, bahçe, müdür odası ve tuvalet gibi farklı bölümler bulunabilir. Her bölümün farklı bir amacı vardır.','Kitap okumak ve kitap ödünç almak için kütüphaneye gideriz.','Kitapları bulabileceğimiz okul bölümü hangisidir?','["Kütüphane","Bahçe","Kantin","Merdiven"]',0,'Kütüphane kitapların bulunduğu ve okuma yapılan bölümdür.',202,1
FROM dersler d
WHERE (d.kod IN ('hayat','hayat_bilgisi','hayat-bilgisi') OR d.ad='Hayat Bilgisi')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Okulun Bölümlerini Tanıyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Duygularımı Tanıyorum','Duygular','😊','Mutlu, üzgün, kızgın, korkmuş ya da şaşkın hissedebiliriz. Duygularımızı uygun sözlerle ifade etmek önemlidir.','Oyuncağın kırıldığında üzgün hissedebilirsin ve bunu “Üzüldüm.” diyerek anlatabilirsin.','Çok sevdiğin bir hediye aldığında hangi duyguyu hissedebilirsin?','["Mutlu","Uykulu","Kaybolmuş","Aç"]',0,'Sevdiğimiz bir hediye almak genellikle mutluluk duygusu oluşturur.',203,1
FROM dersler d
WHERE (d.kod IN ('hayat','hayat_bilgisi','hayat-bilgisi') OR d.ad='Hayat Bilgisi')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Duygularımı Tanıyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Kişisel Alanımı Koruyorum','Güvenli Sınırlar','🛡️','Herkesin kendini rahat hissettiği kişisel bir alanı vardır. Birinin bedenine ya da eşyasına izinsiz dokunmamak saygılı bir davranıştır.','Arkadaşının kalemini almak istiyorsan önce izin istemelisin.','Arkadaşının eşyasını kullanmadan önce ne yapmalısın?','["İzin istemelisin","Gizlice almalısın","Saklamalısın","Kırmalısın"]',0,'İzin istemek hem kişisel sınırlara hem de başkasının eşyasına saygı gösterir.',204,1
FROM dersler d
WHERE (d.kod IN ('hayat','hayat_bilgisi','hayat-bilgisi') OR d.ad='Hayat Bilgisi')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Kişisel Alanımı Koruyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Acil Durumda Ne Yapmalıyım?','Güvenlik','🚨','Bir kaza ya da tehlike olduğunda sakin kalmaya çalışır ve yakındaki güvenilir bir yetişkine haber veririz.','Okulda bir arkadaşın ciddi şekilde düşerse öğretmene haber vermek doğru davranıştır.','Okulda arkadaşın ciddi şekilde yaralanırsa önce ne yapmalısın?','["Öğretmene haber vermelisin","Saklanmalısın","Oyuna devam etmelisin","Eve tek başına gitmelisin"]',0,'Acil durumda yakındaki öğretmen gibi güvenilir bir yetişkine haber vermek gerekir.',205,1
FROM dersler d
WHERE (d.kod IN ('hayat','hayat_bilgisi','hayat-bilgisi') OR d.ad='Hayat Bilgisi')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Acil Durumda Ne Yapmalıyım?')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'112''yi Ne Zaman Ararız?','Acil Çağrı','☎️','112 Acil Çağrı Merkezi, ciddi sağlık sorunları, yangın veya güvenliği tehdit eden acil durumlarda yardım istemek için kullanılır. Gereksiz yere aranmaz.','Birinin ciddi şekilde yaralandığı acil durumda bir yetişkin 112''yi arayabilir.','112 hangi durumda aranmalıdır?','["Ciddi bir acil durumda","Oyun oynamak için","Arkadaşımızı çağırmak için","Saat öğrenmek için"]',0,'112 yalnızca gerçek acil durumlarda yardım istemek için kullanılmalıdır.',206,1
FROM dersler d
WHERE (d.kod IN ('hayat','hayat_bilgisi','hayat-bilgisi') OR d.ad='Hayat Bilgisi')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='112''yi Ne Zaman Ararız?')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Sağlıklı Beslenmeyi Seçiyorum','Sağlıklı Yaşam','🥗','Büyümek ve sağlıklı kalmak için farklı besinlerden dengeli şekilde tüketmek önemlidir. Su içmek de sağlıklı yaşamın parçasıdır.','Meyve, sebze, süt ürünleri ve diğer temel besin gruplarını dengeli tüketebiliriz.','Hangisi sağlıklı bir ara öğün olabilir?','["Elma","Şekerleme paketi","Gazlı içecek","Sadece cips"]',0,'Meyve, dengeli beslenmenin bir parçası olabilecek sağlıklı bir seçenektir.',207,1
FROM dersler d
WHERE (d.kod IN ('hayat','hayat_bilgisi','hayat-bilgisi') OR d.ad='Hayat Bilgisi')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Sağlıklı Beslenmeyi Seçiyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Uyku ve Dinlenmeye Önem Veriyorum','Sağlıklı Yaşam','🌙','Bedenimizin ve zihnimizin dinlenmesi için düzenli uyku önemlidir. Uyumadan önce sakinleşmek ve uygun saatte yatağa gitmek iyi bir alışkanlıktır.','Gece geç saatlere kadar ekran karşısında kalmak yerine uyku saatinde yatağa gitmek daha sağlıklıdır.','Dinlenmek için hangisi daha uygundur?','["Düzenli uyumak","Bütün gece oyun oynamak","Hiç uyumamak","Gece boyunca televizyon izlemek"]',0,'Düzenli uyku bedenimizin ve zihnimizin dinlenmesine yardımcı olur.',208,1
FROM dersler d
WHERE (d.kod IN ('hayat','hayat_bilgisi','hayat-bilgisi') OR d.ad='Hayat Bilgisi')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Uyku ve Dinlenmeye Önem Veriyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Kaybolursam Ne Yaparım?','Güvenlik','🧭','Kalabalık bir yerde ailemizden ayrılırsak sakin kalır, bulunduğumuz güvenli yerde bekler ve görevli bir yetişkinden yardım isteriz.','Alışveriş merkezinde kaybolursan güvenlik görevlisine ya da danışmaya başvurabilirsin.','Kalabalık bir yerde kaybolursan en uygun davranış hangisidir?','["Görevli bir yetişkinden yardım istemek","Tek başına dışarı koşmak","Yabancı bir arabaya binmek","Saklanmak"]',0,'Görevli ve güvenilir bir yetişkinden yardım istemek en güvenli seçenektir.',209,1
FROM dersler d
WHERE (d.kod IN ('hayat','hayat_bilgisi','hayat-bilgisi') OR d.ad='Hayat Bilgisi')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Kaybolursam Ne Yaparım?')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Su ve Elektriği Tasarruflu Kullanıyorum','Kaynakları Koruma','💧','Su ve elektrik sınırsız değildir. Kullanmadığımız ışıkları kapatmak ve diş fırçalarken musluğu açık bırakmamak tasarruf sağlar.','Odadan çıkarken ışığı kapatmak elektrik tasarrufuna yardımcı olur.','Hangisi su tasarrufu sağlar?','["Diş fırçalarken musluğu kapatmak","Musluğu sürekli açık bırakmak","Suyla gereksiz oyun oynamak","Boş yere su akıtmak"]',0,'İhtiyacımız olmayan anda musluğu kapatmak suyu korur.',210,1
FROM dersler d
WHERE (d.kod IN ('hayat','hayat_bilgisi','hayat-bilgisi') OR d.ad='Hayat Bilgisi')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Su ve Elektriği Tasarruflu Kullanıyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Doğadaki Renkleri Gözlüyorum','Renk Gözlemi','🌈','Doğaya dikkatle baktığımızda birçok farklı renk ve ton görebiliriz. Aynı renk bile açık ve koyu tonlarda karşımıza çıkabilir.','Bir ağacın yapraklarında açık yeşil ve koyu yeşil tonları görebiliriz.','Doğada yeşil rengi en çok hangi nesnede görmeyi bekleriz?','["Yaprak","Kar","Güneş","Bulut"]',0,'Yapraklar çoğunlukla yeşilin farklı tonlarında görülür.',201,1
FROM dersler d
WHERE (d.kod IN ('gorsel','gorsel_sanatlar','gorsel-sanatlar') OR d.ad='Görsel Sanatlar')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Doğadaki Renkleri Gözlüyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Doğal ve Yapay Nesneleri Ayırıyorum','Çevremdeki Nesneler','🌿','Doğal nesneler doğada kendiliğinden bulunur. Yapay nesneler ise insanlar tarafından üretilir.','Taş doğal, plastik oyuncak yapay bir nesnedir.','Hangisi doğal bir nesnedir?','["Taş","Plastik şişe","Oyuncak araba","Kalem kutusu"]',0,'Taş doğada bulunan doğal bir nesnedir.',202,1
FROM dersler d
WHERE (d.kod IN ('gorsel','gorsel_sanatlar','gorsel-sanatlar') OR d.ad='Görsel Sanatlar')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Doğal ve Yapay Nesneleri Ayırıyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Doğal Malzemelerle Kolaj Yapıyorum','Kolaj','🍂','Yaprak, küçük dal ve tohum gibi güvenli doğal malzemeleri kâğıt üzerinde bir araya getirerek kolaj oluşturabiliriz.','Kuru yaprakları farklı yönlerde yapıştırarak bir ağaç resmi oluşturabiliriz.','Hangisi doğal kolaj malzemesi olabilir?','["Kuru yaprak","Plastik kapak","Metal vida","Oyuncak parçası"]',0,'Kuru yaprak doğadan gelen doğal bir malzemedir.',203,1
FROM dersler d
WHERE (d.kod IN ('gorsel','gorsel_sanatlar','gorsel-sanatlar') OR d.ad='Görsel Sanatlar')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Doğal Malzemelerle Kolaj Yapıyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Yapay Malzemelerle Kolaj Yapıyorum','Kolaj','✂️','Renkli kâğıt, karton ve kumaş parçaları gibi güvenli yapay malzemelerle de kolaj yapabiliriz.','Renkli kâğıt parçalarını kesip bir ev şekli oluşturabiliriz.','Hangisi yapay bir kolaj malzemesidir?','["Renkli kâğıt","Yaprak","Taş","Dal"]',0,'Renkli kâğıt insanlar tarafından üretilmiş yapay bir malzemedir.',204,1
FROM dersler d
WHERE (d.kod IN ('gorsel','gorsel_sanatlar','gorsel-sanatlar') OR d.ad='Görsel Sanatlar')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Yapay Malzemelerle Kolaj Yapıyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Büyük ve Küçük Şekiller Kullanıyorum','Boyut','🔵','Resimlerde aynı şekli farklı büyüklüklerde kullanabiliriz. Büyük ve küçük şekiller resme çeşitlilik katar.','Büyük bir daireyi güneş, küçük daireleri balon olarak kullanabiliriz.','Hangisi boyut bildirir?','["Büyük","Kırmızı","Yuvarlak","Yumuşak"]',0,'Büyük ve küçük sözcükleri bir nesnenin boyutunu anlatır.',205,1
FROM dersler d
WHERE (d.kod IN ('gorsel','gorsel_sanatlar','gorsel-sanatlar') OR d.ad='Görsel Sanatlar')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Büyük ve Küçük Şekiller Kullanıyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Duygumu Resimle Anlatıyorum','Duygu ve Sanat','😊','Renkler, çizgiler ve şekillerle bir duyguyu anlatabiliriz. Herkes aynı duyguyu farklı biçimde çizebilir.','Mutlu olduğumuz bir günü parlak renkler ve gülümseyen yüzlerle anlatabiliriz.','Mutluluğu anlatan bir resimde hangisini kullanmak uygun olabilir?','["Gülümseyen yüz","Kırık pencere zorunlu","Sadece siyah nokta","Hiçbir şey çizmemek"]',0,'Gülümseyen bir yüz mutluluk duygusunu anlatmak için kullanılabilir.',206,1
FROM dersler d
WHERE (d.kod IN ('gorsel','gorsel_sanatlar','gorsel-sanatlar') OR d.ad='Görsel Sanatlar')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Duygumu Resimle Anlatıyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Ses Kaynağını Buluyorum','Dinleme','🔔','Duyduğumuz sesin nereden geldiğini dikkatle dinleyerek tahmin edebiliriz. Her sesin bir kaynağı vardır.','Zil sesi duyduğumuzda sesin bir zilden geldiğini düşünebiliriz.','“Miyav” sesi hangi hayvandan gelir?','["Kedi","Kuş","İnek","Balık"]',0,'Miyav sesi kedilerin çıkardığı bir sestir.',201,1
FROM dersler d
WHERE (d.kod IN ('muzik') OR d.ad='Müzik')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Ses Kaynağını Buluyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Müzik Dinleme Kurallarını Uyguluyorum','Dinleme Kültürü','🎧','Müzik dinlerken çevremizdekileri rahatsız etmeyecek ses düzeyi kullanır ve dinleyen kişilere saygı gösteririz.','Sınıfta müzik dinlerken bağırmak yerine dikkatle dinlemek uygundur.','Müzik dinlerken hangisi doğru davranıştır?','["Dikkatle dinlemek","Bağırmak","Arkadaşını itmek","Sürekli konuşmak"]',0,'Dikkatle dinlemek hem müziği anlamamızı hem de başkalarına saygı göstermemizi sağlar.',202,1
FROM dersler d
WHERE (d.kod IN ('muzik') OR d.ad='Müzik')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Müzik Dinleme Kurallarını Uyguluyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Bedensel Ritim Yapıyorum','Ritim','👐','Alkış, dizlere vurma ve parmak şıklatma gibi beden sesleriyle ritim oluşturabiliriz.','Alkış-alkış-diz vuruşu şeklinde kısa bir ritim tekrar edilebilir.','Hangisi bedenimizle yapabileceğimiz bir ritim sesidir?','["Alkış","Araba kornası","Telefon zili","Kapı zili"]',0,'Alkış, ellerimizi kullanarak oluşturduğumuz bir beden sesidir.',203,1
FROM dersler d
WHERE (d.kod IN ('muzik') OR d.ad='Müzik')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Bedensel Ritim Yapıyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Tekerleme Ritmini Takip Ediyorum','Söz ve Ritim','🗣️','Tekerleme ve sayışmacaları belirli bir ritimle söyleyebiliriz. Kelimelerin vuruşlarını fark etmek ritim duygumuzu geliştirir.','“Bir, iki, üç” derken her kelimede bir alkış yapabiliriz.','“Bir, iki, üç” sözlerinde her kelimede bir alkış yaparsak kaç alkış olur?','["1","2","3","4"]',2,'Üç kelime vardır ve her kelimede bir alkış yaptığımız için toplam 3 alkış olur.',204,1
FROM dersler d
WHERE (d.kod IN ('muzik') OR d.ad='Müzik')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Tekerleme Ritmini Takip Ediyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'İstiklâl Marşı''nı Saygıyla Dinliyorum','Millî Değerler','🇹🇷','İstiklâl Marşı söylenirken veya dinlenirken saygılı ve dikkatli dururuz. Bu davranış ortak değerlerimize saygımızı gösterir.','İstiklâl Marşı sırasında konuşmak yerine sessiz ve saygılı dururuz.','İstiklâl Marşı dinlenirken hangisi uygundur?','["Saygılı ve dikkatli durmak","Koşmak","Bağırmak","Oyun oynamak"]',0,'İstiklâl Marşı sırasında saygılı ve dikkatli durmak uygun davranıştır.',205,1
FROM dersler d
WHERE (d.kod IN ('muzik') OR d.ad='Müzik')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='İstiklâl Marşı''nı Saygıyla Dinliyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Hareket Alanımı Tanıyorum','Alan Farkındalığı','📍','Hareket ederken çevremizdeki boşluğu ve diğer kişileri fark ederiz. Böylece çarpışmadan güvenli şekilde hareket edebiliriz.','Koşarken önümüzdeki arkadaşımıza yeterli mesafe bırakırız.','Koşarken neden çevremize dikkat etmeliyiz?','["Çarpışmamak için","Daha çok bağırmak için","Oyunu bırakmak için","Yere oturmak için"]',0,'Çevreyi fark etmek güvenli hareket etmemize yardımcı olur.',201,1
FROM dersler d
WHERE (d.kod IN ('beden','beden_egitimi','beden-egitimi','beden-egitimi-ve-oyun') OR d.ad='Beden Eğitimi ve Oyun')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Hareket Alanımı Tanıyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Güvenli Hareket Ediyorum','Güvenlik','🦺','Oyun alanındaki engellere, zemine ve arkadaşlarımıza dikkat ederiz. Tehlikeli bir hareket görürsek dururuz.','Islak zeminde hızlı koşmak yerine yavaşlamak daha güvenlidir.','Islak zeminde hangisini yapmak daha güvenlidir?','["Yavaş ve dikkatli yürümek","Çok hızlı koşmak","Zıplayarak gitmek","Arkadaşını çekmek"]',0,'Islak zemin kaygan olabilir. Yavaş ve dikkatli hareket etmek daha güvenlidir.',202,1
FROM dersler d
WHERE (d.kod IN ('beden','beden_egitimi','beden-egitimi','beden-egitimi-ve-oyun') OR d.ad='Beden Eğitimi ve Oyun')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Güvenli Hareket Ediyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Koşup Yön Değiştiriyorum','Yer Değiştirme','↩️','Koşarken verilen işarete göre sağa, sola ya da geriye yön değiştirebiliriz. Yön değiştirirken hızımızı kontrol ederiz.','Öğretmen “sola dön” dediğinde koşu hızımızı azaltıp sola yöneliriz.','Yön değiştirirken en doğru davranış hangisidir?','["Hızı kontrol etmek","Gözleri kapatmak","Arkadaşlara çarpmak","Durmadan bağırmak"]',0,'Hızı kontrol etmek yön değiştirirken dengemizi ve güvenliğimizi korur.',203,1
FROM dersler d
WHERE (d.kod IN ('beden','beden_egitimi','beden-egitimi','beden-egitimi-ve-oyun') OR d.ad='Beden Eğitimi ve Oyun')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Koşup Yön Değiştiriyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Sıçrayıp Güvenli İniyorum','Sıçrama','🦘','Sıçradıktan sonra dizlerimizi hafif bükerek dengeli ve yumuşak iniş yapmaya çalışırız.','Çift ayakla sıçrayıp iki ayağımızın üzerine dengeli inebiliriz.','Sıçradıktan sonra nasıl inmek daha uygundur?','["Dengeli ve kontrollü","Sertçe tek ayağa","Gözler kapalı","Arkadaşa çarparak"]',0,'Dengeli ve kontrollü iniş güvenliği artırır.',204,1
FROM dersler d
WHERE (d.kod IN ('beden','beden_egitimi','beden-egitimi','beden-egitimi-ve-oyun') OR d.ad='Beden Eğitimi ve Oyun')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Sıçrayıp Güvenli İniyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Atma ve Yakalamayı Kontrol Ediyorum','Nesne Kontrolü','🤾','Topu atarken hedefe bakar, yakalarken ellerimizi hazır tutarız. Uygun kuvvet kullanmak kontrolü kolaylaştırır.','Yakınımızdaki bir arkadaşımıza topu çok sert değil, kontrollü atarız.','Topu yakalarken ne yapmak uygundur?','["Ellerimizi hazır tutmak","Arkamızı dönmek","Gözlerimizi kapatmak","Topu görmezden gelmek"]',0,'Topu izlemek ve elleri hazır tutmak yakalamayı kolaylaştırır.',205,1
FROM dersler d
WHERE (d.kod IN ('beden','beden_egitimi','beden-egitimi','beden-egitimi-ve-oyun') OR d.ad='Beden Eğitimi ve Oyun')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Atma ve Yakalamayı Kontrol Ediyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Gölgesini Buluyorum','Görsel Eşleştirme','🌑','Bir nesnenin gölgesi, dış biçimine benzer. Ayrıntılardan çok genel şekle bakarak doğru gölgeyi bulabiliriz.','Bir topun gölgesi yuvarlak bir biçime benzer.','⚽ topunun gölgesi hangi şekle en çok benzer?','["Daire","Üçgen","Kare","Dikdörtgen"]',0,'Top yuvarlak olduğu için gölgesi de genel olarak daire biçimine benzer.',201,1
FROM dersler d
WHERE (d.kod IN ('serbest','serbest_etkinlikler','serbest-etkinlikler') OR d.ad='Serbest Etkinlikler')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Gölgesini Buluyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Parça ve Bütünü Eşleştiriyorum','Görsel Mantık','🧩','Bir nesnenin küçük bir parçasına bakarak bütünün ne olabileceğini tahmin edebiliriz.','Bir yapboz parçasında kedi kulağı görüyorsak bütün resmin kedi olabileceğini düşünebiliriz.','Bir resim parçasında tekerlek görüyorsan bütün resim hangisi olabilir?','["Araba","Ağaç","Balık","Bulut"]',0,'Tekerlek araba gibi araçların bir parçasıdır.',202,1
FROM dersler d
WHERE (d.kod IN ('serbest','serbest_etkinlikler','serbest-etkinlikler') OR d.ad='Serbest Etkinlikler')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Parça ve Bütünü Eşleştiriyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Labirentte Yön Buluyorum','Yön ve Dikkat','🧭','Labirentte başlangıçtan hedefe giderken yolları dikkatle inceler, çıkmaz sokaklardan geri döneriz.','Hedef sağ taraftaysa uygun bir yol bulduğumuzda sağa yönelmemiz gerekebilir.','Bir yol çıkmazsa ne yapmalıyız?','["Geri dönüp başka yol denemeliyiz","Duvarın içinden geçmeliyiz","Oyunu kapatmalıyız","Rastgele işaretlemeliyiz"]',0,'Çıkmaz yolda geri dönüp başka bir yol denemek doğru stratejidir.',203,1
FROM dersler d
WHERE (d.kod IN ('serbest','serbest_etkinlikler','serbest-etkinlikler') OR d.ad='Serbest Etkinlikler')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Labirentte Yön Buluyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Olay Kartlarını Sıralıyorum','Sıralama','🗂️','Bir olayın adımlarını başlangıçtan sona doğru sıralayabiliriz. Mantıklı sıra olayın anlaşılmasını kolaylaştırır.','Tohum ekme süreci: toprağı hazırla, tohumu ek, su ver.','Hangisi doğru sıradır?','["Tohumu ek → su ver → büyümesini bekle","Büyümesini bekle → tohumu ek → su ver","Su ver → hiç tohum ekleme → bekle","Büyümüş bitki → tohum → toprak"]',0,'Önce tohum ekilir, sonra sulanır ve büyümesi beklenir.',204,1
FROM dersler d
WHERE (d.kod IN ('serbest','serbest_etkinlikler','serbest-etkinlikler') OR d.ad='Serbest Etkinlikler')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Olay Kartlarını Sıralıyorum')
ORDER BY d.id LIMIT 1;

INSERT INTO ders_modulleri (ders_id,baslik,alt_baslik,emoji,okuma_metni,ornek_metni,soru,secenekler_json,dogru_cevap_indeksi,aciklama,sira,aktif)
SELECT d.id,'Ses Hafızamı Çalıştırıyorum','Hafıza','🔊','Kısa bir ses dizisini dinleyip sırasını hatırlamaya çalışmak işitsel hafızamızı çalıştırır.','“Alkış - zil - alkış” dizisini dinledikten sonra sırayı tekrar edebiliriz.','“Alkış - zil - alkış” dizisinde ortadaki ses hangisidir?','["Alkış","Zil","Davul","Sessizlik"]',1,'Verilen üçlüde ikinci, yani ortadaki ses zildir.',205,1
FROM dersler d
WHERE (d.kod IN ('serbest','serbest_etkinlikler','serbest-etkinlikler') OR d.ad='Serbest Etkinlikler')
AND NOT EXISTS (SELECT 1 FROM ders_modulleri dm WHERE dm.ders_id=d.id AND dm.baslik='Ses Hafızamı Çalıştırıyorum')
ORDER BY d.id LIMIT 1;

