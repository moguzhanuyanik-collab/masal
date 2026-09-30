# İlkAdım 1.1.101

## Hedef

1.1.96 → 1.1.97 geçişinde ve sonraki sürümlerde updater'ın sürüm numarasının ilk değiştiği commit'i tamamlanmış paket sanması sorununu gidermek; tamamlanmış kurulumu takip eden ağ kontrolü başarısız olduğunda kullanıcıya yanlış hata göstermemek.

## Düzeltilenler

1. 1.1.97, 1.1.98, 1.1.99 ve 1.1.100 için final paket commitleri ana dalda yeniden ankrajlandı.
2. 1.1.97 managed-file manifesti gerçek 1.1.97 dosya ağacıyla eşitlendi.
3. Eski updater kullanan 1.1.96 kurulumları aynı sürüm numarasındaki daha yeni 1.1.97 final ankrajını seçebilir.
4. 1.1.97 sonrasındaki kurulumlar sırasıyla yeniden ankrajlanan 1.1.98, 1.1.99 ve 1.1.100 paketlerini görür; ara güvenlik sürümleri atlanmaz.
5. 1.1.101 ve sonrasında sürüm geçmişi artık `version.json` commitlerine değil `update-release.json` final release ankrajlarına göre taranır.
6. Böylece sürüm numarası geliştirme başında artırılsa bile updater yalnız final release ankrajı yayınlandıktan sonra o sürümü kurulum hedefi olarak görür.
7. Kurulum tamamlandıktan sonraki "sıradaki sürüm" kontrolü ağ/GitHub hatası verirse kurulum sonucu artık başarısız gösterilmez.
8. Post-install kontrol hatası sunucu günlüğüne ayrı `update-post-check` kaydı olarak yazılır.
9. Yeni regresyon testi release ankrajı, sürüm eşleşmesi ve post-install başarı davranışını doğrular.

## Veri güvenliği

Bu sürüm yeni uygulama verisi silmez ve yeni veri migrationı eklemez. Mevcut recovery/yedekleme, managed-file, migration güvenliği ve DB snapshot davranışları korunur.

## Yayın kuralı

1.1.101 sonrasında bir sürüm ancak kod/test çalışması bittikten sonra `update-release.json` o sürüme güncellenerek final ankrajı oluşturulduğunda updater tarafından yayınlanmış sayılır.

## Kalite kapısı revizyonu

İlk 1.1.101 CI çalışmasında uygulama testleri geçmesine rağmen 1.1.100 recovery testinin yalnız tam `1.1.100` kabul eden eski sürüm beklentisi nedeniyle kalite kapısı düştü. Test 1.1.100 ve daha yeni sürümleri kabul edecek şekilde düzeltildi; uygulama davranışı değiştirilmedi.
