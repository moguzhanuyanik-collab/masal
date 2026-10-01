# İlkAdım 1.2.2

## Güncelleme motoru: bekleyen veritabanı migration'ları

### Hata analizi

1.1.97 → 1.2.1 legacy recovery hattı özel olarak çalışıyordu; ancak 1.1.98 ve üzerindeki mevcut kurulumlardan 1.2.1'e geçerken `install_github_update()` dosyaları güncelliyor fakat bekleyen migration'ları genel akışta çalıştırmıyordu.

Bu nedenle örneğin 1.1.113 seviyesindeki bir kurulum, uygulama kodunu 1.2.1'e alırken 065/066 tenant şema migration'larını atlayabilirdi.

### Düzeltme

- Non-legacy güncellemelerde bekleyen migration listesi artık update öncesinde hesaplanıyor.
- Bekleyen migration, legacy kurum üyeliği dönüşümü veya eksik öğrenci auth şeması varsa doğrulanmış mysqldump yedeği alınıyor.
- 1.1.98+ kurulumlarda `run_pending_migrations()` artık gerçek update akışından çağrılıyor.
- Migration checkpoint'i mevcut olsa bile `ogrenciler` tablosu yoksa auth şeması ayrıca doğrulanıp idempotent biçimde onarılıyor.
- 1.1.97 özel recovery hattı değiştirilmedi; önceki doğrulanmış 064 → legacy membership → 065 → 066 sırası korunuyor.
- Yeni regression testi CI kalite kapısına eklendi.

### Sonuç

Artık güncelleme yalnız PHP/JS dosyalarını değil, mevcut kurulumun DB migration durumunu da hedef sürümle senkronize ediyor.

Production veritabanına doğrudan müdahale edilmedi.
