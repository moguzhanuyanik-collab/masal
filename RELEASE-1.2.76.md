# İlkAdım 1.2.76

## Güncel Owner Hedef-Risk Sağlığı ve Okunmamış Risk Takip Planlama

Bu sürüm 1.2.69–1.2.75 hedef-risk bildirim zincirini iki noktada tamamlar:

1. Bildirim Sağlığı artık yalnız güncel açık döngüyü değil, bildirimin recipient'inin vakanın güncel sorumlusu olup olmadığını da dikkate alır.
2. Güncel owner + güncel reopen döngüsü + güncel hedef-risk sinyaliyle eşleşen okunmamış bildirimler, owner değiştirilmeden toplu sonraki aksiyon tarihine bağlanabilir.

Yeni migration yoktur.

Migration zinciri:

`090`

olarak kalır.

## Sağlık KPI Doğruluğu

1.2.70 Bildirim Sağlığı reopen döngüsünü ayırıyordu ancak aynı reopen döngüsünde owner değişmişse eski sorumluya ait bildirim güncel açık KPI'sına girebiliyordu.

1.2.76 ile:

`guncel_acik_vaka`

şu üç koşulun tamamını gerektirir:

- vaka açık,
- bildirim current reopen döngüsüne ait,
- notification recipient vakanın güncel `sorumlu_kullanici_id` değeriyle aynı.

Böylece eski sorumluya ait okunmamış bildirim yeni owner'ın güncel müdahale yükünü şişirmez.

## Eski Sorumlu Geçmişi

Aynı current reopen döngüsünde olup artık güncel owner'a ait olmayan bildirimler:

`eski_sorumlu_bildirimi`

olarak tarihsel geçmişte korunur.

Yeni filtre:

`Eski sorumlu bildirimi`

ve yeni KPI:

`Eski sorumlu`

eklenmiştir.

Bu kayıtlar silinmez veya yeniden yazılmaz.

## Yeni Takip Planlama Merkezi

Yeni sayfa:

`ticari-mutabakat-hedef-risk-takip.php`

Yeni domain:

`src/ticari_mutabakat_hedef_risk_takip.php`

Yeni stil:

`ticari-mutabakat-hedef-risk-takip.css`

Amaç, gönderilmiş ancak hâlâ okunmamış güncel hedef-risk bildirimlerini yalnız operasyon planına bağlamaktır.

## Eligible Vaka Tanımı

Bir vaka takip planlama listesine ancak şu koşulların tamamıyla girer:

- Süper Admin erişimi,
- vaka güncel açık döngüde açık,
- bildirimin recipient'i güncel owner,
- bildirim okunmamış,
- current inbox resolver aynı vaka için aynı notification id'yi güncel bildirim sayıyor,
- güncel sinyal exact olarak aynı,
- güncel owner aynı.

Bu nedenle sadece sağlık geçmişinde "okunmamış" görünmek yeterli değildir.

## Exact Current-State Yeniden Kullanımı

Yeni takip adapter'ı mevcut:

`mi_target_risk_map()`

resolver'ını kullanır.

Bu resolver 1.2.71'den beri:

- current owner,
- current reopen cycle,
- exact current signal,
- notification id,
- read state

eşlemesini yapar.

Yeni bir ikinci notification-state algoritması yazılmamıştır.

## POST Öncesi Yeniden Doğrulama

Toplu planlama POST'unda önce:

`ma_sync_cases()`

çalışır.

Sonra mevcut filtrelerle eligible liste yeniden hesaplanır.

Seçilen her vaka yeniden oluşturulan allowlist içinde olmalıdır.

Aşağıdaki değişikliklerden biri POST öncesinde gerçekleşmişse seçim reddedilir:

- bildirim okunmuşsa,
- owner değişmişse,
- vaka kapanmışsa,
- reopen döngüsü değişmişse,
- current target-risk sinyali değişmişse,
- exact current notification artık farklıysa.

Stale sayfa verisine güvenilmez.

## Owner Değiştirilmez

Yeni akış mevcut:

`map_bulk_plan()`

fonksiyonunu owner atamak için kullanmaz.

Bunun yerine yeni:

`map_bulk_reschedule_preserve_owners()`

helper'ı kullanılır.

Bu helper:

- her vakanın mevcut owner'ını doğrular,
- owner'ın hâlâ aktif Süper Admin olduğunu doğrular,
- `sorumlu_kullanici_id` alanına yazmaz,
- yalnız `sonraki_aksiyon_tarihi` ve `guncelleyen_kullanici_id` alanını günceller.

Bu nedenle farklı owner'lara ait vakalar aynı toplu takip planında seçilebilir ve her vaka kendi sahibinde kalır.

## Kaynak Sorun Yeniden Doğrulaması

Her seçili vaka transaction içinde `FOR UPDATE` ile kilitlenir.

Ardından:

- vaka hâlâ açık mı,
- kaynak mutabakat sorunu hâlâ açık mı,
- güncel owner geçerli mi

kontrol edilir.

Bir vaka bu doğrulamadan geçmezse toplu takip planı fail-closed davranır.

## Takip Tarihi

Sonraki aksiyon tarihi:

- zorunludur,
- geçerli `Y-m-d` olmalıdır,
- geçmiş tarih olamaz.

Plan notu:

- isteğe bağlıdır,
- en fazla 600 karakterdir.

## Hard Batch Limiti

Tek okunmamış-risk takip planlama işleminde en fazla:

`50`

benzersiz vaka seçilebilir.

Limit domain seviyesinde uygulanır.

UI ayrıca:

`İlk 50 görünür vakayı seç`

kontrolü sunar.

## Append-Only Audit

Her planlanan vaka için:

`ticari_mutabakat_vaka_gecmisi`

tablosuna:

- tür: `planlama`
- kod: `toplu_takip_planlama`

olayı eklenir.

Geçmiş metni:

- mevcut owner'ın korunduğunu,
- eski/yeni aksiyon tarihini,
- varsa takip notunu

saklar.

## Bildirim State'i Değişmez

Takip planlama:

- bildirimi okundu yapmaz,
- `okundu_tarihi` yazmaz,
- yeni target-risk bildirimi göndermez,
- mevcut notification history kaydını değiştirmez.

Okunma yalnız gerçek Bildirimler Merkezi etkileşiminden gelir.

## Vaka State'i Değişmez

Takip planlama:

- vaka aşamasını değiştirmez,
- vakayı kapatmaz,
- owner değiştirmez,
- hedef politikası değiştirmez,
- target-risk sinyali üretmez.

Yalnız mevcut açık vakaya sonraki aksiyon tarihi verir.

## Navigasyon

Yeni merkez bağlantısı:

- Süper Admin menüsüne,
- Hedef Risk Bildirim Sağlığı ekranına,
- Mutabakat Günlük İş Kutusu'na

eklenmiştir.

## Testler

Yeni testler:

- `tests/reconciliation-target-risk-followup-201.cjs`
- `tests/reconciliation-target-risk-followup-db-201.php`

MariaDB testi şunları doğrular:

1. current owner + current cycle bildirimin güncel açık sayılmasını,
2. ikinci current owner'ın ayrı güncel açık bildirimini,
3. aynı cycle'da eski recipient bildiriminin `eski_sorumlu` sayılmasını,
4. eski owner bildiriminin güncel açık KPI'sını şişirmemesini,
5. pre-reopen bildirimin eski döngü sayılmasını,
6. okunmuş current bildirimin follow-up listesine girmemesini,
7. exact current notification id eşleşmesini,
8. exact current signal/read-state eşleşmesini,
9. yalnız iki uygun okunmamış vakanın follow-up allowlistine girmesini,
10. hedef dışı / %75+ özetini,
11. gecikmiş aksiyon ve aksiyon tarihi olmayan özetini,
12. farklı iki current owner'a ait vakanın aynı toplu işlemde planlanmasını,
13. iki owner'ın da değişmeden korunmasını,
14. yalnız sonraki aksiyon tarihinin güncellenmesini,
15. her vaka için append-only `toplu_takip_planlama` history oluşmasını,
16. history'nin korunmuş owner bilgisini içermesini,
17. bildirim POST öncesinde okunursa stale seçimin reddedilmesini,
18. stale red sonrası yeni planning history yazılmamasını,
19. owner transferi sonrası eski recipient bildiriminin allowlistten çıkmasını,
20. 51 vakalık seçimin hard-cap ile reddedilmesini,
21. Süper Admin olmayan resolver erişiminin fail-closed `[]` dönmesini.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin,
- CSRF,
- kapalı POST action whitelist,
- current-owner health semantics,
- reopen-aware cycle key,
- exact current notification id,
- exact current signal,
- POST öncesi vaka senkronizasyonu,
- yeniden hesaplanan allowlist,
- 50 vaka hard-cap,
- row lock,
- kaynak açık kontrolü,
- aktif current-owner doğrulaması,
- owner-preserving update,
- append-only audit

ile çalışır.
