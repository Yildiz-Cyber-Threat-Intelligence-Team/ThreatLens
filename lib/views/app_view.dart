import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppView extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const AppView({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(context),
      body: navigationShell,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFF1C2541), Color(0xFF0B132B)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border(
            top: BorderSide(
              color: const Color(0xFFBB86FC).withAlpha(51),
              width: 1,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(76),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: _buildNavItem(
                    context,
                    index: 0,
                    currentIndex: navigationShell.currentIndex,
                    icon: Icons.face,
                    label: 'Ana Sayfa',
                    onTap: () => navigationShell.goBranch(0),
                  ),
                ),
                Expanded(
                  child: _buildNavItem(
                    context,
                    index: 1,
                    currentIndex: navigationShell.currentIndex,
                    icon: Icons.quiz,
                    label: 'Quiz',
                    onTap: () => navigationShell.goBranch(1),
                  ),
                ),
                Expanded(
                  child: _buildNavItem(
                    context,
                    index: 2,
                    currentIndex: navigationShell.currentIndex,
                    icon: Icons.security,
                    label: 'APT Sözlüğü',
                    onTap: () => navigationShell.goBranch(2),
                  ),
                ),
                Expanded(
                  child: _buildNavItem(
                    context,
                    index: 3,
                    currentIndex: navigationShell.currentIndex,
                    icon: Icons.emoji_events,
                    label: 'Liderlik',
                    onTap: () => navigationShell.goBranch(3),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    BuildContext context, {
    required int index,
    required int currentIndex,
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
                  colors: [Color(0xFFBB86FC), Color(0xFF7C3AED)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? null : Colors.transparent,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 24,
              color: isSelected ? Colors.white : Colors.white70,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white70,
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBarWidget(BuildContext context) {
    return AppBar(
      title: const Text(
        'ThreatLens',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
      ),
      actions: [
        IconButton(
          onPressed: () {
            GoRouter.of(context).go('/settings');
          },
          icon: const Icon(Icons.settings),
        ),
        IconButton(
          onPressed: () {
            GoRouter.of(context).go('/profile');
          },
          icon: const Icon(Icons.person),
        ),
      ],
    );
  }
}
