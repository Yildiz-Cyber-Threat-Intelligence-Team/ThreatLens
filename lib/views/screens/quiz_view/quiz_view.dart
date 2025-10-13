import 'package:flutter/material.dart';
import '../../../../utils/score_updater.dart';
import '../../../../services/progress_service.dart';

class QuizView extends StatefulWidget {
  const QuizView({super.key});

  @override
  State<QuizView> createState() => _QuizViewState();
}

class _QuizViewState extends State<QuizView> {
  Widget _buildModuleCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required int questionCount,
    required Map<String, dynamic> module,
  }) {
    return GestureDetector(
      onTap: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => QuizDetailView(module: module),
          ),
        );
        setState(() {}); // Quiz'den dönünce başlığı güncelle
      },
      child: Container(
        height: 150,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF1C2541), Color(0xFF0B132B)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: const Color(0xFFBB86FC).withValues(alpha: 0.3),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: const Color(0xFFBB86FC), size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Tooltip(
                    message: title,
                    preferBelow: false,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C2541),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFFBB86FC).withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Tooltip(
                    message: subtitle,
                    preferBelow: false,
                    decoration: BoxDecoration(
                      color: const Color(0xFF1C2541),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: const Color(0xFFBB86FC).withValues(alpha: 0.3),
                        width: 1,
                      ),
                    ),
                    textStyle: const TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    child: Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.3,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      "$questionCount Soru",
                      style: const TextStyle(
                        color: Color(0xFFBB86FC),
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFFBB86FC),
                    size: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Rastgele bir sayı üretmek için kullanılacak fonksiyon
  int getRandomIndex(int max) {
    return DateTime.now().millisecondsSinceEpoch % max;
  }

  final List<Map<String, dynamic>> quizModules = [
    {
      'title': 'Siber Güvenlik Temelleri',
      'subtitle': 'Temel kavramlar ve prensipler',
      'icon': Icons.security,
      'color': const Color(0xFFBB86FC),
      'questions': [
        {
          "question": "Siber güvenlik nedir?",
          "options": [
            "Bilgisayar sistemlerinde şifreleme ve kimlik doğrulama yöntemleriyle erişim kontrolü sağlama",
            "Bilgi sistemlerini, ağları ve verileri yetkisiz erişim, saldırı ve hasardan koruma süreci",
            "Ağ trafiğini izleyerek zararlı yazılımları tespit etme ve engelleme teknolojisi",
            "Kurumsal sistemlerde güvenlik duvarı ve antivirüs çözümleri uygulama stratejisi",
          ],
          "correctIndex": 1,
        },
        {
          "question": "Hangi tehdit türü en yaygındır?",
          "options": [
            "Veritabanı sorgularına kötü amaçlı kod enjekte ederek veri sızdırma yöntemi",
            "Hedef sistemleri çok sayıda istek göndererek hizmet dışı bırakma saldırısı",
            "Kullanıcıları kandırarak kimlik bilgilerini ele geçirmeyi amaçlayan sosyal mühendislik tekniği",
            "Sistemlere sızarak bilgi çalan, şifreleyen veya zarar veren kötücül yazılım türleri",
          ],
          "correctIndex": 2,
        },
        {
          "question": "Güvenlik önlemlerinin temel amacı nedir?",
          "options": [
            "Kullanıcı deneyimini optimize ederek sistem kullanılabilirliğini artırmak ve verimliliği sağlamak",
            "Operasyonel maliyetleri düşürerek BT altyapısının toplam sahip olma maliyetini azaltmak",
            "Bilgi varlıklarının gizliliğini, bütünlüğünü ve erişilebilirliğini koruyarak güvenilirliği sağlamak",
            "Sistem performansını iyileştirerek kaynak kullanımını optimize etmek ve yanıt sürelerini azaltmak",
          ],
          "correctIndex": 2,
        },
        {
          "question": "Günlük güvenlik pratikleri nelerdir?",
          "options": [
            "Antivirüs yazılımlarını güncel tutarak zararlı yazılımlardan korunma ve düzenli tarama yapma",
            "Güvenlik duvarı yapılandırmasını optimize ederek ağ trafiğini filtreleme ve izinsiz erişimleri engelleme",
            "Periyodik olarak şifre değiştirerek hesap güvenliğini artırma ve şifre yenileme politikalarını uygulama",
            "Karmaşık parolalar kullanma, yazılım güncellemelerini yapma, düzenli yedekleme ve çift faktörlü kimlik doğrulama uygulama",
          ],
          "correctIndex": 3,
        },
        {
          "question": "Güvenlik testleri neden önemlidir?",
          "options": [
            "Bilgi teknolojileri altyapısının işletme maliyetlerini optimize ederek bütçe verimliliğini artırmak",
            "Sistemlerdeki güvenlik açıklarını ve zayıf noktaları proaktif olarak tespit ederek saldırıları önlemek",
            "Donanım ve yazılım performansını ölçerek sistem optimizasyonu sağlamak ve kaynak kullanımını iyileştirmek",
            "Sektörel düzenlemelere ve standartlara uygunluğu belgeleyerek yasal yükümlülükleri karşılamak",
          ],
          "correctIndex": 1,
        },
      ],
    },
    {
      'title': 'Ağ Güvenliği',
      'subtitle': 'Ağ altyapısı ve koruma',
      'icon': Icons.wifi,
      'color': const Color(0xFFBB86FC),
      'questions': [
        {
          "question":
              "Ağ protokollerinin güvenlik açısından en önemlisi hangisidir?",
          "options": [
            "Dosya transferi için kullanılan ve kimlik doğrulama mekanizması içeren protokol",
            "E-posta iletimi için kullanılan ve sunucular arası iletişimi sağlayan protokol",
            "SSL/TLS ile şifrelenmiş bağlantı sağlayan ve veri bütünlüğünü koruyan web protokolü",
            "Web sayfalarının iletimi için kullanılan ve istemci-sunucu iletişimini sağlayan protokol",
          ],
          "correctIndex": 2,
        },
        {
          "question": "Firewall'ın temel görevi nedir?",
          "options": [
            "Ağ üzerindeki verileri şifreleyerek üçüncü tarafların erişimini engellemek ve veri güvenliğini sağlamak",
            "Sistem verilerini düzenli olarak yedekleyerek veri kaybını önlemek ve felaket kurtarma planını desteklemek",
            "Belirlenmiş kurallara göre ağ trafiğini izlemek, filtrelemek ve yetkisiz erişimleri engellemek",
            "Ağ kaynaklarının optimum kullanımını sağlayarak sistem yanıt sürelerini iyileştirmek ve darboğazları gidermek",
          ],
          "correctIndex": 2,
        },
        {
          "question": "VPN teknolojisi ne sağlar?",
          "options": [
            "Bulut tabanlı depolama çözümleriyle veri saklama kapasitesini artırma ve erişilebilirliği iyileştirme",
            "Ağ altyapısını optimize ederek bant genişliği kullanımını azaltma ve işletme giderlerini düşürme",
            "Ağ trafiğini hızlandırarak veri aktarım oranlarını artırma ve gecikme sürelerini minimize etme",
            "Şifrelenmiş tünel üzerinden güvenli bağlantı kurarak uzaktan erişimde gizlilik ve veri bütünlüğü sağlama",
          ],
          "correctIndex": 3,
        },
        {
          "question": "Wireless güvenlik için en güvenli protokol hangisidir?",
          "options": [
            "64/128 bit şifreleme kullanan ve ilk kablosuz güvenlik standardı olan protokol",
            "Kimlik doğrulama veya şifreleme içermeyen ve herkesin erişebildiği ağ yapılandırması",
            "TKIP şifreleme kullanan ve WEP'in güvenlik açıklarını gidermek için geliştirilen protokol",
            "AES şifreleme kullanan, SAE kimlik doğrulama desteği sunan ve en güncel kablosuz güvenlik standardı",
          ],
          "correctIndex": 3,
        },
        {
          "question": "Ağ izleme neden önemlidir?",
          "options": [
            "Ağa bağlı kullanıcı sayısını takip ederek lisanslama maliyetlerini optimize etmek ve kapasite planlaması yapmak",
            "Ağ trafiğindeki anormal davranışları ve potansiyel güvenlik ihlallerini tespit ederek proaktif önlemler almak",
            "Ağ donanımlarının kullanım oranlarını ölçerek maliyet-fayda analizi yapmak ve bütçe planlamasını iyileştirmek",
            "Ağ bileşenlerinin performans metriklerini izleyerek darboğazları tespit etmek ve servis kalitesini artırmak",
          ],
          "correctIndex": 1,
        },
      ],
    },
    {
      'title': 'Kriptografi',
      'subtitle': 'Şifreleme ve güvenlik',
      'icon': Icons.lock,
      'color': const Color(0xFFBB86FC),
      'questions': [
        {
          "question": "Kriptografinin temel amacı nedir?",
          "options": [
            "Veri işleme süreçlerini hızlandırarak sistem performansını artırmak ve yanıt sürelerini optimize etmek",
            "Veri sıkıştırma algoritmaları kullanarak depolama alanından tasarruf sağlamak ve bant genişliği kullanımını azaltmak",
            "Bilginin yetkisiz erişime karşı korunmasını, bütünlüğünün sağlanmasını ve kaynağının doğrulanmasını sağlamak",
            "Sistem kaynaklarının verimli kullanımını sağlayarak işlem kapasitesini artırmak ve enerji tüketimini azaltmak",
          ],
          "correctIndex": 2,
        },
        {
          "question": "Simetrik şifreleme nedir?",
          "options": [
            "Mesajın kaynağını doğrulamak için kullanılan ve mesaj özetine dayalı elektronik imzalama yöntemi",
            "Şifreleme ve deşifreleme için farklı matematiksel olarak ilişkili anahtar çiftleri kullanan kriptografik sistem",
            "Veriyi sabit uzunlukta benzersiz bir değere dönüştüren ve geri döndürülemeyen matematiksel algoritma",
            "Hem şifreleme hem de şifre çözme işlemlerinde aynı gizli anahtarı kullanan kriptografik yöntem",
          ],
          "correctIndex": 3,
        },
        {
          "question": "Asimetrik şifreleme hangi anahtar çiftini kullanır?",
          "options": [
            "Herkes tarafından bilinebilen ve şifreleme için kullanılan matematiksel değer",
            "İletişim oturumu süresince geçerli olan ve her oturum için yeniden oluşturulan geçici anahtar",
            "Yalnızca sahibi tarafından bilinen ve şifre çözme işleminde kullanılan matematiksel değer",
            "Matematiksel olarak ilişkili olan, biri şifreleme diğeri şifre çözme için kullanılan anahtar ikilisi",
          ],
          "correctIndex": 3,
        },
        {
          "question": "Hash fonksiyonlarının özelliği nedir?",
          "options": [
            "Verileri şifreleyerek üçüncü tarafların okumasını engelleyen ve gizliliği sağlayan algoritma",
            "Şifrelenmiş veriyi orijinal haline döndürebilen ve çift yönlü çalışan matematiksel işlem",
            "Herhangi bir boyuttaki veriyi sabit uzunlukta bir değere dönüştüren ve geri döndürülemeyen algoritma",
            "Verileri daha küçük boyuta indirgeyen ve depolama alanından tasarruf sağlayan kodlama tekniği",
          ],
          "correctIndex": 2,
        },
        {
          "question": "Dijital imza ne sağlar?",
          "options": [
            "Verileri yetkisiz erişimden korumak için şifreleyen ve gizliliği sağlayan kriptografik yöntem",
            "Veri boyutunu küçülterek iletim hızını artıran ve depolama verimliliğini iyileştiren algoritma",
            "Elektronik belgelerin kaynağını doğrulayan ve değiştirilmediğini garanti eden kriptografik mekanizma",
            "İletişim kanallarında bilginin gizliliğini sağlayan ve üçüncü tarafların erişimini engelleyen protokol",
          ],
          "correctIndex": 2,
        },
      ],
    },
    {
      'title': 'Penetrasyon Testi',
      'subtitle': 'Güvenlik testleri ve değerlendirme',
      'icon': Icons.bug_report,
      'color': const Color(0xFFBB86FC),
      'questions': [
        {
          "question": "Penetrasyon testi nedir?",
          "options": [
            "Sistemlerin yük altındaki davranışlarını ölçerek performans sınırlarını ve darboğazlarını belirleyen analiz yöntemi",
            "Kullanıcı deneyimini değerlendirerek arayüz tasarımının etkinliğini ve kullanım kolaylığını ölçen test süreci",
            "Yetkili bir saldırgan gibi davranarak sistemlerdeki güvenlik açıklarını ve zafiyetleri tespit etmeyi amaçlayan simülasyon",
            "Otomatik araçlar kullanarak bilinen güvenlik açıklarını tarayıp raporlayan pasif değerlendirme yöntemi",
          ],
          "correctIndex": 2,
        },
        {
          "question": "Reconnaissance aşamasında ne yapılır?",
          "options": [
            "Test sonrası sistemleri orijinal durumlarına döndürme ve test izlerini silme işlemi",
            "Tespit edilen güvenlik açıklarını ve önerileri içeren detaylı dokümantasyon hazırlama",
            "Hedef sistem hakkında pasif ve aktif yöntemlerle bilgi toplama, keşif ve haritalandırma",
            "Tespit edilen güvenlik açıklarını kullanarak sistemlere sızma ve yetki yükseltme girişimleri",
          ],
          "correctIndex": 2,
        },
        {
          "question": "Vulnerability assessment nedir?",
          "options": [
            "Test sonuçlarını analiz ederek bulguları ve önerileri içeren detaylı dokümantasyon oluşturma süreci",
            "Sistemlerdeki güvenlik açıklarını, zafiyetleri ve riskleri tanımlama, sınıflandırma ve önceliklendirme süreci",
            "Test sonrası sistemleri orijinal durumlarına döndürme ve test sırasında oluşturulan izleri silme işlemi",
            "Tespit edilen güvenlik açıklarını kullanarak sistemlere sızma girişimlerini içeren aktif test süreci",
          ],
          "correctIndex": 1,
        },
        {
          "question": "Exploitation aşamasında ne yapılır?",
          "options": [
            "Hedef sistem hakkında pasif ve aktif yöntemlerle istihbarat toplama ve ağ haritalandırma",
            "Test sonrası sistemleri orijinal durumlarına döndürme ve test izlerini temizleme işlemi",
            "Tespit edilen güvenlik açıklarını kullanarak sistemlere sızma, yetki yükseltme ve erişim sağlama",
            "Tespit edilen güvenlik açıklarını, riskleri ve çözüm önerilerini içeren detaylı rapor hazırlama",
          ],
          "correctIndex": 2,
        },
        {
          "question": "Post-exploitation ne içerir?",
          "options": [
            "Test sonuçlarını analiz ederek bulguları ve önerileri içeren detaylı dokümantasyon oluşturma",
            "Test sonrası sistemleri orijinal durumlarına döndürme ve test sırasında oluşturulan izleri silme",
            "Tespit edilen güvenlik açıklarını kullanarak sistemlere ilk erişim sağlama girişimleri",
            "Erişim sağlanan sistemlerde kalıcılık oluşturma, yetki yükseltme, yanal hareket ve hassas veri toplama",
          ],
          "correctIndex": 3,
        },
      ],
    },
    {
      'title': 'CTI',
      'subtitle': 'Tehdit istihbaratı',
      'icon': Icons.visibility,
      'color': const Color(0xFFBB86FC),
      'questions': [
        {
          "question": "CTI (Cyber Threat Intelligence) nedir?",
          "options": [
            "Ağ trafiğini kontrol eden ve zararlı bağlantıları engelleyen güvenlik duvarı teknolojisi",
            "Verileri yetkisiz erişimden korumak için kullanılan matematiksel algoritma ve protokoller",
            "Siber tehditler hakkında veri toplama, analiz etme ve bu bilgileri savunma stratejilerine dönüştürme süreci",
            "Bilgisayar sistemlerini zararlı yazılımlardan koruyan ve tespit eden güvenlik yazılımı",
          ],
          "correctIndex": 2,
        },
        {
          "question": "OSINT ne anlama gelir?",
          "options": [
            "Sosyal medya platformlarından elde edilen ve analiz edilen kullanıcı davranış verileri",
            "Web sitelerinin güvenlik açıklarını taramak için kullanılan otomatik test araçları",
            "Yalnızca yetkili kurumların erişebildiği gizli istihbarat kaynakları ve veritabanları",
            "Halka açık kaynaklardan yasal olarak elde edilebilen ve istihbarat amaçlı kullanılan bilgiler",
          ],
          "correctIndex": 3,
        },
        {
          "question": "MITRE ATT&CK Framework ne için kullanılır?",
          "options": [
            "Sistemlerdeki güvenlik açıklarını otomatik olarak taramak ve tespit etmek için kullanılan araç seti",
            "Güvenlik olaylarını ve ihlallerini belgelemek ve raporlamak için kullanılan standart format",
            "Siber saldırganların taktiklerini, tekniklerini ve prosedürlerini sistematik olarak sınıflandıran bilgi tabanı",
            "Gerçek saldırıları taklit ederek savunma mekanizmalarını test eden otomatik simülasyon platformu",
          ],
          "correctIndex": 2,
        },
        {
          "question": "IoC (Indicator of Compromise) nedir?",
          "options": [
            "Zararlı yazılımların benzersiz kriptografik parmak izini temsil eden sayısal değer",
            "Kötü amaçlı yazılımların iletişim kurduğu sunucuların web adresi tanımlayıcısı",
            "Sistemlerde veya ağlarda güvenlik ihlali olduğunu gösteren adli kanıt veya gözlemlenebilir veri",
            "Şüpheli ağ trafiğinin kaynağını veya hedefini tanımlayan sayısal ağ adresi",
          ],
          "correctIndex": 2,
        },
        {
          "question": "Threat Hunting ne anlama gelir?",
          "options": [
            "Güvenlik olaylarını ve ihlallerini belgelemek ve üst yönetime raporlamak için yapılan süreç",
            "Geleneksel güvenlik çözümleri tarafından tespit edilmemiş tehditleri proaktif olarak arama ve tespit etme süreci",
            "Toplanan tehdit istihbaratını inceleyerek saldırı vektörlerini ve motivasyonlarını belirleme çalışması",
            "Güvenlik sistemlerinin ürettiği uyarıları izleyerek anormal aktiviteleri tespit etme yöntemi",
          ],
          "correctIndex": 1,
        },
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B132B),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 32),

              ...quizModules.map((module) {
                final questionCount = module['questions'].length;
                final title = module['title'];
                final subtitle = module['subtitle'];
                final icon = module['icon'] as IconData;

                return _buildModuleCard(
                  title: title,
                  subtitle: subtitle,
                  icon: icon,
                  questionCount: questionCount,
                  module: module,
                );
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return FutureBuilder<int>(
      future: _getCompletedQuizCount(),
      builder: (context, snapshot) {
        final completed = snapshot.data ?? 0;
        final total = quizModules.fold<int>(
          0,
          (sum, m) => sum + (m['questions'] as List).length,
        );
        return Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF1C2541), Color(0xFF0B132B)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.quiz,
                  color: Color(0xFFBB86FC),
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Quiz Modülleri",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "Bilgini test et!",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.3,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Tamamlanan Quiz: $completed / $total",
                      style: const TextStyle(
                        color: Color(0xFFBB86FC),
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<int> _getCompletedQuizCount() async {
    int completed = 0;
    for (final module in quizModules) {
      final moduleTitle = module['title'] as String;
      final answers = await ProgressService.getModuleQuizAnswers(moduleTitle);
      // Eğer tüm sorular cevaplandıysa (doğru/yanlış farketmeksizin), quiz tamamlanmış sayılır
      final totalQuestions = (module['questions'] as List).length;
      if (answers.length == totalQuestions) {
        completed += totalQuestions;
      } else {
        completed += answers.length;
      }
    }
    return completed;
  }
}

class QuizDetailView extends StatefulWidget {
  final Map<String, dynamic> module;

  const QuizDetailView({super.key, required this.module});

  @override
  State<QuizDetailView> createState() => _QuizDetailViewState();
}

class _QuizDetailViewState extends State<QuizDetailView> {
  int selectedIndex = -1;
  bool answerSubmitted = false;
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  bool isModuleCompleted = false;
  Map<int, bool> questionAnswers = {};
  bool isLoading = true;
  int currentAttemptCount = 1;
  bool showRetryButton = false;

  bool _quizCompletedDialogShown = false;

  List<Map<String, dynamic>> get questions => widget.module['questions'];

  @override
  void initState() {
    super.initState();
    _initializeQuiz();
  }

  Future<void> _initializeQuiz() async {
    await _checkModuleCompletion();
    await _loadQuestionAnswers();
    await _loadSelectedOption();
    await _loadAttemptCount();
    setState(() {
      isLoading = false;
    });
  }

  Future<void> _checkModuleCompletion() async {
    final moduleTitle = widget.module['title'];
    final completionStatus = await ProgressService.getModuleCompletionStatus(
      moduleTitle,
    );
    setState(() {
      isModuleCompleted = completionStatus >= 1.0;
    });
  }

  Future<void> _loadQuestionAnswers() async {
    final moduleTitle = widget.module['title'];
    final answers = await ProgressService.getModuleQuizAnswers(moduleTitle);
    if (mounted) {
      setState(() {
        questionAnswers = answers;
        correctAnswers = answers.values.where((isCorrect) => isCorrect).length;
      });
    }
  }

  Future<void> _loadSelectedOption() async {
    final moduleTitle = widget.module['title'];
    final selectedOption = await ProgressService.getQuizSelectedOption(
      moduleTitle: moduleTitle,
      questionIndex: currentQuestionIndex,
    );
    if (mounted && selectedOption != null) {
      setState(() {
        selectedIndex = selectedOption;
      });
    }
  }

  Future<void> _loadAttemptCount() async {
    final moduleTitle = widget.module['title'];
    final attemptCount = await ProgressService.getQuizAttemptCount(
      moduleTitle: moduleTitle,
      questionIndex: currentQuestionIndex,
    );
    if (mounted) {
      setState(() {
        currentAttemptCount = attemptCount;
        showRetryButton = attemptCount >= 2;
      });
    }
  }

  bool get isCurrentQuestionLocked {
    return questionAnswers.containsKey(currentQuestionIndex) || answerSubmitted;
  }

  void _nextQuestion() {
    if (currentQuestionIndex < questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedIndex = -1;
        answerSubmitted = false;
      });
      _loadSelectedOption();
      _loadAttemptCount();
    } else {
      _showQuizCompleted();
    }
  }

  Future<void> _showQuizCompleted() async {
    if (_quizCompletedDialogShown) return;
    _quizCompletedDialogShown = true;

    final correctCount = questionAnswers.values
        .where((isCorrect) => isCorrect)
        .length;
    final score = (correctCount / questions.length * 100).round();

    if (questionAnswers.length >= questions.length) {
      await ProgressService.saveModuleProgress(
        moduleTitle: widget.module['title'],
        isCompleted: true,
      );
    }

    if (!mounted) return;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.85,
            ),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF1C2541), Color(0xFF0B132B)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: const Color(0xFFBB86FC).withValues(alpha: 0.3),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xFFBB86FC).withValues(alpha: 0.3),
                          width: 1,
                        ),
                      ),
                      child: const Icon(
                        Icons.emoji_events,
                        color: Color(0xFFBB86FC),
                        size: 40,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Quiz Tamamlandı Başlığı
                const Text(
                  "🎉 Quiz Tamamlandı!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                // Puan Göstergesi
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF1C2541), Color(0xFF0B132B)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFFBB86FC).withValues(alpha: 0.3),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(
                                0xFFBB86FC,
                              ).withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.star,
                              color: Color(0xFFBB86FC),
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              "Puanınız: $score%",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Doğru Cevap Sayısı
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 6,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.check_circle,
                              color: Color(0xFFBB86FC),
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                "$correctCount / ${questions.length} doğru",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.3,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: const Color(
                              0xFFBB86FC,
                            ).withValues(alpha: 0.3),
                            width: 1,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.info_outline,
                              color: Color(0xFFBB86FC),
                              size: 14,
                            ),
                            const SizedBox(width: 4),
                            const Expanded(
                              child: Text(
                                "Quiz tamamlandı! Puanlar anlık olarak verildi.",
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFBB86FC),
                      foregroundColor: Colors.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      shadowColor: const Color(
                        0xFFBB86FC,
                      ).withValues(alpha: 0.4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.check_circle_outline, size: 20),
                        const SizedBox(width: 8),
                        const Text(
                          "Tamam",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );

    if (!mounted) return;
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      Navigator.of(context).pushReplacementNamed('/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        backgroundColor: Color(0xFF0B132B),
        body: Center(
          child: CircularProgressIndicator(color: Color(0xFFBB86FC)),
        ),
      );
    }

    final currentQuestion = questions[currentQuestionIndex];
    final isLocked = isCurrentQuestionLocked;

    return Scaffold(
      backgroundColor: const Color(0xFF0B132B),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 32),

              _buildProgressIndicator(),
              const SizedBox(height: 32),

              if (!answerSubmitted && isLocked) _buildLockedQuestionWarning(),
              if (!answerSubmitted && isLocked) const SizedBox(height: 16),

              _buildQuestionCard(currentQuestion["question"]),
              const SizedBox(height: 24),

              ...List.generate(currentQuestion["options"].length, (index) {
                final isAnsweredOrLocked = answerSubmitted || isLocked;
                return _buildOptionCard(
                  index: index,
                  option: currentQuestion["options"][index],
                  isSelected: selectedIndex == index,
                  isCorrect:
                      isAnsweredOrLocked &&
                      index == currentQuestion["correctIndex"],
                  isWrong:
                      isAnsweredOrLocked &&
                      selectedIndex == index &&
                      index != currentQuestion["correctIndex"],
                  isAnswered: isAnsweredOrLocked,
                  isLocked: isLocked,
                );
              }),

              const SizedBox(height: 32),

              _buildActionButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1C2541), Color(0xFF0B132B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (Navigator.of(context).canPop()) {
                Navigator.of(context).pop();
              } else {
                Navigator.of(context).pushReplacementNamed('/home');
              }
            },
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.arrow_back,
                color: Color(0xFFBB86FC),
                size: 20,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              widget.module['icon'] as IconData,
              color: const Color(0xFFBB86FC),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.module['title'],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.module['subtitle'],
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    final progress = (currentQuestionIndex + 1) / questions.length;
    final answeredCount = questionAnswers.length;
    final totalQuestions = questions.length;
    final correctCount = questionAnswers.values
        .where((isCorrect) => isCorrect)
        .length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Soru ${currentQuestionIndex + 1} / $totalQuestions",
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.3,
              ),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    "$correctCount doğru",
                    style: const TextStyle(
                      color: Color(0xFFBB86FC),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "$answeredCount / $totalQuestions",
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.3,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 12),
        Container(
          height: 10,
          decoration: BoxDecoration(
            color: const Color(0xFF1C2541),
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.05),
              width: 1,
            ),
          ),
          child: FractionallySizedBox(
            alignment: Alignment.centerLeft,
            widthFactor: progress,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFBB86FC), Color(0xFF9370DB)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(6),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFBB86FC).withValues(alpha: 0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 0),
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLockedQuestionWarning() {
    final isCorrectlyAnswered = questionAnswers[currentQuestionIndex] == true;
    final Color primaryColor = isCorrectlyAnswered
        ? Colors.green
        : Colors.orange;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            primaryColor.withValues(alpha: 0.15),
            primaryColor.withValues(alpha: 0.05),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: primaryColor.withValues(alpha: 0.4),
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
            spreadRadius: 1,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: primaryColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              isCorrectlyAnswered ? Icons.check_circle : Icons.lock,
              color: primaryColor,
              size: 22,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              isCorrectlyAnswered
                  ? "Bu soruyu doğru cevapladınız"
                  : "Bu soruyu zaten cevapladınız",
              style: TextStyle(
                color: primaryColor,
                fontSize: 15,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.3,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionCard(String question) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1C2541), Color(0xFF0B132B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFBB86FC).withValues(alpha: 0.3),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.quiz,
                  color: Color(0xFFBB86FC),
                  size: 22,
                ),
              ),
              const SizedBox(width: 14),
              const Text(
                "Soru",
                style: TextStyle(
                  color: Color(0xFFBB86FC),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            question,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOptionCard({
    required int index,
    required String option,
    required bool isSelected,
    required bool isCorrect,
    required bool isWrong,
    required bool isAnswered,
    required bool isLocked,
  }) {
    Color backgroundColor = const Color(0xFF1C2541);
    Color borderColor = const Color(0xFFBB86FC).withValues(alpha: 0.1);
    IconData? icon;
    Color? iconColor;

    if (isAnswered || isLocked) {
      if (isCorrect) {
        backgroundColor = Colors.green.withValues(alpha: 0.2);
        borderColor = Colors.green;
        icon = Icons.check_circle;
        iconColor = Colors.green;
      } else if (isWrong) {
        backgroundColor = Colors.red.withValues(alpha: 0.2);
        borderColor = Colors.red;
        icon = Icons.cancel;
        iconColor = Colors.red;
      } else if (isSelected) {
        backgroundColor = const Color(0xFFBB86FC).withValues(alpha: 0.2);
        borderColor = const Color(0xFFBB86FC);
      }
    } else if (isSelected) {
      backgroundColor = const Color(0xFFBB86FC).withValues(alpha: 0.2);
      borderColor = const Color(0xFFBB86FC);
    }

    return GestureDetector(
      onTap: (isAnswered || isLocked)
          ? null
          : () {
              setState(() {
                selectedIndex = index;
              });
            },
      child: Container(
        width: double.infinity,
        height: 110,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isSelected || isAnswered || isLocked
                ? [backgroundColor, backgroundColor.withValues(alpha: 0.7)]
                : [const Color(0xFF1C2541), const Color(0xFF0B132B)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected || isAnswered || isLocked
                ? borderColor
                : const Color(0xFFBB86FC).withValues(alpha: 0.3),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: (isSelected || isAnswered || isLocked)
                  ? borderColor.withValues(alpha: 0.2)
                  : Colors.black.withValues(alpha: 0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: isSelected || isAnswered || isLocked
                    ? ((isAnswered || isLocked) && isCorrect
                          ? Colors.green.withValues(alpha: 0.2)
                          : (isAnswered || isLocked) && isWrong
                          ? Colors.red.withValues(alpha: 0.2)
                          : const Color(0xFFBB86FC).withValues(alpha: 0.2))
                    : Colors.white.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Icon(
                  icon ??
                      (isSelected
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked),
                  color:
                      iconColor ??
                      (isSelected ? const Color(0xFFBB86FC) : Colors.white54),
                  size: 22,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  option,
                  style: TextStyle(
                    color: isAnswered || isLocked
                        ? (isCorrect
                              ? Colors.green
                              : isWrong
                              ? Colors.red
                              : isSelected
                              ? Colors.white
                              : Colors.white70)
                        : (isSelected ? Colors.white : Colors.white70),
                    fontSize: 16,
                    fontWeight: isSelected || isAnswered || isLocked
                        ? FontWeight.w600
                        : FontWeight.w400,
                    height: 1.4,
                    letterSpacing: 0.3,
                  ),
                  textAlign: TextAlign.left,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton() {
    final isLocked = isCurrentQuestionLocked;

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: isLocked
                ? () => _nextQuestion()
                : (selectedIndex == -1
                      ? null
                      : () {
                          if (answerSubmitted) {
                            _nextQuestion();
                          } else {
                            _submitAnswer();
                          }
                        }),
            style: ButtonStyle(
              padding: WidgetStateProperty.all(EdgeInsets.zero),
              shape: WidgetStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              elevation: WidgetStateProperty.all(4),
              shadowColor: WidgetStateProperty.all(
                Color.fromARGB((0.2 * 255).toInt(), 0, 0, 0),
              ),
              backgroundColor: WidgetStateProperty.all(Colors.transparent),
              surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
              overlayColor: WidgetStateProperty.resolveWith<Color?>((
                Set<WidgetState> states,
              ) {
                if (states.contains(WidgetState.pressed)) {
                  return Color.fromARGB((0.08 * 255).toInt(), 255, 255, 255);
                }
                return null;
              }),
            ),
            child: Ink(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFBB86FC), Color(0xFFBB86FC)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB((0.08 * 255).toInt(), 0, 0, 0),
                    blurRadius: 8.0,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Container(
                constraints: const BoxConstraints(minHeight: 48),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isLocked || answerSubmitted
                          ? Icons.arrow_forward
                          : Icons.send,
                      color: Colors.white,
                      size: 22,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      isLocked
                          ? "Devam Et"
                          : (answerSubmitted ? "Devam Et" : "Cevabı Gönder"),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        if (showRetryButton && answerSubmitted && !isLocked) ...[
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  selectedIndex = -1;
                  answerSubmitted = false;
                  showRetryButton = false;
                });
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Color(0xFFBB86FC), width: 1.5),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.refresh, color: Color(0xFFBB86FC), size: 20),
                  SizedBox(width: 8),
                  Text(
                    "Tekrar Dene",
                    style: TextStyle(
                      color: Color(0xFFBB86FC),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ],
    );
  }

  Future<void> _submitAnswer() async {
    final isCorrect =
        selectedIndex == questions[currentQuestionIndex]["correctIndex"];

    final newAttemptCount = currentAttemptCount + 1;

    await ProgressService.saveQuizAnswer(
      moduleTitle: widget.module['title'],
      questionIndex: currentQuestionIndex,
      isCorrect: isCorrect,
      selectedOption: selectedIndex,
      attemptCount: newAttemptCount,
    );

    final wasPreviouslyCorrect = questionAnswers[currentQuestionIndex] == true;

    setState(() {
      answerSubmitted = true;
      currentAttemptCount = newAttemptCount;
      questionAnswers[currentQuestionIndex] = isCorrect;
      showRetryButton = newAttemptCount >= 2;
    });

    if (isCorrect && !wasPreviouslyCorrect) {
      await increaseUserScore(amount: 5);
    }
  }
}
