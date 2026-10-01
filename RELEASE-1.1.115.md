# İlkAdım 1.1.115

## Eşleştirme şema güvenlik kilidi

- 1.1.114 ile gelen kurum bazlı veli/öğrenci ve öğretmen/öğrenci izolasyonunun yalnızca uygulama sorgularında değil, veritabanı şemasında da gerçekten tamamlandığı doğrulanıyor.
- Yeni migration 066, beklenmeyen legacy primary-key yapısının sessizce başarılı sayılmasını engelliyor.
- kurum_id kolon tipi, NOT NULL DEFAULT 0 sözleşmesi, kurum kapsamlı primary key ve tenant indexleri doğrulanıyor.
- kurum_id=0 global kapsamı ile gerçek kurum kimlikleri arasındaki ayrım doğrulanıyor.
- Yetim kurum kimliğine sahip kurum kapsamlı eşleştirme satırları varsa güncelleme fail-closed duruyor.
- Migration veri silmiyor veya ilişki kayıtlarını dönüştürmüyor.

## Test

- Gerçek MariaDB tenant testi migration 065 + 066 zincirini çalıştırıyor.
- Şema postcondition kontrolleri CI içinde doğrulanıyor.
- PHP, JavaScript, AdımBot ve mevcut regression testleri korunuyor.
