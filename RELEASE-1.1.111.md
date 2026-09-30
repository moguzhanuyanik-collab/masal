# İlkAdım 1.1.111

## Güncelleme maddeleri

- Updater core handoff marker formatı 2'ye yükseltildi.
- Handoff sırasında kullanılan tam uygulama yedeğinin SHA-256 ve byte boyutu marker'a kaydedilir.
- Otomatik yeniden denemede yedek dosyası marker'daki SHA-256 ve boyutla eşleşmiyorsa eski handoff marker güvenilir kabul edilmez.
- Eski format-1 handoff marker'lar geriye uyumluluk için mevcut dosyanın fingerprint'i ile okunabilir.
- Runtime `storage/updates/managed-files.json` artık format 2 olarak her yönetilen dosyanın SHA-256 baseline'ını saklar.
- Yeni sürümde kaldırılacak eski yönetilen dosya için güvenilir hash baseline yoksa otomatik silme fail-closed durur.
- Eski yönetilen dosya son kurulumdan sonra değiştirilmişse updater bu dosyayı silmez ve güncellemeyi mutation başlamadan durdurur.
- Stale dosya hash kontrolü hem mutation öncesi preflight'ta hem gerçek silme anında tekrar yapılır.
- Handoff backup tamper ve managed stale-file davranışı gerçek temp dosya sistemi üzerinde PHP regresyon testiyle doğrulanır.

## Rev 2

- 1.1.96'dan kalan updater manifest regresyon testi, stale-file silme fonksiyonunun yeni hash parametresini kabul edecek şekilde geleceğe uyumlu hale getirildi.
- 1.1.111 release revision testi sabit revizyon yerine pozitif revision sözleşmesini doğruluyor.

## Rev 3

- 1.1.104 aktivasyon regresyon testi yeni hash-korumalı stale-file çağrısını fonksiyon imzasına bağımlı olmadan doğrulayacak şekilde güncellendi.
