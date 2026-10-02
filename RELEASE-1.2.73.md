# İlkAdım 1.2.73

## Mutabakat Aksiyon Detayından Tek-Vaka Hedef-Risk Bildirimi

Bu sürüm 1.2.72 Aksiyon Detayı hedef-risk entegrasyonunu tamamlar.

Yeni migration yoktur.

Migration zinciri:

`090`

olarak kalır.

## Amaç

1.2.72 ile seçili açık mutabakat vakasında:

- güncel hedef-risk,
- current owner,
- current reopen döngüsü,
- current signal,
- güncel bildirim durumu

görünür hale gelmişti.

Ancak vaka:

`Bildirim Bekliyor`

durumundaysa operatör yalnız bu vaka için işlem yapmak yerine ayrı global Hedef Risk Bildirimleri merkezine gitmek zorundaydı.

1.2.73 seçili vaka detayına kontrollü:

`Güncel Hedef-Risk Bildirimini Gönder`

aksiyonu ekler.

## Yeni Bildirim Algoritması Yok

Bu sürüm yeni target-risk gönderim motoru yazmaz.

Mevcut 1.2.69:

`mrb_sync()`

motoru genişletilmiştir.

Yeni opsiyonel filtre:

`onlyCaseId`

ile aynı motor:

- global tüm adayları,
- veya yalnız seçili vakayı

işleyebilir.

Tek-vaka adapter:

`mrb_sync_case(PDO $pdo,array $actor,int $caseId)`

yalnız mevcut:

`mrb_sync($pdo,$actor,$caseId)`

akışını çağırır.

Bu nedenle global merkez ve Aksiyon Detayı aynı güvenlik kurallarını paylaşır.

## Buton Ne Zaman Görünür?

Buton yalnız seçili açık vaka için:

`hedef_bildirim_durumu = bekliyor`

olduğunda görünür.

Şunlarda buton gösterilmez:

- Bildirim Okundu
- Bildirim Okunmadı
- Bildirim Gerekmiyor
- Hedef-risk verisi yok

Bu UI kontrolü tek güvenlik katmanı değildir; POST sırasında güncel bağlam tekrar çözülür.

## POST Sırasında Yeniden Doğrulama

Tek-vaka gönderim POST'u:

1. CSRF doğrular,
2. normal mutabakat vaka senkronizasyonunu çalıştırır,
3. seçili vaka ID'sini çözer,
4. target-risk bildirim tablolarının hazır olduğunu doğrular,
5. `ma_target_risk_context()` ile current context'i yeniden çözer,
6. durum hâlâ `bekliyor` değilse gönderim yapmaz,
7. mevcut 1.2.69 motorunu yalnız seçili vaka için çalıştırır.

Bu nedenle ekranda eski görünen bir butona sonradan basılması stale bildirim üretmez.

## Mevcut 1.2.69 Güvenlikleri Korunur

Tek-vaka gönderim de aynen:

- Süper Admin rol kontrolü,
- açık vaka kontrolü,
- `SELECT ... FOR UPDATE`,
- current owner kontrolü,
- kurum bağlamı kontrolü,
- aktif Süper Admin recipient doğrulaması,
- kaynak sorunun hâlâ açık olması,
- target-risk state'in transaction içinde yeniden hesaplanması,
- tarihsel hedef politika,
- current reopen döngüsü,
- exact current signal,
- DB unique dedup,
- `INSERT IGNORE` concurrent guard,
- merkezi Bildirimler entegrasyonu,
- append-only vaka geçmişi

kurallarından geçer.

## Current Owner

Bildirim:

`vakanın o anda geçerli sorumlu Süper Admin kullanıcısına`

gider.

Eski owner'a ait geçmiş bildirim bugünkü owner için teslim edilmiş sayılmaz.

POST sırasında owner değişmişse stale candidate gönderilmez.

## Reopen Döngüsü

Aynı vaka kapanıp yeniden açıldıysa current cycle mevcut 1.2.68/1.2.69 kurallarıyla çözülür.

Eski döngü bildirimi yeni döngüyü karşılamaz.

Yeni döngü güncel hedef-risk sinyaline ulaştığında seçili vaka için yeni gönderim yapılabilir.

## Exact Signal

Tek-vaka gönderim yalnız güncel:

- `hedef_disinda`,
- veya `hedef_75`

sinyali için aday üretir.

Şunlar gönderim adayı değildir:

- Süre %50–74
- Hedef İçinde
- Politika Yok

Bu nedenle Aksiyon Detayı %50 bandında kendi başına bildirim üretmez.

## Dedup

Aynı:

- vaka,
- current reopen döngüsü,
- tarihsel policy,
- current signal,
- current owner

kombinasyonu ikinci kez gönderilemez.

Butona iki kez basılması ikinci merkezi bildirim üretmez.

UI ayrıca:

`Aynı vaka + current owner + current reopen döngüsü + current sinyal ikinci kez gönderilemez.`

bilgisini gösterir.

## Kaynak Sorun Çözülmüşse

POST sırasında mevcut:

`ma_case_source_still_open()`

kontrolü tekrar çalışır.

Kaynak sorun artık yoksa:

- bildirim oluşturulmaz,
- target-risk history satırı eklenmez,
- kullanıcıya kaynak sorunun artık açık olmadığı bilgisi verilir.

## Sorumlu Geçersizse

Vaka sorumlusu:

- pasif,
- bulunamayan,
- veya Süper Admin olmayan

kullanıcıysa bildirim gönderilmez.

Aksiyon Detayı anlaşılır hata gösterir.

Sahiplik mevcut Sorumlu Devir Merkezi üzerinden düzeltilir.

## Kurum Bağlamı Yoksa

Kurum ID'si olmayan vakaya merkezi bildirim oluşturulmaz.

Tek-vaka işlem bunu da fail-closed korur.

## Current State İşlem Sırasında Değişirse

Aday liste oluşturulduktan sonra:

- owner,
- kurum,
- vaka aşaması,
- kaynak açıklığı,
- hedef-risk sinyali

değişmiş olabilir.

Motor row-lock ve fresh resolver ile bunları yeniden doğrular.

Uyuşmayan vaka:

`skipped`

olarak kalır; eski candidate üzerinden bildirim gönderilmez.

## Okundu Durumu Değiştirilmez

Bu aksiyon yalnız bildirim oluşturabilir.

Şunları yapmaz:

- recipient'i okundu işaretlemez,
- `okundu_tarihi` yazmaz,
- mevcut bildirimi açılmış kabul etmez.

Okundu durumu merkezi Bildirimler akışının gerçek kullanıcı etkileşiminden gelir.

## Global Bildirim Merkezi Değişmedi

Mevcut:

`ticari-mutabakat-hedef-risk-bildirim.php`

global senkronizasyonu çalışmaya devam eder.

`mrb_sync($pdo,$actor)`

çağrısı bütün adayları işler.

Yalnız üçüncü opsiyonel:

`onlyCaseId`

parametresi eklenmiştir.

Dolayısıyla 1.2.69 global operasyon davranışı korunur.

## Sonuç Ayrımı

Tek-vaka POST sonucu şu durumları ayırır:

- Gönderildi
- Geçerli Süper Admin sorumlusu yok
- Kurum bağlamı yok
- Kaynak sorun çözülmüş
- Güncel sinyal artık bildirim gerektirmiyor
- Daha önce gönderilmiş
- Vaka bağlamı işlem sırasında değişmiş
- Beklenmeyen bildirim oluşturma hatası

Ham DB hatası kullanıcıya gösterilmez.

## Yeni Migration Yok

1.2.69'un:

`ticari_mutabakat_hedef_risk_bildirimleri`

tablosu yeterlidir.

Yeni state veya yeni notification tipi oluşturulmadığı için migration zinciri:

`090`

olarak kalır.

## Testler

Yeni testler:

- `tests/reconciliation-action-target-risk-send-198.cjs`
- `tests/reconciliation-action-target-risk-send-db-198.php`

MariaDB testi şunları doğrular:

1. candidate resolver'ın yalnız seçili vakayı döndürmesini,
2. seçili hedef-dışı vakanın tam bir kez bildirim üretmesini,
3. merkezi bildirimin current owner'a gitmesini,
4. deep link'in aynı vaka detayına dönmesini,
5. aynı vaka için ikinci gönderimin dedup edilmesini,
6. ikinci merkezi bildirimin oluşmamasını,
7. farklı seçili %75 vakanın yalnız kendi owner'ına gitmesini,
8. bir vaka gönderilirken diğer vaka geçmişinin değişmemesini,
9. geçersiz owner'ın fail-closed kalmasını,
10. kurumsuz vakanın fail-closed kalmasını,
11. kaynak sorunu çözülmüş vakanın gönderilmemesini,
12. %50–74 bandının candidate üretmemesini,
13. DB current owner ile candidate owner uyuşmazlığının row-lock sonrası atlanmasını,
14. global `mrb_sync()` akışının çalışmaya devam etmesini,
15. global sync'in daha önce tek-vaka gönderilmiş kayıtları tekrar üretmemesini,
16. başarılı gönderimin append-only vaka geçmişine tek olay yazmasını,
17. Süper Admin olmayan actor'ın tek-vaka gönderememesini.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin,
- CSRF,
- POST'ta current context re-resolution,
- mevcut 1.2.69 send engine reuse,
- exact-case candidate filter,
- row lock,
- current owner/current cycle/current signal,
- source-open recheck,
- DB unique dedup,
- concurrent `INSERT IGNORE`,
- append-only history,
- okundu durumunu değiştirmeme

ile çalışır.
