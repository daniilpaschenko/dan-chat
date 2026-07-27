import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_event.freezed.dart';

@freezed
class SearchEvent with _$SearchEvent {
  // вызывается на каждое изменение текста в поле поиска:
  // debounce происходит внутри bloc, не в UI
  const factory SearchEvent.queryChanged(String query) = QueryChanged;
}