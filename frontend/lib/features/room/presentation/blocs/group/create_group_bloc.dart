import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../../../core/errors/failure_mapper.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../user/domain/usecases/search_users_usecase.dart';
import '../../../../user/domain/entities/user_entity.dart';
import '../../../domain/entities/room_entity.dart';
import '../../../domain/usecases/create_room_usecase.dart';
import 'create_group_event.dart';
import 'create_group_state.dart';

class CreateGroupBloc extends Bloc<CreateGroupEvent, CreateGroupState> {
  final SearchUsersUseCase _searchUsersUseCase;
  final CreateRoomUseCase _createRoomUseCase;

  CreateGroupBloc({
    required SearchUsersUseCase searchUsersUseCase,
    required CreateRoomUseCase createRoomUseCase,
  })  : _searchUsersUseCase = searchUsersUseCase,
        _createRoomUseCase = createRoomUseCase,
        super(const CreateGroupState()) {
    on<QueryChanged>(
      _onQueryChanged,
      transformer: _debounceRestartable(const Duration(milliseconds: 500)),
    );
    on<UserToggled>(_onUserToggled);
    on<CreateRequested>(_onCreateRequested);
  }

  EventTransformer<T> _debounceRestartable<T>(Duration duration) {
    return (events, mapper) => restartable<T>().call(events.debounce(duration), mapper);
  }

  Future<void> _onQueryChanged(
    QueryChanged event,
    Emitter<CreateGroupState> emit,
  ) async {
    final query = event.query.trim();

    if (query.isEmpty) {
      emit(state.copyWith(isSearching: false, searchResults: [], searchErrorMessage: null));
      return;
    }

    emit(state.copyWith(isSearching: true, searchErrorMessage: null));

    final result = await _searchUsersUseCase(query);

    result.fold(
      (failure) => emit(state.copyWith(
        isSearching: false,
        searchErrorMessage: _mapFailureToMessage(failure),
      )),
      (users) => emit(state.copyWith(isSearching: false, searchResults: users)),
    );
  }

  void _onUserToggled(UserToggled event, Emitter<CreateGroupState> emit) {
    final updated = Map<String, PartialUserEntity>.from(state.selectedUsers);
    if (updated.containsKey(event.user.id)) {
      updated.remove(event.user.id);
    } else {
      updated[event.user.id] = event.user;
    }
    emit(state.copyWith(selectedUsers: updated));
  }

  Future<void> _onCreateRequested(
    CreateRequested event,
    Emitter<CreateGroupState> emit,
  ) async {
    emit(state.copyWith(isCreating: true, createErrorMessage: null));

    final result = await _createRoomUseCase(
      type: RoomType.group,
      name: event.name.trim(),
      avatarUrl: null,
      participantIds: state.selectedUsers.keys.toList(),
    );

    result.fold(
      (failure) => emit(state.copyWith(
        isCreating: false,
        createErrorMessage: _mapFailureToMessage(failure),
      )),
      (room) => emit(state.copyWith(isCreating: false, createdRoom: room)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    return failure.maybeWhen(
      validation: (message) => message,
      unexpected: (_) => 'Что-то пошло не так',
      orElse: () => defaultFailureMessage(failure),
    );
  }
}