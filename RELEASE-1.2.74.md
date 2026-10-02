# İlkAdım 1.2.74

## Mutabakat Günlük İş Kutusundan Tek-Vaka Hedef-Risk Bildirimi

Bu sürüm 1.2.71 Günlük İş Kutusu hedef-risk görünümünü, 1.2.73 tek-vaka gönderim motoruyla doğrudan birleştirir.

Yeni migration yoktur.

Migration zinciri:

`090`

olarak kalır.

## Amaç

1.2.71 İş Kutusu açık vakada:

- güncel hedef-risk seviyesini,
- current owner durumunu,
- current reopen döngüsünü,
- güncel risk bildiriminin okunup okunmadığını,
- `Bildirim Bekliyor` durumunu

gösteriyordu.

1.2.73 ise yalnız Aksiyon Detayı içinde:

`Güncel Hedef-Risk Bildirimini Gönder`

aksiyonu sunuyordu.

1.2.74 ile operatör günlük iş listesinden ayrılmadan, yalnız seçili bekleyen vaka için aynı güvenli gönderim motorunu çalıştırabilir.

## Yeni Bildirim Motoru Yok

Bu sürüm yeni notification algoritması yazmaz.

İş Kutusu adapter'ı:

`mi_send_target_risk_case(PDO $pdo,array $actor,int $caseId)`

mevcut:

`mrb_sync_case(PDO $pdo,array $actor,int $caseId)`

fonksiyonunu kullanır.

`mrb_sync_case()` ise 1.2.73'te olduğu gibi global 1.2.69:

`mrb_sync()`

motorunun exact-case filtresidir.

Böylece:

- Global Hedef Risk Bildirimleri Merkezi,
- Mutabakat Aksiyon Detayı,
- Mutabakat Günlük İş Kutusu

aynı gönderim güvenliğini paylaşır.

## Current Context Resolver Tekrar Kullanımı

Yeni:

`mi_target_risk_case()`

adapter'ı yeni risk hesaplama algoritması yazmaz.

Mevcut 1.2.71:

`mi_target_risk_map()`

resolver'ını yalnız seçili vaka ID'siyle çağırır.

Bu nedenle İş Kutusu butonu:

- current owner,
- current reopen döngüsü,
- exact current signal,
- current recipient read state

kurallarını mevcut günlük iş görünümüyle aynı şekilde kullanır.

## Buton Ne Zaman Görünür?

Her vaka satırında buton yalnız:

`hedef_bildirim_bekliyor = true`

olduğunda görünür.

Buton metni:

`Güncel Hedef-Risk Bildirimini Gönder`

Şunlarda buton görünmez:

- Bildirim Okunmadı
- Bildirim Okundu
- Bildirim Gerekmiyor
- Hedef %50–74
- Politika Yok
- Hedef-risk bağlamı yok

## POST Yeniden Doğrulaması

UI'da buton görünmesi tek güvenlik katmanı değildir.

POST sırasında:

1. Süper Admin oturumu korunur,
2. CSRF doğrulanır,
3. action whitelist yalnız `send_target_risk` kabul eder,
4. mutabakat vaka senkronizasyonu çalıştırılır,
5. seçili vaka ID'si doğrulanır,
6. current inbox target-risk context yeniden çözülür,
7. durum hâlâ `bekliyor` değilse gönderim motoru çağrılmaz,
8. bekliyorsa 1.2.73 exact-case motoru çalıştırılır.

Bu nedenle kullanıcı eski/stale bir İş Kutusu ekranındaki butona basarsa eski ekran state'ine güvenilmez.

## 1.2.69 / 1.2.73 Güvenlikleri Aynen Korunur

İş Kutusundan gönderim de mevcut motor üzerinden:

- Süper Admin yetkisi,
- aktif açık vaka,
- row lock,
- current owner,
- current institution,
- aktif Süper Admin recipient,
- kaynak sorun hâlâ açık kontrolü,
- transaction içinde fresh target-risk resolver,
- tarihsel policy,
- current reopen döngüsü,
- exact current signal,
- DB unique dedup,
- concurrent `INSERT IGNORE`,
- merkezi Bildirimler entegrasyonu,
- append-only vaka geçmişi

kurallarından geçer.

## Sonuç Durumları

İş Kutusu adapter'ı sonucu açık status olarak ayırır:

- `sent`
- `not_pending`
- `no_context`
- `invalid_owner`
- `no_institution`
- `stale_source`
- `no_longer_required`
- `skipped`
- `failed`

Kullanıcıya bunların teknik kodu değil anlaşılır Türkçe mesaj gösterilir.

## İkinci Tıklama / Dedup

İlk başarılı gönderimden sonra 1.2.71 resolver artık aynı current notification'ı:

- Okunmadı
- veya Okundu

olarak görür.

Bu nedenle ikinci İş Kutusu tıklaması exact-case motoruna gitmeden:

`not_pending`

olarak durur.

Motor seviyesinde de mevcut DB dedup koruması devam eder.

UI açıklaması:

`Aynı vaka + current owner + current reopen döngüsü + current sinyal ikinci kez gönderilemez.`

olarak gösterilir.

## Current Owner

Bildirim seçili satırdaki görsel owner bilgisine körü körüne güvenmez.

POST sonrası fresh context ve mevcut 1.2.73 row-lock doğrulaması kullanılır.

Owner değişmişse eski owner'a stale bildirim gönderilmez.

Yeni current owner için mevcut current signal delivery durumu yeniden değerlendirilir.

## Reopen Döngüsü

Eski reopen döngüsüne gönderilmiş hedef-risk bildirimi yeni açık döngüyü karşılamaz.

İş Kutusu 1.2.71 SHA-256 current-cycle çözümlemesini kullanmaya devam eder.

Yeni döngüde uygun current signal `Bildirim Bekliyor` ise yeni owner/cycle/signal kombinasyonu bir kez gönderilebilir.

## Kaynak Sorun Çözülmüşse

POST sırasında kaynak mutabakat sorunu çözülmüşse mevcut 1.2.69:

`ma_case_source_still_open()`

kontrolü gönderimi engeller.

Sonuç:

`Kaynak sorun artık açık olmadığı için hedef-risk bildirimi gönderilmedi.`

olarak gösterilir.

Sahte notification/history oluşmaz.

## Geçersiz Owner

Sorumlu:

- bulunamayan,
- pasif,
- Süper Admin olmayan

kullanıcıysa gönderim fail-closed kalır.

Kullanıcı:

`Vakanın bildirim alabilecek aktif Süper Admin sorumlusu bulunmuyor.`

mesajını görür.

Owner düzeltmesi mevcut Sorumlu Devir Merkezi'nden yapılır.

## Kurum Bağlamı Yok

Kurum ID'si olmayan vaka için merkezi bildirim oluşturulmaz.

İş Kutusu:

`Vakanın kurum bağlamı olmadığı için hedef-risk bildirimi gönderilemedi.`

mesajını gösterir.

## %50–74 ve Politika Yok

Bu durumlar current target-risk bağlamında notification gerektirmez.

Adapter gönderim yapmaz.

Mevcut 1.2.69 kuralları genişletilmez.

## Okundu Durumu Değişmez

İş Kutusundan gönderim:

- recipient'i okundu yapmaz,
- `okundu_tarihi` yazmaz,
- notification'ı açılmış kabul etmez.

Okunma yalnız gerçek merkezi Bildirimler kullanıcı etkileşiminden gelir.

## Filtreleri Koruyan Redirect

Gönderim sonrası günlük iş bağlamının kaybolmaması için güvenli whitelist tabanlı redirect query oluşturulur.

Korunan alanlar:

- scope
- window
- sorun_turu
- risk
- owner_id
- q

Arbitrary:

`return_to`

veya harici redirect URL alınmaz.

Böylece kullanıcı örneğin:

`Bildirim Bekliyor + Bana Atanan + Gecikmiş`

filtreleriyle çalışıyorsa gönderim sonrası aynı operasyon görünümüne döner.

## İş Kutusu Artık Tam Salt-Okunur Değil

1.2.71'de İş Kutusu tamamen salt-okunurdu.

1.2.74 ile tek write davranışı:

`send_target_risk`

POST aksiyonudur.

Bu aksiyon:

- vaka state'i değiştirmez,
- aksiyon tarihi değiştirmez,
- owner değiştirmez,
- policy değiştirmez.

Yalnız mevcut target-risk notification motorunu seçili vaka için çalıştırabilir.

## Yeni Migration Yok

1.2.69:

`ticari_mutabakat_hedef_risk_bildirimleri`

tablosu ve mevcut merkezi bildirim tabloları yeterlidir.

Yeni state veya schema gerekmemektedir.

Migration zinciri:

`090`

olarak kalır.

## Testler

Yeni testler:

- `tests/reconciliation-inbox-target-risk-send-199.cjs`
- `tests/reconciliation-inbox-target-risk-send-db-199.php`

MariaDB testi şunları doğrular:

1. seçili current target-risk context'in inbox resolver ile çözülmesini,
2. bekleyen hedef-dışı vakanın İş Kutusundan tek kez gönderilmesini,
3. exact-case send sonucunun bir gönderim raporlamasını,
4. merkezi bildirimin current owner'a gitmesini,
5. deep link'in ilgili Aksiyon Detayına gitmesini,
6. gönderim sonrası inbox context'in `okunmadi` olmasını,
7. ikinci tıklamada adapter'ın `not_pending` durmasını,
8. ikinci notification history oluşmamasını,
9. ikinci merkezi duyuru oluşmamasını,
10. %75+ başka vakanın kendi owner'ına gönderilmesini,
11. başka vaka gönderiminde ilk vakanın geçmişinin değişmemesini,
12. geçersiz owner'ın fail-closed kalmasını,
13. kurumsuz vakanın fail-closed kalmasını,
14. kaynak sorunu çözülmüş vakanın gönderilmemesini,
15. %50–74 / notification gerektirmeyen vakanın gönderilmemesini,
16. başarılı gönderimin append-only vaka geçmişine tek olay yazmasını,
17. Süper Admin olmayan actor'ın gönderememesini.

Mevcut 194–198 regresyonları ayrıca:

- target-risk sinyal hesabını,
- tarihsel policy'yi,
- global notification sync'i,
- notification health'i,
- inbox current-owner/current-cycle görünümünü,
- aksiyon detayı exact-case gönderimini

korumaya devam eder.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin,
- CSRF,
- action whitelist,
- POST'ta vaka senkronizasyonu,
- current inbox context re-resolution,
- 1.2.73 exact-case engine reuse,
- row lock,
- source-open recheck,
- current owner/current cycle/current signal,
- DB unique dedup,
- concurrent INSERT IGNORE,
- append-only history,
- safe redirect whitelist,
- okundu state'ini değiştirmeme

ile çalışır.
