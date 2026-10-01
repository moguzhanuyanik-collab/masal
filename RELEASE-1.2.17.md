# İlkAdım 1.2.17

## Veli öğretmen içerikleri takip merkezi

Bu sürüm, Veli tarafında yalnız ödev görünümüyle sınırlı kalan öğretmen takibini soru, tekrar, ödev ve not içeriklerinin tamamına genişletir.

### Yeni Öğretmen İçerikleri sayfası

Yeni `veli-icerikleri.php` sayfası eklendi.

Veli, kurum kapsamında eşleştirilmiş çocuğu için:

- öğretmen sorularını,
- tekrar içeriklerini,
- ödevleri,
- öğretmen notlarını

tek ekranda görebilir.

### Filtreler

Ekran şu filtreleri destekler:

- Çocuk
- Kurum
- İçerik türü

Kurum filtresi yalnız veli ile çocuk arasında fiziksel `veli_ogrenci.kurum_id` ilişkisi bulunan aktif kurumları gösterir.

### Soru takibi

Öğretmen sorularında veli:

- Bekliyor
- Doğru
- Yanlış
- Deneme sayısı
- Cevap tarihi

bilgilerini görebilir.

Özet alanda:

- toplam öğretmen sorusu,
- yanıtlanan soru sayısı,
- soru doğruluk oranı

gösterilir.

### Ödev takibi

Ödevlerde:

- Bekliyor
- Tamamlandı
- Gecikti
- Teslim tarihi
- Tamamlanma tarihi

gösterilir.

Özet alanda:

- toplam ödev,
- tamamlanan ödev,
- ödev tamamlama oranı,
- geciken ödev sayısı

gösterilir.

Mevcut `veli-odevleri.php` sayfası korunur ve yalnız ödev görmek isteyen veli için erişilebilir olmaya devam eder.

### Veli Paneli

Veli Paneli'ndeki öğretmen takibi alanı iki seçeneğe ayrıldı:

- **Öğretmen İçerikleri**
- **Yalnız Ödevler**

Alt navigasyonda doğrudan **İçerikler** erişimi eklendi.

### Tenant / kurum izolasyonu

Yeni `src/veli_icerikleri.php` domain katmanı:

- veli profilinin aktif olmasını,
- çocuğun aktif olmasını,
- veli-çocuk ilişkisinin aynı `kurum_id` içinde bulunmasını,
- velinin aynı kurumda aktif üyeliğini,
- çocuğun aynı kurumda aktif üyeliğini,
- içerik öğretmeninin aynı kurumda aktif üyeliğini,
- öğretmen-öğrenci ilişkisinin aynı kurumda bulunmasını,
- seçili öğrenci hedeflemesini

zorunlu tutar.

Bu nedenle veli hesabı ve çocuk hesabı iki farklı kurumda aktif olsa bile, `veli_ogrenci` ilişkisi bulunmayan kurumun öğretmen içeriği veliye gösterilmez.

### Salt okunur veli akışı

Veli öğretmen içeriğini değiştiremez, soruya cevap veremez veya ödevi tamamlandı olarak işaretleyemez.

Bu işlemler yalnız öğrencinin kendi hesabında yapılır.

### Test

Yeni testler:

- `tests/parent-teacher-content-142.cjs`
- `tests/parent-teacher-content-db-142.php`

MariaDB entegrasyon testi:

1. Aynı çocuk hesabını iki kurumda aktif tutar.
2. Veli hesabını iki kurumda aktif tutar.
3. Veli-çocuk ilişkisini yalnız bir kurumda tanımlar.
4. Yalnız ilişkili kurumun içeriklerinin göründüğünü doğrular.
5. Başka öğrenciye seçili içeriğin sızmadığını doğrular.
6. Başka kurum içeriğinin sızmadığını doğrular.
7. Soru doğru ve deneme sayısını doğrular.
8. Geciken ödev hesabını doğrular.
9. Veli kurum üyeliği pasife alındığında içerik erişiminin kapanmasını doğrular.
