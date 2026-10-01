# İlkAdım 1.2.37

## AdımBot AI Kullanım / Kota Merkezi

Bu sürüm, 1.2.36'da paketlere eklenen `ai_aylik_kota` alanını gerçek AdımBot kullanım akışına bağlar.

### Aylık Kurum Kotası

Aktif veya deneme lisansı bulunan kurumlarda paket üzerindeki aylık AI kotası artık AdımBot isteklerinde uygulanır.

Örnek:

- paket AI kotası: 1.000,
- bu ay kullanılan: 742,
- kalan: 258.

Paket kotası `0` ise AI kullanımı sınırsız kabul edilir.

### Atomik Kota Rezervasyonu

Kota yalnız kısa süreli rate-limit kontrolünden geçen ve yapay zekâ sağlayıcısına gönderilecek istekte tüketilir.

Kurum / ay kullanım satırı veritabanında `FOR UPDATE` ile kilitlenir.

Böylece aynı anda gelen birden fazla isteğin kotayı yarış koşuluyla aşması engellenir.

Kota dolmuşsa sağlayıcı çağrısı yapılmadan:

- HTTP 429,
- `institution_ai_quota` nedeni,
- kullanılan / toplam / kalan kota bilgisi

döndürülür.

### Lisansı Olmayan Kurumlar

Geriye uyumluluk korunur.

Lisansı olmayan kurum:

- AdımBot'u kullanmaya devam eder,
- kullanım sayacı tutulur,
- paket kotası nedeniyle engellenmez.

### Çoklu Kurum Güvenliği

Öğrenci tek aktif kuruma bağlıysa kullanım doğrudan o kuruma yazılır.

Öğrenci birden fazla kuruma bağlıysa:

- yalnız bir kurumun aktif lisansı varsa o lisans kullanılır,
- birden fazla aktif lisanslı kurum varsa kullanım rastgele bir kuruma yazılmaz.

Bu durumda sistem yanlış faturalama / yanlış kota tüketimi yapmamak için kota kaydı oluşturmaz ve mevcut uygulamayı kilitlemez.

### Süper Admin AI Kullanım Merkezi

`Paket & Lisanslar` ekranına **AI Kullanım Merkezi** eklendi.

Her lisanslı kurum için:

- bu ayki AdımBot kullanım sayısı,
- paket aylık kotası,
- kalan kullanım,
- kota doldu durumu,
- son AI sağlayıcısı

görülebilir.

### Yeni Migration

`072_adimbot_kurum_ai_kotasi.sql`

Yeni tablo:

`adimbot_ai_kullanimlari`

Sayaç kurum + ay bazında tek satır olarak tutulur.

### Sayaç Semantiği

Bir kullanım, sağlayıcıya gönderilecek AI isteği için kota rezervasyonu yapıldığı anda sayılır.

Bunun amacı eşzamanlı isteklerde katı kota garantisi sağlamaktır. Sağlayıcı tarafında sonradan oluşabilecek timeout veya sağlayıcı hatası da gönderilmiş istek olarak sayaçta kalabilir.

### Test

Yeni testler:

- `tests/adimbot-license-quota-162.cjs`
- `tests/adimbot-license-quota-db-162.php`

Testler:

1. aylık kota tüketimini,
2. kota bitince üçüncü isteğin engellenmesini,
3. engellenen isteğin sayacı artırmamasını,
4. lisansı olmayan kurumun sınırsız çalışmasını,
5. kullanımın yine takip edilmesini,
6. çoklu kurumda tek aktif lisans çözümünü,
7. çoklu aktif lisans belirsizliğinde yanlış kuruma tüketim yazılmamasını,
8. provider/model kullanım metadatasını

doğrular.
