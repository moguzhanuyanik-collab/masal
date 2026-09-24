# İlkAdım v1.1.25

## Tamamlanan ders adımlarını atlama
- Ders/soru verisi değiştirilmez; soru, seçenek veya doğru cevap alanları boşaltılmaz.
- Mevcut öğrenci state'indeki `steps` ve MySQL `ogrenci_ilerleme` tablosundaki tamamlanan adımlar yalnızca ayrı bir tamamlanma listesi olarak yayınlanır.
- Ders içindeki `.lesson-step` kartları mevcut sıralarıyla eşleştirilir.
- Öğrenci daha önce tamamladığı bir çalışma kartına dokunursa o soru tekrar açılmaz.
- Aynı derste sonraki tamamlanmamış çalışma varsa doğrudan ona geçilir.
- Yanlış cevaplanmış fakat tamamlanmamış adımlar engellenmez.

## Güvenlik / kapsam
- v1.1.24'te çalışan ders ve soru verisi biçimi aynen korunur.
- Güncelleme ekranı değiştirilmedi.
- `app-runtime.js` değiştirilmedi.
- `src/bootstrap.php` değiştirilmedi.
- Veritabanı şeması ve migration değiştirilmedi.
- CSS, HTML ekran yapısı, logo, ikon, resim ve AdımBot görselleri değiştirilmedi.

Taban sürüm: v1.1.24
