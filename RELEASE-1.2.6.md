# İlkAdım 1.2.6

## Güncelleme zinciri yeniden güvenli hale getirildi

### Hata analizi

1.2.1 sonrası updater çekirdeğinde tarihsel ara sürüm seçimi kaldırılmış ve her kontrolde doğrudan main dalının HEAD sürümü hedeflenmişti.

Bu davranış, kurulu sürümden daha yüksek ara sürümleri atlayabildiği için 1.1.97–1.2.1 recovery zincirinde daha önce yaşanan güncelleme probleminin aynı sınıfını yeniden oluşturabilecek durumdaydı.

### Düzeltme

- Updater artık GitHub'daki version.json / update-release.json commit geçmişini tarıyor.
- Kurulu sürümden sonraki en küçük sürüm/revision seçiliyor.
- 1.1.99 → 1.1.100 → 1.1.101 → ... şeklindeki zincir korunuyor.
- 1.1.119 → 1.2.1 → 1.2.2 → 1.2.3 → 1.2.4 → 1.2.5 → 1.2.6 geçişlerinde de aynı no-skip kuralı uygulanıyor.
- Tarihsel zincir güvenli biçimde çözülemezse updater latest/main sürümüne atlamıyor; güncellemeyi durduruyor.
- Release revision aynı sürüm içindeki revizyonlarda ayrıca dikkate alınıyor.
- Yeni CI regression testi ile doğrudan main HEAD'e atlama ve ara sürüm atlama davranışları kilitlendi.
- 1.2.3 zincir testi, artık commits?sha= tarihsel seçim mantığının gerçekten korunmasını zorunlu kılıyor.

### Amaç

Güncelleme sistemi sürüm numarası yükseldi diye veritabanı veya uygulama hazırlık adımlarını atlamayacak; her kurulum bir sonraki güvenli release kimliğine ilerleyecek.
