# İlkAdım v1.1.38

## Güvenli sıralı güncelleme takibi

Bu sürüm v1.1.37 ile eklenen sıralı güncelleme zincirini tamamlar.

### Davranış

- Sistem kurulu sürümden sonraki en küçük sürümü bulur.
- Ara sürüm güvenli biçimde belirlenemiyorsa en son `main` sürümüne atlamaz.
- Böylece örneğin 1.1.5 kurulmadan 1.1.8'e geçmeye çalışmaz.
- Bir sürüm başarıyla kurulduktan sonra GitHub tekrar kontrol edilir.
- Sonraki sürüm varsa aynı güncelleme ekranında sıradaki sürüm olarak gösterilir.

### Örnek

Kurulu sürüm: 1.1.5

GitHub'da:
- 1.1.6
- 1.1.7
- 1.1.8

Akış:
1. 1.1.6 kurulur.
2. Kurulum tamamlanınca 1.1.7 sıradaki güncelleme olarak görünür.
3. 1.1.7 kurulunca 1.1.8 görünür.
4. Ara sürüm tespit edilemezse sistem doğrudan en son sürüme atlamaz.

### Tasarım güvenliği

- Güncelleme ekranının HTML/CSS görünümü değiştirilmedi.
- Öğrenci ekranı ve öğrenci tasarımı değiştirilmedi.
- Logo, ikon, görseller ve AdımBot değiştirilmedi.
- İçerik paketlerine dokunulmadı.

Taban sürüm: v1.1.37
