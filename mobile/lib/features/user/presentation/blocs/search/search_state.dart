import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../data/models/user_model.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  // ничего не введено
  const factory SearchState.initial() = SearchInitial;

  const factory SearchState.loading() = SearchLoading;

  const factory SearchState.loaded(List<PartialUser> users) = SearchLoaded;

  const factory SearchState.failure(String message) = SearchFailure;
}