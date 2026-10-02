# İlkAdım 1.2.65

## Mutabakat Operasyon Eskalasyon Merkezi

Bu sürüm 1.2.60 Aksiyon Sağlığı, 1.2.63 Aksiyon Hatırlatmaları ve 1.2.64 Sorumlu Devir akışlarını tek bir operasyon eskalasyon katmanıyla tamamlar.

Yeni migration:

`088_mutabakat_operasyon_eskalasyonlari.sql`

Migration zinciri:

`088`

olur.

## Amaç

Mutabakat sistemi artık:

- vaka kaynağını,
- vaka yaşını,
- ilk müdahaleyi,
- sorumluyu,
- aksiyon tarihini,
- sorumlu hatırlatmalarını,
- yetim/geçersiz sahipliği

izleyebiliyordu.

Eksik kalan nokta, açık vaka döngüsünün belirli operasyon yaş eşiklerini geçmesini kontrollü bir eskalasyon olarak görünür hale getirmekti.

1.2.65 bu ihtiyacı karşılar.

## Sözleşmesel SLA Değildir

Bu sürümde kullanılan eşikler:

- müşteri sözleşmesine bağlı SLA,
- dış hukuki taahhüt,
- otomatik ceza/puan

değildir.

Yalnız İlkAdım iç operasyon takibidir.

Kaynak olarak mevcut 1.2.60:

- vaka yaşı,
- ilk müdahale geçmişi,
- aksiyon tarihi,
- açık döngü

göstergeleri kullanılır.

## Yeni Sayfa

Yeni Süper Admin sayfası:

`ticari-mutabakat-eskalasyon.php`

Yeni domain:

`src/ticari_mutabakat_eskalasyon.php`

Yeni stil:

`ticari-mutabakat-eskalasyon.css`

## Eskalasyon Eşikleri

### 2+ Gün İlk Müdahale Yok

Vaka mevcut açık döngüde en az 2 gündür açık ve:

- takip notu,
- aşama değişikliği

yoksa:

`ilk_mudahale_2`

eşiği oluşur.

### 4+ Gün Açık

Mevcut açık döngü 4 güne ulaştığında:

`dongu_4`

### 8+ Gün Açık

`dongu_8`

### 14+ Gün Açık

`dongu_14`

### 30+ Gün Açık

`dongu_30`

eşikleri kullanılır.

Sistem geçmiş tüm eşikleri tek seferde yağdırmaz.

Her senkronizasyonda vakanın o anki en yüksek geçerli eşiği değerlendirilir.

## Aksiyon Hatırlatmalarından Ayrım

1.2.63:

- aksiyon bugün,
- aksiyon 1/3/7/14/30+ gün gecikti

bildirimlerini yönetmeye devam eder.

1.2.65 ise:

- ilk müdahale eksikliği,
- açık vaka döngüsünün yaşlanması

üzerinden çalışır.

Bu nedenle iki merkez aynı sinyali tekrar etmez.

## Açık Döngü

Vaka ilk kez açılmışsa döngü başlangıcı:

`ticari_mutabakat_vakalari.olusturulma_tarihi`

olarak alınır.

Vaka kapanıp tekrar açılmışsa başlangıç:

append-only geçmişteki son:

`vaka_yeniden_acildi`

olayıdır.

Eskalasyon yaşı bu tarihten itibaren hesaplanır.

## Döngü Anahtarı

Her açık döngü için:

`SHA-256(vaka_id | dongu_baslangic_tarihi)`

anahtarı üretilir.

Bu anahtar:

- eski kapalı döngü eskalasyonlarını korur,
- yeni reopen döngüsünün yeni eşik bildirimi alabilmesini sağlar.

## Dedup Kuralı

Yeni tablo:

`ticari_mutabakat_eskalasyonlari`

şu bileşimi unique tutar:

`vaka_id + dongu_anahtari + esik_kodu + alici_kullanici_id`

Böylece aynı:

- vaka,
- açık döngü,
- eşik,
- sorumlu

ikinci kez eskalasyon almaz.

## Sorumlu Değişirse

Aynı açık döngü ve eşikte sorumlu değişirse yeni geçerli Süper Admin:

kendi recipient kaydıyla bir kez eskalasyon alabilir.

Eski sorumlunun geçmiş bildirimi silinmez.

Bu davranış 1.2.64 devir akışıyla uyumludur.

## Geçersiz Sorumlu

Sorumlu:

- sahipsiz,
- pasif,
- artık Süper Admin değil,
- kullanıcı kaydı yok

ise eskalasyon bildirimi gönderilmez.

Vaka:

`Mutabakat Sorumlu Devir`

merkezine yönlendirilir.

Sahiplik düzeltilmeden eskalasyon gönderimi yapılmaz.

## Secondary-role Süper Admin

Kullanıcının primary rolü farklı olsa bile aktif:

`kullanici_rolleri.super_admin`

rolü varsa geçerli eskalasyon alıcısıdır.

## Kaynak Sorun Yeniden Doğrulanır

Gönderimden hemen önce vaka satırı:

`SELECT ... FOR UPDATE`

ile kilitlenir.

Ardından:

`ma_case_source_still_open()`

ile kaynak sorun tekrar doğrulanır.

Kaynak sorun çözülmüşse eski aday listesine güvenilerek eskalasyon gönderilmez.

## Sağlık Durumu Yeniden Hesaplanır

Row lock sonrasında:

- açık döngü başlangıcı,
- açık gün,
- ilk müdahale,
- aksiyon tarihi durumu

yeniden okunur.

Aday liste ile gerçek gönderim anı arasında koşullar değişmişse güncel durum kullanılır.

## Merkezi Bildirim Entegrasyonu

Eskalasyon:

- tür: `sistem`
- hedef: `super_admin`
- kaynak: `mutabakat_operasyon_eskalasyon`

olarak merkezi bildirim sistemine yazılır.

Recipient yalnız mevcut geçerli vaka sorumlusudur.

Bağlantı ilgili:

`ticari-mutabakat-aksiyon.php?vaka_id=...`

sayfasına gider.

## Append-only Vaka Geçmişi

Başarılı eskalasyon sonrası vaka geçmişine:

- tür: `bildirim`
- kod: `eskalasyon_<eşik>`

kaydı eklenir.

Eski eskalasyon kayıtları fiziksel olarak silinmez.

## Eşzamanlı Senkronizasyon Koruması

Gönderim tablosu DB unique key'e sahiptir.

Uygulama ayrıca:

`INSERT IGNORE`

kullanır.

Aynı anda iki eskalasyon senkronizasyonu çalışırsa yalnız gerçekten insert yapan işlem merkezi bildirimi oluşturur.

## GET Yan Etkisiz

Eskalasyon sayfasını açmak:

- bildirim göndermez,
- vaka değiştirmez,
- sorumlu değiştirmez,
- aksiyon tarihi değiştirmez.

Gönderim yalnız CSRF korumalı:

`Eskalasyonları Senkronize Et`

POST işlemiyle çalışır.

## UI

Ekranda:

- gönderim bekleyen,
- mevcut eşik gönderilmiş,
- geçersiz/pasif sorumlu,
- kurumsuz vaka,
- toplam eskalasyon geçmişi

özetleri bulunur.

Eşik dağılımı:

- 2+ gün ilk müdahale yok,
- 4+ gün,
- 8+ gün,
- 14+ gün,
- 30+ gün

olarak gösterilir.

## Navigasyon

Eskalasyon Merkezi bağlantısı:

- Süper Admin ana menüsüne,
- Mutabakat Sağlığı'na,
- Aksiyon Hatırlatmaları'na,
- Günlük İş Kutusu'na,
- Toplu Planlama'ya,
- Sorumlu Devir Merkezi'ne

eklenmiştir.

## Testler

Yeni testler:

- `tests/reconciliation-escalation-190.cjs`
- `tests/reconciliation-escalation-db-190.php`

MariaDB testi şunları doğrular:

1. 1 günlük vakanın eskalasyon almamasını,
2. 2+ gün ve ilk müdahale olmayan eşiği,
3. 3 günlük müdahale edilmiş vakanın eskalasyon almamasını,
4. 4+ gün eşiğini,
5. 8+ gün eşiğini,
6. 14+ gün eşiğini,
7. 30+ gün eşiğini,
8. kapalı vakanın aday olmamasını,
9. normal yöneticinin geçerli alıcı sayılmamasını,
10. secondary-role Süper Admin'in geçerli alıcı olmasını,
11. kurumsuz vakanın gönderilmemesini,
12. stale/kaynak çözülmüş vakanın gönderilmemesini,
13. ilk başarılı senkronizasyonu,
14. merkezi bildirim recipient rolünü,
15. aynı döngü/eşik/sorumlu için ikinci gönderimin engellenmesini,
16. sorumlu değişince yeni geçerli sorumluya yeni recipient dedup döngüsü oluşmasını,
17. aynı 4+ gün eşiğinde reopen döngüsünün yeni SHA-256 döngü anahtarıyla yeni eskalasyon almasını,
18. eski döngü geçmişinin korunmasını,
19. append-only vaka eskalasyon geçmişini,
20. stale-source vakaya eskalasyon history yazılmamasını,
21. Süper Admin olmayan aktörün senkronizasyon çalıştıramamasını.

## Güvenlik

Bu sürüm:

- yalnız Süper Admin,
- CSRF,
- vaka row lock,
- kaynak sorun yeniden doğrulaması,
- güncel sağlık yeniden hesaplama,
- primary/secondary aktif Süper Admin alıcı doğrulaması,
- döngü + eşik + recipient DB dedup,
- concurrent INSERT IGNORE guard,
- transaction rollback,
- append-only audit

ile çalışır.
