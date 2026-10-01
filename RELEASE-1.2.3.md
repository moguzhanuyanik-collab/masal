# İlkAdım 1.2.3

## 1.1.97 doğrudan güncelleme kurtarma köprüsü

### Hata analizi

1.1.97'den başlayan eski kurulumlarda ilk kırılma noktası 1.1.98 bridge/recovery zinciriydi. Legacy kurum üyeliği dönüşümü ile 064 migration checkpoint'inin sırası ve sonraki updater çekirdeğinin devreye alınması aynı akışa bağlandığında kurulum yarım kalabiliyordu. Sonraki denemelerde zincir sıralaması, gerçek GitHub commit SHA'sı ve DB migration preflight ayrı ayrı düzeltildi; ancak eski 1.1.97 kurulumunun güvenli updater çekirdeğine geçişi hâlâ tek bir dayanıklı köprüyle çözülmemişti.

### Düzeltme

- Mevcut `rescue-1.1.97-to-1.1.98.php` tek kurtarma dosyası korunarak doğrudan güncel ve doğrulanmış `main` updater çekirdeğine bağlandı.
- Rescue önce gerçek 40 karakterlik GitHub HEAD SHA'sını çözüyor.
- Aynı SHA üzerinden `version.json`, `update-release.json` ve `src/updater.php` okunuyor.
- Hedef updater, 1.1.97 legacy recovery fonksiyonlarını ve güvenli updater handoff fonksiyonlarını içermiyorsa kabul edilmiyor.
- Mevcut `src/updater.php` SHA-256 ile yedekleniyor.
- Yeni updater SHA-256 doğrulandıktan sonra atomik olarak etkinleştiriliyor.
- Etkinleştirme başarısız olursa eski updater SHA-256 doğrulanarak otomatik geri yükleniyor.
- Rescue aşamasında veritabanına SQL çalıştırılmıyor; migrationlar normal Güncelleme Merkezi tarafından yürütülüyor.
- Yeni regression testi ve sequential chain testi 1.2.3'e hizalandı.

### Sonuç

1.1.97 kurulumunun bozuk ara bridge'lere takılması yerine tek güvenli updater-core handoff ile güncel recovery motoruna geçmesi sağlandı. DB dönüşümü rescue içinde yapılmaz; yeni updater sonraki istekte normal backup + migration + activation akışını yürütür.
