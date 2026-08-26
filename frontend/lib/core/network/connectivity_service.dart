import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  bool _isOnline = true;
  StreamSubscription<List<ConnectivityResult>>? _sub;
  final _controller = StreamController<bool>.broadcast();

  bool get isOnline => _isOnline;
  Stream<bool> get onStatusChanged => _controller.stream;

  Future<void> init() async {
    final results = await Connectivity().checkConnectivity();
    _update(results);
    _sub = Connectivity().onConnectivityChanged.listen(_update);
  }

  void _update(List<ConnectivityResult> results) {
    final hasConnection = results.any((r) =>
        r == ConnectivityResult.wifi ||
        r == ConnectivityResult.mobile ||
        r == ConnectivityResult.ethernet ||
        r == ConnectivityResult.vpn);

    if (hasConnection != _isOnline) {
      _isOnline = hasConnection;
      _controller.add(_isOnline);
    }
  }

  void dispose() {
    _sub?.cancel();
    _controller.close();
  }
}