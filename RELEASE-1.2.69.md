# İlkAdım 1.2.69

## Mutabakat Hedef Risk Bildirimleri

Bu sürüm 1.2.68 Mutabakat Hedef Risk & Aksiyon Kuyruğu'ndaki politika bazlı hedef sinyallerini, vaka sorumlusu Süper Admin'e kontrollü sistem bildirimi olarak ulaştırır.

Yeni migration:

`090_mutabakat_hedef_risk_bildirimleri.sql`

Migration zinciri:

`090`

olur.

## Yeni Merkez

Yeni sayfa:

`ticari-mutabakat-hedef-risk-bildirim.php`

Yeni domain:

`src/ticari_mutabakat_hedef_risk_bildirim.php`

Yeni stil:

`ticari-mutabakat-hedef-risk-bildirim.css`

1.2.68 `ticari-mutabakat-hedef-risk.php` salt-okunur kalmaya devam eder. Bildirim gönderimi yalnız yeni merkezdeki açık POST + CSRF işlemiyle yapılır.

## Eskalasyondan Ayrım

1.2.65 Operasyon Eskalasyonu sabit iç operasyon yaş eşiklerini izlemeye devam eder:

- 2+ gün ilk müdahale yok
- 4+ gün açık
- 8+ gün açık
- 14+ gün açık
- 30+ gün açık

1.2.69 bu eşikleri değiştirmez. Bu sürüm yalnız 1.2.67 versioned hedef politikası ve 1.2.68 hedef-risk hesabına göre bildirim üretir.

## Bildirim Üreten Bantlar

Yalnız iki güncel sinyal bildirim üretir:

- `yuzde_75` → `hedef_75`
- `hedef_disinda` → `hedef_disinda`

Şunlar bildirim üretmez:

- Süre %50–74
- Hedef İçinde
- Politika Yok

Politika olmayan vaka için geriye dönük hedef uydurulmaz.

## Geç Çalıştırma / Backfill Yok

Senkronizasyon ilk kez vaka zaten hedef dışında iken çalıştırılırsa yalnız:

`hedef_disinda`

gönderilir.

Eski:

`hedef_75`

sinyali geriye dönük üretilmez.

Buna karşılık aynı açık döngüde daha önce `hedef_75` gönderilmiş ve vaka sonradan hedef dışına çıkmışsa `hedef_disinda` ayrı güncel sinyal olarak bir kez gönderilebilir.

## Tarihsel Politika

Bildirim bugünkü current policy'yi kullanmaz.

Vaka döngüsü başladığında geçerli olan tarihsel politika 1.2.68 ile aynı resolver üzerinden çözülür.

Gönderim geçmişinde:

`hedef_politika_id`

snapshot olarak saklanır.

Yeni politika versiyonu eski açık döngünün değerlendirmesini geriye dönük değiştirmez.

## Reopen Döngüsü

Vaka yeniden açılmışsa yeni döngü başlangıcı son:

`vaka_yeniden_acildi`

olayıdır.

Döngü anahtarı:

`SHA-256(vaka_id | dongu_baslangic_tarihi)`

olarak üretilir.

Yeni reopen döngüsü yeni bildirim çevrimi açabilir; eski döngü geçmişi silinmez.

## Dedup Anahtarı

Yeni tablo unique olarak:

`vaka_id + dongu_anahtari + hedef_politika_id + esik_kodu + alici_kullanici_id`

bileşimini korur.

Aynı vaka/döngü/politika/sinyal/alıcı ikinci kez gönderilemez.

## Sorumlu Değişimi

Aynı döngü ve sinyalde sorumlu değişirse yeni geçerli Süper Admin kendi alıcı kimliğiyle güncel sinyali bir kez alabilir.

Eski sorumlunun bildirim geçmişi korunur.

## Alıcı Doğrulaması

Bildirim alıcısı:

- aktif kullanıcı,
- Süper Admin rolüne sahip

olmalıdır.

Sahipsiz, pasif veya Süper Admin olmayan sorumluya bildirim gönderilmez.

Bu vakalar mevcut Mutabakat Sorumlu Devir Merkezi'nden düzeltilir.

## Kurum Bağlamı

`kurum_id` olmayan vakaya sahte merkezi bildirim oluşturulmaz.

Bildirim Merkezi bunu ayrı sayaçta gösterir.

## Gönderim Öncesi Yeniden Doğrulama

Gönderimden hemen önce:

1. vaka `SELECT ... FOR UPDATE` ile kilitlenir,
2. açık aşama doğrulanır,
3. kurum ve sorumlu değişmemiş olmalıdır,
4. kaynak sorun `ma_case_source_still_open()` ile yeniden kontrol edilir,
5. hedef-risk durumu yeniden hesaplanır.

Stale aday verisiyle bildirim gönderilmez.

## Concurrent Dedup

Gönderim geçmişi row-lock altında kontrol edilir.

Ardından:

`INSERT IGNORE`

kullanılır.

Eşzamanlı iki senkronizasyonda yalnız geçmiş satırını gerçekten ekleyen işlem merkezi bildirimi oluşturur.

## Merkezi Bildirim Entegrasyonu

Bildirim:

- tür: `sistem`
- hedef rol: `super_admin`
- kaynak: `mutabakat_hedef_risk_bildirim`

olarak mevcut merkezi Bildirimler altyapısına yazılır.

Deep link:

`ticari-mutabakat-aksiyon.php?vaka_id=ID`

adresine gider.

Manuel duyuru hedef rolleri değişmez; manuel form hâlâ yalnız Öğretmen, Veli ve Öğrenci hedeflerini kullanır.

## Append-only Vaka Geçmişi

Başarılı gönderimde mevcut:

`ticari_mutabakat_vaka_gecmisi`

tablosuna:

- tür: `bildirim`
- kod: `hedef_risk_hedef_75`
- veya `hedef_risk_hedef_disinda`

append-only olay eklenir.

Vaka state'i, sorumlu, aksiyon tarihi veya hedef politikası değiştirilmez.

## Yeni Bildirim Geçmişi

Yeni tablo:

`ticari_mutabakat_hedef_risk_bildirimleri`

alanları:

- id
- vaka_id
- kurum_id
- hedef_politika_id
- alici_kullanici_id
- dongu_anahtari
- esik_kodu
- risk_kodu
- kullanim_orani
- duyuru_id
- gonderen_kullanici_id
- olusturulma_tarihi

`kullanim_orani` gönderim anındaki tarihsel risk snapshot'ıdır. Sonraki zaman ilerlemesi eski kaydı değiştirmez.

## GET Yan Etkisiz

Bildirim Merkezi sayfasını GET ile açmak:

- bildirim göndermez,
- vaka değiştirmez,
- politika değiştirmez,
- eskalasyon oluşturmaz.

Gönderim yalnız:

`Hedef Risk Bildirimlerini Senkronize Et`

POST işlemiyle yapılır.

## Navigasyon

Yeni merkez bağlantısı:

- Süper Admin ana menüsüne,
- Hedef Risk Kuyruğu'na,
- Operasyon Hedefleri ekranına

eklenmiştir.

## Testler

Yeni testler:

- `tests/reconciliation-target-risk-notifications-194.cjs`
- `tests/reconciliation-target-risk-notifications-db-194.php`

MariaDB testi şunları doğrular:

1. hedef dışı sinyalini,
2. %75+ sinyalini,
3. %50–74 bandının bildirim üretmemesini,
4. politika olmayan vakanın bildirim üretmemesini,
5. hedef dışı ilk senkronizasyonda eski %75 sinyalinin backfill edilmemesini,
6. %75 sonrasında hedef dışı sinyalinin ayrı gönderilebilmesini,
7. aynı sinyalin ikinci kez gönderilmemesini,
8. sahipsiz sorumlunun reddedilmesini,
9. normal yöneticinin alıcı olamamasını,
10. kurumsuz vakanın bildirim üretmemesini,
11. stale/kaynak çözülmüş vakanın bildirim üretmemesini,
12. merkezi bildirim recipient rolünün `super_admin` olmasını,
13. vaka geçmişine append-only hedef-risk bildirim olayını,
14. sorumlu değişince yeni sorumlunun güncel sinyali bir kez almasını,
15. eski sorumlunun geçmişinin korunmasını,
16. reopen döngüsünün yeni dedup anahtarı oluşturmasını,
17. aynı vaka yeni döngüde yeni bildirime izin verilmesini,
18. manuel duyuru rollerinin değişmemesini,
19. sistem notification rollerinde Süper Admin desteğinin korunmasını.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin,
- CSRF,
- açık vaka row lock,
- kaynak sorun yeniden doğrulaması,
- tarihsel politika resolver,
- reopen-aware döngü anahtarı,
- aktif Süper Admin recipient doğrulaması,
- DB unique dedup,
- `INSERT IGNORE` concurrent guard,
- transaction rollback,
- append-only history

ile çalışır.
