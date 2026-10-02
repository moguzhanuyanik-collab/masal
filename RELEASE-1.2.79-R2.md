# İlkAdım 1.2.79 rev 2 — Otomatik Güncelleyici Bootstrap

Bu yayın yalnız güncelleme ekranını sağlamlaştırır; eğitim verilerine ve veritabanı şemasına dokunmaz.

## Amaç

- Mevcut 1.2.79 rev 1 kurulumların otomatik güncelleme motoruna geçmesini sağlamak.
- Sonraki sürümleri AJAX ile tek tek ve sıralı kurmak.
- Her başarılı sürümden sonra sayfayı yeni updater koduyla yeniden açıp zincire devam etmek.
- Kurulum cevabı kaybolursa kurulu sürümü tekrar doğrulamak.

## Güvenlik

- Ara sürüm atlanmaz.
- Her sayfa neslinde en fazla bir release kurulur.
- Updater çekirdeği handoff gerektirirse kontrollü yeniden denenir.
- Hata durumunda sonraki release'e geçilmez.
- Toplam 50 release güvenlik sınırı vardır.
- Yeni migration yoktur.

İlk 1.2.79 rev 1 → rev 2 geçişinden sonra güncelleme ekranı bir kez yenilenmelidir. Rev 2 sonrasında zincir otomatik devam eder.
