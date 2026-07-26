import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  // запрос на login
  const factory AuthEvent.loginRequested({
    required String email,
    required String password,
  }) = LoginRequested;
  // запрос на register
  const factory AuthEvent.registerRequested({
    required String email,
    required String password,
    required String username,
  }) = RegisterRequested;
  // запрос на logout
  const factory AuthEvent.logoutRequested() = LogoutRequested;
}