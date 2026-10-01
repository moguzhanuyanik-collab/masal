# İlkAdım 1.2.2

## Sequential migration execution düzeltmesi

### Hata analizi

1.1.98 sürümündeki updater sözleşmesinde her güncelleme paketinin staging alanındaki bekleyen migrationları run_pending_migrations() ile uyguladığı doğrulanmıştı.

1.2.1 recovery hattı yeniden kurulurken bu genel çağrı install akışından çıkarılmış; bunun yerine yalnızca doğrudan 1.1.97 → 1.2.1 özel recovery yolu bırakılmıştı.

Bu nedenle sıralı kurulumlarda:
- 1.1.97 → 1.1.98 paketindeki 064 migration,
- 1.1.113 → 1.1.114 paketindeki 065 migration,
- 1.1.114 → 1.1.115 paketindeki 066 migration

normal updater akışında garanti altında çalışmıyordu.

### 1.2.2 düzeltmesi

- Staged release paketinden deterministik bir DB update planı çıkarılıyor.
- Bekleyen migrationlar, legacy kurum şeması onarımı ve eksik öğrenci şeması birlikte hesaplanıyor.
- DB mutation gerektiren güncellemeden önce doğrulanmış MySQL yedeği alınıyor.
- Normal sıralı güncellemelerde run_pending_migrations() yeniden çalıştırılıyor.
- Doğrudan 1.1.97 → 1.2.1 legacy recovery bridge'i korunuyor.
- Recovery manifestinde DB mutation başlamadan önce durum işaretleniyor.
- 1.1.97 → 1.2.1 uygulama zinciri ve mevcut tenant migrationları korunuyor.

### Doğrulama

- 1.1.97 → 1.2.1 zinciri korunuyor.
- 1.1.98/064, 1.1.114/065 ve 1.1.115/066 sıralı migration yürütme sözleşmesi regression testiyle kilitleniyor.
- PHP/JS syntax ve mevcut Quality Gate testleri korunuyor.

Bu sürüm production veritabanına doğrudan müdahale etmez; güncelleme motorunun sonraki kurulumu sırasında doğru migration zincirinin çalışmasını sağlar.
