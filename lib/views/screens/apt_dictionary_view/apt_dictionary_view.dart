import 'package:flutter/material.dart';
import 'apt_group_detail_view.dart';

class AptDictionaryView extends StatelessWidget {
  const AptDictionaryView({super.key});

  static const List<Map<String, String>> aptGroups = [
    {
      "name": "admin@338 (G0018)",
      "country": "Çin",
      "target": "Finansal, ekonomik ve ticaret politikası organizasyonları",
      "tactic": "Spear-phishing, RAT kullanımı, PoisonIvy, özel backdoor'lar",
      "description":
          "admin@338, Çin kökenli siber tehdit grubu. Güncel olayları yem olarak kullanarak kötü amaçlı yazılım dağıtır ve finansal, ekonomik ve ticaret politikası ile ilgili organizasyonları hedefler. Genellikle PoisonIvy gibi halka açık RAT'ları ve bazı özel backdoor'ları kullanır.",
    },
    {
      "name": "Agrius (G1030)",
      "country": "İran",
      "target": "Orta Doğu hedefleri, özellikle İsrail",
      "tactic": "Ransomware, wiper operasyonları, MOIS bağlantısı",
      "description":
          "Agrius, 2020'den beri aktif olan İranlı tehdit aktörü. Orta Doğu'da, özellikle İsrail hedeflerine yönelik ransomware ve wiper operasyonları serisi ile bilinir. İran'ın İstihbarat ve Güvenlik Bakanlığı (MOIS) ile bağlantılı olduğu rapor edilmiştir.",
    },
    {
      "name": "Ajax Security Team (G0130)",
      "country": "İran",
      "target":
          "ABD savunma sanayi, İranlı anti-sansür teknolojisi kullanıcıları",
      "tactic": "Website defacement, malware tabanlı siber casusluk",
      "description":
          "Ajax Security Team, en az 2010'dan beri aktif olan ve İran'dan faaliyet gösterdiği düşünülen grup. 2014'te website defacement operasyonlarından malware tabanlı siber casusluk kampanyalarına geçiş yapmıştır.",
    },
    {
      "name": "Akira (G1024)",
      "country": "Bilinmiyor",
      "target": "Çeşitli organizasyonlar, VMware ESXi hypervisor'ları",
      "tactic": "Ransomware, çifte şantaj, VPN erişimi, lateral movement",
      "description":
          "Akira, en az Mart 2023'ten beri aktif olan ransomware varyantı ve ransomware dağıtım varlığı. Tek faktörlü dış erişim mekanizmalarına erişim için tehlikeye atılmış kimlik bilgilerini kullanır.",
    },
    {
      "name": "ALLANITE (G1000)",
      "country": "Rusya",
      "target": "ABD ve İngiltere'deki elektrik sektörü",
      "tactic": "Siber casusluk, ICS anlayışı, kalıcılık",
      "description":
          "ALLANITE, şüpheli Rus siber casusluk grubu. ABD ve İngiltere'deki elektrik sektörünü hedef alır. Dragonfly'a benzer taktikler kullanır ancak bozucu veya yıkıcı yetenekler sergilemez.",
    },
    {
      "name": "Andariel (G0138)",
      "country": "Kuzey Kore",
      "target": "Güney Kore hükümeti, askeri organizasyonlar, şirketler",
      "tactic": "Yıkıcı saldırılar, ATM saldırıları, kripto para borsaları",
      "description":
          "Andariel, en az 2009'dan beri aktif olan Kuzey Kore devlet destekli tehdit grubu. Güney Kore hükümet kurumları, askeri organizasyonlar ve çeşitli yerli şirketlere yönelik operasyonlar gerçekleştirir.",
    },
    {
      "name": "Aoqin Dragon (G1007)",
      "country": "Çin",
      "target":
          "Avustralya, Kamboçya, Hong Kong, Singapur, Vietnam'daki hükümet, eğitim, telekomünikasyon",
      "tactic": "Siber casusluk, malware, altyapı kullanımı",
      "description":
          "Aoqin Dragon, en az 2013'ten beri aktif olan şüpheli Çin siber casusluk tehdit grubu. Avustralya, Kamboçya, Hong Kong, Singapur ve Vietnam'daki hükümet, eğitim ve telekomünikasyon organizasyonlarını hedefler.",
    },
    {
      "name": "APT-C-23 (G1028)",
      "country": "Bilinmiyor",
      "target": "Orta Doğu, İsrail askeri varlıkları",
      "tactic": "Mobil spyware, Android ve iOS hedefli saldırılar",
      "description":
          "APT-C-23, en az 2014'ten beri aktif olan tehdit grubu. Operasyonlarını Orta Doğu'ya odaklar ve 2017'den beri Android ve iOS cihazları hedefleyen mobil spyware geliştirmiştir.",
    },
    {
      "name": "APT-C-36 (G0099)",
      "country": "Güney Amerika",
      "target": "Güney Amerika hedefleri",
      "tactic": "Casusluk operasyonları",
      "description":
          "APT-C-36, şüpheli Güney Amerika casusluk grubu. Güney Amerika'daki hedeflere yönelik operasyonlar gerçekleştirir.",
    },
    {
      "name": "APT28 (G0007)",
      "country": "Rusya",
      "target": "Askeri ve hükümet kuruluşları, NATO üyeleri",
      "tactic": "Spear-phishing, kötü amaçlı yazılım, sosyal mühendislik",
      "description":
          "APT28, Rusya'nın GRU askeri istihbarat servisi ile bağlantılı olduğu düşünülen gelişmiş kalıcı tehdit grubu. NATO üyesi ülkelerin askeri ve hükümet kuruluşlarına yönelik siber saldırılar gerçekleştirir.",
    },
    {
      "name": "APT29 (G0016)",
      "country": "Rusya",
      "target":
          "Dışişleri bakanlıkları, politik organizasyonlar, araştırma kurumları",
      "tactic": "Kimlik avı, gelişmiş kalıcılık, tedarik zinciri saldırıları",
      "description":
          "APT29, Rusya'nın SVR istihbarat servisi ile bağlantılı olduğu düşünülen gelişmiş kalıcı tehdit grubu. Diplomatik ve politik hedeflere yönelik sofistike saldırılar gerçekleştirir.",
    },
    {
      "name": "APT30 (G0013)",
      "country": "Çin",
      "target": "Güneydoğu Asya hükümetleri, medya, muhalif gruplar",
      "tactic":
          "Spear-phishing, gelişmiş kötü amaçlı yazılım, uzun süreli kalıcılık",
      "description":
          "APT30, Çin kökenli gelişmiş kalıcı tehdit grubu. Güneydoğu Asya bölgesindeki hükümet kuruluşları, medya ve muhalif gruplara yönelik saldırılar gerçekleştirir.",
    },
    {
      "name": "APT31 (G0128)",
      "country": "Çin",
      "target": "Teknoloji şirketleri, oyun endüstrisi, sağlık sektörü",
      "tactic":
          "Tedarik zinciri saldırıları, gelişmiş kötü amaçlı yazılım, çoklu platform saldırıları",
      "description":
          "APT31, Çin kökenli gelişmiş kalıcı tehdit grubu. Hem devlet destekli istihbarat toplama hem de finansal kazanç amaçlı saldırılar gerçekleştirir.",
    },
    {
      "name": "APT32 (G0050)",
      "country": "Vietnam",
      "target": "Hükümet kuruluşları, medya, muhalif gruplar",
      "tactic": "Spear-phishing, gelişmiş kötü amaçlı yazılım, muhalif takibi",
      "description":
          "APT32, Vietnam kökenli gelişmiş kalıcı tehdit grubu. Hükümet kuruluşları, medya ve muhalif gruplara yönelik saldırılar gerçekleştirir.",
    },
    {
      "name": "APT33 (G0064)",
      "country": "İran",
      "target": "Enerji sektörü, havacılık endüstrisi, savunma şirketleri",
      "tactic":
          "Spear-phishing, gelişmiş kötü amaçlı yazılım, endüstriyel hedefli saldırılar",
      "description":
          "APT33, İran kökenli gelişmiş kalıcı tehdit grubu. Enerji sektörü, havacılık endüstrisi ve savunma şirketlerine yönelik saldırılar gerçekleştirir.",
    },
    {
      "name": "APT34 (G0074)",
      "country": "İran",
      "target": "Enerji sektörü, finansal kurumlar, telekomünikasyon",
      "tactic":
          "Spear-phishing, gelişmiş kötü amaçlı yazılım, enerji hedefli saldırılar",
      "description":
          "APT34, İran kökenli gelişmiş kalıcı tehdit grubu. Enerji sektörü, finansal kurumlar ve telekomünikasyon şirketlerine yönelik saldırılar gerçekleştirir.",
    },
    {
      "name": "APT35 (G0047)",
      "country": "İran",
      "target": "İnsan hakları savunucuları, gazeteciler, muhalif gruplar",
      "tactic": "Oltalama, sahte oturum açma sayfaları, sosyal mühendislik",
      "description":
          "APT35, İran kökenli gelişmiş kalıcı tehdit grubu. İnsan hakları savunucuları, gazeteciler ve muhalif gruplara yönelik oltalama saldırıları ve sahte oturum açma sayfaları kullanarak bilgi toplar.",
    },
    {
      "name": "APT36 (G0080)",
      "country": "Pakistan",
      "target": "Hindistan hedefleri, askeri kuruluşlar, hükümet kurumları",
      "tactic":
          "Spear-phishing, gelişmiş kötü amaçlı yazılım, askeri hedefli saldırılar",
      "description":
          "APT36, Pakistan kökenli gelişmiş kalıcı tehdit grubu. Özellikle Hindistan hedeflerine yönelik saldırılar gerçekleştirir.",
    },
    {
      "name": "APT37 (G0067)",
      "country": "Kuzey Kore",
      "target": "Güney Kore hedefleri, medya, muhalif gruplar",
      "tactic":
          "Spear-phishing, gelişmiş kötü amaçlı yazılım, Güney Kore hedefli saldırılar",
      "description":
          "APT37, Kuzey Kore kökenli gelişmiş kalıcı tehdit grubu. Özellikle Güney Kore hedeflerine yönelik saldırılar gerçekleştirir.",
    },
    {
      "name": "APT38 (G0082)",
      "country": "Kuzey Kore",
      "target": "Finansal kurumlar, savunma sektörü, kripto para borsaları",
      "tactic":
          "Tedarik zinciri saldırıları, finansal hedefli saldırılar, ransomware",
      "description":
          "APT38, Kuzey Kore devleti tarafından desteklenen gelişmiş kalıcı tehdit grubu. Finansal kurumlara, savunma sektörüne ve kripto para borsalarına yönelik tedarik zinciri saldırıları ile bilinir.",
    },
    {
      "name": "APT39 (G0087)",
      "country": "İran",
      "target": "Telekomünikasyon sektörü, havacılık, seyahat endüstrisi",
      "tactic":
          "Spear-phishing, gelişmiş kötü amaçlı yazılım, sektörel hedefli saldırılar",
      "description":
          "APT39, İran kökenli gelişmiş kalıcı tehdit grubu. Telekomünikasyon sektörü, havacılık ve seyahat endüstrisine yönelik saldırılar gerçekleştirir.",
    },
    {
      "name": "APT40 (G0095)",
      "country": "Çin",
      "target": "Denizcilik sektörü, üniversiteler, araştırma kurumları",
      "tactic":
          "Spear-phishing, gelişmiş kötü amaçlı yazılım, denizcilik hedefli saldırılar",
      "description":
          "APT40, Çin kökenli gelişmiş kalıcı tehdit grubu. Özellikle denizcilik sektörü, üniversiteler ve araştırma kurumlarına yönelik saldırılar gerçekleştirir.",
    },
    {
      "name": "APT41 (G0096)",
      "country": "Çin",
      "target": "Teknoloji şirketleri, oyun endüstrisi, sağlık sektörü",
      "tactic":
          "Tedarik zinciri saldırıları, gelişmiş kötü amaçlı yazılım, çoklu platform saldırıları",
      "description":
          "APT41, Çin kökenli gelişmiş kalıcı tehdit grubu. Hem devlet destekli istihbarat toplama hem de finansal kazanç amaçlı saldırılar gerçekleştirir.",
    },
    {
      "name": "APT42 (G0121)",
      "country": "İran",
      "target": "Akademik kurumlar, araştırma merkezleri, teknoloji şirketleri",
      "tactic":
          "Spear-phishing, gelişmiş kötü amaçlı yazılım, akademik hedefli saldırılar",
      "description":
          "APT42, İran kökenli gelişmiş kalıcı tehdit grubu. Akademik kurumlar, araştırma merkezleri ve teknoloji şirketlerine yönelik saldırılar gerçekleştirir.",
    },
    {
      "name": "APT43 (G0127)",
      "country": "Kuzey Kore",
      "target": "Güney Kore hedefleri, finansal kurumlar, medya",
      "tactic":
          "Spear-phishing, gelişmiş kötü amaçlı yazılım, finansal hedefli saldırılar",
      "description":
          "APT43, Kuzey Kore kökenli gelişmiş kalıcı tehdit grubu. Güney Kore hedeflerine yönelik saldırılar gerçekleştirir.",
    },
    {
      "name": "APT44 (G0129)",
      "country": "Rusya",
      "target": "Ukrayna hedefleri, kritik altyapı, hükümet kurumları",
      "tactic":
          "Spear-phishing, gelişmiş kötü amaçlı yazılım, kritik altyapı saldırıları",
      "description":
          "APT44, Rusya kökenli gelişmiş kalıcı tehdit grubu. Ukrayna hedeflerine yönelik saldırılar gerçekleştirir.",
    },
    {
      "name": "APT45 (G0122)",
      "country": "İran",
      "target": "Orta Doğu hedefleri, enerji sektörü, hükümet kurumları",
      "tactic":
          "Spear-phishing, gelişmiş kötü amaçlı yazılım, bölgesel hedefli saldırılar",
      "description":
          "APT45, İran kökenli gelişmiş kalıcı tehdit grubu. Orta Doğu bölgesindeki hedeflere yönelik saldırılar gerçekleştirir.",
    },
    {
      "name": "Volt Typhoon (G1017)",
      "country": "Çin",
      "target": "ABD kritik altyapı organizasyonları, Guam",
      "tactic": "Web shell'ler, LOTL binary'leri, çalınan kimlik bilgileri",
      "description":
          "Volt Typhoon, en az 2021'den beri aktif olan Çin Halk Cumhuriyeti (PRC) devlet destekli aktör. ABD ve bölgelerindeki kritik altyapı organizasyonlarını hedefler.",
    },
    {
      "name": "Winnti Group (G0044)",
      "country": "Çin",
      "target": "Oyun endüstrisi, genişletilmiş hedef kapsamı",
      "tactic": "Gelişmiş kötü amaçlı yazılım, sektörel hedefli saldırılar",
      "description":
          "Winnti Group, en az 2010'dan beri aktif olan Çin kökenli tehdit grubu. Oyun endüstrisini ağırlıklı olarak hedeflemiştir ancak hedef kapsamını genişletmiştir.",
    },
    {
      "name": "Winter Vivern (G1035)",
      "country": "Rusya/Belarus",
      "target": "Avrupa hükümetleri, STK'lar, Hindistan ve ABD kurbanları",
      "tactic": "Belge tabanlı kimlik avı, sunucu tarafı sömürü",
      "description":
          "Winter Vivern, en az 2020'den beri aktif olan Rus ve Belarus çıkarlarına bağlı grup. Çeşitli Avrupa hükümet ve STK varlıklarını hedefler.",
    },
    {
      "name": "Wizard Spider (G0102)",
      "country": "Rusya",
      "target": "Çeşitli organizasyonlar, büyük şirketler, hastaneler",
      "tactic": "TrickBot, ransomware kampanyaları, çeşitli araçlar",
      "description":
          "Wizard Spider, en az 2016'dan beri TrickBot'in oluşturulması ve dağıtılması ile bilinen Rusya merkezli finansal motivasyonlu tehdit grubu.",
    },
    {
      "name": "ZIRCONIUM (G0128)",
      "country": "Çin",
      "target":
          "2020 ABD başkanlık seçimi ile ilgili kişiler, uluslararası ilişkiler topluluğu",
      "tactic": "Hedefli saldırılar, siber casusluk",
      "description":
          "ZIRCONIUM, en az 2017'den beri aktif olan Çin'den faaliyet gösteren tehdit grubu. 2020 ABD başkanlık seçimi ile ilgili kişileri ve uluslararası ilişkiler topluluğundaki önde gelen liderleri hedefler.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0B132B), Color(0xFF1C2541)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.security,
                        color: Color(0xFFBB86FC),
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "APT Sözlüğü",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Gelişmiş Kalıcı Tehdit Grupları",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: aptGroups.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final apt = aptGroups[index];

                    return Container(
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF1C2541), Color(0xFF0B132B)],
                        ),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: const Color(0xFFBB86FC).withValues(alpha: 0.3),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(16),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AptGroupDetailView(
                                  name: apt["name"] ?? "",
                                  country: apt["country"] ?? "",
                                  target: apt["target"] ?? "",
                                  tactic: apt["tactic"] ?? "",
                                  description: apt["description"] ?? "",
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: const Color(
                                          0xFFBB86FC,
                                        ).withValues(alpha: 0.2),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Text(
                                        apt["name"]?.substring(0, 2) ?? "",
                                        style: const TextStyle(
                                          color: Color(0xFFBB86FC),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 12),
                                    Expanded(
                                      child: Text(
                                        apt["name"] ?? "",
                                        style: const TextStyle(
                                          color: Color(0xFFBB86FC),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color: const Color(
                                          0xFFBB86FC,
                                        ).withValues(alpha: 0.2),
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
                                const SizedBox(height: 12),
                                _detailRow("🌍 Ülke", apt["country"]),
                                _detailRow("🎯 Hedef", apt["target"]),
                                _detailRow("⚔️ Taktikler", apt["tactic"]),
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(
                                      0xFFBB86FC,
                                    ).withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: const Text(
                                    "Detayları Görüntüle",
                                    style: TextStyle(
                                      color: Color(0xFFBB86FC),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value ?? "",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
