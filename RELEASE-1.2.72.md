# İlkAdım 1.2.72

## Mutabakat Aksiyon Detayında Hedef-Risk Entegrasyonu

Bu sürüm 1.2.71 Günlük İş Kutusu'nda görünür hale gelen güncel hedef-risk ve bildirim durumunu doğrudan Mutabakat Aksiyon Merkezi vaka detayına taşır.

Yeni migration yoktur.

Migration zinciri:

`090`

olarak kalır.

## Amaç

1.2.71 Günlük İş Kutusu açık vakalarda:

- güncel hedef-risk seviyesi,
- güncel hedef-risk bildiriminin gönderilip gönderilmediği,
- bildirimin okunup okunmadığı

bilgisini gösteriyordu.

Ancak operatör:

`ticari-mutabakat-aksiyon.php?vaka_id=ID`

ile vakayı açtığında bu bağlam kayboluyordu.

1.2.72 seçili vaka detayına aynı current-owner/current-cycle çözümlemesini ekler.

## Yeni Bildirim Sistemi Yok

Bu sürüm:

- yeni bildirim üretmez,
- mevcut bildirimi yeniden göndermez,
- okundu durumunu değiştirmez,
- hedef politikası yayınlamaz.

Bildirim gönderimi hâlâ:

`ticari-mutabakat-hedef-risk-bildirim.php`

üzerinden 1.2.69 kurallarıyla çalışır.

## Resolver Tekrar Kullanımı

Aksiyon Merkezi yeni bir target-risk eşleme algoritması yazmaz.

Mevcut 1.2.71:

`mi_target_risk_map()`

resolver'ı tekrar kullanılır.

Bu nedenle aksiyon detayı ve Günlük İş Kutusu aynı:

- güncel sorumlu,
- güncel reopen döngüsü,
- güncel hedef-risk sinyali,
- recipient okunma durumu

kurallarını paylaşır.

## Current Owner

Vakanın eski sorumlusuna gönderilmiş hedef-risk bildirimi bugünkü sorumlu için teslim edilmiş sayılmaz.

Aksiyon detayında:

- eski owner bildirimi geçmişte kalır,
- yeni owner için güncel bildirim yoksa
- `Bildirim Bekliyor`

gösterilir.

## Reopen Döngüsü

Güncel döngü anahtarı mevcut resolver ile:

`SHA-256(vaka_id | dongu_baslangic_tarihi)`

üzerinden değerlendirilir.

Vaka kapanıp yeniden açıldıysa eski döngü bildirimi bugünkü açık döngüyü karşılamaz.

Aksiyon detayı bu durumda:

`Bildirim Bekliyor`

gösterir.

## Güncel Sinyal

Hedef-risk bildirimi yalnız mevcut risk sinyaliyle eşleşirse güncel kabul edilir.

Beklenen sinyaller:

- `hedef_disinda`
- `hedef_75`

Şunlar bildirim gerektirmez:

- Süre %50–74
- Hedef İçinde
- Politika Yok

Bu durumlarda detay:

`Bildirim Gerekmiyor`

gösterir.

## Hedef-Risk Kartı

Açık seçili vaka detayına yeni:

`Hedef-Risk Bağlamı`

kartı eklenmiştir.

Kartta:

- hedef-risk etiketi,
- hedef süre kullanım oranı,
- current reopen döngü başlangıcı,
- tarihsel hedef politika ID'si,
- current notification durumu,
- recipient okunma zamanı

gösterilir.

## Bildirim Durumları

Detay kartı:

- Bildirim Okundu
- Bildirim Okunmadı
- Bildirim Bekliyor
- Bildirim Gerekmiyor
- Hedef-risk verisi yok

durumlarını ayırır.

## Bildirim Okunmadı

Güncel:

- owner,
- reopen döngüsü,
- sinyal

için bildirim mevcut fakat:

`kurum_duyuru_alicilari.okundu_tarihi`

boşsa:

`Bildirim Okunmadı`

gösterilir.

## Bildirim Bekliyor

Güncel risk:

- hedef dışında,
- veya %75+

olduğu halde current owner/current cycle/current signal için eşleşen gönderim yoksa:

`Bildirim Bekliyor`

gösterilir.

Aksiyon sayfası bu durumda kendi başına bildirim göndermez.

## Geriye Uyumluluk

Hedef politika/risk/bildirim tabloları hazır değilse:

- mevcut Aksiyon Merkezi çalışmaya devam eder,
- mevcut vaka aşama/not işlemleri etkilenmez,
- hedef-risk kartı fail-open biçimde bağlamın çözülemediğini gösterir.

Yeni entegrasyon mevcut vaka operasyonunun çalışmasını engellemez.

## Kapalı Vaka

Target-risk resolver açık vaka döngüleri için çalışır.

Kapalı vakada güncel hedef-risk bağlamı üretilmez.

Tarihsel olaylar mevcut:

- vaka geçmişi,
- hedef-risk bildirim geçmişi,
- bildirim sağlığı

ekranlarında korunmaya devam eder.

## Navigasyon

Aksiyon Merkezi üst navigasyonuna:

- Hedef Risk Kuyruğu
- Hedef Risk Bildirim Sağlığı

bağlantıları eklenmiştir.

Alt navigasyona:

- Hedef Risk

kısayolu eklenmiştir.

Seçili vaka içindeki hedef-risk kartında ayrıca:

- Hedef Risk Kuyruğu
- Hedef Risk Bildirimleri
- Bildirim Sağlığı
- Operasyon Hedefleri

bağlantıları bulunur.

## Mevcut POST Akışı Değişmedi

Aksiyon Merkezi'nin mevcut write işlemleri:

- vaka senkronizasyonu,
- aşama değiştirme,
- takip notu,
- sonraki aksiyon tarihi

aynı kalır.

1.2.72 hedef-risk entegrasyonu yeni POST action eklemez.

## Yeni Domain Adapter

`src/ticari_mutabakat_aksiyon.php`

içine salt-okunur:

`ma_target_risk_context()`

adapter'ı eklenmiştir.

Bu adapter:

1. yalnız Süper Admin için çalışır,
2. seçili vaka ID'sini alır,
3. 1.2.71 `mi_target_risk_map()` resolver'ını çağırır,
4. yalnız seçili vakanın current target-risk context'ini döndürür.

## Testler

Yeni testler:

- `tests/reconciliation-action-target-risk-197.cjs`
- `tests/reconciliation-action-target-risk-db-197.php`

MariaDB testi şunları doğrular:

1. current owner + current cycle + current signal bildirimini,
2. recipient okunmadığında `Bildirim Okunmadı` durumunu,
3. current duyuru ID'sinin çözülmesini,
4. unread UI label/class eşlemesini,
5. eski owner'a gönderilen bildirimin yeni owner için geçerli sayılmamasını,
6. owner değişiminde `Bildirim Bekliyor` durumunu,
7. eski reopen döngüsü bildiriminin güncel döngüyü karşılamamasını,
8. reopen sonrası `Bildirim Bekliyor` durumunu,
9. %50–74 risk bandının bildirim gerektirmemesini,
10. `Bildirim Gerekmiyor` UI durumunu,
11. bilinmeyen vaka için null bağlamı,
12. Süper Admin olmayan erişimin fail-closed kalmasını.

Mevcut 193–196 regresyonları ayrıca:

- hedef-risk hesabını,
- tarihsel politika çözümünü,
- bildirim gönderim dedup'ını,
- notification health'i,
- current-owner/current-cycle inbox davranışını

korumaya devam eder.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin,
- salt-okunur hedef-risk adapter'ı,
- mevcut current-owner resolver'ı,
- reopen-aware cycle anahtarı,
- exact current-signal eşlemesi,
- recipient okundu snapshot'ı,
- yeni POST aksiyonu olmaması,
- yeni migration olmaması

ile çalışır.
