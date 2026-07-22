import 'package:freezed_annotation/freezed_annotation.dart';
import 'user_model.dart';

part 'user_response.freezed.dart';
part 'user_response.g.dart';

// для GET /users/me, POST /users/avatar
@freezed
class UserResponse with _$UserResponse {
  const factory UserResponse({
    required User user,
  }) = _UserResponse;

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}