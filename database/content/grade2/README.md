# İlkAdım 2. Sınıf MEB İçerik Hazırlık Paketi

Bu klasör otomatik migration değildir. `database/migrations` dışında tutulduğu için güncelleme sistemi bu dosyaları kendiliğinden çalıştırmaz.

## Kapsam

2026-2027 eğitim öğretim yılında 2. sınıfta Türkiye Yüzyılı Maarif Modeli uygulanmaktadır.

Hazırlık yapısı:

Temel Eğitim → 2. Sınıf → Ders → Tema / Öğrenme Alanı → Konu → Soru Havuzu

## Hazırlanan içerik

- Türkçe: 16 konu / 306 soru
- Matematik: 24 konu / 683 soru
- İngilizce: 18 konu / 215 soru
- Hayat Bilgisi: 6 konu / 120 soru
- Görsel Sanatlar: 7 konu / 42 soru
- Müzik: 2 konu / 22 soru
- Beden Eğitimi ve Oyun: 4 konu / 46 soru

**Toplam: 77 konu / 1.434 soru**

## Dosyalar

1. `00_schema_and_mufredat.sql`
   - 2. sınıf ders eşlemelerini oluşturur.
   - 2. sınıf tema / öğrenme alanlarını hazırlar.
   - İngilizce dersi sistemde yoksa ders kaydını hazırlar.
   - 1. sınıf verilerine dokunmaz.

2. `10_turkce_soru_havuzu.sql`
   - 2. sınıf Türkçe tema ve becerilerine göre 306 soru.

3. `20_matematik_soru_havuzu.sql`
   - 100'e kadar sayılar, basamak değeri, ritmik sayma, örüntü, bütün-yarım-çeyrek, para, zaman, ölçme, toplama-çıkarma, çarpma-bölmenin anlamı, geometri, simetri ve veri soruları.

4. `25_ingilizce_soru_havuzu.sql`
   - School Life, Classroom Life, Personal Life, Family Life, Homes & Houses & Neighbourhoods ve Life in the City & the World temaları.

5. `30_diger_dersler_soru_havuzu.sql`
   - Hayat Bilgisi, Görsel Sanatlar, Müzik ve Beden Eğitimi ve Oyun.

## Soru kalitesi

- Çoktan seçmeli sorularda 4 benzersiz seçenek kullanılır.
- Doğru cevap indeksleri farklı şıklara dağıtılır.
- Soru sayısı konuya göre değişir; üretken konularda daha büyük havuz vardır.
- Aynı sorunun yalnızca bir kelimesi değiştirilerek yapay çoğaltılmasından kaçınılmıştır.
- Metin sorularında özgün kısa metinler kullanılmıştır; ders kitabı soruları kopyalanmamıştır.
- 2. sınıf gelişim düzeyine uygun kısa ve anlaşılır dil kullanılır.

## Tasarım güvenliği

Bu hazırlık:
- öğrenci HTML yapısını değiştirmez,
- CSS dosyalarını değiştirmez,
- logo, ikon ve görselleri değiştirmez,
- AdımBot görsellerini değiştirmez,
- güncelleme ekranının görünümünü değiştirmez,
- canlı ders motorunu henüz yeni soru havuzuna bağlamaz.

## Resmî MEB referansları

- 2026-2027 Temel Eğitim yıllık planları:
  https://tymm.meb.gov.tr/taslak-cerceve-planlari/temel-egitim
- 2. Sınıf İlkokul Türkçe:
  https://tymm.meb.gov.tr/ogretim-programlari/ilkokul-turkce-dersi/3
- 2. Sınıf İlkokul Matematik:
  https://tymm.meb.gov.tr/ogretim-programlari/ilkokul-matematik-dersi/3
- 2. Sınıf İngilizce:
  https://tymm.meb.gov.tr/ogretim-programlari/ingilizce-dersi-temel-egitim/3
- Temel Eğitim öğretim programları:
  https://tymm.meb.gov.tr/ogretim-programlari/temel-egitim

## Aktivasyon

Bu paket yalnızca veri hazırlığıdır. Canlı öğrenci ekranı hâlen mevcut ders motorunu kullanır. Çoklu soru havuzu aktif edilirken mevcut öğrenci tasarımı korunarak runtime/API davranışı ayrıca bağlanmalıdır.
