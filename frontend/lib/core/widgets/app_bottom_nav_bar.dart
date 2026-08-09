import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../di/injection_container.dart';
import '../services/unread_rooms_counter.dart';

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
    final unreadRoomsCounter = getIt<UnreadRoomsCounter>();

    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: [
        NavigationDestination(
          icon: ValueListenableBuilder<int>(
            valueListenable: unreadRoomsCounter.count,
            builder: (context, unreadCount, _) {
              return Badge(
                isLabelVisible: unreadCount > 0,
                label: Text('$unreadCount'),
                backgroundColor: AppColors.error,
                textColor: AppColors.textPrimary,
                child: const Icon(Icons.chat_bubble_outline),
              );
            },
          ),
          label: 'Чаты',
        ),
        const NavigationDestination(icon: Icon(Icons.search_outlined), label: 'Поиск'),
        const NavigationDestination(icon: Icon(Icons.person_outline), label: 'Профиль'),
      ],
    );
  }
}