import 'package:flutter/widgets.dart';

class BottomNavVisibility {
  final ValueNotifier<bool> visible = ValueNotifier(true);
  int _hiddenCount = 0;
  bool _updateScheduled = false;

  void push() {
    _hiddenCount++;
    _scheduleUpdate();
  }

  void pop() {
    _hiddenCount = (_hiddenCount - 1).clamp(0, 1 << 30);
    _scheduleUpdate();
  }

  // счётчик меняется сразу, а саму нотификацию слушателей откладываем до конца текущего фрейма
  void _scheduleUpdate() {
    if (_updateScheduled) return;
    _updateScheduled = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _updateScheduled = false;
      visible.value = _hiddenCount == 0;
    });
  }
}