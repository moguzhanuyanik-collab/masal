# İlkAdım 1.2.22

## Öğretmen Ödevlerim teslim performansı dashboard'u

Bu sürüm, Öğretmen → Ödevlerim ekranını yalnız yayın listesi olmaktan çıkarıp ödev teslim performansının görülebildiği bir takip paneline dönüştürür.

### Ödev kartlarında gerçek teslim özeti

Her ödev kartında artık:

- Hedef öğrenci sayısı
- Tamamlayan öğrenci sayısı
- Geciken öğrenci sayısı
- Bekleyen öğrenci sayısı

gösterilir.

Ödevin teslim performansı şu durumlarla özetlenir:

- **Tümü tamamlandı**
- **Gecikme var**
- **Devam ediyor**
- **Hedef öğrenci yok**

### Yayın durumu ve teslim performansı ayrıldı

Ödevin:

- Yayında / Pasif olması
- Öğrencilerin teslim performansı

artık iki ayrı bilgi olarak takip edilir.

Pasife alınmış eski bir ödevin tamamlanma / gecikme geçmişi kaybolmaz.

### Filtreler

Ödevlerim ekranı şu filtreleri destekler:

- Kurum
- Yayın durumu
  - Tümü
  - Yayında
  - Pasif
- Teslim performansı
  - Tümü
  - Devam ediyor
  - Gecikme var
  - Tümü tamamlandı
  - Hedef öğrenci yok

### Dashboard özeti

Üst bölümde:

- Toplam ödev
- Yayındaki ödev
- Tümü tamamlanan ödev
- Gecikme bulunan ödev
- Devam eden ödev
- Hedef öğrencisi kalmayan ödev

sayıları gösterilir.

### Tenant ve hedef güvenliği

Yeni `src/ogretmen_odev_dashboard.php` domain katmanı:

- aktif öğretmen profilini,
- öğretmenin aktif kurum üyeliğini,
- `ogretmen_ogrenci.kurum_id` ilişkisini,
- öğrencinin aktif profilini,
- öğrencinin aktif kullanıcı hesabını,
- öğrencinin aynı kurumda aktif üyeliğini,
- seçili öğrenci hedeflemesini

birlikte doğrular.

Başka kurum öğrencisi, öğretmene bağlı olmayan öğrenci veya pasif kullanıcı teslim sayılarına dahil edilmez.

### Gecikme hesabı

Geciken öğrenci:

- ödevi tamamlamamış,
- geçerli hedef öğrenci,
- teslim tarihi tanımlı,
- teslim tarihi geçmiş

öğrencidir.

Bekleyen sayısı:

`hedef - tamamlanan - geciken`

olarak hesaplanır. Böylece geciken öğrenciler bekleyen sayısına ikinci kez dahil edilmez.

### Arayüz

Yeni `ogretmen-odevleri.css` yalnız Ödevlerim dashboard'u için eklendi.

Mevcut genel öğretmen tasarımı değiştirilmedi.

### Test

Yeni testler:

- `tests/teacher-homework-dashboard-147.cjs`
- `tests/teacher-homework-dashboard-db-147.php`

MariaDB entegrasyon testi:

1. Öğretmenin iki aktif kurumunu doğrular.
2. Tüm öğrencilere verilen ödevde pasif kullanıcıyı hedef sayısından çıkarır.
3. Tamamlanan / geciken / bekleyen sayılarını doğrular.
4. Seçili öğrenci hedefini doğrular.
5. Öğretmene bağlı olmayan seçili öğrenciyi hedef saymaz.
6. Yayında / pasif filtrelerini doğrular.
7. Gecikme / tamamlandı / hedefsiz teslim filtrelerini doğrular.
8. Başka kurum ödevini ayrı tenant kapsamında tutar.
9. Öğretmen kurum üyeliği pasife alındığında o kurum ödevlerini kapatır.
