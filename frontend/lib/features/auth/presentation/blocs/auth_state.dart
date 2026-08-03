import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/auth_entity.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  // начальное состояние
  const factory AuthState.initial() = AuthInitial;

  // состояние загрузки: UI должен показать лоадер и задизейблить кнопку
  const factory AuthState.loading() = AuthLoading;

  // успешный login/register
  const factory AuthState.success(AuthEntity authResponse) = AuthSuccess;

  // провал login/register — сообщение пользователю для показа под формой 
  const factory AuthState.failure(String message) = AuthFailure;
}