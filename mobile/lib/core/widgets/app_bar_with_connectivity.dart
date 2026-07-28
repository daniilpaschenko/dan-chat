import 'package:flutter/material.dart';
import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class AppBarWithConnectivity extends StatefulWidget implements PreferredSizeWidget {
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

  @override
  State<AppBarWithConnectivity> createState() => _AppBarWithConnectivityState();

  // обязательное поле для PreferredSizeWidget
  // возвращаем стандартную высоту AppBar из темы
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarWithConnectivityState extends State<AppBarWithConnectivity> {
  bool _isOnline = true;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _initConnectivity();
  }

  Future<void> _initConnectivity() async {
    final results = await Connectivity().checkConnectivity();
    _updateConnectionStatus(results);

    _connectivitySubscription = Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    final hasConnection = results.any((result) => 
      result == ConnectivityResult.wifi || 
      result == ConnectivityResult.mobile ||
      result == ConnectivityResult.ethernet ||
      result == ConnectivityResult.vpn
    );
    
    if (mounted) {
      setState(() {
        _isOnline = hasConnection;
      });
    }
  }

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(_isOnline ? widget.onlineTitle : widget.offlineTitle),
      centerTitle: widget.centerTitle,
      actions: widget.actions,
      leading: widget.leading,
    );
  }
}