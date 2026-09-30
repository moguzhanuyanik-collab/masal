# İlkAdım 1.1.98

Taban: 1.1.97 / be2651c5e375e3b54c0735d7283820a6ec9eb581.

## Hedef

Migration geçmişi bozulduğunda eski veri/içerik migrationlarının yeniden çalışmasını engellemek ve AdımBot sağlayıcı maliyetini session değiştirerek aşılabilen limiter yerine kalıcı DB limitiyle korumak.

## Düzeltilenler

1. 064 migration checkpoint eklendi.
2. 1.1.96/1.1.97 seviyesine ulaşmış sistemde 53 non-retired geçmiş migration kaydından biri eksikse 1.1.98 kurulumu durur.
3. Eksik geçmişte eski migrationlar tekrar çalıştırılmaz; veri/içerik kaybı riski fail-closed ele alınır.
4. `adimbot_rate_limitleri` tablosu eklendi.
5. AdımBot sohbet limiti öğrenci, öğrenci+IP ve IP kapsamlarında kalıcı DB sayaçlarıyla korunur.
6. Ses transkripsiyonu aynı kalıcı rate-limit altyapısını kullanır.
7. Ortak okul/kurum ağlarını gereksiz kilitlememek için IP geneli eşiği öğrenci+IP eşiğinden daha yüksektir.
8. Kalıcı limiter tablosu yoksa veya DB limiter kullanılamazsa eski session limiti fallback olarak devam eder.
9. Limiter satır oluşturma yarışı `INSERT IGNORE + SELECT ... FOR UPDATE` ile seri hale getirilir.
10. Yedi günden eski limiter sayaçları küçük partiler halinde temizlenir.
11. 1.1.98 updater, sonraki sürümlerde 064 ve öncesi migration geçmişini yeniden doğrular.
12. 065+ migrationlarda DROP/MODIFY/CHANGE/RENAME türü şema daraltmaları otomatik zincirde engellenir.
13. 065+ veri silen migrationlar açık `ILKADIM_ALLOW_TRANSACTIONAL_DELETE` markerı olmadan çalışmaz.
14. Transaction-safe, DDL içermeyen yeni DML migrationları migration kaydıyla aynı transaction içinde çalıştırılır.
15. 1.1.97'nin eklediği AdımBot mikrofon/transkript regresyonları ana CI kalite kapısına bağlandı.
16. 1.1.97 commitinde güncellenmediği için main CI'yı düşüren managed-file manifesti 1.1.98'de yeniden senkronlanır.

## Not

Kalıcı limiter bir sağlayıcı kota sistemi değildir; uygulama tarafında abuse/maliyet sınırıdır. Sağlayıcının kendi quota/rate-limit davranışı ve `Retry-After` aktarımı ayrıca korunur.

Tam MySQL snapshot/restore halen sunucu altyapısı doğrulanmadan otomatikleştirilmemiştir.
