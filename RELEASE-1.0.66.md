# İlkAdım 1.0.66 — Kesin Kullanıcı Temizliği

- Önceki 024 migration yalnızca kullanıcıları pasife aldığı için kayıtlar veritabanında kalıyordu.
- Yeni `025_tek_super_admin_sert_temizlik.sql` migration'ı eklendi.
- Öğrenci, veli, öğretmen ve diğer kullanıcı hesapları fiziksel olarak temizlenir.
- Öğrenci/veli/öğretmen eşleştirmeleri, oturumlar ve kullanıcı rol bağlantıları temizlenir.
- Kurumlar ve sistem içerikleri korunur.
- Güncelleme sonunda `kullanicilar` tablosunda yalnızca bir aktif Süper Admin hesabı oluşturulur.
- Süper Admin e-postası: `m.oguzhanuyanik@gmail.com`
- Bu yeni migration ayrı numara taşıdığı için 024 daha önce çalışmış olsa bile 1.0.66 güncellemesinde mutlaka çalışır.
