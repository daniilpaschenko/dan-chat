// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_profile_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GroupProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String userId) participantRemoveRequested,
    required TResult Function(String userId, ParticipantRole role)
    participantRoleChangeRequested,
    required TResult Function(RoomEntity room) participantsAdded,
    required TResult Function() roomUpdatedRemotely,
    required TResult Function() roomRemovedRemotely,
    required TResult Function(XFile file) avatarUploadRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String userId)? participantRemoveRequested,
    TResult? Function(String userId, ParticipantRole role)?
    participantRoleChangeRequested,
    TResult? Function(RoomEntity room)? participantsAdded,
    TResult? Function()? roomUpdatedRemotely,
    TResult? Function()? roomRemovedRemotely,
    TResult? Function(XFile file)? avatarUploadRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String userId)? participantRemoveRequested,
    TResult Function(String userId, ParticipantRole role)?
    participantRoleChangeRequested,
    TResult Function(RoomEntity room)? participantsAdded,
    TResult Function()? roomUpdatedRemotely,
    TResult Function()? roomRemovedRemotely,
    TResult Function(XFile file)? avatarUploadRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GroupProfileStarted value) started,
    required TResult Function(GroupProfileParticipantRemoveRequested value)
    participantRemoveRequested,
    required TResult Function(GroupProfileParticipantRoleChangeRequested value)
    participantRoleChangeRequested,
    required TResult Function(GroupProfileParticipantsAdded value)
    participantsAdded,
    required TResult Function(GroupProfileRoomUpdatedRemotely value)
    roomUpdatedRemotely,
    required TResult Function(GroupProfileRoomRemovedRemotely value)
    roomRemovedRemotely,
    required TResult Function(GroupProfileAvatarUploadRequested value)
    avatarUploadRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroupProfileStarted value)? started,
    TResult? Function(GroupProfileParticipantRemoveRequested value)?
    participantRemoveRequested,
    TResult? Function(GroupProfileParticipantRoleChangeRequested value)?
    participantRoleChangeRequested,
    TResult? Function(GroupProfileParticipantsAdded value)? participantsAdded,
    TResult? Function(GroupProfileRoomUpdatedRemotely value)?
    roomUpdatedRemotely,
    TResult? Function(GroupProfileRoomRemovedRemotely value)?
    roomRemovedRemotely,
    TResult? Function(GroupProfileAvatarUploadRequested value)?
    avatarUploadRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroupProfileStarted value)? started,
    TResult Function(GroupProfileParticipantRemoveRequested value)?
    participantRemoveRequested,
    TResult Function(GroupProfileParticipantRoleChangeRequested value)?
    participantRoleChangeRequested,
    TResult Function(GroupProfileParticipantsAdded value)? participantsAdded,
    TResult Function(GroupProfileRoomUpdatedRemotely value)?
    roomUpdatedRemotely,
    TResult Function(GroupProfileRoomRemovedRemotely value)?
    roomRemovedRemotely,
    TResult Function(GroupProfileAvatarUploadRequested value)?
    avatarUploadRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupProfileEventCopyWith<$Res> {
  factory $GroupProfileEventCopyWith(
    GroupProfileEvent value,
    $Res Function(GroupProfileEvent) then,
  ) = _$GroupProfileEventCopyWithImpl<$Res, GroupProfileEvent>;
}

/// @nodoc
class _$GroupProfileEventCopyWithImpl<$Res, $Val extends GroupProfileEvent>
    implements $GroupProfileEventCopyWith<$Res> {
  _$GroupProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GroupProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GroupProfileStartedImplCopyWith<$Res> {
  factory _$$GroupProfileStartedImplCopyWith(
    _$GroupProfileStartedImpl value,
    $Res Function(_$GroupProfileStartedImpl) then,
  ) = __$$GroupProfileStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GroupProfileStartedImplCopyWithImpl<$Res>
    extends _$GroupProfileEventCopyWithImpl<$Res, _$GroupProfileStartedImpl>
    implements _$$GroupProfileStartedImplCopyWith<$Res> {
  __$$GroupProfileStartedImplCopyWithImpl(
    _$GroupProfileStartedImpl _value,
    $Res Function(_$GroupProfileStartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GroupProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GroupProfileStartedImpl implements GroupProfileStarted {
  const _$GroupProfileStartedImpl();

  @override
  String toString() {
    return 'GroupProfileEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupProfileStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String userId) participantRemoveRequested,
    required TResult Function(String userId, ParticipantRole role)
    participantRoleChangeRequested,
    required TResult Function(RoomEntity room) participantsAdded,
    required TResult Function() roomUpdatedRemotely,
    required TResult Function() roomRemovedRemotely,
    required TResult Function(XFile file) avatarUploadRequested,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String userId)? participantRemoveRequested,
    TResult? Function(String userId, ParticipantRole role)?
    participantRoleChangeRequested,
    TResult? Function(RoomEntity room)? participantsAdded,
    TResult? Function()? roomUpdatedRemotely,
    TResult? Function()? roomRemovedRemotely,
    TResult? Function(XFile file)? avatarUploadRequested,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String userId)? participantRemoveRequested,
    TResult Function(String userId, ParticipantRole role)?
    participantRoleChangeRequested,
    TResult Function(RoomEntity room)? participantsAdded,
    TResult Function()? roomUpdatedRemotely,
    TResult Function()? roomRemovedRemotely,
    TResult Function(XFile file)? avatarUploadRequested,
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
    required TResult Function(GroupProfileStarted value) started,
    required TResult Function(GroupProfileParticipantRemoveRequested value)
    participantRemoveRequested,
    required TResult Function(GroupProfileParticipantRoleChangeRequested value)
    participantRoleChangeRequested,
    required TResult Function(GroupProfileParticipantsAdded value)
    participantsAdded,
    required TResult Function(GroupProfileRoomUpdatedRemotely value)
    roomUpdatedRemotely,
    required TResult Function(GroupProfileRoomRemovedRemotely value)
    roomRemovedRemotely,
    required TResult Function(GroupProfileAvatarUploadRequested value)
    avatarUploadRequested,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroupProfileStarted value)? started,
    TResult? Function(GroupProfileParticipantRemoveRequested value)?
    participantRemoveRequested,
    TResult? Function(GroupProfileParticipantRoleChangeRequested value)?
    participantRoleChangeRequested,
    TResult? Function(GroupProfileParticipantsAdded value)? participantsAdded,
    TResult? Function(GroupProfileRoomUpdatedRemotely value)?
    roomUpdatedRemotely,
    TResult? Function(GroupProfileRoomRemovedRemotely value)?
    roomRemovedRemotely,
    TResult? Function(GroupProfileAvatarUploadRequested value)?
    avatarUploadRequested,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroupProfileStarted value)? started,
    TResult Function(GroupProfileParticipantRemoveRequested value)?
    participantRemoveRequested,
    TResult Function(GroupProfileParticipantRoleChangeRequested value)?
    participantRoleChangeRequested,
    TResult Function(GroupProfileParticipantsAdded value)? participantsAdded,
    TResult Function(GroupProfileRoomUpdatedRemotely value)?
    roomUpdatedRemotely,
    TResult Function(GroupProfileRoomRemovedRemotely value)?
    roomRemovedRemotely,
    TResult Function(GroupProfileAvatarUploadRequested value)?
    avatarUploadRequested,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class GroupProfileStarted implements GroupProfileEvent {
  const factory GroupProfileStarted() = _$GroupProfileStartedImpl;
}

/// @nodoc
abstract class _$$GroupProfileParticipantRemoveRequestedImplCopyWith<$Res> {
  factory _$$GroupProfileParticipantRemoveRequestedImplCopyWith(
    _$GroupProfileParticipantRemoveRequestedImpl value,
    $Res Function(_$GroupProfileParticipantRemoveRequestedImpl) then,
  ) = __$$GroupProfileParticipantRemoveRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$GroupProfileParticipantRemoveRequestedImplCopyWithImpl<$Res>
    extends
        _$GroupProfileEventCopyWithImpl<
          $Res,
          _$GroupProfileParticipantRemoveRequestedImpl
        >
    implements _$$GroupProfileParticipantRemoveRequestedImplCopyWith<$Res> {
  __$$GroupProfileParticipantRemoveRequestedImplCopyWithImpl(
    _$GroupProfileParticipantRemoveRequestedImpl _value,
    $Res Function(_$GroupProfileParticipantRemoveRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GroupProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null}) {
    return _then(
      _$GroupProfileParticipantRemoveRequestedImpl(
        null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$GroupProfileParticipantRemoveRequestedImpl
    implements GroupProfileParticipantRemoveRequested {
  const _$GroupProfileParticipantRemoveRequestedImpl(this.userId);

  @override
  final String userId;

  @override
  String toString() {
    return 'GroupProfileEvent.participantRemoveRequested(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupProfileParticipantRemoveRequestedImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of GroupProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupProfileParticipantRemoveRequestedImplCopyWith<
    _$GroupProfileParticipantRemoveRequestedImpl
  >
  get copyWith =>
      __$$GroupProfileParticipantRemoveRequestedImplCopyWithImpl<
        _$GroupProfileParticipantRemoveRequestedImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String userId) participantRemoveRequested,
    required TResult Function(String userId, ParticipantRole role)
    participantRoleChangeRequested,
    required TResult Function(RoomEntity room) participantsAdded,
    required TResult Function() roomUpdatedRemotely,
    required TResult Function() roomRemovedRemotely,
    required TResult Function(XFile file) avatarUploadRequested,
  }) {
    return participantRemoveRequested(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String userId)? participantRemoveRequested,
    TResult? Function(String userId, ParticipantRole role)?
    participantRoleChangeRequested,
    TResult? Function(RoomEntity room)? participantsAdded,
    TResult? Function()? roomUpdatedRemotely,
    TResult? Function()? roomRemovedRemotely,
    TResult? Function(XFile file)? avatarUploadRequested,
  }) {
    return participantRemoveRequested?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String userId)? participantRemoveRequested,
    TResult Function(String userId, ParticipantRole role)?
    participantRoleChangeRequested,
    TResult Function(RoomEntity room)? participantsAdded,
    TResult Function()? roomUpdatedRemotely,
    TResult Function()? roomRemovedRemotely,
    TResult Function(XFile file)? avatarUploadRequested,
    required TResult orElse(),
  }) {
    if (participantRemoveRequested != null) {
      return participantRemoveRequested(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GroupProfileStarted value) started,
    required TResult Function(GroupProfileParticipantRemoveRequested value)
    participantRemoveRequested,
    required TResult Function(GroupProfileParticipantRoleChangeRequested value)
    participantRoleChangeRequested,
    required TResult Function(GroupProfileParticipantsAdded value)
    participantsAdded,
    required TResult Function(GroupProfileRoomUpdatedRemotely value)
    roomUpdatedRemotely,
    required TResult Function(GroupProfileRoomRemovedRemotely value)
    roomRemovedRemotely,
    required TResult Function(GroupProfileAvatarUploadRequested value)
    avatarUploadRequested,
  }) {
    return participantRemoveRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroupProfileStarted value)? started,
    TResult? Function(GroupProfileParticipantRemoveRequested value)?
    participantRemoveRequested,
    TResult? Function(GroupProfileParticipantRoleChangeRequested value)?
    participantRoleChangeRequested,
    TResult? Function(GroupProfileParticipantsAdded value)? participantsAdded,
    TResult? Function(GroupProfileRoomUpdatedRemotely value)?
    roomUpdatedRemotely,
    TResult? Function(GroupProfileRoomRemovedRemotely value)?
    roomRemovedRemotely,
    TResult? Function(GroupProfileAvatarUploadRequested value)?
    avatarUploadRequested,
  }) {
    return participantRemoveRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroupProfileStarted value)? started,
    TResult Function(GroupProfileParticipantRemoveRequested value)?
    participantRemoveRequested,
    TResult Function(GroupProfileParticipantRoleChangeRequested value)?
    participantRoleChangeRequested,
    TResult Function(GroupProfileParticipantsAdded value)? participantsAdded,
    TResult Function(GroupProfileRoomUpdatedRemotely value)?
    roomUpdatedRemotely,
    TResult Function(GroupProfileRoomRemovedRemotely value)?
    roomRemovedRemotely,
    TResult Function(GroupProfileAvatarUploadRequested value)?
    avatarUploadRequested,
    required TResult orElse(),
  }) {
    if (participantRemoveRequested != null) {
      return participantRemoveRequested(this);
    }
    return orElse();
  }
}

abstract class GroupProfileParticipantRemoveRequested
    implements GroupProfileEvent {
  const factory GroupProfileParticipantRemoveRequested(final String userId) =
      _$GroupProfileParticipantRemoveRequestedImpl;

  String get userId;

  /// Create a copy of GroupProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupProfileParticipantRemoveRequestedImplCopyWith<
    _$GroupProfileParticipantRemoveRequestedImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GroupProfileParticipantRoleChangeRequestedImplCopyWith<$Res> {
  factory _$$GroupProfileParticipantRoleChangeRequestedImplCopyWith(
    _$GroupProfileParticipantRoleChangeRequestedImpl value,
    $Res Function(_$GroupProfileParticipantRoleChangeRequestedImpl) then,
  ) = __$$GroupProfileParticipantRoleChangeRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, ParticipantRole role});
}

/// @nodoc
class __$$GroupProfileParticipantRoleChangeRequestedImplCopyWithImpl<$Res>
    extends
        _$GroupProfileEventCopyWithImpl<
          $Res,
          _$GroupProfileParticipantRoleChangeRequestedImpl
        >
    implements _$$GroupProfileParticipantRoleChangeRequestedImplCopyWith<$Res> {
  __$$GroupProfileParticipantRoleChangeRequestedImplCopyWithImpl(
    _$GroupProfileParticipantRoleChangeRequestedImpl _value,
    $Res Function(_$GroupProfileParticipantRoleChangeRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GroupProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null, Object? role = null}) {
    return _then(
      _$GroupProfileParticipantRoleChangeRequestedImpl(
        null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as ParticipantRole,
      ),
    );
  }
}

/// @nodoc

class _$GroupProfileParticipantRoleChangeRequestedImpl
    implements GroupProfileParticipantRoleChangeRequested {
  const _$GroupProfileParticipantRoleChangeRequestedImpl(
    this.userId,
    this.role,
  );

  @override
  final String userId;
  @override
  final ParticipantRole role;

  @override
  String toString() {
    return 'GroupProfileEvent.participantRoleChangeRequested(userId: $userId, role: $role)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupProfileParticipantRoleChangeRequestedImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.role, role) || other.role == role));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, role);

  /// Create a copy of GroupProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupProfileParticipantRoleChangeRequestedImplCopyWith<
    _$GroupProfileParticipantRoleChangeRequestedImpl
  >
  get copyWith =>
      __$$GroupProfileParticipantRoleChangeRequestedImplCopyWithImpl<
        _$GroupProfileParticipantRoleChangeRequestedImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String userId) participantRemoveRequested,
    required TResult Function(String userId, ParticipantRole role)
    participantRoleChangeRequested,
    required TResult Function(RoomEntity room) participantsAdded,
    required TResult Function() roomUpdatedRemotely,
    required TResult Function() roomRemovedRemotely,
    required TResult Function(XFile file) avatarUploadRequested,
  }) {
    return participantRoleChangeRequested(userId, role);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String userId)? participantRemoveRequested,
    TResult? Function(String userId, ParticipantRole role)?
    participantRoleChangeRequested,
    TResult? Function(RoomEntity room)? participantsAdded,
    TResult? Function()? roomUpdatedRemotely,
    TResult? Function()? roomRemovedRemotely,
    TResult? Function(XFile file)? avatarUploadRequested,
  }) {
    return participantRoleChangeRequested?.call(userId, role);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String userId)? participantRemoveRequested,
    TResult Function(String userId, ParticipantRole role)?
    participantRoleChangeRequested,
    TResult Function(RoomEntity room)? participantsAdded,
    TResult Function()? roomUpdatedRemotely,
    TResult Function()? roomRemovedRemotely,
    TResult Function(XFile file)? avatarUploadRequested,
    required TResult orElse(),
  }) {
    if (participantRoleChangeRequested != null) {
      return participantRoleChangeRequested(userId, role);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GroupProfileStarted value) started,
    required TResult Function(GroupProfileParticipantRemoveRequested value)
    participantRemoveRequested,
    required TResult Function(GroupProfileParticipantRoleChangeRequested value)
    participantRoleChangeRequested,
    required TResult Function(GroupProfileParticipantsAdded value)
    participantsAdded,
    required TResult Function(GroupProfileRoomUpdatedRemotely value)
    roomUpdatedRemotely,
    required TResult Function(GroupProfileRoomRemovedRemotely value)
    roomRemovedRemotely,
    required TResult Function(GroupProfileAvatarUploadRequested value)
    avatarUploadRequested,
  }) {
    return participantRoleChangeRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroupProfileStarted value)? started,
    TResult? Function(GroupProfileParticipantRemoveRequested value)?
    participantRemoveRequested,
    TResult? Function(GroupProfileParticipantRoleChangeRequested value)?
    participantRoleChangeRequested,
    TResult? Function(GroupProfileParticipantsAdded value)? participantsAdded,
    TResult? Function(GroupProfileRoomUpdatedRemotely value)?
    roomUpdatedRemotely,
    TResult? Function(GroupProfileRoomRemovedRemotely value)?
    roomRemovedRemotely,
    TResult? Function(GroupProfileAvatarUploadRequested value)?
    avatarUploadRequested,
  }) {
    return participantRoleChangeRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroupProfileStarted value)? started,
    TResult Function(GroupProfileParticipantRemoveRequested value)?
    participantRemoveRequested,
    TResult Function(GroupProfileParticipantRoleChangeRequested value)?
    participantRoleChangeRequested,
    TResult Function(GroupProfileParticipantsAdded value)? participantsAdded,
    TResult Function(GroupProfileRoomUpdatedRemotely value)?
    roomUpdatedRemotely,
    TResult Function(GroupProfileRoomRemovedRemotely value)?
    roomRemovedRemotely,
    TResult Function(GroupProfileAvatarUploadRequested value)?
    avatarUploadRequested,
    required TResult orElse(),
  }) {
    if (participantRoleChangeRequested != null) {
      return participantRoleChangeRequested(this);
    }
    return orElse();
  }
}

abstract class GroupProfileParticipantRoleChangeRequested
    implements GroupProfileEvent {
  const factory GroupProfileParticipantRoleChangeRequested(
    final String userId,
    final ParticipantRole role,
  ) = _$GroupProfileParticipantRoleChangeRequestedImpl;

  String get userId;
  ParticipantRole get role;

  /// Create a copy of GroupProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupProfileParticipantRoleChangeRequestedImplCopyWith<
    _$GroupProfileParticipantRoleChangeRequestedImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GroupProfileParticipantsAddedImplCopyWith<$Res> {
  factory _$$GroupProfileParticipantsAddedImplCopyWith(
    _$GroupProfileParticipantsAddedImpl value,
    $Res Function(_$GroupProfileParticipantsAddedImpl) then,
  ) = __$$GroupProfileParticipantsAddedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({RoomEntity room});

  $RoomEntityCopyWith<$Res> get room;
}

/// @nodoc
class __$$GroupProfileParticipantsAddedImplCopyWithImpl<$Res>
    extends
        _$GroupProfileEventCopyWithImpl<
          $Res,
          _$GroupProfileParticipantsAddedImpl
        >
    implements _$$GroupProfileParticipantsAddedImplCopyWith<$Res> {
  __$$GroupProfileParticipantsAddedImplCopyWithImpl(
    _$GroupProfileParticipantsAddedImpl _value,
    $Res Function(_$GroupProfileParticipantsAddedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GroupProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? room = null}) {
    return _then(
      _$GroupProfileParticipantsAddedImpl(
        null == room
            ? _value.room
            : room // ignore: cast_nullable_to_non_nullable
                  as RoomEntity,
      ),
    );
  }

  /// Create a copy of GroupProfileEvent
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

class _$GroupProfileParticipantsAddedImpl
    implements GroupProfileParticipantsAdded {
  const _$GroupProfileParticipantsAddedImpl(this.room);

  @override
  final RoomEntity room;

  @override
  String toString() {
    return 'GroupProfileEvent.participantsAdded(room: $room)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupProfileParticipantsAddedImpl &&
            (identical(other.room, room) || other.room == room));
  }

  @override
  int get hashCode => Object.hash(runtimeType, room);

  /// Create a copy of GroupProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupProfileParticipantsAddedImplCopyWith<
    _$GroupProfileParticipantsAddedImpl
  >
  get copyWith =>
      __$$GroupProfileParticipantsAddedImplCopyWithImpl<
        _$GroupProfileParticipantsAddedImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String userId) participantRemoveRequested,
    required TResult Function(String userId, ParticipantRole role)
    participantRoleChangeRequested,
    required TResult Function(RoomEntity room) participantsAdded,
    required TResult Function() roomUpdatedRemotely,
    required TResult Function() roomRemovedRemotely,
    required TResult Function(XFile file) avatarUploadRequested,
  }) {
    return participantsAdded(room);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String userId)? participantRemoveRequested,
    TResult? Function(String userId, ParticipantRole role)?
    participantRoleChangeRequested,
    TResult? Function(RoomEntity room)? participantsAdded,
    TResult? Function()? roomUpdatedRemotely,
    TResult? Function()? roomRemovedRemotely,
    TResult? Function(XFile file)? avatarUploadRequested,
  }) {
    return participantsAdded?.call(room);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String userId)? participantRemoveRequested,
    TResult Function(String userId, ParticipantRole role)?
    participantRoleChangeRequested,
    TResult Function(RoomEntity room)? participantsAdded,
    TResult Function()? roomUpdatedRemotely,
    TResult Function()? roomRemovedRemotely,
    TResult Function(XFile file)? avatarUploadRequested,
    required TResult orElse(),
  }) {
    if (participantsAdded != null) {
      return participantsAdded(room);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GroupProfileStarted value) started,
    required TResult Function(GroupProfileParticipantRemoveRequested value)
    participantRemoveRequested,
    required TResult Function(GroupProfileParticipantRoleChangeRequested value)
    participantRoleChangeRequested,
    required TResult Function(GroupProfileParticipantsAdded value)
    participantsAdded,
    required TResult Function(GroupProfileRoomUpdatedRemotely value)
    roomUpdatedRemotely,
    required TResult Function(GroupProfileRoomRemovedRemotely value)
    roomRemovedRemotely,
    required TResult Function(GroupProfileAvatarUploadRequested value)
    avatarUploadRequested,
  }) {
    return participantsAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroupProfileStarted value)? started,
    TResult? Function(GroupProfileParticipantRemoveRequested value)?
    participantRemoveRequested,
    TResult? Function(GroupProfileParticipantRoleChangeRequested value)?
    participantRoleChangeRequested,
    TResult? Function(GroupProfileParticipantsAdded value)? participantsAdded,
    TResult? Function(GroupProfileRoomUpdatedRemotely value)?
    roomUpdatedRemotely,
    TResult? Function(GroupProfileRoomRemovedRemotely value)?
    roomRemovedRemotely,
    TResult? Function(GroupProfileAvatarUploadRequested value)?
    avatarUploadRequested,
  }) {
    return participantsAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroupProfileStarted value)? started,
    TResult Function(GroupProfileParticipantRemoveRequested value)?
    participantRemoveRequested,
    TResult Function(GroupProfileParticipantRoleChangeRequested value)?
    participantRoleChangeRequested,
    TResult Function(GroupProfileParticipantsAdded value)? participantsAdded,
    TResult Function(GroupProfileRoomUpdatedRemotely value)?
    roomUpdatedRemotely,
    TResult Function(GroupProfileRoomRemovedRemotely value)?
    roomRemovedRemotely,
    TResult Function(GroupProfileAvatarUploadRequested value)?
    avatarUploadRequested,
    required TResult orElse(),
  }) {
    if (participantsAdded != null) {
      return participantsAdded(this);
    }
    return orElse();
  }
}

abstract class GroupProfileParticipantsAdded implements GroupProfileEvent {
  const factory GroupProfileParticipantsAdded(final RoomEntity room) =
      _$GroupProfileParticipantsAddedImpl;

  RoomEntity get room;

  /// Create a copy of GroupProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupProfileParticipantsAddedImplCopyWith<
    _$GroupProfileParticipantsAddedImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GroupProfileRoomUpdatedRemotelyImplCopyWith<$Res> {
  factory _$$GroupProfileRoomUpdatedRemotelyImplCopyWith(
    _$GroupProfileRoomUpdatedRemotelyImpl value,
    $Res Function(_$GroupProfileRoomUpdatedRemotelyImpl) then,
  ) = __$$GroupProfileRoomUpdatedRemotelyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GroupProfileRoomUpdatedRemotelyImplCopyWithImpl<$Res>
    extends
        _$GroupProfileEventCopyWithImpl<
          $Res,
          _$GroupProfileRoomUpdatedRemotelyImpl
        >
    implements _$$GroupProfileRoomUpdatedRemotelyImplCopyWith<$Res> {
  __$$GroupProfileRoomUpdatedRemotelyImplCopyWithImpl(
    _$GroupProfileRoomUpdatedRemotelyImpl _value,
    $Res Function(_$GroupProfileRoomUpdatedRemotelyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GroupProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GroupProfileRoomUpdatedRemotelyImpl
    implements GroupProfileRoomUpdatedRemotely {
  const _$GroupProfileRoomUpdatedRemotelyImpl();

  @override
  String toString() {
    return 'GroupProfileEvent.roomUpdatedRemotely()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupProfileRoomUpdatedRemotelyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String userId) participantRemoveRequested,
    required TResult Function(String userId, ParticipantRole role)
    participantRoleChangeRequested,
    required TResult Function(RoomEntity room) participantsAdded,
    required TResult Function() roomUpdatedRemotely,
    required TResult Function() roomRemovedRemotely,
    required TResult Function(XFile file) avatarUploadRequested,
  }) {
    return roomUpdatedRemotely();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String userId)? participantRemoveRequested,
    TResult? Function(String userId, ParticipantRole role)?
    participantRoleChangeRequested,
    TResult? Function(RoomEntity room)? participantsAdded,
    TResult? Function()? roomUpdatedRemotely,
    TResult? Function()? roomRemovedRemotely,
    TResult? Function(XFile file)? avatarUploadRequested,
  }) {
    return roomUpdatedRemotely?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String userId)? participantRemoveRequested,
    TResult Function(String userId, ParticipantRole role)?
    participantRoleChangeRequested,
    TResult Function(RoomEntity room)? participantsAdded,
    TResult Function()? roomUpdatedRemotely,
    TResult Function()? roomRemovedRemotely,
    TResult Function(XFile file)? avatarUploadRequested,
    required TResult orElse(),
  }) {
    if (roomUpdatedRemotely != null) {
      return roomUpdatedRemotely();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GroupProfileStarted value) started,
    required TResult Function(GroupProfileParticipantRemoveRequested value)
    participantRemoveRequested,
    required TResult Function(GroupProfileParticipantRoleChangeRequested value)
    participantRoleChangeRequested,
    required TResult Function(GroupProfileParticipantsAdded value)
    participantsAdded,
    required TResult Function(GroupProfileRoomUpdatedRemotely value)
    roomUpdatedRemotely,
    required TResult Function(GroupProfileRoomRemovedRemotely value)
    roomRemovedRemotely,
    required TResult Function(GroupProfileAvatarUploadRequested value)
    avatarUploadRequested,
  }) {
    return roomUpdatedRemotely(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroupProfileStarted value)? started,
    TResult? Function(GroupProfileParticipantRemoveRequested value)?
    participantRemoveRequested,
    TResult? Function(GroupProfileParticipantRoleChangeRequested value)?
    participantRoleChangeRequested,
    TResult? Function(GroupProfileParticipantsAdded value)? participantsAdded,
    TResult? Function(GroupProfileRoomUpdatedRemotely value)?
    roomUpdatedRemotely,
    TResult? Function(GroupProfileRoomRemovedRemotely value)?
    roomRemovedRemotely,
    TResult? Function(GroupProfileAvatarUploadRequested value)?
    avatarUploadRequested,
  }) {
    return roomUpdatedRemotely?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroupProfileStarted value)? started,
    TResult Function(GroupProfileParticipantRemoveRequested value)?
    participantRemoveRequested,
    TResult Function(GroupProfileParticipantRoleChangeRequested value)?
    participantRoleChangeRequested,
    TResult Function(GroupProfileParticipantsAdded value)? participantsAdded,
    TResult Function(GroupProfileRoomUpdatedRemotely value)?
    roomUpdatedRemotely,
    TResult Function(GroupProfileRoomRemovedRemotely value)?
    roomRemovedRemotely,
    TResult Function(GroupProfileAvatarUploadRequested value)?
    avatarUploadRequested,
    required TResult orElse(),
  }) {
    if (roomUpdatedRemotely != null) {
      return roomUpdatedRemotely(this);
    }
    return orElse();
  }
}

abstract class GroupProfileRoomUpdatedRemotely implements GroupProfileEvent {
  const factory GroupProfileRoomUpdatedRemotely() =
      _$GroupProfileRoomUpdatedRemotelyImpl;
}

/// @nodoc
abstract class _$$GroupProfileRoomRemovedRemotelyImplCopyWith<$Res> {
  factory _$$GroupProfileRoomRemovedRemotelyImplCopyWith(
    _$GroupProfileRoomRemovedRemotelyImpl value,
    $Res Function(_$GroupProfileRoomRemovedRemotelyImpl) then,
  ) = __$$GroupProfileRoomRemovedRemotelyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GroupProfileRoomRemovedRemotelyImplCopyWithImpl<$Res>
    extends
        _$GroupProfileEventCopyWithImpl<
          $Res,
          _$GroupProfileRoomRemovedRemotelyImpl
        >
    implements _$$GroupProfileRoomRemovedRemotelyImplCopyWith<$Res> {
  __$$GroupProfileRoomRemovedRemotelyImplCopyWithImpl(
    _$GroupProfileRoomRemovedRemotelyImpl _value,
    $Res Function(_$GroupProfileRoomRemovedRemotelyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GroupProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GroupProfileRoomRemovedRemotelyImpl
    implements GroupProfileRoomRemovedRemotely {
  const _$GroupProfileRoomRemovedRemotelyImpl();

  @override
  String toString() {
    return 'GroupProfileEvent.roomRemovedRemotely()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupProfileRoomRemovedRemotelyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String userId) participantRemoveRequested,
    required TResult Function(String userId, ParticipantRole role)
    participantRoleChangeRequested,
    required TResult Function(RoomEntity room) participantsAdded,
    required TResult Function() roomUpdatedRemotely,
    required TResult Function() roomRemovedRemotely,
    required TResult Function(XFile file) avatarUploadRequested,
  }) {
    return roomRemovedRemotely();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String userId)? participantRemoveRequested,
    TResult? Function(String userId, ParticipantRole role)?
    participantRoleChangeRequested,
    TResult? Function(RoomEntity room)? participantsAdded,
    TResult? Function()? roomUpdatedRemotely,
    TResult? Function()? roomRemovedRemotely,
    TResult? Function(XFile file)? avatarUploadRequested,
  }) {
    return roomRemovedRemotely?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String userId)? participantRemoveRequested,
    TResult Function(String userId, ParticipantRole role)?
    participantRoleChangeRequested,
    TResult Function(RoomEntity room)? participantsAdded,
    TResult Function()? roomUpdatedRemotely,
    TResult Function()? roomRemovedRemotely,
    TResult Function(XFile file)? avatarUploadRequested,
    required TResult orElse(),
  }) {
    if (roomRemovedRemotely != null) {
      return roomRemovedRemotely();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GroupProfileStarted value) started,
    required TResult Function(GroupProfileParticipantRemoveRequested value)
    participantRemoveRequested,
    required TResult Function(GroupProfileParticipantRoleChangeRequested value)
    participantRoleChangeRequested,
    required TResult Function(GroupProfileParticipantsAdded value)
    participantsAdded,
    required TResult Function(GroupProfileRoomUpdatedRemotely value)
    roomUpdatedRemotely,
    required TResult Function(GroupProfileRoomRemovedRemotely value)
    roomRemovedRemotely,
    required TResult Function(GroupProfileAvatarUploadRequested value)
    avatarUploadRequested,
  }) {
    return roomRemovedRemotely(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroupProfileStarted value)? started,
    TResult? Function(GroupProfileParticipantRemoveRequested value)?
    participantRemoveRequested,
    TResult? Function(GroupProfileParticipantRoleChangeRequested value)?
    participantRoleChangeRequested,
    TResult? Function(GroupProfileParticipantsAdded value)? participantsAdded,
    TResult? Function(GroupProfileRoomUpdatedRemotely value)?
    roomUpdatedRemotely,
    TResult? Function(GroupProfileRoomRemovedRemotely value)?
    roomRemovedRemotely,
    TResult? Function(GroupProfileAvatarUploadRequested value)?
    avatarUploadRequested,
  }) {
    return roomRemovedRemotely?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroupProfileStarted value)? started,
    TResult Function(GroupProfileParticipantRemoveRequested value)?
    participantRemoveRequested,
    TResult Function(GroupProfileParticipantRoleChangeRequested value)?
    participantRoleChangeRequested,
    TResult Function(GroupProfileParticipantsAdded value)? participantsAdded,
    TResult Function(GroupProfileRoomUpdatedRemotely value)?
    roomUpdatedRemotely,
    TResult Function(GroupProfileRoomRemovedRemotely value)?
    roomRemovedRemotely,
    TResult Function(GroupProfileAvatarUploadRequested value)?
    avatarUploadRequested,
    required TResult orElse(),
  }) {
    if (roomRemovedRemotely != null) {
      return roomRemovedRemotely(this);
    }
    return orElse();
  }
}

abstract class GroupProfileRoomRemovedRemotely implements GroupProfileEvent {
  const factory GroupProfileRoomRemovedRemotely() =
      _$GroupProfileRoomRemovedRemotelyImpl;
}

/// @nodoc
abstract class _$$GroupProfileAvatarUploadRequestedImplCopyWith<$Res> {
  factory _$$GroupProfileAvatarUploadRequestedImplCopyWith(
    _$GroupProfileAvatarUploadRequestedImpl value,
    $Res Function(_$GroupProfileAvatarUploadRequestedImpl) then,
  ) = __$$GroupProfileAvatarUploadRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({XFile file});
}

/// @nodoc
class __$$GroupProfileAvatarUploadRequestedImplCopyWithImpl<$Res>
    extends
        _$GroupProfileEventCopyWithImpl<
          $Res,
          _$GroupProfileAvatarUploadRequestedImpl
        >
    implements _$$GroupProfileAvatarUploadRequestedImplCopyWith<$Res> {
  __$$GroupProfileAvatarUploadRequestedImplCopyWithImpl(
    _$GroupProfileAvatarUploadRequestedImpl _value,
    $Res Function(_$GroupProfileAvatarUploadRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GroupProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? file = null}) {
    return _then(
      _$GroupProfileAvatarUploadRequestedImpl(
        null == file
            ? _value.file
            : file // ignore: cast_nullable_to_non_nullable
                  as XFile,
      ),
    );
  }
}

/// @nodoc

class _$GroupProfileAvatarUploadRequestedImpl
    implements GroupProfileAvatarUploadRequested {
  const _$GroupProfileAvatarUploadRequestedImpl(this.file);

  @override
  final XFile file;

  @override
  String toString() {
    return 'GroupProfileEvent.avatarUploadRequested(file: $file)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GroupProfileAvatarUploadRequestedImpl &&
            (identical(other.file, file) || other.file == file));
  }

  @override
  int get hashCode => Object.hash(runtimeType, file);

  /// Create a copy of GroupProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GroupProfileAvatarUploadRequestedImplCopyWith<
    _$GroupProfileAvatarUploadRequestedImpl
  >
  get copyWith =>
      __$$GroupProfileAvatarUploadRequestedImplCopyWithImpl<
        _$GroupProfileAvatarUploadRequestedImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(String userId) participantRemoveRequested,
    required TResult Function(String userId, ParticipantRole role)
    participantRoleChangeRequested,
    required TResult Function(RoomEntity room) participantsAdded,
    required TResult Function() roomUpdatedRemotely,
    required TResult Function() roomRemovedRemotely,
    required TResult Function(XFile file) avatarUploadRequested,
  }) {
    return avatarUploadRequested(file);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String userId)? participantRemoveRequested,
    TResult? Function(String userId, ParticipantRole role)?
    participantRoleChangeRequested,
    TResult? Function(RoomEntity room)? participantsAdded,
    TResult? Function()? roomUpdatedRemotely,
    TResult? Function()? roomRemovedRemotely,
    TResult? Function(XFile file)? avatarUploadRequested,
  }) {
    return avatarUploadRequested?.call(file);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String userId)? participantRemoveRequested,
    TResult Function(String userId, ParticipantRole role)?
    participantRoleChangeRequested,
    TResult Function(RoomEntity room)? participantsAdded,
    TResult Function()? roomUpdatedRemotely,
    TResult Function()? roomRemovedRemotely,
    TResult Function(XFile file)? avatarUploadRequested,
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
    required TResult Function(GroupProfileStarted value) started,
    required TResult Function(GroupProfileParticipantRemoveRequested value)
    participantRemoveRequested,
    required TResult Function(GroupProfileParticipantRoleChangeRequested value)
    participantRoleChangeRequested,
    required TResult Function(GroupProfileParticipantsAdded value)
    participantsAdded,
    required TResult Function(GroupProfileRoomUpdatedRemotely value)
    roomUpdatedRemotely,
    required TResult Function(GroupProfileRoomRemovedRemotely value)
    roomRemovedRemotely,
    required TResult Function(GroupProfileAvatarUploadRequested value)
    avatarUploadRequested,
  }) {
    return avatarUploadRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroupProfileStarted value)? started,
    TResult? Function(GroupProfileParticipantRemoveRequested value)?
    participantRemoveRequested,
    TResult? Function(GroupProfileParticipantRoleChangeRequested value)?
    participantRoleChangeRequested,
    TResult? Function(GroupProfileParticipantsAdded value)? participantsAdded,
    TResult? Function(GroupProfileRoomUpdatedRemotely value)?
    roomUpdatedRemotely,
    TResult? Function(GroupProfileRoomRemovedRemotely value)?
    roomRemovedRemotely,
    TResult? Function(GroupProfileAvatarUploadRequested value)?
    avatarUploadRequested,
  }) {
    return avatarUploadRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroupProfileStarted value)? started,
    TResult Function(GroupProfileParticipantRemoveRequested value)?
    participantRemoveRequested,
    TResult Function(GroupProfileParticipantRoleChangeRequested value)?
    participantRoleChangeRequested,
    TResult Function(GroupProfileParticipantsAdded value)? participantsAdded,
    TResult Function(GroupProfileRoomUpdatedRemotely value)?
    roomUpdatedRemotely,
    TResult Function(GroupProfileRoomRemovedRemotely value)?
    roomRemovedRemotely,
    TResult Function(GroupProfileAvatarUploadRequested value)?
    avatarUploadRequested,
    required TResult orElse(),
  }) {
    if (avatarUploadRequested != null) {
      return avatarUploadRequested(this);
    }
    return orElse();
  }
}

abstract class GroupProfileAvatarUploadRequested implements GroupProfileEvent {
  const factory GroupProfileAvatarUploadRequested(final XFile file) =
      _$GroupProfileAvatarUploadRequestedImpl;

  XFile get file;

  /// Create a copy of GroupProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GroupProfileAvatarUploadRequestedImplCopyWith<
    _$GroupProfileAvatarUploadRequestedImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}
