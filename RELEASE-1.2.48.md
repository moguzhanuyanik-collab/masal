# İlkAdım 1.2.48

## Lisans Yenileme ve Süre Sonu Operasyon Merkezi

Bu sürüm kurum lisanslarının yaklaşan bitişlerini yalnız listelemek yerine gerçek bir operasyon kuyruğuna dönüştürür.

Yeni migration:

`080_lisans_yenileme_operasyon_merkezi.sql`

Migration zinciri bu sürümle:

`080`

olur.

## Yeni Yenileme Merkezi

Yeni Süper Admin sayfası:

`lisans-yenilemeleri.php`

Merkez:

- 30 gün içinde bitecek lisansları,
- süresi geçmiş ancak henüz sonuçlandırılmamış lisansları,
- takip notlarını,
- sonraki takip tarihini,
- yenileme aşamasını,
- yönetici uyarılarını,
- gerçek lisans uzatma işlemini

tek akışta toplar.

## Yenileme Vakası

Her lisansın her bitiş dönemi ayrı yenileme vakasıdır.

Tekillik:

`lisans_id + hedef_bitis_tarihi`

üzerinden korunur.

Aynı lisans ve aynı bitiş tarihi için ikinci bir yenileme vakası açılamaz.

Kuyruk senkronizasyonu idempotent çalışır.

## 30 / 15 / 7 / 1 Gün Radarları

Açık yenileme vakaları şu gruplarda izlenir:

- 16–30 gün
- 8–15 gün
- 2–7 gün
- 0–1 gün
- Süresi Geçti

Ayrıca:

- Açık Vaka
- Yenilendi
- Yenilenmedi
- Takip zamanı gelenler

özet olarak gösterilir.

## Süresi Geçmiş Lisans

Lisansın bitiş tarihi geçmiş olsa bile yenileme vakası otomatik silinmez.

1.2.47 erişim politikası lisans süresi geçtiğinde kurumun operasyonel erişimini kapatır.

Yenileme merkezi ise aynı kaydı:

`Süresi Geçti`

olarak aksiyon kuyruğunda tutmaya devam eder.

## Yenileme Aşamaları

Açık vaka şu aşamalarda tutulabilir:

- Açık
- Temas Edildi
- Teklif / Yenileme Görüşmesi

Kapanış durumları:

- Yenilendi
- Yenilenmedi

Kapanmış vaka yeniden sessizce açık duruma çevrilmez.

## Append-only Yenileme Geçmişi

Yeni tablo:

`kurum_lisans_yenileme_gecmisi`

Şunları append-only saklar:

- vaka açılışı,
- aşama değişikliği,
- takip notu,
- yönetici bildirimi,
- gerçek lisans yenilemesi,
- harici lisans uzatmasının otomatik uzlaştırılması,
- yenilenmeme kararı.

Geçmiş fiziksel olarak silinmez.

## Takip Notları

Süper Admin yenileme vakasına:

- görüşme notu,
- karar verici bilgisi,
- teklif sonucu,
- sonraki adım

ekleyebilir.

Opsiyonel:

`sonraki_takip_tarihi`

tanımlanabilir.

Takip tarihi bugün veya geçmiş olduğunda dashboard bunu bekleyen takip olarak sayar.

## Gerçek Lisans Yenileme

`Lisansı Yenile ve Vakayı Kapat`

işlemi yeni ikinci lisans oluşturmaz.

Mevcut:

`kurum_lisanslari`

satırı güncellenir.

İşlem:

1. yenileme vakasını kilitler,
2. aktif paketi doğrular,
3. mevcut kurum lisansını kilitler,
4. seçilen paketi uygular,
5. yeni bitiş tarihini uygular,
6. lisans durumunu `aktif` yapar,
7. 1.2.46 `kurum_lisans_gecmisi` tablosuna `yenileme` olayı ekler,
8. yenileme vakasını `yenilendi` olarak kapatır,
9. yenileme geçmişine sonuç kaydı ekler.

## Tarih Geri Çekme Koruması

Stale/eski bir yenileme ekranı üzerinden mevcut lisansın daha ileri bitiş tarihi yanlışlıkla geriye çekilemez.

Eğer lisans başka bir işlemle daha ileri tarihe uzatılmışsa eski yenileme vakası daha kısa bir tarih uygulayamaz.

## Harici Yenileme Uzlaştırması

Bir lisans Paket & Lisanslar ekranından veya başka güvenli akıştan uzatılırsa açık yenileme vakası kaybolmaz.

Kuyruk senkronizasyonu:

- güncel bitiş tarihi hedef bitişten ileriyse,
- veya lisans süresiz hale getirilmişse

vakayı otomatik:

`yenilendi`

olarak kapatır ve append-only geçmişe:

`harici_yenileme`

olayı yazar.

## Yenilenmedi

Süper Admin vaka için:

`Yenilenmedi Olarak Kapat`

işlemini kullanabilir.

Neden zorunludur.

Bu işlem:

- yenileme vakasını kapatır,
- nedeni geçmişe yazar,
- mevcut lisansı erken iptal etmez,
- mevcut bitiş tarihini değiştirmez.

Bu nedenle kurum sözleşme süresi bitene kadar normal kullanıma devam eder.

Bitiş tarihi geçince 1.2.47 erişim politikası operasyonel erişimi otomatik kapatır.

## Kurum Yöneticisi Bildirimleri

Merkezde:

`Yönetici Uyarılarını Senkronize Et`

işlemi bulunur.

Uyarılar kurum yöneticilerine şu eşiklerde gönderilir:

- 30 gün
- 15 gün
- 7 gün
- 1 gün
- süre doldu

Aynı yenileme vakası ve aynı eşik ikinci kez gönderilmez.

## Bildirim Dedup

Her bildirim eşiği yenileme geçmişine kodla yazılır:

- `gun_30`
- `gun_15`
- `gun_7`
- `gun_1`
- `gun_0`

Merkezi bildirim tablosunda da yenileme vakası/eşik kombinasyonundan türetilen sistem kaynak anahtarı kullanılır.

Bu nedenle hem yenileme geçmişi hem merkezi duyuru kaynağı seviyesinde dedup vardır.

## Bildirimler Otomatik Arka Plan Görevi Değildir

Sunucuda ayrı scheduler/cron varsayılmadığı için yönetici bildirim gönderimi sessiz arka plan işi olarak gösterilmez.

Süper Admin:

`Yönetici Uyarılarını Senkronize Et`

işlemini çalıştırdığında güncel eşikler hesaplanır ve yalnız eksik uyarılar gönderilir.

Kuyruk ise yenileme merkezi açıldığında idempotent olarak güncellenir.

## Yönetici Sistem Bildirimi Desteği

Merkezi bildirim altyapısına internal/system kullanım için:

`yonetici`

alıcı rolü eklendi.

Manuel duyuru formundaki mevcut:

- Öğrenci
- Veli
- Öğretmen

hedef seçenekleri değiştirilmedi.

Yani bu genişleme yalnız sistem kaynaklı yönetici bildirimlerinin teslimi içindir.

## Bildirim İçeriği

Yaklaşan bitişte yöneticiye:

- kurum adı,
- paket adı,
- bitiş tarihi,
- yaklaşık kalan gün

ile bildirim gider.

Süre dolduğunda ayrı acil bildirim oluşturulur.

Bildirim bağlantısı:

`Destek Merkezi`

üzerinden yenileme/paket desteğine yönlendirir.

## Ticari Finans Ayrımı

Eski Ticari Finans ekranındaki salt:

`30 Günlük Yenileme Radar`

operasyon alanı kaldırıldı.

Ticari Finans artık:

- sözleşme,
- tahsilat,
- vade

işlerine odaklanır.

Yenileme bölümü tek bir bağlantıyla:

`Lisans Yenileme Operasyon Merkezi`

sayfasına yönlendirir.

Eski:

`tf_license_renewal_rows()`

helper'ı geriye uyumluluk için kaldırılmadı.

## Menü Entegrasyonu

Yeni Yenileme Merkezi bağlantısı:

- Süper Admin ana menüsüne,
- Paket & Lisanslar ekranına,
- Ticari Finans ekranına

eklendi.

## Yeni Tablolar

### kurum_lisans_yenilemeleri

Her lisans/bitiş dönemi için operasyon vakasını tutar.

Temel alanlar:

- lisans_id
- kurum_id
- hedef_bitis_tarihi
- durum
- sorumlu_kullanici_id
- son_temas_tarihi
- sonraki_takip_tarihi
- sonuc_paket_id
- sonuc_bitis_tarihi
- kapanma_tarihi

### kurum_lisans_yenileme_gecmisi

Append-only operasyon geçmişidir.

Temel alanlar:

- yenileme_id
- lisans_id
- kurum_id
- kullanici_id
- tur
- kod
- not_metni
- olusturulma_tarihi

## Testler

Yeni testler:

- `tests/license-renewal-173.cjs`
- `tests/license-renewal-db-173.php`

MariaDB testi şunları doğrular:

1. 30 gün içindeki lisansların kuyruğa girmesini,
2. 30 günden uzak ve süresiz lisansların kuyruğa girmemesini,
3. kuyruk senkronizasyonunun idempotent olmasını,
4. 30/15/7/1/süre doldu özetlerini,
5. milestone çözümlemesini,
6. kurum yöneticisi sistem bildirimlerini,
7. aynı eşik bildiriminin ikinci kez gönderilmemesini,
8. yönetici recipient rolünün doğru saklanmasını,
9. takip notunun append-only eklenmesini,
10. ilk notta vakanın `temas` aşamasına geçmesini,
11. sonraki takip tarihini,
12. teklif aşamasını,
13. yenilemenin mevcut lisans satırını uzatmasını,
14. ikinci lisans oluşturmamasını,
15. paket değişikliğini,
16. core lisans geçmişine `yenileme` olayı yazılmasını,
17. yenilenmedi kararının lisansı erken iptal etmemesini,
18. harici lisans uzatmasının otomatik uzlaştırılmasını,
19. stale yenileme vakasının güncel bitiş tarihini geriye çekememesini,
20. yenileme not/geçmişinin korunmasını.

## Güvenlik

Yenileme merkezi:

- yalnız Süper Admin,
- authenticated session,
- CSRF,
- transaction,
- row lock,
- paket doğrulaması,
- tarih doğrulaması,
- append-only geçmiş,
- bildirim dedup

ile çalışır.
