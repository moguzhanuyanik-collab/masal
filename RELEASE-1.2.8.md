# İlkAdım 1.2.8

## 1.1.97 → 1.2.1 recovery zinciri kesin sıra doğrulaması

- Aktif zincir artık kesin sırayla doğrulanıyor: 1.1.98 → 1.1.99 → 1.1.100 → … → 1.1.117 → 1.2.1.
- 1.1.118 aktif zincirde yok.
- 1.1.119 recovery-only artifact olarak korunuyor ancak aktif güncelleme zincirinin basamağı sayılmıyor.
- Aynı sürümün ardışık revision commit'leri tek sürüm olarak normalize ediliyor.
- Bozuk sıra veya atlama fail-closed reddediliyor.

## Hata analizi

Önceki rescue kontrolü beklenen sürümleri tarihsel commit geçmişinde yalnızca bir alt dizi olarak arıyordu. Bu, 1.1.98 → 1.1.100 → 1.1.99 gibi bozuk bir sırada bile tüm sürümler daha sonra bulunduğu için zincirin başarılı kabul edilmesine izin verebilirdi.

1.2.8 ile aktif zincir exact-order olarak doğrulanıyor.
