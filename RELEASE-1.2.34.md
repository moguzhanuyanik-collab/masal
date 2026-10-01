# İlkAdım 1.2.34

## Kurum raporlarında güvenli CSV dışa aktarım

Bu sürüm, kurum yöneticisi ve Süper Admin tarafındaki **Kurum Raporları** ekranını satış ve operasyon kullanımına daha uygun hale getirir.

### Yeni: CSV İndir

Kurum Raporları ekranına **CSV İndir** aksiyonu eklendi.

Dışa aktarım mevcut rapor filtresini aynen korur:

- kurum,
- sınıf seviyesi,
- sınıf / grup,
- başlangıç tarihi,
- bitiş tarihi.

CSV çıktısı ek bir rapor sorgusu veya farklı yetki yolu kullanmaz; ekrandaki tenant-korumalı `kr_report_rows()` sonucunu kullanır.

### Dışa aktarılan performans alanları

Her öğrenci için:

- öğrenci adı,
- sınıf seviyesi,
- sistem sorusu yanıt / doğru,
- öğretmen sorusu yanıt / doğru,
- toplam doğruluk oranı,
- atanan ödev,
- tamamlanan ödev,
- geciken ödev,
- ödev tamamlama oranı

yer alır.

Ayrıca dosyanın başında kurum ve aktif filtre kapsamı bulunur.

### Excel / Türkçe uyumluluğu

- UTF-8 BOM kullanılır.
- Türkçe Excel bölgesel ayarları için noktalı virgül ayırıcı kullanılır.
- Dosya adı kurum kimliği ve zaman damgasıyla üretilir.

### Güvenlik

CSV hücreleri `=`, `+`, `-` veya `@` ile başlıyorsa formül çalıştırılmasını engellemek için güvenli hale getirilir.

Böylece kurum veya öğrenci adından gelebilecek spreadsheet formula injection riski azaltılır.

Yeni dışa aktarım:

- mevcut yönetici / Süper Admin yetkilendirmesini kullanır,
- kurum kapsamı dışına çıkmaz,
- e-posta gibi ek kişisel veri kolonu eklemez,
- `X-Content-Type-Options: nosniff` başlığıyla gönderilir.

### Migration

Yeni migration yoktur.

### Test

Yeni kaynak regresyon testi:

- `tests/institution-report-export-159.cjs`

Test; filtre korunumu, tenant rapor fonksiyonunun yeniden kullanımı, CSV güvenlik başlıkları, UTF-8 Excel uyumluluğu, formül enjeksiyon koruması ve release manifest sürekliliğini doğrular.
