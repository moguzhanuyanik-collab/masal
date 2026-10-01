# İlkAdım 1.2.49

## Yenileme → Sözleşme → Tahsilat Bağlantısı

Bu sürüm 1.2.48 lisans yenileme operasyonunu Ticari Finans ile gerçek bir ticari zincire bağlar.

Yeni migration:

`081_yenileme_sozlesme_tahsilat_baglantisi.sql`

Migration zinciri:

`081`

olur.

## Amaç

1.2.48 lisansı yenileyebiliyor ve yenileme vakasını kapatabiliyordu.

Ancak lisans yenilendikten sonra:

- ticari sözleşme açıldı mı,
- sözleşme hangi yenilemeye ait,
- tahsilat başladı mı,
- kısmi mi tam mı,
- yenilendi ama ticari kayıt hiç açılmadı mı

tek zincir halinde izlenmiyordu.

1.2.49 bu boşluğu kapatır.

## Güvenli Mapping Tasarımı

Eski `kurum_sozlesmeleri` tablosuna sonradan kolon eklenmedi.

Yeni:

`lisans_yenileme_sozlesmeleri`

mapping tablosu kullanılır.

Kurallar:

- her yenileme vakası en fazla bir sözleşmeye bağlanır,
- her sözleşme en fazla bir yenileme vakasına bağlanır,
- kurum ID bağlantıda ayrıca saklanır,
- eski sözleşme tablosu yapısı değiştirilmez.

Bu tasarım updater ve eski kurulum uyumluluğunu korur.

## Yenilemeden Sözleşme Taslağı

Yalnız:

`yenilendi`

durumundaki vaka sözleşme taslağı oluşturabilir.

Sözleşme:

- mevcut yenileme vakasının kurumunu,
- yenilenen paketi,
- eski lisans bitişinin ertesi gününü başlangıç tarihi olarak,
- yeni lisans bitişini sözleşme bitişi olarak

kullanır.

Yeni ikinci lisans oluşturmaz.

## Ticari Tutar Otomatik Tahmin Edilmez

Paketin aylık fiyatından:

`aylık fiyat × 12`

gibi otomatik sözleşme toplamı türetilmez.

Süper Admin açıkça:

- sözleşme numarası,
- toplam sözleşme tutarı,
- para birimi,
- vade tarihi,
- not

girer.

Böylece iskonto, dönem, özel fiyat veya farklı ticari anlaşma yanlış yorumlanmaz.

## Sözleşme İlk Durumu

Yenilemeden oluşan sözleşme:

`taslak`

durumunda başlar.

Taslak sözleşmeye tahsilat girilemez.

Süper Admin Ticari Finans ekranında sözleşmeyi kontrol edip:

`aktif`

duruma aldıktan sonra tahsilat kaydedebilir.

## Yenileme Geçmişi

Sözleşme taslağı oluşturulduğunda 1.2.48 yenileme geçmişine append-only:

- tür: `ticari`
- kod: `sozlesme_taslak`

olayı yazılır.

Sözleşme numarası ve sözleşme ID geçmiş kaydında görünür.

## Ticari Tamamlama Durumları

Yenilenmiş her vaka aşağıdaki ticari durumlardan biriyle izlenir:

- Sözleşme yok
- Bağlı sözleşme kaydı bulunamıyor
- Sözleşme iptal
- Sözleşme taslak
- Tahsilat yok
- Kısmi tahsilat
- Ticari akış tamam

Bu durumlar lisans yenileme ekranındaki:

`Yenileme → Sözleşme → Tahsilat`

panelinde görünür.

## Yenilendi Ama Sözleşme Yok

Lisans yenilenmiş fakat ticari sözleşme oluşturulmamışsa:

`Yenilendi · sözleşme yok`

sayacı artar.

Bu kayıtlar aksiyon listesinde kurum ve paket bilgisiyle gösterilir.

## Sözleşme Var Ama Tahsilat Yok

Sözleşme aktif hale getirilmiş ancak aktif tahsilat bulunmuyorsa:

`Aktif sözleşme · tahsilat yok`

durumu görünür.

Taslak sözleşmeler ayrı tutulur.

## Kısmi Tahsilat

Aktif tahsilat toplamı sözleşme tutarından düşükse:

`Kısmi tahsilat`

durumu gösterilir.

## Ticari Akış Tamam

Aktif tahsilat toplamı sözleşme tutarını karşılıyorsa:

`Ticari akış tamam`

durumu oluşur.

Ticari Finans'ın mevcut sözleşme durum normalizasyonu da sözleşmeyi:

`tamamlandi`

durumuna geçirir.

## Yenileme Gelir Özeti

Yenileme merkezi artık para birimi bazında:

- yenileme sözleşme toplamı,
- tahsil edilen,
- kalan,
- bağlı yenileme sayısı

gösterir.

TRY, USD ve EUR birbirine çevrilmez veya yanlışlıkla tek toplam altında birleştirilmez.

## Çift Yönlü Navigasyon

### Yenileme Merkezi

Bağlı sözleşme varsa:

`Sözleşmeyi Aç`

ile Ticari Finans'a gider.

### Ticari Finans

Yenilemeden gelen sözleşme:

`Yenileme #ID`

bilgisini gösterir.

Sözleşme düzenleme ekranında ilgili yenileme vakasına geri dönülebilir.

## Tek Vaka → Tek Sözleşme

Mapping tablosunun primary key'i:

`yenileme_id`

üzerindedir.

Aynı yenileme vakasından ikinci sözleşme oluşturulamaz.

## Tek Sözleşme → Tek Yenileme

Unique index:

`uk_yenileme_sozlesme (sozlesme_id)`

ile bir sözleşmenin iki farklı yenileme vakasına bağlanması engellenir.

## Transaction Güvenliği

Sözleşme taslağı oluşturma:

1. transaction başlatır,
2. yenileme vakasını kilitler,
3. vaka durumunun `yenilendi` olduğunu doğrular,
4. mevcut mapping'i `FOR UPDATE` ile kontrol eder,
5. sözleşme taslağını oluşturur,
6. mapping'i ekler,
7. yenileme geçmişine ticari olayı ekler,
8. transaction tamamlanır.

Mapping başarısız olursa sözleşme de rollback edilir.

Bu nedenle başarısız bağlantı denemesi yetim sözleşme bırakmaz.

## Hata Gizleme

Yenileme merkezindeki ticari DB hataları ham SQL mesajı olarak kullanıcıya gösterilmez.

Duplicate durumda anlaşılır mesaj:

`Sözleşme numarası veya yenileme-sözleşme bağlantısı zaten kullanılıyor.`

gösterilir.

Diğer DB hatalarında genel işlem hatası kullanılır.

## Migration

Yeni tablo:

`lisans_yenileme_sozlesmeleri`

Alanlar:

- yenileme_id
- sozlesme_id
- kurum_id
- olusturan_kullanici_id
- olusturulma_tarihi

Mevcut sözleşme tablosuna ALTER uygulanmaz.

## Testler

Yeni testler:

- `tests/renewal-commercial-link-174.cjs`
- `tests/renewal-commercial-link-db-174.php`

MariaDB testi şunları doğrular:

1. yenilenmiş ama sözleşmesiz vakanın ticari açık olarak görünmesini,
2. yenilenmemiş vakanın sözleşme oluşturamamasını,
3. sözleşme başlangıcının eski lisans bitişinin ertesi günü olmasını,
4. sözleşme bitişinin yenilenen lisans bitişi olmasını,
5. yenilenen paketin sözleşmeye taşınmasını,
6. sözleşmenin taslak başlamasını,
7. mapping kaydının oluşmasını,
8. yenileme geçmişine ticari olay yazılmasını,
9. aynı vakadan ikinci sözleşmenin engellenmesini,
10. başarısız ikinci denemede yetim sözleşme kalmamasını,
11. taslak sözleşmenin ticari açık olarak görünmesini,
12. aktif sözleşmede tahsilat yok durumunu,
13. kısmi tahsilat durumunu,
14. para birimi bazlı yenileme gelir özetini,
15. tam tahsilatta ticari akışın tamamlanmasını,
16. sözleşmenin tamamlandı durumuna normalizasyonunu,
17. Ticari Finans sözleşme satırından yenileme lineage bilgisinin çözülmesini.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin ticari sözleşme taslağı oluşturur,
- CSRF korumasını kullanır,
- row lock kullanır,
- transaction kullanır,
- sözleşme ve yenileme birebirliğini DB seviyesinde korur,
- tahsilat kurallarını mevcut Ticari Finans domaininden geçirir,
- geçmiş kayıtları fiziksel olarak silmez.
