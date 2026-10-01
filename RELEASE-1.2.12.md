# İlkAdım 1.2.12

## 1.1.97 → 1.2.1 recovery hattı koruma sürümü

### Hata analizi

GitHub geçmişi yeniden incelendiğinde 1.1.97 tabanı ile doğrulanmış 1.2.1 kaynak ağacı arasında **30 commitlik** bir rebuild hattı bulunduğu doğrulandı.

Doğrulanmış kaynak ankrajı:

- 1.1.97: `be2651c5e375e3b54c0735d7283820a6ec9eb581`
- 1.2.1 rev15: `6a0f372871e6dbd2b71d2efef121fbf2dfb2f82c`

Aktif olarak belgelenmiş zincir:
`1.1.97 → 1.1.98 → 1.1.99 → 1.1.100 → 1.1.101 → 1.1.102 → 1.1.103 → 1.1.104 → 1.1.105 → 1.1.106 → 1.1.107 → 1.1.108 → 1.1.109 → 1.1.110 → 1.1.111 → 1.1.112 → 1.1.113 → 1.1.114 → 1.1.115 → 1.1.116 → 1.1.117 → 1.1.119 → 1.2.1`.

`1.1.118` ve `1.1.120` aktif zincire eklenmedi. `1.1.119` recovery-only sürüm olarak korunuyor.

### Yapılan geliştirme

- `RECOVERY-1.1.97-1.2.1-EVIDENCE.json` ile kaynak/temel commitleri ve belgelenmiş release zinciri kalıcı ankraj haline getirildi.
- Yeni regression testi, 1.1.97 commitinin 1.2.1 kaynak commitinin atası olduğunu doğruluyor.
- Aynı test, 1.2.1 kaynak commitinin güncel recovery ağacında hâlâ ancestor olduğunu doğruluyor.
- 1.1.97 → 1.2.1 arasındaki 30 commitlik kaynak zinciri doğrulanıyor.
- Tüm belgelenmiş ara release notlarının ve fonksiyonel rebuild artefact'ının ağaçta bulunduğu kontrol ediliyor.
- CI bu kontrolü her kalite kapısına dahil ediyor.
- Önceki fonksiyonel rebuild regression testi yeni 1.2.x sürümlerinde kırılmayacak şekilde future-proof yapıldı.

### Sonuç

Bu sürüm yeni uygulama özelliği eklemekten çok, **kaybolan güncellemelerin yeniden kurulmuş kaynak hattının bir daha sessizce kaybolmasını engelleyen koruma katmanıdır.**

Production veritabanına doğrudan müdahale edilmez.

## Rev 2 — final release-head re-anchor

- Release metadata, version ve managed manifest aynı 1.2.12 rev2 final ankrajında yeniden hizalanacak şekilde release-head sözleşmesi tamamlandı.
- Recovery lineage koruması bu final ankrajdan sonra değişmeden korunur.

## Rev 3 — CI revision-contract hardening

- Tarihsel regression testleri release revision değerini sabit 1'e bağlamayacak şekilde future-proof hale getirildi.
- Final release head yeniden tek metadata ankrajında sabitlenecek.
