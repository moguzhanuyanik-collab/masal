# İlkAdım 1.2.79

## Stale Hedef-Risk Takip Planı Kurtarma Merkezi

Bu sürüm 1.2.78 Takip Sağlığı Müdahale Merkezi'nin bilinçli olarak reddettiği stale takip planları için ayrı ve fail-closed bir kurtarma akışı ekler.

Yeni migration yoktur.

Migration zinciri:

`090`

olarak kalır.

## Amaç

1.2.78 yalnız current-context'i hâlâ tamamen geçerli olan:

- aksiyon gecikmiş,
- aksiyon bugün,
- aksiyon tarihi yok

takiplerini yeniden planlayabiliyordu.

Aşağıdaki eski plan bağlamları ise doğru şekilde reddediliyordu:

- owner değişti,
- reopen döngüsü değişti,
- hedef-risk sinyali değişti,
- exact current notification değişti,
- plan anındaki bildirim çözümlenemedi.

Bu stale planları eski bağlamıyla yeniden kullanmak güvenli değildir.

1.2.79 eski planı taşımak yerine, vaka bugün hâlâ exact current unread hedef-risk koşullarını sağlıyorsa yeni current-context takip planı oluşturur.

## Yeni Merkez

Yeni sayfa:

`ticari-mutabakat-hedef-risk-takip-kurtarma.php`

Yeni domain:

`src/ticari_mutabakat_hedef_risk_takip_kurtarma.php`

Yeni stil:

`ticari-mutabakat-hedef-risk-takip-kurtarma.css`

## Kurtarma Allowlisti

Yalnız takip sağlığındaki şu stale durumlar aday olabilir:

- `owner_degisti`
- `dongu_degisti`
- `sinyal_degisti`
- `bildirim_degisti`
- `plan_bildirimi_yok`

Ancak stale sağlık durumu tek başına yeterli değildir.

Aynı vaka bugün ayrıca:

- açık olmalı,
- güncel owner'a sahip olmalı,
- current reopen döngüsünde olmalı,
- güncel hedef-risk sinyalinde olmalı,
- exact current notification'a sahip olmalı,
- notification okunmamış olmalı.

Bu ikinci allowlist mevcut:

`mrt_rows()`

resolver'ından alınır.

Kurtarma listesi iki allowlistin kesişimidir.

## Kurtarılamayan Durumlar

Şunlar kurtarma allowlistine girmez:

- Bildirim Okundu
- Hedef-Risk Çözüldü
- Vaka Kapandı
- Aksiyon Gecikmiş
- Aksiyon Bugün
- Aksiyon Tarihi Yok
- Planlı · Okunmadı

İlk üç durumda operasyonel risk bağlamı artık kurtarma gerektirmez.

Son dört durum stale değildir ve 1.2.78 Current-Context Müdahale Merkezi'nin kapsamındadır.

## Eski Plan Taşınmaz

Kurtarma sırasında eski planın:

- eski owner'ı,
- eski reopen döngüsü,
- eski hedef-risk sinyali,
- eski notification id'si,
- eski notification okunma state'i

yeni plana kopyalanmaz.

UI eski plan ile güncel bağlamı yan yana gösterir.

## Current Owner Korunur

Kurtarma mevcut:

`map_bulk_reschedule_preserve_owners()`

motorunu kullanır.

Bu motor:

- vaka satırını `FOR UPDATE` ile kilitler,
- vakanın hâlâ açık olduğunu doğrular,
- kaynak sorunun hâlâ açık olduğunu doğrular,
- current owner'ın aktif Süper Admin olduğunu doğrular,
- owner alanına yazmaz,
- yalnız yeni sonraki aksiyon tarihini yazar.

Owner değişmiş stale vakada eski owner'a geri dönüş yapılmaz.

Örneğin:

- eski plan owner: Admin A
- current owner: Admin B

ise kurtarma sonrası owner Admin B olarak kalır.

## POST Öncesi Yeniden Senkronizasyon

Kurtarma POST'unda önce:

`ma_sync_cases()`

çalışır.

Böylece seçim yapıldıktan sonra vaka kapanmış veya kaynak sorun çözülmüşse stale browser state'e güvenilmez.

## Çift Allowlist Yeniden Doğrulaması

POST sırasında iki allowlist yeniden hesaplanır.

### 1. Stale Sağlık Allowlisti

Vaka hâlâ:

- owner değişti,
- döngü değişti,
- sinyal değişti,
- notification değişti,
- veya plan bildirimi yok

durumlarından birinde mi kontrol edilir.

### 2. Exact Current Unread Allowlist

Vaka ayrıca mevcut:

`mrt_rows()`

resolver'ında bugün hâlâ:

- current owner,
- current reopen döngüsü,
- current hedef-risk sinyali,
- exact notification,
- unread state

ile bulunuyor mu kontrol edilir.

İki kontrolden biri kaybolursa işlem fail-closed reddedilir.

## Stale Sayfa Koruması

Kullanıcı seçim yaptıktan sonra aşağıdakilerden biri değişirse kurtarma yapılmaz:

- notification okunursa,
- risk çözülürse,
- vaka kapanırsa,
- current owner tekrar değişirse,
- reopen döngüsü tekrar değişirse,
- current hedef-risk sinyali değişirse,
- current exact notification değişirse.

Başarısız seçim yeni planning history yazmaz.

## Yeni Aksiyon Tarihi

Kurtarma yeni:

`sonraki_aksiyon_tarihi`

ister.

Tarih:

- zorunludur,
- geçerli `Y-m-d` olmalıdır,
- geçmiş tarih olamaz,
- bugün veya gelecek olabilir.

Doğrulama mevcut owner-preserving planning motorunda yapılır.

## Takip Notu

İsteğe bağlı takip notu mevcut 600 karakter sınırını kullanır.

Yeni kurtarma katmanı bu sınırı genişletmez.

## Append-only Yeni Plan

Başarılı kurtarma her vaka için mevcut:

- tür: `planlama`
- kod: `toplu_takip_planlama`

history olayını ekler.

Böylece 1.2.77 Takip Planı Sağlığı resolver'ı bundan sonra yeni olayı son current plan olarak görür.

Eski stale plan ve eski notification geçmişi silinmez.

## Bildirim State'i Değişmez

Kurtarma:

- bildirimi okundu yapmaz,
- `okundu_tarihi` yazmaz,
- yeni hedef-risk bildirimi göndermez,
- eski notification kaydını değiştirmez.

Yalnız exact current unread bağlamında yeni takip planı oluşturur.

## Vaka State'i Değişmez

Kurtarma:

- vakayı kapatmaz,
- vaka aşamasını değiştirmez,
- owner değiştirmez,
- risk politikasını değiştirmez,
- target-risk sinyali üretmez.

## Toplu Kurtarma Limiti

Tek işlemde en fazla:

`50`

benzersiz vaka seçilebilir.

UI:

`İlk 50 görünür adayı seç`

kontrolü sunar.

## Filtreler

Kurtarma merkezi:

- 7 / 30 / 90 / 180 / 365 gün,
- stale sağlık durumu,
- current hedef-risk sinyali,
- current owner,
- kurum / sözleşme / eski-yeni owner / plan notu araması

ile filtrelenebilir.

Current sinyal ve owner filtreleri current unread resolver'a uygulanır.

## Eski ve Güncel Bağlam Karşılaştırması

Her kurtarma adayında UI iki bağlamı gösterir.

### Eski plan

- plan alıcısı,
- plan sinyali,
- plan notification id.

### Güncel

- current owner/alıcı,
- current hedef-risk eşiği,
- exact current notification id.

Bu karşılaştırma stale planın neden aynen taşınmaması gerektiğini görünür kılar.

## Navigasyon

Yeni Stale Kurtarma bağlantısı:

- Süper Admin menüsüne,
- Takip Planı Sağlığı'na,
- Current-Context Müdahale Merkezi'ne,
- Okunmamış Hedef Risk Takibi'ne,
- Mutabakat Günlük İş Kutusu'na

eklenmiştir.

## Current Müdahale ile Ayrım

1.2.78 Current Müdahale Merkezi değişmemiştir.

Current müdahale:

- gecikmiş,
- bugün,
- tarihsiz

ve bağlamı hâlâ tamamen current olan planlar içindir.

1.2.79 Stale Kurtarma ise:

- owner/döngü/sinyal/notification bağlamı değişmiş,
- fakat bugün yeni exact current unread hedef-risk bağlamı oluşmuş

vakalar içindir.

Bu iki write surface birbirine karıştırılmaz.

## Yeni Migration Yok

Kurtarma için yeni tablo veya kolon gerekli değildir.

Kullanılan mevcut kaynaklar:

- takip planı health resolver,
- exact current unread resolver,
- mutabakat vaka tablosu,
- append-only vaka geçmişi.

Migration zinciri bu nedenle `090` kalır.

## Testler

Yeni testler:

- `tests/reconciliation-target-risk-followup-recovery-204.cjs`
- `tests/reconciliation-target-risk-followup-recovery-db-204.php`

MariaDB testi şunları doğrular:

1. owner değişmiş stale planın current unread varsa aday olmasını,
2. reopen döngüsü değişmiş stale planın aday olmasını,
3. sinyal değişmiş stale planın aday olmasını,
4. notification değişmiş stale planın aday olmasını,
5. plan bildirimi bulunamayan ancak current unread bağlamı bulunan kaydın aday olmasını,
6. okundu durumunun allowlist dışında kalmasını,
7. risk çözüldü durumunun allowlist dışında kalmasını,
8. vaka kapandı durumunun allowlist dışında kalmasını,
9. stale olsa bile current unread kaydı olmayan vakanın kurtarılamamasını,
10. owner filtresinin current owner üzerinden çalışmasını,
11. signal filtresinin eski plan sinyali yerine current sinyali kullanmasını,
12. arama filtresini,
13. eski plan alıcısı ile current owner farkının korunmasını,
14. eski plan sinyali ile current sinyal farkının korunmasını,
15. exact current notification id'nin çözülmesini,
16. beş stale vakanın tek işlemde yeni current planla kurtarılmasını,
17. farklı current owner'ların korunmasını,
18. yeni aksiyon tarihinin yazılmasını,
19. her kurtarma için append-only `toplu_takip_planlama` history oluşmasını,
20. okundu/non-stale seçimin POST'ta reddedilmesini,
21. POST senkronizasyonunda exact current unread bağlamı düşen vakanın fail-closed reddedilmesini,
22. başarısız kurtarmada yeni history yazılmamasını,
23. 51 vaka hard-cap reddini,
24. geçmiş tarih reddini,
25. normal yöneticinin resolver erişiminin fail-closed boş dönmesini.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin,
- ayrı write surface,
- CSRF,
- kapalı POST action whitelist,
- stale health allowlist,
- exact current unread allowlist,
- POST öncesi vaka senkronizasyonu,
- 50 vaka hard-cap,
- row lock kullanan owner-preserving motor,
- active current owner doğrulaması,
- owner değiştirmeyen update,
- append-only planning history,
- notification state'e dokunmama,
- stale browser context fail-closed

ile çalışır.
