# İlkAdım 1.1.96

Taban: 1.1.95 / f09d7851cc674469b2011fd3fb2bcfc1a23599ca.

## Hedef

Updater'ın yeni pakette artık bulunmayan eski dosyaları güvenli biçimde temizleyebilmesi; bunu yaparken canlıya özel ve GitHub'da izlenmeyen dosyalara dokunmaması.

## Düzeltilenler

1. Updater yönetilen dosya manifesti altyapısı eklendi.
2. İlk güvenli baseline paketle gelen `update-managed-files.json` üzerinden oluşturulur.
3. Runtime manifest varsa `storage/updates/managed-files.json` öncelikli kullanılır.
4. Yeni paket dosya listesi ile önceki yönetilen dosya listesi karşılaştırılır.
5. Yalnız daha önce updater tarafından yönetildiği bilinen ve yeni pakette artık bulunmayan dosyalar silinir.
6. GitHub dışı canlı dosyalar ilk manifestte olmadığı için stale cleanup bunlara dokunmaz.
7. Preserve alanları `config/local.php`, `storage`, `assets`, `v4` stale cleanup dışında kalır.
8. Manifest yollarında `..`, boş segment, NUL ve Git metadata gibi riskli değerler reddedilir.
9. Canlı hedef yolun parent zincirinde symlink varsa otomatik silme durdurulur.
10. Güncelleme paketindeki symlink'ler kopyalama sırasında reddedilir.
11. ZIP içindeki absolute path, Windows drive path, `..` path traversal ve UNIX symlink metadata kurulumdan önce reddedilir.
12. Paket `version.json`, `config/app.php`, `src/updater.php`, `src/auth.php`, `login.php`, `index.php` olmadan kurulamaz.
13. File↔directory tür çakışmaları otomatik dönüştürülmez; güvenli bakım gerektirdiği için update durur.
14. Başarılı güncellemeden sonra runtime manifest atomik olarak yazılır.
15. Güncelleme sonucu temizlenen stale dosya sayısını ve yönetilen dosya sayısını raporlar.
16. Sistem Durumu ekranına canlı bootstrap, styles.css, app-runtime.js, schema.sql, seed.sql ve updater manifest kontrolleri eklendi.
17. Temiz kurulum kaynakları eksikse mevcut çalışan sunucunun etkilenmediği fakat yeni sunucu kurulumunun eksik olduğu açıkça gösterilir.
18. CI, paket manifestini Git'te izlenen ve deploy edilen dosya listesiyle birebir doğrular.

## Geçiş davranışı

1.1.96 kurulumu 1.1.95 updater koduyla yapılacağı için yeni runtime manifest o anda yazılamaz. Bu nedenle 1.1.96 paketi kendi `update-managed-files.json` baseline manifestini taşır. 1.1.96 updater daha sonraki sürümü kurarken bu baseline'ı okuyabilir ve güvenli stale cleanup yapabilir.

## Bilinen kalan konu

GitHub deposunda `src/bootstrap.php`, `styles.css`, `app-runtime.js`, `database/schema.sql` ve `database/seed.sql` bulunmuyor. Bu dosyalar manifest tarafından yönetilmez ve otomatik silinmez. Temiz kurulumun tam hale gelmesi için gerçek kaynakları ayrıca repoya alınmalıdır.

Updater hâlâ tam MySQL snapshot/restore sağlamaz; veri kaybına yol açabilecek migrationlar fail-closed güvenlik kapısıyla engellenmeye devam eder.
