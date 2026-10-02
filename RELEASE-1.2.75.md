# İlkAdım 1.2.75

## Mutabakat Günlük İş Kutusunda Seçili Toplu Hedef-Risk Bildirimi

Bu sürüm 1.2.74 Günlük İş Kutusu tek-vaka hedef-risk bildirimini, kontrollü seçili toplu gönderim akışıyla tamamlar.

Yeni migration yoktur.

Migration zinciri:

`090`

olarak kalır.

## Amaç

1.2.74 ile operatör Günlük İş Kutusu'ndan:

`Güncel Hedef-Risk Bildirimini Gönder`

aksiyonunu vaka bazında kullanabiliyordu.

Ancak filtrelenmiş günlük iş listesinde birden fazla:

`Bildirim Bekliyor`

vakası varsa her birini tek tek göndermek gerekiyordu.

1.2.75 ile operatör yalnız istediği görünür bekleyen vakaları seçip tek POST içinde toplu işlem başlatabilir.

## Yeni Bildirim Motoru Yok

Bu sürüm:

- yeni notification algoritması yazmaz,
- yeni bildirim tablosu oluşturmaz,
- yeni dedup anahtarı oluşturmaz.

Toplu adapter her seçili vaka için mevcut:

`mi_send_target_risk_case()`

fonksiyonunu çağırır.

Bu fonksiyon da 1.2.73 / 1.2.74 üzerinden mevcut:

`mrb_sync_case()`

ve nihayet:

`mrb_sync()`

motorunu kullanır.

Böylece tek-vaka ve toplu gönderim aynı güvenlik kurallarını paylaşır.

## Görünür Vaka Allowlist

POST edilen vaka ID'lerine körü körüne güvenilmez.

Toplu gönderimden hemen önce:

1. normal mutabakat vaka senkronizasyonu çalışır,
2. kullanıcının mevcut filtreleriyle İş Kutusu satırları yeniden hesaplanır,
3. yalnız hâlâ görünür olan vakalar alınır,
4. yalnız `hedef_bildirim_bekliyor = true` vakalar allowlist'e girer,
5. POST edilen seçim bu allowlist ile karşılaştırılır.

Mevcut filtrede görünmeyen veya artık bildirim beklemeyen vaka toplu işlem tarafından gönderilmez.

## Hard Batch Limiti

Tek toplu işlemde en fazla:

`50`

benzersiz vaka işlenebilir.

Bu sınır yalnız UI metni değildir.

Domain:

`mi_send_target_risk_cases()`

seviyesinde hard-cap olarak uygulanır.

Caller daha yüksek limit istemeye çalışsa bile 50 üzeri seçim reddedilir.

## Duplicate Seçim Normalizasyonu

Aynı vaka ID'si POST içinde birden fazla kez gelirse yalnız bir kez değerlendirilir.

Normalize edilen vaka listesi:

- pozitif integer,
- unique

olacak şekilde hazırlanır.

## Seçim UI

İş Kutusu yalnız:

`Bildirim Bekliyor`

satırlarda:

`Toplu gönderim için seç`

checkbox'ı gösterir.

Üst toplu işlem alanı:

- görünür bekleyen vaka sayısını,
- 50 vaka limitini,
- seçili toplu gönderim butonunu

gösterir.

## İlk 50 Görünür Bekleyeni Seç

Kolay operasyon için:

`İlk 50 görünür bekleyen vakayı seç`

kontrolü eklenmiştir.

Bu kontrol yalnız ekrandaki pending checkbox'ları seçer.

51. ve sonraki görünür pending vaka otomatik seçilmez.

Server-side 50 vaka sınırı ayrıca korunur.

## Mevcut Filtreler Korunur

Toplu gönderim sonrası güvenli redirect mevcut whitelist filtrelerini korur:

- scope
- window
- sorun_turu
- risk
- owner_id
- q

Harici:

`return_to`

veya arbitrary URL kabul edilmez.

## POST Yeniden Doğrulaması

Toplu işlem:

- yalnız Süper Admin,
- POST,
- CSRF

ile çalışır.

İşlem başlangıcında:

`ma_sync_cases()`

çalışır.

Ardından görünür/pending allowlist yeniden oluşturulur.

Bu nedenle eski/stale sayfada seçilmiş bir vaka, POST anında artık uygun değilse gönderilmez.

## Exact-case Güvenlikleri Aynen Korunur

Her eligible vaka yine mevcut motor üzerinden:

- açık vaka kontrolü,
- row lock,
- current owner,
- current institution,
- aktif Süper Admin recipient,
- kaynak sorun hâlâ açık kontrolü,
- tarihsel hedef policy,
- current reopen döngüsü,
- exact current signal,
- DB unique dedup,
- concurrent `INSERT IGNORE`,
- merkezi Bildirimler entegrasyonu,
- append-only vaka geçmişi

kurallarından geçer.

## Tek Vaka Hatası Diğerlerini Durdurmaz

Toplu işlem tüm vakaları tek transaction içine almaz.

Her vaka exact-case motorunun kendi güvenli transaction'ını kullanır.

Örneğin seçili 5 vakadan:

- 3 tanesi başarıyla gönderilebilir,
- 1 tanesinde geçersiz owner olabilir,
- 1 tanesinde merkezi bildirim oluşturma hatası olabilir.

İlk üç başarılı gönderim geri alınmaz.

Sonuç özetinde durumlar ayrı sayılır.

## Sonuç Özeti

Toplu POST dönüşünde şu sayılar ayrıştırılır:

- seçili,
- gönderildi,
- artık beklemiyor,
- görünür/bekleyen değil,
- geçersiz sorumlu,
- kurum bağlamı yok,
- kaynak sorun çözülmüş,
- güncel sinyal değişmiş,
- dedup/stale,
- hata.

Ham DB hatası kullanıcıya gösterilmez.

## İkinci Toplu Tıklama

İlk gönderimden sonra current inbox resolver ilgili vaka için:

- `okunmadi`,
- veya `okundu`

durumu üretir.

Bu nedenle aynı vakaları ikinci kez seçip POST etmek ikinci notification oluşturmaz.

Exact-case engine DB dedup koruması da ek güvenlik olarak devam eder.

## Okundu Durumu Değişmez

Toplu gönderim:

- recipient'i okundu yapmaz,
- `okundu_tarihi` yazmaz,
- bildirimi açılmış kabul etmez.

Okunma yalnız gerçek merkezi Bildirimler etkileşiminden gelir.

## Vaka State'i Değişmez

Toplu hedef-risk gönderimi:

- vaka aşamasını değiştirmez,
- owner değiştirmez,
- aksiyon tarihi değiştirmez,
- hedef policy değiştirmez.

Yalnız mevcut current target-risk notification motorunu seçili vakalar için çağırır.

## Global Bildirim Merkezi Değişmedi

Mevcut:

`ticari-mutabakat-hedef-risk-bildirim.php`

global senkronizasyonu aynen çalışır.

1.2.75 yalnız Günlük İş Kutusu operasyon ergonomisini geliştirir.

## Yeni Migration Yok

Mevcut 1.2.69:

`ticari_mutabakat_hedef_risk_bildirimleri`

tablosu yeterlidir.

Yeni state gerekmediği için migration zinciri:

`090`

olarak kalır.

## Testler

Yeni testler:

- `tests/reconciliation-inbox-target-risk-bulk-send-200.cjs`
- `tests/reconciliation-inbox-target-risk-bulk-send-db-200.php`

MariaDB testi şunları doğrular:

1. görünür pending ID resolver'ını,
2. duplicate seçimlerin unique hale gelmesini,
3. boş toplu seçimin reddedilmesini,
4. caller daha yüksek limit verse bile 51 vakanın reddedilmesini,
5. limit hatasının hiçbir bildirim oluşturmadan gerçekleşmesini,
6. görünür/pending allowlist'i,
7. allowlist dışı vaka ID'lerinin gönderilmemesini,
8. üç geçerli seçili vakanın başarıyla gönderilmesini,
9. geçersiz owner'ın ayrı raporlanmasını,
10. kurum bağlamı olmayan vakanın ayrı raporlanmasını,
11. kaynak sorunu çözülmüş vakanın ayrı raporlanmasını,
12. merkezi notification hatasının tek vaka ile sınırlı kalmasını,
13. başarısız vakanın notification history transaction'ının rollback olmasını,
14. başarılı vakaların merkezi duyurularının korunmasını,
15. toplu işlemde yalnız allowlist içindeki geçerli vakaların etkilenmesini,
16. ikinci toplu tıklamada yeni notification oluşmamasını,
17. current context'in `not_pending` durmasını,
18. her başarılı vaka için append-only tek bildirim geçmişi olayını,
19. Süper Admin olmayan actor'ın toplu gönderememesini.

Mevcut 194–199 regresyonları ayrıca:

- target-risk policy/sinyal hesabını,
- global bildirim dedup'ını,
- bildirim sağlığını,
- İş Kutusu current-owner/current-cycle çözümünü,
- Aksiyon Detayı exact-case gönderimini,
- İş Kutusu tek-vaka gönderimini

korumaya devam eder.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin,
- CSRF,
- kapalı action whitelist,
- POST öncesi vaka senkronizasyonu,
- görünür/pending allowlist,
- 50 vaka hard-cap,
- unique case normalization,
- exact-case engine reuse,
- vaka bazlı transaction izolasyonu,
- current owner/current cycle/current signal,
- source-open recheck,
- DB unique dedup,
- concurrent `INSERT IGNORE`,
- safe redirect whitelist,
- append-only history,
- okundu state'ini değiştirmeme

ile çalışır.
