import 'dart:async';
import 'package:bloc/bloc.dart';

import '../../../../../core/errors/failure_mapper.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/network/socket_service.dart';
import '../../../domain/usecases/get_room_by_id_usecase.dart';
import '../../../domain/usecases/remove_participant_usecase.dart';
import '../../../domain/usecases/update_participant_role_usecase.dart';
import '../../../domain/usecases/upload_room_avatar_usecase.dart';
import '../../../domain/usecases/change_group_name_usecase.dart';
import 'group_profile_event.dart';
import 'group_profile_state.dart';

class GroupProfileBloc extends Bloc<GroupProfileEvent, GroupProfileState> {
  final String roomId;
  final GetRoomByIdUseCase _getRoomByIdUseCase;
  final RemoveParticipantUseCase _removeParticipantUseCase;
  final UpdateParticipantRoleUseCase _updateParticipantRoleUseCase;
  final UploadRoomAvatarUseCase _uploadRoomAvatarUseCase;
  final ChangeGroupNameUsecase _changeGroupNameUsecase;
  final SocketService _socketService;

  StreamSubscription? _roomUpdatedSub;
  StreamSubscription? _roomDeletedSub;

  GroupProfileBloc({
    required this.roomId,
    required GetRoomByIdUseCase getRoomByIdUseCase,
    required RemoveParticipantUseCase removeParticipantUseCase,
    required UpdateParticipantRoleUseCase updateParticipantRoleUseCase,
    required UploadRoomAvatarUseCase uploadRoomAvatarUseCase,
    required ChangeGroupNameUsecase changeGroupNameUsecase,
    required SocketService socketService,
  })  : _getRoomByIdUseCase = getRoomByIdUseCase,
        _removeParticipantUseCase = removeParticipantUseCase,
        _updateParticipantRoleUseCase = updateParticipantRoleUseCase,
        _uploadRoomAvatarUseCase = uploadRoomAvatarUseCase,
        _changeGroupNameUsecase = changeGroupNameUsecase,
        _socketService = socketService,
        super(const GroupProfileState.initial()) {
    on<GroupProfileStarted>(_onStarted);
    on<GroupProfileParticipantRemoveRequested>(_onParticipantRemoveRequested);
    on<GroupProfileParticipantRoleChangeRequested>(_onParticipantRoleChangeRequested);
    on<GroupProfileParticipantsAdded>(_onParticipantsAdded);
    on<GroupProfileRoomUpdatedRemotely>(_onRoomUpdatedRemotely);
    on<GroupProfileAvatarUploadRequested>(_onRoomAvatarUploadRequested);
    on<GroupProfileChangeNameRequested>(_onGroupProfileChangeNameRequested);
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
    if (current is! GroupProfileLoaded || current.isRemoving || current.isChangingRole) return;

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

  Future<void> _onParticipantRoleChangeRequested(
    GroupProfileParticipantRoleChangeRequested event,
    Emitter<GroupProfileState> emit,
  ) async {
    final current = state;
    if (current is! GroupProfileLoaded || current.isChangingRole || current.isRemoving) return;

    emit(current.copyWith(isChangingRole: true, errorMessage: null));

    final result = await _updateParticipantRoleUseCase(
      roomId: roomId,
      userId: event.userId,
      role: event.role,
    );
    result.fold(
      (failure) => emit(current.copyWith(
        isChangingRole: false,
        errorMessage: _mapFailureToMessage(failure),
      )),
      (room) => emit(GroupProfileState.loaded(room: room, isChangingRole: false)),
    );
  }

  void _onParticipantsAdded(GroupProfileParticipantsAdded event, Emitter<GroupProfileState> emit) {
    emit(GroupProfileState.loaded(room: event.room));
  }

  Future<void> _onRoomUpdatedRemotely(
    GroupProfileRoomUpdatedRemotely event,
    Emitter<GroupProfileState> emit,
  ) async {
    if (state is! GroupProfileLoaded) return;

    final result = await _getRoomByIdUseCase(roomId);
    result.fold(
      (failure) {}, // тихо игнорируем — не хотим ломать текущий экран из-за фонового рефетча
      (room) {
        // важно брать АКТУАЛЬНЫЙ state именно сейчас, а не снэпшот до await
        final latest = state;
        if (latest is! GroupProfileLoaded) return;
        emit(latest.copyWith(room: room));
      },
    );
  }

  Future<void> _onRoomAvatarUploadRequested(
    GroupProfileAvatarUploadRequested event,
    Emitter<GroupProfileState> emit,
  ) async {
    final current = state;
    if (current is! GroupProfileLoaded || current.isUploadingAvatar) return;

    emit(current.copyWith(isUploadingAvatar: true, errorMessage: null));

    final result = await _uploadRoomAvatarUseCase(roomId: roomId, file: event.file);
    result.fold(
      (failure) => emit(current.copyWith(
        isUploadingAvatar: false,
        errorMessage: _mapFailureToMessage(failure),
      )),
      (room) => emit(GroupProfileState.loaded(room: room, isUploadingAvatar: false)),
    );
  }

  Future<void> _onGroupProfileChangeNameRequested(
    GroupProfileChangeNameRequested event,
    Emitter<GroupProfileState> emit,
  ) async {
    final current = state;

    if (current is! GroupProfileLoaded || current.isChangingName) return;

    emit(current.copyWith(isChangingName: true, nameError: null));

    final result = await _changeGroupNameUsecase(event.roomId, event.name);

    result.fold(
      (failure) => emit(current.copyWith(
        isChangingName: false,
        nameError: _mapFailureToMessage(failure),
      )),
      (room) => emit(current.copyWith(
        isChangingName: false,
        room: room,
        nameError: null,
      )),
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