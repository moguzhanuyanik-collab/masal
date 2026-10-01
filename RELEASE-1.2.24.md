# İlkAdım 1.2.24

## Öğrenci Ödevlerim teslim dashboard'u

Bu sürüm, Öğrenci → Ödevlerim ekranını düz listeden teslim odaklı bir dashboard'a dönüştürür.

### Dashboard özeti

Öğrenci artık üst bölümde:

- Toplam ödev
- Bekleyen
- Geciken
- Tamamlanan
- Tamamlama oranı
- Sıradaki teslim tarihi

bilgilerini birlikte görür.

### Filtreler

Ödevler şu filtrelerle daraltılabilir:

- Kurum
- Teslim durumu
  - Tümü
  - Gecikenler
  - Bekleyenler
  - Tamamladıklarım

Kurum filtresi yalnız öğrencinin gerçekten erişebildiği aktif öğretmen ödevlerinden oluşur.

### Aciliyet sırası

Liste şu sırada gösterilir:

1. Geciken ödevler
2. Bekleyen ödevler
3. Tamamlanan ödevler

Aynı durum içindeki ödevler teslim tarihine göre sıralanır.

Tamamlanan ödevlerde en son tamamlanan kayıtlar öne alınır.

### Ödev kartları

Kartlarda:

- Ders
- Öğretmen
- Kurum
- Konu
- Teslim tarihi
- Tamamlanma tarihi
- Bekliyor / Gecikti / Tamamlandı

durumu gösterilir.

Geciken ödevlerde ayrıca uyarı alanı gösterilir.

### Mevcut tamamlama akışı korundu

Öğrenci:

- Tamamladım
- Tekrar bekliyor yap

işlemlerini kullanmaya devam eder.

İşlem yine mevcut `oi_set_homework_completed()` güvenlik katmanından geçer.

### Tenant güvenliği

Dashboard yeni veri sorgusu açmaz.

Kaynak veri yine `oi_student_contents()` üzerinden gelir ve:

- aktif öğrenci hesabı,
- aktif kurum üyeliği,
- aktif öğretmen üyeliği,
- öğretmen–öğrenci kurum ilişkisi,
- seçili öğrenci hedeflemesi,
- içerik aktifliği

kurallarını korur.

### Yeni domain

Yeni `src/ogrenci_odev_dashboard.php`:

- ödevleri ayıklar,
- erişilebilir kurum listesini üretir,
- durum filtresini uygular,
- aciliyet sırasını belirler,
- dashboard özetini ve sıradaki teslim tarihini hesaplar.

### Test

Yeni testler:

- `tests/student-homework-dashboard-149.cjs`
- `tests/student-homework-dashboard-db-149.php`

MariaDB testi:

1. Öğrencinin yalnız erişebildiği aktif ödevleri getirdiğini doğrular.
2. Başka öğrenciye seçili ödevin sızmadığını doğrular.
3. Pasif ödevi dışarıda bırakır.
4. İki kurum filtresini doğrular.
5. Geciken / bekleyen / tamamlanan sırasını doğrular.
6. Teslim durumu filtrelerini doğrular.
7. Tamamlama oranını doğrular.
8. Sıradaki teslim tarihini doğrular.
9. Öğrenci kurum üyeliği pasif olunca o kurum ödevlerinin kapanmasını doğrular.
