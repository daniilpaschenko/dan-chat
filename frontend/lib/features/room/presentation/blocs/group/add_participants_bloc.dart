import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';

import '../../../../../core/errors/failure_mapper.dart';
import '../../../../user/domain/entities/user_entity.dart';
import '../../../../user/domain/usecases/search_users_usecase.dart';
import '../../../domain/entities/room_entity.dart';
import '../../../domain/usecases/add_participant_usecase.dart';
import 'add_participants_event.dart';
import 'add_participants_state.dart';

class AddParticipantsBloc extends Bloc<AddParticipantsEvent, AddParticipantsState> {
  final String roomId;
  final Set<String> existingParticipantIds;
  final SearchUsersUseCase _searchUsersUseCase;
  final AddParticipantUseCase _addParticipantUseCase;

  AddParticipantsBloc({
    required this.roomId,
    required this.existingParticipantIds,
    required SearchUsersUseCase searchUsersUseCase,
    required AddParticipantUseCase addParticipantUseCase,
  })  : _searchUsersUseCase = searchUsersUseCase,
        _addParticipantUseCase = addParticipantUseCase,
        super(const AddParticipantsState()) {
    on<AddParticipantsQueryChanged>(
      _onQueryChanged,
      transformer: _debounceRestartable(const Duration(milliseconds: 500)),
    );
    on<AddParticipantsUserToggled>(_onUserToggled);
    on<AddParticipantsSubmitRequested>(_onSubmitRequested);
  }

  EventTransformer<T> _debounceRestartable<T>(Duration duration) {
    return (events, mapper) => restartable<T>().call(events.debounce(duration), mapper);
  }

  Future<void> _onQueryChanged(
    AddParticipantsQueryChanged event,
    Emitter<AddParticipantsState> emit,
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
        searchErrorMessage: defaultFailureMessage(failure),
      )),
      (users) {
        // прячем тех, кто уже состоит в группе
        final filtered = users.where((u) => !existingParticipantIds.contains(u.id)).toList();
        emit(state.copyWith(isSearching: false, searchResults: filtered));
      },
    );
  }

  void _onUserToggled(AddParticipantsUserToggled event, Emitter<AddParticipantsState> emit) {
    final updated = Map<String, PartialUserEntity>.from(state.selectedUsers);
    if (updated.containsKey(event.user.id)) {
      updated.remove(event.user.id);
    } else {
      updated[event.user.id] = event.user;
    }
    emit(state.copyWith(selectedUsers: updated));
  }

  Future<void> _onSubmitRequested(
    AddParticipantsSubmitRequested event,
    Emitter<AddParticipantsState> emit,
  ) async {
    if (state.selectedUsers.isEmpty || state.isSubmitting) return;

    emit(state.copyWith(isSubmitting: true, submitErrorMessage: null));

    // бэкенд принимает только один userId за раз — добавляем последовательно
    RoomEntity? lastRoom;
    for (final userId in state.selectedUsers.keys) {
      final result = await _addParticipantUseCase(roomId: roomId, userId: userId);
      var failed = false;
      result.fold(
        (failure) {
          failed = true;
          emit(state.copyWith(isSubmitting: false, submitErrorMessage: defaultFailureMessage(failure)));
        },
        (room) => lastRoom = room,
      );
      // прерываемся на первой ошибке
      if (failed) return;
    }

    emit(state.copyWith(isSubmitting: false, updatedRoom: lastRoom));
  }
}