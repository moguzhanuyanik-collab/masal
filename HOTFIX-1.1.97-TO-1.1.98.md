# 1.1.97 → 1.1.98 Güncelleme Kurtarma

## Neden

1.1.97 updater, hedef 1.1.98 paketindeki yeni kodu çalıştırmadan önce
`repair_legacy_institution_membership_schema()` çağırır. Eski
`kurum_kullanicilari` tablosunda veri varsa veri kaybını önlemek için kurulum durur.

## Güvenli köprü

Önce sadece kontrol:

```bash
php tools/repair-1.1.97-memberships.php --check
```

Kontrol temizse uygula:

```bash
php tools/repair-1.1.97-memberships.php --apply
```

Araç:
- yalnız kurulu sürüm tam olarak 1.1.97 ise çalışır,
- tüm legacy satırları mutation başlamadan önce doğrular,
- öğrenci/veli/öğretmen profil id'lerini gerçek `kullanici_id` değerine çevirir,
- yöneticiyi yalnız doğrulanabilir kullanıcı/rol eşleşmesinde kabul eder,
- tek çözümsüz kayıt varsa hiçbir tabloyu değiştirmez,
- yeni tabloyu ayrı oluşturur ve sayımı doğrular,
- eski tabloyu `kurum_kullanicilari_legacy_backup_1_1_97` adıyla korur,
- son geçişi atomik `RENAME TABLE` ile yapar.

Ardından panelden 1.1.98 güncellemesini yeniden çalıştır.

## Rollback

1.1.98 henüz kurulmadıysa:

```bash
php tools/rollback-1.1.97-memberships.php
```
