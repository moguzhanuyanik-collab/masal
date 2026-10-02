# İlkAdım 1.2.68

## Mutabakat Hedef Risk & Aksiyon Kuyruğu

Bu sürüm 1.2.67 versioned mutabakat hedef politikalarını günlük operasyon kuyruğuna dönüştürür.

Yeni migration yoktur.

Migration zinciri:

`089`

olarak kalır.

## Amaç

1.2.67 ile:

- ilk müdahale hedefi,
- çevrim hedefi,
- tarihsel politika çözümü,
- hedef uyum raporları

mevcuttu.

Ancak günlük operasyonda şu soru tek yerde cevaplanmıyordu:

- hangi açık vaka hedef dışında,
- hangisinin hedef süresinin büyük bölümü tüketildi,
- hangisinin ilk müdahale süresi dolmak üzere,
- hangisinin çevrim süresi dolmak üzere,
- hangi vaka politika öncesi kaldı,
- hedef dışı vakalardan hangisi sahipsiz veya aksiyon tarihi gecikmiş.

1.2.68 bu görünümü ekler.

## Yeni Sayfa

Yeni Süper Admin sayfası:

`ticari-mutabakat-hedef-risk.php`

Yeni domain:

`src/ticari_mutabakat_hedef_risk.php`

Yeni stil:

`ticari-mutabakat-hedef-risk.css`

## Yeni Migration Yok

Bu sürüm:

- vaka oluşturmaz,
- vaka güncellemez,
- hedef politikası yayınlamaz,
- sorumlu değiştirmez,
- aksiyon tarihi değiştirmez,
- hatırlatma göndermez,
- eskalasyon üretmez.

Tüm hedef-risk durumu mevcut:

- `ticari_mutabakat_vakalari`
- `ticari_mutabakat_vaka_gecmisi`
- `ticari_mutabakat_hedef_politikalari`

verilerinden anlık hesaplanır.

Bu nedenle 090 migration oluşturulmamıştır.

## Tarihsel Politika Korunur

Her açık vaka:

`vaka döngüsü başladığı anda geçerli olan politika`

ile değerlendirilir.

Bugün yayınlanan yeni politika geçmişten açık kalan eski döngüyü yeniden sınıflandırmaz.

1.2.67'nin tarihsel politika çözümleme sözleşmesi aynen kullanılır.

## Reopen Döngüsü

Vaka yeniden açıldıysa süre:

ilk vaka açılışından değil,

son:

`vaka_yeniden_acildi`

olayından başlar.

Hedef politikası da bu yeni döngü başlangıcına göre çözülür.

## Hedef Risk Bantları

Bu sürüm çalışan skoru üretmez.

Yüzde yalnız aktif hedef süresinden tüketilen zamanı gösterir.

### Hedef Dışında

`%100+`

Çevrim veya ilk müdahale hedeflerinden en az biri aşılmıştır.

### Süre %75+

Aktif hedef saatinin:

`%75–99`

arası tüketilmiştir.

Henüz hedef dışı değildir.

### Süre %50–74

Aktif hedef saatinin:

`%50–74`

arası tüketilmiştir.

### Hedef İçinde

Aktif hedef saatinin:

`%50'den azı`

tüketilmiştir.

### Politika Yok

Döngü başlangıcında uygulanabilir:

- sorun türüne özel,
- veya Genel

politika bulunamamıştır.

Bu vaka geriye dönük hedefle puanlanmaz.

## İlk Müdahale Saati

İlk müdahale mevcut 1.2.66/1.2.67 sözleşmesini kullanır.

İlk gerçek müdahale:

- `takip_notu`
- veya `asama_*`

olayıdır.

Otomatik olaylar ilk müdahale sayılmaz.

## İlk Müdahale Henüz Yapılmadıysa

İlk müdahale yoksa:

`döngü yaşı / ilk müdahale hedef saati`

oranı aktif saat olarak kuyruğa dahil edilir.

Örneğin:

- ilk müdahale hedefi 12 saat,
- vaka 6 saattir açık,
- gerçek müdahale henüz yok,

ise ilk müdahale hedef süresinin:

`%50`

si tüketilmiş kabul edilir.

## İlk Müdahale Yapıldıysa

İlk müdahale hedef içinde gerçekleşmişse o saat artık aktif geri sayım değildir.

Bundan sonra genel risk bandını açık vaka çevrim süresi belirler.

İlk müdahale hedef dışında gerçekleşmişse tarihsel ihlal kapanmaz; vaka:

`Hedef Dışında`

olarak görünmeye devam eder.

## En Yakın Kalan Süre

Her vaka için aktif hedefler arasındaki en kısa kalan süre hesaplanır.

İlk müdahale bekleniyorsa:

- ilk müdahale kalan saati,
- çevrim kalan saati

karşılaştırılır.

İlk müdahale tamamlanmışsa yalnız çevrim saati ilerler.

## Sıralama

Kuyruk şu operasyon sırasıyla gösterilir:

1. Hedef Dışında
2. Süre %75+
3. Süre %50–74
4. Politika Yok
5. Hedef İçinde

Aynı bant içinde:

- gecikmiş aksiyon,
- bugün aksiyon,
- hedef süresi kullanım oranı

öne alınır.

Bu sıralama çalışan değerlendirmesi değildir.

Yalnız vaka aksiyon sırasıdır.

## Filtreler

Kuyruk:

### Kapsam

- Tüm Ekip
- Bana Atanan
- Sahipsiz

### Hedef Durumu

- Hedef Dışında
- Süre %75+
- Süre %50–74
- Hedef İçinde
- Politika Yok

### Sorun Türü

- Operasyon Açığı
- Veri Bütünlüğü

### Arama

- kurum,
- kurum kodu,
- sözleşme,
- açıklama,
- sorumlu

üzerinden arama yapılabilir.

## Hedef Dışı Ayrıntısı

Vaka satırında ayrı ayrı:

- Çevrim Dışı
- İlk Müdahale Dışı
- İlk Müdahale Bekliyor
- Aksiyon Gecikmiş
- Aksiyon Bugün

etiketleri gösterilir.

## Politika Referansı

Değerlendirilebilir vakada kullanılan:

`Politika #ID`

satır üzerinde görünür.

Böylece operatör bugünkü current policy yerine vaka döngüsünde gerçekten kullanılan tarihsel policy versiyonunu görebilir.

## Özet KPI'lar

Üst bölüm:

- Açık vaka
- Hedef dışında
- Süre %75+
- Süre %50–74
- Politika yok
- Bana atanan hedef dışı
- Sahipsiz hedef dışı
- Hedef dışı + aksiyon gecikmiş

sayılarını gösterir.

## Sorumlu Bazlı İş Yükü

Sorumlu tablosu:

- açık vaka,
- politika ile değerlendirilebilir vaka,
- hedef dışı,
- %75+,
- %50–74,
- politika yok,
- aksiyon gecikmiş

sayılarını gösterir.

Bu tablo:

- çalışan puanı değildir,
- performans sıralaması değildir,
- başarı notu değildir,
- insan kaynakları kararı değildir.

Yalnız mevcut açık iş yükünün hedef zamanı açısından dağılımıdır.

## Mevcut İş Kutusu Ayrımı

1.2.62 Günlük İş Kutusu:

- aksiyon tarihine,
- sahipliğe,
- günlük iş planına

odaklanır.

1.2.68 Hedef Risk Kuyruğu:

- tarihsel hedef politikasına,
- ilk müdahale hedefine,
- çevrim hedefine

odaklanır.

İki ekran birbirini değiştirmez; karşılıklı bağlantı kullanır.

## Aksiyon Merkezi

Vaka satırları mevcut:

`ticari-mutabakat-aksiyon.php?vaka_id=...`

detayına gider.

Hedef Risk ekranı vaka düzenlemez.

## Sağlık Dashboardu

1.2.60 Sağlık ekranına Hedef Risk Kuyruğu bağlantısı eklendi.

Mevcut sağlık yaşlandırma ve aksiyon hesapları değiştirilmedi.

## Performans Dashboardu

1.2.66 Performans ekranına Hedef Risk Kuyruğu bağlantısı eklendi.

Geçmiş kapanış KPI hesapları değiştirilmedi.

## Hedef Politikaları

1.2.67 Hedefler ekranına Hedef Risk Kuyruğu bağlantısı eklendi.

Politika yayınlama davranışı değiştirilmedi.

## Eskalasyon Ayrımı

1.2.65 eskalasyon eşikleri:

- 2+ gün ilk müdahale yok,
- 4+ gün açık,
- 8+ gün açık,
- 14+ gün açık,
- 30+ gün açık

olarak değişmeden kalır.

1.2.68 yüzdeleri:

- eskalasyon göndermez,
- bu eşikleri yeniden tanımlamaz,
- otomatik notification tetiklemez.

Hedef riski ile eskalasyon iki ayrı operasyon kavramı olarak korunur.

## GET Yan Etkisiz

Hedef Risk Kuyruğu sayfasını açmak:

- INSERT yapmaz,
- UPDATE yapmaz,
- DELETE yapmaz,
- politika yayınlamaz,
- vaka state'i değiştirmez,
- notification göndermez.

Sayfa salt-okunurdur.

## Navigasyon

Hedef Risk Kuyruğu bağlantısı:

- Süper Admin ana menüsüne,
- Mutabakat Günlük İş Kutusu'na,
- Mutabakat Aksiyon Sağlığı'na,
- Mutabakat Operasyon Performansı'na,
- Mutabakat Operasyon Hedefleri'ne

eklendi.

## Testler

Yeni testler:

- `tests/reconciliation-target-risk-193.cjs`
- `tests/reconciliation-target-risk-db-193.php`

MariaDB testi şunları doğrular:

1. hedef dışı ilk müdahale vakasını,
2. çevrim hedefi içindeyken ilk müdahale hedefinin aşılabilmesini,
3. 7/8 günlük döngünün %75+ bandına girmesini,
4. 5/8 günlük döngünün %50–74 bandına girmesini,
5. 2/8 günlük döngünün hedef içinde kalmasını,
6. politika öncesi döngünün geriye dönük sınıflandırılmamasını,
7. reopen olmuş vakada son reopen zamanının yeni döngü başlangıcı olmasını,
8. 6/12 saat bekleyen ilk müdahalenin %50 bandını,
9. sahipsiz hedef dışı vakayı,
10. hedef dışı vakaların kuyrukta önce gelmesini,
11. hedef-dışı filtresini,
12. Bana Atanan filtresini,
13. Sahipsiz filtresini,
14. sorun türü + risk filtresini,
15. serbest metin aramasını,
16. toplam açık vaka özetini,
17. politika ile değerlendirilebilir sayısını,
18. politika öncesi sayısını,
19. çevrim ihlal sayısını,
20. ilk müdahale ihlal sayısını,
21. %75+ sayısını,
22. %50–74 sayısını,
23. hedef içi sayısını,
24. Bana atanan hedef dışı sayısını,
25. sahipsiz hedef dışı sayısını,
26. hedef dışı + aksiyon gecikmiş sayısını,
27. sorumlu bazlı ham hedef iş yükünü,
28. normal yöneticinin bu Süper Admin kuyruğu verisini alamamasını.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin görünümü,
- salt-okunur domain,
- 1.2.67 tarihsel policy resolver'ını yeniden kullanma,
- reopen-aware döngü başlangıcı,
- yeni DB state üretmeme,
- mevcut eskalasyon davranışına dokunmama

ile çalışır.
