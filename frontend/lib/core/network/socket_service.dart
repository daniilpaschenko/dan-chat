import 'dart:async';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'api_constants.dart';

// синглтон-обёртка над socket_io_client
// одно соединение на всё приложение, поднимается после логина, закрывается при логауте
class SocketService {
  io.Socket? _socket; // соединение с сервером, null если не подключены
  String? _currentToken; // под каким токеном подключены

  // broadcast streams, чтобы несколько слушателей могли подписаться на события сокета
  // хранит поток новых сообщений
  final _messageNewController = StreamController<Map<String, dynamic>>.broadcast();
  // хранит поток событий начала печати
  final _typingStartController = StreamController<Map<String, dynamic>>.broadcast();
  // хранит поток событий окончания печати
  final _typingStopController = StreamController<Map<String, dynamic>>.broadcast();
  // хранит поток обновлений присутствия пользователей
  final _presenceUpdateController = StreamController<Map<String, dynamic>>.broadcast();
  // хранит поток событий прочтения сообщений
  final _messageReadController = StreamController<Map<String, dynamic>>.broadcast();
  // хранит поток событий с комнатами
  final _roomCreatedController = StreamController<Map<String, dynamic>>.broadcast();
  final _roomUpdatedController = StreamController<Map<String, dynamic>>.broadcast();
  final _roomDeletedController = StreamController<Map<String, dynamic>>.broadcast();

  // геттеры для потоков, чтобы подписчики могли слушать события
  // только слушать, не иметь доступа к контроллерам
  Stream<Map<String, dynamic>> get messageNew$ => _messageNewController.stream;
  Stream<Map<String, dynamic>> get typingStart$ => _typingStartController.stream;
  Stream<Map<String, dynamic>> get typingStop$ => _typingStopController.stream;
  Stream<Map<String, dynamic>> get presenceUpdate$ => _presenceUpdateController.stream;
  Stream<Map<String, dynamic>> get messageRead$ => _messageReadController.stream;
  Stream<Map<String, dynamic>> get roomCreated$ => _roomCreatedController.stream;
  Stream<Map<String, dynamic>> get roomUpdated$ => _roomUpdatedController.stream;
  Stream<Map<String, dynamic>> get roomDeleted$ => _roomDeletedController.stream;

  // проверка соединения
  bool get isConnected => _socket?.connected ?? false;

  void connect(String token) {
    // не пересоздаём, если уже есть активное соединение с этим же токеном
    if (_socket != null && _currentToken == token) return;

    if (_socket != null) {
      _hardDisconnect();
    }

    _currentToken = token;

    _socket = io.io(
      ApiConstants.socketUrl,
      <String, dynamic>{
        'transports': ['websocket'],
        'autoConnect': false,
        'reconnection': false,
        'forceNew': true, // принудительно создаём новое соединение, чтобы не было проблем с кэшированным manager'ом (переключение между аккаунтами)
        'auth': {'token': token},
      },
    );

    // регистрация событий сокета
    _socket!
      //..onConnect((_) => print('[socket] connected'))
      //..onDisconnect((_) => print('[socket] disconnected'))
      //..onConnectError((err) => print('[socket] connect_error: $err'))
      // реагирует на события, отправленные севрером, и добавляет их в соответствующие стримы
      ..on('message:new', (data) =>
          _messageNewController.add(Map<String, dynamic>.from(data as Map)))
      ..on('message:read', (data) =>
          _messageReadController.add(Map<String, dynamic>.from(data as Map)))
      ..on('typing:start', (data) =>
          _typingStartController.add(Map<String, dynamic>.from(data as Map)))
      ..on('typing:stop', (data) =>
          _typingStopController.add(Map<String, dynamic>.from(data as Map)))
      ..on('presence:update', (data) =>
          _presenceUpdateController.add(Map<String, dynamic>.from(data as Map)))
      ..on('room:created', (data) =>
          _roomCreatedController.add(Map<String, dynamic>.from(data as Map)))
      ..on('room:updated', (data) =>
          _roomUpdatedController.add(Map<String, dynamic>.from(data as Map)))
      ..on('room:deleted', (data) =>
          _roomDeletedController.add(Map<String, dynamic>.from(data as Map)))
      // после регистрации всех событий подключаемся к серверу
      ..connect();
  }

  void disconnect() {
    _hardDisconnect();
    _currentToken = null;
  }

  void _hardDisconnect() {
    _socket?.clearListeners(); // снимаем все хендлеры перед закрытием
    _socket?.disconnect();
    // освободить ресурсы
    _socket?.dispose();
    _socket = null;
  }

  /// [onAck] вызовется с ответом сервера: {ok:true, participantsStatus:[...]} или {ok:false, message:'...'}
  void joinRoom(String roomId, {void Function(Map<String, dynamic> ack)? onAck}) {
    if (onAck == null) {
      _socket?.emit('room:join', roomId);
      return;
    }
    _socket?.emitWithAck(
      'room:join',
      roomId,
      ack: (data) => onAck(Map<String, dynamic>.from(data as Map)),
    );
  }

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
  void markRead(String roomId) => _socket?.emit('message:read', {'roomId': roomId});
}