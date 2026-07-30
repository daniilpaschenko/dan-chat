import 'dart:async';
import 'package:bloc/bloc.dart';

import '../../../../../core/errors/failure_mapper.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../room/data/models/room.dart';
import '../../../../room/domain/usecases/create_room_usecase.dart';
import '../../../domain/usecases/get_my_profile_usecase.dart';
import '../../../domain/usecases/get_user_profile_usecase.dart';
import '../../../domain/usecases/upload_avatar_usecase.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetMyProfileUseCase _getMyProfileUseCase;
  final GetUserProfileUseCase _getUserProfileUseCase;
  final UploadAvatarUseCase _uploadAvatarUseCase;
  final CreateRoomUseCase _createRoomUseCase;

  /// null -> свой профиль, иначе id чужого
  final String? userId;

  ProfileBloc({
    required this.userId,
    required GetMyProfileUseCase getMyProfileUseCase,
    required GetUserProfileUseCase getUserProfileUseCase,
    required UploadAvatarUseCase uploadAvatarUseCase,
    required CreateRoomUseCase createRoomUseCase,
  })  : _getMyProfileUseCase = getMyProfileUseCase,
        _getUserProfileUseCase = getUserProfileUseCase,
        _uploadAvatarUseCase = uploadAvatarUseCase,
        _createRoomUseCase = createRoomUseCase,
        super(const ProfileState.initial()) {
    on<ProfileStarted>(_onStarted);
    on<ProfileAvatarUploadRequested>(_onAvatarUploadRequested);
    on<ProfileChatRequested>(_onChatRequested);
    on<ProfileChatNavigationHandled>(_onChatNavigationHandled);
    on<ProfileChatErrorHandled>(_onChatErrorHandled);
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
      (user) => emit(ProfileState.loaded(isOwnProfile: false, otherUser: user)),
    );
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

  String _mapFailureToMessage(Failure failure) => defaultFailureMessage(failure);
}