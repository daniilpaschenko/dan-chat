import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../navigation/app_router.dart';
import '../navigation/auth_state_notifier.dart';
import '../network/dio_client.dart';
import '../storage/hive_service.dart';
import '../storage/secure_storage_service.dart';

import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/data/repositories/auth_repository.dart';
import '../../features/auth/domain/interfaces/i_auth_repository.dart';
import '../../features/auth/domain/usecases/login_usecase.dart';
import '../../features/auth/domain/usecases/register_usecase.dart';
import '../../features/auth/domain/usecases/logout_usecase.dart';
import '../../features/auth/presentation/blocs/auth_bloc.dart';

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
    () => AuthStateNotifier(getIt<SecureStorageService>()),
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
}