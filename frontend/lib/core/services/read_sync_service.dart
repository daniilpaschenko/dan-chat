import 'dart:async';

// лёгкий broadcast-канал между блоками, которые физически не видят друг друга через BuildContext
// чтобы ChatRoomBloc мог сообщить RoomListBloc, что комната прочитана, не дожидаясь возврата на экран списка
class ReadSyncService {
  final _roomReadController = StreamController<String>.broadcast();

  Stream<String> get roomRead$ => _roomReadController.stream;

  void notifyRoomRead(String roomId) => _roomReadController.add(roomId);
}