import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../../../core/errors/failure_mapper.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/network/socket_service.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/search_users_usecase.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final SearchUsersUseCase _searchUsersUseCase;
  final SocketService _socketService;

  StreamSubscription? _presenceSub;

  SearchBloc({
    required SearchUsersUseCase searchUsersUseCase,
    required SocketService socketService,
  })  : _searchUsersUseCase = searchUsersUseCase,
        _socketService = socketService,
        super(const SearchState.initial()) {
    on<QueryChanged>(
      _onQueryChanged,
      transformer: debounceRestartable(
        const Duration(milliseconds: 500),
      ),
    );
    on<SearchPresenceUpdated>(_onPresenceUpdated);

    _presenceSub = _socketService.presenceUpdate$.listen((data) {
      add(SearchEvent.presenceUpdated(
        userId: data['userId'] as String,
        status: data['status'] == 'online' ? UserStatus.online : UserStatus.offline,
      ));
    });
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

    void _onPresenceUpdated(
      SearchPresenceUpdated event,
      Emitter<SearchState> emit,
    ) {
      final current = state;
      if (current is! SearchLoaded) return;

      // если пользователь, статус которого обновился, не находится в списке найденных пользователей, то ничего не делаем
      final hasUser = current.users.any((u) => u.id == event.userId);
      if (!hasUser) return;

      final updatedUsers = current.users.map((u) {
        if (u.id != event.userId) return u;
        return u.copyWith(status: event.status);
      }).toList();

      emit(SearchState.loaded(updatedUsers));
    }

  String _mapFailureToMessage(Failure failure) {
    return failure.maybeWhen(
      unexpected: (_) => 'Не удалось выполнить поиск',
      orElse: () => defaultFailureMessage(failure),
    );
  }

  @override
  Future<void> close() {
    _presenceSub?.cancel();
    return super.close();
  }
}