# İlkAdım 1.2.78

## Hedef-Risk Takip Sağlığı Müdahale Merkezi

Bu sürüm 1.2.77 Hedef Risk Takip Planı Sağlığı ekranında görülen current-context müdahale gerektiren takipleri güvenli şekilde yeniden planlanabilir hale getirir.

Yeni migration yoktur.

Migration zinciri:

`090`

olarak kalır.

## Amaç

1.2.77 şunları salt-okunur olarak görünür hale getirdi:

- aksiyon gecikmiş,
- aksiyon bugün,
- aksiyon tarihi yok,
- owner değişti,
- reopen döngüsü değişti,
- hedef-risk sinyali değişti,
- exact current notification değişti,
- bildirim okundu,
- risk çözüldü,
- vaka kapandı.

Ancak sağlık ekranı bilinçli olarak yazma işlemi yapmıyordu.

1.2.78 yalnız current-context'i hâlâ geçerli olan operasyonel takip sorunlarına güvenli müdahale merkezi ekler.

## Yeni Merkez

Yeni sayfa:

`ticari-mutabakat-hedef-risk-takip-mudahale.php`

Yeni domain:

`src/ticari_mutabakat_hedef_risk_takip_mudahale.php`

Yeni stil:

`ticari-mutabakat-hedef-risk-takip-mudahale.css`

## 1.2.77 Sağlık Ekranı Read-only Kaldı

Mevcut:

`ticari-mutabakat-hedef-risk-takip-saglik.php`

sayfasına POST davranışı eklenmemiştir.

Sağlık ekranı hâlâ:

- vaka güncellemez,
- owner değiştirmez,
- aksiyon tarihi yazmaz,
- bildirim state'i değiştirmez,
- notification göndermez.

Müdahale ayrı merkezde yapılır.

## Müdahale Allowlisti

Yalnız şu sağlık durumları seçilebilir:

- `aksiyon_gecikmis`
- `aksiyon_bugun`
- `aksiyon_tarihi_yok`

Bu üç durumun ortak özelliği:

- vaka açık,
- current owner plan anındaki recipient ile aynı,
- reopen döngüsü aynı,
- current hedef-risk sinyali aynı,
- exact current notification aynı,
- notification hâlâ okunmamış.

## Gelecekte Planlı Vaka Müdahale Adayı Değildir

`planli_okunmadi`

durumu current-context açısından sağlıklı ve geleceğe planlanmış kabul edilir.

Bu nedenle sırf bildirim okunmamış diye müdahale merkezine alınmaz.

## Stale Context Müdahale Edilemez

Şu durumlar doğrudan yeniden planlama allowlistine girmez:

- Owner Değişti
- Reopen Döngüsü Değişti
- Hedef-Risk Sinyali Değişti
- Güncel Bildirim Değişti
- Plan Bildirimi Bulunamadı

Bu kayıtlar eski plan bağlamının artık current-case'e uygulanmaması gerektiğini gösterir.

Bu nedenle stale planı yeni owner veya yeni döngüye sessizce taşımak yerine İş Kutusu / vaka detayı üzerinden yeniden değerlendirmek gerekir.

## Owner Değişmez

Müdahale mevcut:

`map_bulk_reschedule_preserve_owners()`

motorunu kullanır.

Bu motor:

- her vakanın güncel owner'ını doğrular,
- owner'ın aktif Süper Admin olduğunu doğrular,
- `sorumlu_kullanici_id` alanına yazmaz,
- yalnız `sonraki_aksiyon_tarihi` ve güncelleyen kullanıcı bilgisini değiştirir.

Farklı owner'lara ait vakalar aynı toplu müdahalede seçilebilir.

Her vaka kendi owner'ında kalır.

## POST Öncesi Çift Allowlist Yeniden Doğrulaması

Müdahale POST'unda önce:

`ma_sync_cases()`

çalışır.

Ardından iki bağımsız allowlist yeniden hesaplanır.

### 1. Sağlık Müdahale Allowlisti

`mrtm_rows()`

ile seçili vaka hâlâ:

- gecikmiş,
- bugün,
- veya aksiyon tarihi yok

current-context sağlık durumunda mı kontrol edilir.

### 2. Exact Current Unread Allowlist

Mevcut:

`mrt_rows()`

resolver'ı yeniden çalıştırılır.

Bu resolver current:

- owner,
- reopen döngüsü,
- exact target-risk signal,
- exact notification id,
- unread state

eşleşmesini doğrular.

Seçili vaka iki allowlistin de içinde değilse işlem fail-closed reddedilir.

## Stale Sayfa Koruması

Kullanıcı seçim yaptıktan sonra aşağıdakilerden biri değişirse POST reddedilir:

- notification okunursa,
- owner değişirse,
- vaka kapanırsa,
- reopen döngüsü değişirse,
- current target-risk sinyali değişirse,
- exact current notification değişirse,
- sağlık durumu artık müdahale gerektirmiyorsa.

Bu nedenle eski browser ekranındaki checkbox state'ine güvenilmez.

## Toplu Müdahale Limiti

Tek işlemde en fazla:

`50`

benzersiz vaka seçilebilir.

UI ayrıca:

`İlk 50 görünür adayı seç`

kontrolü sunar.

## Yeni Aksiyon Tarihi

Yeni sonraki aksiyon tarihi:

- zorunludur,
- geçerli `Y-m-d` olmalıdır,
- geçmiş tarih olamaz.

Bugün veya gelecek tarih kullanılabilir.

## Takip Notu

Takip notu:

- isteğe bağlıdır,
- mevcut planlama motorunun 600 karakter sınırını aynen kullanır.

Müdahale katmanı notun başına otomatik metin ekleyip limiti değiştirmez.

## Append-only Geçmiş

Yeniden planlama mevcut güvenli motoru kullandığı için her vaka için:

- tür: `planlama`
- kod: `toplu_takip_planlama`

append-only geçmiş olayı oluşur.

Bu özellikle önemlidir çünkü 1.2.77 sağlık ekranı güncel sağlık hesabında vaka başına son:

`toplu_takip_planlama`

olayını kullanır.

Böylece müdahale sonrası yeni plan otomatik olarak yeni current health planına dönüşür.

Eski plan geçmişi silinmez.

## Bildirim State'i Değişmez

Müdahale:

- bildirimi okundu yapmaz,
- `okundu_tarihi` yazmaz,
- yeni hedef-risk notification üretmez,
- eski notification geçmişini değiştirmez.

## Vaka Aşaması Değişmez

Müdahale:

- vaka durumunu değiştirmez,
- vakayı kapatmaz,
- owner değiştirmez,
- hedef politikasını değiştirmez,
- target-risk sinyali üretmez.

Yalnız current güvenli vakaya yeni sonraki aksiyon tarihi planlar.

## Filtreler

Yeni merkez:

- 7 / 30 / 90 / 180 / 365 gün,
- müdahale sağlık durumu,
- plan sinyali,
- current owner,
- kurum / sözleşme / owner / plan notu araması

ile filtrelenebilir.

POST aynı filtre bağlamını yeniden kullanarak allowlist hesaplar.

## Navigasyon

Yeni Müdahale Merkezi bağlantısı:

- Süper Admin menüsüne,
- Hedef Risk Takip Planı Sağlığı'na,
- Okunmamış Hedef Risk Takibi'ne,
- Mutabakat Günlük İş Kutusu'na

eklenmiştir.

## Testler

Yeni testler:

- `tests/reconciliation-target-risk-followup-intervention-203.cjs`
- `tests/reconciliation-target-risk-followup-intervention-db-203.php`

MariaDB testi şunları doğrular:

1. yalnız gecikmiş / bugün / tarihsiz sağlık durumlarının allowliste girmesini,
2. gelecekte planlı okunmamış vakanın müdahale dışı kalmasını,
3. owner değişmiş stale planın müdahale dışı kalmasını,
4. müdahale özet sayılarını,
5. owner filtresini,
6. plan sinyali filtresini,
7. arama filtresini,
8. iki farklı current owner'a ait üç vakanın aynı toplu işlemde yeniden planlanmasını,
9. owner 1'in korunmasını,
10. owner 2'nin korunmasını,
11. yeni aksiyon tarihinin yazılmasını,
12. her vaka için append-only `toplu_takip_planlama` geçmişi oluşmasını,
13. stale sağlık state seçiminin reddedilmesini,
14. POST senkronizasyonu sırasında exact current allowlistten düşen seçimin reddedilmesini,
15. stale red sonrası yeni history yazılmamasını,
16. 51 vakalık seçimin hard-cap ile reddedilmesini,
17. geçmiş tarihli aksiyonun mevcut planlama motoru tarafından reddedilmesini,
18. normal yöneticinin resolver erişiminin fail-closed boş dönmesini.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin,
- ayrı write surface,
- CSRF,
- kapalı POST action whitelist,
- current health allowlist,
- exact current unread allowlist,
- POST öncesi vaka senkronizasyonu,
- 50 vaka hard-cap,
- row lock kullanan mevcut planlama motoru,
- aktif current owner doğrulaması,
- owner-preserving update,
- append-only planning history,
- stale context fail-closed

ile çalışır.
