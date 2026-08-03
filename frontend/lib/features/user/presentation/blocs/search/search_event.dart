import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/user_entity.dart';

part 'search_event.freezed.dart';

@freezed
class SearchEvent with _$SearchEvent {
  // вызывается на каждое изменение текста в поле поиска:
  // debounce происходит внутри bloc, не в UI
  const factory SearchEvent.queryChanged(String query) = QueryChanged;

  // внутреннее событие — обновление статуса юзера из сокета
  const factory SearchEvent.presenceUpdated({
    required String userId,
    required UserStatus status,
  }) = SearchPresenceUpdated;
}