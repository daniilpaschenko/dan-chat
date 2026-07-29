// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(File file) avatarUploadRequested,
    required TResult Function() chatRequested,
    required TResult Function() chatNavigationHandled,
    required TResult Function() chatErrorHandled,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(File file)? avatarUploadRequested,
    TResult? Function()? chatRequested,
    TResult? Function()? chatNavigationHandled,
    TResult? Function()? chatErrorHandled,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(File file)? avatarUploadRequested,
    TResult Function()? chatRequested,
    TResult Function()? chatNavigationHandled,
    TResult Function()? chatErrorHandled,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileStarted value) started,
    required TResult Function(ProfileAvatarUploadRequested value)
    avatarUploadRequested,
    required TResult Function(ProfileChatRequested value) chatRequested,
    required TResult Function(ProfileChatNavigationHandled value)
    chatNavigationHandled,
    required TResult Function(ProfileChatErrorHandled value) chatErrorHandled,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileStarted value)? started,
    TResult? Function(ProfileAvatarUploadRequested value)?
    avatarUploadRequested,
    TResult? Function(ProfileChatRequested value)? chatRequested,
    TResult? Function(ProfileChatNavigationHandled value)?
    chatNavigationHandled,
    TResult? Function(ProfileChatErrorHandled value)? chatErrorHandled,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileStarted value)? started,
    TResult Function(ProfileAvatarUploadRequested value)? avatarUploadRequested,
    TResult Function(ProfileChatRequested value)? chatRequested,
    TResult Function(ProfileChatNavigationHandled value)? chatNavigationHandled,
    TResult Function(ProfileChatErrorHandled value)? chatErrorHandled,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(
    ProfileEvent value,
    $Res Function(ProfileEvent) then,
  ) = _$ProfileEventCopyWithImpl<$Res, ProfileEvent>;
}

/// @nodoc
class _$ProfileEventCopyWithImpl<$Res, $Val extends ProfileEvent>
    implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ProfileStartedImplCopyWith<$Res> {
  factory _$$ProfileStartedImplCopyWith(
    _$ProfileStartedImpl value,
    $Res Function(_$ProfileStartedImpl) then,
  ) = __$$ProfileStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileStartedImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$ProfileStartedImpl>
    implements _$$ProfileStartedImplCopyWith<$Res> {
  __$$ProfileStartedImplCopyWithImpl(
    _$ProfileStartedImpl _value,
    $Res Function(_$ProfileStartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProfileStartedImpl implements ProfileStarted {
  const _$ProfileStartedImpl();

  @override
  String toString() {
    return 'ProfileEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProfileStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(File file) avatarUploadRequested,
    required TResult Function() chatRequested,
    required TResult Function() chatNavigationHandled,
    required TResult Function() chatErrorHandled,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(File file)? avatarUploadRequested,
    TResult? Function()? chatRequested,
    TResult? Function()? chatNavigationHandled,
    TResult? Function()? chatErrorHandled,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(File file)? avatarUploadRequested,
    TResult Function()? chatRequested,
    TResult Function()? chatNavigationHandled,
    TResult Function()? chatErrorHandled,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileStarted value) started,
    required TResult Function(ProfileAvatarUploadRequested value)
    avatarUploadRequested,
    required TResult Function(ProfileChatRequested value) chatRequested,
    required TResult Function(ProfileChatNavigationHandled value)
    chatNavigationHandled,
    required TResult Function(ProfileChatErrorHandled value) chatErrorHandled,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileStarted value)? started,
    TResult? Function(ProfileAvatarUploadRequested value)?
    avatarUploadRequested,
    TResult? Function(ProfileChatRequested value)? chatRequested,
    TResult? Function(ProfileChatNavigationHandled value)?
    chatNavigationHandled,
    TResult? Function(ProfileChatErrorHandled value)? chatErrorHandled,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileStarted value)? started,
    TResult Function(ProfileAvatarUploadRequested value)? avatarUploadRequested,
    TResult Function(ProfileChatRequested value)? chatRequested,
    TResult Function(ProfileChatNavigationHandled value)? chatNavigationHandled,
    TResult Function(ProfileChatErrorHandled value)? chatErrorHandled,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class ProfileStarted implements ProfileEvent {
  const factory ProfileStarted() = _$ProfileStartedImpl;
}

/// @nodoc
abstract class _$$ProfileAvatarUploadRequestedImplCopyWith<$Res> {
  factory _$$ProfileAvatarUploadRequestedImplCopyWith(
    _$ProfileAvatarUploadRequestedImpl value,
    $Res Function(_$ProfileAvatarUploadRequestedImpl) then,
  ) = __$$ProfileAvatarUploadRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({File file});
}

/// @nodoc
class __$$ProfileAvatarUploadRequestedImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$ProfileAvatarUploadRequestedImpl>
    implements _$$ProfileAvatarUploadRequestedImplCopyWith<$Res> {
  __$$ProfileAvatarUploadRequestedImplCopyWithImpl(
    _$ProfileAvatarUploadRequestedImpl _value,
    $Res Function(_$ProfileAvatarUploadRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? file = null}) {
    return _then(
      _$ProfileAvatarUploadRequestedImpl(
        null == file
            ? _value.file
            : file // ignore: cast_nullable_to_non_nullable
                  as File,
      ),
    );
  }
}

/// @nodoc

class _$ProfileAvatarUploadRequestedImpl
    implements ProfileAvatarUploadRequested {
  const _$ProfileAvatarUploadRequestedImpl(this.file);

  @override
  final File file;

  @override
  String toString() {
    return 'ProfileEvent.avatarUploadRequested(file: $file)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileAvatarUploadRequestedImpl &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileAvatarUploadRequestedImplCopyWith<
    _$ProfileAvatarUploadRequestedImpl
  >
  get copyWith =>
      __$$ProfileAvatarUploadRequestedImplCopyWithImpl<
        _$ProfileAvatarUploadRequestedImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(File file) avatarUploadRequested,
    required TResult Function() chatRequested,
    required TResult Function() chatNavigationHandled,
    required TResult Function() chatErrorHandled,
  }) {
    return avatarUploadRequested(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(File file)? avatarUploadRequested,
    TResult? Function()? chatRequested,
    TResult? Function()? chatNavigationHandled,
    TResult? Function()? chatErrorHandled,
  }) {
    return avatarUploadRequested?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(File file)? avatarUploadRequested,
    TResult Function()? chatRequested,
    TResult Function()? chatNavigationHandled,
    TResult Function()? chatErrorHandled,
    required TResult orElse(),
  }) {
    if (avatarUploadRequested != null) {
      return avatarUploadRequested(file);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileStarted value) started,
    required TResult Function(ProfileAvatarUploadRequested value)
    avatarUploadRequested,
    required TResult Function(ProfileChatRequested value) chatRequested,
    required TResult Function(ProfileChatNavigationHandled value)
    chatNavigationHandled,
    required TResult Function(ProfileChatErrorHandled value) chatErrorHandled,
  }) {
    return avatarUploadRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileStarted value)? started,
    TResult? Function(ProfileAvatarUploadRequested value)?
    avatarUploadRequested,
    TResult? Function(ProfileChatRequested value)? chatRequested,
    TResult? Function(ProfileChatNavigationHandled value)?
    chatNavigationHandled,
    TResult? Function(ProfileChatErrorHandled value)? chatErrorHandled,
  }) {
    return avatarUploadRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileStarted value)? started,
    TResult Function(ProfileAvatarUploadRequested value)? avatarUploadRequested,
    TResult Function(ProfileChatRequested value)? chatRequested,
    TResult Function(ProfileChatNavigationHandled value)? chatNavigationHandled,
    TResult Function(ProfileChatErrorHandled value)? chatErrorHandled,
    required TResult orElse(),
  }) {
    if (avatarUploadRequested != null) {
      return avatarUploadRequested(this);
    }
    return orElse();
  }
}

abstract class ProfileAvatarUploadRequested implements ProfileEvent {
  const factory ProfileAvatarUploadRequested(final File file) =
      _$ProfileAvatarUploadRequestedImpl;

  File get file;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileAvatarUploadRequestedImplCopyWith<
    _$ProfileAvatarUploadRequestedImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileChatRequestedImplCopyWith<$Res> {
  factory _$$ProfileChatRequestedImplCopyWith(
    _$ProfileChatRequestedImpl value,
    $Res Function(_$ProfileChatRequestedImpl) then,
  ) = __$$ProfileChatRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileChatRequestedImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$ProfileChatRequestedImpl>
    implements _$$ProfileChatRequestedImplCopyWith<$Res> {
  __$$ProfileChatRequestedImplCopyWithImpl(
    _$ProfileChatRequestedImpl _value,
    $Res Function(_$ProfileChatRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProfileChatRequestedImpl implements ProfileChatRequested {
  const _$ProfileChatRequestedImpl();

  @override
  String toString() {
    return 'ProfileEvent.chatRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileChatRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(File file) avatarUploadRequested,
    required TResult Function() chatRequested,
    required TResult Function() chatNavigationHandled,
    required TResult Function() chatErrorHandled,
  }) {
    return chatRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(File file)? avatarUploadRequested,
    TResult? Function()? chatRequested,
    TResult? Function()? chatNavigationHandled,
    TResult? Function()? chatErrorHandled,
  }) {
    return chatRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(File file)? avatarUploadRequested,
    TResult Function()? chatRequested,
    TResult Function()? chatNavigationHandled,
    TResult Function()? chatErrorHandled,
    required TResult orElse(),
  }) {
    if (chatRequested != null) {
      return chatRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileStarted value) started,
    required TResult Function(ProfileAvatarUploadRequested value)
    avatarUploadRequested,
    required TResult Function(ProfileChatRequested value) chatRequested,
    required TResult Function(ProfileChatNavigationHandled value)
    chatNavigationHandled,
    required TResult Function(ProfileChatErrorHandled value) chatErrorHandled,
  }) {
    return chatRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileStarted value)? started,
    TResult? Function(ProfileAvatarUploadRequested value)?
    avatarUploadRequested,
    TResult? Function(ProfileChatRequested value)? chatRequested,
    TResult? Function(ProfileChatNavigationHandled value)?
    chatNavigationHandled,
    TResult? Function(ProfileChatErrorHandled value)? chatErrorHandled,
  }) {
    return chatRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileStarted value)? started,
    TResult Function(ProfileAvatarUploadRequested value)? avatarUploadRequested,
    TResult Function(ProfileChatRequested value)? chatRequested,
    TResult Function(ProfileChatNavigationHandled value)? chatNavigationHandled,
    TResult Function(ProfileChatErrorHandled value)? chatErrorHandled,
    required TResult orElse(),
  }) {
    if (chatRequested != null) {
      return chatRequested(this);
    }
    return orElse();
  }
}

abstract class ProfileChatRequested implements ProfileEvent {
  const factory ProfileChatRequested() = _$ProfileChatRequestedImpl;
}

/// @nodoc
abstract class _$$ProfileChatNavigationHandledImplCopyWith<$Res> {
  factory _$$ProfileChatNavigationHandledImplCopyWith(
    _$ProfileChatNavigationHandledImpl value,
    $Res Function(_$ProfileChatNavigationHandledImpl) then,
  ) = __$$ProfileChatNavigationHandledImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileChatNavigationHandledImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$ProfileChatNavigationHandledImpl>
    implements _$$ProfileChatNavigationHandledImplCopyWith<$Res> {
  __$$ProfileChatNavigationHandledImplCopyWithImpl(
    _$ProfileChatNavigationHandledImpl _value,
    $Res Function(_$ProfileChatNavigationHandledImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProfileChatNavigationHandledImpl
    implements ProfileChatNavigationHandled {
  const _$ProfileChatNavigationHandledImpl();

  @override
  String toString() {
    return 'ProfileEvent.chatNavigationHandled()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileChatNavigationHandledImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(File file) avatarUploadRequested,
    required TResult Function() chatRequested,
    required TResult Function() chatNavigationHandled,
    required TResult Function() chatErrorHandled,
  }) {
    return chatNavigationHandled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(File file)? avatarUploadRequested,
    TResult? Function()? chatRequested,
    TResult? Function()? chatNavigationHandled,
    TResult? Function()? chatErrorHandled,
  }) {
    return chatNavigationHandled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(File file)? avatarUploadRequested,
    TResult Function()? chatRequested,
    TResult Function()? chatNavigationHandled,
    TResult Function()? chatErrorHandled,
    required TResult orElse(),
  }) {
    if (chatNavigationHandled != null) {
      return chatNavigationHandled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileStarted value) started,
    required TResult Function(ProfileAvatarUploadRequested value)
    avatarUploadRequested,
    required TResult Function(ProfileChatRequested value) chatRequested,
    required TResult Function(ProfileChatNavigationHandled value)
    chatNavigationHandled,
    required TResult Function(ProfileChatErrorHandled value) chatErrorHandled,
  }) {
    return chatNavigationHandled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileStarted value)? started,
    TResult? Function(ProfileAvatarUploadRequested value)?
    avatarUploadRequested,
    TResult? Function(ProfileChatRequested value)? chatRequested,
    TResult? Function(ProfileChatNavigationHandled value)?
    chatNavigationHandled,
    TResult? Function(ProfileChatErrorHandled value)? chatErrorHandled,
  }) {
    return chatNavigationHandled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileStarted value)? started,
    TResult Function(ProfileAvatarUploadRequested value)? avatarUploadRequested,
    TResult Function(ProfileChatRequested value)? chatRequested,
    TResult Function(ProfileChatNavigationHandled value)? chatNavigationHandled,
    TResult Function(ProfileChatErrorHandled value)? chatErrorHandled,
    required TResult orElse(),
  }) {
    if (chatNavigationHandled != null) {
      return chatNavigationHandled(this);
    }
    return orElse();
  }
}

abstract class ProfileChatNavigationHandled implements ProfileEvent {
  const factory ProfileChatNavigationHandled() =
      _$ProfileChatNavigationHandledImpl;
}

/// @nodoc
abstract class _$$ProfileChatErrorHandledImplCopyWith<$Res> {
  factory _$$ProfileChatErrorHandledImplCopyWith(
    _$ProfileChatErrorHandledImpl value,
    $Res Function(_$ProfileChatErrorHandledImpl) then,
  ) = __$$ProfileChatErrorHandledImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileChatErrorHandledImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$ProfileChatErrorHandledImpl>
    implements _$$ProfileChatErrorHandledImplCopyWith<$Res> {
  __$$ProfileChatErrorHandledImplCopyWithImpl(
    _$ProfileChatErrorHandledImpl _value,
    $Res Function(_$ProfileChatErrorHandledImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProfileChatErrorHandledImpl implements ProfileChatErrorHandled {
  const _$ProfileChatErrorHandledImpl();

  @override
  String toString() {
    return 'ProfileEvent.chatErrorHandled()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileChatErrorHandledImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(File file) avatarUploadRequested,
    required TResult Function() chatRequested,
    required TResult Function() chatNavigationHandled,
    required TResult Function() chatErrorHandled,
  }) {
    return chatErrorHandled();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(File file)? avatarUploadRequested,
    TResult? Function()? chatRequested,
    TResult? Function()? chatNavigationHandled,
    TResult? Function()? chatErrorHandled,
  }) {
    return chatErrorHandled?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(File file)? avatarUploadRequested,
    TResult Function()? chatRequested,
    TResult Function()? chatNavigationHandled,
    TResult Function()? chatErrorHandled,
    required TResult orElse(),
  }) {
    if (chatErrorHandled != null) {
      return chatErrorHandled();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileStarted value) started,
    required TResult Function(ProfileAvatarUploadRequested value)
    avatarUploadRequested,
    required TResult Function(ProfileChatRequested value) chatRequested,
    required TResult Function(ProfileChatNavigationHandled value)
    chatNavigationHandled,
    required TResult Function(ProfileChatErrorHandled value) chatErrorHandled,
  }) {
    return chatErrorHandled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileStarted value)? started,
    TResult? Function(ProfileAvatarUploadRequested value)?
    avatarUploadRequested,
    TResult? Function(ProfileChatRequested value)? chatRequested,
    TResult? Function(ProfileChatNavigationHandled value)?
    chatNavigationHandled,
    TResult? Function(ProfileChatErrorHandled value)? chatErrorHandled,
  }) {
    return chatErrorHandled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileStarted value)? started,
    TResult Function(ProfileAvatarUploadRequested value)? avatarUploadRequested,
    TResult Function(ProfileChatRequested value)? chatRequested,
    TResult Function(ProfileChatNavigationHandled value)? chatNavigationHandled,
    TResult Function(ProfileChatErrorHandled value)? chatErrorHandled,
    required TResult orElse(),
  }) {
    if (chatErrorHandled != null) {
      return chatErrorHandled(this);
    }
    return orElse();
  }
}

abstract class ProfileChatErrorHandled implements ProfileEvent {
  const factory ProfileChatErrorHandled() = _$ProfileChatErrorHandledImpl;
}
