# İlkAdım 1.2.45

## Demo / Deneme Kurumu ve Satış Dönüşüm Merkezi

Bu sürüm kurum satış sürecini demo başlangıcından ücretli pakete dönüşüme kadar izlenebilir hale getirir.

Mevcut paket/lisans altyapısı korunur. Ayrı bir ikinci lisans sistemi oluşturulmaz.

### Demo Kurumu Tek İşlemde Oluşturma

Yeni Süper Admin sayfası:

`demo-satis.php`

Demo oluşturma işlemi tek transaction içinde:

1. kurumu oluşturur,
2. seçilen paketle `deneme` lisansı oluşturur,
3. satış yaşam döngüsü kaydı açar,
4. başlangıç sistem notunu ekler,
5. varsa ilk satış notunu ekler.

Herhangi bir adım başarısız olursa transaction geri alınır.

Bu nedenle:

- yarım kurum,
- lisanssız demo,
- kurumsuz satış kaydı

oluşmaz.

### Deneme Süresi

Deneme süresi 1 ile 90 gün arasında seçilebilir.

Varsayılan ekran değeri 14 gündür.

Başlangıç tarihi demo oluşturulduğu gündür.

Bitiş tarihi dahil olacak şekilde örneğin 5 günlük deneme:

- gün 1: başlangıç,
- gün 5: bitiş

şeklinde hesaplanır.

### Satış Kaynağı

Demo fırsatları için kaynak bilgisi tutulabilir:

- Saha Satışı
- Referans
- Web
- Sosyal Medya
- Telefon
- Etkinlik / Fuar
- Diğer

### Satış Notları

Yeni tablo:

`kurum_satis_notlari`

Satış notları append-only tutulur.

Notlar:

- düzenlenmez,
- fiziksel olarak silinmez,
- kullanıcı,
- tarih,
- not türü

ile saklanır.

Durum değişiklikleri de sistem notu olarak satış geçmişine eklenir.

### 7 Günlük Deneme Radarı

Demo & Satış ekranında:

`7 GÜNLÜK RADAR`

alanı bulunur.

Şunları gösterir:

- 7 gün içinde bitecek denemeler,
- bugün bitecek denemeler,
- süresi geçmiş ancak henüz karar verilmemiş fırsatlar.

Süresi dolan deneme otomatik olarak kayıp sayılmaz.

Satış kaydı `deneme` durumunda kalır ancak ekranda etkin durum:

`Süresi Doldu`

olarak gösterilir.

Böylece satış ekibi süre bittikten sonra da fırsatı ücretli pakete çevirebilir.

### Ücretliye Dönüşüm

Devam eden veya süresi dolmuş deneme:

`Ücretliye Dönüştür`

işlemiyle seçilen aktif pakete geçirilebilir.

Yeni bir kurum lisansı açılmaz.

Mevcut tek kurum lisansı:

- paket değiştirir,
- başlangıç tarihi dönüşüm gününe çekilir,
- opsiyonel lisans bitiş tarihi alır,
- `deneme` → `aktif` olur.

Satış kaydı:

- `donustu` durumuna geçer,
- dönüşüm paketi,
- dönüşüm zamanı,
- son temas tarihi

ile güncellenir.

Dönüşüm sistem notu satış geçmişine eklenir.

### Ticari Finans Ayrımı

Demo satış dönüşümü otomatik sözleşme veya tahsilat oluşturmaz.

Ücretli pakete dönüşümden sonra:

- resmi/ticari sözleşme,
- tahsilat,
- ödeme geçmişi

`Ticari Finans` modülünde ayrıca yönetilir.

Bu ayrım satış operasyonunu muhasebe kayıtlarından bağımsız ve güvenli tutar.

### Kaybedilen Fırsat

Açık demo fırsatı:

`Kaybedildi Olarak İşaretle`

ile kapatılabilir.

Kayıp nedeni zorunludur.

İşlem:

- satış kaydını `kaybedildi` durumuna geçirir,
- kayıp nedenini saklar,
- açık deneme lisansını `iptal` eder,
- sistem notu ekler.

Satış veya not geçmişi silinmez.

### Lisans / Satış Yaşam Döngüsü Uzlaştırması

Demo satış kaydı `deneme` görünürken kurum lisansı başka bir ekrandan manuel olarak:

- aktif,
- askıda,
- iptal

hale getirilmişse dönüşüm veya kayıp işlemi sessizce devam etmez.

Sistem:

`Demo lisansı artık deneme durumunda değil. Lisans ve satış kaydını önce uzlaştır.`

hatasıyla işlemi durdurur.

Böylece satış kaydı ile paket/lisans kaydı birbirinden kopmaz.

### Satış Özeti

Dashboard şu metrikleri gösterir:

- Başlatılan Demo
- Aktif Deneme
- Süresi Doldu
- Ücretliye Dönüştü
- Kaybedildi
- Genel Dönüşüm %
- Karar Verilenlerde Dönüşüm %

#### Genel Dönüşüm

`Ücretliye Dönüşen / Tüm Başlatılan Demo`

oranıdır.

Devam eden açık fırsatlar paydaya dahildir.

#### Karar Verilenlerde Dönüşüm

`Ücretliye Dönüşen / (Ücretliye Dönüşen + Kaybedilen)`

oranıdır.

Henüz açık olan fırsatlar bu oranın paydasına girmez.

### Filtreleme

Satış borusu şu şekilde filtrelenebilir:

- açık denemeler,
- süresi dolanlar,
- ücretliye dönüşenler,
- kaybedilenler,
- satış kaynağı.

### Kurum ve Lisans Entegrasyonu

Seçilen fırsattan:

- Kurumlar Modülüne,
- Paket & Lisanslara,
- ücretliye dönüştüyse Ticari Finans ekranına

doğrudan geçilebilir.

### Süper Admin Menü Entegrasyonu

Yeni menü:

`Demo & Satış`

Süper Admin ana menüsüne eklendi.

Paket & Lisans ekranına da Demo & Satış kısayolu eklendi.

### Yeni Migration

`078_demo_satis_donusum_merkezi.sql`

Yeni tablolar:

- `kurum_deneme_satislari`
- `kurum_satis_notlari`

Bir kurum için tek satış yaşam döngüsü kaydı tutulur:

`UNIQUE kurum_id`

### Test

Yeni testler:

- `tests/trial-sales-170.cjs`
- `tests/trial-sales-db-170.php`

MariaDB testi şunları doğrular:

1. demo kurum + lisans + satış kaydının birlikte oluşturulmasını,
2. deneme tarih aralığını,
3. ilk sistem ve satış notlarının append-only eklenmesini,
4. 7 günlük radarı,
5. duplicate kurum kodunda transaction rollback yapılmasını,
6. başarısız oluşturmanın orphan kurum/lisans/satış bırakmamasını,
7. satış notlarının geçmişi ezmeden eklenmesini,
8. süresi dolan denemenin etkin durumunu,
9. pasif pakete dönüşümün reddedilmesini,
10. başarısız dönüşümde lisans/satış kaydının bozulmamasını,
11. süresi dolmuş denemenin ücretliye dönüşebilmesini,
12. mevcut lisansın aktif ücretli lisansa dönüşmesini,
13. çift dönüşümün engellenmesini,
14. kayıp fırsatta lisansın iptal edilmesini,
15. çift kayıp kapatmanın engellenmesini,
16. genel ve karar-verilen dönüşüm oranlarını,
17. satış/lisans durumu ayrıştığında dönüşümün durmasını,
18. satış/lisans durumu ayrıştığında kayıp işleminin durmasını,
19. ücretliye dönüşmüş fırsata daha sonra append-only takip notu eklenebilmesini.

### Güvenlik

Tüm Demo & Satış işlemleri:

- yalnız Süper Admin,
- authenticated session,
- CSRF,
- transaction,
- row lock,
- input validation

ile çalışır.
