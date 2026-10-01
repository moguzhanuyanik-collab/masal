# İlkAdım 1.1.104

## Hedef

Güncelleme sırasında canlı uygulama dosyalarının yarım veya bozuk yazılma riskini azaltmak; DB mutation başlamadan dosya sistemi uygunluğunu doğrulamak ve aktivasyon sonrası içerik bütünlüğünü ölçmek.

## Düzeltilenler

1. Yeni ve değişen dosyaların hedef dizinleri DB mutation başlamadan önce yazılabilirlik açısından kontrol edilir.
2. Silinecek eski managed dosyaların üst dizinleri de aktivasyon öncesi doğrulanır.
3. Aktivasyonda yazılacak toplam kaynak byte miktarı hesaplanır ve boş disk alanı preflight kontrolüne dahil edilir.
4. Kaynak ve hedefte sembolik bağlantı / normal-dosya ihlalleri fail-closed reddedilir.
5. Canlı dosyaya doğrudan `copy()` yerine aynı hedef dizinde benzersiz geçici dosya oluşturulur.
6. Geçici dosyanın SHA-256 değeri kaynak dosyayla eşleşmeden etkinleştirme yapılmaz.
7. Doğrulanan geçici dosya `rename()` ile hedefe atomik olarak geçirilir.
8. Başarısız atomik değişimde geçici dosya temizlenir; yarım temp dosyası bırakılmaz.
9. Tüm managed dosyalar aktivasyon sonrasında kaynak paketle SHA-256 bazında tekrar karşılaştırılır.
10. Post-copy doğrulaması tamamlanmadan stale-file temizliği ve yeni managed manifest yazımı başlamaz.
11. Recovery manifestine aktivasyon preflight ve doğrulama sayaçları eklenir.
12. Yeni hata ailesi kullanıcıya güvenli güncelleme mesajı olarak aktarılır.
13. PHP davranış testi gerçek geçici kaynak/canlı ağaç üzerinde replace, yeni dosya ve tamper senaryolarını çalıştırır.
14. Node regresyon testi preflight’in DB mutation’dan önce, SHA doğrulamasının stale cleanup’tan önce olduğunu denetler.

## Veri güvenliği

Yeni migration yoktur. Kullanıcı/kurum verisi değiştirilmez. DB dönüşümü gereken bir güncellemede mevcut DB snapshot/recovery politikası korunur.

## Doğrulama

Sürüm önce `update-activation-104` aday dalında tam kalite kapısından geçirilir; yalnız yeşil sonuçtan sonra aynı doğrulanmış commit `main` dalına fast-forward edilir.

Aday dalın ilk push'unda workflow tetiklenmedi; kalite kapısının branch filtresine `update-*` aday dalları eklendi. Bu değişiklik gelecekteki updater adaylarının da `main` öncesi doğrulanmasını sağlar.
