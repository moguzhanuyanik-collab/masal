# İlkAdım 1.2.35

## Kurum hazırlık ve onboarding merkezi

Bu sürüm, İlkAdım'ın kurumsal satış ve ilk kurulum sürecinde eksik olan **kurum hazırlık görünürlüğünü** ekler.

### Yeni: Kurum Hazırlık

Yönetici Paneli ve Kurum Detay ekranında salt-okunur bir hazırlık kontrol alanı bulunur.

Kontrol edilen temel adımlar:

- en az bir aktif öğretmen,
- en az bir aktif öğrenci,
- en az bir aktif veli,
- en az bir aktif sınıf / grup,
- en az bir öğrencinin aktif sınıf / gruba atanması,
- aktif kurum öğretmeninden en az bir yayın.

Her adım **Tamam / Eksik** olarak gösterilir ve toplam kurulum yüzdesi hesaplanır.

### Neden eklendi?

Yeni bir kurum sisteme alındığında yönetici artık hangi temel kurulum adımlarının eksik olduğunu tek ekranda görebilir.

Bu, demo ve satış sonrası devreye alma sırasında:

- boş kurum hesabının fark edilmesini,
- öğretmen / öğrenci / veli girişlerinin tamamlanmasını,
- sınıf yapısının kurulmasını,
- ilk öğretmen yayınının yapılmasını

kolaylaştırır.

### Güvenlik ve tenant izolasyonu

Hazırlık hesabı yalnız seçili kurumun aktif kayıtlarını kullanır.

Özellikle öğretmen içeriği sayılırken:

- içerik kurumu,
- öğretmen profili,
- öğretmenin aktif kurum üyeliği

birlikte doğrulanır.

Başka kurum verisi hazırlık yüzdesine karışmaz.

### Veri güvenliği

Bu özellik:

- kayıt eklemez,
- kayıt güncellemez,
- kayıt silmez,
- migration çalıştırmaz.

Tamamen mevcut tablolardan salt-okunur durum üretir.

### Migration

Yeni migration yoktur.

### Test

Yeni testler:

- `tests/institution-readiness-160.cjs`
- `tests/institution-readiness-db-160.php`

MariaDB entegrasyon testi iki farklı kurumla tenant izolasyonu, aktif/pasif kayıt davranışı, sınıf ataması ve öğretmen yayını koşullarını doğrular.
