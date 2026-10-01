# İlkAdım 1.1.116

## Güncelleme motoru + kurum eşleştirme şema uyumluluğu

- 1.1.115 ile eklenen 065 kurum bazlı eşleştirme migration'ının gerçek updater güvenlik katmanından geçemediği tespit edildi.
- Updater, 065 migration'ındaki yalnızca kurum ilişkisi tablolarına yönelik güvenli primary-key genişletmesini ve `kurum_id` alanının `NOT NULL DEFAULT 0` sözleşmesine geçirilmesini açık marker ile kabul edecek şekilde düzeltildi.
- Marker dışında kalan DROP/MODIFY/CHANGE/RENAME işlemleri yine fail-closed olarak engelleniyor.
- 065 migration'ına güvenli şema değişikliği marker'ı eklendi.
- Gerçek migration dosyası updater güvenlik fonksiyonundan geçiriliyor ve marker'ın kötüye kullanımını test eden regression eklendi.
- CI, yeni updater migration güvenlik testini çalıştırıyor.
- Sürüm metadata ve managed-files manifesti 1.1.116 olarak eşitlendi.

## Hedef

1.1.113 ve önceki sürümlerden kurum eşleştirme izolasyonu güncellemelerine geçişte updater'ın kendi güvenlik filtresi nedeniyle gereksiz şekilde durmasını önlemek; güvenlik filtresinin genel fail-closed davranışını korumak.
