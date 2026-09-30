# İlkAdım 1.1.105

## Hedef

Aynı semantik sürüm numarası altında yayınlanan doğrulanmış hotfix revizyonlarının kurulu sistemlere ulaşmasını sağlamak ve release metadata kimliğini sürüm + revizyon olarak ele almak.

## Düzeltilenler

1. `release_revision` artık uzak release metadata okumasında birinci sınıf alan olarak taşınır.
2. Yerel kurulumun revizyonu doğrudan canlı `version.json` dosyasından ve beklenen sürüm eşleşmesiyle okunur.
3. Aynı sürümde daha yüksek revizyon artık gerçek bir güncelleme olarak kabul edilir.
4. Aynı sürümde eşit veya düşük revizyon güncelleme sayılmaz.
5. Güncelleme zinciri seçiminde önce en yakın semantik sürüm, aynı sürüm içinde en yüksek release revizyonu seçilir.
6. Mevcut 1.1.100 ve daha eski legacy sürüm zinciri davranışı değiştirilmez.
7. 1.1.105 ve sonrasında `version.json`, `update-release.json` ve `update-managed-files.json` aynı pozitif release revision değerini taşımak zorundadır.
8. Beklenen GitHub release revision ile indirilen paketin revizyonu eşleşmeden dosya aktivasyonu başlamaz.
9. Runtime managed manifestine kurulu release revision da kaydedilir.
10. Recovery manifestine başlangıç ve hedef revizyonları yazılır.
11. Güncelleme geçmişi mesajında kurulan revizyon görünür.
12. Güncelleme AJAX yanıtı yerel ve uzak revizyonu ayrı alanlarla döndürür.
13. Yönetim ekranında sürüm bilgisi `1.1.x · rev N` biçiminde gösterilebilir.
14. Aynı sürüm revizyonu mevcutsa kurulum butonu görünür.
15. Kurulum sonrası sıradaki güncelleme kontrolü de revizyon farkındalığıyla çalışır.
16. PHP davranış testi sürüm/revizyon karşılaştırma ve yerel revision okuma senaryolarını çalıştırır.
17. Node regresyon testi metadata, AJAX ve kalite kapısı sözleşmesini doğrular.

## Bilinen paketleme notu

`src/bootstrap.php` canlı çalışma zamanında birden fazla giriş noktası tarafından çağrılıyor ancak Git geçmişinde kaynak kopyası bulunmuyor. Gerçek uygulama kopyası olmadan bu dosya tahmin edilerek oluşturulmadı; bu sürüm mevcut canlı bootstrap dosyasını değiştirmez.

## Veri güvenliği

Yeni migration yoktur. Kullanıcı, kurum, öğrenci veya içerik verileri değiştirilmez.

## Doğrulama

Sürüm önce `update-release-revision-105` aday dalında tam kalite kapısından geçirilir; yalnız yeşil sonuçtan sonra aynı doğrulanmış commit `main` dalına fast-forward edilir.

İlk aday CI turunda yeni PHP revision davranış testi geçti. Kalan hata 1.1.96 kaynak regresyonunun `write_managed_update_manifest` çağrısını yalnız eski 3 parametreli biçimde aramasıydı; test hem legacy çağrıyı hem revision taşıyan yeni çağrıyı kabul edecek şekilde güncellendi.
