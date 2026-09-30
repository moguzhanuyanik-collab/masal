# İlkAdım 1.1.103

## Hedef

Güncelleme paketindeki `update-managed-files.json` sözleşmesini gerçek paket ağacıyla birebir doğrulamak ve bildirilmeyen/fazladan/geçersiz dosyanın canlı aktivasyona ulaşmasını engellemek.

## Düzeltilenler

1. Paket managed-file manifest formatı yalnız desteklenen `format: 1` olduğunda kabul edilir.
2. Manifestte boş veya string olmayan dosya kayıtları reddedilir.
3. Yol normalizasyonundan sonra tekrarlı dosya kayıtları reddedilir.
4. Manifestte listelenmeyen gerçek paket dosyaları kurulumdan önce tespit edilir.
5. Manifestte olup pakette bulunmayan hayali dosyalar kurulumdan önce tespit edilir.
6. Manifest dosya listesi ile updater'ın gerçekten kopyalayacağı dosya ağacının birebir eşleşmesi zorunludur.
7. Bütünlük kontrolü dosya aktivasyonundan ve stale-file temizliğinden önce çalışır.
8. Hata mesajı yalnız sınırlı sayıda dosya adı gösterir; kontrolsüz uzun teşhis çıktısı üretmez.
9. 1.1.102 regresyon testi yeni sürümlerde de geçerli olacak şekilde release-aware hale getirildi.
10. Yeni PHP davranış testi eksik, hayali, tekrarlı ve desteklenmeyen manifest senaryolarını çalıştırır.
11. Yeni Node regresyon testi kontrolün aktivasyondan önce olduğunu ve sürüm/manifest sözleşmesini doğrular.

## Veri güvenliği

Yeni migration yoktur. Kullanıcı ve kurum verileri değiştirilmez. Bu kontrol 1.1.103 kurulduktan sonraki paketlerde zorunlu olur; 1.1.103'ün kendisi 1.1.102 updater tarafından mevcut 1.1.102 güvenlik kurallarıyla kurulacaktır.

## Doğrulama

Sürüm önce `updater-manifest-103` dalında tam kalite kapısından geçirilir; yalnız yeşil sonuçtan sonra aynı doğrulanmış commit `main` dalına fast-forward edilir.

İlk aday CI turunda PHP manifest davranış testi geçti. Node kaynak testindeki hata yalnız hata mesajı metninin yanlış eşleştirilmesiydi (`manifestte` yerine gerçek kaynakta `manifestinde`); test beklentisi düzeltildi, uygulama davranışı değiştirilmedi.
