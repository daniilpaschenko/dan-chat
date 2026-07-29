import 'dart:async';
import 'package:bloc/bloc.dart';

import '../../../../../core/errors/failure_mapper.dart';
import '../../../../../core/errors/failures.dart';
import '../../../domain/usecases/get_my_profile_usecase.dart';
import '../../../domain/usecases/get_user_profile_usecase.dart';
import '../../../domain/usecases/upload_avatar_usecase.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetMyProfileUseCase _getMyProfileUseCase;
  final GetUserProfileUseCase _getUserProfileUseCase;
  final UploadAvatarUseCase _uploadAvatarUseCase;

  /// null -> свой профиль, иначе id чужого
  final String? userId;

  ProfileBloc({
    required this.userId,
    required GetMyProfileUseCase getMyProfileUseCase,
    required GetUserProfileUseCase getUserProfileUseCase,
    required UploadAvatarUseCase uploadAvatarUseCase,
  })  : _getMyProfileUseCase = getMyProfileUseCase,
        _getUserProfileUseCase = getUserProfileUseCase,
        _uploadAvatarUseCase = uploadAvatarUseCase,
        super(const ProfileState.initial()) {
    on<ProfileStarted>(_onStarted);
    on<ProfileAvatarUploadRequested>(_onAvatarUploadRequested);
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

  String _mapFailureToMessage(Failure failure) => defaultFailureMessage(failure);
}