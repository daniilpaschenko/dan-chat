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

  // GROUP CREATION
  static const String createGroup = '/create-group';

  // GROUP PROFILE
  static const String groupProfile = '/groups/:roomId';
  static String groupProfilePath(String roomId) => '/groups/$roomId';

  static const String addParticipants = '/groups/:roomId/add-participants';
  static String addParticipantsPath(String roomId) => '/groups/$roomId/add-participants';

  // SETTINGS
  static const String settings = '/settings';

  // ДРУГОЕ
  static const String splash = '/splash';
}