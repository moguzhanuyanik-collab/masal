# İlkAdım 1.2.63

## Mutabakat Aksiyon Hatırlatmaları

Bu sürüm 1.2.62 Mutabakat Günlük İş Kutusu'ndaki bugün ve gecikmiş aksiyonları sorumlu Süper Admin'e kontrollü sistem bildirimi olarak ulaştırır.

Yeni migration:

`087_mutabakat_aksiyon_hatirlatmalari.sql`

Migration zinciri:

`087`

olur.

## Yeni Merkez

Yeni sayfa:

`ticari-mutabakat-hatirlatma.php`

Yeni domain:

`src/ticari_mutabakat_hatirlatma.php`

Yeni stil:

`ticari-mutabakat-hatirlatma.css`

## Günlük İş Kutusu Salt Okunur Kalmaya Devam Eder

1.2.62:

`ticari-mutabakat-is-kutusu.php`

sayfasına POST/gönderim davranışı eklenmemiştir.

İş kutusu hâlâ:

- vaka değiştirmez,
- sorumlu değiştirmez,
- tarih değiştirmez,
- bildirim göndermez.

Bildirim üretimi ayrı Hatırlatma Merkezi'nde yapılır.

## Açık Vaka Kapsamı

Hatırlatma adayı olabilmek için vaka:

- Açık,
- İncelemede,
- Dış Aksiyon Bekleniyor

aşamalarından birinde olmalıdır.

Kapalı vakalar bildirim adayı değildir.

## Sorumlu Zorunluluğu

Vakanın:

`sorumlu_kullanici_id`

alanı dolu olmalıdır.

Sahipsiz vaka otomatik olarak herhangi bir kişiye bildirilmez.

Toplu veya vaka bazlı atama önce mevcut planlama/aksiyon modüllerinde yapılır.

## Aktif Süper Admin Doğrulaması

Bildirim alıcısı:

- aktif kullanıcı olmalı,
- primary `ana_rol=super_admin`,
- veya `kullanici_rolleri` tablosunda ikincil `super_admin` rolüne sahip olmalıdır.

Normal yönetici:

`super_admin`

rolü yoksa hatırlatma alıcısı olamaz.

Pasif Süper Admin de alıcı olmaz.

## Sistem Bildirim Rolü

Merkezi Bildirimler altyapısının internal/system alıcı listesine:

`super_admin`

eklenmiştir.

Manuel duyuru formunun hedefleri değişmemiştir.

Manuel hedef listesi hâlâ:

- Öğretmen
- Veli
- Öğrenci

olarak kalır.

`yonetici` ve `super_admin` yalnız sistem kaynaklı bildirimlerde kullanılabilir.

## Bildirim Eşikleri

Yalnız:

- bugün aksiyon bekleyen,
- gecikmiş

vakalar bildirilir.

Gelecek tarihli aksiyonlara bildirim gönderilmez.

Eşikler:

- `bugun`
- `gecikme_1` → 1–2 gün gecikme
- `gecikme_3` → 3–6 gün
- `gecikme_7` → 7–13 gün
- `gecikme_14` → 14–29 gün
- `gecikme_30` → 30+ gün

olarak uygulanır.

## Bildirim Yağmuru Yok

Senkronizasyon uzun süre çalıştırılmamışsa geçmiş tüm eşikler birden gönderilmez.

Örneğin vaka 20 gün gecikmişse yalnız:

`gecikme_14`

eşiği değerlendirilir.

1, 3 ve 7 günlük eski eşikler topluca gönderilmez.

## Dedup Anahtarı

Gönderim geçmişi şu dört alanla tekildir:

`vaka_id + aksiyon_tarihi + esik_kodu + alici_kullanici_id`

Bu tasarım sayesinde:

- aynı kişiye aynı eşik tekrar gönderilmez,
- aksiyon tarihi değişirse yeni plan dönemi bildirim alabilir,
- sorumlu değişirse yeni sorumlu kendi bildirimi alabilir,
- eski sorumlunun geçmiş kaydı silinmez.

## Concurrent Dedup

Gönderimden önce kayıt:

`SELECT ... FOR UPDATE`

ile kontrol edilir.

Ardından:

`INSERT IGNORE`

kullanılır.

Eşzamanlı iki senkronizasyon çalışırsa yalnız gerçekten reminder satırını ekleyen işlem merkezi bildirimi oluşturur.

## Kaynak Sorun Yeniden Doğrulaması

Vaka ekranda açık görünse bile kaynak sorun daha önce çözülmüş olabilir.

Bildirimden hemen önce:

`ma_case_source_still_open()`

ile kaynak sorun yeniden doğrulanır.

Kaynak artık çözülmüşse:

- reminder history yazılmaz,
- merkezi bildirim oluşturulmaz,
- vaka manuel olarak kapatılmaz.

Vaka kapanışı mevcut Aksiyon Merkezi senkronizasyonunun sorumluluğunda kalır.

## Kurum Bağlamı

Mevcut merkezi bildirim şeması kurum bağlamı gerektirir.

Bu nedenle:

`kurum_id`

bulunmayan mutabakat vakası için sahte bildirim üretilmez.

Hatırlatma Merkezi bu vakaları:

`Kurumsuz vaka`

olarak sayar.

## Bildirim İçeriği

Bildirim:

- kurum adı,
- sözleşme numarası,
- aksiyon tarihi,
- gecikme günü,
- sorun türü,
- kısa son teşhis

bilgisini taşır.

Uzun teşhis metni bildirim içinde sınırlandırılır.

## Deep Link

Bildirim doğrudan:

`ticari-mutabakat-aksiyon.php?vaka_id=ID`

adresine gider.

Sorumlu Süper Admin bildirime tıklayıp doğrudan ilgili vaka detayını açabilir.

## Append-only Vaka Geçmişi

Başarılı bildirim sonrası:

`ticari_mutabakat_vaka_gecmisi`

tablosuna:

- tür: `bildirim`
- kod: `hatirlatma_<esik>`

olayı eklenir.

Bu sayede vaka kronolojisinde:

- planlama,
- müdahale,
- aşama,
- not,
- hatırlatma

aynı append-only geçmişte görülebilir.

## Yeni Reminder Geçmişi

Yeni tablo:

`ticari_mutabakat_aksiyon_hatirlatmalari`

alanları:

- id
- vaka_id
- kurum_id
- alici_kullanici_id
- aksiyon_tarihi
- esik_kodu
- duyuru_id
- gonderen_kullanici_id
- olusturulma_tarihi

Uygulama akışında fiziksel silme yapılmaz.

## Hatırlatma Merkezi

Dashboard şu alanları gösterir:

- gönderim bekleyen güncel eşik,
- mevcut eşiği daha önce gönderilmiş vakalar,
- geçersiz/pasif sorumlu sayısı,
- kurumsuz vaka sayısı,
- toplam reminder geçmişi,
- eşik dağılımı,
- güncel bugün/gecikmiş vaka listesi,
- son gönderim geçmişi.

## Explicit Sync

Gönderim yalnız:

`Aksiyon Hatırlatmalarını Senkronize Et`

POST işlemiyle yapılır.

İşlem:

- yalnız Süper Admin,
- CSRF korumalıdır.

GET ile sayfa açmak notification üretmez.

## Hata İzolasyonu

Bir vakanın reminder işlemi beklenmeyen nedenle başarısız olursa o vakanın transaction'ı rollback edilir.

Diğer uygun vakalar değerlendirilmeye devam eder.

Sonuç ayrı sayaçlarla raporlanır:

- gönderilen,
- atlanan,
- geçersiz sorumlu,
- kurumsuz vaka,
- kaynak çözülmüş,
- hata.

## Navigasyon

Hatırlatma Merkezi bağlantısı:

- Süper Admin ana menüsüne,
- Mutabakat Günlük İş Kutusu'na,
- Mutabakat Aksiyon Merkezi'ne,
- Mutabakat Aksiyon Sağlığı'na,
- Mutabakat Toplu Planlama'ya,
- Ticari Yönetim Dashboardu'na

eklenmiştir.

## Testler

Yeni testler:

- `tests/reconciliation-reminders-188.cjs`
- `tests/reconciliation-reminders-db-188.php`

MariaDB testi şunları doğrular:

1. gelecek aksiyon tarihinin bildirim üretmemesini,
2. bugün eşiğini,
3. 1+ gün eşiğini,
4. 3+ gün eşiğini,
5. 7+ gün eşiğini,
6. 14+ gün eşiğini,
7. 30+ gün eşiğini,
8. yalnız açık aşamaların aday olmasını,
9. tarihsiz vakaların aday olmamasını,
10. sahipsiz vakaların aday olmamasını,
11. primary Süper Admin alıcısını,
12. ikincil Süper Admin rolü alıcısını,
13. normal yöneticinin reddedilmesini,
14. pasif Süper Admin'in reddedilmesini,
15. kurumsuz vakanın bildirim oluşturmamasını,
16. kaynak sorunu çözülmüş stale vakanın bildirim oluşturmamasını,
17. ilk senkronizasyonda doğru reminder sayısını,
18. merkezi bildirim recipient rolünün `super_admin` olmasını,
19. vaka geçmişine reminder olayının eklenmesini,
20. aynı eşikte ikinci senkronizasyonun duplicate üretmemesini,
21. sorumlu değişince yeni sorumlunun kendi bildirimini almasını,
22. eski sorumlunun reminder geçmişinin korunmasını,
23. aksiyon tarihi değişince yeni reminder döngüsünün açılmasını,
24. vaka kapanınca eski reminder geçmişinin silinmemesini,
25. eşik özetlerini,
26. bildirimin vaka detayına deep-link vermesini,
27. manuel duyuru rol listesinin Süper Admin ile genişlememesini.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin,
- CSRF,
- aktif Süper Admin recipient doğrulaması,
- kaynak sorun yeniden doğrulaması,
- vaka row lock,
- DB unique dedup,
- concurrent INSERT IGNORE guard,
- transaction rollback,
- append-only history

ile çalışır.
