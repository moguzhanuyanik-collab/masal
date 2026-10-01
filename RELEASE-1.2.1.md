# İlkAdım 1.2.1

## 1.1.97 → 1.2.1 güncelleme hattı yeniden kuruldu

Bu sürüm, GitHub geçmişindeki 1.1.97 tabanı ile korunmuş ara branch/commit kayıtlarından kaybolan güncelleme hattını yeniden birleştiren final release'tir.

### Geri kazanılan uygulama değişiklikleri

- **1.1.97:** AdımBot konuşma, mikrofon sahipliği, otomatik sessizlik bitirme ve transkripsiyon davranışları.
- **1.1.98:** AdımBot rate-limit altyapısı, migration checkpoint ve DB güvenlik kontrolleri.
- **1.1.99–1.1.100:** DB backup/recovery güvenliği ve updater recovery kontrolleri.
- **1.1.101–1.1.112:** Release ankrajı, updater güvenliği, manifest bütünlüğü, core handoff/rollback ve kalite katalogları.
- **1.1.113:** 1.1.97 → 1.1.98 web rescue ve legacy updater geçiş güvenliği.
- **1.1.114–1.1.116:** Kurum bazlı tenant izolasyonu, kurum kapsamlı eşleştirme şeması, MariaDB entegrasyon testleri ve fail-closed schema guard.
- **1.1.117:** Kurum eşleştirme CRUD stabilizasyonu, stale ilişki temizliği ve MariaDB 1452/1062 hata ayrıştırması.
- **1.1.119 / 1.2.1 recovery hattı:** Güncelleme seçiminde geçmiş taraması kaldırıldı; GitHub main HEAD'i gerçek 40 karakter SHA ile çözülüyor ve recovery updater çekirdeği 121. nesile taşındı.

### Güncelleme motoru

- Updater paketi SHA-256 ile doğruluyor.
- Updater çekirdeği değişiminde handoff ve geri dönüş mekanizması korunuyor.
- Kurulum öncesi yedekleme ve atomik dosya değiştirme korunuyor.
- Kurum eşleştirme migration'ı için yalnızca açık güvenlik marker'lı izinli ALTER ailesi kabul ediliyor; diğer yıkıcı/daraltıcı şema dönüşümleri fail-closed.
- Veritabanı geriye alınmıyor ve recovery hattı geçmiş migration'ları rastgele tekrar çalıştırmıyor.

### Doğrulama

- Tüm mevcut PHP/JS syntax kontrolleri.
- AdımBot regression testleri.
- Updater safety, manifest, activation, handoff, rescue ve continuity testleri.
- Tenant isolation + gerçek MariaDB entegrasyon testi.
- 1.1.117 eşleştirme CRUD regression testi.
- 1.2.1 full recovery-line reconstruction contract.

### Önemli

Bu release GitHub kod ağacını yeniden kurar. Canlı/production veritabanına otomatik rollback veya doğrudan deploy yapılmaz.

## Rev 2 — recovery tree continuity

- 1.1.119 ana dalından taşınan `tests/update-rebuild-122.cjs` kalite ağacına dahil edildi.
- Managed-file manifest, sürüm ve release ankrajı aynı committe 1.2.1 rev2 olarak eşitlendi.
