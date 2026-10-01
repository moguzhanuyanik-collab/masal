# İlkAdım 1.2.20

## Yönetici Öğrenci Raporu kurum yetki izolasyonu

Bu sürüm, Yönetici hesabından açılan Öğrenci Raporu'nda kurum bağlamının yalnız öğrencinin kurum üyeliğine göre kabul edilmesi riskini kapatır.

### Sorun

Yönetici bir öğrenciyi kendi yönettiği Okul A üzerinden görmeye yetkiliyse `can_access_student` kontrolü öğrenci raporunu açmasına izin veriyordu.

Öğrenci aynı zamanda Okul B'de de aktifse ve URL'deki `kurum_id` değeri Okul B olarak değiştirilirse eski rapor bağlamı yalnız öğrencinin Okul B üyeliğini doğruluyordu.

Yöneticinin Okul B'yi gerçekten yönetip yönetmediği ayrıca kontrol edilmiyordu.

### Yeni strict yönetici rapor bağlamı

`src/kurum_yonetimi.php` içine:

- `ky_manager_student_report_contexts()`
- `ky_manager_student_report_context()`

eklendi.

Rapor kurumu artık ancak:

- yönetici `kurum_goruntule` iznine sahipse,
- kurum yöneticinin `auth_manageable_institution_ids()` listesinde bulunuyorsa,
- kurum aktifse,
- öğrenci aktifse,
- öğrenci aynı kurumda aktif `ogrenci` üyesiyse

geçerli olur.

### Kurum parametresi verilmişse

Yönetici URL'de `kurum_id` ile rapor açarsa kurum doğrudan kabul edilmez.

`ky_assert_manageable()` ile yönetilebilirlik ve ardından aktif öğrenci üyeliği doğrulanır.

Yetkisiz / sahte kurum kimliği **403** ile reddedilir.

### Kurum parametresi verilmemişse

Yönetici için öğrencinin aktif olduğu kurumlar ile yöneticinin yönetebildiği kurumların kesişimi çıkarılır.

- Tek kurum varsa otomatik scope edilir.
- Birden fazla kurum varsa rapor sorguları başlamadan **Rapor Kurumu** seçimi gösterilir.
- Hiç ortak yönetilebilir kurum yoksa rapor reddedilir.

Bu sayede öğretmen soru ve ödevleri kurumlar arasında karışmaz.

### Yetki sistemi entegrasyonu

`kurum_goruntule` izni kaldırılmış bir yönetici:

- kurum seçim listesini alamaz,
- doğrudan Öğrenci Raporu URL'siyle kurum verisine erişemez.

### Süper Admin

Süper Admin tüm aktif kurumları yönetebilir kabul edildiği için açıkça verilen geçerli `kurum_id` aynı strict öğrenci üyelik doğrulamasından geçirilir.

Kurum parametresi verilmezse mevcut genel Süper Admin rapor davranışı korunur.

### Test

Yeni testler:

- `tests/manager-report-tenant-scope-145.cjs`
- `tests/manager-report-tenant-scope-db-145.php`

MariaDB entegrasyon testi:

1. Öğrenciyi Okul A ve Okul B'de aktif tutar.
2. Yöneticiyi yalnız Okul A yöneticisi yapar.
3. Rapor kurum listesinin yalnız Okul A'yı döndürdüğünü doğrular.
4. Okul A bağlamını doğrular.
5. Okul B `kurum_id` zorlamasını reddeder.
6. Yönetici Okul B'ye de bağlanınca iki kurumun ayrı seçenek olduğunu doğrular.
7. `kurum_goruntule` izni kaldırılınca liste ve doğrudan bağlam erişimini kapatır.
8. Süper Admin'in aktif öğrenci kurumunu açıkça seçebilmesini doğrular.
