# İlkAdım 1.1.110

## 1.1.98 geçiş onarımı

- 1.1.98 history recovery artık beş belirli tabloyu zorunlu tutmak yerine 1.1.97 checkpointinin 53 non-retired migration kaydını doğrular.
- 1.1.97 -> 1.1.98 için özel rescue updater eklendi.
- Rescue geçişinde legacy kurum repair'i migrationlardan önce çalıştırılmaz.
- Yalnız 001_197_history_recovery ve 064_adimbot_rate_limit_ve_migration_checkpoint uygulanır.
- Diğer tüm sürüm geçişlerinde mevcut updater davranışı korunur.
- Rescue installer yalnız kurulu sürüm tam olarak 1.1.97 olduğunda çalışır ve mevcut updater'ı SHA-256 yedekler.
- Tarihsel 1.1.98 anchor ve sonraki sürüm zinciri yeniden ankrajlanmıştır.

## Rev 2

- `database/migrations/001_197_history_recovery.sql` final managed-file manifestine eklendi.
- Paket ağacı ile manifest birebir eşleştirildi.

## Rev 3

- 1.1.98'e özel `001_197_history_recovery.sql` yalnız tarihsel 1.1.98 anchor paketinde tutuldu.
- Güncel 1.1.110 paketinden bu tarihsel migration çıkarıldı; böylece 1..63 historical migration sayacı yeniden 53 kayıt sözleşmesiyle uyumlu.
- 1.1.98 rescue updater hedef 1.1.98 commit paketindeki recovery dosyasını kullanmaya devam eder.

## Rev 4

- 1.1.109 rollback regresyon testi sonraki sürümleri kabul edecek şekilde geleceğe uyumlu hale getirildi.
- 1.1.110 rescue regresyon testi de aynı nedenle minimum sürüm sözleşmesine geçirildi.
- Release HEAD invariant kontrolü `recovery-safety-*` dahil Quality Gate'in release amaçlı push branchlerinde çalışacak şekilde genişletildi.
