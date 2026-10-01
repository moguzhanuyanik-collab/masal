# İlkAdım 1.2.15

## 1.1.97 → 1.2.1 functional source parity

### Hata analizi

GitHub geçmişi yeniden incelendiğinde 1.1.97 → 1.2.1 uygulama ağacının kaybolmadığı; doğrulanmış 1.2.1 source commitinin (`6a0f372871e6dbd2b71d2efef121fbf2dfb2f82c`) mevcut `main` tarihçesinin atası olduğu doğrulandı.

Ancak yalnız release/test isimlerinin korunması, geri kazanılan uygulama dosyalarının gerçekten aynı source authority'den geldiğini tek tek kanıtlamıyordu. Bu nedenle güncelleme hatasının ardından aynı fonksiyonların sessizce kaybolmasını yakalayacak daha sıkı parity kontrolü eklendi.

### Yapılan geliştirmeler

- 1.2.1 source authority'den geri kazanılan kritik uygulama ve migration dosyaları recovery evidence manifestine açıkça kaydedildi.
- CI, bu dosyaların current `main` içeriğini immutable 1.2.1 source commiti ile birebir karşılaştırıyor.
- Recovery evidence içindeki `source_tree` ve `parent_commit` değerleri gerçek Git metadata'sıyla doğrulanıyor.
- 1.2.14 recovery integrity testi gelecekteki 1.2.x hardening sürümlerinde kırılmayacak şekilde future-proof hale getirildi.
- Sürüm metadata, managed manifest ve CI aynı 1.2.15 release kimliğine hizalandı.

### Korunan functional kaynaklar

AdımBot kalıcı rate-limit, Activities/State CSRF, curriculum/report/V4 scope, öğretmen/veli tenant erişimi, kurum eşleştirme ve 064/065/066 migrationları 1.2.1 source authority ile birebir parity kontrolünden geçiyor.

Bu sürüm production veritabanına doğrudan müdahale etmez.

## 1.2.16 — Recovery chain ancestry lock

- 1.1.97 → 1.2.1 arasındaki 30 commitlik yeniden kurulmuş tarihçe immutable ancestry manifesti ile doğrulanıyor.
- 1.1.118 ve 1.1.120 aktif zincir dışında tutuluyor; 1.1.119 recovery-only kalıyor.
- 1.2.1 rev15 recovery authority olarak korunuyor.
