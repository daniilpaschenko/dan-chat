// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_list_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RoomListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function() refreshRequested,
    required TResult Function(String roomId) roomOpened,
    required TResult Function(
      String userId,
      UserStatus status,
      DateTime? lastSeen,
    )
    presenceUpdated,
    required TResult Function(String roomId, String userId, String username)
    typingStarted,
    required TResult Function(String roomId, String userId) typingStopped,
    required TResult Function(
      String roomId,
      String text,
      String senderId,
      DateTime? createdAt,
    )
    messageReceived,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function()? refreshRequested,
    TResult? Function(String roomId)? roomOpened,
    TResult? Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult? Function(String roomId, String userId, String username)?
    typingStarted,
    TResult? Function(String roomId, String userId)? typingStopped,
    TResult? Function(
      String roomId,
      String text,
      String senderId,
      DateTime? createdAt,
    )?
    messageReceived,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function()? refreshRequested,
    TResult Function(String roomId)? roomOpened,
    TResult Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult Function(String roomId, String userId, String username)?
    typingStarted,
    TResult Function(String roomId, String userId)? typingStopped,
    TResult Function(
      String roomId,
      String text,
      String senderId,
      DateTime? createdAt,
    )?
    messageReceived,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadRequested value) loadRequested,
    required TResult Function(RefreshRequested value) refreshRequested,
    required TResult Function(RoomOpened value) roomOpened,
    required TResult Function(RoomListPresenceUpdated value) presenceUpdated,
    required TResult Function(RoomListTypingStarted value) typingStarted,
    required TResult Function(RoomListTypingStopped value) typingStopped,
    required TResult Function(RoomListMessageReceived value) messageReceived,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadRequested value)? loadRequested,
    TResult? Function(RefreshRequested value)? refreshRequested,
    TResult? Function(RoomOpened value)? roomOpened,
    TResult? Function(RoomListPresenceUpdated value)? presenceUpdated,
    TResult? Function(RoomListTypingStarted value)? typingStarted,
    TResult? Function(RoomListTypingStopped value)? typingStopped,
    TResult? Function(RoomListMessageReceived value)? messageReceived,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadRequested value)? loadRequested,
    TResult Function(RefreshRequested value)? refreshRequested,
    TResult Function(RoomOpened value)? roomOpened,
    TResult Function(RoomListPresenceUpdated value)? presenceUpdated,
    TResult Function(RoomListTypingStarted value)? typingStarted,
    TResult Function(RoomListTypingStopped value)? typingStopped,
    TResult Function(RoomListMessageReceived value)? messageReceived,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomListEventCopyWith<$Res> {
  factory $RoomListEventCopyWith(
    RoomListEvent value,
    $Res Function(RoomListEvent) then,
  ) = _$RoomListEventCopyWithImpl<$Res, RoomListEvent>;
}

/// @nodoc
class _$RoomListEventCopyWithImpl<$Res, $Val extends RoomListEvent>
    implements $RoomListEventCopyWith<$Res> {
  _$RoomListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoomListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadRequestedImplCopyWith<$Res> {
  factory _$$LoadRequestedImplCopyWith(
    _$LoadRequestedImpl value,
    $Res Function(_$LoadRequestedImpl) then,
  ) = __$$LoadRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadRequestedImplCopyWithImpl<$Res>
    extends _$RoomListEventCopyWithImpl<$Res, _$LoadRequestedImpl>
    implements _$$LoadRequestedImplCopyWith<$Res> {
  __$$LoadRequestedImplCopyWithImpl(
    _$LoadRequestedImpl _value,
    $Res Function(_$LoadRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RoomListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadRequestedImpl implements LoadRequested {
  const _$LoadRequestedImpl();

  @override
  String toString() {
    return 'RoomListEvent.loadRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function() refreshRequested,
    required TResult Function(String roomId) roomOpened,
    required TResult Function(
      String userId,
      UserStatus status,
      DateTime? lastSeen,
    )
    presenceUpdated,
    required TResult Function(String roomId, String userId, String username)
    typingStarted,
    required TResult Function(String roomId, String userId) typingStopped,
    required TResult Function(
      String roomId,
      String text,
      String senderId,
      DateTime? createdAt,
    )
    messageReceived,
  }) {
    return loadRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function()? refreshRequested,
    TResult? Function(String roomId)? roomOpened,
    TResult? Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult? Function(String roomId, String userId, String username)?
    typingStarted,
    TResult? Function(String roomId, String userId)? typingStopped,
    TResult? Function(
      String roomId,
      String text,
      String senderId,
      DateTime? createdAt,
    )?
    messageReceived,
  }) {
    return loadRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function()? refreshRequested,
    TResult Function(String roomId)? roomOpened,
    TResult Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult Function(String roomId, String userId, String username)?
    typingStarted,
    TResult Function(String roomId, String userId)? typingStopped,
    TResult Function(
      String roomId,
      String text,
      String senderId,
      DateTime? createdAt,
    )?
    messageReceived,
    required TResult orElse(),
  }) {
    if (loadRequested != null) {
      return loadRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadRequested value) loadRequested,
    required TResult Function(RefreshRequested value) refreshRequested,
    required TResult Function(RoomOpened value) roomOpened,
    required TResult Function(RoomListPresenceUpdated value) presenceUpdated,
    required TResult Function(RoomListTypingStarted value) typingStarted,
    required TResult Function(RoomListTypingStopped value) typingStopped,
    required TResult Function(RoomListMessageReceived value) messageReceived,
  }) {
    return loadRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadRequested value)? loadRequested,
    TResult? Function(RefreshRequested value)? refreshRequested,
    TResult? Function(RoomOpened value)? roomOpened,
    TResult? Function(RoomListPresenceUpdated value)? presenceUpdated,
    TResult? Function(RoomListTypingStarted value)? typingStarted,
    TResult? Function(RoomListTypingStopped value)? typingStopped,
    TResult? Function(RoomListMessageReceived value)? messageReceived,
  }) {
    return loadRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadRequested value)? loadRequested,
    TResult Function(RefreshRequested value)? refreshRequested,
    TResult Function(RoomOpened value)? roomOpened,
    TResult Function(RoomListPresenceUpdated value)? presenceUpdated,
    TResult Function(RoomListTypingStarted value)? typingStarted,
    TResult Function(RoomListTypingStopped value)? typingStopped,
    TResult Function(RoomListMessageReceived value)? messageReceived,
    required TResult orElse(),
  }) {
    if (loadRequested != null) {
      return loadRequested(this);
    }
    return orElse();
  }
}

abstract class LoadRequested implements RoomListEvent {
  const factory LoadRequested() = _$LoadRequestedImpl;
}

/// @nodoc
abstract class _$$RefreshRequestedImplCopyWith<$Res> {
  factory _$$RefreshRequestedImplCopyWith(
    _$RefreshRequestedImpl value,
    $Res Function(_$RefreshRequestedImpl) then,
  ) = __$$RefreshRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RefreshRequestedImplCopyWithImpl<$Res>
    extends _$RoomListEventCopyWithImpl<$Res, _$RefreshRequestedImpl>
    implements _$$RefreshRequestedImplCopyWith<$Res> {
  __$$RefreshRequestedImplCopyWithImpl(
    _$RefreshRequestedImpl _value,
    $Res Function(_$RefreshRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RoomListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RefreshRequestedImpl implements RefreshRequested {
  const _$RefreshRequestedImpl();

  @override
  String toString() {
    return 'RoomListEvent.refreshRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RefreshRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function() refreshRequested,
    required TResult Function(String roomId) roomOpened,
    required TResult Function(
      String userId,
      UserStatus status,
      DateTime? lastSeen,
    )
    presenceUpdated,
    required TResult Function(String roomId, String userId, String username)
    typingStarted,
    required TResult Function(String roomId, String userId) typingStopped,
    required TResult Function(
      String roomId,
      String text,
      String senderId,
      DateTime? createdAt,
    )
    messageReceived,
  }) {
    return refreshRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function()? refreshRequested,
    TResult? Function(String roomId)? roomOpened,
    TResult? Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult? Function(String roomId, String userId, String username)?
    typingStarted,
    TResult? Function(String roomId, String userId)? typingStopped,
    TResult? Function(
      String roomId,
      String text,
      String senderId,
      DateTime? createdAt,
    )?
    messageReceived,
  }) {
    return refreshRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function()? refreshRequested,
    TResult Function(String roomId)? roomOpened,
    TResult Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult Function(String roomId, String userId, String username)?
    typingStarted,
    TResult Function(String roomId, String userId)? typingStopped,
    TResult Function(
      String roomId,
      String text,
      String senderId,
      DateTime? createdAt,
    )?
    messageReceived,
    required TResult orElse(),
  }) {
    if (refreshRequested != null) {
      return refreshRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadRequested value) loadRequested,
    required TResult Function(RefreshRequested value) refreshRequested,
    required TResult Function(RoomOpened value) roomOpened,
    required TResult Function(RoomListPresenceUpdated value) presenceUpdated,
    required TResult Function(RoomListTypingStarted value) typingStarted,
    required TResult Function(RoomListTypingStopped value) typingStopped,
    required TResult Function(RoomListMessageReceived value) messageReceived,
  }) {
    return refreshRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadRequested value)? loadRequested,
    TResult? Function(RefreshRequested value)? refreshRequested,
    TResult? Function(RoomOpened value)? roomOpened,
    TResult? Function(RoomListPresenceUpdated value)? presenceUpdated,
    TResult? Function(RoomListTypingStarted value)? typingStarted,
    TResult? Function(RoomListTypingStopped value)? typingStopped,
    TResult? Function(RoomListMessageReceived value)? messageReceived,
  }) {
    return refreshRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadRequested value)? loadRequested,
    TResult Function(RefreshRequested value)? refreshRequested,
    TResult Function(RoomOpened value)? roomOpened,
    TResult Function(RoomListPresenceUpdated value)? presenceUpdated,
    TResult Function(RoomListTypingStarted value)? typingStarted,
    TResult Function(RoomListTypingStopped value)? typingStopped,
    TResult Function(RoomListMessageReceived value)? messageReceived,
    required TResult orElse(),
  }) {
    if (refreshRequested != null) {
      return refreshRequested(this);
    }
    return orElse();
  }
}

abstract class RefreshRequested implements RoomListEvent {
  const factory RefreshRequested() = _$RefreshRequestedImpl;
}

/// @nodoc
abstract class _$$RoomOpenedImplCopyWith<$Res> {
  factory _$$RoomOpenedImplCopyWith(
    _$RoomOpenedImpl value,
    $Res Function(_$RoomOpenedImpl) then,
  ) = __$$RoomOpenedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String roomId});
}

/// @nodoc
class __$$RoomOpenedImplCopyWithImpl<$Res>
    extends _$RoomListEventCopyWithImpl<$Res, _$RoomOpenedImpl>
    implements _$$RoomOpenedImplCopyWith<$Res> {
  __$$RoomOpenedImplCopyWithImpl(
    _$RoomOpenedImpl _value,
    $Res Function(_$RoomOpenedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RoomListEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? roomId = null}) {
    return _then(
      _$RoomOpenedImpl(
        null == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$RoomOpenedImpl implements RoomOpened {
  const _$RoomOpenedImpl(this.roomId);

  @override
  final String roomId;

  @override
  String toString() {
    return 'RoomListEvent.roomOpened(roomId: $roomId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomOpenedImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roomId);

  /// Create a copy of RoomListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomOpenedImplCopyWith<_$RoomOpenedImpl> get copyWith =>
      __$$RoomOpenedImplCopyWithImpl<_$RoomOpenedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function() refreshRequested,
    required TResult Function(String roomId) roomOpened,
    required TResult Function(
      String userId,
      UserStatus status,
      DateTime? lastSeen,
    )
    presenceUpdated,
    required TResult Function(String roomId, String userId, String username)
    typingStarted,
    required TResult Function(String roomId, String userId) typingStopped,
    required TResult Function(
      String roomId,
      String text,
      String senderId,
      DateTime? createdAt,
    )
    messageReceived,
  }) {
    return roomOpened(roomId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function()? refreshRequested,
    TResult? Function(String roomId)? roomOpened,
    TResult? Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult? Function(String roomId, String userId, String username)?
    typingStarted,
    TResult? Function(String roomId, String userId)? typingStopped,
    TResult? Function(
      String roomId,
      String text,
      String senderId,
      DateTime? createdAt,
    )?
    messageReceived,
  }) {
    return roomOpened?.call(roomId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function()? refreshRequested,
    TResult Function(String roomId)? roomOpened,
    TResult Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult Function(String roomId, String userId, String username)?
    typingStarted,
    TResult Function(String roomId, String userId)? typingStopped,
    TResult Function(
      String roomId,
      String text,
      String senderId,
      DateTime? createdAt,
    )?
    messageReceived,
    required TResult orElse(),
  }) {
    if (roomOpened != null) {
      return roomOpened(roomId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadRequested value) loadRequested,
    required TResult Function(RefreshRequested value) refreshRequested,
    required TResult Function(RoomOpened value) roomOpened,
    required TResult Function(RoomListPresenceUpdated value) presenceUpdated,
    required TResult Function(RoomListTypingStarted value) typingStarted,
    required TResult Function(RoomListTypingStopped value) typingStopped,
    required TResult Function(RoomListMessageReceived value) messageReceived,
  }) {
    return roomOpened(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadRequested value)? loadRequested,
    TResult? Function(RefreshRequested value)? refreshRequested,
    TResult? Function(RoomOpened value)? roomOpened,
    TResult? Function(RoomListPresenceUpdated value)? presenceUpdated,
    TResult? Function(RoomListTypingStarted value)? typingStarted,
    TResult? Function(RoomListTypingStopped value)? typingStopped,
    TResult? Function(RoomListMessageReceived value)? messageReceived,
  }) {
    return roomOpened?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadRequested value)? loadRequested,
    TResult Function(RefreshRequested value)? refreshRequested,
    TResult Function(RoomOpened value)? roomOpened,
    TResult Function(RoomListPresenceUpdated value)? presenceUpdated,
    TResult Function(RoomListTypingStarted value)? typingStarted,
    TResult Function(RoomListTypingStopped value)? typingStopped,
    TResult Function(RoomListMessageReceived value)? messageReceived,
    required TResult orElse(),
  }) {
    if (roomOpened != null) {
      return roomOpened(this);
    }
    return orElse();
  }
}

abstract class RoomOpened implements RoomListEvent {
  const factory RoomOpened(final String roomId) = _$RoomOpenedImpl;

  String get roomId;

  /// Create a copy of RoomListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoomOpenedImplCopyWith<_$RoomOpenedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RoomListPresenceUpdatedImplCopyWith<$Res> {
  factory _$$RoomListPresenceUpdatedImplCopyWith(
    _$RoomListPresenceUpdatedImpl value,
    $Res Function(_$RoomListPresenceUpdatedImpl) then,
  ) = __$$RoomListPresenceUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, UserStatus status, DateTime? lastSeen});
}

/// @nodoc
class __$$RoomListPresenceUpdatedImplCopyWithImpl<$Res>
    extends _$RoomListEventCopyWithImpl<$Res, _$RoomListPresenceUpdatedImpl>
    implements _$$RoomListPresenceUpdatedImplCopyWith<$Res> {
  __$$RoomListPresenceUpdatedImplCopyWithImpl(
    _$RoomListPresenceUpdatedImpl _value,
    $Res Function(_$RoomListPresenceUpdatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RoomListEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? status = null,
    Object? lastSeen = freezed,
  }) {
    return _then(
      _$RoomListPresenceUpdatedImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as UserStatus,
        lastSeen: freezed == lastSeen
            ? _value.lastSeen
            : lastSeen // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$RoomListPresenceUpdatedImpl implements RoomListPresenceUpdated {
  const _$RoomListPresenceUpdatedImpl({
    required this.userId,
    required this.status,
    this.lastSeen,
  });

  @override
  final String userId;
  @override
  final UserStatus status;
  @override
  final DateTime? lastSeen;

  @override
  String toString() {
    return 'RoomListEvent.presenceUpdated(userId: $userId, status: $status, lastSeen: $lastSeen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomListPresenceUpdatedImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, status, lastSeen);

  /// Create a copy of RoomListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomListPresenceUpdatedImplCopyWith<_$RoomListPresenceUpdatedImpl>
  get copyWith =>
      __$$RoomListPresenceUpdatedImplCopyWithImpl<
        _$RoomListPresenceUpdatedImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function() refreshRequested,
    required TResult Function(String roomId) roomOpened,
    required TResult Function(
      String userId,
      UserStatus status,
      DateTime? lastSeen,
    )
    presenceUpdated,
    required TResult Function(String roomId, String userId, String username)
    typingStarted,
    required TResult Function(String roomId, String userId) typingStopped,
    required TResult Function(
      String roomId,
      String text,
      String senderId,
      DateTime? createdAt,
    )
    messageReceived,
  }) {
    return presenceUpdated(userId, status, lastSeen);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function()? refreshRequested,
    TResult? Function(String roomId)? roomOpened,
    TResult? Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult? Function(String roomId, String userId, String username)?
    typingStarted,
    TResult? Function(String roomId, String userId)? typingStopped,
    TResult? Function(
      String roomId,
      String text,
      String senderId,
      DateTime? createdAt,
    )?
    messageReceived,
  }) {
    return presenceUpdated?.call(userId, status, lastSeen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function()? refreshRequested,
    TResult Function(String roomId)? roomOpened,
    TResult Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult Function(String roomId, String userId, String username)?
    typingStarted,
    TResult Function(String roomId, String userId)? typingStopped,
    TResult Function(
      String roomId,
      String text,
      String senderId,
      DateTime? createdAt,
    )?
    messageReceived,
    required TResult orElse(),
  }) {
    if (presenceUpdated != null) {
      return presenceUpdated(userId, status, lastSeen);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadRequested value) loadRequested,
    required TResult Function(RefreshRequested value) refreshRequested,
    required TResult Function(RoomOpened value) roomOpened,
    required TResult Function(RoomListPresenceUpdated value) presenceUpdated,
    required TResult Function(RoomListTypingStarted value) typingStarted,
    required TResult Function(RoomListTypingStopped value) typingStopped,
    required TResult Function(RoomListMessageReceived value) messageReceived,
  }) {
    return presenceUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadRequested value)? loadRequested,
    TResult? Function(RefreshRequested value)? refreshRequested,
    TResult? Function(RoomOpened value)? roomOpened,
    TResult? Function(RoomListPresenceUpdated value)? presenceUpdated,
    TResult? Function(RoomListTypingStarted value)? typingStarted,
    TResult? Function(RoomListTypingStopped value)? typingStopped,
    TResult? Function(RoomListMessageReceived value)? messageReceived,
  }) {
    return presenceUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadRequested value)? loadRequested,
    TResult Function(RefreshRequested value)? refreshRequested,
    TResult Function(RoomOpened value)? roomOpened,
    TResult Function(RoomListPresenceUpdated value)? presenceUpdated,
    TResult Function(RoomListTypingStarted value)? typingStarted,
    TResult Function(RoomListTypingStopped value)? typingStopped,
    TResult Function(RoomListMessageReceived value)? messageReceived,
    required TResult orElse(),
  }) {
    if (presenceUpdated != null) {
      return presenceUpdated(this);
    }
    return orElse();
  }
}

abstract class RoomListPresenceUpdated implements RoomListEvent {
  const factory RoomListPresenceUpdated({
    required final String userId,
    required final UserStatus status,
    final DateTime? lastSeen,
  }) = _$RoomListPresenceUpdatedImpl;

  String get userId;
  UserStatus get status;
  DateTime? get lastSeen;

  /// Create a copy of RoomListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoomListPresenceUpdatedImplCopyWith<_$RoomListPresenceUpdatedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RoomListTypingStartedImplCopyWith<$Res> {
  factory _$$RoomListTypingStartedImplCopyWith(
    _$RoomListTypingStartedImpl value,
    $Res Function(_$RoomListTypingStartedImpl) then,
  ) = __$$RoomListTypingStartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String roomId, String userId, String username});
}

/// @nodoc
class __$$RoomListTypingStartedImplCopyWithImpl<$Res>
    extends _$RoomListEventCopyWithImpl<$Res, _$RoomListTypingStartedImpl>
    implements _$$RoomListTypingStartedImplCopyWith<$Res> {
  __$$RoomListTypingStartedImplCopyWithImpl(
    _$RoomListTypingStartedImpl _value,
    $Res Function(_$RoomListTypingStartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RoomListEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? userId = null,
    Object? username = null,
  }) {
    return _then(
      _$RoomListTypingStartedImpl(
        roomId: null == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$RoomListTypingStartedImpl implements RoomListTypingStarted {
  const _$RoomListTypingStartedImpl({
    required this.roomId,
    required this.userId,
    required this.username,
  });

  @override
  final String roomId;
  @override
  final String userId;
  @override
  final String username;

  @override
  String toString() {
    return 'RoomListEvent.typingStarted(roomId: $roomId, userId: $userId, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomListTypingStartedImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roomId, userId, username);

  /// Create a copy of RoomListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomListTypingStartedImplCopyWith<_$RoomListTypingStartedImpl>
  get copyWith =>
      __$$RoomListTypingStartedImplCopyWithImpl<_$RoomListTypingStartedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function() refreshRequested,
    required TResult Function(String roomId) roomOpened,
    required TResult Function(
      String userId,
      UserStatus status,
      DateTime? lastSeen,
    )
    presenceUpdated,
    required TResult Function(String roomId, String userId, String username)
    typingStarted,
    required TResult Function(String roomId, String userId) typingStopped,
    required TResult Function(
      String roomId,
      String text,
      String senderId,
      DateTime? createdAt,
    )
    messageReceived,
  }) {
    return typingStarted(roomId, userId, username);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function()? refreshRequested,
    TResult? Function(String roomId)? roomOpened,
    TResult? Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult? Function(String roomId, String userId, String username)?
    typingStarted,
    TResult? Function(String roomId, String userId)? typingStopped,
    TResult? Function(
      String roomId,
      String text,
      String senderId,
      DateTime? createdAt,
    )?
    messageReceived,
  }) {
    return typingStarted?.call(roomId, userId, username);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function()? refreshRequested,
    TResult Function(String roomId)? roomOpened,
    TResult Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult Function(String roomId, String userId, String username)?
    typingStarted,
    TResult Function(String roomId, String userId)? typingStopped,
    TResult Function(
      String roomId,
      String text,
      String senderId,
      DateTime? createdAt,
    )?
    messageReceived,
    required TResult orElse(),
  }) {
    if (typingStarted != null) {
      return typingStarted(roomId, userId, username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadRequested value) loadRequested,
    required TResult Function(RefreshRequested value) refreshRequested,
    required TResult Function(RoomOpened value) roomOpened,
    required TResult Function(RoomListPresenceUpdated value) presenceUpdated,
    required TResult Function(RoomListTypingStarted value) typingStarted,
    required TResult Function(RoomListTypingStopped value) typingStopped,
    required TResult Function(RoomListMessageReceived value) messageReceived,
  }) {
    return typingStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadRequested value)? loadRequested,
    TResult? Function(RefreshRequested value)? refreshRequested,
    TResult? Function(RoomOpened value)? roomOpened,
    TResult? Function(RoomListPresenceUpdated value)? presenceUpdated,
    TResult? Function(RoomListTypingStarted value)? typingStarted,
    TResult? Function(RoomListTypingStopped value)? typingStopped,
    TResult? Function(RoomListMessageReceived value)? messageReceived,
  }) {
    return typingStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadRequested value)? loadRequested,
    TResult Function(RefreshRequested value)? refreshRequested,
    TResult Function(RoomOpened value)? roomOpened,
    TResult Function(RoomListPresenceUpdated value)? presenceUpdated,
    TResult Function(RoomListTypingStarted value)? typingStarted,
    TResult Function(RoomListTypingStopped value)? typingStopped,
    TResult Function(RoomListMessageReceived value)? messageReceived,
    required TResult orElse(),
  }) {
    if (typingStarted != null) {
      return typingStarted(this);
    }
    return orElse();
  }
}

abstract class RoomListTypingStarted implements RoomListEvent {
  const factory RoomListTypingStarted({
    required final String roomId,
    required final String userId,
    required final String username,
  }) = _$RoomListTypingStartedImpl;

  String get roomId;
  String get userId;
  String get username;

  /// Create a copy of RoomListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoomListTypingStartedImplCopyWith<_$RoomListTypingStartedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RoomListTypingStoppedImplCopyWith<$Res> {
  factory _$$RoomListTypingStoppedImplCopyWith(
    _$RoomListTypingStoppedImpl value,
    $Res Function(_$RoomListTypingStoppedImpl) then,
  ) = __$$RoomListTypingStoppedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String roomId, String userId});
}

/// @nodoc
class __$$RoomListTypingStoppedImplCopyWithImpl<$Res>
    extends _$RoomListEventCopyWithImpl<$Res, _$RoomListTypingStoppedImpl>
    implements _$$RoomListTypingStoppedImplCopyWith<$Res> {
  __$$RoomListTypingStoppedImplCopyWithImpl(
    _$RoomListTypingStoppedImpl _value,
    $Res Function(_$RoomListTypingStoppedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RoomListEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? roomId = null, Object? userId = null}) {
    return _then(
      _$RoomListTypingStoppedImpl(
        roomId: null == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as String,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$RoomListTypingStoppedImpl implements RoomListTypingStopped {
  const _$RoomListTypingStoppedImpl({
    required this.roomId,
    required this.userId,
  });

  @override
  final String roomId;
  @override
  final String userId;

  @override
  String toString() {
    return 'RoomListEvent.typingStopped(roomId: $roomId, userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomListTypingStoppedImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roomId, userId);

  /// Create a copy of RoomListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomListTypingStoppedImplCopyWith<_$RoomListTypingStoppedImpl>
  get copyWith =>
      __$$RoomListTypingStoppedImplCopyWithImpl<_$RoomListTypingStoppedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function() refreshRequested,
    required TResult Function(String roomId) roomOpened,
    required TResult Function(
      String userId,
      UserStatus status,
      DateTime? lastSeen,
    )
    presenceUpdated,
    required TResult Function(String roomId, String userId, String username)
    typingStarted,
    required TResult Function(String roomId, String userId) typingStopped,
    required TResult Function(
      String roomId,
      String text,
      String senderId,
      DateTime? createdAt,
    )
    messageReceived,
  }) {
    return typingStopped(roomId, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function()? refreshRequested,
    TResult? Function(String roomId)? roomOpened,
    TResult? Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult? Function(String roomId, String userId, String username)?
    typingStarted,
    TResult? Function(String roomId, String userId)? typingStopped,
    TResult? Function(
      String roomId,
      String text,
      String senderId,
      DateTime? createdAt,
    )?
    messageReceived,
  }) {
    return typingStopped?.call(roomId, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function()? refreshRequested,
    TResult Function(String roomId)? roomOpened,
    TResult Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult Function(String roomId, String userId, String username)?
    typingStarted,
    TResult Function(String roomId, String userId)? typingStopped,
    TResult Function(
      String roomId,
      String text,
      String senderId,
      DateTime? createdAt,
    )?
    messageReceived,
    required TResult orElse(),
  }) {
    if (typingStopped != null) {
      return typingStopped(roomId, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadRequested value) loadRequested,
    required TResult Function(RefreshRequested value) refreshRequested,
    required TResult Function(RoomOpened value) roomOpened,
    required TResult Function(RoomListPresenceUpdated value) presenceUpdated,
    required TResult Function(RoomListTypingStarted value) typingStarted,
    required TResult Function(RoomListTypingStopped value) typingStopped,
    required TResult Function(RoomListMessageReceived value) messageReceived,
  }) {
    return typingStopped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadRequested value)? loadRequested,
    TResult? Function(RefreshRequested value)? refreshRequested,
    TResult? Function(RoomOpened value)? roomOpened,
    TResult? Function(RoomListPresenceUpdated value)? presenceUpdated,
    TResult? Function(RoomListTypingStarted value)? typingStarted,
    TResult? Function(RoomListTypingStopped value)? typingStopped,
    TResult? Function(RoomListMessageReceived value)? messageReceived,
  }) {
    return typingStopped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadRequested value)? loadRequested,
    TResult Function(RefreshRequested value)? refreshRequested,
    TResult Function(RoomOpened value)? roomOpened,
    TResult Function(RoomListPresenceUpdated value)? presenceUpdated,
    TResult Function(RoomListTypingStarted value)? typingStarted,
    TResult Function(RoomListTypingStopped value)? typingStopped,
    TResult Function(RoomListMessageReceived value)? messageReceived,
    required TResult orElse(),
  }) {
    if (typingStopped != null) {
      return typingStopped(this);
    }
    return orElse();
  }
}

abstract class RoomListTypingStopped implements RoomListEvent {
  const factory RoomListTypingStopped({
    required final String roomId,
    required final String userId,
  }) = _$RoomListTypingStoppedImpl;

  String get roomId;
  String get userId;

  /// Create a copy of RoomListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoomListTypingStoppedImplCopyWith<_$RoomListTypingStoppedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RoomListMessageReceivedImplCopyWith<$Res> {
  factory _$$RoomListMessageReceivedImplCopyWith(
    _$RoomListMessageReceivedImpl value,
    $Res Function(_$RoomListMessageReceivedImpl) then,
  ) = __$$RoomListMessageReceivedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String roomId, String text, String senderId, DateTime? createdAt});
}

/// @nodoc
class __$$RoomListMessageReceivedImplCopyWithImpl<$Res>
    extends _$RoomListEventCopyWithImpl<$Res, _$RoomListMessageReceivedImpl>
    implements _$$RoomListMessageReceivedImplCopyWith<$Res> {
  __$$RoomListMessageReceivedImplCopyWithImpl(
    _$RoomListMessageReceivedImpl _value,
    $Res Function(_$RoomListMessageReceivedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RoomListEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? text = null,
    Object? senderId = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$RoomListMessageReceivedImpl(
        roomId: null == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as String,
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        senderId: null == senderId
            ? _value.senderId
            : senderId // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$RoomListMessageReceivedImpl implements RoomListMessageReceived {
  const _$RoomListMessageReceivedImpl({
    required this.roomId,
    required this.text,
    required this.senderId,
    this.createdAt,
  });

  @override
  final String roomId;
  @override
  final String text;
  @override
  final String senderId;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'RoomListEvent.messageReceived(roomId: $roomId, text: $text, senderId: $senderId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomListMessageReceivedImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, roomId, text, senderId, createdAt);

  /// Create a copy of RoomListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomListMessageReceivedImplCopyWith<_$RoomListMessageReceivedImpl>
  get copyWith =>
      __$$RoomListMessageReceivedImplCopyWithImpl<
        _$RoomListMessageReceivedImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadRequested,
    required TResult Function() refreshRequested,
    required TResult Function(String roomId) roomOpened,
    required TResult Function(
      String userId,
      UserStatus status,
      DateTime? lastSeen,
    )
    presenceUpdated,
    required TResult Function(String roomId, String userId, String username)
    typingStarted,
    required TResult Function(String roomId, String userId) typingStopped,
    required TResult Function(
      String roomId,
      String text,
      String senderId,
      DateTime? createdAt,
    )
    messageReceived,
  }) {
    return messageReceived(roomId, text, senderId, createdAt);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function()? refreshRequested,
    TResult? Function(String roomId)? roomOpened,
    TResult? Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult? Function(String roomId, String userId, String username)?
    typingStarted,
    TResult? Function(String roomId, String userId)? typingStopped,
    TResult? Function(
      String roomId,
      String text,
      String senderId,
      DateTime? createdAt,
    )?
    messageReceived,
  }) {
    return messageReceived?.call(roomId, text, senderId, createdAt);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function()? refreshRequested,
    TResult Function(String roomId)? roomOpened,
    TResult Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult Function(String roomId, String userId, String username)?
    typingStarted,
    TResult Function(String roomId, String userId)? typingStopped,
    TResult Function(
      String roomId,
      String text,
      String senderId,
      DateTime? createdAt,
    )?
    messageReceived,
    required TResult orElse(),
  }) {
    if (messageReceived != null) {
      return messageReceived(roomId, text, senderId, createdAt);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadRequested value) loadRequested,
    required TResult Function(RefreshRequested value) refreshRequested,
    required TResult Function(RoomOpened value) roomOpened,
    required TResult Function(RoomListPresenceUpdated value) presenceUpdated,
    required TResult Function(RoomListTypingStarted value) typingStarted,
    required TResult Function(RoomListTypingStopped value) typingStopped,
    required TResult Function(RoomListMessageReceived value) messageReceived,
  }) {
    return messageReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadRequested value)? loadRequested,
    TResult? Function(RefreshRequested value)? refreshRequested,
    TResult? Function(RoomOpened value)? roomOpened,
    TResult? Function(RoomListPresenceUpdated value)? presenceUpdated,
    TResult? Function(RoomListTypingStarted value)? typingStarted,
    TResult? Function(RoomListTypingStopped value)? typingStopped,
    TResult? Function(RoomListMessageReceived value)? messageReceived,
  }) {
    return messageReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadRequested value)? loadRequested,
    TResult Function(RefreshRequested value)? refreshRequested,
    TResult Function(RoomOpened value)? roomOpened,
    TResult Function(RoomListPresenceUpdated value)? presenceUpdated,
    TResult Function(RoomListTypingStarted value)? typingStarted,
    TResult Function(RoomListTypingStopped value)? typingStopped,
    TResult Function(RoomListMessageReceived value)? messageReceived,
    required TResult orElse(),
  }) {
    if (messageReceived != null) {
      return messageReceived(this);
    }
    return orElse();
  }
}

abstract class RoomListMessageReceived implements RoomListEvent {
  const factory RoomListMessageReceived({
    required final String roomId,
    required final String text,
    required final String senderId,
    final DateTime? createdAt,
  }) = _$RoomListMessageReceivedImpl;

  String get roomId;
  String get text;
  String get senderId;
  DateTime? get createdAt;

  /// Create a copy of RoomListEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoomListMessageReceivedImplCopyWith<_$RoomListMessageReceivedImpl>
  get copyWith => throw _privateConstructorUsedError;
}
