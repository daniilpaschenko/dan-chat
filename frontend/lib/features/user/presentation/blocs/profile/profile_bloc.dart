import 'dart:async';
import 'package:bloc/bloc.dart';

import '../../../../../core/errors/failure_mapper.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/network/socket_service.dart';
import '../../../../room/domain/entities/room_entity.dart' show RoomType;
import '../../../../room/domain/usecases/create_room_usecase.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/usecases/get_my_profile_usecase.dart';
import '../../../domain/usecases/get_user_profile_usecase.dart';
import '../../../domain/usecases/upload_avatar_usecase.dart';
import '../../../domain/usecases/change_username_usecase.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetMyProfileUseCase _getMyProfileUseCase;
  final GetUserProfileUseCase _getUserProfileUseCase;
  final UploadAvatarUseCase _uploadAvatarUseCase;
  final CreateRoomUseCase _createRoomUseCase;
  final ChangeUsernameUsecase _changeUsernameUsecase;
  final SocketService _socketService;

  /// null -> свой профиль, иначе id чужого
  final String? userId;

  StreamSubscription? _presenceSub;

  ProfileBloc({
    required this.userId,
    required GetMyProfileUseCase getMyProfileUseCase,
    required GetUserProfileUseCase getUserProfileUseCase,
    required UploadAvatarUseCase uploadAvatarUseCase,
    required CreateRoomUseCase createRoomUseCase,
    required ChangeUsernameUsecase changeUsernameUsecase,
    required SocketService socketService,
  })  : _getMyProfileUseCase = getMyProfileUseCase,
        _getUserProfileUseCase = getUserProfileUseCase,
        _uploadAvatarUseCase = uploadAvatarUseCase,
        _createRoomUseCase = createRoomUseCase,
        _changeUsernameUsecase = changeUsernameUsecase,
        _socketService = socketService,
        super(const ProfileState.initial()) {
    on<ProfileStarted>(_onStarted);
    on<ProfileAvatarUploadRequested>(_onAvatarUploadRequested);
    on<ProfileChatRequested>(_onChatRequested);
    on<ProfileChangeUsernameRequested>(_onChangeUsernameRequested);
    on<ProfileUsernameErrorHandled>(_onUsernameErrorHandled);
    on<ProfileChatNavigationHandled>(_onChatNavigationHandled);
    on<ProfileChatErrorHandled>(_onChatErrorHandled);
    on<ProfilePresenceUpdated>(_onPresenceUpdated);
  }

  bool get _isOwnProfile => userId == null;

  Future<void> _onStarted(ProfileStarted event, Emitter<ProfileState> emit) async {
    emit(const ProfileState.loading());

    if (_isOwnProfile) {
      final result = await _getMyProfileUseCase();
      result.fold(
        (failure) => emit(ProfileState.failure(_mapFailureToMessage(failure))),
        (user) => emit(ProfileState.loaded(isOwnProfile: true, ownUser: user)),
      );
      return;
    }

    final result = await _getUserProfileUseCase(userId!);
    result.fold(
      (failure) => emit(ProfileState.failure(_mapFailureToMessage(failure))),
      (user) {
        emit(ProfileState.loaded(isOwnProfile: false, otherUser: user));
        // подписываемся только сейчас, когда точно знаем userId чужого профиля
        _subscribeToPresence();
      },
    );
  }

  void _subscribeToPresence() {
    // cancel чтобы не было подписки на чужого юзера, если пользователь перешел на другой профиль
    _presenceSub?.cancel();
    _presenceSub = _socketService.presenceUpdate$.listen((data) {
      if (data['userId'] == userId) {
        add(ProfileEvent.presenceUpdated(
          status: data['status'] == 'online' ? UserStatus.online : UserStatus.offline,
          lastSeen: data['lastSeen'] != null ? DateTime.parse(data['lastSeen'] as String) : null,
        ));
      }
    });
  }

  void _onPresenceUpdated(ProfilePresenceUpdated event, Emitter<ProfileState> emit) {
    final current = state;
    if (current is! ProfileLoaded || current.otherUser == null) return;

    emit(current.copyWith(
      otherUser: current.otherUser!.copyWith(
        status: event.status,
        lastSeen: event.lastSeen ?? current.otherUser!.lastSeen,
      ),
    ));
  }

  Future<void> _onAvatarUploadRequested(
    ProfileAvatarUploadRequested event,
    Emitter<ProfileState> emit,
  ) async {
    final current = state;
    // менять аватарку можно только у себя
    if (!_isOwnProfile || current is! ProfileLoaded) return;

    emit(current.copyWith(isUploadingAvatar: true));

    final result = await _uploadAvatarUseCase(event.file);
    result.fold(
      (failure) => emit(ProfileState.failure(_mapFailureToMessage(failure))),
      (user) => emit(ProfileState.loaded(isOwnProfile: true, ownUser: user)),
    );
  }

  Future<void> _onChatRequested(
    ProfileChatRequested event,
    Emitter<ProfileState> emit,
  ) async {
    final current = state;
    if (_isOwnProfile || current is! ProfileLoaded) return;

    final otherUserId = current.otherUser?.id;
    if (otherUserId == null || current.isCreatingChat) return;

    emit(current.copyWith(isCreatingChat: true));

    final result = await _createRoomUseCase(
      type: RoomType.direct,
      participantIds: [otherUserId],
    );

    result.fold(
      (failure) => emit(current.copyWith(
        isCreatingChat: false,
        chatError: _mapFailureToMessage(failure),
      )),
      (room) => emit(current.copyWith(
        isCreatingChat: false,
        navigateToRoom: room,
      )),
    );
  }

  Future<void> _onChangeUsernameRequested(
    ProfileChangeUsernameRequested event,
    Emitter<ProfileState> emit,
  ) async {
    final current = state;
    // менять имя можно только у себя
    if (!_isOwnProfile || current is! ProfileLoaded || current.isChangingUsername) return;

    emit(current.copyWith(isChangingUsername: true));

    final result = await _changeUsernameUsecase(event.name);

    result.fold(
      (failure) => emit(current.copyWith(
        isChangingUsername: false,
        usernameError: _mapFailureToMessage(failure),
      )),
      (user) => emit(current.copyWith(
        isChangingUsername: false,
        ownUser: user,
        usernameError: null,
      )),
    );
  }

  void _onChatNavigationHandled(
    ProfileChatNavigationHandled event,
    Emitter<ProfileState> emit,
  ) {
    final current = state;
    if (current is ProfileLoaded) {
      emit(current.copyWith(navigateToRoom: null));
    }
  }

  void _onChatErrorHandled(
    ProfileChatErrorHandled event,
    Emitter<ProfileState> emit,
  ) {
    final current = state;
    if (current is ProfileLoaded) {
      emit(current.copyWith(chatError: null));
    }
  }

  void _onUsernameErrorHandled(
    ProfileUsernameErrorHandled event,
    Emitter<ProfileState> emit,
  ) {
    final current = state;
    if (current is ProfileLoaded) {
      emit(current.copyWith(usernameError: null));
    }
  }

  String _mapFailureToMessage(Failure failure) => defaultFailureMessage(failure);

  @override
  Future<void> close() {
    _presenceSub?.cancel();
    return super.close();
  }
}