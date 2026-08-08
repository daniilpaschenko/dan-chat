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
    required TResult Function(RoomEntity room) participantsAdded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String userId)? participantRemoveRequested,
    TResult? Function(RoomEntity room)? participantsAdded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String userId)? participantRemoveRequested,
    TResult Function(RoomEntity room)? participantsAdded,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GroupProfileStarted value) started,
    required TResult Function(GroupProfileParticipantRemoveRequested value)
    participantRemoveRequested,
    required TResult Function(GroupProfileParticipantsAdded value)
    participantsAdded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroupProfileStarted value)? started,
    TResult? Function(GroupProfileParticipantRemoveRequested value)?
    participantRemoveRequested,
    TResult? Function(GroupProfileParticipantsAdded value)? participantsAdded,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroupProfileStarted value)? started,
    TResult Function(GroupProfileParticipantRemoveRequested value)?
    participantRemoveRequested,
    TResult Function(GroupProfileParticipantsAdded value)? participantsAdded,
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
    required TResult Function(RoomEntity room) participantsAdded,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String userId)? participantRemoveRequested,
    TResult? Function(RoomEntity room)? participantsAdded,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String userId)? participantRemoveRequested,
    TResult Function(RoomEntity room)? participantsAdded,
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
    required TResult Function(GroupProfileParticipantsAdded value)
    participantsAdded,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroupProfileStarted value)? started,
    TResult? Function(GroupProfileParticipantRemoveRequested value)?
    participantRemoveRequested,
    TResult? Function(GroupProfileParticipantsAdded value)? participantsAdded,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroupProfileStarted value)? started,
    TResult Function(GroupProfileParticipantRemoveRequested value)?
    participantRemoveRequested,
    TResult Function(GroupProfileParticipantsAdded value)? participantsAdded,
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
    required TResult Function(RoomEntity room) participantsAdded,
  }) {
    return participantRemoveRequested(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String userId)? participantRemoveRequested,
    TResult? Function(RoomEntity room)? participantsAdded,
  }) {
    return participantRemoveRequested?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String userId)? participantRemoveRequested,
    TResult Function(RoomEntity room)? participantsAdded,
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
    required TResult Function(GroupProfileParticipantsAdded value)
    participantsAdded,
  }) {
    return participantRemoveRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroupProfileStarted value)? started,
    TResult? Function(GroupProfileParticipantRemoveRequested value)?
    participantRemoveRequested,
    TResult? Function(GroupProfileParticipantsAdded value)? participantsAdded,
  }) {
    return participantRemoveRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroupProfileStarted value)? started,
    TResult Function(GroupProfileParticipantRemoveRequested value)?
    participantRemoveRequested,
    TResult Function(GroupProfileParticipantsAdded value)? participantsAdded,
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
    required TResult Function(RoomEntity room) participantsAdded,
  }) {
    return participantsAdded(room);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(String userId)? participantRemoveRequested,
    TResult? Function(RoomEntity room)? participantsAdded,
  }) {
    return participantsAdded?.call(room);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(String userId)? participantRemoveRequested,
    TResult Function(RoomEntity room)? participantsAdded,
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
    required TResult Function(GroupProfileParticipantsAdded value)
    participantsAdded,
  }) {
    return participantsAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GroupProfileStarted value)? started,
    TResult? Function(GroupProfileParticipantRemoveRequested value)?
    participantRemoveRequested,
    TResult? Function(GroupProfileParticipantsAdded value)? participantsAdded,
  }) {
    return participantsAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GroupProfileStarted value)? started,
    TResult Function(GroupProfileParticipantRemoveRequested value)?
    participantRemoveRequested,
    TResult Function(GroupProfileParticipantsAdded value)? participantsAdded,
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
