// БИБЛИОТЕКИ
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

// CORE
import '../navigation/app_router.dart';
import '../navigation/auth_state_notifier.dart';
import '../network/dio_client.dart';
import '../storage/hive_service.dart';
import '../storage/secure_storage_service.dart';

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
import '../../features/room/presentation/blocs/room_list_bloc.dart';

// USER
import '../../features/user/data/datasources/user_remote_datasource.dart';
import '../../features/user/data/repositories/user_repository.dart';
import '../../features/user/domain/interfaces/i_user_repository.dart';
import '../../features/user/domain/usecases/search_users_usecase.dart';
import '../../features/user/presentation/blocs/search/search_bloc.dart';

// MESSAGE
import '../../features/message/data/datasources/message_remote_datasource.dart';
import '../../features/message/data/datasources/message_local_datasource.dart';
import '../../features/message/data/repositories/message_repository.dart';
import '../../features/message/domain/interfaces/i_message_repository.dart';
import '../../features/message/domain/usecases/get_room_messages_usecase.dart';
import '../../features/message/domain/usecases/send_message_usecase.dart';
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
  getIt.registerLazySingleton<HiveService>(() => HiveService());

  // core/navigation
  // регистрируем раньше Dio, т.к. DioClient дергает logOut() при провале refresh
  getIt.registerLazySingleton<AuthStateNotifier>(
    () => AuthStateNotifier(getIt<SecureStorageService>(), getIt<HiveService>()),
  );

  // core/network
  getIt.registerLazySingleton<Dio>(
    () => DioClient(
      getIt<SecureStorageService>(),
      onAuthFailure: () => getIt<AuthStateNotifier>().logOut(),
    ).build(),
  );

  getIt.registerLazySingleton<GoRouter>(
    () => AppRouter(getIt<AuthStateNotifier>()).build(),
  );

  // features/auth/data
  getIt.registerLazySingleton<AuthRemoteDatasource>(
    () => AuthRemoteDatasource(getIt<Dio>()),
  );
  getIt.registerLazySingleton<IAuthRepository>(
    () => AuthRepository(
      getIt<AuthRemoteDatasource>(),
      getIt<SecureStorageService>(),
    ),
  );

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

  // features/room/presentation
  // также нужен чистый Initial при заходе
  getIt.registerFactory<RoomListBloc>(
    () => RoomListBloc(
      // только эти usecases относятся к RoomListBloc
      // правильно single responsibility
      getMyRoomsUseCase: getIt<GetMyRoomsUseCase>(),
      markRoomAsReadUseCase: getIt<MarkRoomAsReadUseCase>(),
    ),
  );

  // features/user/data
  getIt.registerLazySingleton<UserRemoteDatasource>(
    () => UserRemoteDatasource(getIt<Dio>()),
  );
  getIt.registerLazySingleton<IUserRepository>(
    () => UserRepository(getIt<UserRemoteDatasource>()),
  );

  // features/user/domain
  getIt.registerLazySingleton<SearchUsersUseCase>(
    () => SearchUsersUseCase(getIt<IUserRepository>()),
  );

  // features/user/presentation - SearchBloc
  // также нужен чистый Initial при заходе
  getIt.registerFactory<SearchBloc>(
    () => SearchBloc(searchUsersUseCase: getIt<SearchUsersUseCase>()),
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

  // features/message/presentation
  // также нужен чистый Initial при заходе
  getIt.registerFactory<ChatRoomBloc>(
    () => ChatRoomBloc(
      getRoomMessagesUseCase: getIt<GetRoomMessagesUseCase>(),
      sendMessageUseCase: getIt<SendMessageUseCase>(),
    ),
  );
}