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
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(File file)? avatarUploadRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(File file)? avatarUploadRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileStarted value) started,
    required TResult Function(ProfileAvatarUploadRequested value)
    avatarUploadRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileStarted value)? started,
    TResult? Function(ProfileAvatarUploadRequested value)?
    avatarUploadRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileStarted value)? started,
    TResult Function(ProfileAvatarUploadRequested value)? avatarUploadRequested,
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
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(File file)? avatarUploadRequested,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(File file)? avatarUploadRequested,
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
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileStarted value)? started,
    TResult? Function(ProfileAvatarUploadRequested value)?
    avatarUploadRequested,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileStarted value)? started,
    TResult Function(ProfileAvatarUploadRequested value)? avatarUploadRequested,
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
  }) {
    return avatarUploadRequested(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(File file)? avatarUploadRequested,
  }) {
    return avatarUploadRequested?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(File file)? avatarUploadRequested,
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
  }) {
    return avatarUploadRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileStarted value)? started,
    TResult? Function(ProfileAvatarUploadRequested value)?
    avatarUploadRequested,
  }) {
    return avatarUploadRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileStarted value)? started,
    TResult Function(ProfileAvatarUploadRequested value)? avatarUploadRequested,
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
