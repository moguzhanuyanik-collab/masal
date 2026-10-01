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

## Rev 3 — regression gate continuity

- Tarihsel recovery testleri 1.2.1 release revision artışlarında kırılmayacak şekilde release identity üzerinden doğrulanıyor.
- 1.1.110 rescue regression'ındaki tanımsız version referansı düzeltildi.

## Rev 4 — 1.1.97 legacy DB recovery

- 1.1.97 kurulumlarında 1.2.1'e geçiş artık yalnız dosya ağacını değiştirmiyor.
- Doğrulanmış 001-063 migration geçmişi korunarak yalnız eksik 064 checkpointi recovery ile tamamlanıyor.
- Legacy `kurum_kullanicilari` dönüşümü, 064 sonrasında 065 tenant izolasyonu ve 066 schema guard sırasıyla uygulanıyor.
- DB migration başlamadan önce doğrulanmış mysqldump yedeği zorunlu.
- 1.1.99+ / 1.2.1 temiz recovery davranışı değiştirilmiyor; veritabanı geriye alınmıyor.
- Sürüm ankrajı 1.2.1 rev8 olarak güncellendi.

## Rev 9 — 064 checkpoint bütünlük onarımı

- 1.1.97 legacy recovery sırasında `sistem_migrations` içinde 064 kaydı bulunup `adimbot_rate_limitleri` tablosu eksikse recovery'nin sessizce atlaması düzeltildi.
- Eksik tablo yalnız `CREATE TABLE IF NOT EXISTS` ile idempotent biçimde yeniden oluşturuluyor; mevcut kullanıcı/kurum/öğrenci/veli/öğretmen verilerine dokunulmuyor.
- Tablo yeniden oluşturulamazsa süreç fail-closed duruyor.
- Gerçek MariaDB regression testi eklendi: 064 kaydı eksik → oluşturma, tablo sonradan kaybolmuş → yeniden oluşturma ve migration kaydının tekil kalması doğrulanıyor.
- Sürüm 1.2.1 rev9 olarak yeniden ankrajlandı.

## Rev 10 — legacy recovery postcondition hardening

- 1.1.97 → 1.2.1 recovery'de migration checkpoint'i mevcut olsa bile tenant ilişki şemasının gerçekten doğru olduğu artık ayrıca doğrulanıyor.
- 066 schema guard, 065/066 migration kayıtları daha önce yazılmış olsa dahi recovery sonunda yeniden çalıştırılıyor; bozuk/eksik şema checkpoint nedeniyle sessizce atlanamıyor.
- DB mutation sınırı recovery manifestine açıkça yazılıyor ve hata durumunda yanlışlıkla "database mutation olmadı" raporlanması engelleniyor.
- Gerçek MariaDB regression testi bozuk primary key ve eksik tenant index senaryolarının fail-closed yakalandığını doğruluyor.
- Sürüm ankrajı 1.2.1 rev10 olarak güncellendi.


## Rev 11 — sequential rebuild integrity

- 1.1.97 tabanından 1.2.1'e kadar olan kayıp sürüm zinciri GitHub commit geçmişinde yeniden lineer olarak oluşturuldu.
- Sıra: 1.1.97 → 1.1.98 → 1.1.99 → 1.1.100 → 1.1.101 → 1.1.102 → 1.1.103 → 1.1.104 → 1.1.105 → 1.1.106 → 1.1.107 → 1.1.108 → 1.1.109 → 1.1.110 → 1.1.111 → 1.1.112 → 1.1.113 → 1.1.114 → 1.1.115 → 1.1.116 → 1.1.117 → 1.1.119 → 1.2.1.
- Güncelleme motorunun tarihsel commit taraması bu lineer zincirde her seferinde bir sonraki sürümü bulabilecek şekilde korunuyor.
- Quality Gate artık tam Git geçmişiyle zincir sözleşmesini doğruluyor.
- Production veritabanına rollback/değişiklik yapılmadı.


## Rev 12 — release-head re-anchor

- Son regression düzeltmesi release head kuralını bozmayacak şekilde aynı 1.2.1 sürümünün yeni revision ankrajına alındı.
- `tests/update-legacy-db-recovery-123.cjs` rev12 ile hizalandı.
- Release metadata, version ve managed manifest aynı revision değerinde tutuluyor.
