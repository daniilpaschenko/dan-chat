import 'package:flutter/material.dart';
import '../../core/di/injection_container.dart';
import '../network/connectivity_service.dart';

class AppBarWithConnectivity extends StatelessWidget implements PreferredSizeWidget {
  final String onlineTitle;
  final String offlineTitle;
  final bool centerTitle;
  final List<Widget>? actions;
  final Widget? leading;

  const AppBarWithConnectivity({
    super.key,
    this.onlineTitle = 'Загрузка...', // значение по умолчанию если не передать ничего
    this.offlineTitle = 'Соединение...',
    this.centerTitle = false,
    this.actions,
    this.leading,
  });
  
  // обязательное поле для PreferredSizeWidget
  // возвращаем стандартную высоту AppBar из темы
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final connectivityService = getIt<ConnectivityService>();

    return StreamBuilder<bool>(
      stream: connectivityService.onStatusChanged,
      initialData: connectivityService.isOnline,
      builder: (context, snapshot) {
        final isOnline = snapshot.data ?? true;
        return AppBar(
          title: Text(isOnline ? onlineTitle : offlineTitle),
          centerTitle: centerTitle,
          actions: actions,
          leading: leading,
        );
      },
    );
  }
}