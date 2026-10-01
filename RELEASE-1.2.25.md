# İlkAdım 1.2.25

## Öğretmen sorularında doğru cevap kilidi

Bu sürüm, öğrencinin öğretmen sorusunu doğru tamamladıktan sonra sonucu yeniden yanlış cevaba çevirebilmesi tutarsızlığını kapatır.

### Sorun

Öğretmen sorularında öğrenci:

1. Soruyu doğru cevaplayabiliyor,
2. Yıldız ödülünü kazanabiliyor,
3. Daha sonra aynı soruyu yeniden cevaplayıp yanlış seçenek gönderebiliyordu.

Bu durumda:

- yıldız ödülü kazanılmış kalıyor,
- fakat `ogretmen_icerik_cevaplari` son cevabı yanlış gösterebiliyor,
- öğretmen raporunda öğrenci yanlış görünürken ödül geçmişi doğru tamamlandığını gösteriyordu.

### Yeni davranış

Bir öğrenci bir öğretmen sorusunu ilk kez doğru tamamladığında sonuç artık **final** kabul edilir.

Sonraki cevap denemelerinde:

- seçilen doğru cevap değişmez,
- `dogru=1` değeri korunur,
- deneme sayısı artmaz,
- cevap tarihi değiştirilmez,
- yeni yıldız ödülü verilmez.

### Backend koruması

`oi_answer_question()` fonksiyonuna isteğe bağlı `alreadyCompleted` çıktısı eklendi.

Fonksiyon mevcut cevabın zaten doğru olduğunu görürse veritabanını değiştirmeden sonucu korur.

Ayrıca upsert sorgusu da savunmalı hale getirildi:

- doğru sonuç varsa seçili cevap korunur,
- deneme sayısı korunur,
- cevap tarihi korunur,
- doğru durum tekrar yanlışa dönemez.

Bu koruma yalnız arayüze güvenmez; doğrudan POST veya yarış durumlarında da doğru sonucu bozmayı engeller.

### Öğrenci arayüzü

Öğrenci doğru tamamladığı soruda artık cevap formunu görmez.

Yerine:

- kilit simgesi,
- **Bu soruyu doğru tamamladın**
- **Doğru sonucun ve kazandığın yıldız korunuyor**

mesajı gösterilir.

Seçenekler salt okunur olarak gösterilir ve yeniden gönderim butonu kaldırılır.

Yanlış cevaplanan soru ise doğruya ulaşana kadar tekrar denenebilir.

### Yıldız tutarlılığı

İlk doğru cevapta yıldız ödülü mevcut tek-seferlik ödül mekanizmasıyla verilmeye devam eder.

Doğru tamamlanmış soruya sonraki çağrılar:

- 0 yeni yıldız döndürür,
- yeni ödül kaydı oluşturmaz.

### Test

Yeni testler:

- `tests/teacher-question-correct-lock-150.cjs`
- `tests/teacher-question-correct-lock-db-150.php`

MariaDB testi:

1. İlk yanlış cevabı kaydeder.
2. Deneme sayısını 1 olarak doğrular.
3. İkinci doğru cevabı kaydeder.
4. Deneme sayısını 2 olarak doğrular.
5. İlk doğru cevapta yıldızı bir kez verir.
6. Doğru tamamlandıktan sonra yeniden yanlış cevap gönderir.
7. Doğru seçeneğin değişmediğini doğrular.
8. Doğru durumunun bozulmadığını doğrular.
9. Deneme sayısının artmadığını doğrular.
10. İkinci yıldız ödülü oluşmadığını doğrular.
