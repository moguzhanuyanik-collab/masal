# İlkAdım 1.2.15

## Öğretmen içerik detay ve öğrenci durum ekranı

Bu sürüm, öğretmenin yayınladığı içeriklerde yalnız toplam sayı görmek yerine öğrenci bazında ayrıntılı durumu incelemesini sağlar.

### Yeni İçerik Detayı sayfası

Yeni `ogretmen-icerik-detay.php` sayfası eklendi.

Öğretmen kendi yayını için:

- hedef öğrenci sayısını,
- cevaplayan öğrenci sayısını,
- doğru / yanlış sayılarını,
- cevap bekleyen öğrenci sayısını,
- ödev tamamlayan öğrenci sayısını,
- geciken ödev sayısını,
- bekleyen ödev sayısını

görebilir.

### Öğrenci bazında durum

Her hedef öğrenci ayrı satırda gösterilir.

Soru içeriklerinde:

- Bekliyor
- Doğru
- Yanlış
- Deneme sayısı
- Cevap tarihi

görünür.

Ödev içeriklerinde:

- Bekliyor
- Tamamlandı
- Gecikti
- Tamamlanma tarihi

görünür.

Diğer içerik türlerinde hedef öğrenci listesi gösterilir.

### İçerik bilgisi

Detay sayfasında:

- kurum,
- ders,
- konu,
- yayın tarihi,
- aktif / pasif durumu,
- soru metni,
- cevap seçenekleri,
- doğru seçenek,
- açıklama,
- ödev teslim tarihi

gösterilir.

### Öğrenci raporuna geçiş

Öğretmen hedef öğrenci satırına dokunduğunda mevcut **Öğrenci Raporu** ekranına geçebilir.

Erişim yine mevcut `can_access_student` yetki katmanıyla korunur.

### Tenant ve sahiplik güvenliği

Yeni `oi_teacher_content_detail()` domain fonksiyonu:

- içeriğin ilgili öğretmene ait olduğunu doğrular,
- öğretmenin kurum üyeliğinin hâlâ aktif olduğunu doğrular,
- öğretmen-öğrenci ilişkisini içerik kurumuyla eşleştirir,
- öğrencinin aktif kurum üyeliğini aynı kurumda doğrular,
- seçili öğrenci hedeflemesini korur,
- başka kurum öğrencisini sonuç kümesine dahil etmez.

Başka öğretmen aynı içerik kimliğini bilse bile detay verisini alamaz.

### İçeriklerim bağlantısı

Her içerik satırına **Detay** butonu eklendi.

Mevcut Düzenle / İncele, Kopyala ve Aktif/Pasif işlemleri korunur.

### Test

Yeni testler:

- `tests/teacher-content-detail-140.cjs`
- `tests/teacher-content-detail-db-140.php`

MariaDB entegrasyon testi:

1. Tüm bağlı öğrencilere gönderilen soruda hedef öğrenci sayısını doğrular.
2. Cevaplayan, doğru ve bekleyen sayılarını doğrular.
3. Başka kurum öğrencisinin sızmadığını doğrular.
4. Seçili öğrenciye verilen ödevde yalnız hedef öğrenciyi döndürür.
5. Geciken ödevi doğru hesaplar.
6. Başka öğretmenin içerik detayına erişimini reddeder.
7. Öğretmenin kurum üyeliği pasife alınırsa detay erişimini kapatır.
