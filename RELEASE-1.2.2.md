# İlkAdım 1.2.2

## 1.1.97 sonrası kaybolan uygulama zincirinin lossless yeniden kurulması

1.1.119 / 1.2.1 recovery hattının uygulama ağacını 1.1.97 tabanına geri taşıması nedeniyle kaybolan uygulama güncellemeleri, korunmuş GitHub branch/commit ağaçlarından yeniden oluşturuldu.

### Geri kazanılan zincir

- 1.1.98–1.1.113: AdımBot, PWA, güvenlik, kurum/rol, updater recovery, kalite kapıları ve tenant izolasyonu.
- 1.1.114: kurum bazlı eşleştirme izolasyonu ve gerçek MariaDB tenant doğrulaması.
- 1.1.115: kurum eşleştirme şema guard.
- 1.1.116: updater'ın güvenli tenant migration'ını kabul etmesi.
- 1.1.117: kurum eşleştirme CRUD stabilizasyonu ve MariaDB 1452 ayrıştırması.

### Yeni güvenlik katmanı

1.2.2 ile application_generation sözleşmesi eklendi.

Sürüm numarası tek başına artık uygulama kodunun ileri olduğunu kanıtlamıyor. Release; version.json, update-release.json ve update-managed-files.json içinde aynı application_generation değerini taşımak zorunda.

Updater:
- daha eski uygulama neslini taşıyan paketi reddediyor,
- application_generation eksik paketleri güvenli biçimde reddediyor,
- metadata değerlerinin birbirleriyle aynı olduğunu doğruluyor,
- immutable GitHub HEAD commit üzerinden paket indiriyor,
- mevcut updater çekirdeğini daha eski bir paketle geriye düşürmüyor.

Bu nedenle önceki recovery senaryosundaki "sürüm yükseldi ama uygulama ağacı 1.1.97'ye döndü" problemi yeni release hattında tekrar kabul edilmiyor.
