import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

// базовый тип ошибок, который видит domain/presentation слой
// детали от dio (DioException и т.д.) сюда не пропускаем т.к. репозиторий должен их замаппить в один из этих кейсов
@freezed
class Failure with _$Failure {
  // неверный логин/пароль — 401
  const factory Failure.invalidCredentials() = InvalidCredentialsFailure;

  // 409 на register — юзер с таким email уже есть
  const factory Failure.emailAlreadyInUse() = EmailAlreadyInUseFailure;

  // ошибки валидации с бэка (400) — прокидываем сообщение как есть,
  const factory Failure.validation(String message) = ValidationFailure;

  // нет сети / таймаут и т.д.
  const factory Failure.network() = NetworkFailure;

  // сессия expired и refresh не помог — разлогиниваем
  const factory Failure.sessionExpired() = SessionExpiredFailure;

  // всё, что не удалось классифицировать — 500 и подобное
  const factory Failure.unexpected(String message) = UnexpectedFailure;
}