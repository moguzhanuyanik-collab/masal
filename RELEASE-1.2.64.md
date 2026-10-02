# İlkAdım 1.2.64

## Mutabakat Sorumlu Devir & Yetim Vaka Kurtarma Merkezi

Bu sürüm 1.2.63 Mutabakat Aksiyon Hatırlatmaları'nın görünür hale getirdiği geçersiz/pasif sorumlu problemini güvenli bir operasyon kurtarma akışına dönüştürür.

Yeni migration yoktur.

Migration zinciri:

`087`

olarak kalır.

## Amaç

Mutabakat vakası:

- sahipsiz olabilir,
- pasif kullanıcıya atanmış olabilir,
- artık Süper Admin olmayan bir kullanıcıya bağlı olabilir,
- sorumlu kullanıcı kaydı silinmiş olabilir.

1.2.63 Hatırlatma Merkezi bu vakalara sistem bildirimi göndermiyordu ve bunları:

`Geçersiz/pasif sorumlu`

olarak görünür hale getiriyordu.

1.2.64 bu vakaları aktif Süper Admin'e güvenli biçimde devretmek için ayrı kurtarma merkezi ekler.

## Yeni Sayfa

Yeni Süper Admin sayfası:

`ticari-mutabakat-devir.php`

Yeni domain:

`src/ticari_mutabakat_devir.php`

Yeni stil:

`ticari-mutabakat-devir.css`

## Yeni Migration Yok

Sorumlu devir mevcut:

- `ticari_mutabakat_vakalari`
- `ticari_mutabakat_vaka_gecmisi`

tablolarını kullanır.

Yeni finansal veya operasyonel state tablosu oluşturulmaz.

Bu nedenle migration zinciri:

`087`

olarak kalır.

## Sorumlu Sağlığı Sınıfları

Açık vakalar için mevcut sorumlu şu sınıflardan biriyle değerlendirilir:

### Sahipsiz

`sorumlu_kullanici_id`

boş veya sıfırdır.

### Pasif Kullanıcı

Kullanıcı kaydı vardır fakat:

`kullanicilar.aktif = 0`

durumundadır.

### Artık Süper Admin Değil

Kullanıcı aktiftir fakat:

- primary `ana_rol=super_admin` değildir,
- ve `kullanici_rolleri` tablosunda ikincil `super_admin` rolü yoktur.

### Kullanıcı Kaydı Bulunamadı

Vakadaki sorumlu ID artık:

`kullanicilar`

tablosunda yoktur.

### Geçerli

Kullanıcı aktiftir ve primary veya secondary rol ile Süper Admin yetkisine sahiptir.

Geçerli sahipliğe sahip vaka kurtarma kuyruğuna alınmaz.

## Normal Planlama ile Ayrım

Sorumlu Devir Merkezi normal görev dağıtım aracı değildir.

Geçerli aktif Süper Admin'e atanmış vaka burada devredilemez.

Normal ekip dağılımı ve planlama için mevcut:

`Mutabakat Toplu Planlama`

kullanılmaya devam eder.

Bu sınır, kurtarma ekranının normal görev sahipliğini sessizce değiştirmesini engeller.

## Yalnız Açık Vakalar

Kurtarma kuyruğunda yalnız:

- Açık
- İncelemede
- Dış Aksiyon Bekleniyor

vakalar değerlendirilir.

Kapalı vaka kurtarma kuyruğuna alınmaz.

## Kaynak Sorunu Yeniden Doğrulanır

Devirden hemen önce:

`ma_case_source_still_open()`

ile kaynak sorun tekrar doğrulanır.

Kaynak sorun artık çözülmüşse devir yapılmaz.

Bu durumda önce mevcut Mutabakat Aksiyon Merkezi vaka senkronizasyonu çalıştırılmalıdır.

## Atomik Toplu Devir

Tek POST işleminde en fazla:

`100`

vaka devredilebilir.

Seçilen vakalar:

`SELECT ... FOR UPDATE`

ile kilitlenir.

Seçilenlerden biri:

- bulunamıyorsa,
- kapalıysa,
- kaynak sorunu çözülmüşse,
- artık geçerli Süper Admin sorumlusuna sahipse

tüm transaction rollback edilir.

Kısmi devir yapılmaz.

## Hedef Sorumlu

Yeni sorumlu:

- aktif kullanıcı,
- primary veya secondary Süper Admin

olmalıdır.

Normal yönetici veya pasif Süper Admin hedef olarak seçilemez.

## Aksiyon Tarihi Korunur

Sorumlu kurtarma işlemi yalnız:

`sorumlu_kullanici_id`

ve audit amaçlı:

`guncelleyen_kullanici_id`

alanını değiştirir.

Mevcut:

`sonraki_aksiyon_tarihi`

aynen korunur.

Vaka aşaması da değiştirilmez.

Bu sayede görev sahibi değişirken mevcut operasyon takvimi bozulmaz.

## İlk Müdahale Metriği Değişmez

Sorumlu devir:

- takip notu değildir,
- aşama değişikliği değildir.

Bu nedenle 1.2.60 sağlık ekranındaki:

`ilk müdahale`

metriğini kapatmaz.

Gerçek müdahale yine takip notu veya vaka aşama işlemiyle ölçülür.

## Append-only Devir Geçmişi

Her başarılı vaka devrinde:

- tür: `planlama`
- kod: `sorumlu_devir`

append-only geçmiş kaydı oluşturulur.

Not içinde:

- eski sorumlu,
- eski sorumlu sağlık durumu,
- yeni sorumlu,
- korunan aksiyon tarihi,
- opsiyonel devir notu

saklanır.

Eski geçmiş silinmez.

## Hatırlatma Merkezi Entegrasyonu

1.2.63 Hatırlatma Merkezi'ndeki:

`Geçersiz/pasif sorumlu`

sayacı yeni Devir Merkezi'ne bağlanır.

Hatırlatma ekranından sorun görüldüğü anda kurtarma sayfasına geçilebilir.

Devir sonrası vaka yeni sorumlunun:

- Günlük İş Kutusu'nda görünür,
- aksiyon tarihi bugün/gecikmişse Hatırlatma Merkezi'nin yeni sorumluya özel dedup döngüsüne girebilir.

Eski sorumlu reminder geçmişi silinmez.

## Navigasyon

Yeni Sorumlu Devir bağlantısı:

- Süper Admin ana menüsüne,
- Mutabakat Hatırlatma Merkezi'ne,
- Mutabakat Toplu Planlama'ya,
- Mutabakat Aksiyon Sağlığı'na,
- Mutabakat Günlük İş Kutusu'na

eklenmiştir.

## Testler

Yeni testler:

- `tests/reconciliation-owner-recovery-189.cjs`
- `tests/reconciliation-owner-recovery-db-189.php`

MariaDB testi şunları doğrular:

1. sahipsiz vaka tespitini,
2. pasif sorumlu tespitini,
3. artık Süper Admin olmayan kullanıcı tespitini,
4. silinmiş kullanıcı tespitini,
5. secondary-role aktif Süper Admin'in geçerli sayılmasını,
6. primary Süper Admin'in geçerli sayılmasını,
7. kapalı vakanın kurtarma kuyruğuna girmemesini,
8. geçerli sorumlu vakanın kurtarma kuyruğuna girmemesini,
9. sağlık türü filtrelerini,
10. kurum aramasını,
11. duplicate vaka ID normalizasyonunu,
12. 100 vaka sınırını,
13. normal yöneticinin hedef olamamasını,
14. pasif Süper Admin'in hedef olamamasını,
15. geçerli sahipliğe sahip vaka karışık seçiminde tüm transaction rollback'i,
16. kapalı vaka karışık seçiminde rollback'i,
17. stale/kaynak çözülmüş vaka karışık seçiminde rollback'i,
18. başarılı toplu devri,
19. secondary-role Süper Admin'e devir desteğini,
20. vaka aşamasının değişmemesini,
21. sonraki aksiyon tarihinin aynen korunmasını,
22. her vaka için append-only `sorumlu_devir` geçmişini,
23. devir notunun korunmasını,
24. devir işleminin ilk müdahale sayılmamasını,
25. başarı sonrası yalnız çözülmemiş stale yetim vakanın listede kalmasını,
26. son devir audit listesini,
27. Süper Admin olmayan aktörün devir yapamamasını.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin,
- CSRF,
- aktif/rolü geçerli hedef sorumlu doğrulaması,
- 100 vaka sınırı,
- vaka row lock,
- kaynak sorun yeniden doğrulaması,
- atomik transaction,
- geçerli sahiplik koruması,
- aksiyon tarihi koruması,
- append-only audit geçmişi

ile çalışır.
