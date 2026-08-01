import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/failure_mapper.dart';
import '../../../../core/navigation/auth_state_notifier.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';
import '../../domain/usecases/register_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final LogoutUseCase _logoutUseCase;

  // для изменения статуса авторизации
  final AuthStateNotifier _authStateNotifier;

  AuthBloc({
    required LoginUseCase loginUseCase,
    required RegisterUseCase registerUseCase,
    required LogoutUseCase logoutUseCase,
    required AuthStateNotifier authStateNotifier,
  })  : _loginUseCase = loginUseCase,
        _registerUseCase = registerUseCase,
        _logoutUseCase = logoutUseCase,
        _authStateNotifier = authStateNotifier,
        super(const AuthState.initial()) {
    on<LoginRequested>(_onLoginRequested);
    on<RegisterRequested>(_onRegisterRequested);
    on<LogoutRequested>(_onLogoutRequested);
  }

  // запрос на логин
  Future<void> _onLoginRequested(
    LoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await _loginUseCase(
      email: event.email,
      password: event.password,
    );

    // fold — способ dartz разобрать Either без if/else
    await result.fold(
      (failure) async => emit(AuthState.failure(_mapFailureToMessage(failure))),
      (authEntity) async {
        // токены уже сохранены внутри AuthRepository.login()
        await _authStateNotifier.logIn(
          accessToken: authEntity.accessToken,
          refreshToken: authEntity.refreshToken,
          userId: authEntity.user.id,
        );
        // успех
        emit(AuthState.success(authEntity));
      },
    );
  }

  // запрос на регистрацию
  Future<void> _onRegisterRequested(
    RegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await _registerUseCase(
      email: event.email,
      password: event.password,
      username: event.username,
    );

    await result.fold(
      (failure) async => emit(AuthState.failure(_mapFailureToMessage(failure))),
      (authEntity) async {
        await _authStateNotifier.logIn(
          accessToken: authEntity.accessToken,
          refreshToken: authEntity.refreshToken,
          userId: authEntity.user.id,
        );
        emit(AuthState.success(authEntity));
      },
    );
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.loading());

    final result = await _logoutUseCase();

    await result.fold(
      // на всякий случай показываем ошибку, если даже локальная очистка не удалась
      (failure) async => emit(AuthState.failure(_mapFailureToMessage(failure))),
      (_) async {
        await _authStateNotifier.logOut();
        emit(const AuthState.initial());
      },
    );
  }

  // failure превращается в текст для UI
  String _mapFailureToMessage(Failure failure) => defaultFailureMessage(failure);
}