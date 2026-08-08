import 'dart:async';
import 'package:bloc/bloc.dart';

import '../../../../../core/errors/failure_mapper.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/network/socket_service.dart';
import '../../../domain/usecases/get_room_by_id_usecase.dart';
import '../../../domain/usecases/remove_participant_usecase.dart';
import 'group_profile_event.dart';
import 'group_profile_state.dart';

class GroupProfileBloc extends Bloc<GroupProfileEvent, GroupProfileState> {
  final String roomId;
  final GetRoomByIdUseCase _getRoomByIdUseCase;
  final RemoveParticipantUseCase _removeParticipantUseCase;
  final SocketService _socketService;

  StreamSubscription? _roomUpdatedSub;
  StreamSubscription? _roomDeletedSub;

  GroupProfileBloc({
    required this.roomId,
    required GetRoomByIdUseCase getRoomByIdUseCase,
    required RemoveParticipantUseCase removeParticipantUseCase,
    required SocketService socketService,
  })  : _getRoomByIdUseCase = getRoomByIdUseCase,
        _removeParticipantUseCase = removeParticipantUseCase,
        _socketService = socketService,
        super(const GroupProfileState.initial()) {
    on<GroupProfileStarted>(_onStarted);
    on<GroupProfileParticipantRemoveRequested>(_onParticipantRemoveRequested);
    on<GroupProfileParticipantsAdded>(_onParticipantsAdded);
    on<GroupProfileRoomUpdatedRemotely>(_onRoomUpdatedRemotely);
    on<GroupProfileRoomRemovedRemotely>(
      (event, emit) {
        final current = state;
        if (current is GroupProfileLoaded) {
          emit(current.copyWith(removedRemotely: true));
        }
      },
    );

    _roomUpdatedSub = _socketService.roomUpdated$.listen((data) {
      final id = (data['_id'] ?? data['id'])?.toString();
      if (id == roomId) add(const GroupProfileEvent.roomUpdatedRemotely());
    });

    _roomDeletedSub = _socketService.roomDeleted$.listen((data) {
      if (data['roomId'] == roomId) add(const GroupProfileEvent.roomRemovedRemotely());
    });
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

  Future<void> _onRoomUpdatedRemotely(
    GroupProfileRoomUpdatedRemotely event,
    Emitter<GroupProfileState> emit,
  ) async {
    final current = state;
    if (current is! GroupProfileLoaded) return;

    final result = await _getRoomByIdUseCase(roomId);
    result.fold(
      (failure) {}, // тихо игнорируем — не хотим ломать текущий экран из-за фонового рефетча
      (room) => emit(current.copyWith(room: room)),
    );
  }

  String _mapFailureToMessage(Failure failure) => defaultFailureMessage(failure);

  @override
  Future<void> close() {
    _roomUpdatedSub?.cancel();
    _roomDeletedSub?.cancel();
    return super.close();
  }
}