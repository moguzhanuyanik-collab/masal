# İlkAdım 1.2.9

## 1.1.97 → 1.2.1 doğrudan recovery yeniden yapısı

### Hata analizi

GitHub tarihçesi yeniden incelendiğinde 1.1.97–1.2.1 arasındaki uygulama değişikliklerinin GitHub'dan silinmediği doğrulandı. 1.2.1 rev15 final rebuild anchor'ı korunuyor:

`6a0f372871e6dbd2b71d2efef121fbf2dfb2f82c`

Asıl risk, 1.1.97 kurulumunun bozulmuş tarihsel updater zincirini tek tek geçmek zorunda bırakılmasıydı. Ara updater/recovery paketlerinden herhangi biri kurulumun ilerlemesini durdurabildiği için, canlı kurulumun final 1.2.1 durumuna ulaşması garanti değildi.

### 1.2.9 düzeltmesi

- Kurulu sürüm tam olarak **1.1.97** ise güncelleme seçimi artık 1.1.98'i seçip tarihsel zincirde ilerlemeye çalışmıyor.
- Doğrudan doğrulanmış **1.2.1 rev15** immutable commit'i hedefleniyor.
- 1.2.1 package metadata'sı aynı immutable commit üzerinden tekrar doğrulanıyor.
- 1.1.97 legacy DB recovery akışı korunuyor:
  - 064 checkpoint kontrolü
  - legacy kurum üyeliği lossless dönüşümü
  - 065 kurum bazlı eşleştirme izolasyonu
  - 066 tenant schema guard
- Recovery sonunda 1.2.1 release postcondition zorunlu.
- 1.2.1'e ulaşıldıktan sonra normal güncelleme zinciri tekrar devreye giriyor: 1.2.2 → 1.2.3 → ...
- 1.1.119 recovery-only artifact aktif kurulum basamağı yapılmıyor.

### Neden ara uygulama değişiklikleri kaybolmuyor?

1.2.1 rev15 final rebuild tree'si 1.1.97 ile 1.2.1 arasında geri kazanılan uygulama değişikliklerini içeriyor. Bu nedenle canlı kurulumun her tarihsel PHP/JS commit'ini ayrı ayrı çalıştırması gerekmiyor; final tree tek immutable paket olarak uygulanıyor. DB tarafındaki değişiklikler ise updater'ın özel recovery fonksiyonunda kontrollü sırayla uygulanıyor.

### Güvenlik

- Target commit branch adına değil sabit 40 karakter SHA'ya bağlı.
- Package version/revision metadata'sı target commit üzerinden doğrulanıyor.
- Mevcut DB backup, recovery manifest, atomic activation, managed-file ve tenant postcondition kontrolleri korunuyor.
- Production DB'ye bu çalışma sırasında doğrudan müdahale edilmedi.

### Test

- Yeni `tests/recovery-direct-097-121-136.cjs` testi direct recovery anchor'ını ve historical scan'den önce seçildiğini doğruluyor.
- Quality Gate'e eklendi.
