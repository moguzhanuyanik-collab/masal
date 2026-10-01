# İlkAdım 1.2.16

## Kurum İçerikleri öğrenci durum detayı

Bu sürüm, Yönetici / Süper Admin tarafındaki **Kurum İçerikleri** ekranını öğrenci bazlı detay görünümüyle tamamlar.

### Yeni İçerik Detayı sayfası

Yeni `kurum-icerik-detay.php` sayfası eklendi.

Yönetici, kendi yönetebildiği kurum içindeki bir öğretmen yayını için:

- hedef öğrenci sayısını,
- soru cevaplayan öğrenci sayısını,
- doğru / yanlış sayılarını,
- bekleyen öğrenci sayısını,
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

Detay ekranında:

- öğretmen,
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

Yönetici hedef öğrenci satırından mevcut **Öğrenci Raporu** ekranına geçebilir.

Geçişte `kurum_id` korunur. Öğrenci Raporu tarafındaki mevcut aktif kurum üyeliği doğrulaması sayesinde geri bağlantısı yalnız doğrulanmış kurum bağlamında Kurum Raporları ekranına döner.

### Tenant ve yetki güvenliği

Yeni `src/kurum_icerik_detay.php` domain katmanı:

- içerik sorgusunu hem `id` hem `kurum_id` ile sınırlar,
- içerik öğretmeninin aktif kurum üyeliğini doğrular,
- öğretmen-öğrenci ilişkisini aynı kurumla eşleştirir,
- öğrencinin aktif kurum üyeliğini aynı kurumda doğrular,
- seçili öğrenci hedeflemesini korur,
- başka kurum öğrencisini sonuç kümesine dahil etmez.

Sayfa ayrıca:

- `ky_assert_manageable()`
- `yy_can(..., 'kurum_goruntule')`

kontrollerini kullanır.

### Salt okunur yönetici akışı

Kurum İçerikleri ekranı denetim amaçlı salt okunur kalır.

Yönetici:

- içeriği değiştiremez,
- kopyalayamaz,
- aktif/pasif durumunu değiştiremez.

Bu işlemler yalnız ilgili öğretmenin İçeriklerim ekranında yapılır.

### Kurum İçerikleri bağlantısı

Her içerik kartına **Detay** butonu eklendi.

Mevcut filtreler ve özet kartları korunur.

### Test

Yeni testler:

- `tests/institution-content-detail-141.cjs`
- `tests/institution-content-detail-db-141.php`

MariaDB entegrasyon testi:

1. Kurum içindeki soru yayınının iki hedef öğrencisini getirir.
2. Doğru / yanlış öğrenci sayılarını doğrular.
3. Başka kurum öğrencisinin sonuçlara sızmadığını doğrular.
4. Seçili öğrenciye verilen ödevde yalnız hedef öğrenciyi döndürür.
5. Geciken ödevi doğru hesaplar.
6. Başka kuruma ait içerik kimliğinin aynı kurum bağlamında okunmasını engeller.
7. İçerik öğretmeninin aktif kurum üyeliği kaldırılırsa detay görünümünü kapatır.
