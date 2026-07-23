class RoutePaths {
  RoutePaths._();

  static const String login = '/login';
  static const String register = '/register';
  static const String chatList = '/chats';
  static const String chatRoom = '/chats/:roomId';
  static const String splash = '/splash';

  static String chatRoomPath(String roomId) => '/chats/$roomId';
}