import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../../../core/errors/failure_mapper.dart';
import '../../../../../core/errors/failures.dart';
import '../../../domain/usecases/search_users_usecase.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchUsersUseCase _searchUsersUseCase;

  SearchBloc({
    required SearchUsersUseCase searchUsersUseCase,
  })  : _searchUsersUseCase = searchUsersUseCase,
        super(const SearchState.initial()) {
    on<QueryChanged>(
      _onQueryChanged,
      transformer: debounceRestartable(
        const Duration(milliseconds: 500),
      ),
    );
  }

  // ждёт, пока пользователь перестанет печатать, затем запускает обработку последнего события
  // если во время обработки приходит новое событие, то предыдущая обработка отменяется
  EventTransformer<T> debounceRestartable<T>(Duration duration) {
    return (events, mapper) {
      return restartable<T>().call(
        events.debounce(duration),
        mapper,
      );
    };
  }

  Future<void> _onQueryChanged(
    QueryChanged event,
    Emitter<SearchState> emit,
  ) async {
    final query = event.query.trim();

    if (query.isEmpty) {
      emit(const SearchState.initial());
      return;
    }

    emit(const SearchState.loading());

    final result = await _searchUsersUseCase(query);

    result.fold(
      (failure) => emit(
        SearchState.failure(
          _mapFailureToMessage(failure),
        ),
      ),
      (users) => emit(
        SearchState.loaded(users),
      ),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.maybeWhen(
      unexpected: (_) => 'Не удалось выполнить поиск',
      orElse: () => defaultFailureMessage(failure),
    );
  }
}