import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:threat_lens/services/progress_service.dart';

class LessonDetailView extends StatelessWidget {
  final Map<String, dynamic> module;

  const LessonDetailView({super.key, required this.module});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B132B),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.all(20),
                itemCount: module["lessons"].length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) {
                  final lesson = module["lessons"][index];
                  return _buildLessonCard(context, lesson, index + 1);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1C2541), Color(0xFF0B132B)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border(
          bottom: BorderSide(
            color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
            width: 1,
          ),
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
            onTap: () => context.pop(),
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  module["title"],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  module["subtitle"],
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFBB86FC).withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.book, color: Color(0xFFBB86FC), size: 24),
          ),
        ],
      ),
    );
  }

  Widget _buildLessonCard(
    BuildContext context,
    Map<String, dynamic> lesson,
    int index,
  ) {
    return FutureBuilder<double>(
      future: ProgressService.getLessonCompletionStatus(lesson['title']),
      builder: (context, snapshot) {
        final completionStatus = snapshot.data ?? 0.0;
        final isCompleted = completionStatus >= 1.0;
        final isStarted = completionStatus > 0.0;

        return Container(
          height: 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isCompleted
                  ? [const Color(0xFF1C2541), const Color(0xFF0B132B)]
                  : [const Color(0xFF1C2541), const Color(0xFF0B132B)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isCompleted
                  ? Colors.green.withValues(alpha: 0.5)
                  : isStarted
                  ? Colors.yellow.withValues(alpha: 0.5)
                  : const Color(0xFFBB86FC).withValues(alpha: 0.2),
              width: isCompleted || isStarted ? 2 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {
                final lessonWithModule = {...lesson, 'module': module};
                context.push('/lesson-content', extra: lessonWithModule);
              },
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: Tooltip(
                              message: lesson["title"],
                              preferBelow: false,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1C2541),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: const Color(
                                    0xFFBB86FC,
                                  ).withValues(alpha: 0.3),
                                  width: 1,
                                ),
                              ),
                              textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                              child: Text(
                                lesson["title"],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Flexible(
                            child: Tooltip(
                              message: _getLessonDescription(lesson["title"]),
                              preferBelow: false,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1C2541),
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: const Color(
                                    0xFFBB86FC,
                                  ).withValues(alpha: 0.3),
                                  width: 1,
                                ),
                              ),
                              textStyle: const TextStyle(
                                color: Colors.white70,
                                fontSize: 13,
                                fontWeight: FontWeight.w400,
                              ),
                              child: Text(
                                _getLessonDescription(lesson["title"]),
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (isCompleted || isStarted)
                          Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: isCompleted
                                  ? Colors.green.withValues(alpha: 0.2)
                                  : Colors.yellow.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              isCompleted ? "Tamamlandı" : "Başlandı",
                              style: TextStyle(
                                color: isCompleted
                                    ? Colors.green
                                    : Colors.yellow,
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        if (isCompleted || isStarted)
                          Container(
                            margin: const EdgeInsets.only(right: 8),
                            padding: const EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: isCompleted
                                  ? Colors.green.withValues(alpha: 0.2)
                                  : Colors.yellow.withValues(alpha: 0.2),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Icon(
                              isCompleted
                                  ? Icons.check_circle
                                  : Icons.play_circle,
                              size: 16,
                              color: isCompleted ? Colors.green : Colors.yellow,
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
                            size: 16,
                            color: Color(0xFFBB86FC),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String _getLessonDescription(String title) {
    switch (title) {
      case 'Siber Güvenlik Nedir?':
        return 'Temel kavramlar ve prensipler';
      case 'Tehdit Türleri':
        return 'Siber tehditlerin sınıflandırılması';
      case 'Güvenlik Önlemleri':
        return 'Korunma yöntemleri ve stratejiler';
      case 'Ağ Protokolleri':
        return 'Güvenli iletişim protokolleri';
      case 'Firewall':
        return 'Ağ güvenlik duvarları';
      case 'VPN Teknolojisi':
        return 'Sanal özel ağ teknolojileri';
      case 'Wireless Güvenlik':
        return 'Kablosuz ağ güvenliği';
      case 'Ağ İzleme':
        return 'Ağ trafiği analizi';
      case 'Simetrik Şifreleme':
        return 'Aynı anahtar ile şifreleme';
      case 'Asimetrik Şifreleme':
        return 'Açık/gizli anahtar çifti';
      case 'Hash Fonksiyonları':
        return 'Tek yönlü şifreleme';
      case 'Dijital İmzalar':
        return 'Kimlik doğrulama ve bütünlük';
      case 'Penetrasyon Testi':
        return 'Güvenlik açıklarını test etme';
      case 'Reconnaissance':
        return 'Hedef hakkında bilgi toplama';
      case 'Saldırı Teknikleri':
        return 'Saldırı yöntemleri ve araçlar';
      default:
        return 'Ders içeriği';
    }
  }
}
