# İlkAdım 1.1.99

Taban: 1.1.98 / 00ef214b09323dc7d0badb6c2720454ea3e9969b.

## Hedef

Migration çalışmadan önce gerçek MySQL snapshot almak ve legacy şema onarımının üretim öğrenci hesabı/e-posta/parola verisini değiştirmesini engellemek.

## Düzeltilenler

1. Migration veya legacy DB şema onarımı gerekiyorsa updater önce native `mysqldump` snapshot ister.
2. Snapshot `storage/backups/onceki_veritabani.sql` altında tek önceki DB yedeği olarak tutulur.
3. Dump komutu shell string değil argument-array ile `proc_open` üzerinden çalışır.
4. DB parolası command-line argümanına yazılmaz; yalnız child process `MYSQL_PWD` environment değişkeniyle aktarılır.
5. `--single-transaction --quick --triggers --hex-blob --skip-lock-tables` seçenekleri kullanılır.
6. Dump exit code, minimum boyut ve MySQL/MariaDB/CREATE TABLE işaretleriyle doğrulanır.
7. Başarısız yeni dump mevcut sağlam DB yedeğini bozmaz; replacement atomik yapılır.
8. `mysqldump` bulunamazsa veya `proc_open` kapalıysa migration'lı güncelleme fail-closed durur.
9. `update.mysqldump_path` ayarı eklendi; shared hosting özel binary yolunu `config/local.php` üzerinden verebilir.
10. Kod-only güncellemeler gereksiz DB snapshot zorunluluğuna takılmaz.
11. Bekleyen migration, eksik öğrenci şeması veya legacy kurum üyelik şeması DB mutation olarak algılanır.
12. Güncelleme sonucu kullanılan DB backup adını API ve güncelleme geçmişine ekler.
13. Sistem Durumu ekranı native migration DB backup hazırlığını gösterir.
14. Updater'ın legacy `ensure_student_auth_schema()` fonksiyonundaki test/demo öğrenci üretimi kaldırıldı.
15. Updater artık hiçbir öğrenciyi `masal@gmail.com`, `test@ilkadim.local` veya sabit `12345678` parolasıyla değiştirmez.
16. Şema onarımı yalnız tablo/kolon/index/token şemasını onarır; kullanıcı kimliği üretmez/değiştirmez.
17. Native DB backup için gerçek process/atomic replacement davranış testi eklendi.
18. Beş eksik temiz-kurulum dosyasının Git geçmişinde hiç commit edilmediği doğrulandı; tahmin edilerek üretilmedi.

## Geçiş davranışı

1.1.99'un kendisinde migration yoktur. 1.1.99'u 1.1.98 updater kuracağı için yeni DB snapshot zorunluluğu bu kurulumda henüz çalışmaz. 1.1.99 kurulduktan sonraki migration içeren sürümlerde yeni updater migration başlamadan önce doğrulanmış DB snapshot alır.

## Bilinen kalan konu

`src/bootstrap.php`, `styles.css`, `app-runtime.js`, `database/schema.sql`, `database/seed.sql` Git geçmişinde hiç bulunmamıştır. Temiz kurulumun tamamlanması için çalışan canlı sunucudaki gerçek dosyaların kontrollü biçimde kaynağa alınması gerekir.

Native snapshot geri yükleme otomatik olarak çalıştırılmaz. Veri kaybı/şema hatasında restore işlemi bilinçli bakım adımı olarak yapılmalıdır.
