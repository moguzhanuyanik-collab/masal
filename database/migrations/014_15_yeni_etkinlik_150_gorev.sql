SET NAMES utf8mb4;

INSERT INTO etkinlik_oyunlari (kod,ad,emoji,kategori,sure,renk,aciklama,sira,aktif)
VALUES ('eksik_harfi_bul','Eksik Harfi Bul','🔎','Türkçe & harf','3–4 dk','#f6e8ff','Eksik harfi tamamla, kelimeyi bul.',11,1)
ON DUPLICATE KEY UPDATE ad=VALUES(ad),emoji=VALUES(emoji),kategori=VALUES(kategori),sure=VALUES(sure),renk=VALUES(renk),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,1,'_lma','Elma kelimesinin eksik harfi hangisidir?','["E","A","K","M"]',0,'E','E harfi gelince Elma olur.',1
FROM etkinlik_oyunlari WHERE kod='eksik_harfi_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,2,'k_di','Kedi kelimesinin eksik harfi hangisidir?','["a","e","i","o"]',1,'e','Kedi kelimesinde ikinci harf e''dir.',1
FROM etkinlik_oyunlari WHERE kod='eksik_harfi_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,3,'o_ul','Okul kelimesinin eksik harfi hangisidir?','["k","l","m","n"]',0,'k','O ile ul arasına k gelir: okul.',1
FROM etkinlik_oyunlari WHERE kod='eksik_harfi_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,4,'ma_a','Masa kelimesinin eksik harfi hangisidir?','["s","ş","z","r"]',0,'s','Ma ile a arasına s gelir: masa.',1
FROM etkinlik_oyunlari WHERE kod='eksik_harfi_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,5,'ka_em','Kalem kelimesinin eksik harfi hangisidir?','["l","r","n","t"]',0,'l','Ka ile em arasına l gelir: kalem.',1
FROM etkinlik_oyunlari WHERE kod='eksik_harfi_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,6,'_üneş','Güneş kelimesinin eksik harfi hangisidir?','["G","K","Y","S"]',0,'G','G harfi gelince Güneş olur.',1
FROM etkinlik_oyunlari WHERE kod='eksik_harfi_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,7,'çi_ek','Çiçek kelimesinin eksik harfi hangisidir?','["ç","c","t","n"]',0,'ç','Çiçek kelimesinde ortadaki ses ç''dir.',1
FROM etkinlik_oyunlari WHERE kod='eksik_harfi_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,8,'b_lık','Balık kelimesinin eksik harfi hangisidir?','["a","e","ı","o"]',0,'a','B ile lık arasına a gelir: balık.',1
FROM etkinlik_oyunlari WHERE kod='eksik_harfi_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,9,'def_er','Defter kelimesinin eksik harfi hangisidir?','["t","d","k","p"]',0,'t','Defter kelimesinin eksik harfi t''dir.',1
FROM etkinlik_oyunlari WHERE kod='eksik_harfi_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,10,'ara_a','Araba kelimesinin eksik harfi hangisidir?','["b","p","m","v"]',0,'b','Ara ile a arasına b gelir: araba.',1
FROM etkinlik_oyunlari WHERE kod='eksik_harfi_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;

INSERT INTO etkinlik_oyunlari (kod,ad,emoji,kategori,sure,renk,aciklama,sira,aktif)
VALUES ('kelimeyi_hecele','Kelimeyi Hecele','🧱','Türkçe & hece','3–4 dk','#ffe9f0','Kelimeyi doğru hecelerine ayır.',12,1)
ON DUPLICATE KEY UPDATE ad=VALUES(ad),emoji=VALUES(emoji),kategori=VALUES(kategori),sure=VALUES(sure),renk=VALUES(renk),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,1,'KALEM','Kalem kelimesi nasıl hecelenir?','["ka-lem","kal-em","k-a-lem","kale-m"]',0,'ka-lem','Kalem iki hecedir: ka-lem.',1
FROM etkinlik_oyunlari WHERE kod='kelimeyi_hecele'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,2,'ARABA','Araba kelimesi nasıl hecelenir?','["a-ra-ba","ar-a-ba","ara-ba","a-rab-a"]',0,'a-ra-ba','Araba üç hecedir: a-ra-ba.',1
FROM etkinlik_oyunlari WHERE kod='kelimeyi_hecele'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,3,'OKUL','Okul kelimesi nasıl hecelenir?','["o-kul","ok-ul","o-ku-l","oku-l"]',0,'o-kul','Okul iki hecedir: o-kul.',1
FROM etkinlik_oyunlari WHERE kod='kelimeyi_hecele'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,4,'MASA','Masa kelimesi nasıl hecelenir?','["ma-sa","mas-a","m-a-sa","masa"]',0,'ma-sa','Masa iki hecedir: ma-sa.',1
FROM etkinlik_oyunlari WHERE kod='kelimeyi_hecele'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,5,'KİTAP','Kitap kelimesi nasıl hecelenir?','["ki-tap","kit-ap","k-i-tap","kita-p"]',0,'ki-tap','Kitap iki hecedir: ki-tap.',1
FROM etkinlik_oyunlari WHERE kod='kelimeyi_hecele'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,6,'ÇİÇEK','Çiçek kelimesi nasıl hecelenir?','["çi-çek","çiç-ek","ç-i-çek","çiçe-k"]',0,'çi-çek','Çiçek iki hecedir: çi-çek.',1
FROM etkinlik_oyunlari WHERE kod='kelimeyi_hecele'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,7,'BALIK','Balık kelimesi nasıl hecelenir?','["ba-lık","bal-ık","b-a-lık","balı-k"]',0,'ba-lık','Balık iki hecedir: ba-lık.',1
FROM etkinlik_oyunlari WHERE kod='kelimeyi_hecele'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,8,'OYUNCAK','Oyuncak kelimesi nasıl hecelenir?','["o-yun-cak","oy-un-cak","o-yunca-k","oyun-cak"]',0,'o-yun-cak','Oyuncak üç hecedir: o-yun-cak.',1
FROM etkinlik_oyunlari WHERE kod='kelimeyi_hecele'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,9,'KELEBEK','Kelebek kelimesi nasıl hecelenir?','["ke-le-bek","kel-e-bek","ke-lebe-k","kele-bek"]',0,'ke-le-bek','Kelebek üç hecedir: ke-le-bek.',1
FROM etkinlik_oyunlari WHERE kod='kelimeyi_hecele'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,10,'PATATES','Patates kelimesi nasıl hecelenir?','["pa-ta-tes","pat-a-tes","pa-tat-es","pata-tes"]',0,'pa-ta-tes','Patates üç hecedir: pa-ta-tes.',1
FROM etkinlik_oyunlari WHERE kod='kelimeyi_hecele'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;

INSERT INTO etkinlik_oyunlari (kod,ad,emoji,kategori,sure,renk,aciklama,sira,aktif)
VALUES ('cumleyi_tamamla','Cümleyi Tamamla','📝','Türkçe & cümle','3–4 dk','#e8f4ff','Eksik kelimeyi seç, cümleyi tamamla.',13,1)
ON DUPLICATE KEY UPDATE ad=VALUES(ad),emoji=VALUES(emoji),kategori=VALUES(kategori),sure=VALUES(sure),renk=VALUES(renk),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,1,'Ali ___ içiyor.','Ali süt içiyor. Cümlesindeki eksik kelime hangisidir?','["süt","top","masa","mavi"]',0,'süt','Ali süt içiyor anlamlı bir cümledir.',1
FROM etkinlik_oyunlari WHERE kod='cumleyi_tamamla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,2,'Kedi ___ uyuyor.','Kedi nerede uyuyor olabilir?','["sepette","koşuyor","sarı","üç"]',0,'sepette','Kedi sepette uyuyor cümlesi anlamlıdır.',1
FROM etkinlik_oyunlari WHERE kod='cumleyi_tamamla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,3,'Ayşe kitap ___.','Cümleyi hangi kelime tamamlar?','["okuyor","mavi","kalem","üç"]',0,'okuyor','Ayşe kitap okuyor doğru ve anlamlıdır.',1
FROM etkinlik_oyunlari WHERE kod='cumleyi_tamamla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,4,'Kuş gökyüzünde ___.','Cümleyi hangi kelime tamamlar?','["uçuyor","yazıyor","içiyor","boyuyor"]',0,'uçuyor','Kuş gökyüzünde uçuyor.',1
FROM etkinlik_oyunlari WHERE kod='cumleyi_tamamla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,5,'Babam araba ___.','Cümleyi hangi kelime tamamlar?','["kullanıyor","okuyor","yiyor","çiziyor"]',0,'kullanıyor','Babam araba kullanıyor.',1
FROM etkinlik_oyunlari WHERE kod='cumleyi_tamamla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,6,'Ben okula ___.','Cümleyi hangi kelime tamamlar?','["gidiyorum","uyuyorum","yüzüyorum","uçuyorum"]',0,'gidiyorum','Ben okula gidiyorum.',1
FROM etkinlik_oyunlari WHERE kod='cumleyi_tamamla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,7,'Balık suda ___.','Cümleyi hangi kelime tamamlar?','["yüzüyor","koşuyor","uçuyor","yazıyor"]',0,'yüzüyor','Balık suda yüzüyor.',1
FROM etkinlik_oyunlari WHERE kod='cumleyi_tamamla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,8,'Annem yemek ___.','Cümleyi hangi kelime tamamlar?','["yapıyor","uçuyor","zıplıyor","okuyor"]',0,'yapıyor','Annem yemek yapıyor.',1
FROM etkinlik_oyunlari WHERE kod='cumleyi_tamamla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,9,'Çocuk top ___.','Cümleyi hangi kelime tamamlar?','["oynuyor","okuyor","içiyor","uyuyor"]',0,'oynuyor','Çocuk top oynuyor.',1
FROM etkinlik_oyunlari WHERE kod='cumleyi_tamamla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,10,'Güneş gökyüzünde ___.','Cümleyi hangi kelime tamamlar?','["parlıyor","yürüyor","okuyor","yiyor"]',0,'parlıyor','Güneş gökyüzünde parlıyor.',1
FROM etkinlik_oyunlari WHERE kod='cumleyi_tamamla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;

INSERT INTO etkinlik_oyunlari (kod,ad,emoji,kategori,sure,renk,aciklama,sira,aktif)
VALUES ('dogru_cumleyi_bul','Doğru Cümleyi Bul','🖼️','Türkçe & anlama','3–4 dk','#fff2dc','Görsele uygun cümleyi seç.',14,1)
ON DUPLICATE KEY UPDATE ad=VALUES(ad),emoji=VALUES(emoji),kategori=VALUES(kategori),sure=VALUES(sure),renk=VALUES(renk),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,1,'🐱 💤','Görsele uygun cümle hangisidir?','["Kedi uyuyor.","Kedi uçuyor.","Kedi kitap okuyor.","Kedi araba sürüyor."]',0,'Kedi uyuyor.','Uyuyan kedi görseline uygun cümle budur.',1
FROM etkinlik_oyunlari WHERE kod='dogru_cumleyi_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,2,'👧 📚','Görsele uygun cümle hangisidir?','["Kız kitap okuyor.","Kız top oynuyor.","Kız uyuyor.","Kız yüzüyor."]',0,'Kız kitap okuyor.','Görselde kız ve kitap vardır.',1
FROM etkinlik_oyunlari WHERE kod='dogru_cumleyi_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,3,'🐦 🌳','Görsele uygun cümle hangisidir?','["Kuş ağaçta.","Balık denizde.","Araba yolda.","Çocuk okulda."]',0,'Kuş ağaçta.','Görsel kuş ve ağacı gösterir.',1
FROM etkinlik_oyunlari WHERE kod='dogru_cumleyi_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,4,'🚗 🛣️','Görsele uygun cümle hangisidir?','["Araba yolda gidiyor.","Araba suda yüzüyor.","Araba uçuyor.","Araba kitap okuyor."]',0,'Araba yolda gidiyor.','Araba yol üzerinde gider.',1
FROM etkinlik_oyunlari WHERE kod='dogru_cumleyi_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,5,'🍎 👦','Görsele uygun cümle hangisidir?','["Çocuk elma yiyor.","Çocuk uyuyor.","Çocuk yazıyor.","Çocuk uçuyor."]',0,'Çocuk elma yiyor.','Görselde çocuk ve elma vardır.',1
FROM etkinlik_oyunlari WHERE kod='dogru_cumleyi_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,6,'🐟 💧','Görsele uygun cümle hangisidir?','["Balık suda yüzüyor.","Balık ağaçta uçuyor.","Balık kitap okuyor.","Balık top oynuyor."]',0,'Balık suda yüzüyor.','Balık suda yaşar ve yüzer.',1
FROM etkinlik_oyunlari WHERE kod='dogru_cumleyi_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,7,'☀️ 🌼','Görsele uygun cümle hangisidir?','["Güneş çiçekleri aydınlatıyor.","Kar yağıyor.","Gece oldu.","Çiçekler uçuyor."]',0,'Güneş çiçekleri aydınlatıyor.','Görselde güneş ve çiçekler var.',1
FROM etkinlik_oyunlari WHERE kod='dogru_cumleyi_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,8,'👦 ⚽','Görsele uygun cümle hangisidir?','["Çocuk top oynuyor.","Çocuk kitap okuyor.","Çocuk yemek yapıyor.","Çocuk uyuyor."]',0,'Çocuk top oynuyor.','Topla oynayan çocuk görülüyor.',1
FROM etkinlik_oyunlari WHERE kod='dogru_cumleyi_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,9,'🏠 🌳','Görsele uygun cümle hangisidir?','["Evin yanında ağaç var.","Ev denizde yüzüyor.","Ağaç araba sürüyor.","Ev uçuyor."]',0,'Evin yanında ağaç var.','Görselde ev ve ağaç birlikte bulunuyor.',1
FROM etkinlik_oyunlari WHERE kod='dogru_cumleyi_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,10,'👩 🍲','Görsele uygun cümle hangisidir?','["Kadın yemek yapıyor.","Kadın uçuyor.","Kadın top oynuyor.","Kadın yüzüyor."]',0,'Kadın yemek yapıyor.','Görsel yemek hazırlamayı anlatır.',1
FROM etkinlik_oyunlari WHERE kod='dogru_cumleyi_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;

INSERT INTO etkinlik_oyunlari (kod,ad,emoji,kategori,sure,renk,aciklama,sira,aktif)
VALUES ('hikayeyi_sirala','Hikâyeyi Sırala','📚','Türkçe & sıralama','4–5 dk','#efe8ff','Olayların doğru sırasını bul.',15,1)
ON DUPLICATE KEY UPDATE ad=VALUES(ad),emoji=VALUES(emoji),kategori=VALUES(kategori),sure=VALUES(sure),renk=VALUES(renk),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,1,'1) Uyanmak  2) Kahvaltı  3) Okula gitmek','Sabah önce ne yapılır?','["Uyanmak","Kahvaltı yapmak","Okula gitmek","Uyumak"]',0,'Uyanmak','Sabah sıralaması uyanmakla başlar.',1
FROM etkinlik_oyunlari WHERE kod='hikayeyi_sirala'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,2,'1) Tohum ekmek  2) Sulamak  3) Filiz çıkması','Tohum ekildikten sonra ne yapılır?','["Sulamak","Filizi koparmak","Uyumak","Kitap okumak"]',0,'Sulamak','Tohumdan sonra sulama yapılır.',1
FROM etkinlik_oyunlari WHERE kod='hikayeyi_sirala'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,3,'1) Eller kirlenir  2) Eller yıkanır  3) Kurulanır','Eller yıkandıktan sonra ne yapılır?','["Kurulanır","Kirletilir","Boyanır","Top oynanır"]',0,'Kurulanır','Yıkanan eller temiz bir havluyla kurulanır.',1
FROM etkinlik_oyunlari WHERE kod='hikayeyi_sirala'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,4,'1) Yağmur başlar  2) Şemsiye açılır  3) Yürümeye devam edilir','Yağmur başlayınca önce ne yapılır?','["Şemsiye açılır","Uyumaya gidilir","Top oynanır","Kitap kapatılır"]',0,'Şemsiye açılır','Yağmurda şemsiye açmak uygundur.',1
FROM etkinlik_oyunlari WHERE kod='hikayeyi_sirala'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,5,'1) Kitap açılır  2) Okunur  3) Yerine konur','Kitap okunduktan sonra ne yapılır?','["Yerine konur","Yırtılır","Saklanır","Islatılır"]',0,'Yerine konur','Kitap işimiz bitince yerine konur.',1
FROM etkinlik_oyunlari WHERE kod='hikayeyi_sirala'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,6,'1) Diş macunu sürülür  2) Dişler fırçalanır  3) Ağız çalkalanır','Diş macunundan sonra ne yapılır?','["Dişler fırçalanır","Ayakkabı giyilir","Kitap okunur","Top oynanır"]',0,'Dişler fırçalanır','Macundan sonra dişler fırçalanır.',1
FROM etkinlik_oyunlari WHERE kod='hikayeyi_sirala'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,7,'1) Hamur hazırlanır  2) Fırına verilir  3) Pişer','Hamur hazırlandıktan sonra ne olur?','["Fırına verilir","Dondurulur","Yıkanır","Boyanır"]',0,'Fırına verilir','Pişmesi için hamur fırına verilir.',1
FROM etkinlik_oyunlari WHERE kod='hikayeyi_sirala'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,8,'1) Çanta hazırlanır  2) Evden çıkılır  3) Okula varılır','Okula varmadan hemen önce ne yapılır?','["Evden çıkılır","Uyumaya gidilir","Televizyon açılır","Yemek yapılır"]',0,'Evden çıkılır','Evden çıktıktan sonra okula gidilir.',1
FROM etkinlik_oyunlari WHERE kod='hikayeyi_sirala'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,9,'1) Oyuncaklar çıkarılır  2) Oyun oynanır  3) Oyuncaklar toplanır','Oyun bitince ne yapılır?','["Oyuncaklar toplanır","Oyuncaklar atılır","Uyunur","Ders kitabı yırtılır"]',0,'Oyuncaklar toplanır','Oyun sonunda oyuncakları toplamak düzenlidir.',1
FROM etkinlik_oyunlari WHERE kod='hikayeyi_sirala'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,10,'1) Meyve yıkanır  2) Soyulur  3) Yenir','Meyveyi yemeden önce ilk ne yapılır?','["Yıkanır","Yere bırakılır","Boyanır","Saklanır"]',0,'Yıkanır','Meyveyi yemeden önce yıkamak gerekir.',1
FROM etkinlik_oyunlari WHERE kod='hikayeyi_sirala'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;

INSERT INTO etkinlik_oyunlari (kod,ad,emoji,kategori,sure,renk,aciklama,sira,aktif)
VALUES ('hangisi_fazla','Hangisi Fazla?','⚖️','Matematik & karşılaştırma','3–4 dk','#e7f6ef','Grupları karşılaştır, fazla olanı seç.',16,1)
ON DUPLICATE KEY UPDATE ad=VALUES(ad),emoji=VALUES(emoji),kategori=VALUES(kategori),sure=VALUES(sure),renk=VALUES(renk),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,1,'🍎🍎🍎  |  🍐🍐','Hangi meyveden daha fazla var?','["Elma","Armut","Eşit","Hiçbiri"]',0,'Elma','3 elma, 2 armuttan fazladır.',1
FROM etkinlik_oyunlari WHERE kod='hangisi_fazla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,2,'⭐️⭐️  |  ❤️❤️❤️','Hangisi daha fazla?','["Yıldız","Kalp","Eşit","Hiçbiri"]',1,'Kalp','3 kalp, 2 yıldızdan fazladır.',1
FROM etkinlik_oyunlari WHERE kod='hangisi_fazla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,3,'🐟🐟🐟🐟  |  🐢🐢🐢','Hangi hayvandan daha fazla var?','["Balık","Kaplumbağa","Eşit","Hiçbiri"]',0,'Balık','4 balık, 3 kaplumbağadan fazladır.',1
FROM etkinlik_oyunlari WHERE kod='hangisi_fazla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,4,'⚽⚽  |  🏀🏀','Hangisi daha fazla?','["Futbol topu","Basketbol topu","Eşit","Hiçbiri"]',2,'Eşit','İki grupta da 2 top vardır.',1
FROM etkinlik_oyunlari WHERE kod='hangisi_fazla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,5,'🌼🌼🌼🌼🌼  |  🌷🌷🌷','Hangi çiçek daha fazla?','["Papatya","Lale","Eşit","Hiçbiri"]',0,'Papatya','5 papatya, 3 laleden fazladır.',1
FROM etkinlik_oyunlari WHERE kod='hangisi_fazla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,6,'🚗🚗🚗  |  🚲🚲🚲🚲','Hangisi daha fazla?','["Araba","Bisiklet","Eşit","Hiçbiri"]',1,'Bisiklet','4 bisiklet, 3 arabadan fazladır.',1
FROM etkinlik_oyunlari WHERE kod='hangisi_fazla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,7,'🍪🍪🍪🍪  |  🧁🧁','Hangisi daha fazla?','["Kurabiye","Kek","Eşit","Hiçbiri"]',0,'Kurabiye','4 kurabiye, 2 kekten fazladır.',1
FROM etkinlik_oyunlari WHERE kod='hangisi_fazla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,8,'📘📘📘  |  ✏️✏️✏️','Hangisi daha fazla?','["Kitap","Kalem","Eşit","Hiçbiri"]',2,'Eşit','İki grupta da 3 nesne vardır.',1
FROM etkinlik_oyunlari WHERE kod='hangisi_fazla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,9,'🐶🐶  |  🐱🐱🐱','Hangi hayvandan daha fazla var?','["Köpek","Kedi","Eşit","Hiçbiri"]',1,'Kedi','3 kedi, 2 köpekten fazladır.',1
FROM etkinlik_oyunlari WHERE kod='hangisi_fazla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,10,'🍌🍌🍌🍌  |  🍓🍓🍓🍓🍓','Hangi meyve daha fazla?','["Muz","Çilek","Eşit","Hiçbiri"]',1,'Çilek','5 çilek, 4 muzdan fazladır.',1
FROM etkinlik_oyunlari WHERE kod='hangisi_fazla'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;

INSERT INTO etkinlik_oyunlari (kod,ad,emoji,kategori,sure,renk,aciklama,sira,aktif)
VALUES ('eksik_sayi','Eksik Sayıyı Bul','🧮','Matematik & sayı','3–4 dk','#e7efff','Sayı sırasındaki eksik sayıyı bul.',17,1)
ON DUPLICATE KEY UPDATE ad=VALUES(ad),emoji=VALUES(emoji),kategori=VALUES(kategori),sure=VALUES(sure),renk=VALUES(renk),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,1,'1, 2, ?, 4','Eksik sayı hangisidir?','["2","3","4","5"]',1,'3','1, 2, 3, 4 şeklinde ilerler.',1
FROM etkinlik_oyunlari WHERE kod='eksik_sayi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,2,'5, 6, ?, 8','Eksik sayı hangisidir?','["6","7","8","9"]',1,'7','5, 6, 7, 8.',1
FROM etkinlik_oyunlari WHERE kod='eksik_sayi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,3,'9, ?, 11, 12','Eksik sayı hangisidir?','["8","9","10","11"]',2,'10','9''dan sonra 10 gelir.',1
FROM etkinlik_oyunlari WHERE kod='eksik_sayi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,4,'13, 14, ?, 16','Eksik sayı hangisidir?','["14","15","16","17"]',1,'15','13, 14, 15, 16.',1
FROM etkinlik_oyunlari WHERE kod='eksik_sayi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,5,'17, ?, 19, 20','Eksik sayı hangisidir?','["16","17","18","19"]',2,'18','17 ile 19 arasında 18 vardır.',1
FROM etkinlik_oyunlari WHERE kod='eksik_sayi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,6,'2, 4, ?, 8','İkişer ritmik saymada eksik sayı hangisidir?','["5","6","7","8"]',1,'6','2, 4, 6, 8.',1
FROM etkinlik_oyunlari WHERE kod='eksik_sayi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,7,'5, 10, ?, 20','Beşer ritmik saymada eksik sayı hangisidir?','["12","15","18","20"]',1,'15','5, 10, 15, 20.',1
FROM etkinlik_oyunlari WHERE kod='eksik_sayi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,8,'20, 19, ?, 17','Geri saymada eksik sayı hangisidir?','["16","17","18","19"]',2,'18','20, 19, 18, 17.',1
FROM etkinlik_oyunlari WHERE kod='eksik_sayi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,9,'10, 9, ?, 7','Geri saymada eksik sayı hangisidir?','["6","7","8","9"]',2,'8','10, 9, 8, 7.',1
FROM etkinlik_oyunlari WHERE kod='eksik_sayi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,10,'0, 1, ?, 3','Eksik sayı hangisidir?','["1","2","3","4"]',1,'2','0, 1, 2, 3.',1
FROM etkinlik_oyunlari WHERE kod='eksik_sayi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;

INSERT INTO etkinlik_oyunlari (kod,ad,emoji,kategori,sure,renk,aciklama,sira,aktif)
VALUES ('toplama_makinesi','Toplama Makinesi','➕','Matematik & toplama','3–4 dk','#fff0db','Nesneleri ve sayıları birleştir, toplamı bul.',18,1)
ON DUPLICATE KEY UPDATE ad=VALUES(ad),emoji=VALUES(emoji),kategori=VALUES(kategori),sure=VALUES(sure),renk=VALUES(renk),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,1,'2 + 3','2 ile 3''ün toplamı kaçtır?','["4","5","6","7"]',1,'5','2 + 3 = 5.',1
FROM etkinlik_oyunlari WHERE kod='toplama_makinesi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,2,'4 + 2','4 ile 2''nin toplamı kaçtır?','["5","6","7","8"]',1,'6','4 + 2 = 6.',1
FROM etkinlik_oyunlari WHERE kod='toplama_makinesi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,3,'1 + 6','1 ile 6''nın toplamı kaçtır?','["6","7","8","9"]',1,'7','1 + 6 = 7.',1
FROM etkinlik_oyunlari WHERE kod='toplama_makinesi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,4,'5 + 3','5 ile 3''ün toplamı kaçtır?','["7","8","9","10"]',1,'8','5 + 3 = 8.',1
FROM etkinlik_oyunlari WHERE kod='toplama_makinesi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,5,'7 + 2','7 ile 2''nin toplamı kaçtır?','["8","9","10","11"]',1,'9','7 + 2 = 9.',1
FROM etkinlik_oyunlari WHERE kod='toplama_makinesi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,6,'4 + 5','4 ile 5''in toplamı kaçtır?','["8","9","10","11"]',1,'9','4 + 5 = 9.',1
FROM etkinlik_oyunlari WHERE kod='toplama_makinesi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,7,'6 + 4','6 ile 4''ün toplamı kaçtır?','["9","10","11","12"]',1,'10','6 + 4 = 10.',1
FROM etkinlik_oyunlari WHERE kod='toplama_makinesi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,8,'3 + 7','3 ile 7''nin toplamı kaçtır?','["9","10","11","12"]',1,'10','3 + 7 = 10.',1
FROM etkinlik_oyunlari WHERE kod='toplama_makinesi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,9,'8 + 3','8 ile 3''ün toplamı kaçtır?','["10","11","12","13"]',1,'11','8 + 3 = 11.',1
FROM etkinlik_oyunlari WHERE kod='toplama_makinesi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,10,'9 + 5','9 ile 5''in toplamı kaçtır?','["13","14","15","16"]',1,'14','9 + 5 = 14.',1
FROM etkinlik_oyunlari WHERE kod='toplama_makinesi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;

INSERT INTO etkinlik_oyunlari (kod,ad,emoji,kategori,sure,renk,aciklama,sira,aktif)
VALUES ('cikarma_bahcesi','Çıkarma Bahçesi','➖','Matematik & çıkarma','3–4 dk','#eaf7e5','Eksilen nesneleri düşün, sonucu bul.',19,1)
ON DUPLICATE KEY UPDATE ad=VALUES(ad),emoji=VALUES(emoji),kategori=VALUES(kategori),sure=VALUES(sure),renk=VALUES(renk),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,1,'5 - 2','5''ten 2 çıkarılırsa kaç kalır?','["2","3","4","5"]',1,'3','5 - 2 = 3.',1
FROM etkinlik_oyunlari WHERE kod='cikarma_bahcesi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,2,'7 - 3','7''den 3 çıkarılırsa kaç kalır?','["3","4","5","6"]',1,'4','7 - 3 = 4.',1
FROM etkinlik_oyunlari WHERE kod='cikarma_bahcesi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,3,'9 - 4','9''dan 4 çıkarılırsa kaç kalır?','["4","5","6","7"]',1,'5','9 - 4 = 5.',1
FROM etkinlik_oyunlari WHERE kod='cikarma_bahcesi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,4,'8 - 2','8''den 2 çıkarılırsa kaç kalır?','["5","6","7","8"]',1,'6','8 - 2 = 6.',1
FROM etkinlik_oyunlari WHERE kod='cikarma_bahcesi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,5,'10 - 3','10''dan 3 çıkarılırsa kaç kalır?','["6","7","8","9"]',1,'7','10 - 3 = 7.',1
FROM etkinlik_oyunlari WHERE kod='cikarma_bahcesi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,6,'6 - 1','6''dan 1 çıkarılırsa kaç kalır?','["4","5","6","7"]',1,'5','6 - 1 = 5.',1
FROM etkinlik_oyunlari WHERE kod='cikarma_bahcesi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,7,'12 - 2','12''den 2 çıkarılırsa kaç kalır?','["9","10","11","12"]',1,'10','12 - 2 = 10.',1
FROM etkinlik_oyunlari WHERE kod='cikarma_bahcesi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,8,'15 - 5','15''ten 5 çıkarılırsa kaç kalır?','["9","10","11","12"]',1,'10','15 - 5 = 10.',1
FROM etkinlik_oyunlari WHERE kod='cikarma_bahcesi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,9,'11 - 4','11''den 4 çıkarılırsa kaç kalır?','["6","7","8","9"]',1,'7','11 - 4 = 7.',1
FROM etkinlik_oyunlari WHERE kod='cikarma_bahcesi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,10,'14 - 6','14''ten 6 çıkarılırsa kaç kalır?','["7","8","9","10"]',1,'8','14 - 6 = 8.',1
FROM etkinlik_oyunlari WHERE kod='cikarma_bahcesi'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;

INSERT INTO etkinlik_oyunlari (kod,ad,emoji,kategori,sure,renk,aciklama,sira,aktif)
VALUES ('buyuk_kucuk','Büyük mü Küçük mü?','🐘','Matematik & karşılaştırma','3–4 dk','#f3ebff','Sayıları karşılaştır, doğru ilişkiyi bul.',20,1)
ON DUPLICATE KEY UPDATE ad=VALUES(ad),emoji=VALUES(emoji),kategori=VALUES(kategori),sure=VALUES(sure),renk=VALUES(renk),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,1,'8 ? 5','8 ile 5 arasına hangi işaret gelir?','["<",">","=","+"]',1,'>','8, 5''ten büyüktür.',1
FROM etkinlik_oyunlari WHERE kod='buyuk_kucuk'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,2,'3 ? 7','3 ile 7 arasına hangi işaret gelir?','["<",">","=","-"]',0,'<','3, 7''den küçüktür.',1
FROM etkinlik_oyunlari WHERE kod='buyuk_kucuk'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,3,'6 ? 6','6 ile 6 arasına hangi işaret gelir?','["<",">","=","+"]',2,'=','İki sayı da 6 olduğu için eşittir.',1
FROM etkinlik_oyunlari WHERE kod='buyuk_kucuk'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,4,'12 ? 9','12 ile 9 arasına hangi işaret gelir?','["<",">","=","-"]',1,'>','12, 9''dan büyüktür.',1
FROM etkinlik_oyunlari WHERE kod='buyuk_kucuk'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,5,'4 ? 10','4 ile 10 arasına hangi işaret gelir?','["<",">","=","+"]',0,'<','4, 10''dan küçüktür.',1
FROM etkinlik_oyunlari WHERE kod='buyuk_kucuk'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,6,'15 ? 15','15 ile 15 arasına hangi işaret gelir?','["<",">","=","-"]',2,'=','İki sayı eşittir.',1
FROM etkinlik_oyunlari WHERE kod='buyuk_kucuk'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,7,'18 ? 13','18 ile 13 arasına hangi işaret gelir?','["<",">","=","+"]',1,'>','18, 13''ten büyüktür.',1
FROM etkinlik_oyunlari WHERE kod='buyuk_kucuk'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,8,'2 ? 11','2 ile 11 arasına hangi işaret gelir?','["<",">","=","-"]',0,'<','2, 11''den küçüktür.',1
FROM etkinlik_oyunlari WHERE kod='buyuk_kucuk'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,9,'20 ? 19','20 ile 19 arasına hangi işaret gelir?','["<",">","=","+"]',1,'>','20, 19''dan büyüktür.',1
FROM etkinlik_oyunlari WHERE kod='buyuk_kucuk'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,10,'1 ? 1','1 ile 1 arasına hangi işaret gelir?','["<",">","=","-"]',2,'=','1 ile 1 eşittir.',1
FROM etkinlik_oyunlari WHERE kod='buyuk_kucuk'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;

INSERT INTO etkinlik_oyunlari (kod,ad,emoji,kategori,sure,renk,aciklama,sira,aktif)
VALUES ('onluk_birlik','Onluk ve Birlik','🧊','Matematik & basamak','3–4 dk','#e9f7ff','Sayıları onluk ve birliklerine ayır.',21,1)
ON DUPLICATE KEY UPDATE ad=VALUES(ad),emoji=VALUES(emoji),kategori=VALUES(kategori),sure=VALUES(sure),renk=VALUES(renk),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,1,'14','14 sayısında kaç onluk vardır?','["0","1","2","4"]',1,'1 onluk','14 = 1 onluk ve 4 birliktir.',1
FROM etkinlik_oyunlari WHERE kod='onluk_birlik'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,2,'14','14 sayısında kaç birlik vardır?','["1","2","3","4"]',3,'4 birlik','14 = 1 onluk ve 4 birliktir.',1
FROM etkinlik_oyunlari WHERE kod='onluk_birlik'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,3,'18','18 sayısında kaç birlik vardır?','["6","7","8","9"]',2,'8 birlik','18 = 1 onluk ve 8 birliktir.',1
FROM etkinlik_oyunlari WHERE kod='onluk_birlik'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,4,'12','12 sayısı nasıl ayrılır?','["1 onluk 2 birlik","2 onluk 1 birlik","1 onluk 1 birlik","2 onluk 2 birlik"]',0,'1 onluk 2 birlik','12 = 10 + 2.',1
FROM etkinlik_oyunlari WHERE kod='onluk_birlik'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,5,'20','20 sayısı nasıl ayrılır?','["1 onluk 10 birlik","2 onluk 0 birlik","0 onluk 20 birlik","2 onluk 2 birlik"]',1,'2 onluk 0 birlik','20 = 2 onluk ve 0 birliktir.',1
FROM etkinlik_oyunlari WHERE kod='onluk_birlik'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,6,'16','16 sayısı nasıl ayrılır?','["1 onluk 6 birlik","6 onluk 1 birlik","1 onluk 5 birlik","2 onluk 6 birlik"]',0,'1 onluk 6 birlik','16 = 10 + 6.',1
FROM etkinlik_oyunlari WHERE kod='onluk_birlik'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,7,'11','11 sayısında kaç birlik vardır?','["0","1","2","11"]',1,'1 birlik','11 = 1 onluk ve 1 birliktir.',1
FROM etkinlik_oyunlari WHERE kod='onluk_birlik'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,8,'19','19 sayısında kaç birlik vardır?','["7","8","9","10"]',2,'9 birlik','19 = 1 onluk ve 9 birliktir.',1
FROM etkinlik_oyunlari WHERE kod='onluk_birlik'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,9,'10','10 sayısı nasıl ayrılır?','["1 onluk 0 birlik","0 onluk 10 birlik","1 onluk 1 birlik","2 onluk 0 birlik"]',0,'1 onluk 0 birlik','10 tam bir onluktur.',1
FROM etkinlik_oyunlari WHERE kod='onluk_birlik'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,10,'17','17 sayısı nasıl ayrılır?','["1 onluk 7 birlik","7 onluk 1 birlik","1 onluk 6 birlik","2 onluk 7 birlik"]',0,'1 onluk 7 birlik','17 = 10 + 7.',1
FROM etkinlik_oyunlari WHERE kod='onluk_birlik'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;

INSERT INTO etkinlik_oyunlari (kod,ad,emoji,kategori,sure,renk,aciklama,sira,aktif)
VALUES ('saati_bul','Saat Kaç?','🕐','Matematik & zaman','3–4 dk','#fff1e7','Tam saatleri tanı ve zamanı bul.',22,1)
ON DUPLICATE KEY UPDATE ad=VALUES(ad),emoji=VALUES(emoji),kategori=VALUES(kategori),sure=VALUES(sure),renk=VALUES(renk),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,1,'🕐','Saat kaç?','["1","2","3","4"]',0,'1','Akrep 1''i gösteriyor.',1
FROM etkinlik_oyunlari WHERE kod='saati_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,2,'🕑','Saat kaç?','["1","2","3","4"]',1,'2','Akrep 2''yi gösteriyor.',1
FROM etkinlik_oyunlari WHERE kod='saati_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,3,'🕒','Saat kaç?','["2","3","4","5"]',1,'3','Saat 3.',1
FROM etkinlik_oyunlari WHERE kod='saati_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,4,'🕓','Saat kaç?','["3","4","5","6"]',1,'4','Saat 4.',1
FROM etkinlik_oyunlari WHERE kod='saati_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,5,'🕔','Saat kaç?','["4","5","6","7"]',1,'5','Saat 5.',1
FROM etkinlik_oyunlari WHERE kod='saati_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,6,'🕕','Saat kaç?','["5","6","7","8"]',1,'6','Saat 6.',1
FROM etkinlik_oyunlari WHERE kod='saati_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,7,'🕖','Saat kaç?','["6","7","8","9"]',1,'7','Saat 7.',1
FROM etkinlik_oyunlari WHERE kod='saati_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,8,'🕗','Saat kaç?','["7","8","9","10"]',1,'8','Saat 8.',1
FROM etkinlik_oyunlari WHERE kod='saati_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,9,'🕘','Saat kaç?','["8","9","10","11"]',1,'9','Saat 9.',1
FROM etkinlik_oyunlari WHERE kod='saati_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,10,'🕙','Saat kaç?','["9","10","11","12"]',1,'10','Saat 10.',1
FROM etkinlik_oyunlari WHERE kod='saati_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;

INSERT INTO etkinlik_oyunlari (kod,ad,emoji,kategori,sure,renk,aciklama,sira,aktif)
VALUES ('sekli_yakala','Şekli Yakala','🔷','Matematik & geometri','3–4 dk','#edf0ff','Şekilleri özelliklerinden tanı.',23,1)
ON DUPLICATE KEY UPDATE ad=VALUES(ad),emoji=VALUES(emoji),kategori=VALUES(kategori),sure=VALUES(sure),renk=VALUES(renk),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,1,'●','Bu şeklin adı nedir?','["Daire","Kare","Üçgen","Dikdörtgen"]',0,'Daire','Daire yuvarlak bir şekildir.',1
FROM etkinlik_oyunlari WHERE kod='sekli_yakala'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,2,'■','Bu şeklin adı nedir?','["Daire","Kare","Üçgen","Dikdörtgen"]',1,'Kare','Karenin dört eşit kenarı vardır.',1
FROM etkinlik_oyunlari WHERE kod='sekli_yakala'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,3,'▲','Bu şeklin adı nedir?','["Daire","Kare","Üçgen","Dikdörtgen"]',2,'Üçgen','Üçgenin üç kenarı vardır.',1
FROM etkinlik_oyunlari WHERE kod='sekli_yakala'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,4,'▭','Bu şeklin adı nedir?','["Daire","Kare","Üçgen","Dikdörtgen"]',3,'Dikdörtgen','Dikdörtgenin dört kenarı vardır.',1
FROM etkinlik_oyunlari WHERE kod='sekli_yakala'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,5,'🔺','Üç kenarlı şekil hangisidir?','["Daire","Üçgen","Kare","Dikdörtgen"]',1,'Üçgen','Üç kenarlı şekil üçgendir.',1
FROM etkinlik_oyunlari WHERE kod='sekli_yakala'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,6,'⬜','Dört eşit kenarlı şekil hangisidir?','["Kare","Daire","Üçgen","Dikdörtgen"]',0,'Kare','Karenin dört kenarı eşittir.',1
FROM etkinlik_oyunlari WHERE kod='sekli_yakala'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,7,'⚪','Köşesi olmayan şekil hangisidir?','["Daire","Üçgen","Kare","Dikdörtgen"]',0,'Daire','Dairenin köşesi yoktur.',1
FROM etkinlik_oyunlari WHERE kod='sekli_yakala'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,8,'▭','İki uzun, iki kısa kenarı olan şekil hangisidir?','["Dikdörtgen","Daire","Üçgen","Kare"]',0,'Dikdörtgen','Dikdörtgende karşılıklı kenarlar eşittir.',1
FROM etkinlik_oyunlari WHERE kod='sekli_yakala'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,9,'▲ ■ ●','Ortadaki şekil hangisidir?','["Üçgen","Kare","Daire","Dikdörtgen"]',1,'Kare','Ortadaki şekil karedir.',1
FROM etkinlik_oyunlari WHERE kod='sekli_yakala'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,10,'● ▲ ■','İlk şekil hangisidir?','["Daire","Üçgen","Kare","Dikdörtgen"]',0,'Daire','İlk sırada daire vardır.',1
FROM etkinlik_oyunlari WHERE kod='sekli_yakala'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;

INSERT INTO etkinlik_oyunlari (kod,ad,emoji,kategori,sure,renk,aciklama,sira,aktif)
VALUES ('guvenli_davranis','Güvenli Davranış','🛡️','Hayat Bilgisi & güvenlik','3–4 dk','#e8f6ef','Günlük durumlarda güvenli seçimi yap.',24,1)
ON DUPLICATE KEY UPDATE ad=VALUES(ad),emoji=VALUES(emoji),kategori=VALUES(kategori),sure=VALUES(sure),renk=VALUES(renk),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,1,'🚦','Karşıya geçerken ne yapmalıyız?','["Yaya geçidini kullanmalıyız","Koşarak geçmeliyiz","Gözümüzü kapatmalıyız","Arabaların arasından geçmeliyiz"]',0,'Yaya geçidini kullanmalıyız','Yaya geçidi güvenli geçiş için kullanılır.',1
FROM etkinlik_oyunlari WHERE kod='guvenli_davranis'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,2,'🔌','Prizle ilgili güvenli davranış hangisidir?','["Prize yabancı cisim sokmamak","Prize kalem sokmak","Islak elle dokunmak","Prizle oynamak"]',0,'Prize yabancı cisim sokmamak','Elektrik prizleriyle oynamak tehlikelidir.',1
FROM etkinlik_oyunlari WHERE kod='guvenli_davranis'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,3,'🔥','Sıcak ocağa yaklaşınca ne yapmalıyız?','["Bir yetişkinden yardım istemeliyiz","Elimizi uzatmalıyız","Ocağa dokunmalıyız","Yanına oyuncak koymalıyız"]',0,'Bir yetişkinden yardım istemeliyiz','Sıcak yüzeylerden uzak durmak gerekir.',1
FROM etkinlik_oyunlari WHERE kod='guvenli_davranis'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,4,'✂️','Makas kullanırken ne yapmalıyız?','["Dikkatli kullanmalıyız","Koşarken taşımalıyız","Arkadaşımıza doğrultmalıyız","Havaya atmalıyız"]',0,'Dikkatli kullanmalıyız','Makas dikkatli kullanılmalıdır.',1
FROM etkinlik_oyunlari WHERE kod='guvenli_davranis'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,5,'🚗','Arabada güvenli davranış hangisidir?','["Emniyet kemeri takmak","Ayağa kalkmak","Kapıyı açmak","Koltuğun üstünde zıplamak"]',0,'Emniyet kemeri takmak','Emniyet kemeri güvenliği artırır.',1
FROM etkinlik_oyunlari WHERE kod='guvenli_davranis'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,6,'🧴','Tanımadığımız bir şişedeki sıvı için ne yapmalıyız?','["Bir yetişkine sormalıyız","İçmeliyiz","Koklamalıyız","Arkadaşımıza vermeliyiz"]',0,'Bir yetişkine sormalıyız','Tanımadığımız maddeleri kullanmamalıyız.',1
FROM etkinlik_oyunlari WHERE kod='guvenli_davranis'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,7,'🏊','Havuzda güvenli davranış hangisidir?','["Bir yetişkin gözetiminde olmak","Tek başına derine gitmek","Koşmak","Arkadaşını itmek"]',0,'Bir yetişkin gözetiminde olmak','Su kenarında yetişkin gözetimi önemlidir.',1
FROM etkinlik_oyunlari WHERE kod='guvenli_davranis'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,8,'🛗','Asansörde ne yapmalıyız?','["Sakin durmalıyız","Kapıyla oynamalıyız","Zıplamalıyız","Düğmelere sürekli basmalıyız"]',0,'Sakin durmalıyız','Asansörde sakin ve dikkatli olmak gerekir.',1
FROM etkinlik_oyunlari WHERE kod='guvenli_davranis'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,9,'🏫','Okul merdiveninde ne yapmalıyız?','["Yavaş yürümeliyiz","Koşmalıyız","Arkadaşımızı itmeliyiz","Korkuluğa çıkmalıyız"]',0,'Yavaş yürümeliyiz','Merdivende koşmak düşmeye yol açabilir.',1
FROM etkinlik_oyunlari WHERE kod='guvenli_davranis'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,10,'☎️','Acil durumda hangi numara aranır?','["112","1555","9999","1234"]',0,'112','Türkiye''de acil çağrı numarası 112''dir.',1
FROM etkinlik_oyunlari WHERE kod='guvenli_davranis'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;

INSERT INTO etkinlik_oyunlari (kod,ad,emoji,kategori,sure,renk,aciklama,sira,aktif)
VALUES ('duyguyu_bul','Duyguyu Bul','🙂','Hayat Bilgisi & duygular','3–4 dk','#fff0f3','Duruma uygun duyguyu tanı.',25,1)
ON DUPLICATE KEY UPDATE ad=VALUES(ad),emoji=VALUES(emoji),kategori=VALUES(kategori),sure=VALUES(sure),renk=VALUES(renk),aciklama=VALUES(aciklama),sira=VALUES(sira),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,1,'🎁','Doğum gününde sevdiğin bir hediye aldın. Nasıl hissedersin?','["Mutlu","Kızgın","Korkmuş","Üzgün"]',0,'Mutlu','Güzel bir sürpriz bizi mutlu edebilir.',1
FROM etkinlik_oyunlari WHERE kod='duyguyu_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,2,'🌩️','Çok yüksek bir gök gürültüsü duydun. Nasıl hissedebilirsin?','["Korkmuş","Mutlu","Gururlu","Uykulu"]',0,'Korkmuş','Yüksek sesler bazen korkutabilir.',1
FROM etkinlik_oyunlari WHERE kod='duyguyu_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,3,'😢','Oyuncağın kırıldı. Nasıl hissedebilirsin?','["Üzgün","Mutlu","Şaşkın","Gururlu"]',0,'Üzgün','Sevdiğimiz bir şey kırılınca üzülebiliriz.',1
FROM etkinlik_oyunlari WHERE kod='duyguyu_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,4,'🏅','Bir işi tek başına başardın. Nasıl hissedebilirsin?','["Gururlu","Korkmuş","Üzgün","Kızgın"]',0,'Gururlu','Başarı bize gurur verebilir.',1
FROM etkinlik_oyunlari WHERE kod='duyguyu_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,5,'🎈','Arkadaşların sana sürpriz yaptı. Nasıl hissedebilirsin?','["Şaşkın","Kızgın","Üzgün","Korkmuş"]',0,'Şaşkın','Beklenmedik sürprizler şaşırtabilir.',1
FROM etkinlik_oyunlari WHERE kod='duyguyu_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,6,'🚫','Biri oyuncağını izinsiz aldı. Nasıl hissedebilirsin?','["Kızgın","Mutlu","Rahat","Uykulu"]',0,'Kızgın','İzinsiz davranışlar bizi kızdırabilir.',1
FROM etkinlik_oyunlari WHERE kod='duyguyu_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,7,'🤝','Arkadaşın sana yardım etti. Nasıl hissedebilirsin?','["Mutlu","Korkmuş","Üzgün","Kızgın"]',0,'Mutlu','Yardım görmek güzel hissettirebilir.',1
FROM etkinlik_oyunlari WHERE kod='duyguyu_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,8,'🌙','Gece oldu ve çok yoruldun. Nasıl hissedebilirsin?','["Uykulu","Kızgın","Şaşkın","Gururlu"]',0,'Uykulu','Yorulduğumuzda uykumuz gelebilir.',1
FROM etkinlik_oyunlari WHERE kod='duyguyu_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,9,'❓','Daha önce hiç görmediğin bir şey gördün. Nasıl hissedebilirsin?','["Meraklı","Kızgın","Üzgün","Uykulu"]',0,'Meraklı','Yeni şeyler merak duygusu uyandırabilir.',1
FROM etkinlik_oyunlari WHERE kod='duyguyu_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;
INSERT INTO etkinlik_sorulari (oyun_id,sira,gorsel,soru,secenekler_json,dogru_cevap_indeksi,sonuc,aciklama,aktif)
SELECT id,10,'🫂','Üzgün arkadaşına sarıldın. O nasıl hissedebilir?','["Daha iyi","Daha korkmuş","Daha yalnız","Daha kızgın"]',0,'Daha iyi','Destek görmek kendimizi daha iyi hissettirebilir.',1
FROM etkinlik_oyunlari WHERE kod='duyguyu_bul'
ON DUPLICATE KEY UPDATE gorsel=VALUES(gorsel),soru=VALUES(soru),secenekler_json=VALUES(secenekler_json),dogru_cevap_indeksi=VALUES(dogru_cevap_indeksi),sonuc=VALUES(sonuc),aciklama=VALUES(aciklama),aktif=1;

