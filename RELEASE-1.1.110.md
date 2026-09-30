# İlkAdım 1.1.110

## 1.1.98 geçiş onarımı

- 1.1.98 history recovery artık beş belirli tabloyu zorunlu tutmak yerine 1.1.97 checkpointinin 53 non-retired migration kaydını doğrular.
- 1.1.97 -> 1.1.98 için özel rescue updater eklendi.
- Rescue geçişinde legacy kurum repair'i migrationlardan önce çalıştırılmaz.
- Yalnız 001_197_history_recovery ve 064_adimbot_rate_limit_ve_migration_checkpoint uygulanır.
- Diğer tüm sürüm geçişlerinde mevcut updater davranışı korunur.
- Rescue installer yalnız kurulu sürüm tam olarak 1.1.97 olduğunda çalışır ve mevcut updater'ı SHA-256 yedekler.
- Tarihsel 1.1.98 anchor ve sonraki sürüm zinciri yeniden ankrajlanmıştır.
