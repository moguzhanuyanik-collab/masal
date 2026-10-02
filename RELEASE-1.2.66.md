# İlkAdım 1.2.66

## Mutabakat Operasyon Performans Dashboardu

Bu sürüm 1.2.60–1.2.65 arasında oluşan mutabakat operasyon zincirini geçmiş çevrim performansı ve objektif operasyon metrikleriyle tamamlar.

Yeni migration yoktur.

Migration zinciri:

`088`

olarak kalır.

## Amaç

Mevcut sistem:

- açık vaka sağlığını,
- günlük iş kutusunu,
- toplu planlamayı,
- aksiyon hatırlatmalarını,
- sorumlu devir/kurtarmayı,
- operasyon eskalasyonlarını

yönetebiliyordu.

Eksik kalan nokta geçmiş kapanış döngülerini ve sorumlu bazlı operasyon sonuçlarını tek salt-okunur raporda izlemekti.

1.2.66 bu görünümü ekler.

## Yeni Sayfa

Yeni Süper Admin sayfası:

`ticari-mutabakat-performans.php`

Yeni domain:

`src/ticari_mutabakat_performans.php`

Yeni stil:

`ticari-mutabakat-performans.css`

## Yeni Migration Yok

Performans dashboardu:

- vaka oluşturmaz,
- vaka değiştirmez,
- sorumlu değiştirmez,
- aksiyon tarihi değiştirmez,
- bildirim göndermez,
- KPI snapshot tablosu üretmez.

Bütün göstergeler mevcut append-only vaka geçmişi ve mevcut operasyon tablolarından anlık hesaplanır.

Bu nedenle 089 migration oluşturulmamıştır.

## Rapor Pencereleri

Dashboard üç zaman penceresi destekler:

- 7 gün
- 30 gün
- 90 gün

Seçilen pencere:

- kapanan vaka döngülerini,
- hatırlatma hacmini,
- eskalasyon hacmini,
- sorumlu bazlı kapanış sonuçlarını

etkiler.

Mevcut açık vaka sayıları ise bugünkü operasyon durumudur.

## Döngü Başlangıcı

Çevrim süresi için 1.2.60 ile aynı sözleşme kullanılır.

Vaka hiç yeniden açılmadıysa döngü başlangıcı:

`ticari_mutabakat_vakalari.olusturulma_tarihi`

olur.

Vaka kapanıp yeniden açıldıysa:

append-only geçmişteki son:

`vaka_yeniden_acildi`

olayı yeni döngü başlangıcıdır.

Böylece 50 gün önce açılmış fakat 6 gün önce yeniden açılmış bir vakanın yeni kapanış çevrimi 50 gün sayılmaz.

## İlk Müdahale

İlk müdahale mevcut açık döngü içindeki ilk:

- `takip_notu`
- veya `asama_*`

olayıdır.

Otomatik:

- vaka açılışı,
- kaynak yenilemesi,
- kapanma,
- hatırlatma,
- eskalasyon

ilk müdahale sayılmaz.

## Ana KPI'lar

Dashboard şu göstergeleri sunar:

- mevcut açık vaka,
- seçili pencerede kapanan vaka,
- ortalama çevrim günü,
- ortalama ilk müdahale saati,
- reopen oranı,
- 8+ gün açık vaka,
- seçili penceredeki hatırlatma sayısı,
- seçili penceredeki eskalasyon sayısı.

## Kapanış & Müdahale Göstergeleri

Seçili zaman penceresi için ayrıca:

- açılan/reopen döngüsü,
- kapanan döngü,
- ortalama çevrim,
- en uzun çevrim,
- ilk müdahale yapılan kapanış,
- ortalama ilk müdahale,
- en uzun ilk müdahale,
- reopen sonrası kapanan,
- halen açık gecikmiş aksiyon,
- halen açık ilk müdahalesiz vaka

gösterilir.

## Reopen Oranı

Reopen oranı:

`seçili pencerede reopen döngüsünden kapanan vaka / seçili pencerede kapanan vaka`

olarak hesaplanır.

Bu oran kullanıcı puanı değildir.

Yalnız kapanan döngülerin ne kadarının yeniden açılmış bir döngü olduğunu gösterir.

## Sorun Türü Kırılımı

Veri:

- Operasyon Açığı
- Veri Bütünlüğü

olarak ayrılır.

Her tür için:

- mevcut açık vaka,
- kapanan vaka,
- ortalama çevrim günü,
- ortalama ilk müdahale saati,
- reopen sonrası kapanış

gösterilir.

## Sorumlu Bazlı Göstergeler

Her sorumlu için:

- mevcut açık vaka,
- gecikmiş aksiyon,
- 8+ gün açık,
- seçili pencerede kapanan,
- ortalama kapanış çevrimi,
- ortalama ilk müdahale süresi,
- reopen sonrası kapanış,
- seçili pencerede alınan aksiyon hatırlatması,
- seçili pencerede alınan operasyon eskalasyonu

gösterilir.

Bu tablo:

- çalışan skoru,
- başarı notu,
- performans sıralaması,
- otomatik karar

üretmez.

Yalnız operasyonel iş yükü ve geçmiş olay sayılarını aynı yerde gösterir.

## Hatırlatma Hacmi

1.2.63 tablosu mevcutsa:

`ticari_mutabakat_aksiyon_hatirlatmalari`

seçili pencere içindeki gönderim sayıları rapora dahil edilir.

Tablo yoksa dashboard temel metriklerle çalışmaya devam eder.

## Eskalasyon Hacmi

1.2.65 tablosu mevcutsa:

`ticari_mutabakat_eskalasyonlari`

seçili pencere içindeki eskalasyon sayıları rapora dahil edilir.

Tablo yoksa dashboard kapanış/çevrim metriklerini göstermeye devam eder.

## 6 Aylık Kapanış Trendi

Son 6 ay:

- ay,
- sorun türü,
- kapanan vaka sayısı,
- ortalama çevrim günü

bazında gösterilir.

Trend yalnız kapanmış vaka döngülerini kullanır.

## Son Kapanışlar

Seçili penceredeki son kapanışlarda:

- kurum,
- sözleşme,
- sorun türü,
- sorumlu,
- çevrim günü,
- ilk müdahale saati,
- reopen döngüsü olup olmadığı,
- kapanma zamanı

gösterilir.

Vaka satırı Aksiyon Merkezi'ndeki vaka detayına gider.

## Açılan / Reopen Döngüsü

Seçili pencere içindeki:

- yeni vaka oluşumları,
- `vaka_yeniden_acildi` olayları

birlikte `açılan/reopen döngüsü` göstergesinde sayılır.

Bu metrik kapanış oranı gibi yorumlanmaz; yalnız operasyon hacmi göstergesidir.

## Mevcut Sağlık ile Ayrım

1.2.60 Aksiyon Sağlığı:

- bugünkü açık vaka yaşını,
- gecikmiş aksiyonları,
- sahipsiz vakaları,
- ilk müdahale eksiklerini,
- anlık iş yükünü

göstermeye devam eder.

1.2.66 Performans Dashboardu ise:

- geçmiş kapanış döngülerini,
- çevrim süresini,
- ilk müdahale süresini,
- reopen geçmişini,
- bildirim/eskalasyon hacmini

raporlar.

Bu iki ekran aynı işi tekrar etmez.

## Navigasyon

Performans Dashboardu bağlantısı:

- Süper Admin ana menüsüne,
- Mutabakat Aksiyon Sağlığı'na,
- Günlük İş Kutusu'na,
- Operasyon Eskalasyonu'na

eklendi.

Performans ekranından:

- Aksiyon Sağlığı,
- Günlük İş Kutusu,
- Aksiyon Merkezi,
- Eskalasyon,
- Sorumlu Devir

merkezlerine erişilebilir.

## Testler

Yeni testler:

- `tests/reconciliation-performance-191.cjs`
- `tests/reconciliation-performance-db-191.php`

MariaDB testi şunları doğrular:

1. 7/30/90 pencere normalizasyonunu,
2. mevcut açık vaka sayısını,
3. 8+ gün açık vakayı,
4. gecikmiş aksiyonu,
5. açık ilk müdahale eksikliğini,
6. 30 günlük kapanan vaka sayısını,
7. reopen-aware ortalama çevrim süresini,
8. en uzun çevrimi,
9. reopen sonrası kapanış sayısını,
10. reopen oranını,
11. ilk müdahale yapılan kapanış sayısını,
12. ortalama ilk müdahale süresini,
13. en uzun ilk müdahale süresini,
14. açılan/reopen döngüsü hacmini,
15. hatırlatma hacmini,
16. eskalasyon hacmini,
17. 90 günlük pencerede eski kapanışın dahil olmasını,
18. sorumlu bazlı açık/kapanan yükünü,
19. sorumlu bazlı gecikmiş/8+ açık yükünü,
20. sorumlu bazlı çevrim süresini,
21. sorumlu bazlı ilk müdahale süresini,
22. sorumlu bazlı hatırlatma/eskalasyon sayısını,
23. sorun türü kırılımını,
24. reopen vakasının ilk oluşturulma tarihinden değil son açık döngüden ölçülmesini,
25. son kapanış listesini,
26. 6 aylık kapanış trendini.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin görünümü,
- salt-okunur domain,
- mevcut append-only geçmiş kullanımı,
- mevcut döngü başlangıcı sözleşmesini yeniden kullanma,
- parametreli/whitelist zaman pencereleri,
- finansal ve operasyonel kayıt değiştirmeme

ile çalışır.
