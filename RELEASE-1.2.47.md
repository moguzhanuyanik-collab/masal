# İlkAdım 1.2.47

## Kurum Lisans Erişim Politikası

Bu sürüm 1.2.46 ile sertleştirilen paket/lisans durumunu gerçek uygulama erişimine bağlar.

Yeni migration yoktur.

Migration zinciri:

`079`

olarak kalır.

### Amaç

Önceki sürümlerde askıda, iptal veya süresi dolmuş kurum lisansı AdımBot tarafında engellenebiliyordu ancak aynı kurumun:

- öğrenci,
- veli,
- öğretmen,
- yönetici operasyon modülleri

normal web akışında çalışmaya devam edebiliyordu.

1.2.47 bu boşluğu kurum bazlı merkezi erişim politikasıyla kapatır.

### Kurum Bazlı Lisans Erişim Durumu

Yeni merkezi resolver:

`auth_institution_license_access()`

her kurum için şu durumları değerlendirir:

- kurum aktif mi,
- kurumda lisans var mı,
- lisansın paketi mevcut mu,
- paket aktif mi,
- lisans askıda mı,
- lisans iptal mi,
- lisans henüz başlamadı mı,
- lisans süresi doldu mu,
- lisans aktif/deneme ve tarih aralığında mı.

### Geriye Uyumlu Kurumlar

Bir kurumda hiç lisans kaydı yoksa mevcut legacy davranış korunur.

Durum:

`legacy_unlicensed`

olarak değerlendirilir ve operasyonel erişim açık kalır.

Bu sayede eski kurumlar 1.2.47 kurulunca otomatik kilitlenmez.

### Operasyonel Olarak Kapalı Durumlar

Aşağıdaki kurumlar öğrenci/veli/öğretmen operasyonlarından çıkarılır:

- Lisans askıda
- Lisans iptal
- Lisans süresi dolmuş
- Lisans henüz başlamamış
- Lisansın paketi pasif
- Lisans paket kaydı eksik
- Kurum pasif
- Lisans durumu tanımsız / kullanıma kapalı

### Öğrenci / Veli / Öğretmen Hesapları

Bu üç rol için merkezi erişim özeti:

`auth_operational_access_summary()`

kullanılır.

Kullanıcı bağlı olduğu kurumların en az birinde operasyonel erişime sahipse hesabı açık kalır.

Hiçbir bağlı kurum operasyonel kullanıma açık değilse kullanıcı:

`lisans-erisim.php`

sayfasına yönlendirilir.

### Çoklu Kurum İzolasyonu

Bir öğretmen veya veli birden fazla kuruma bağlı olabilir.

Örneğin:

- Kurum A → aktif lisans
- Kurum B → askıda lisans

ise kullanıcı tamamen kilitlenmez.

Ancak:

- kurum listesi,
- öğrenci erişim kapsamı,
- öğretmen/veli öğrenci ilişkileri

yalnız Kurum A üzerinden çalışır.

Askıdaki Kurum B operasyonel veri kapsamına dahil edilmez.

### Ham ve Operasyonel Kurum Üyeliği Ayrımı

Yeni iki seviye vardır.

Ham üyelik:

`auth_user_institution_ids_raw()`

Gerçek kurum üyeliğini lisans durumundan bağımsız döndürür.

Operasyonel üyelik:

`auth_user_institution_ids()`

öğrenci/veli/öğretmen rollerinde yalnız operasyonel olarak açık kurumları döndürür.

Bu ayrım sayesinde lisans kısıtlı kullanıcı:

- eğitim modüllerine erişemez,
- fakat bağlı olduğu kurum üzerinden destek talebi açabilir.

### Destek Merkezi Kısıtlanmaz

`destek.php`

lisans erişim kapısının güvenli allowlist'indedir.

Destek merkezi kurum seçiminde ham üyelik kullanır.

Bu nedenle lisansı askıda/süresi dolmuş kullanıcı:

- destek talebi açabilir,
- mevcut destek geçmişini görebilir,
- lisans/paket sorununu kurumu adına bildirebilir.

Pasif kurum üyeliği de destek seçiminde görünür kalır ve ekranda:

`Pasif kurum`

olarak işaretlenir.

### Hesap Güvenliği Açık Kalır

Kısıtlı kullanıcı aşağıdaki güvenli hesap akışlarına erişmeye devam eder:

- Hesap Güvenliği
- Yasal belge onayı
- Çıkış
- Şifre kurtarma

Bu erişimler lisans yenileme sürecinde kullanıcının hesabına ulaşabilmesini sağlar.

### Lisans Erişim Durum Sayfası

Yeni sayfa:

`lisans-erisim.php`

Kullanıcı burada kurum bazında:

- kurum adı,
- lisans erişim nedeni,
- paket adı,
- başlangıç tarihi,
- bitiş tarihi,
- Açık / Kapalı durumu

görebilir.

Ayrıca:

- Destek Merkezi
- Hesap Güvenliği
- erişim açıksa rol paneline dönüş

kısayolları bulunur.

Sayfa açıkça belirtir:

Kısıtlama hesabı veya geçmiş veriyi silmez.

Lisans yeniden açıldığında erişim otomatik devam eder.

### Web Erişim Kapısı

`require_login()`

artık:

1. yasal belge onayını,
2. kurum lisans erişim politikasını

sırasıyla uygular.

Öğrenci/veli/öğretmenin tüm kurumları operasyonel olarak kapalıysa normal uygulama sayfasına geçiş yapılamaz.

### Öğrenci API Kapısı

`require_api_student()`

lisans politikasını JSON seviyesinde uygular.

Lisans nedeniyle erişim yoksa:

- HTTP 403
- `institution_license_required: true`
- `license_reasons`

döner.

### Rapor API Kapısı

`require_api_student_access()`

da aynı merkezi lisans politikasına bağlandı.

Böylece öğrenci, veli veya öğretmen:

`api/report.php`

gibi öğrenci verisi döndüren uçları doğrudan çağırarak web lisans kapısını aşamaz.

### Giriş Sonrası Yönlendirme

`auth_post_login_url()`

kullanıcının tüm kurumları lisans nedeniyle kapalıysa doğrudan:

`lisans-erisim.php`

döndürür.

Bu sayede kullanıcı rol ana sayfasına gidip yeniden yönlendirilme döngüsü yaşamaz.

### Yönetici Kontrollü Erişim

Kurum yöneticisi tamamen kilitlenmez.

Yönetici:

- yönetici panelini,
- lisans durumunu,
- Destek Merkezi'ni,
- Hesap Güvenliği'ni

görebilir.

Ancak seçilen kurumun lisansı operasyonel değilse panelde:

`Operasyonel Modüller Geçici Olarak Kapalı`

uyarısı gösterilir.

### Yönetici Operasyonlarının Doğrudan URL Koruması

Yeni:

`auth_operational_manageable_institution_ids()`

helper'ı yöneticinin yalnız operasyonel lisanslı kurumlarını yazma/operasyon kapsamına alır.

Ortak:

`ky_assert_manageable()`

artık yönetici için bu scope'u kullanır.

Bu nedenle lisansı kapalı kurumda doğrudan URL ile:

- öğrenci yönetimi,
- veli yönetimi,
- öğretmen yönetimi,
- kurum detay,
- sınıf/grup,
- içerik,
- rapor,
- eşleştirme

sayfalarına girme girişimi reddedilir.

Süper Admin bu kısıttan etkilenmez.

### Yönetici Duyuruları

Kurum yöneticisinin duyuru gönderme akışı da yalnız:

`auth_operational_manageable_institution_ids()`

kapsamındaki kurumları kullanır.

Lisansı kapalı kuruma yeni operasyonel duyuru gönderilemez.

### Süper Admin

Süper Admin:

- askıdaki,
- iptal,
- süresi dolmuş

kurumları yönetmeye devam eder.

Bu gereklidir çünkü lisans/paket durumunun düzeltilmesi, destek ve operasyonel müdahale Süper Admin üzerinden yapılabilir.

### Testler

Yeni testler:

- `tests/institution-license-access-172.cjs`
- `tests/institution-license-access-db-172.php`

Testler şunları doğrular:

1. lisanssız legacy kurumun açık kalmasını,
2. aktif lisanslı kurumun açık kalmasını,
3. askıdaki lisansın kapatılmasını,
4. süresi dolmuş lisansın kapatılmasını,
5. henüz başlamamış lisansın kapatılmasını,
6. pasif paketli lisansın kapatılmasını,
7. iptal lisansın kapatılmasını,
8. pasif kurumun kapatılmasını,
9. yalnız askıdaki kuruma bağlı öğrencinin tamamen kısıtlanmasını,
10. destek için ham kurum üyeliğinin korunmasını,
11. operasyonel kurum üyeliğinin askıdaki kurumu dışlamasını,
12. aktif + askıda iki kuruma bağlı öğretmenin yalnız aktif kurumu kullanabilmesini,
13. legacy kuruma bağlı velinin geriye uyumlu kalmasını,
14. yöneticinin askıdaki kurumu panel scope'unda görmeye devam etmesini,
15. askıdaki kurumun operasyonel manager scope'undan çıkarılmasını,
16. doğrudan kurum yönetim işleminin reddedilmesini,
17. Süper Admin'in askıdaki kurumu yönetebilmeye devam etmesini.

### Veri Değişikliği

Bu sürüm:

- lisans kayıtlarını otomatik değiştirmez,
- kurum üyeliklerini silmez,
- kullanıcıları pasife almaz,
- geçmiş eğitim verisini silmez.

Yalnızca erişim kapsamını mevcut lisans durumuna göre hesaplar.
