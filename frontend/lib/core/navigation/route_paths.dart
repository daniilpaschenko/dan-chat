class RoutePaths {
  RoutePaths._();

  // AUTH
  static const String login = '/login';
  static const String register = '/register';

  // CHATS
  static const String chatList = '/chats';
  static const String chatRoom = ':roomId';
  static String chatRoomPath(String roomId) => '/chats/$roomId';
  
  // PROFILE
  static const String profile = '/profile';
  static const String userProfile = '/profile/:userId';

  // SEARCH
  static const String search = '/search';

  // GROUP
  static const String createGroup = '/create-group';

  // SETTINGS
  static const String settings = '/settings';

  // ДРУГОЕ
  static const String splash = '/splash';
}