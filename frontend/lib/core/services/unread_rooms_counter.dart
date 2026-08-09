import 'package:flutter/foundation.dart';

// синглтон-счётчик "сколько комнат с unreadCount > 0"
// нужен, чтобы показать бейдж на нижнем баре (иконка "Чаты"),
// не завися от жизненного цикла RoomListBloc (он factory и пересоздаётся)
class UnreadRoomsCounter {
  final ValueNotifier<int> count = ValueNotifier<int>(0);

  void update(int value) {
    if (count.value != value) count.value = value;
  }

  void reset() => count.value = 0;
}