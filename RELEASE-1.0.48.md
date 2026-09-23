# İlkAdım V1.0.48 — Öğretmenim

Bu sürüm öğrenci uygulamasına öğretmene özel ayrı bir içerik alanı ekler.

## Öğrenci tarafı

- Ana öğrenci menüsüne beşinci sekme olarak **Öğretmenim** eklendi.
- Öğretmen içerikleri normal **Dersler** bölümüne karıştırılmaz.
- Akış:
  - Öğretmenim
  - Öğretmen
  - Ders
  - Konu
  - İçerik
- Her öğretmen içeriğinde **⭐ Öğretmen Adı'ndan** etiketi görünür.
- İçerik türleri:
  - Soru
  - Tekrar
  - Ödev
  - Not
  - Diğer
- Soru içeriklerinde öğrenci seçeneklerden cevap verebilir.
- Son cevap ve doğru/yanlış durumu MySQL'de saklanır.
- Öğretmen açıklaması cevap sonrasında gösterilebilir.
- Öğrenci yalnızca kendisine yetkili öğretmenlerin içeriklerini görebilir.

## Öğretmen tarafı

- Öğretmen paneline **İçeriklerim** bölümü eklendi.
- Öğretmen aktif kurumunu seçerek içerik yayınlayabilir.
- Ders ve mevcut konu seçilebilir.
- Mevcut ders konusu kullanılmayacaksa özel konu başlığı yazılabilir.
- Öğretmen içerik türünü seçebilir.
- Soru içeriğinde seçenekler ve doğru cevap belirlenebilir.
- Öğretmen hiçbir öğrenci seçmezse içerik o kurumdaki kendisine bağlı tüm öğrencilere gider.
- Öğretmen belirli öğrencileri seçerse içerik yalnızca seçilen öğrencilere gider.
- Öğretmen içerikleri pasife alabilir ve yeniden aktifleştirebilir.
- İçerik listesinde hedef öğrenci ve cevap sayıları görülebilir.

## Yetki ve veri güvenliği

Öğretmen içeriğinin öğrenciye görünmesi için aynı anda şu koşullar gerekir:

1. Kurum aktif olmalı.
2. Öğretmen hesabı ve öğretmen profili aktif olmalı.
3. Öğrenci hesabı ve öğrenci profili aktif olmalı.
4. Öğretmen aynı kurumda aktif öğretmen üyesi olmalı.
5. Öğrenci aynı kurumda aktif öğrenci üyesi olmalı.
6. `ogretmen_ogrenci` tablosunda öğretmen-öğrenci eşleşmesi bulunmalı.
7. İçerik seçili öğrencilere gönderilmişse öğrenci hedef listesinde bulunmalı.

Bu nedenle aynı kurumda bulunan başka bir öğretmenin öğrencisi dahi içeriği göremez.

## Veritabanı

Yeni migration:

`database/migrations/021_ogretmenim_icerikleri.sql`

Yeni tablolar:

- `ogretmen_icerikleri`
- `ogretmen_icerik_hedefleri`
- `ogretmen_icerik_cevaplari`

Kimlik kolonlarının tipleri canlı veritabanındaki mevcut tablolardan okunur. Böylece eski kurulumlarda INT/BIGINT farkından kaynaklanan yabancı anahtar tipi problemi oluşturulmaz. Yeni tablolarda içerik türü VARCHAR tutulduğu için ileride video, dosya, çalışma kağıdı, duyuru veya yeni içerik tipleri eklenebilir.

## Korunan alanlar

- Mevcut sistem dersleri değiştirilmedi.
- Mevcut ders modülleri değiştirilmedi.
- Mevcut öğrenci ilerlemeleri değiştirilmedi.
- Mevcut CSS dosyaları değiştirilmedi.
- Mevcut görseller değiştirilmedi.
- Öğretmenim için ayrı CSS ve JS dosyaları eklendi.
