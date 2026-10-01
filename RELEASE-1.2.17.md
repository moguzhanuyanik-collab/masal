# İlkAdım 1.2.17

## 1.1.97 → 1.2.1 recovery migration geçmişi güvenlik düzeltmesi

### Hata analizi

1.1.97'den doğrudan 1.2.1'e recovery yapan akışta 064 checkpointi zaten kayıtlıysa, eski `assert_historical_migration_history()` kontrolü 1.1.97 için erken çıkıyordu.

Bu durum teorik olarak şu hatalı senaryoya izin verebilirdi:

- 064 migration kaydı mevcut,
- 001–063 arasındaki eski migration kayıtlarından biri eksik,
- updater eksik geçmişi fark etmeden 065/066 tenant migrationlarına geçiyor.

Bu, 1.1.98'de tanımlanan fail-closed migration geçmişi güvenlik sözleşmesiyle uyumsuzdu.

### Düzeltme

- 1.1.97 direct recovery artık 001–063 migration geçmişini de doğruluyor.
- Yalnızca 064 checkpointinin eksik olması recovery için izinli istisna olarak bırakıldı.
- 064 mevcutsa bile 001–063 kontrolü atlanmıyor.
- Tarihsel geçmiş doğrulaması 064 checkpoint recovery'den önce çalışıyor.
- Yeni regression testi kalite kapısına eklendi.

### Veri güvenliği

Bu düzeltme mevcut kullanıcı, öğrenci, kurum veya içerik verisini değiştirmez. Amaç yalnızca bozuk migration geçmişinin 065/066 tenant dönüşümüne ilerlemesini engellemektir.

## Rev 1

- 1.2.17 release metadata üçlü ankrajı `version.json`, `update-release.json` ve managed manifest üzerinde eşitlendi.

## Rev 2 — kalite kapısı uyumluluğu

- 1.1.98 tarihsel migration güvenliği testindeki eski 1.1.98-only guard beklentisi, 1.1.97 direct recovery için eklenen yeni fail-closed sözleşmeyle hizalandı.
- Uygulama davranışı değiştirilmedi; yalnız regression testi güncel sözleşmeyi doğruluyor.
