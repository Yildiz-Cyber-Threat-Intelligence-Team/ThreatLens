// lib/views/screens/lessons/web_temelleri.dart
import 'package:flutter/material.dart';

final Map<String, dynamic> webTemelleriModule = {
  'id': 'web-temelleri',
  'title': 'Web Temelleri (Detaylı)',
  'subtitle': 'WWW, Internet, DNS, HTTP/HTTPS, Tarayıcı İşleyişi, Güvenlik, Performans',
  'icon': Icons.language,
  'lessons': [
    {
      'id': 'giris-www',
      'title': 'WWW’ye Giriş ve Tarihçe',
      'duration': '10 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'World Wide Web (WWW) Nedir?'},
            {'type': 'desc', 'text': 'WWW; hiperlinklerle birbirine bağlanan sayfalardan oluşan küresel bilgi sistemidir.'},
            {'type': 'bullet', 'text': 'Temel taşlar: HTML, URL, HTTP'},
            {'type': 'bullet', 'text': '1989–1991: Tim Berners-Lee (CERN) → ilk web sunucusu ve istemcisi'},
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Neden WWW?'},
            {'type': 'desc', 'text': 'Heterojen sistemler arasında bilgi paylaşımını kolaylaştırmak ve evrensel erişim sağlamak.'},
          ],
          'quizQuestion': {
            'question': 'WWW’in üç temel bileşeni aşağıdakilerden hangisidir?',
            'options': ['HTTP, FTP, SSH', 'HTML, URL, HTTP', 'SMTP, DNS, IP', 'JSON, XML, YAML'],
            'correctIndex': 1,
            'explanation': 'Web’in omurgası HTML (sunum), URL (adresleme), HTTP (iletişim).'
          }
        },
      ],
    },

    {
      'id': 'internet-vs-web',
      'title': 'Internet vs Web',
      'duration': '6 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Fark Nedir?'},
            {'type': 'desc', 'text': 'Internet; cihazların bağlı olduğu ağ(lar) altyapısıdır. Web; bu altyapı üzerinde çalışan hizmettir.'},
            {'type': 'bullet', 'text': 'Internet: IP, TCP/UDP, yönlendirme, omurga'},
            {'type': 'bullet', 'text': 'Web: HTTP/HTTPS, tarayıcılar, web sunucuları'},
          ],
          'quizQuestion': {
            'question': 'Aşağıdakilerden hangisi Web’i en iyi açıklar?',
            'options': [
              'Fiziksel kabloları ve router’ları kapsayan altyapı',
              'Internet üstünde çalışan bir hizmet',
              'E-posta protokolü',
              'Dosyaları eşler arası paylaşım ağı'
            ],
            'correctIndex': 1,
            'explanation': 'Web, internet altyapısı üzerinde çalışan bir uygulama/hizmet katmanıdır.'
          }
        },
      ],
    },

    {
      'id': 'uri-url',
      'title': 'URI, URL ve Parçaları',
      'duration': '8 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'URI ve URL'},
            {'type': 'desc', 'text': 'URI bir kaynağı tanımlar; URL o kaynağın nerede ve nasıl erişileceğini belirtir.'},
            {'type': 'bullet', 'text': 'Şema (scheme): https'},
            {'type': 'bullet', 'text': 'Host: www.example.com, Port: 443'},
            {'type': 'bullet', 'text': 'Path: /docs, Query: ?q=abc, Fragment: #bolum1'},
          ],
        },
      ],
    },

    {
      'id': 'dns-derin',
      'title': 'DNS Derinlemesine',
      'duration': '12 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'DNS Nedir?'},
            {'type': 'desc', 'text': 'İnsan-okunur alan adlarını IP adreslerine çeviren hiyerarşik ve dağıtık sistem.'},
            {'type': 'bullet', 'text': 'Kayıt türleri: A/AAAA, CNAME, MX, TXT, NS, SRV'},
            {'type': 'bullet', 'text': 'TTL, Özyinelemeli (recursive) ve yinelemeli (iterative) sorgular'},
            {'type': 'bullet', 'text': 'Çözüm zinciri: Root → TLD → Yetkili (Authoritative)'},
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'CNAME vs A'},
            {'type': 'desc', 'text': 'CNAME bir ismi başka bir isme yönlendirir; A kaydı alan adını IPv4’e çözer.'},
          ],
          'quizQuestion': {
            'question': 'example.com → cdn.example.net eşlemesi için hangi kayıt uygundur?',
            'options': ['A', 'AAAA', 'CNAME', 'TXT'],
            'correctIndex': 2,
            'explanation': 'CNAME, alan adını başka bir alan adına yönlendirir.'
          }
        },
      ],
    },

    {
      'id': 'http-temel',
      'title': 'HTTP Temelleri',
      'duration': '14 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'İstek/Yanıt Modeli'},
            {'type': 'desc', 'text': 'Tarayıcı (istemci) → Request; Sunucu → Response; Header + Body yapısı.'},
            {'type': 'bullet', 'text': 'Yöntemler: GET, POST, PUT, DELETE, PATCH, HEAD, OPTIONS'},
            {'type': 'bullet', 'text': 'Durum kodları: 1xx (Bilgi), 2xx (Başarılı), 3xx (Yönlendirme), 4xx (İstemci), 5xx (Sunucu)'},
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Sık Görülen Başlıklar (Headers)'},
            {'type': 'bullet', 'text': 'Content-Type, Accept, Authorization, User-Agent'},
            {'type': 'bullet', 'text': 'Cache-Control, ETag, Last-Modified'},
            {'type': 'bullet', 'text': 'Location (3xx yönlendirmede), Set-Cookie'},
          ],
          'quizQuestion': {
            'question': 'Kalıcı yönlendirme için en uygun durum kodu hangisidir?',
            'options': ['200', '301', '404', '500'],
            'correctIndex': 1,
            'explanation': '301 “Moved Permanently” kalıcı yönlendirmedir.'
          }
        },
      ],
    },

    {
      'id': 'https-tls',
      'title': 'HTTPS ve TLS',
      'duration': '12 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'HTTPS Nedir?'},
            {'type': 'desc', 'text': 'HTTP’nin TLS ile şifrelenmiş halidir; gizlilik, bütünlük ve kimlik doğrulama sağlar.'},
            {'type': 'bullet', 'text': 'Sertifikalar, CA zinciri, SNI'},
            {'type': 'bullet', 'text': 'TLS el sıkışması (handshake) ve anahtar değişimi (ECDHE vb.)'},
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'HSTS & Güvenlik'},
            {'type': 'desc', 'text': 'HSTS: Tarayıcıyı daima HTTPS kullanmaya zorlar, SSL strip saldırılarını azaltır.'},
          ],
          'quizQuestion': {
            'question': 'HTTPS’in HTTP’ye göre en önemli avantajı nedir?',
            'options': [
              'Daha hızlı istek/yanıt',
              'İçeriğin şifrelenmesi ve kimlik doğrulama',
              'DNS kayıtlarının otomatik güncellenmesi',
              'Port kullanımını azaltması'
            ],
            'correctIndex': 1,
            'explanation': 'TLS ile veri şifrelenir ve sunucu kimliği doğrulanır.'
          }
        },
      ],
    },

    {
      'id': 'cookies-sessions',
      'title': 'Cookie, Oturum ve Kimlik Doğrulama',
      'duration': '10 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Cookies & Sessions'},
            {'type': 'desc', 'text': 'Sunucunun istemcide küçük veri saklayarak oturum ve tercihleri sürdürmesi.'},
            {'type': 'bullet', 'text': 'HttpOnly, Secure, SameSite (Lax/Strict/None) nitelikleri'},
            {'type': 'bullet', 'text': 'Session-ID, JWT, Refresh Token akışı'},
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Kimlik Doğrulama Akışları'},
            {'type': 'bullet', 'text': 'Form login, OAuth 2.0, OpenID Connect'},
            {'type': 'bullet', 'text': 'Token yenileme, erişim kapsamları (scopes)'},
          ],
          'quizQuestion': {
            'question': 'XSS’e karşı çerezleri korumada en etkili nitelik hangisidir?',
            'options': ['Secure', 'HttpOnly', 'SameSite=None', 'Domain'],
            'correctIndex': 1,
            'explanation': 'HttpOnly çerezlerin JS tarafından okunmasını engeller (XSS etkisini azaltır).'
          }
        },
      ],
    },

    {
      'id': 'sop-cors',
      'title': 'Same-Origin Policy ve CORS',
      'duration': '9 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Same-Origin Policy (SOP)'},
            {'type': 'desc', 'text': 'Protokol + host + port üçlüsü aynı değilse, tarayıcı erişimi kısıtlar.'},
            {'type': 'bullet', 'text': 'Çapraz site talepleri kısıtlanır (XSS/CSRF riskleri azaltılır).'},
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'CORS'},
            {'type': 'desc', 'text': 'Sunucunun belirli kökenlere erişim izni vermesini sağlayan başlıklar setidir.'},
            {'type': 'bullet', 'text': 'Access-Control-Allow-Origin, Methods, Headers'},
            {'type': 'bullet', 'text': 'Preflight (OPTIONS) istekleri'},
          ],
          'quizQuestion': {
            'question': 'CORS’u kim uygular?',
            'options': ['Tarayıcı', 'Sunucu donanımı', 'DNS çözümleyici', 'Router'],
            'correctIndex': 0,
            'explanation': 'CORS, tarayıcı tarafında zorlanan bir güvenlik politikasıdır; sunucu başlıklarla izin verir.'
          }
        },
      ],
    },

    {
      'id': 'browser-pipeline',
      'title': 'Tarayıcı İşleyişi: DOM, CSSOM, Render',
      'duration': '14 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Pipeline'},
            {'type': 'bullet', 'text': 'HTML Pars → DOM, CSS Pars → CSSOM'},
            {'type': 'bullet', 'text': 'Render Tree → Layout → Paint → Composite'},
            {'type': 'bullet', 'text': 'Blocking kaynaklar: CSS ve bazen JS'},
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Kritik Render Yolu'},
            {'type': 'desc', 'text': 'İlk içeriğin hızlı görünmesi için CSS/JS sıralaması ve küçültme (minify) önemlidir.'},
          ],
          'quizQuestion': {
            'question': 'İlk boyalı pikseli (First Paint) hızlandırmak için en kritik optimizasyon nedir?',
            'options': [
              'Tüm JS’yi head içinde senkron yüklemek',
              'Kritik CSS’yi hızlı sunmak ve render-blocking JS’yi ertelemek',
              'Resimleri orijinal, sıkıştırmasız sunmak',
              'Sunucuda gzip’i kapatmak'
            ],
            'correctIndex': 1,
            'explanation': 'Kritik CSS ve JS yönetimi render yolunu hızlandırır.'
          }
        },
      ],
    },

    {
      'id': 'cache-cdn-perf',
      'title': 'Cache, ETag, CDN ve Performans',
      'duration': '12 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'HTTP Cache'},
            {'type': 'bullet', 'text': 'Cache-Control: max-age, s-maxage, no-store'},
            {'type': 'bullet', 'text': 'Etag/If-None-Match ve Last-Modified/If-Modified-Since'},
            {'type': 'bullet', 'text': 'CDN: içeriği son kullanıcıya yakın noktadan servis eder'},
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Sıkıştırma ve İletim'},
            {'type': 'bullet', 'text': 'Gzip/Brotli, HTTP/2 çoklama (multiplexing)'},
            {'type': 'bullet', 'text': 'Resim optimizasyonu (WebP/AVIF), lazy-loading'},
          ],
          'quizQuestion': {
            'question': 'Tarayıcı “değişmedi” diyerek 304 döndürülmesini hangi başlık çifti sağlar?',
            'options': [
              'Authorization / User-Agent',
              'Etag / If-None-Match',
              'Content-Type / Accept',
              'Set-Cookie / Cookie'
            ],
            'correctIndex': 1,
            'explanation': 'Etag/If-None-Match ile koşullu istek 304 (Not Modified) alınabilir.'
          }
        },
      ],
    },

    {
      'id': 'rest-json-mime',
      'title': 'REST, JSON ve MIME Türleri',
      'duration': '9 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'REST Prensipleri'},
            {'type': 'bullet', 'text': 'Kaynak odaklı tasarım, stateless istekler'},
            {'type': 'bullet', 'text': 'HTTP yöntem/kodlarının semantik kullanımı'},
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'JSON ve MIME'},
            {'type': 'bullet', 'text': 'application/json, text/html, image/png, text/css, application/javascript'},
            {'type': 'bullet', 'text': 'Accept/Content-Type başlıkları içerik pazarlığında kullanılır'},
          ],
        },
      ],
    },

    {
      'id': 'security-xss-csrf',
      'title': 'Güvenlik: XSS, CSRF, Clickjacking',
      'duration': '13 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'XSS (Cross-Site Scripting)'},
            {'type': 'bullet', 'text': 'Reflected, Stored, DOM-Based'},
            {'type': 'bullet', 'text': 'Kaçışlama (escape), CSP, HttpOnly cookie, input doğrulama'},
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'CSRF & Clickjacking'},
            {'type': 'bullet', 'text': 'CSRF token, SameSite=Lax/Strict'},
            {'type': 'bullet', 'text': 'X-Frame-Options / CSP frame-ancestors'},
          ],
          'quizQuestion': {
            'question': 'Clickjacking’e karşı hangi başlık en doğrudan koruma sağlar?',
            'options': ['X-Frame-Options', 'ETag', 'Accept-Encoding', 'Allow'],
            'correctIndex': 0,
            'explanation': 'X-Frame-Options (veya CSP frame-ancestors) gömme saldırılarını engeller.'
          }
        },
      ],
    },

    {
      'id': 'devtools',
      'title': 'Tarayıcı Geliştirici Araçları',
      'duration': '8 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Network, Elements, Console'},
            {'type': 'bullet', 'text': 'Network waterfall: TTFB, Content Download, Blocking'},
            {'type': 'bullet', 'text': 'Elements: DOM/CSS inceleme, live edit'},
            {'type': 'bullet', 'text': 'Console: Hatalar, uyarılar, loglar'},
          ],
        },
      ],
    },

    {
      'id': 'ornek-uygulama',
      'title': 'Vaka & Örnekler',
      'duration': '10 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Gerçek Senaryolar'},
            {'type': 'bullet', 'text': 'DNS yanlış yapılandırma → yönlendirme sorunları'},
            {'type': 'bullet', 'text': 'CORS hatalı ayarı → beklenmeyen erişim engelleri'},
            {'type': 'bullet', 'text': 'Cache başlıkları eksik → gereksiz bant genişliği kullanımı'},
          ],
        },
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Düşün – Yanıtla'},
            {'type': 'desc', 'text': 'Bir sayfa ilk açılışta çok yavaş: hangi 3 metriğe bakarsın?'},
          ],
          'quizQuestion': {
            'question': 'İlk yükleme yavaşsa ilk bakılacak metriklerden hangisi değildir?',
            'options': ['TTFB', 'First Contentful Paint', 'CLS', 'X-Frame-Options'],
            'correctIndex': 3,
            'explanation': 'X-Frame-Options bir güvenlik başlığıdır; performans metriği değildir.'
          }
        },
      ],
    },
  ],
};
