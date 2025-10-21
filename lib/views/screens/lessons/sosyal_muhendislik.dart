// lib/views/screens/lessons/sosyal_muhendislik.dart
import 'package:flutter/material.dart';

final Map<String, dynamic> sosyalMuhendislikModule = {
  'id': 'sosyal-muhendislik',
  'title': 'Sosyal Mühendislik ve Oltalama (Detaylı)',
  'subtitle': 'Türler, teknik göstergeler, tespit, korunma, vaka ve quiz',
  'icon': Icons.psychology, // yoksa Icons.security kullan
  'lessons': [
    // 1) Giriş
    {
      'id': 'giris',
      'title': 'Giriş: Sosyal Mühendislik Nedir?',
      'duration': '8 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Tanım'},
            {
              'type': 'desc',
              'text':
                  'Sosyal mühendislik; ikna, korku veya acele ettirme gibi psikolojik taktiklerle kişileri yönlendirerek gizli bilgi/erişim elde etmeye çalışan saldırı yaklaşımıdır.'
            },
            {
              'type': 'desc',
              'text':
                  'Teknik savunmalar güçlü olsa bile, kullanıcı şifresini kendi eliyle verirse sistemler aşılabilir.'
            },
          ],
        },
      ],
    },

    // 2) Türler
    {
      'id': 'turler',
      'title': 'Sosyal Mühendislik Türleri',
      'duration': '12 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Telefon Dolandırıcılığı (Vishing)'},
            {
              'type': 'desc',
              'text':
                  'Saldırgan; banka görevlisi/polis/kurum personeli gibi davranıp acil durum yaratır, para/kimlik bilgisi ister.'
            },
            {'type': 'title', 'text': 'Sahte Kimlik ve Rol Yapma'},
            {'type': 'desc', 'text': 'IT personeli, kargo görevlisi veya müşteri temsilcisi kılığına girerek güven kazanır.'},
            {'type': 'title', 'text': 'Fiziksel Sosyal Mühendislik'},
            {'type': 'desc', 'text': 'Yetkisiz halde ofise sızma, masa üstü belgeleri inceleme, USB bırakma vb.'},
            {'type': 'title', 'text': 'Çevrimiçi Yöntemler'},
            {'type': 'desc', 'text': 'E-posta, SMS, sosyal medya mesajı, sahte siteler ve formlar.'},
          ],
        },
      ],
    },

    // 3) Oltalama (Phishing)
    {
      'id': 'phishing',
      'title': 'Oltalama (Phishing) Saldırıları',
      'duration': '14 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Phishing Mantığı'},
            {
              'type': 'desc',
              'text':
                  'Kullanıcıyı sahte e-posta/SMS/mesaj ve web formlarıyla bir linke tıklatıp kimlik bilgisi toplamak veya zararlı dosya indirtmek.'
            },
            {'type': 'bullet', 'text': 'Smishing (SMS), Vishing (telefon) alt türleridir.'},
            {'type': 'bullet', 'text': 'Spear-phishing: kişiselleştirilmiş, hedef odaklı oltalama.'},
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Ortak Özellikler'},
            {'type': 'bullet', 'text': 'Acele/tehdit/ödül vaadiyle karar baskısı oluşturma.'},
            {'type': 'bullet', 'text': 'Logo/şablon taklidi, sahte ama inandırıcı görsel dil.'},
            {'type': 'bullet', 'text': 'Kısa linkler veya maskeleme; görünen URL ≠ gerçek hedef.'},
            {'type': 'bullet', 'text': 'Makrolu ofis dosyaları, .exe/.js gibi zararlı ekler.'},
          ],
          'quizQuestion': {
            'question': 'Spear-phishing’i en iyi tanımlayan ifade hangisi?',
            'options': [
              'Rastgele çok sayıda kişiye aynı mesaj',
              'Hedefe özel bilgiyle kişiselleştirilmiş mesaj',
              'Sadece SMS ile yapılan oltalama',
              'Yalnızca telefonla yapılan dolandırıcılık'
            ],
            'correctIndex': 1,
            'explanation':
                'Spear-phishing belirli kişi/kurum hedeflenerek hazırlanan, kişiselleştirilmiş oltalamadır.'
          }
        },
      ],
    },

    // 4) Teknik Tespit: E-posta & URL göstergeleri
    {
      'id': 'teknik-tespit',
      'title': 'Teknik Tespit: Header, Link ve İçerik Analizi',
      'duration': '16 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'E-posta Başlıkları (Headers)'},
            {
              'type': 'bullet',
              'text': 'Gönderen adresi, Received zinciri, Return-Path, SPF/DKIM/DMARC sonuçlarını kontrol et.'
            },
            {
              'type': 'desc',
              'text':
                  'SPF/DKIM başarısızsa şüpheyi artır. Header zaman damgaları ve aktaran sunuculardaki tutarsızlıkları incele.'
            },
            {'type': 'title', 'text': 'Link/URL Kontrolleri'},
            {'type': 'bullet', 'text': 'Hover ile gerçek hedefi gör; punycode (xn--), IP ile doğrudan erişim, uzun ve rastgele query parametreleri.'},
            {'type': 'bullet', 'text': 'Typosquatting/homoglyph: mikr0soft vs microsoft gibi benzer yazımlar.'},
            {'type': 'title', 'text': 'Ek Dosyalar'},
            {'type': 'bullet', 'text': '.doc/.xls makroları, .exe/.scr/.js gibi yürütülebilirler — sandbox’ta analiz et.'},
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Sertifika ve WHOIS'},
            {
              'type': 'desc',
              'text':
                  'HTTPS tek başına güven değildir; sertifika sahibini ve CA’yı incele. WHOIS ile domain yaşı/kayıt geçmişine bak.'
            },
          ],
          'quizQuestion': {
            'question': 'Aşağıdakilerden hangisi oltalamada tipik bir teknik göstergedir?',
            'options': [
              'SPF/DKIM geçerli olması',
              'Görünen linkin hedefle uyuşmaması',
              'DNS’in çalışması',
              'E-postada görsel bulunması'
            ],
            'correctIndex': 1,
            'explanation':
                'Phishing’de sık görülen bulgu: görünen link metni ile gerçek yönlendirme URL’si farklıdır.'
          }
        },
      ],
    },

    // 5) Nasıl Fark Ederiz? (Hızlı kontrol listesi)
    {
      'id': 'nasil-fark-ederiz',
      'title': 'Nasıl Fark Ederiz? (Hızlı Kontrol Listesi)',
      'duration': '10 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'bullet', 'text': 'Header’larda SPF/DKIM/DMARC sonuçlarını doğrula.'},
            {'type': 'bullet', 'text': 'Hover ile URL’yi kontrol et; kısa linkleri çözümlü incele.'},
            {'type': 'bullet', 'text': 'Punycode/homoglyph ve taze kayıtlı domainleri işaretle.'},
            {'type': 'bullet', 'text': 'Ekleri sandbox’ta çalıştır; makroları otomatik açma.'},
            {'type': 'bullet', 'text': 'Şüpheli hash/URL’yi reputasyon servislerinde (kurum içi/VT) kontrol et.'},
            {'type': 'bullet', 'text': 'Kaynaktan bağımsız ikinci bir kanalla (resmi telefon) teyit al.'},
          ],
        },
      ],
    },

    // 6) Korunma: Bireysel + Kurumsal
    {
      'id': 'korunma',
      'title': 'Kendimizi Nasıl Koruruz?',
      'duration': '12 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Bireysel Önlemler'},
            {'type': 'bullet', 'text': 'Güçlü ve benzersiz parolalar; parola yöneticisi kullan.'},
            {'type': 'bullet', 'text': '2FA/MFA: Mümkünse uygulama/donanım anahtarı tercih et.'},
            {'type': 'bullet', 'text': 'Şüpheli link/eklere tıklama; özellikle makroları kapalı tut.'},
            {'type': 'title', 'text': 'Kurumsal Önlemler'},
            {'type': 'bullet', 'text': 'E-posta geçitleri, sandbox, SPF/DKIM/DMARC politikaları.'},
            {'type': 'bullet', 'text': 'EDR/AV + güncel yamalar (CVE’ler kapalı).'},
            {'type': 'bullet', 'text': 'Sürekli farkındalık eğitimleri ve oltalama simülasyonları.'},
          ],
        },
      ],
    },

    // 7) Gerçek Hayattan Örnekler
    {
      'id': 'ornekler',
      'title': 'Gerçek Hayattan Örnekler (Teknik Bakış)',
      'duration': '10 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Bankacılık & Kargo Temalı E-postalar'},
            {'type': 'desc', 'text': 'Amaç: Sahte giriş sayfasıyla kimlik bilgisi toplamak veya ekle zararlı indirtmek.'},
            {'type': 'desc', 'text': 'Phishing kit’leri: Hazır sahte formlar, basit arayüz ve toplama betikleri.'},
            {'type': 'desc', 'text': 'Spear-phishing için sosyal medya/LinkedIn profillerinden kişiselleştirme.'},
            {'type': 'desc', 'text': 'TLS kullanılsa dahi sertifika sahibinde tutarsızlıklar görülebilir.'},
            {'type': 'desc', 'text': 'Makrolu ofis dosyaları PowerShell ile ikincil yük (trojan/ransomware) çekebilir.'},
          ],
        },
      ],
    },

    // 8) Sözlük (özet)
    {
      'id': 'sozluk',
      'title': 'Kısa Sözlük',
      'duration': '7 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'bullet', 'text': 'Sosyal Mühendislik: Psikoloji odaklı saldırı tekniği.'},
            {'type': 'bullet', 'text': 'Phishing/Smishing/Vishing: E-posta/SMS/telefon ile oltalama.'},
            {'type': 'bullet', 'text': 'Spear-Phishing: Hedefe özel kişiselleştirilmiş oltalama.'},
            {'type': 'bullet', 'text': 'Credential Harvesting: Kimlik bilgilerini toplama.'},
            {'type': 'bullet', 'text': 'SPF/DKIM/DMARC: E-posta doğrulama protokolleri.'},
            {'type': 'bullet', 'text': 'Typosquatting/Homoglyph: Benzer yazımlarla sahte domain.'},
            {'type': 'bullet', 'text': 'Sandbox: İzole analiz ortamı.'},
            {'type': 'bullet', 'text': 'EDR: Uç noktada tespit ve müdahale sistemi.'},
          ],
        },
      ],
    },

    // 9) Değerlendirme (Quiz)
    {
      'id': 'quiz',
      'title': 'Değerlendirme (Quiz)',
      'duration': '12 dk',
      'steps': [
        {
          'type': 'info',
          'content': [{'type': 'title', 'text': 'Soru 1'}],
          'quizQuestion': {
            'question': 'Phishing’de en kritik hızlı kontrol hangisidir?',
            'options': [
              'Mesajdaki görsel kalitesi',
              'Gönderen adı (display name)',
              'Hover ile gerçek URL hedefinin kontrolü',
              'Mesajın emojili olup olmaması'
            ],
            'correctIndex': 2,
            'explanation': 'Görünen link ≠ gerçek hedef en yaygın göstergedir; hover ile anlaşılır.'
          }
        },
        {
          'type': 'info',
          'content': [{'type': 'title', 'text': 'Soru 2'}],
          'quizQuestion': {
            'question': 'Hangi eşleşme doğru?',
            'options': [
              'Vishing → SMS',
              'Smishing → Telefon',
              'Spear-phishing → Hedefe özel kişiselleştirme',
              'Typosquatting → Mobil operatör değiştirme'
            ],
            'correctIndex': 2,
            'explanation': 'Spear-phishing hedefe özel hazırlanır.'
          }
        },
        {
          'type': 'info',
          'content': [{'type': 'title', 'text': 'Soru 3'}],
          'quizQuestion': {
            'question': 'SPF/DKIM/DMARC sonuçları neye yarar?',
            'options': [
              'Sadece görsel kaliteyi artırır',
              'E-postanın geldiği domainin doğrulanmasına yardımcı olur',
              'Tarayıcıyı hızlandırır',
              'Dosya şifrelemeyi otomatik yapar'
            ],
            'correctIndex': 1,
            'explanation': 'E-posta göndericisinin doğrulanmasına destek olan protokollerdir.'
          }
        },
      ],
    },
  ],
};
