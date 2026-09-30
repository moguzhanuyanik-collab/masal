# İlkAdım 1.1.100

Taban: 1.1.99 / e102b53e64d89caad5487adb7e798e09796293d9.

## Hedef

Güncelleme öncesi yedeklerin gerçekten kullanılabilir olduğunu doğrulamak, DB credential sızıntı yüzeyini azaltmak ve başarısız güncellemede kontrollü geri dönüş için doğrulanabilir recovery bilgisi bırakmak.

## Analizde bulunan ve uygulanan geliştirmeler

1. Uygulama ZIP yedeği artık yalnız dosya oluştu diye kabul edilmez.
2. ZIP yeniden açılır; `version.json`, `src/updater.php`, `src/auth.php`, `login.php`, `index.php` varlığı doğrulanır.
3. ZIP içinde `config/local.php`, `.env` ve `.git/config` bulunması hata kabul edilir.
4. Uygulama backup SHA-256 ve byte boyutu hesaplanır.
5. Backup başlamadan önce tahmini uygulama yedek boyutuna göre disk alanı kontrol edilir.
6. `storage/` ve `.git/` artık sadece ZIP dışında kalmaz; traversal seviyesinde tamamen atlanır. Büyük runtime/upload alanlarında gereksiz I/O azaltılır.
7. DB snapshot öncesi information_schema üzerinden yaklaşık DB boyutu hesaplanır ve yeterli boş disk alanı kontrol edilir.
8. DB parolası artık `MYSQL_PWD` process environment değişkenine konmaz.
9. DB credential'ları 0600 izinli geçici `.cnf` dosyasında tutulur.
10. `mysqldump`, `--defaults-extra-file` ile bu geçici credential dosyasını kullanır.
11. Geçici credential dosyası process başarı/başarısızlık fark etmeksizin temizlenir.
12. DB parolası argv içine yazılmaz.
13. Uygulama ve DB backup'ları için SHA-256/byte bilgisi `storage/backups/recovery.json` içinde tutulur.
14. Recovery manifest; eski sürüm, hedef sürüm, hedef commit, bekleyen migrationlar ve legacy schema durumunu içerir.
15. DB/file mutation başlamadan önce manifest `ready_before_mutation` olarak yazılır.
16. Başarılı kurulumda manifest `update_completed` olur.
17. DB mutation sonrası hata `update_failed_after_database_mutation`, dosya aktivasyonu sırasında hata `update_failed_during_file_activation` olarak işaretlenir.
18. Recovery manifest otomatik restore çalıştırmaz; `manual_restore_only=true` ile kontrollü bakım gerektirir.
19. Güncelleme API yanıtı uygulama backup, DB backup ve recovery manifest adını döndürür.
20. Güncelleme ekranı bu üç recovery artifact'ini kullanıcıya gösterir.
21. Sistem Durumu ekranı son recovery manifest durumunu gösterir.
22. Gerçek ZIP oluşturma/secret dışlama/SHA-256/recovery manifest davranış testi eklendi.
23. Native DB backup testi artık parolanın environment veya argv üzerinden sızmadığını da doğrular.

## Neden otomatik restore eklenmedi?

Yanlış hedef DB'ye veya yanlış zamandaki snapshot'a otomatik restore, çalışan canlı veriyi geri döndürülemez biçimde ezebilir. 1.1.100 recovery materyalini doğrular ve operatöre bırakır; restore bilinçli bakım adımı olarak kalır.

## Bilinen kalan altyapı konusu

`src/bootstrap.php`, `styles.css`, `app-runtime.js`, `database/schema.sql`, `database/seed.sql` Git geçmişinde hiç bulunmamıştır. Çalışan canlı sunucudan gerçek kopyalar alınmadan temiz kurulum kaynağı tamamlanamaz.
