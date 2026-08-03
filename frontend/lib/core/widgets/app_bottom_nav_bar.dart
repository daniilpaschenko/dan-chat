import 'package:flutter/material.dart';

// индекс и переключение приходят снаружи через app_shell
class AppBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const AppBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: const [
        NavigationDestination(icon: Icon(Icons.chat_bubble_outline), label: 'Чаты'),
        NavigationDestination(icon: Icon(Icons.search_outlined), label: 'Поиск'),
        NavigationDestination(icon: Icon(Icons.person_outline), label: 'Профиль'),
      ],
    );
  }
}