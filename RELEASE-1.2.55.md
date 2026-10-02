# İlkAdım 1.2.55

## Sözleşme Taksit / Ödeme Planı ve Çoklu Vade Yönetimi

Bu sürüm Ticari Finans sözleşmelerine sürümlü taksit/ödeme planı ekler.

Yeni migration:

`084_sozlesme_taksit_odeme_plani.sql`

Migration zinciri:

`084`

olur.

## Temel İlke

Taksit planı yeni bir finansal borç oluşturmaz.

Finansal gerçek hâlâ:

- `kurum_sozlesmeleri.toplam_tutar`
- aktif `kurum_tahsilatlari`

üzerindedir.

Taksit planı yalnız mevcut sözleşme borcunu birden fazla vade dilimine böler.

## Geriye Uyumluluk

Ödeme planı olmayan eski sözleşmeler:

- mevcut tek `vade_tarihi`,
- mevcut Tahsilat Risk Merkezi,
- mevcut yönetici tahsilat hatırlatmaları

ile aynı şekilde çalışmaya devam eder.

Aktif taksit planı varsa risk ve reminder vadesi ilk ödenmemiş taksit üzerinden çözülür.

## Yeni Tablolar

### kurum_sozlesme_taksit_planlari

Bir sözleşmenin güncel plan başlığını tutar.

Alanlar:

- sozlesme_id
- kurum_id
- durum
- aktif_surum
- oluşturma/güncelleme kullanıcıları
- timestamp alanları

Bir sözleşmede tek plan başlığı vardır.

### kurum_sozlesme_taksitleri

Taksit satırlarını sürüm bazında tutar.

Alanlar:

- id
- sozlesme_id
- kurum_id
- surum_no
- sira_no
- vade_tarihi
- tutar
- aciklama
- olusturan_kullanici_id
- olusturulma_tarihi

Tekillik:

`sozlesme_id + surum_no + sira_no`

ile korunur.

### kurum_sozlesme_taksit_gecmisi

Append-only plan operasyon geçmişidir.

Şunları tutar:

- yeni plan sürümü,
- plan aktivasyonu,
- plan pasifleştirme.

## Plan Sürümleme

Plan düzenlemesi eski satırları silmez.

Her yeni kayıt:

`aktif_surum + 1`

ile yeni sürüm oluşturur.

Önceki taksit satırları audit için korunur.

Yeni sürüm kaydedilince plan:

`taslak`

durumuna döner.

Süper Admin doğruladıktan sonra tekrar:

`aktif`

hale getirir.

## Plan Kuralları

Bir taksit planında:

- en az 2 taksit,
- en fazla 24 taksit,
- sıfırdan büyük taksit tutarı,
- sözleşme başlangıcından önce olmayan vade,
- birbirinden farklı ve artan vade tarihleri

zorunludur.

Taksit toplamı:

`sözleşme toplam tutarı`

ile kuruş seviyesinde eşit olmalıdır.

## Tahsilat Başladıktan Sonra Plan Kilidi

Sözleşmede herhangi bir tahsilat geçmişi oluştuğunda:

- yeni plan sürümü oluşturulamaz,
- mevcut plan yapısal olarak değiştirilemez.

Bu kural iptal edilmiş eski tahsilat geçmişini de kapsar.

Amaç geçmiş ödeme anlamını sonradan plan değiştirerek bozmamaktır.

## Plan Pasifleştirme

Aktif tahsilat varsa plan pasif hale getirilemez.

Tüm aktif tahsilatlar iptal edilmişse:

- plan pasif hale getirilebilir,
- plan sürümleri silinmez,
- append-only geçmiş korunur.

Böylece sözleşme gerekiyorsa daha sonra güvenli şekilde iptal edilebilir.

## Aktif Plan ve Sözleşme Drift Koruması

Aktif taksit planı olan sözleşmede şu alanlar değiştirilemez:

- kurum,
- para birimi,
- toplam sözleşme tutarı.

Ayrıca sözleşme:

- taslak,
- iptal

durumuna doğrudan alınamaz.

Önce taksit planı pasif hale getirilmelidir.

Bu koruma plan ile ana sözleşme arasında finansal drift oluşmasını engeller.

## FIFO Tahsilat Dağılımı

Mevcut tahsilatlar ayrı taksit kayıtlarına fiziksel olarak yazılmaz.

Aktif tahsilat toplamı taksitlere:

1. en eski taksit,
2. sonraki taksit,
3. sonraki taksit

sırasıyla FIFO uygulanır.

Her taksit için hesaplanan durum:

- odendi
- kismi
- gecikmis
- gecikmis_kismi
- bugun
- bekliyor

olarak gösterilir.

Bu dağılım türetilmiş görünüm olduğu için ödeme iptal edildiğinde plan durumu otomatik yeniden hesaplanır.

## Sonraki Vade

Aktif plan için:

`sonraki_vade`

FIFO sonrası ilk açık taksitin vadesidir.

İlk taksit tamamen tahsil edilince sonraki taksitin vadesine ilerler.

## Gecikmiş Taksit Tutarı

Bugünden önce vadesi gelmiş ve hâlâ açık olan taksitlerin kalan toplamı:

`gecikmis_tutar`

olarak gösterilir.

Kısmi ödenmiş gecikmiş taksit yalnız kalan kısmıyla hesaplanır.

## Ticari Finans Arayüzü

Sözleşme düzenleme ekranına:

`Taksit & Çoklu Vade`

bölümü eklendi.

Bu bölümde:

- plan sürümü,
- plan durumu,
- kalan plan,
- sonraki vade,
- gecikmiş taksit tutarı,
- tahsil edilen,
- taksit satırları,
- FIFO tahsis,
- plan geçmişi

görülebilir.

Plan satırları dinamik olarak eklenip kaldırılabilir.

Maksimum 24 satırdır.

## Ticari Portföy Listesi

Aktif taksit planı bulunan sözleşme satırı:

- taksit sayısını,
- sonraki taksit vadesini,
- gecikmiş taksit varsa uyarıyı

gösterir.

Plan yoksa eski tek vade gösterimi devam eder.

## Tahsilat Risk Merkezi Entegrasyonu

Aktif plan varsa:

`tr_contract_financial_state()`

sözleşme ana vadesi yerine ilk ödenmemiş taksit vadesini kullanır.

Risk aday sorgusu da aktif plan içindeki yaklaşan/geçmiş taksitleri dikkate alır.

Bu nedenle ana sözleşme vadesi ileride olsa bile ilk taksit gecikmişse risk vakası açılabilir.

Risk ekranında:

- Taksit planı,
- Sonraki Taksit Vadesi,
- Gecikmiş taksit tutarı

açıkça gösterilir.

## Yönetici Tahsilat Hatırlatması Entegrasyonu

1.2.51 reminder sistemi risk domaininin güncel vadesini kullandığı için aktif taksit planında:

- 7 gün yaklaşan,
- vade günü,
- 7+,
- 15+,
- 30+

eşikleri taksit vadeleri için çalışır.

Bildirim metni:

`Taksit vadesi`

ifadesini kullanır.

Açık tutar bilgisi:

`Açık sözleşme bakiyesi`

olarak belirtilir.

Aynı sözleşmenin farklı taksit vadeleri mevcut reminder dedup anahtarındaki:

`sozlesme_id + vade_tarihi + esik_kodu`

sayesinde ayrı dönemler olarak izlenir.

## Kurum Ticari 360 Entegrasyonu

Kurum Ticari 360 sözleşme tablosuna:

`Taksit Planı`

kolonu eklendi.

Gösterilen bilgiler:

- plan durumu,
- taksit sayısı,
- sonraki taksit vadesi,
- gecikmiş taksit tutarı.

Aktif plan varsa sözleşmenin vade hücresi sonraki taksit vadesini gösterir.

360 ekranı salt-okunur kalır.

## Fiziksel Silme Yok

Plan sürümleri ve plan geçmişi uygulama akışında fiziksel olarak silinmez.

Önceki plan sürümleri audit amacıyla korunur.

## Testler

Yeni testler:

- `tests/installment-plan-180.cjs`
- `tests/installment-plan-db-180.php`

MariaDB testi şunları doğrular:

1. ilk plan sürümünün 1 olmasını,
2. planın taslak başlamasını,
3. en az iki taksit kuralını,
4. taksit toplamı/sözleşme toplamı eşitliğini,
5. plan aktivasyonunu,
6. ilk ödenmemiş taksidin sonraki vade olmasını,
7. gecikmiş taksit tutarını,
8. ikinci revizyonun sürüm 2 oluşturmasını,
9. sürüm 1 taksitlerinin fiziksel olarak korunmasını,
10. yeni revizyonun planı tekrar taslağa almasını,
11. aktif planın sözleşme toplam drift'ini engellemesini,
12. sözleşme ana vadesi ileride olsa bile gecikmiş taksidin risk vakası açmasını,
13. risk vadesinin ilk ödenmemiş taksit olması,
14. ilk taksit tahsil edilince FIFO'nun ikinci takside ilerlemesini,
15. ödeme sonrası plan düzenlemesinin engellenmesini,
16. aktif ödeme varken plan pasifleştirmenin engellenmesini,
17. ödeme iptal edilince FIFO'nun ilk takside geri dönmesini,
18. aktif tahsilatlar temizlenince planın güvenli pasifleştirilebilmesini,
19. pasifleştirmenin eski plan sürümlerini silmemesini,
20. plan pasif olduktan sonra sözleşme iptal akışının çalışmasını,
21. hatalı plan toplamının reddedilmesini.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin plan yönetimi,
- CSRF,
- transaction,
- sözleşme row lock,
- plan row lock,
- sürümlü append-only yapı,
- ödeme geçmişi kilidi,
- aktif ödeme koruması,
- ana sözleşme drift koruması,
- mevcut tahsilat domaininin tek finansal gerçek olarak korunması

ile çalışır.
