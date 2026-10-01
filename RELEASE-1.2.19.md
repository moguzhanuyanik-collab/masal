# İlkAdım 1.2.19

## Veli Öğrenci Raporu kurum izolasyonu

Bu sürüm, Veli hesabından açılan Öğrenci Raporu'nda öğretmen içeriklerinin yanlış kurumdan karışabilme riskini kapatır.

### Sorun

Veli bir öğrenciye en az bir kurum üzerinden yetkiliyse mevcut `can_access_student` kontrolü öğrencinin genel raporunu açmaya izin veriyordu.

Ancak öğrenci aynı anda başka bir kurumda da aktifse ve rapor `kurum_id` olmadan açılırsa öğretmen soru / ödev içerikleri öğrenci bazlı sorgudan tüm aktif kurumlar üzerinden gelebiliyordu.

Bu durum özellikle:

- öğrenci iki kurumda aktifse,
- veli yalnız bir kurumda `veli_ogrenci` ilişkisine sahipse,
- diğer kurumda farklı öğretmen içerikleri bulunuyorsa

veli raporunda yetkili olmadığı kurum öğretmen verisinin görünmesine yol açabilirdi.

### Yeni güvenli rapor bağlamı

`src/veli_icerikleri.php` içine yeni `vi_parent_report_context()` eklendi.

Bir veli için rapor kurum bağlamı ancak şu koşulların tamamı sağlanırsa geçerlidir:

- veli profili aktif,
- öğrenci aktif,
- `veli_ogrenci` ilişkisi aynı `kurum_id` ile mevcut,
- veli aynı kurumda aktif `veli` üyesi,
- öğrenci aynı kurumda aktif `ogrenci` üyesi,
- kurum aktif.

Yalnız veli ve öğrencinin aynı kurumda üyeliğinin bulunması yeterli değildir; fiziksel `veli_ogrenci.kurum_id` ilişkisi zorunludur.

### Tek kurum

Veli-öğrenci ilişkisi yalnız bir aktif kurumdaysa Öğrenci Raporu kurum belirtilmeden açılsa bile sistem bu kurumu otomatik doğrular ve raporu o kurum kapsamında açar.

Öğretmen soru ve ödevleri yalnız bu kurumdan gösterilir.

### Birden fazla kurum

Veli aynı çocukla birden fazla gerçek kurum ilişkisine sahipse sistem kurumları sessizce birleştirmez.

Rapor açılmadan önce **Rapor Kurumu** seçim ekranı gösterilir.

Veli hangi kurum kapsamında rapor görmek istediğini seçer. Böylece:

- öğretmen soruları,
- ödevler,
- kurum sınıf / grup bilgileri

birbirine karışmaz.

### Sahte kurum kimliği

URL'de farklı bir `kurum_id` elle verilirse ve bu kurum için gerçek `veli_ogrenci` ilişkisi yoksa rapor **403** ile reddedilir.

### Veli İçerikleri entegrasyonu

`veli-icerikleri.php` üzerinden Öğrenci Raporu açılırken:

- kullanıcı kurum filtresi seçmişse o kurum,
- çocuk için yalnız bir kurum ilişkisi varsa o kurum

rapor bağlantısına otomatik eklenir.

### Geri dönüş

Doğrulanmış veli raporunda geri bağlantısı:

- **Çocuklarıma Dön**
- `veli-paneli.php#cocuklar`

olarak ayarlandı.

Öğretmen ve yönetici rapor geri dönüş davranışları korunur.

### Test

Yeni testler:

- `tests/parent-report-tenant-scope-144.cjs`
- `tests/parent-report-tenant-scope-db-144.php`

MariaDB entegrasyon testi:

1. Veli ve öğrenciyi iki kurumda da aktif tutar.
2. `veli_ogrenci` ilişkisini yalnız Okul A'da oluşturur.
3. Rapor kurum listesinin yalnız Okul A'yı döndürdüğünü doğrular.
4. Okul A rapor bağlamını doğrular.
5. Okul B üyelikleri aktif olsa bile ilişki yoksa bağlamı reddeder.
6. Veli kurum üyeliği pasif olunca bağlamı kapatır.
7. Öğrenci kurum üyeliği pasif olunca bağlamı kapatır.
8. Gerçek ikinci `veli_ogrenci` ilişkisi eklenince iki kurumun da ayrı rapor bağlamı olarak açılabildiğini doğrular.
