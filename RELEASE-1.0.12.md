# İlkAdım V1.0.12

Bu sürüm iki konuyu tamamlar:

1. Öğrenci hesabı / SQL onarımı
- ogrenciler tablosu yoksa oluşturulur.
- Varsa eksik giriş ve profil kolonları tamamlanır.
- ogrenci_oturum_tokenlari yoksa oluşturulur.
- Test hesap her güncellemede kontrol edilir:
  - E-posta: masal@gmail.com
  - Şifre: 12345678
- Şifre veritabanında password_hash ile saklanır.

2. Tek önceki sürüm yedeği
- Sunucuda yalnızca storage/backups/onceki_surum.zip tutulur.
- Yeni yedek başarıyla oluşmadan mevcut yedek silinmez.
- Eski pre_*.zip yedekleri temizlenir.
- GitHub deposuna yedek gönderilmez.

CSS ve mevcut görseller değiştirilmez.
