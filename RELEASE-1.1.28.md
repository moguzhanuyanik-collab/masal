# İlkAdım v1.1.28

## Kritik migration düzeltmesi
- v1.1.27 kurulumunda oluşan MySQL 1553 hatası giderildi.
- ogrenci_ilerleme tablosunda foreign key için bağımsız ogrenci_id indeksi oluşturulur.
- Eski uk_ogrenci_ilerleme indeksi ancak foreign key'i taşıyacak alternatif indeks hazırlandıktan sonra değiştirilir.
- Yeni unique yapı ogrenci_id + sinif_seviyesi + ders_kodu + modul_indeksi şeklindedir.
- Migration yarım kalmış olsa bile mevcut kolon ve indeksleri kontrol ederek yeniden çalışabilir.

## Güncelleme motoru güvenliği
- Yeni sürümlerde migration'lar staging paketinden, uygulama dosyaları canlıya kopyalanmadan önce çalıştırılır.
- DB dönüşümü başarısız olursa yeni kod canlı sisteme geçirilmez.
- Güncelleme ekranının görünümü değiştirilmedi.

## Uyumluluk
- v1.1.26'dan doğrudan kurulabilir.
- Yarım kalmış v1.1.27 kurulumunu toparlayabilir.
- Mevcut öğrenci verileri korunur.
- Temel Eğitim 1-8 sınıf altyapısı korunur.
