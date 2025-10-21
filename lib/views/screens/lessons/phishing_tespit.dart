import 'package:flutter/material.dart';

/// "Phishing Tespit Yöntemleri" modülü
/// Kaynaklar: Eğitim PDF içeriği ve soru seti (quiz) — modül metinleri ve sorular referans alınmıştır.

final Map<String, dynamic> phishingTespitModule = {
  'id': 'phishing-detection',
  'title': 'Phishing Tespit Yöntemleri',
  'subtitle': 'Türler, göstergeler ve tespit/önleme pratikleri',
  'icon': Icons.phishing, // Material 3 varsa; yoksa Icons.shield/Icons.security kullan
  'lessons': [
    // 1) Phishing Nedir?
    {
      'id': 'phishing-nedir',
      'title': 'Phishing Nedir?',
      'duration': '8 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Phishing (Oltalama) Nedir?'},
            {'type': 'desc', 'text': 'Kullanıcıları kandırıp gizli bilgilerini (hesap, şifre, kart vb.) ele geçirmeyi amaçlayan sosyal mühendislik tabanlı saldırılar.'},
            {'type': 'desc', 'text': 'Genellikle e-posta, SMS, sahte web siteleri veya sosyal medya mesajlarıyla yapılır.'},
            {'type': 'bullet', 'text': 'Aciliyet/tehdit hissi verme ("Hesabınız kapanacak!")'},
            {'type': 'bullet', 'text': 'Resmi kurum/banka/servisleri taklit etme'},
            {'type': 'bullet', 'text': 'Şüpheli linkler ve dil-imla hataları'},
            {'type': 'bullet', 'text': 'Zararlı ek dosyalar (malware)'}
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Gerçek Hayattan Senaryolar'},
            {'type': 'bullet', 'text': 'Banka/finans kurumlarını taklit eden e-postalar'},
            {'type': 'bullet', 'text': 'E-devlet/kamu kurumu kimliğiyle sahte bildirim'},
            {'type': 'bullet', 'text': 'Kargo/çekiliş/hediye vaatleri'},
            {'type': 'bullet', 'text': 'Sahte oturum açma sayfalarıyla hesap çalma'}
          ],
        },
      ],
    },

    // 2) Türler
    {
      'id': 'phishing-turleri',
      'title': 'Phishing Türleri',
      'duration': '10 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Spear Phishing'},
            {'type': 'desc', 'text': 'Belirli kişi/kuruma özel hedefleme; kurban hakkında ön bilgi toplanır, mesaj kişiselleştirilir.'},
            {'type': 'desc', 'text': 'Örn: CFO’dan geliyormuş gibi görünen para transfer talebi.'},
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Whaling (CEO Fraud)'},
            {'type': 'desc', 'text': 'CEO/CFO gibi üst düzey hedeflere yönelik; finansal kazanç ya da kritik bilgi peşinde.'},
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Clone Phishing'},
            {'type': 'desc', 'text': 'Daha önce gelmiş gerçek bir e-postanın kopyalanıp link/ek kısmının kötüleştirilmesi.'},
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Smishing & Vishing'},
            {'type': 'desc', 'text': 'Smishing: SMS ile; Vishing: telefon görüşmesiyle yapılan oltalama.'},
          ],
        },
      ],
    },

    // 3) E-posta Tabanlı Tespit Teknikleri
    {
      'id': 'email-tespit',
      'title': 'E-posta Tabanlı Tespit',
      'duration': '12 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Gönderen ve Başlık (Header) Analizi'},
            {'type': 'bullet', 'text': 'Gönderen adresindeki küçük sahtecilikler (paypaI vs paypal)'},
            {'type': 'bullet', 'text': 'Received zinciri, Return-Path, SPF/DKIM/DMARC sonuçları'},
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Link ve İçerik Göstergeleri'},
            {'type': 'bullet', 'text': 'Görünen link ≠ gerçek yönlendirme (hover ile kontrol)'},
            {'type': 'bullet', 'text': 'Dil-imla hataları, aciliyet/tehdit söylemi'},
            {'type': 'bullet', 'text': 'Şüpheli ekler: .exe, .scr, .zip, .js, .docm'},
          ],
        },
      ],
    },

    // 4) Teknik Araçlar & Otomatik Tespit
    {
      'id': 'teknik-araclar',
      'title': 'Teknik Araçlar ve Otomasyon',
      'duration': '14 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'E-posta Güvenlik Katmanı'},
            {'type': 'desc', 'text': 'Spam/Phish kuralları, ek tarama, SPF/DKIM/DMARC doğrulama, karantina.'},
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'URL/Domain Analizi'},
            {'type': 'bullet', 'text': 'WHOIS & domain yaşı, Passive DNS geçmişi'},
            {'type': 'bullet', 'text': 'TLS/sertifika durumu, reputation sorguları'},
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Sandboxing ve Statik Analiz'},
            {'type': 'desc', 'text': 'Ek/URL davranış analizi (dinamik) + YARA/hash/vb. statik kontroller.'},
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'IDS/EDR, SIEM Korelasyonu, TIP/IOC'},
            {'type': 'desc', 'text': 'Çok kaynaktan log toplanıp korelasyon; IOC zenginleştirme; otomatik aksiyonlar.'},
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'ML/İstatistiksel Yaklaşımlar'},
            {'type': 'desc', 'text': 'Metin/URL özellikleri, davranış anomali tespiti; düzenli yeniden eğitim ve etiket kalitesi önemli.'},
          ],
        },
      ],
    },

    // 5) Değerlendirme (Quiz)
    {
      'id': 'quiz',
      'title': 'Değerlendirme (Quiz)',
      'duration': '10 dk',
      'steps': [
        {
          'type': 'info',
          'content': [{'type': 'title', 'text': 'Soru 1'}],
          'quizQuestion': {
            'question': 'Phishing saldırısının temel amacı nedir?',
            'options': [
              'Sistemin performansını artırmak',
              'Kullanıcılardan gizli bilgi (şifre, kart vb.) elde etmek',
              'Web sitesinin tasarımını değiştirmek',
              'DNS kayıtlarını temizlemek'
            ],
            'correctIndex': 1,
            'explanation': 'Hedef, kullanıcıları kandırıp gizli bilgileri elde etmektir.'
          }
        },
        {
          'type': 'info',
          'content': [{'type': 'title', 'text': 'Soru 2'}],
          'quizQuestion': {
            'question': 'Spear-phishing’in belirgin özelliği nedir?',
            'options': [
              'Rastgele binlerce kişiye aynı mesaj',
              'Hedefe özel bilgi ile kişiselleştirilmiş mesaj',
              'Sadece SMS ile yapılması',
              'Sadece yöneticileri hedeflemesi'
            ],
            'correctIndex': 1,
            'explanation': 'Kişiye/kuruma özel kişiselleştirme yapılır.'
          }
        },
        {
          'type': 'info',
          'content': [{'type': 'title', 'text': 'Soru 3'}],
          'quizQuestion': {
            'question': 'Clone phishing nedir?',
            'options': [
              'Telefonla oltalama',
              'Gerçek bir e-postanın kopyalanıp link/ekinin kötüleştirilmesi',
              'Kısa URL servislerini kötüye kullanma',
              'Kurumsal logonun çalınması'
            ],
            'correctIndex': 1,
            'explanation': 'Önceden alınmış e-posta kopyalanır, zararlı içerik eklenir.'
          }
        },
        {
          'type': 'info',
          'content': [{'type': 'title', 'text': 'Soru 4'}],
          'quizQuestion': {
            'question': 'Header analizinde özellikle kontrol edilmeyen alan hangisi?',
            'options': [
              'Received zinciri',
              'Return-Path',
              'SPF/DKIM/DMARC sonuçları',
              'E-posta gövdesindeki görselin renk paleti'
            ],
            'correctIndex': 3,
            'explanation': 'Renk paleti header analizi kapsamında değildir.'
          }
        },
        {
          'type': 'info',
          'content': [{'type': 'title', 'text': 'Soru 5'}],
          'quizQuestion': {
            'question': 'SPF kaydı neyi doğrular?',
            'options': [
              'E-posta içeriğinin doğruluğu',
              'Gönderen sunucunun yetkili IP olup olmadığı',
              'Alıcı posta kutusu kapasitesi',
              'E-postadaki link güvenliği'
            ],
            'correctIndex': 1,
            'explanation': 'SPF, gönderen yetkili IP’den mi geldiğini doğrular.'
          }
        },
        {
          'type': 'info',
          'content': [{'type': 'title', 'text': 'Soru 6'}],
          'quizQuestion': {
            'question': 'Aşağıdakilerden hangisi smishing’dir?',
            'options': [
              'Sahte banka e-postası',
              'Telefonla kimlik avı',
              'SMS ile gönderilen sahte bankacılık bildirimi',
              'Sosyal medyada sahte kampanya'
            ],
            'correctIndex': 2,
            'explanation': 'Smishing = SMS tabanlı oltalama.'
          }
        },
        {
          'type': 'info',
          'content': [{'type': 'title', 'text': 'Soru 7'}],
          'quizQuestion': {
            'question': 'Sandboxing’in en önemli faydası nedir?',
            'options': [
              'E-postaları anında silmek',
              'Şüpheli dosyaları izole ortamda çalıştırıp davranış analizi yapmak',
              'WHOIS bilgilerini değiştirmek',
              'Domain kayıt süresini azaltmak'
            ],
            'correctIndex': 1,
            'explanation': 'Dinamik analizle davranış görülür.'
          }
        },
        {
          'type': 'info',
          'content': [{'type': 'title', 'text': 'Soru 8'}],
          'quizQuestion': {
            'question': 'Görünen link ile gerçek hedef farklıysa bu en çok hangi tekniğe işaret eder?',
            'options': [
              'Vishing',
              'Link obfuscation / disguise',
              'Clone phishing',
              'DNS cache temizleme'
            ],
            'correctIndex': 1,
            'explanation': 'Görünür metin ≠ gerçek URL ise maskeleme söz konusudur.'
          }
        },
        {
          'type': 'info',
          'content': [{'type': 'title', 'text': 'Soru 9'}],
          'quizQuestion': {
            'question': 'SIEM’in önemli işlevi nedir?',
            'options': [
              'E-posta görsellerini düzeltmek',
              'Çok kaynaktan log toplayıp korelasyonla çok-kanallı göstergeleri tespit etmek',
              'Domain kayıtlarını güncellemek',
              'Kullanıcı şifrelerini sıfırlamak'
            ],
            'correctIndex': 1,
            'explanation': 'Korelasyon ve alarm üretimi.'
          }
        },
        {
          'type': 'info',
          'content': [{'type': 'title', 'text': 'Soru 10'}],
          'quizQuestion': {
            'question': 'Phishing tespitinde ML kullanırken dikkat edilmesi gereken?',
            'options': [
              'Modeli tek günde eğitmek yeterlidir',
              'Etiket kalitesi ve bias yönetimi gerekir',
              'ML hiç false positive üretmez',
              'ML’nin sandbox ile entegrasyonu yasak'
            ],
            'correctIndex': 1,
            'explanation': 'Etiket kalitesi/bias kritik; periyodik yeniden eğitim gerekir.'
          }
        },
      ],
    },
  ],
};
