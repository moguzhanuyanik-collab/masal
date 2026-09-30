# İlkAdım 1.1.114

## Kurum bazlı eşleştirme izolasyonu

- `veli_ogrenci` ve `ogretmen_ogrenci` ilişkilerine kurum kapsamı eklendi.
- Eski ilişkiler güvenli biçimde ortak aktif kurumlarına taşınıyor.
- Aynı öğrenci/veli veya öğrenci/öğretmen çifti birden fazla kurumda ayrı kapsamlarla tutulabiliyor.
- Global eşleştirmeler `kurum_id=0` ile açıkça ayrıştırılıyor.
- Öğretmen/veli erişim sorguları artık ilişki satırının kurum kapsamını da doğruluyor.
- Kurum eşleştirme ekranındaki silme/güncelleme işlemleri yalnızca seçili kurumun ilişkisini değiştiriyor.

## Test

- MariaDB 11.4 service container eklendi.
- Gerçek PDO/MariaDB tenant izolasyon testi CI'a bağlandı.
- Migration 065 gerçek legacy ilişki şeması üzerinde çalıştırılarak backfill ve primary key değişimi doğrulanıyor.
- PHP, JavaScript, AdımBot ve mevcut regression testleri korunuyor.
