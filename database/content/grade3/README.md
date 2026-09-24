# İlkAdım 3. Sınıf MEB İçerik Hazırlık Paketi

Bu klasör otomatik migration değildir. `database/migrations` dışında tutulduğu için güncelleme sistemi bu dosyaları kendiliğinden çalıştırmaz.

## Kapsam

2026-2027 eğitim öğretim yılında 3. sınıfta Türkiye Yüzyılı Maarif Modeli uygulanmaktadır.

Hazırlık yapısı:

Temel Eğitim → 3. Sınıf → Ders → Tema / Ünite / Öğrenme Alanı → Konu → Soru Havuzu

## Hazırlanan içerik

- Türkçe: 18 konu / 274 soru
- Matematik: 26 konu / 732 soru
- Fen Bilimleri: 16 konu / 240 soru
- İngilizce: 23 konu / 300 soru
- Hayat Bilgisi: 6 konu / 120 soru
- Görsel Sanatlar: 7 konu / 42 soru
- Müzik: 2 konu / 24 soru
- Beden Eğitimi ve Oyun: 6 konu / 60 soru

**Toplam: 104 konu / 1.792 soru**

## 3. sınıf dersleri

Haftalık zorunlu ders eşlemeleri bu hazırlık paketinde:
- Türkçe: 8 saat
- Matematik: 5 saat
- Hayat Bilgisi: 3 saat
- Fen Bilimleri: 3 saat
- İngilizce: 2 saat
- Görsel Sanatlar: 1 saat
- Müzik: 1 saat
- Beden Eğitimi ve Oyun: 5 saat

Fen Bilimleri 3. sınıfta sisteme yeni ders olarak eklenebilecek şekilde hazırlanmıştır.

## Dosyalar

1. `00_schema_and_mufredat.sql`
   - 3. sınıf ders eşlemelerini hazırlar.
   - Fen Bilimleri ve İngilizce ders kayıtlarını yoksa oluşturur.
   - Resmî tema / ünite / öğrenme alanlarını ekler.
   - 1. ve 2. sınıf verilerine dokunmaz.

2. `10_turkce_soru_havuzu.sql`
   - 18 konu / 274 soru.
   - Bağlamdan anlam, yazım-noktalama, olay sırası, neden-sonuç, çıkarım, ana fikir, özetleme, bilgi kaynakları, cümle-paragraf, kültür ve hak-sorumluluk.

3. `20_matematik_soru_havuzu.sql`
   - 26 konu / 732 soru.
   - 1000'e kadar sayılar, basamak değeri, karşılaştırma, yuvarlama, ritmik sayma, tek-çift, örüntü, tahmin, kesir, zaman, uzunluk, kütle, ₺, dört işlem, eşitlik, problem, geometrik cisim, çokgen, çevre, sıvı, simetri ve veri.

4. `25_ingilizce_soru_havuzu.sql`
   - 23 konu / 300 soru.
   - MEB'in 6 resmî teması ve alt temaları.
   - School Life, Classroom Life, Personal Life, Family Life, Homes & Houses & The Neighbourhood, Life in the City & The World.

5. `27_fen_bilimleri_soru_havuzu.sql`
   - 16 konu / 240 soru.
   - 8 resmî ünitenin her birinde iki ana konu.
   - Bilimsel araştırma, canlılar, kayaç-maden-fosil, madde/karışım, hareket/kuvvet, elektrik, toprak/tarım, habitat/canlı çeşitliliği.

6. `30_diger_dersler_soru_havuzu.sql`
   - Hayat Bilgisi: 120 soru
   - Görsel Sanatlar: 42 soru
   - Müzik: 24 soru
   - Beden Eğitimi ve Oyun: 60 soru

## Soru kalitesi

- Çoktan seçmeli sorularda 4 benzersiz seçenek kullanılır.
- Doğru cevap indeksleri farklı şıklara dağıtılır.
- Soru sayıları konunun üretkenliğine göre farklı tutulur.
- Matematikte işlem çeşitliliği geniş tutulur; görsel/sanatsal derslerde yapay tekrar üretilmez.
- Türkçe metin ve soruları özgün hazırlanmıştır; ders kitabı soruları kopyalanmamıştır.
- Fen Bilimleri soruları gözlem, karşılaştırma, güvenlik, çıkarım ve günlük yaşam bağlantısı içerir.
- İngilizce soruları kısa, bağlama dayalı ve 3. sınıf gelişim düzeyine uygundur.
- Para konularında Türk lirası simgesi `₺` kullanılır.

## Öğrenci akışı

Aktivasyon sonrası hedef akış:

Ders → Tema / Ünite → Konu (tek kart) → Soru Havuzu

Aynı konuya ait sorular ayrı ayrı konu kartı oluşturmaz. Konu kartına girildiğinde sorular mevcut öğrenci ders ekranında sırayla çalıştırılır.

## Tasarım güvenliği

Bu hazırlık:
- öğrenci HTML yapısını değiştirmez,
- CSS dosyalarını değiştirmez,
- logo, ikon dosyaları ve görselleri değiştirmez,
- AdımBot görsellerini değiştirmez,
- güncelleme ekranına dokunmaz,
- canlı veritabanına otomatik uygulanmaz.

## Resmî MEB referansları

- 2026-2027 Temel Eğitim yıllık planları:
  https://tymm.meb.gov.tr/taslak-cerceve-planlari/temel-egitim
- 3. Sınıf İlkokul Türkçe:
  https://tymm.meb.gov.tr/ogretim-programlari/ilkokul-turkce-dersi/4
- 3. Sınıf İlkokul Matematik:
  https://tymm.meb.gov.tr/ogretim-programlari/ilkokul-matematik-dersi/4
- 3. Sınıf Fen Bilimleri:
  https://tymm.meb.gov.tr/ogretim-programlari/fen-bilimleri-dersi/4
- 3. Sınıf İngilizce:
  https://tymm.meb.gov.tr/ogretim-programlari/ingilizce-dersi-temel-egitim/4
- Temel Eğitim öğretim programları:
  https://tymm.meb.gov.tr/ogretim-programlari/temel-egitim

## Aktivasyon

Bu paket yalnızca veri hazırlığıdır. Canlı öğrenci ekranına alınırken grade 3 konu kodları için konuya özel simgeler de API eşlemesine eklenmeli ve içerik migration ile güvenli şekilde aktive edilmelidir.
