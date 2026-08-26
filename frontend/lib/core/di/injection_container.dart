// БИБЛИОТЕКИ
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

// CORE
import '../navigation/app_router.dart';
import '../navigation/auth_state_notifier.dart';
import '../navigation/bottom_nav_visibility.dart';
import '../services/unread_rooms_counter.dart';
import '../network/dio_client.dart';
import '../network/connectivity_service.dart';
import '../network/socket_service.dart';
import '../storage/hive_service.dart';
import '../storage/secure_storage_service.dart';
import '../storage/web_token_holder.dart';
import '../services/room_sync_service.dart';
import '../services/push_service.dart';
import '../services/local_notification_service.dart';


// AUTH
import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/data/repositories/auth_repository.dart';
import '../../features/auth/domain/interfaces/i_auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/auth/domain/usecases/logout_usecase.dart';
import '../../features/auth/presentation/blocs/auth_bloc.dart';

// ROOM
import '../../features/room/data/datasources/room_remote_datasource.dart';
import '../../features/room/data/datasources/room_local_datasource.dart';
import '../../features/room/data/repositories/room_repository.dart';
import '../../features/room/domain/interfaces/i_room_repository.dart';
import '../../features/room/domain/usecases/get_my_rooms_usecase.dart';
import '../../features/room/domain/usecases/get_room_by_id_usecase.dart';
import '../../features/room/domain/usecases/create_room_usecase.dart';
import '../../features/room/domain/usecases/mark_room_as_read_usecase.dart';
import '../../features/room/domain/usecases/add_participant_usecase.dart';
import '../../features/room/domain/usecases/remove_participant_usecase.dart';
import '../../features/room/domain/usecases/update_participant_role_usecase.dart';
import '../../features/room/domain/usecases/delete_room_usecase.dart';
import '../../features/room/domain/usecases/leave_room_usecase.dart';
import '../../features/room/domain/usecases/parse_socket_room_usecase.dart';
import '../../features/room/domain/usecases/upload_room_avatar_usecase.dart';
import '../../features/room/domain/usecases/change_group_name_usecase.dart';
import '../../features/room/presentation/blocs/room/room_list_bloc.dart';

import '../../features/room/presentation/blocs/group/create_group_bloc.dart';
import '../../features/room/presentation/blocs/group/group_profile_bloc.dart';
import '../../features/room/presentation/blocs/group/add_participants_bloc.dart';

// USER
import '../../features/user/data/datasources/user_remote_datasource.dart';
import '../../features/user/data/datasources/user_local_datasource.dart';
import '../../features/user/data/repositories/user_repository.dart';
import '../../features/user/domain/interfaces/i_user_repository.dart';
import '../../features/user/domain/usecases/search_users_usecase.dart';
import '../../features/user/domain/usecases/get_my_profile_usecase.dart';
import '../../features/user/domain/usecases/get_user_profile_usecase.dart';
import '../../features/user/domain/usecases/upload_avatar_usecase.dart';
import '../../features/user/domain/usecases/save_device_token_usecase.dart';
import '../../features/user/domain/usecases/remove_device_token_usecase.dart';
import '../../features/user/domain/usecases/change_username_usecase.dart';
import '../../features/user/presentation/blocs/search/search_bloc.dart';
import '../../features/user/presentation/blocs/profile/profile_bloc.dart';

// MESSAGE
import '../../features/message/data/datasources/message_remote_datasource.dart';
import '../../features/message/data/datasources/message_local_datasource.dart';
import '../../features/message/data/repositories/message_repository.dart';
import '../../features/message/domain/interfaces/i_message_repository.dart';
import '../../features/message/domain/usecases/get_room_messages_usecase.dart';
import '../../features/message/domain/usecases/send_message_usecase.dart';
import '../../features/message/domain/usecases/parse_socket_message_usecase.dart';
import '../../features/message/domain/usecases/cache_incoming_socket_message_usecase.dart';
import '../../features/message/domain/usecases/clear_cached_messages_usecase.dart';
import '../../features/message/domain/usecases/sync_latest_messages_usecase.dart';
import '../../features/message/presentation/blocs/chat_room_bloc.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupDependencies() async {
  // core/storage
  getIt.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );
  getIt.registerLazySingleton<SecureStorageService>(
    () => SecureStorageService(getIt<FlutterSecureStorage>()),
  );
  getIt.registerLazySingleton<WebTokenHolder>(() => WebTokenHolder());
  getIt.registerLazySingleton<HiveService>(() => HiveService());

  getIt.registerLazySingleton<ConnectivityService>(() => ConnectivityService());

  getIt.registerLazySingleton<SocketService>(() => SocketService());

  // core/network
  getIt.registerLazySingleton<Dio>(
    () => DioClient(
      getIt<SecureStorageService>(),
      getIt<WebTokenHolder>(),
      onAuthFailure: () => getIt<AuthStateNotifier>().logOut(),
    ).build(),
  );

  // features/auth/data — регистрируем раньше AuthStateNotifier, т.к. ему нужен IAuthRepository
  getIt.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasource(getIt<Dio>()),
  );
  getIt.registerLazySingleton<IAuthRepository>(
    () => AuthRepository(
      getIt<AuthRemoteDatasource>(),
      getIt<SecureStorageService>(),
      getIt<WebTokenHolder>(),
    ),
  );

  getIt.registerLazySingleton<LocalNotificationService>(() => LocalNotificationService());
  getIt.registerLazySingleton<PushService>(
    () => PushService(
      getIt<LocalNotificationService>(),
      getIt<SocketService>(),
      () => getIt<AuthStateNotifier>().currentUserId,
    ),
  );

  getIt.registerLazySingleton<UserRemoteDatasource>(
    () => UserRemoteDatasource(getIt<Dio>()),
  );
  getIt.registerLazySingleton(() => UserLocalDatasource());
  getIt.registerLazySingleton<IUserRepository>(
    () => UserRepository(getIt<UserRemoteDatasource>(), getIt<UserLocalDatasource>()),
  );
  getIt.registerLazySingleton<SaveDeviceTokenUseCase>(
    () => SaveDeviceTokenUseCase(getIt<IUserRepository>()),
  );
  getIt.registerLazySingleton<RemoveDeviceTokenUseCase>(
    () => RemoveDeviceTokenUseCase(getIt<IUserRepository>()),
  );

  getIt.registerLazySingleton<AuthStateNotifier>(
    () => AuthStateNotifier(
      getIt<SecureStorageService>(),
      getIt<WebTokenHolder>(),
      getIt<HiveService>(),
      getIt<SocketService>(),
      getIt<UnreadRoomsCounter>(),
      getIt<IAuthRepository>(),
      getIt<PushService>(),
      getIt<SaveDeviceTokenUseCase>(),
      getIt<RemoveDeviceTokenUseCase>(),
    ),
  );

  getIt.registerLazySingleton<GoRouter>(
    () => AppRouter(getIt<AuthStateNotifier>()).build(),
  );

  getIt.registerLazySingleton(() => BottomNavVisibility());
  getIt.registerLazySingleton(() => UnreadRoomsCounter());

  getIt.registerLazySingleton<RoomSyncService>(() => RoomSyncService());

  // features/auth/domain
  getIt.registerLazySingleton<LoginUseCase>(
    () => LoginUseCase(getIt<IAuthRepository>()),
  );
  getIt.registerLazySingleton<RegisterUseCase>(
    () => RegisterUseCase(getIt<IAuthRepository>()),
  );
  getIt.registerLazySingleton<LogoutUseCase>(
    () => LogoutUseCase(getIt<IAuthRepository>()),
  );

  // features/auth/presentation
  // bloc регистрируем как factory потому что
  // каждый экран, должен получать свежий инстанс со стейтом Initial
  // а не переиспользовать старый после logout
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
      loginUseCase: getIt<LoginUseCase>(),
      registerUseCase: getIt<RegisterUseCase>(),
      logoutUseCase: getIt<LogoutUseCase>(),
      authStateNotifier: getIt<AuthStateNotifier>(),
    ),
  );

  // features/room/data
  getIt.registerLazySingleton<RoomRemoteDatasource>(
    () => RoomRemoteDatasource(getIt<Dio>()),
  );
  getIt.registerLazySingleton(() => RoomLocalDatasource());
  getIt.registerLazySingleton<IRoomRepository>(
    () => RoomRepository(
      getIt<RoomRemoteDatasource>(),
      getIt<RoomLocalDatasource>()
    ),
  );

  // features/room/domain
  getIt.registerLazySingleton<GetMyRoomsUseCase>(
    () => GetMyRoomsUseCase(getIt<IRoomRepository>()),
  );
  getIt.registerLazySingleton<GetRoomByIdUseCase>(
    () => GetRoomByIdUseCase(getIt<IRoomRepository>()),
  );
  getIt.registerLazySingleton<CreateRoomUseCase>(
    () => CreateRoomUseCase(getIt<IRoomRepository>()),
  );
  getIt.registerLazySingleton<MarkRoomAsReadUseCase>(
    () => MarkRoomAsReadUseCase(getIt<IRoomRepository>()),
  );
  getIt.registerLazySingleton<AddParticipantUseCase>(
    () => AddParticipantUseCase(getIt<IRoomRepository>()),
  );
  getIt.registerLazySingleton<RemoveParticipantUseCase>(
    () => RemoveParticipantUseCase(getIt<IRoomRepository>()),
  );
  getIt.registerLazySingleton<UpdateParticipantRoleUseCase>(
    () => UpdateParticipantRoleUseCase(getIt<IRoomRepository>()),
  );
  getIt.registerLazySingleton<UploadRoomAvatarUseCase>(
    () => UploadRoomAvatarUseCase(getIt<IRoomRepository>()),
  );
  getIt.registerLazySingleton<DeleteRoomUseCase>(
    () => DeleteRoomUseCase(getIt<IRoomRepository>()),
  );
  getIt.registerLazySingleton<LeaveRoomUseCase>(
    () => LeaveRoomUseCase(getIt<IRoomRepository>()),
  );
  getIt.registerLazySingleton<ChangeGroupNameUsecase>(
    () => ChangeGroupNameUsecase(getIt<IRoomRepository>()),
  );
  getIt.registerLazySingleton<ParseSocketRoomUseCase>(
    () => ParseSocketRoomUseCase(getIt<IRoomRepository>()),
  );

  // features/room/presentation
  // также нужен чистый Initial при заходе
  getIt.registerFactory<RoomListBloc>(
    () => RoomListBloc(
      getMyRoomsUseCase: getIt<GetMyRoomsUseCase>(),
      markRoomAsReadUseCase: getIt<MarkRoomAsReadUseCase>(),
      parseSocketRoomUseCase: getIt<ParseSocketRoomUseCase>(),
      socketService: getIt<SocketService>(),
      roomSyncService: getIt<RoomSyncService>(),
      unreadRoomsCounter: getIt<UnreadRoomsCounter>(),
      currentUserId: getIt<AuthStateNotifier>().currentUserId,
    ),
  );

  getIt.registerFactory<CreateGroupBloc>(
    () => CreateGroupBloc(
      searchUsersUseCase: getIt<SearchUsersUseCase>(),
      createRoomUseCase: getIt<CreateRoomUseCase>(),
    ),
  );

  getIt.registerFactoryParam<GroupProfileBloc, String, void>(
    (roomId, _) => GroupProfileBloc(
      roomId: roomId,
      getRoomByIdUseCase: getIt<GetRoomByIdUseCase>(),
      removeParticipantUseCase: getIt<RemoveParticipantUseCase>(),
      updateParticipantRoleUseCase: getIt<UpdateParticipantRoleUseCase>(),
      uploadRoomAvatarUseCase: getIt<UploadRoomAvatarUseCase>(),
      changeGroupNameUsecase: getIt<ChangeGroupNameUsecase>(),
      socketService: getIt<SocketService>(),
    ),
  );

  getIt.registerFactoryParam<AddParticipantsBloc, String, Set<String>>(
    (roomId, existingParticipantIds) => AddParticipantsBloc(
      roomId: roomId,
      existingParticipantIds: existingParticipantIds,
      searchUsersUseCase: getIt<SearchUsersUseCase>(),
      addParticipantUseCase: getIt<AddParticipantUseCase>(),
    ),
  );

  // features/user/domain
  getIt.registerLazySingleton<SearchUsersUseCase>(
    () => SearchUsersUseCase(getIt<IUserRepository>()),
  );
  getIt.registerLazySingleton<GetMyProfileUseCase>(
    () => GetMyProfileUseCase(getIt<IUserRepository>()),
  );
  getIt.registerLazySingleton<GetUserProfileUseCase>(
    () => GetUserProfileUseCase(getIt<IUserRepository>()),
  );
  getIt.registerLazySingleton<UploadAvatarUseCase>(
    () => UploadAvatarUseCase(getIt<IUserRepository>()),
  );
  getIt.registerLazySingleton<ChangeUsernameUsecase>(
    () => ChangeUsernameUsecase(getIt<IUserRepository>()),
  );

  // features/user/presentation - ProfileBloc
  getIt.registerFactoryParam<ProfileBloc, String?, void>(
    (userId, _) => ProfileBloc(
      userId: userId,
      getMyProfileUseCase: getIt<GetMyProfileUseCase>(),
      getUserProfileUseCase: getIt<GetUserProfileUseCase>(),
      uploadAvatarUseCase: getIt<UploadAvatarUseCase>(),
      createRoomUseCase: getIt<CreateRoomUseCase>(),
      changeUsernameUsecase: getIt<ChangeUsernameUsecase>(),
      socketService: getIt<SocketService>(),
    ),
  );

  // features/user/presentation - SearchBloc
  // также нужен чистый Initial при заходе
  getIt.registerFactory<SearchBloc>(
    () => SearchBloc(
      searchUsersUseCase: getIt<SearchUsersUseCase>(),
      socketService: getIt<SocketService>(),
    ),
  );

  // features/message/data
  getIt.registerLazySingleton<MessageRemoteDatasource>(
    () => MessageRemoteDatasource(getIt<Dio>()),
  );
  getIt.registerLazySingleton(() => MessageLocalDatasource());
  getIt.registerLazySingleton<IMessageRepository>(
    () => MessageRepository(
      getIt<MessageRemoteDatasource>(),
      getIt<MessageLocalDatasource>()
    ),
  );

  // features/message/domain
  getIt.registerLazySingleton<GetRoomMessagesUseCase>(
    () => GetRoomMessagesUseCase(getIt<IMessageRepository>()),
  );
  getIt.registerLazySingleton<SendMessageUseCase>(
    () => SendMessageUseCase(getIt<IMessageRepository>()),
  );
  getIt.registerLazySingleton<ParseSocketMessageUseCase>(
    () => ParseSocketMessageUseCase(getIt<IMessageRepository>()),
  );
  getIt.registerLazySingleton<CacheIncomingSocketMessageUseCase>(
    () => CacheIncomingSocketMessageUseCase(getIt<IMessageRepository>()),
  );
  getIt.registerLazySingleton<ClearCachedMessagesUseCase>(
    () => ClearCachedMessagesUseCase(getIt<IMessageRepository>()),
  );
  getIt.registerLazySingleton<SyncLatestMessagesUseCase>(
    () => SyncLatestMessagesUseCase(getIt<IMessageRepository>()),
  );

  // features/message/presentation
  // также нужен чистый Initial при заходе
  getIt.registerFactory<ChatRoomBloc>(
    () => ChatRoomBloc(
      getRoomMessagesUseCase: getIt<GetRoomMessagesUseCase>(),
      getMyProfileUseCase: getIt<GetMyProfileUseCase>(),
      markRoomAsReadUseCase: getIt<MarkRoomAsReadUseCase>(),
      deleteRoomUseCase: getIt<DeleteRoomUseCase>(),
      leaveRoomUseCase: getIt<LeaveRoomUseCase>(),
      getRoomByIdUseCase: getIt<GetRoomByIdUseCase>(),
      parseSocketMessageUseCase: getIt<ParseSocketMessageUseCase>(),
      cacheIncomingSocketMessageUseCase: getIt<CacheIncomingSocketMessageUseCase>(),
      syncLatestMessagesUseCase: getIt<SyncLatestMessagesUseCase>(),
      clearCachedMessagesUseCase: getIt<ClearCachedMessagesUseCase>(),
      socketService: getIt<SocketService>(),
      roomSyncService: getIt<RoomSyncService>(),
      currentUserId: getIt<AuthStateNotifier>().currentUserId!,
    ),
  );
}