# İlkAdım 1.1.119 — Rev 2

## 1.1.97 sonrası kaybolan uygulama zincirinin lossless yeniden kurulması

1.1.119 / 1.2.1 recovery hattının uygulama ağacını 1.1.97 tabanına geri taşıması nedeniyle kaybolan uygulama güncellemeleri, korunmuş GitHub branch ve commit ağaçlarından yeniden oluşturuldu.

### Geri kazanılan zincir

- 1.1.98–1.1.113: AdımBot, PWA, güvenlik, kurum/rol, updater recovery, kalite kapıları ve tenant izolasyonu.
- 1.1.114: kurum bazlı eşleştirme izolasyonu ve gerçek MariaDB tenant doğrulaması.
- 1.1.115: kurum eşleştirme şema guard.
- 1.1.116: updater'ın güvenli tenant migration'ını kabul etmesi.
- 1.1.117: kurum eşleştirme CRUD stabilizasyonu ve MariaDB 1452 ayrıştırması.

### Yeni updater güvenliği

Önceki recovery olayında sürüm numarası yükselmiş olmasına rağmen uygulama ağacı 1.1.97 tabanına dönmüştü.

Rev 2 ile application_generation sözleşmesi eklendi:

- Release metadata'sında uygulama nesli taşınır.
- Yerel nesil ile aday nesil karşılaştırılır.
- Daha eski uygulama ağacını taşıyan paket reddedilir.
- application_generation eksik paket reddedilir.
- version.json, update-release.json ve update-managed-files.json aynı nesil değerini taşımak zorundadır.
- Güncelleme sistemi uygulama kodunu yalnız sürüm numarasına bakarak geriye taşıyamaz.

Bu sürüm, kaybolan uygulama zincirini 1.1.119 rev2 olarak yeniden ankrajlar.
