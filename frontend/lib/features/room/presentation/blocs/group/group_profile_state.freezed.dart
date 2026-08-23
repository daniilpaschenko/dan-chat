// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GroupProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      RoomEntity room,
      bool isRemoving,
      bool isChangingRole,
      bool isUploadingAvatar,
      bool isChangingName,
      String? errorMessage,
      String? nameError,
      bool removedRemotely,
    )
    loaded,
    required TResult Function(String message) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      RoomEntity room,
      bool isRemoving,
      bool isChangingRole,
      bool isUploadingAvatar,
      bool isChangingName,
      String? errorMessage,
      String? nameError,
      bool removedRemotely,
    )?
    loaded,
    TResult? Function(String message)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      RoomEntity room,
      bool isRemoving,
      bool isChangingRole,
      bool isUploadingAvatar,
      bool isChangingName,
      String? errorMessage,
      String? nameError,
      bool removedRemotely,
    )?
    loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GroupProfileInitial value) initial,
    required TResult Function(GroupProfileLoading value) loading,
    required TResult Function(GroupProfileLoaded value) loaded,
    required TResult Function(GroupProfileFailure value) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroupProfileInitial value)? initial,
    TResult? Function(GroupProfileLoading value)? loading,
    TResult? Function(GroupProfileLoaded value)? loaded,
    TResult? Function(GroupProfileFailure value)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroupProfileInitial value)? initial,
    TResult Function(GroupProfileLoading value)? loading,
    TResult Function(GroupProfileLoaded value)? loaded,
    TResult Function(GroupProfileFailure value)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupProfileStateCopyWith<$Res> {
  factory $GroupProfileStateCopyWith(
    GroupProfileState value,
    $Res Function(GroupProfileState) then,
  ) = _$GroupProfileStateCopyWithImpl<$Res, GroupProfileState>;
}

/// @nodoc
class _$GroupProfileStateCopyWithImpl<$Res, $Val extends GroupProfileState>
    implements $GroupProfileStateCopyWith<$Res> {
  _$GroupProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GroupProfileInitialImplCopyWith<$Res> {
  factory _$$GroupProfileInitialImplCopyWith(
    _$GroupProfileInitialImpl value,
    $Res Function(_$GroupProfileInitialImpl) then,
  ) = __$$GroupProfileInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GroupProfileInitialImplCopyWithImpl<$Res>
    extends _$GroupProfileStateCopyWithImpl<$Res, _$GroupProfileInitialImpl>
    implements _$$GroupProfileInitialImplCopyWith<$Res> {
  __$$GroupProfileInitialImplCopyWithImpl(
    _$GroupProfileInitialImpl _value,
    $Res Function(_$GroupProfileInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GroupProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GroupProfileInitialImpl implements GroupProfileInitial {
  const _$GroupProfileInitialImpl();

  @override
  String toString() {
    return 'GroupProfileState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupProfileInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      RoomEntity room,
      bool isRemoving,
      bool isChangingRole,
      bool isUploadingAvatar,
      bool isChangingName,
      String? errorMessage,
      String? nameError,
      bool removedRemotely,
    )
    loaded,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      RoomEntity room,
      bool isRemoving,
      bool isChangingRole,
      bool isUploadingAvatar,
      bool isChangingName,
      String? errorMessage,
      String? nameError,
      bool removedRemotely,
    )?
    loaded,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      RoomEntity room,
      bool isRemoving,
      bool isChangingRole,
      bool isUploadingAvatar,
      bool isChangingName,
      String? errorMessage,
      String? nameError,
      bool removedRemotely,
    )?
    loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GroupProfileInitial value) initial,
    required TResult Function(GroupProfileLoading value) loading,
    required TResult Function(GroupProfileLoaded value) loaded,
    required TResult Function(GroupProfileFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroupProfileInitial value)? initial,
    TResult? Function(GroupProfileLoading value)? loading,
    TResult? Function(GroupProfileLoaded value)? loaded,
    TResult? Function(GroupProfileFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroupProfileInitial value)? initial,
    TResult Function(GroupProfileLoading value)? loading,
    TResult Function(GroupProfileLoaded value)? loaded,
    TResult Function(GroupProfileFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class GroupProfileInitial implements GroupProfileState {
  const factory GroupProfileInitial() = _$GroupProfileInitialImpl;
}

/// @nodoc
abstract class _$$GroupProfileLoadingImplCopyWith<$Res> {
  factory _$$GroupProfileLoadingImplCopyWith(
    _$GroupProfileLoadingImpl value,
    $Res Function(_$GroupProfileLoadingImpl) then,
  ) = __$$GroupProfileLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GroupProfileLoadingImplCopyWithImpl<$Res>
    extends _$GroupProfileStateCopyWithImpl<$Res, _$GroupProfileLoadingImpl>
    implements _$$GroupProfileLoadingImplCopyWith<$Res> {
  __$$GroupProfileLoadingImplCopyWithImpl(
    _$GroupProfileLoadingImpl _value,
    $Res Function(_$GroupProfileLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GroupProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GroupProfileLoadingImpl implements GroupProfileLoading {
  const _$GroupProfileLoadingImpl();

  @override
  String toString() {
    return 'GroupProfileState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupProfileLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      RoomEntity room,
      bool isRemoving,
      bool isChangingRole,
      bool isUploadingAvatar,
      bool isChangingName,
      String? errorMessage,
      String? nameError,
      bool removedRemotely,
    )
    loaded,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      RoomEntity room,
      bool isRemoving,
      bool isChangingRole,
      bool isUploadingAvatar,
      bool isChangingName,
      String? errorMessage,
      String? nameError,
      bool removedRemotely,
    )?
    loaded,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      RoomEntity room,
      bool isRemoving,
      bool isChangingRole,
      bool isUploadingAvatar,
      bool isChangingName,
      String? errorMessage,
      String? nameError,
      bool removedRemotely,
    )?
    loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GroupProfileInitial value) initial,
    required TResult Function(GroupProfileLoading value) loading,
    required TResult Function(GroupProfileLoaded value) loaded,
    required TResult Function(GroupProfileFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroupProfileInitial value)? initial,
    TResult? Function(GroupProfileLoading value)? loading,
    TResult? Function(GroupProfileLoaded value)? loaded,
    TResult? Function(GroupProfileFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroupProfileInitial value)? initial,
    TResult Function(GroupProfileLoading value)? loading,
    TResult Function(GroupProfileLoaded value)? loaded,
    TResult Function(GroupProfileFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GroupProfileLoading implements GroupProfileState {
  const factory GroupProfileLoading() = _$GroupProfileLoadingImpl;
}

/// @nodoc
abstract class _$$GroupProfileLoadedImplCopyWith<$Res> {
  factory _$$GroupProfileLoadedImplCopyWith(
    _$GroupProfileLoadedImpl value,
    $Res Function(_$GroupProfileLoadedImpl) then,
  ) = __$$GroupProfileLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    RoomEntity room,
    bool isRemoving,
    bool isChangingRole,
    bool isUploadingAvatar,
    bool isChangingName,
    String? errorMessage,
    String? nameError,
    bool removedRemotely,
  });

  $RoomEntityCopyWith<$Res> get room;
}

/// @nodoc
class __$$GroupProfileLoadedImplCopyWithImpl<$Res>
    extends _$GroupProfileStateCopyWithImpl<$Res, _$GroupProfileLoadedImpl>
    implements _$$GroupProfileLoadedImplCopyWith<$Res> {
  __$$GroupProfileLoadedImplCopyWithImpl(
    _$GroupProfileLoadedImpl _value,
    $Res Function(_$GroupProfileLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GroupProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? room = null,
    Object? isRemoving = null,
    Object? isChangingRole = null,
    Object? isUploadingAvatar = null,
    Object? isChangingName = null,
    Object? errorMessage = freezed,
    Object? nameError = freezed,
    Object? removedRemotely = null,
  }) {
    return _then(
      _$GroupProfileLoadedImpl(
        room: null == room
            ? _value.room
            : room // ignore: cast_nullable_to_non_nullable
                  as RoomEntity,
        isRemoving: null == isRemoving
            ? _value.isRemoving
            : isRemoving // ignore: cast_nullable_to_non_nullable
                  as bool,
        isChangingRole: null == isChangingRole
            ? _value.isChangingRole
            : isChangingRole // ignore: cast_nullable_to_non_nullable
                  as bool,
        isUploadingAvatar: null == isUploadingAvatar
            ? _value.isUploadingAvatar
            : isUploadingAvatar // ignore: cast_nullable_to_non_nullable
                  as bool,
        isChangingName: null == isChangingName
            ? _value.isChangingName
            : isChangingName // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        nameError: freezed == nameError
            ? _value.nameError
            : nameError // ignore: cast_nullable_to_non_nullable
                  as String?,
        removedRemotely: null == removedRemotely
            ? _value.removedRemotely
            : removedRemotely // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of GroupProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RoomEntityCopyWith<$Res> get room {
    return $RoomEntityCopyWith<$Res>(_value.room, (value) {
      return _then(_value.copyWith(room: value));
    });
  }
}

/// @nodoc

class _$GroupProfileLoadedImpl implements GroupProfileLoaded {
  const _$GroupProfileLoadedImpl({
    required this.room,
    this.isRemoving = false,
    this.isChangingRole = false,
    this.isUploadingAvatar = false,
    this.isChangingName = false,
    this.errorMessage,
    this.nameError,
    this.removedRemotely = false,
  });

  @override
  final RoomEntity room;
  @override
  @JsonKey()
  final bool isRemoving;
  @override
  @JsonKey()
  final bool isChangingRole;
  @override
  @JsonKey()
  final bool isUploadingAvatar;
  @override
  @JsonKey()
  final bool isChangingName;
  @override
  final String? errorMessage;
  // одноразовое сообщение об ошибке кика
  @override
  final String? nameError;
  // одноразовый сигнал — нас удалили из группы (или её удалили) с другого устройства/владельцем
  @override
  @JsonKey()
  final bool removedRemotely;

  @override
  String toString() {
    return 'GroupProfileState.loaded(room: $room, isRemoving: $isRemoving, isChangingRole: $isChangingRole, isUploadingAvatar: $isUploadingAvatar, isChangingName: $isChangingName, errorMessage: $errorMessage, nameError: $nameError, removedRemotely: $removedRemotely)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupProfileLoadedImpl &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.isRemoving, isRemoving) ||
                other.isRemoving == isRemoving) &&
            (identical(other.isChangingRole, isChangingRole) ||
                other.isChangingRole == isChangingRole) &&
            (identical(other.isUploadingAvatar, isUploadingAvatar) ||
                other.isUploadingAvatar == isUploadingAvatar) &&
            (identical(other.isChangingName, isChangingName) ||
                other.isChangingName == isChangingName) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.nameError, nameError) ||
                other.nameError == nameError) &&
            (identical(other.removedRemotely, removedRemotely) ||
                other.removedRemotely == removedRemotely));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    room,
    isRemoving,
    isChangingRole,
    isUploadingAvatar,
    isChangingName,
    errorMessage,
    nameError,
    removedRemotely,
  );

  /// Create a copy of GroupProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupProfileLoadedImplCopyWith<_$GroupProfileLoadedImpl> get copyWith =>
      __$$GroupProfileLoadedImplCopyWithImpl<_$GroupProfileLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      RoomEntity room,
      bool isRemoving,
      bool isChangingRole,
      bool isUploadingAvatar,
      bool isChangingName,
      String? errorMessage,
      String? nameError,
      bool removedRemotely,
    )
    loaded,
    required TResult Function(String message) failure,
  }) {
    return loaded(
      room,
      isRemoving,
      isChangingRole,
      isUploadingAvatar,
      isChangingName,
      errorMessage,
      nameError,
      removedRemotely,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      RoomEntity room,
      bool isRemoving,
      bool isChangingRole,
      bool isUploadingAvatar,
      bool isChangingName,
      String? errorMessage,
      String? nameError,
      bool removedRemotely,
    )?
    loaded,
    TResult? Function(String message)? failure,
  }) {
    return loaded?.call(
      room,
      isRemoving,
      isChangingRole,
      isUploadingAvatar,
      isChangingName,
      errorMessage,
      nameError,
      removedRemotely,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      RoomEntity room,
      bool isRemoving,
      bool isChangingRole,
      bool isUploadingAvatar,
      bool isChangingName,
      String? errorMessage,
      String? nameError,
      bool removedRemotely,
    )?
    loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(
        room,
        isRemoving,
        isChangingRole,
        isUploadingAvatar,
        isChangingName,
        errorMessage,
        nameError,
        removedRemotely,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GroupProfileInitial value) initial,
    required TResult Function(GroupProfileLoading value) loading,
    required TResult Function(GroupProfileLoaded value) loaded,
    required TResult Function(GroupProfileFailure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroupProfileInitial value)? initial,
    TResult? Function(GroupProfileLoading value)? loading,
    TResult? Function(GroupProfileLoaded value)? loaded,
    TResult? Function(GroupProfileFailure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroupProfileInitial value)? initial,
    TResult Function(GroupProfileLoading value)? loading,
    TResult Function(GroupProfileLoaded value)? loaded,
    TResult Function(GroupProfileFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class GroupProfileLoaded implements GroupProfileState {
  const factory GroupProfileLoaded({
    required final RoomEntity room,
    final bool isRemoving,
    final bool isChangingRole,
    final bool isUploadingAvatar,
    final bool isChangingName,
    final String? errorMessage,
    final String? nameError,
    final bool removedRemotely,
  }) = _$GroupProfileLoadedImpl;

  RoomEntity get room;
  bool get isRemoving;
  bool get isChangingRole;
  bool get isUploadingAvatar;
  bool get isChangingName;
  String? get errorMessage; // одноразовое сообщение об ошибке кика
  String?
  get nameError; // одноразовый сигнал — нас удалили из группы (или её удалили) с другого устройства/владельцем
  bool get removedRemotely;

  /// Create a copy of GroupProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupProfileLoadedImplCopyWith<_$GroupProfileLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GroupProfileFailureImplCopyWith<$Res> {
  factory _$$GroupProfileFailureImplCopyWith(
    _$GroupProfileFailureImpl value,
    $Res Function(_$GroupProfileFailureImpl) then,
  ) = __$$GroupProfileFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$GroupProfileFailureImplCopyWithImpl<$Res>
    extends _$GroupProfileStateCopyWithImpl<$Res, _$GroupProfileFailureImpl>
    implements _$$GroupProfileFailureImplCopyWith<$Res> {
  __$$GroupProfileFailureImplCopyWithImpl(
    _$GroupProfileFailureImpl _value,
    $Res Function(_$GroupProfileFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GroupProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$GroupProfileFailureImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$GroupProfileFailureImpl implements GroupProfileFailure {
  const _$GroupProfileFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'GroupProfileState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupProfileFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of GroupProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupProfileFailureImplCopyWith<_$GroupProfileFailureImpl> get copyWith =>
      __$$GroupProfileFailureImplCopyWithImpl<_$GroupProfileFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
      RoomEntity room,
      bool isRemoving,
      bool isChangingRole,
      bool isUploadingAvatar,
      bool isChangingName,
      String? errorMessage,
      String? nameError,
      bool removedRemotely,
    )
    loaded,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
      RoomEntity room,
      bool isRemoving,
      bool isChangingRole,
      bool isUploadingAvatar,
      bool isChangingName,
      String? errorMessage,
      String? nameError,
      bool removedRemotely,
    )?
    loaded,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
      RoomEntity room,
      bool isRemoving,
      bool isChangingRole,
      bool isUploadingAvatar,
      bool isChangingName,
      String? errorMessage,
      String? nameError,
      bool removedRemotely,
    )?
    loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GroupProfileInitial value) initial,
    required TResult Function(GroupProfileLoading value) loading,
    required TResult Function(GroupProfileLoaded value) loaded,
    required TResult Function(GroupProfileFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroupProfileInitial value)? initial,
    TResult? Function(GroupProfileLoading value)? loading,
    TResult? Function(GroupProfileLoaded value)? loaded,
    TResult? Function(GroupProfileFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroupProfileInitial value)? initial,
    TResult Function(GroupProfileLoading value)? loading,
    TResult Function(GroupProfileLoaded value)? loaded,
    TResult Function(GroupProfileFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class GroupProfileFailure implements GroupProfileState {
  const factory GroupProfileFailure(final String message) =
      _$GroupProfileFailureImpl;

  String get message;

  /// Create a copy of GroupProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupProfileFailureImplCopyWith<_$GroupProfileFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
