# İlkAdım 1.1.113

## 1.1.97 güncelleme kilidi
- Dolu legacy kurum_kullanicilari tablosu artık körlemesine DROP edilmez.
- Eski veli/öğretmen/öğrenci kimlikleri profil tablolarındaki kullanici_id ile doğrulanır.
- Yönetici kimliği önce yoneticiler.kullanici_id, yoksa yalnız doğrulanmış yonetici/super_admin kullanıcı rolü üzerinden çözülür.
- Çözülemeyen tek satırda hiçbir canlı tablo değiştirilmeden işlem durur.
- Yeni üyelikler ayrı staging tabloda oluşturulur ve sayısal olarak doğrulanır.
- Canlı tablo değişimi tek atomik RENAME TABLE ile yapılır.
- Eski tablo kurum_kullanicilari_legacy_197_backup adıyla korunur.
- Başka tablodan inbound FK varsa otomatik dönüşüm durur.
- 1.1.97 -> 1.1.98 rescue updater dönüşümü recovery migrationından önce çalıştırır.
- Aynı lossless onarım güncel updater çekirdeğine de eklendi.

## Yeni kalite matrisi
- Q1001–Q1500 arasında 500 yeni madde eklendi.
- 20 kritik madde uygulanmış, 480 madde plan statüsündedir.
- Toplam izlenebilir kalite/güncelleme kataloğu 1500 maddeye çıktı.

## Rev 2

- 1.1.93 tarihsel migration güvenlik testi, eski "dolu tabloysa her zaman dur" sözleşmesi yerine lossless staging + atomik swap + çözülemeyen satırda fail-closed sözleşmesini doğrulayacak şekilde güncellendi.
