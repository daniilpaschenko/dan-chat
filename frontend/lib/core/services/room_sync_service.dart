import 'dart:async';

// лёгкие broadcast-каналы между блоками, которые физически не видят друг друга через BuildContext
// чтобы ChatRoomBloc мог сообщить RoomListBloc, что комната прочитана, не дожидаясь возврата на экран списка
// + чтобы RoomListBloc мог сообщить ChatRoomBloc, что комната удалена
class RoomSyncService {
  final _roomReadController = StreamController<String>.broadcast();
  final _roomRemovedController = StreamController<String>.broadcast();

  Stream<String> get roomRead$ => _roomReadController.stream;
  Stream<String> get roomRemoved$ => _roomRemovedController.stream;

  void notifyRoomRead(String roomId) => _roomReadController.add(roomId);
  void notifyRoomRemoved(String roomId) => _roomRemovedController.add(roomId);
}