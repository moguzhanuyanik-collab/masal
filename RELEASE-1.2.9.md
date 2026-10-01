# İlkAdım 1.2.9

## Kurum Sınıfları / Grupları

Bu sürüm, Kurum Detay ekranında "Sınıflar / Gruplar" başlığı altında daha sonra yapılacağı belirtilen kurum organizasyon modülünü tamamlar.

### Yeni modül

Yeni `kurum-siniflari.php` sayfası eklendi.

Yönetici veya Süper Admin:

- kurum içi sınıf oluşturabilir,
- çalışma grubu oluşturabilir,
- sınıf veya grubu aktif/pasif yapabilir,
- kurumdaki aktif öğrencileri sınıf/gruba atayabilir,
- mevcut üyeleri güncelleyebilir,
- sınıf, grup ve üye sayılarını kurum seviyesinde görebilir.

### Sınıf seviyesi kuralları

- Sınıf türünde 1–8 arasında seviye seçmek zorunludur.
- Grup türünde sınıf seviyesi isteğe bağlıdır.
- Seviyesi tanımlı sınıf/gruba yalnız aynı sınıf seviyesindeki öğrenciler atanabilir.
- Karma gruplar farklı sınıf seviyelerinden öğrenci alabilir.

### Yetki ve kurum izolasyonu

- Sayfa yalnız Yönetici ve Süper Admin rollerine açıktır.
- Kurum erişimi `ky_assert_manageable` ile doğrulanır.
- Görüntüleme için `kurum_goruntule` yetkisi gerekir.
- Oluşturma, durum değiştirme ve öğrenci atama için `ogrenci_yonet` yetkisi gerekir.
- Öğrenci listesi yalnız ilgili kurumun aktif öğrenci üyeliklerinden oluşturulur.
- Üyelik ekleme ve silme işlemleri her zaman aynı `kurum_id` kapsamında yapılır.
- Bütün değişiklikler audit kaydına yazılır.

### Veritabanı

Yeni migration: `068_kurum_siniflari_ve_gruplar.sql`

Yeni tablolar:

- `kurum_siniflari`
- `kurum_sinif_ogrencileri`

Migration mevcut verileri silmez, tablo düşürmez ve tekrar çalıştırılabilir.

### Navigasyon

- Kurum Detay ekranındaki **Sınıflar / Gruplar** alanı artık aktif sayfaya bağlanır.
- Yönetici Paneli'ne **Sınıflar / Gruplar** hızlı erişimi eklendi.
- Kurum İçerikleri alt navigasyonundan Sınıflar sayfasına geçilebilir.

### Test

- `institution-classes-groups-134.cjs`
- `institution-classes-groups-db-134.php`

Migration MariaDB üzerinde iki kez çalıştırılır; tenant-scope, rol/yetki, CSRF, sınıf seviyesi ve manifest/release sözleşmeleri Quality Gate içinde doğrulanır.
