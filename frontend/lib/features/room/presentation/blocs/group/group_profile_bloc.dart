import 'package:bloc/bloc.dart';

import '../../../../../core/errors/failure_mapper.dart';
import '../../../../../core/errors/failures.dart';
import '../../../domain/usecases/get_room_by_id_usecase.dart';
import '../../../domain/usecases/remove_participant_usecase.dart';
import 'group_profile_event.dart';
import 'group_profile_state.dart';

class GroupProfileBloc extends Bloc<GroupProfileEvent, GroupProfileState> {
  final String roomId;
  final GetRoomByIdUseCase _getRoomByIdUseCase;
  final RemoveParticipantUseCase _removeParticipantUseCase;

  GroupProfileBloc({
    required this.roomId,
    required GetRoomByIdUseCase getRoomByIdUseCase,
    required RemoveParticipantUseCase removeParticipantUseCase,
  })  : _getRoomByIdUseCase = getRoomByIdUseCase,
        _removeParticipantUseCase = removeParticipantUseCase,
        super(const GroupProfileState.initial()) {
    on<GroupProfileStarted>(_onStarted);
    on<GroupProfileParticipantRemoveRequested>(_onParticipantRemoveRequested);
    on<GroupProfileParticipantsAdded>(_onParticipantsAdded);
  }

  Future<void> _onStarted(GroupProfileStarted event, Emitter<GroupProfileState> emit) async {
    emit(const GroupProfileState.loading());

    final result = await _getRoomByIdUseCase(roomId);
    result.fold(
      (failure) => emit(GroupProfileState.failure(_mapFailureToMessage(failure))),
      (room) => emit(GroupProfileState.loaded(room: room)),
    );
  }

  Future<void> _onParticipantRemoveRequested(
    GroupProfileParticipantRemoveRequested event,
    Emitter<GroupProfileState> emit,
  ) async {
    final current = state;
    if (current is! GroupProfileLoaded || current.isRemoving) return;

    emit(current.copyWith(isRemoving: true, errorMessage: null));

    final result = await _removeParticipantUseCase(roomId: roomId, userId: event.userId);
    result.fold(
      (failure) => emit(current.copyWith(
        isRemoving: false,
        errorMessage: _mapFailureToMessage(failure),
      )),
      (room) {
        // room == null только если удалили ПОСЛЕДНЕГО участника (пустая комната)
        // подстрахуемся тут
        if (room == null) {
          emit(const GroupProfileState.failure('Чат больше не существует'));
        } else {
          emit(GroupProfileState.loaded(room: room, isRemoving: false));
        }
      },
    );
  }

  void _onParticipantsAdded(GroupProfileParticipantsAdded event, Emitter<GroupProfileState> emit) {
    emit(GroupProfileState.loaded(room: event.room));
  }

  String _mapFailureToMessage(Failure failure) => defaultFailureMessage(failure);
}