// lib/views/screens/lessons/sigint.dart
import 'package:flutter/material.dart';

final Map<String, dynamic> sigintModule = {
  'id': 'sigint',
  'title': 'Sinyal İstihbaratı (SIGINT)',
  'subtitle': 'COMINT, ELINT, kullanım alanları, araçlar ve etik boyut',
  'icon': Icons.waves,
  'lessons': [

    // 1. Tanım
    {
      'id': 'sigint-nedir',
      'title': 'Sinyal İstihbaratı (SIGINT) Nedir?',
      'duration': '6 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {
              'type': 'title',
              'text': 'Sinyal İstihbaratı (SIGINT)',
            },
            {
              'type': 'desc',
              'text':
                  'Hedef kişi, grup veya sistemlerin yaydığı elektromanyetik sinyallerin toplanması ve analiz edilmesidir. Bu sinyaller; telsiz, telefon, radar, GPS veya diğer elektronik cihazlardan gelebilir.',
            },
            {
              'type': 'bullet',
              'text': 'COMINT – Communication Intelligence: İnsan iletişiminin dinlenmesi, kaydı ve analizi.',
            },
            {
              'type': 'bullet',
              'text': 'ELINT – Electronic Intelligence: Elektronik cihazların (radar, silah sistemleri vb.) sinyallerinin analizi.',
            },
            {
              'type': 'bullet',
              'text': 'FISINT – Foreign Instrumentation Signals Intelligence: Füze, roket ve uzay sistemlerinden gelen telemetri verilerinin analizi.',
            },
          ],
        },
      ],
    },

    // 2. Kullanım Alanları
    {
      'id': 'sigint-kullanim',
      'title': 'SIGINT Kullanım Alanları',
      'duration': '10 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Askerî Operasyonlar'},
            {'type': 'desc', 'text': 'Düşman haberleşme ve radar sistemlerini analiz ederek operasyonel avantaj sağlanır.'},
            {'type': 'title', 'text': 'Terörle Mücadele'},
            {'type': 'desc', 'text': 'Terörist grupların iletişimleri dinlenir; eylemler önceden tespit edilir.'},
            {'type': 'title', 'text': 'Siber Güvenlik'},
            {'type': 'desc', 'text': 'Ağ trafiği analiz edilerek siber saldırılar tespit edilir.'},
            {'type': 'title', 'text': 'Sınır Güvenliği'},
            {'type': 'desc', 'text': 'Kaçakçılık ve yasa dışı haberleşmelerin tespiti.'},
            {'type': 'title', 'text': 'Uzay ve Füze Takibi (FISINT)'},
            {'type': 'desc', 'text': 'Uydu, füze ve roket test sinyallerinden veri toplanır.'},
          ],
        },
      ],
    },

    // 3. SigintOS ve Araçlar
    {
      'id': 'sigintos',
      'title': 'SigintOS ve Sinyal Analiz Araçları',
      'duration': '12 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'SigintOS Nedir?'},
            {'type': 'desc', 'text': 'Ubuntu tabanlı, sinyal işleme ve analiz için özel olarak hazırlanmış bir Linux dağıtımıdır.'},
            {'type': 'bullet', 'text': 'HackRF, BladeRF, RTLSDR, USRP gibi SDR (Software Defined Radio) donanımlarına entegre çalışır.'},
            {'type': 'bullet', 'text': 'GnuRadio, GQRX, SDR++, YateBTS, srsRAN, SatDump gibi araçları içerir.'},
            {'type': 'title', 'text': 'Uygulama Örnekleri'},
            {'type': 'bullet', 'text': 'RF spektrum analizi: GQRX veya SigDigger ile ortam sinyallerinin taranması.'},
            {'type': 'bullet', 'text': 'GSM/LTE analizi: srsRAN ve YateBTS ile test baz istasyonu kurulumu.'},
            {'type': 'bullet', 'text': 'Uydu telemetrisi: NOAA uydusundan veri alma (SatDump, GnuRadio).'},
          ],
        },
      ],
    },

    // 4. Teknikler ve Uygulamalar
    {
      'id': 'sigint-teknikler',
      'title': 'SIGINT Teknikleri ve Uygulamalar',
      'duration': '10 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'title', 'text': 'Traffic Analysis (Trafik Analizi)'},
            {'type': 'desc', 'text': 'İletişim sıklığı, yönü ve yoğunluğu üzerinden ağ davranışının analizi.'},
            {'type': 'title', 'text': 'Direction Finding (DF)'},
            {'type': 'desc', 'text': 'Yayın yapan sinyal kaynağının yönünü bulmak için anten dizileri kullanılır.'},
            {'type': 'title', 'text': 'Frequency Hopping'},
            {'type': 'desc', 'text': 'Sinyal, farklı frekanslara sıçrayarak tespit edilmeyi zorlaştırır.'},
            {'type': 'title', 'text': 'Demodülasyon ve Spektrum Analizi'},
            {'type': 'desc', 'text': 'FM, AM, PSK, FSK gibi sinyaller çözülerek içerik analizi yapılır.'},
          ],
        },
      ],
    },

    // 5. Etik ve Hukuki Boyut
    {
      'id': 'sigint-etik',
      'title': 'Etik ve Hukuki Boyut',
      'duration': '8 dk',
      'steps': [
        {
          'type': 'info',
          'content': [
            {'type': 'desc', 'text': 'SIGINT faaliyetleri ulusal güvenlik için kritik olsa da, bireylerin özel haberleşme haklarıyla çakışabilir.'},
            {'type': 'bullet', 'text': 'İzinsiz dinlemeler uluslararası hukukta ihlal sayılır.'},
            {'type': 'bullet', 'text': 'Vatandaş iletişiminin gözetimi etik tartışmaların merkezindedir.'},
            {'type': 'bullet', 'text': 'Askerî tatbikatlar ve yabancı frekans takibi çoğu zaman gri alanda yer alır.'},
          ],
        },
      ],
    },

    // 6. Quiz
    {
      'id': 'sigint-quiz',
      'title': 'SIGINT Değerlendirme Soruları',
      'duration': '15 dk',
      'steps': [
        {
          'type': 'quiz',
          'questions': [
            {
              'question': 'COMINT hangi faaliyetleri kapsar?',
              'options': [
                'Uydu görüntülerinin analizi',
                'İletişim sinyallerinin dinlenmesi',
                'Radar sinyallerinin yansıması',
                'Donanım devre analizi'
              ],
              'correctIndex': 1,
              'explanation': 'COMINT insan iletişimlerinin dinlenmesi ve analizidir.'
            },
            {
              'question': 'Direction Finding (DF) ne işe yarar?',
              'options': [
                'Sinyal şifresini çözmek',
                'Sinyal kaynağının yerini tespit etmek',
                'Veri paketlerini değiştirmek',
                'Ağ hızını ölçmek'
              ],
              'correctIndex': 1,
              'explanation': 'DF tekniği sinyal yayan cihazın yönünü belirlemek için kullanılır.'
            },
            {
              'question': 'Frequency hopping ne sağlar?',
              'options': ['Sinyal gücünü artırır', 'Dinlemeye karşı direnç sağlar', 'Enerji tüketimini azaltır', 'Sinyali sabit tutar'],
              'correctIndex': 1,
              'explanation': 'Sinyal farklı frekanslara atlayarak tespiti zorlaştırır.'
            },
            {
              'question': 'SIGINT ile hangi istihbarat türleri birleştirilebilir?',
              'options': ['HUMINT', 'GEOINT', 'OSINT', 'Hepsi'],
              'correctIndex': 3,
              'explanation': 'Tüm bu kaynaklar birleştirilerek çok katmanlı analiz yapılabilir.'
            },
          ],
        },
      ],
    },
  ],
};
