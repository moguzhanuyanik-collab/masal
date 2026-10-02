# İlkAdım 1.2.71

## Mutabakat Günlük İş Kutusu — Hedef Risk Entegrasyonu

Bu sürüm 1.2.62 Mutabakat Günlük İş Kutusu'nu 1.2.68 hedef-risk ve 1.2.69/1.2.70 bildirim verileriyle birleştirir.

Yeni migration yoktur.

Migration zinciri:

`090`

olarak kalır.

## Amaç

Günlük İş Kutusu daha önce:

- gecikmiş aksiyon,
- bugün,
- 3 gün,
- 7 gün,
- tarihsiz vaka,
- sahipsiz vaka,
- ilk müdahale durumu

üzerinden çalışıyordu.

1.2.71 aynı açık vakaya ayrıca:

- güncel hedef-risk seviyesi,
- güncel hedef-risk sinyalinin gönderilip gönderilmediği,
- ilgili bildirimin okunup okunmadığı

bilgisini ekler.

## Yeni Bildirim Sistemi Yok

Bu sürüm yeni bildirim üretmez.

Gönderim halen:

`ticari-mutabakat-hedef-risk-bildirim.php`

üzerinden 1.2.69 kurallarıyla yapılır.

İş Kutusu yalnız mevcut bildirim geçmişini okur.

Bu nedenle 1.2.63 aksiyon hatırlatmaları veya 1.2.65 operasyon eskalasyonlarıyla ikinci bir hatırlatma kanalı oluşturulmaz.

## Güncel Hedef Risk Seviyeleri

İş Kutusu 1.2.68 hedef-risk resolver'ından:

- `hedef_disinda`
- `yuzde_75`
- `yuzde_50`
- `politika_yok`

durumlarını alır.

## Bildirim Bekliyor

Güncel risk:

- Hedef Dışında
- veya Süre %75+

ise bu risk için 1.2.69 bildirimi beklenir.

Aynı:

- vaka,
- mevcut açık döngü,
- mevcut sorumlu,
- güncel sinyal

için geçmişte uygun bildirim yoksa İş Kutusu:

`Bildirim Bekliyor`

etiketi gösterir.

Bu etiket kendi başına bildirim oluşturmaz.

## Bildirim Okunmadı

Güncel owner + güncel reopen döngüsü + güncel hedef-risk sinyali için 1.2.69 bildirimi mevcut fakat recipient:

`okundu_tarihi`

boşsa:

`Bildirim Okunmadı`

olarak gösterilir.

## Owner Değişimi

Eski sorumluya gönderilmiş hedef-risk bildirimi yeni sorumlunun iş kutusunda teslim edilmiş sayılmaz.

Vakanın mevcut sorumlusu değişmişse:

- eski recipient geçmişi korunur,
- yeni owner için güncel sinyal tekrar değerlendirilir,
- yeni owner'a ait güncel bildirim yoksa `Bildirim Bekliyor` görünür.

## Reopen Döngüsü

İş Kutusu current cycle anahtarını:

`SHA-256(vaka_id | dongu_baslangic_tarihi)`

olarak hesaplar.

Döngü başlangıcı mevcut hedef-risk resolver'dan gelir ve son `vaka_yeniden_acildi` olayını dikkate alır.

Reopen öncesi eski bildirimin:

- okunmuş,
- okunmamış

olması yeni açık döngünün bildirim durumunu karşılamaz.

Bu durumda yeni döngü için uygun bildirim yoksa:

`Bildirim Bekliyor`

görünür.

## Sıralama Önceliği

Günlük iş listesinde öncelik:

1. Hedef dışında + bildirim okunmadı
2. Hedef dışında + bildirim bekliyor
3. Hedef dışında + bildirim okunmuş
4. %75+ + bildirim okunmadı
5. %75+ + bildirim bekliyor
6. %75+ + bildirim okunmuş
7. Aksiyon gecikmiş
8. Aksiyon bugün
9. %50–74
10. Politika yok
11. Gelecek aksiyon
12. Tarihsiz

şeklinde uygulanır.

Bu sıralama vaka state'ini değiştirmez; yalnız günlük operasyon görünümüdür.

## Yeni Özet KPI'lar

`Bana Atanan` kapsamı için:

- Hedef dışında
- Hedef %75+
- Risk bildirimi okunmadı
- Risk bildirimi bekliyor

kartları eklenmiştir.

## Yeni Filtreler

Hedef-risk filtresi:

- Tüm Hedef Riskleri
- Hedef Dışında
- Süre %75+
- Süre %50–74
- Politika Yok
- Güncel Bildirim Okunmadı
- Güncel Bildirim Bekliyor

seçeneklerini destekler.

Filtreler salt-okunurdur.

## Liste Rozetleri

Her vakada gerektiğinde:

- Hedef Dışında
- Hedef %75+
- Hedef %50–74
- Politika Yok
- Bildirim Okunmadı
- Bildirim Bekliyor

rozetleri görünür.

Mevcut:

- Gecikti
- Bugün
- Tarih Yok
- İlk Müdahale Yok

rozetleri korunur.

## Ekip İş Yükü

Sorumlu bazlı ekip görünümüne:

- hedef dışı vaka,
- okunmamış güncel risk bildirimi,
- gönderim bekleyen güncel risk bildirimi

sayıları eklenmiştir.

Owner değişiminde eski owner bildirimi yeni owner yüküne yazılmaz.

## Güvenli Geriye Uyumluluk

089/090 hedef-risk tabloları veya resolver kullanılabilir değilse İş Kutusu eski 1.2.62 davranışıyla çalışmaya devam eder.

Hedef-risk alanları sıfır/boş olur.

Mevcut aksiyon tarihleri, scope ve arama davranışı bozulmaz.

## Navigasyon

İş Kutusu üst ve alt navigasyonuna:

`Hedef Risk Bildirim Sağlığı`

bağlantısı eklenmiştir.

## Salt Okunur

`src/ticari_mutabakat_is_kutusu.php`

yeni entegrasyonda:

- INSERT
- UPDATE
- DELETE

çalıştırmaz.

Sayfada POST iş akışı yoktur.

## Testler

Yeni testler:

- `tests/reconciliation-inbox-target-risk-196.cjs`
- `tests/reconciliation-inbox-target-risk-db-196.php`

MariaDB testi şunları doğrular:

1. hedef dışı + okunmamış güncel sinyali,
2. %75+ + okunmuş güncel sinyali,
3. %50–74 bandının bildirim gerektirmemesini,
4. politika olmayan vakanın bildirim gerektirmemesini,
5. reopen öncesi eski okunmamış bildirimin yeni döngüyü karşılamamasını,
6. eski döngü bildiriminin yeni döngüde `Bildirim Bekliyor` üretmesini,
7. hedef dışı + okunmamış vakanın listenin en üstüne alınmasını,
8. hedef dışı + bekleyen vakanın ikinci önceliği almasını,
9. hedef dışı filtresini,
10. okunmamış risk filtresini,
11. bildirim bekleyen filtresini,
12. %50–74 filtresini,
13. kişisel hedef dışı KPI'sını,
14. kişisel %75+ KPI'sını,
15. kişisel okunmamış KPI'sını,
16. kişisel gönderim bekleyen KPI'sını,
17. ekip hedef dışı yükünü,
18. ekip okunmamış risk yükünü,
19. ekip bekleyen gönderim yükünü,
20. owner değişiminde eski owner bildiriminin yeni owner'a teslim edilmiş sayılmamasını,
21. owner değişiminde yeni owner'ın `Bildirim Bekliyor` görünmesini,
22. Süper Admin olmayan erişimin fail-closed kalmasını.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin,
- salt-okunur entegrasyon,
- current-owner eşlemesi,
- reopen-aware SHA-256 current-cycle eşlemesi,
- exact current-signal eşlemesi,
- recipient `okundu_tarihi` snapshot'ı,
- mevcut hedef-risk resolver'ını yeniden kullanma

ile çalışır.
