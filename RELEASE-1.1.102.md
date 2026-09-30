# İlkAdım 1.1.102

## Hedef

Güncelleme paketinin indirme/açılım kaynak tüketimini fail-closed sınırlandırmak ve her güncelleme denemesinin recovery durumunu baştan sona doğru yansıtmasını sağlamak.

## Düzeltilenler

1. Güncelleme ZIP indirmesi 64 MB varsayılan güvenlik sınırıyla akış sırasında durdurulur; aşırı paket tamamen diske yazılmadan reddedilir.
2. Paket kayıt sayısı varsayılan 5000 ile sınırlandırılır.
3. Açılmış toplam paket boyutu varsayılan 128 MB ile sınırlandırılır.
4. Tek dosya boyutu varsayılan 16 MB ile sınırlandırılır.
5. 1 MB üzerindeki dosyalarda olağandışı sıkıştırma oranı kontrol edilir.
6. Sembolik bağlantının yanında desteklenmeyen Unix özel dosya türleri de reddedilir.
7. ZIP açılmadan önce açılmış paket boyutuna göre boş disk alanı preflight kontrolü yapılır.
8. Limitler `config/local.php` üzerinden kontrollü biçimde ayarlanabilir; kod içindeki alt/üst güvenlik sınırları korunur.
9. Recovery manifest güncelleme başlar başlamaz `preparing` durumuyla yenilenir; önceki denemenin durumu yeni deneme sırasında yanlışlıkla gösterilmez.
10. Uygulama yedeği hazır olduğunda recovery manifest ayrıca `application_backup_ready` durumuna geçer.
11. İndirme, paket doğrulama, DB yedeği, DB mutation ve dosya aktivasyonu aşamaları manifestte izlenir.
12. Başarısız güncellemede `failure_stage` kaydedilir; hassas hata ayrıntısı manifest içine yazılmaz.
13. Sistem Durumu ekranı başarısız veya yarım kalmış recovery durumunu artık yeşil "Hazır" göstermez; inceleme gerektirdiğini belirtir.
14. Sistem Durumu ekranı aktif paket güvenlik limitlerini gösterir.
15. ZIP güvenlik hataları kullanıcıya güvenli ve anlaşılır biçimde aktarılır.
16. PHP davranış testi ve Node kaynak/regresyon testi kalite kapısına eklendi.
17. 1.1.101+ sürümlerde hem geçmiş taraması hem fallback artık `update-release.json` üzerinden yapılır; henüz final ankrajı olmayan geliştirme sürümü kullanıcıya güncelleme gibi görünmez.
18. Paket içinde `version.json`, `update-release.json` ve `update-managed-files.json` sürümleri birebir eşleşmek zorundadır.
19. Managed-file manifestinin `files` alanı geçersizsa kurulum dosya aktivasyonundan önce durur.

## Veri güvenliği

Yeni migration yoktur. Kullanıcı, kurum, öğrenci, veli veya içerik verisi değiştirilmez. Mevcut uygulama yedeği, DB snapshot, managed-file ve release-anchor davranışları korunur.
