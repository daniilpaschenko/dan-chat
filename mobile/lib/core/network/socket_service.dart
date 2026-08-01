import 'dart:async';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'api_constants.dart';

// синглтон-обёртка над socket_io_client
// одно соединение на всё приложение, поднимается после логина, закрывается при логауте
class SocketService {
  io.Socket? _socket; // соединение с сервером, null если не подключены

  // broadcast streams, чтобы несколько слушателей могли подписаться на события сокета
  // хранит поток новых сообщений
  final _messageNewController = StreamController<Map<String, dynamic>>.broadcast();
  // хранит поток событий начала печати
  final _typingStartController = StreamController<Map<String, dynamic>>.broadcast();
  // хранит поток событий окончания печати
  final _typingStopController = StreamController<Map<String, dynamic>>.broadcast();
  // хранит поток обновлений присутствия пользователей
  final _presenceUpdateController = StreamController<Map<String, dynamic>>.broadcast();

  // геттеры для потоков, чтобы подписчики могли слушать события
  // только слушать, не иметь доступа к контроллерам
  Stream<Map<String, dynamic>> get messageNew$ => _messageNewController.stream;
  Stream<Map<String, dynamic>> get typingStart$ => _typingStartController.stream;
  Stream<Map<String, dynamic>> get typingStop$ => _typingStopController.stream;
  Stream<Map<String, dynamic>> get presenceUpdate$ => _presenceUpdateController.stream;

  // проверка соединения
  bool get isConnected => _socket?.connected ?? false;

  void connect(String token) {
    // не пересоздаём, если уже есть активное соединение
    if (_socket != null) return;

    // создаём клиент сокета
    _socket = io.io( 
      ApiConstants.socketUrl,
      io.OptionBuilder()
          // использовать только websocket 
          .setTransports(['websocket'])
          // не подключаемся автоматически, подключим вручную после установки токена
          .disableAutoConnect()
          .setAuth({'token': token})
          .build(),
    );

    // регистрация событий сокета
    _socket!
      ..onConnect((_) => print('[socket] connected'))
      ..onDisconnect((_) => print('[socket] disconnected'))
      ..onConnectError((err) => print('[socket] connect_error: $err'))
      // реагирует на события, отправленные севрером, и добавляет их в соответствующие стримы
      ..on('message:new', (data) =>
          _messageNewController.add(Map<String, dynamic>.from(data as Map)))
      ..on('typing:start', (data) =>
          _typingStartController.add(Map<String, dynamic>.from(data as Map)))
      ..on('typing:stop', (data) =>
          _typingStopController.add(Map<String, dynamic>.from(data as Map)))
      ..on('presence:update', (data) =>
          _presenceUpdateController.add(Map<String, dynamic>.from(data as Map)))
      // после регитрации всех событий подключаемся к серверу
      ..connect();
  }

  void disconnect() {
    // закрыть соединение
    _socket?.disconnect();
    // освободить ресурсы
    _socket?.dispose();
    _socket = null;
  }

  // отправить события на сервер
  void joinRoom(String roomId) => _socket?.emit('room:join', roomId);

  void leaveRoom(String roomId) => _socket?.emit('room:leave', roomId);

  // ack — acknowledgment callback, вызывается сервером после обработки события
  void sendMessage({
    required String roomId,
    required String text,
    required void Function(Map<String, dynamic> ack) onAck,
  }) {
    if (_socket == null || !_socket!.connected) {
      onAck({'ok': false, 'message': 'Нет соединения с сервером'});
      return;
    }
    _socket!.emitWithAck(
      'message:send',
      {'roomId': roomId, 'text': text},
      // вызывается когда сервер пришлёт ack
      ack: (data) => onAck(Map<String, dynamic>.from(data as Map)),
    );
  }

  // отправить события на сервер
  void startTyping(String roomId) => _socket?.emit('typing:start', {'roomId': roomId});
  
  void stopTyping(String roomId) => _socket?.emit('typing:stop', {'roomId': roomId});
}