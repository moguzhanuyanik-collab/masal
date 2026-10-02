# İlkAdım 1.2.67

## Mutabakat Operasyon Hedefleri & Politika Merkezi

Bu sürüm 1.2.66 Mutabakat Operasyon Performans Dashboardu'na versioned iç operasyon hedefleri ekler.

Yeni migration:

`089_mutabakat_operasyon_hedef_politikalari.sql`

Migration zinciri:

`089`

olur.

## Amaç

1.2.60–1.2.66 zinciri:

- açık vaka sağlığını,
- aksiyon iş kutusunu,
- planlamayı,
- hatırlatmaları,
- sorumlu kurtarmayı,
- eskalasyonu,
- geçmiş çevrim performansını

ölçebiliyordu.

Ancak:

- ilk müdahale için yönetilebilir hedef,
- çevrim süresi için yönetilebilir hedef,
- sorun türüne özel hedef,
- hedef değiştiğinde geçmiş KPI'nın bozulmaması

için versioned politika katmanı yoktu.

1.2.67 bu eksikliği kapatır.

## Yeni Sayfa

Yeni Süper Admin sayfası:

`ticari-mutabakat-hedefleri.php`

Yeni domain:

`src/ticari_mutabakat_hedef.php`

Yeni stil:

`ticari-mutabakat-hedefleri.css`

## Sözleşmesel SLA Değildir

Bu sürümdeki hedefler:

- sözleşmesel SLA değildir,
- müşteri taahhüdü değildir,
- çalışan puanı değildir,
- başarı notu değildir,
- otomatik insan değerlendirmesi üretmez.

Yalnız iç operasyon hedefi ve raporlama referansıdır.

## Eskalasyon Eşikleri Değişmez

1.2.65 Mutabakat Operasyon Eskalasyonu:

- 2+ gün ilk müdahale yok,
- 4+ gün açık,
- 8+ gün açık,
- 14+ gün açık,
- 30+ gün açık

eşiklerini kullanmaya devam eder.

1.2.67 hedef politikası bu eşikleri sessizce yeniden yapılandırmaz.

Bu iki kavram ayrı tutulur:

- Hedef politikası → raporlama / hedef uyumu
- Eskalasyon eşiği → bildirim / operasyon alarmı

## Yeni Politika Tablosu

Yeni tablo:

`ticari_mutabakat_hedef_politikalari`

Alanlar:

- id
- kapsam
- ilk_mudahale_saat
- cevrim_gun
- aciklama
- olusturan_kullanici_id
- gecerlilik_baslangici
- olusturulma_tarihi

## Kapsamlar

Politika kapsamları:

- Genel
- Operasyon Açığı
- Veri Bütünlüğü

olarak tanımlıdır.

## Politika Önceliği

Bir vaka döngüsü değerlendirilirken:

1. sorun türüne özel politika varsa o kullanılır,
2. özel politika yoksa Genel politika kullanılır,
3. döngü başlangıcında hiçbir uygun politika yoksa vaka `politika öncesi / tanımsız` sayılır.

## Append-only Versioning

Politika değiştirme işlemi mevcut satırı:

- UPDATE etmez,
- DELETE etmez.

Her değişiklik yeni:

`INSERT`

satırı olarak yayınlanır.

Yeni satır kendi:

`gecerlilik_baslangici`

zamanına sahiptir.

## Geçmiş KPI Değişmez

Kapanan veya halen açık vaka için politika seçimi:

`vaka döngüsünün başlangıç zamanı`

üzerinden yapılır.

Örneğin:

- vaka 10 gün önce açıldı,
- o gün Genel hedef 48 saat / 8 gündü,
- bugün hedef 24 saat / 5 güne değiştirildi.

Eski vaka yine 48 saat / 8 gün hedefiyle ölçülür.

Bugünkü yeni hedef geçmiş sonucu geriye dönük değiştirmez.

## Reopen Döngüsü

1.2.60 ve 1.2.66 ile aynı döngü başlangıcı sözleşmesi kullanılır.

Vaka yeniden açıldıysa:

`vaka_yeniden_acildi`

olayının zamanı yeni döngü başlangıcıdır.

Hedef politikası da yeni reopen döngüsünün başlangıcında geçerli olan versiyona göre seçilir.

## Başlangıç Genel Politikası

089 migration ilk kez kurulduğunda, daha önce Genel politika yoksa:

- İlk müdahale: 48 saat
- Çevrim: 8 gün

başlangıç Genel politika versiyonu oluşturulur.

Bu başlangıç:

- mevcut 1.2.65 ilk müdahale görünürlüğü,
- mevcut 1.2.60 / 1.2.66 8+ gün sağlık görünürlüğü

ile uyumludur.

## Retroaktif Hedef Uydurma Yok

089 migration kurulmadan önce başlayan vaka döngülerine:

- 48 saat,
- 8 gün

hedefleri geçmişe dönük yapıştırılmaz.

Bu döngüler:

`Politika öncesi`

olarak raporlanır.

Hedef uyum yüzdesinin paydasına alınmaz.

## Yeni Politika Yayınlama

Yalnız Süper Admin:

`Yeni Politika Versiyonunu Yayınla`

işlemini kullanabilir.

Alanlar:

- kapsam,
- ilk müdahale saati,
- çevrim günü,
- opsiyonel politika notu.

## Validasyon

İlk müdahale hedefi:

`1–720 saat`

arasında olmalıdır.

Çevrim hedefi:

`1–365 gün`

arasında olmalıdır.

Politika notu:

en fazla `1000` karakterdir.

## Sağlık Dashboardu Entegrasyonu

`ticari-mutabakat-saglik.php`

artık mevcut açık vakalar için:

- politika ile izlenen,
- çevrim hedefi dışında,
- ilk müdahale hedefi dışında,
- ilk müdahale süresi halen işleyen,
- politika öncesi / tanımsız

sayılarını gösterir.

Bu görünüm vaka state'ini değiştirmez.

## Performans Dashboardu Entegrasyonu

`ticari-mutabakat-performans.php`

7/30/90 günlük seçili pencere için ayrıca:

- politika ile değerlendirilen kapanış,
- çevrim hedef içi oranı,
- ilk müdahale hedef içi oranı,
- çevrim hedef dışı,
- ilk müdahale hedef dışı,
- politika öncesi kapanış

gösterir.

## Sorun Türü Hedef Uyumu

Performans görünümü:

- Operasyon Açığı
- Veri Bütünlüğü

için ayrı:

- değerlendirilen kapanış,
- çevrim hedef içi oranı,
- ilk müdahale hedef içi oranı

gösterir.

## İlk Müdahale Sözleşmesi

Hedef hesabında ilk müdahale:

- takip_notu
- asama_*

olaylarının mevcut tanımını yeniden kullanır.

Otomatik:

- vaka açılışı,
- kaynak yenilemesi,
- hatırlatma,
- eskalasyon,
- otomatik kapanma

ilk müdahale sayılmaz.

## Hedef Dışı İlk Müdahale

Politika mevcut olan kapanmış bir döngüde:

- ilk müdahale hedef saatinden sonra gerçekleşmişse,
- veya kapanışa kadar gerçek müdahale hiç yapılmamışsa

ilk müdahale hedef dışı sayılır.

## Açık Vakada İlk Müdahale

Açık vakada gerçek ilk müdahale henüz yoksa:

- hedef saat dolmadıysa → `bekliyor`
- hedef saat aşıldıysa → `hedef dışında`

olarak sınıflanır.

## Audit

Yeni politika versiyonu yayınlandığında mevcut:

`auth_audit()`

mekanizmasına:

`mutabakat_hedef_politikasi`

olayı yazılır.

Politika geçmişi kendi versioned tablosunda da korunur.

## GET Yan Etkisiz

Hedef merkezi sayfasını açmak:

- politika yayınlamaz,
- vaka değiştirmez,
- aksiyon tarihi değiştirmez,
- eskalasyon göndermez.

Politika oluşturma yalnız:

- POST
- CSRF
- Süper Admin

ile çalışır.

## Navigasyon

Mutabakat Operasyon Hedefleri bağlantısı:

- Süper Admin ana menüsüne,
- Performans Dashboardu'na,
- Aksiyon Sağlığı'na,
- Operasyon Eskalasyonu'na

eklenmiştir.

## Testler

Yeni testler:

- `tests/reconciliation-targets-192.cjs`
- `tests/reconciliation-targets-db-192.php`

MariaDB testi şunları doğrular:

1. Genel politika fallback'ini,
2. sorun türüne özel politika önceliğini,
3. özel politika yayınlanmadan önce başlayan Operasyon vakasının eski Genel hedefi kullanmasını,
4. özel politika sonrasında başlayan Operasyon vakasının özel hedefi kullanmasını,
5. Veri Bütünlüğü vakasının Genel fallback kullanmasını,
6. ilk politika öncesi başlayan döngünün politikasız kalmasını,
7. 30 günlük kapanış hedef değerlendirme sayısını,
8. çevrim hedef içi/dışı sayılarını,
9. ilk müdahale hedef içi/dışı sayılarını,
10. hedef uyum oranlarını,
11. sorun türü bazlı hedef sonuçlarını,
12. açık vaka hedef görünümünü,
13. açık çevrim hedef dışı sayısını,
14. açık ilk müdahale hedef dışı sayısını,
15. ilk müdahale süresi halen işleyen vakayı,
16. açık politika öncesi vakayı,
17. yeni Genel politika versiyonunun append edilmesini,
18. yeni versiyon sonrası current policy'nin değişmesini,
19. yeni versiyonun eski vaka döngüsünün tarihsel politika çözümünü değiştirmemesini,
20. normal yöneticinin politika yayınlayamamasını,
21. geçersiz hedef değerinin reddedilmesini.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin yayınlama,
- CSRF,
- append-only policy versioning,
- tarihsel effective-time çözümleme,
- mevcut reopen-aware döngü sözleşmesini yeniden kullanma,
- eski vaka state'ine dokunmama,
- eskalasyon davranışını değiştirmeme

ile çalışır.
