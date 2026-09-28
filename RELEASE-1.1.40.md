# İlkAdım v1.1.40

## Güncelleme merkezi yetki doğrulaması

- Güncelleme sayfasında doğrulanmış oturum ve etkin süper admin rolü zorunludur.
- Eski yetki tablosu kontrolü veya veritabanı hatası nedeniyle doğrulama atlanamaz.
- Girişsiz AJAX isteği 401, yetkisiz rol 403 yanıtı alır.
- Canlı kurulum yapılmadı. Öğrenci HTML/CSS değiştirilmedi.

## Doğrulama

- PHP 8.3 söz dizimi denetimi: başarılı.
- Canlı süper admin/yönetici/girişsiz oturum testi: kurulumdan sonra yapılmalıdır.

Taban sürüm: v1.1.39
