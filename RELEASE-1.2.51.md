# İlkAdım 1.2.51

## Ticari Yönetici Bildirimleri ve Tahsilat Hatırlatma Merkezi

Bu sürüm 1.2.50 Tahsilat Risk Merkezi'ni kurum yöneticilerine giden kontrollü, deduplikasyonlu tahsilat hatırlatmalarıyla tamamlar.

Yeni migration:

`083_ticari_tahsilat_hatirlatmalari.sql`

Migration zinciri:

`083`

olur.

## Amaç

Tahsilat Risk Merkezi Süper Admin'e:

- yaklaşan vade,
- gecikme yaşlandırması,
- açık bakiye,
- yenileme kaynaklı ödeme gecikmesi

gösteriyordu.

1.2.51 bu risk bilgisini kurum yöneticisine kontrollü sistem bildirimi olarak ulaştırır.

## Gönderim Otomatik Arka Plan Görevi Değildir

Sunucuda cron/scheduler varsayılmadığı için hatırlatmalar arka planda kendiliğinden gönderiliyor gibi gösterilmez.

Süper Admin Tahsilat Risk Merkezi'ndeki:

`Yönetici Hatırlatmalarını Senkronize Et`

işlemini çalıştırır.

İşlem:

- CSRF korumalıdır,
- önce risk kuyruğunu günceller,
- sonra yalnız gönderilmesi gereken eksik eşikleri hesaplar.

Sayfayı GET ile açmak bildirim göndermez.

## Hatırlatma Eşikleri

Tahsilat vadesi ve bugünün tarihi karşılaştırılarak şu eşikler kullanılır:

- `vade_7` → vadesine 1–7 gün kalan,
- `vade_0` → vade günü ve ilk 6 gün gecikme,
- `gecikme_7` → 7–14 gün gecikme,
- `gecikme_15` → 15–29 gün gecikme,
- `gecikme_30` → 30+ gün gecikme.

Vadesine 8 gün veya daha fazla kalan sözleşmeye bildirim gönderilmez.

Vade tarihi olmayan sözleşme risk kuyruğunda görünür ancak tarih eşiği hesaplanamadığı için otomatik tahsilat hatırlatması gönderilmez.

## Geç Çalıştırma Davranışı

Hatırlatma senkronizasyonu uzun süre çalıştırılmamışsa geçmiş tüm eşikler tek seferde gönderilmez.

Örneğin sözleşme bugün 20 gün gecikmişse sistem:

`gecikme_15`

eşiğini gönderir.

Aynı anda:

- vade günü,
- 7 gün

bildirimlerini geriye dönük topluca göndermez.

Bu davranış yöneticinin tek seferde bildirim yağmuruna tutulmasını engeller.

## Dedup Anahtarı

Her gönderim:

`sozlesme_id + vade_tarihi + esik_kodu`

ile tekildir.

Aynı:

- sözleşme,
- vade dönemi,
- eşik

ikinci kez gönderilemez.

DB seviyesinde unique key:

`uk_tahsilat_hatirlatma`

kullanılır.

Uygulama tarafında da önce geçmiş kontrol edilir.

Eşzamanlı iki senkronizasyon ihtimaline karşı kayıt:

`INSERT IGNORE`

ile oluşturulur ve yalnız gerçekten ekleyen süreç bildirimi üretir.

## Vade Tarihi Değişirse

Vade tarihi değiştirildiğinde yeni tarih ayrı ticari dönem olarak değerlendirilir.

Eski gönderim geçmişi silinmez.

Yeni:

`sozlesme_id + yeni_vade_tarihi + esik`

kombinasyonu gerektiğinde yeni bildirim üretebilir.

## Alıcılar

Tahsilat hatırlatmaları yalnız:

`yonetici`

kurum rolündeki aktif kullanıcılara gider.

Kontrol:

- kurum aynı olmalı,
- kurum üyeliği aktif olmalı,
- kullanıcı hesabı aktif olmalı,
- kurum rolü `yonetici` olmalı.

Kurumda iki aktif yönetici varsa ikisi de aynı sistem bildiriminin recipient snapshot'ına eklenir.

Pasif yönetici alıcı olmaz.

## Manuel Duyuru Formu Değişmedi

Manuel duyuru hedefleri hâlâ:

- Öğretmen
- Veli
- Öğrenci

ile sınırlıdır.

`yonetici`

yalnız internal/system notification tarafında desteklenir.

Bu nedenle 1.2.51 manuel duyuru davranışını genişletmez.

## Merkezi Bildirim Sistemi

Tahsilat hatırlatmaları yeni ayrı inbox sistemi oluşturmaz.

Mevcut:

- `kurum_duyurulari`
- `kurum_duyuru_alicilari`

altyapısını kullanır.

Bildirim:

- tür: `sistem`
- hedef: `yonetici`
- kaynak türü: `tahsilat_hatirlatma`

olarak oluşturulur.

Bağlantı:

`bildirimler.php`

sayfasına gider.

Kurum yöneticisi Süper Admin'e özel Tahsilat Risk Merkezi'ne yönlendirilmez.

## Bildirim İçeriği

Hatırlatma kurum yöneticisine:

- kurum adı,
- sözleşme numarası,
- vade tarihi,
- açık tutar,
- para birimi,
- varsa gecikme günü

bilgisini verir.

İçerik ödeme kaydı oluşturmaz ve tahsilatı tamamlanmış kabul etmez.

## Önem Seviyesi

Eşikler merkezi bildirim önem seviyesine şöyle bağlanır:

- vade yaklaşıyor → normal
- vade günü / ilk gecikme → önemli
- 7+ gün → önemli
- 15+ gün → acil
- 30+ gün → acil

Bu önem seviyesi operasyonel bildirim sunumu içindir.

## Finansal Gerçek Tekrar Doğrulanır

Gönderimden hemen önce sözleşme satırı:

`FOR UPDATE`

ile kilitlenir.

Ardından güncel:

- sözleşme durumu,
- tahsil edilen,
- açık bakiye,
- vade tarihi

yeniden okunur.

Sözleşme:

- tamamen tahsil edilmişse,
- artık aktif değilse,
- risk penceresinden çıkmışsa

eski ekran/listedeki veriye güvenilerek bildirim gönderilmez.

## Gönderim Geçmişi

Yeni tablo:

`ticari_tahsilat_hatirlatmalari`

gönderim geçmişini saklar.

Alanlar:

- id
- sozlesme_id
- kurum_id
- vade_tarihi
- esik_kodu
- acik_tutar
- para_birimi
- duyuru_id
- alici_sayisi
- gonderen_kullanici_id
- olusturulma_tarihi

## Tarihsel Snapshot

`acik_tutar` ve `para_birimi` burada güncel finans bakiyesi kaynağı değildir.

Bunlar yalnız:

`bildirim gönderildiği anda yöneticinin gördüğü finansal snapshot`

olarak saklanır.

Sonradan ödeme yapılınca eski hatırlatma tutarı değiştirilmez.

Güncel finansal gerçek yine:

- `kurum_sozlesmeleri`
- `kurum_tahsilatlari`

tablolarından okunur.

## Recipient Snapshot

`alici_sayisi`

gönderim anındaki aktif kurum yöneticisi sayısını saklar.

Gerçek kullanıcı recipient kayıtları ayrıca mevcut:

`kurum_duyuru_alicilari`

tablosunda tutulur.

## Risk Geçmişi Entegrasyonu

Başarılı hatırlatma sonrası 1.2.50:

`ticari_tahsilat_takip_gecmisi`

tablosuna append-only:

- tür: `bildirim`
- kod: ilgili eşik kodu

kaydı eklenir.

Böylece sözleşmenin operasyon geçmişinde:

- görüşmeler,
- ödeme sözü,
- risk kapanma/açılma,
- yönetici hatırlatmaları

aynı kronolojide görülebilir.

## Tahsilat Risk Merkezi UI

Yeni alanlar:

### Yönetici Hatırlatmalarını Senkronize Et

Sadece POST + CSRF ile çalışır.

### Gönderim Geçmişi & Eşikler

Toplam gönderimler:

- ≤7 gün vade
- vade / ilk gecikme
- 7+ gün
- 15+ gün
- 30+ gün

bazında sayılır.

### Son Gönderimler

Kurum, sözleşme, eşik, vade, açık tutar, para birimi ve alıcı sayısı görünür.

### Sözleşme Detayı

Seçili sözleşmede ayrı:

`Yönetici Hatırlatma Geçmişi`

gösterilir.

Eski gönderimler güncel bakiye değişse de geçmiş snapshot olarak korunur.

## Yöneticisi Olmayan Kurum

Aktif kurum yöneticisi bulunmuyorsa:

- sahte gönderim geçmişi yazılmaz,
- merkezi bildirim oluşturulmaz,
- sonuçta `Yöneticisi olmayan kurum` sayacı artar.

## Hata İzolasyonu

Bir sözleşmenin hatırlatma işlemi beklenmeyen nedenle başarısız olursa o işlem transaction ile rollback edilir.

Diğer uygun sözleşmelerin gönderimi devam eder.

Sonuç:

- gönderilen,
- atlanan,
- yöneticisi olmayan,
- hata

sayıları ayrı raporlanır.

## Fiziksel Silme Yok

Tahsilat hatırlatma gönderim geçmişi uygulama akışında fiziksel olarak silinmez.

Bu sayede hangi eşikte ne zaman ve kaç yöneticiye hatırlatma gönderildiği korunur.

## Testler

Yeni testler:

- `tests/collection-reminders-176.cjs`
- `tests/collection-reminders-db-176.php`

MariaDB testi şunları doğrular:

1. 8+ gün önceki yaklaşan vadenin bildirim üretmemesini,
2. 7 günlük yaklaşan vade eşiğini,
3. vade günü eşiğini,
4. ilk 6 gün gecikme davranışını,
5. 7+ gün eşiğini,
6. 15+ gün eşiğini,
7. 30+ gün eşiğini,
8. açık risk kuyruğunun önce senkronize edilmesini,
9. tam tahsil edilmiş sözleşmenin risk/bildirim dışında kalmasını,
10. yalnız aktif yöneticilerin alıcı olmasını,
11. iki yöneticili kurumda iki recipient oluşmasını,
12. yöneticisi olmayan kurumda sahte gönderim geçmişi oluşmamasını,
13. aynı sözleşme/vade/eşik bildiriminin ikinci kez gönderilmemesini,
14. merkezi duyurunun ikinci kez oluşmamasını,
15. gönderim anındaki açık tutar snapshot'ını,
16. sonradan kısmi ödeme yapılınca eski snapshot'ın değişmemesini,
17. aynı eşikte ödeme değişiminin yeni bildirim üretmemesini,
18. vade tarihi değişince yeni dönemin ayrı hatırlatma oluşturabilmesini,
19. eşik bazlı gönderim özetini,
20. sözleşme bazlı reminder history'nin eski ve yeni dönemi korumasını,
21. manuel duyuru rollerinin yönetici ile genişlememesini,
22. sistem notification rolünün yönetici desteğini korumasını.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin gönderim işlemi,
- CSRF,
- güncel finansal gerçeği yeniden doğrulama,
- sözleşme row lock,
- DB unique dedup,
- concurrent INSERT IGNORE guard,
- aktif yönetici recipient snapshot,
- transaction rollback,
- append-only geçmiş

ile çalışır.
