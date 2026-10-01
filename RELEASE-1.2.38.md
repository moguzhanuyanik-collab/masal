# İlkAdım 1.2.38

## Ticari Finans / Sözleşme / Tahsilat Merkezi

Bu sürüm, İlkAdım'ın kurumsal satış sonrası operasyonu için sözleşme, tahsilat, vade ve lisans yenileme takibini ekler.

### Yeni: Ticari Finans

Süper Admin'e özel yeni sayfa:

`ticari-finans.php`

Buradan:

- kurum sözleşmesi oluşturulabilir,
- sözleşme paketle ilişkilendirilebilir,
- sözleşme numarası tutulabilir,
- başlangıç / bitiş / vade tarihi kaydedilebilir,
- toplam sözleşme tutarı ve para birimi izlenebilir,
- kısmi tahsilat girilebilir,
- ödeme yöntemi ve dekont / referans no tutulabilir,
- hatalı tahsilat audit izi korunarak iptal edilebilir,
- kalan bakiye otomatik hesaplanabilir.

### Finans Özeti

TRY, USD ve EUR ayrı ayrı izlenir.

Her para birimi için:

- sözleşme toplamı,
- tahsil edilen,
- kalan bakiye

gösterilir.

Farklı para birimleri tek bir toplamda birleştirilmez.

### Tahsilat Güvenliği

Tahsilat kaydı fiziksel olarak silinmez.

Hatalı bir tahsilat:

- `iptal` durumuna alınır,
- iptal nedeni kaydedilir,
- iptal tarihi tutulur,
- audit kaydı oluşturulur.

Kalan bakiyeyi aşan tahsilat engellenir.

Sözleşmede aktif tahsilat varken:

- toplam tutar tahsil edilenin altına indirilemez,
- para birimi değiştirilemez.

Sözleşme tamamen tahsil edildiğinde otomatik `tamamlandi` durumuna geçer.

Son tahsilatlardan biri iptal edilip tekrar bakiye oluşursa sözleşme yeniden `aktif` duruma döner.

### Lisans Yenileme Radar

Aktif / deneme lisanslarında bitiş tarihine 30 gün veya daha az kalan kurumlar listelenir.

Ayrıca süresi geçmiş fakat hâlâ aktif/deneme durumda duran lisanslar açıkça uyarı olarak görünür.

Bu alan satış ekibinin yenileme takibini kaçırmaması için tasarlanmıştır.

### Yeni Migration

`073_ticari_finans_ve_tahsilat.sql`

Yeni tablolar:

- `kurum_sozlesmeleri`
- `kurum_tahsilatlari`

### Hukuki / Mali Sınır

Bu özellik resmi e-Fatura veya e-Arşiv belgesi üretmez.

Sistem bu sürümde satış ve tahsilat takibi yapar. Resmi belge üretimi ileride yetkili e-Belge / ödeme sağlayıcısı entegrasyonuyla ayrı geliştirilmelidir.

### Test

Yeni testler:

- `tests/commercial-finance-163.cjs`
- `tests/commercial-finance-db-163.php`

MariaDB testi:

1. sözleşme oluşturmayı,
2. kısmi tahsilatı,
3. fazla tahsilat engelini,
4. tam ödeme sonrası otomatik kapanışı,
5. tutarı tahsil edilenin altına düşürme engelini,
6. para birimi değiştirme engelini,
7. tahsilat iptalinde audit-history davranışını,
8. bakiye geri geldiğinde sözleşmenin yeniden açılmasını,
9. finans özetini,
10. yaklaşan / süresi geçmiş lisans yenileme radarını

doğrular.
