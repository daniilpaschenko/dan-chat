import 'package:dio/dio.dart';
import 'failures.dart';

// единая точка маппинга DioException -> Failure
Failure mapDioExceptionToFailure(
  DioException e, {
  // некоторые repository хотят особую обработку конкретных статусов:
  // override даёт им это право, не трогая остальную логику
  Failure? Function(int? statusCode, String message)? statusOverride,
}) {
  final isConnectivityIssue = e.type == DioExceptionType.connectionTimeout ||
      e.type == DioExceptionType.receiveTimeout ||
      e.type == DioExceptionType.connectionError;

  if (isConnectivityIssue) {
    return const Failure.network();
  }

  final statusCode = e.response?.statusCode;
  final message = e.response?.data is Map
      ? (e.response?.data['message'] as String?) ?? 'Неизвестная ошибка'
      : 'Неизвестная ошибка';

  final overridden = statusOverride?.call(statusCode, message);
  if (overridden != null) return overridden;

  switch (statusCode) {
    case 400:
      return Failure.validation(message);
    default:
      return Failure.unexpected(message);
  }
}