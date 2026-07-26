import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_responses.freezed.dart';
part 'common_responses.g.dart';

/// общая форма { "message": "..." }, которую отдают многие эндпоинты
/// (ошибки, logout, "комната удалена" в removeParticipant и т.д.)
@freezed
class MessageResponse with _$MessageResponse {
  const factory MessageResponse({
    required String message,
  }) = _MessageResponse;

  factory MessageResponse.fromJson(Map<String, dynamic> json) =>
      _$MessageResponseFromJson(json);
}
