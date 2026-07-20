import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../navigation/app_router.dart';
import '../navigation/auth_state_notifier.dart';
import '../network/dio_client.dart';
import '../storage/hive_service.dart';
import '../storage/secure_storage_service.dart';

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

  // core/network 
  getIt.registerLazySingleton<Dio>(
    () => DioClient(getIt<SecureStorageService>()).build(),
  );

  // core/navigation 
  getIt.registerLazySingleton<AuthStateNotifier>(
    () => AuthStateNotifier(getIt<SecureStorageService>()),
  );
  getIt.registerLazySingleton<GoRouter>(
    () => AppRouter(getIt<AuthStateNotifier>()).build(),
  );

  // добавятся registerLazySingleton для
  // AuthRemoteDataSource, AuthRepository, UseCase и т.д.
}