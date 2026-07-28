import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../di/injection_container.dart';
import 'bottom_nav_visibility.dart';
import '../widgets/app_bottom_nav_bar.dart';

class AppShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const AppShell({super.key, required this.navigationShell});

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final visibility = getIt<BottomNavVisibility>();

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: ValueListenableBuilder<bool>(
        valueListenable: visibility.visible,
        builder: (context, isVisible, _) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            transitionBuilder: (child, animation) => FadeTransition(
              opacity: animation,
              child: SizeTransition(
                sizeFactor: animation,
                alignment: Alignment.topCenter,
                child: child,
              ),
            ),
            child: isVisible
                ? AppBottomNavBar(
                    key: const ValueKey('bottom_nav_visible'),
                    selectedIndex: navigationShell.currentIndex,
                    onDestinationSelected: _onTap,
                  )
                : const SizedBox.shrink(key: ValueKey('bottom_nav_hidden')),
          );
        },
      ),
    );
  }
}