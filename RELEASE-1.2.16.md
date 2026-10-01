# İlkAdım 1.2.16

## 1.1.97 → 1.2.1 immutable recovery bootstrap

### Hata analizi

Önceki güncelleme zincirindeki kritik kırılma, eski updater'ın hedef commit alanına gerçek 40 karakterlik Git SHA yerine `main` gibi değişken bir branch adı taşımasıydı. Bu nedenle kurulum paket indirme aşamasına gelmeden durabiliyor ve ara güncellemelerin uygulanması yarıda kalabiliyordu.

GitHub'da 1.1.97 → 1.2.1 source zinciri yeniden doğrulandı:

- 1.1.97 baseline: `be2651c5e375e3b54c0735d7283820a6ec9eb581`
- 1.2.1 source authority: `6a0f372871e6dbd2b71d2efef121fbf2dfb2f82c`
- 1.2.1 release revision: `15`
- 1.2.1 source tree: `9665e2754d02db81f8ca07a97b95506397103e1e`
- baseline → source commit sayısı: `30`

### Geliştirme

- 1.1.97 → 1.2.1 recovery hedefi source commit + source tree + release revision ile kilitlendi.
- Updater artık recovery hedef commitinin gerçek Git tree SHA'sını ayrıca doğruluyor.
- Mutable `main` recovery hedefi olarak kullanılmıyor.
- Yeni recovery package lock ve regression testi eklendi.
- Bu sürümden sonraki rescue bootstrap ayrı immutable commit olarak sabitlenecek.

### DB güvenliği

- 001–063 geçmişi rastgele yeniden çalıştırılmıyor.
- Yalnız 064 checkpoint recovery koşulları sağlanırsa uygulanıyor.
- Legacy kurum üyeliği dönüşümü staging + postcondition + rollback ile korunuyor.
- 065 tenant izolasyonu ve 066 schema guard zinciri korunuyor.
- Production veritabanına bu GitHub çalışması sırasında doğrudan müdahale edilmiyor.

## Rev 2 — immutable bootstrap re-anchor

- 1.1.97 rescue bootstrap artık 1.2.16 rev1 commitine sabitlendi: `ea5ddda3a90cdc0ace01729cee827a532d673fe9`.
- Rescue scripti mutable branch HEAD kullanmıyor.
- 1.2.1 recovery source authority değişmedi: commit `6a0f372871e6dbd2b71d2efef121fbf2dfb2f82c`, tree `9665e2754d02db81f8ca07a97b95506397103e1e`, revision 15.
