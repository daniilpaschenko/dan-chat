// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ChatRoomEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, RoomListItemEntity? room) started,
    required TResult Function() loadMoreRequested,
    required TResult Function(String text) sendMessageRequested,
    required TResult Function() deleteRoomRequested,
    required TResult Function() leaveRoomRequested,
    required TResult Function(MessageEntity message) socketMessageReceived,
    required TResult Function(String userId) socketMessageRead,
    required TResult Function(String tempId, Map<String, dynamic> ack)
    socketAckReceived,
    required TResult Function(String userId, String username) typingStarted,
    required TResult Function(String userId) typingStopped,
    required TResult Function(
      String userId,
      UserStatus status,
      DateTime? lastSeen,
    )
    presenceUpdated,
    required TResult Function(String text) typingTextChanged,
    required TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )
    participantsStatusSnapshotReceived,
    required TResult Function() roomRemovedRemotely,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, RoomListItemEntity? room)? started,
    TResult? Function()? loadMoreRequested,
    TResult? Function(String text)? sendMessageRequested,
    TResult? Function()? deleteRoomRequested,
    TResult? Function()? leaveRoomRequested,
    TResult? Function(MessageEntity message)? socketMessageReceived,
    TResult? Function(String userId)? socketMessageRead,
    TResult? Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult? Function(String userId, String username)? typingStarted,
    TResult? Function(String userId)? typingStopped,
    TResult? Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult? Function(String text)? typingTextChanged,
    TResult? Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult? Function()? roomRemovedRemotely,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, RoomListItemEntity? room)? started,
    TResult Function()? loadMoreRequested,
    TResult Function(String text)? sendMessageRequested,
    TResult Function()? deleteRoomRequested,
    TResult Function()? leaveRoomRequested,
    TResult Function(MessageEntity message)? socketMessageReceived,
    TResult Function(String userId)? socketMessageRead,
    TResult Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult Function(String userId, String username)? typingStarted,
    TResult Function(String userId)? typingStopped,
    TResult Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult Function(String text)? typingTextChanged,
    TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult Function()? roomRemovedRemotely,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatRoomStarted value) started,
    required TResult Function(LoadMoreRequested value) loadMoreRequested,
    required TResult Function(SendMessageRequested value) sendMessageRequested,
    required TResult Function(DeleteRoomRequested value) deleteRoomRequested,
    required TResult Function(LeaveRoomRequested value) leaveRoomRequested,
    required TResult Function(SocketMessageReceived value)
    socketMessageReceived,
    required TResult Function(SocketMessageRead value) socketMessageRead,
    required TResult Function(SocketAckReceived value) socketAckReceived,
    required TResult Function(TypingStarted value) typingStarted,
    required TResult Function(TypingStopped value) typingStopped,
    required TResult Function(ChatRoomPresenceUpdated value) presenceUpdated,
    required TResult Function(TypingTextChanged value) typingTextChanged,
    required TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)
    participantsStatusSnapshotReceived,
    required TResult Function(ChatRoomRoomRemovedRemotely value)
    roomRemovedRemotely,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatRoomStarted value)? started,
    TResult? Function(LoadMoreRequested value)? loadMoreRequested,
    TResult? Function(SendMessageRequested value)? sendMessageRequested,
    TResult? Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult? Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult? Function(SocketMessageReceived value)? socketMessageReceived,
    TResult? Function(SocketMessageRead value)? socketMessageRead,
    TResult? Function(SocketAckReceived value)? socketAckReceived,
    TResult? Function(TypingStarted value)? typingStarted,
    TResult? Function(TypingStopped value)? typingStopped,
    TResult? Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult? Function(TypingTextChanged value)? typingTextChanged,
    TResult? Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult? Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomStarted value)? started,
    TResult Function(LoadMoreRequested value)? loadMoreRequested,
    TResult Function(SendMessageRequested value)? sendMessageRequested,
    TResult Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult Function(SocketMessageReceived value)? socketMessageReceived,
    TResult Function(SocketMessageRead value)? socketMessageRead,
    TResult Function(SocketAckReceived value)? socketAckReceived,
    TResult Function(TypingStarted value)? typingStarted,
    TResult Function(TypingStopped value)? typingStopped,
    TResult Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult Function(TypingTextChanged value)? typingTextChanged,
    TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomEventCopyWith<$Res> {
  factory $ChatRoomEventCopyWith(
    ChatRoomEvent value,
    $Res Function(ChatRoomEvent) then,
  ) = _$ChatRoomEventCopyWithImpl<$Res, ChatRoomEvent>;
}

/// @nodoc
class _$ChatRoomEventCopyWithImpl<$Res, $Val extends ChatRoomEvent>
    implements $ChatRoomEventCopyWith<$Res> {
  _$ChatRoomEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ChatRoomStartedImplCopyWith<$Res> {
  factory _$$ChatRoomStartedImplCopyWith(
    _$ChatRoomStartedImpl value,
    $Res Function(_$ChatRoomStartedImpl) then,
  ) = __$$ChatRoomStartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String roomId, RoomListItemEntity? room});

  $RoomListItemEntityCopyWith<$Res>? get room;
}

/// @nodoc
class __$$ChatRoomStartedImplCopyWithImpl<$Res>
    extends _$ChatRoomEventCopyWithImpl<$Res, _$ChatRoomStartedImpl>
    implements _$$ChatRoomStartedImplCopyWith<$Res> {
  __$$ChatRoomStartedImplCopyWithImpl(
    _$ChatRoomStartedImpl _value,
    $Res Function(_$ChatRoomStartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? roomId = null, Object? room = freezed}) {
    return _then(
      _$ChatRoomStartedImpl(
        null == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as String,
        room: freezed == room
            ? _value.room
            : room // ignore: cast_nullable_to_non_nullable
                  as RoomListItemEntity?,
      ),
    );
  }

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RoomListItemEntityCopyWith<$Res>? get room {
    if (_value.room == null) {
      return null;
    }

    return $RoomListItemEntityCopyWith<$Res>(_value.room!, (value) {
      return _then(_value.copyWith(room: value));
    });
  }
}

/// @nodoc

class _$ChatRoomStartedImpl implements ChatRoomStarted {
  const _$ChatRoomStartedImpl(this.roomId, {this.room});

  @override
  final String roomId;
  @override
  final RoomListItemEntity? room;

  @override
  String toString() {
    return 'ChatRoomEvent.started(roomId: $roomId, room: $room)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomStartedImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            (identical(other.room, room) || other.room == room));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roomId, room);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomStartedImplCopyWith<_$ChatRoomStartedImpl> get copyWith =>
      __$$ChatRoomStartedImplCopyWithImpl<_$ChatRoomStartedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, RoomListItemEntity? room) started,
    required TResult Function() loadMoreRequested,
    required TResult Function(String text) sendMessageRequested,
    required TResult Function() deleteRoomRequested,
    required TResult Function() leaveRoomRequested,
    required TResult Function(MessageEntity message) socketMessageReceived,
    required TResult Function(String userId) socketMessageRead,
    required TResult Function(String tempId, Map<String, dynamic> ack)
    socketAckReceived,
    required TResult Function(String userId, String username) typingStarted,
    required TResult Function(String userId) typingStopped,
    required TResult Function(
      String userId,
      UserStatus status,
      DateTime? lastSeen,
    )
    presenceUpdated,
    required TResult Function(String text) typingTextChanged,
    required TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )
    participantsStatusSnapshotReceived,
    required TResult Function() roomRemovedRemotely,
  }) {
    return started(roomId, room);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, RoomListItemEntity? room)? started,
    TResult? Function()? loadMoreRequested,
    TResult? Function(String text)? sendMessageRequested,
    TResult? Function()? deleteRoomRequested,
    TResult? Function()? leaveRoomRequested,
    TResult? Function(MessageEntity message)? socketMessageReceived,
    TResult? Function(String userId)? socketMessageRead,
    TResult? Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult? Function(String userId, String username)? typingStarted,
    TResult? Function(String userId)? typingStopped,
    TResult? Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult? Function(String text)? typingTextChanged,
    TResult? Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult? Function()? roomRemovedRemotely,
  }) {
    return started?.call(roomId, room);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, RoomListItemEntity? room)? started,
    TResult Function()? loadMoreRequested,
    TResult Function(String text)? sendMessageRequested,
    TResult Function()? deleteRoomRequested,
    TResult Function()? leaveRoomRequested,
    TResult Function(MessageEntity message)? socketMessageReceived,
    TResult Function(String userId)? socketMessageRead,
    TResult Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult Function(String userId, String username)? typingStarted,
    TResult Function(String userId)? typingStopped,
    TResult Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult Function(String text)? typingTextChanged,
    TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult Function()? roomRemovedRemotely,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(roomId, room);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatRoomStarted value) started,
    required TResult Function(LoadMoreRequested value) loadMoreRequested,
    required TResult Function(SendMessageRequested value) sendMessageRequested,
    required TResult Function(DeleteRoomRequested value) deleteRoomRequested,
    required TResult Function(LeaveRoomRequested value) leaveRoomRequested,
    required TResult Function(SocketMessageReceived value)
    socketMessageReceived,
    required TResult Function(SocketMessageRead value) socketMessageRead,
    required TResult Function(SocketAckReceived value) socketAckReceived,
    required TResult Function(TypingStarted value) typingStarted,
    required TResult Function(TypingStopped value) typingStopped,
    required TResult Function(ChatRoomPresenceUpdated value) presenceUpdated,
    required TResult Function(TypingTextChanged value) typingTextChanged,
    required TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)
    participantsStatusSnapshotReceived,
    required TResult Function(ChatRoomRoomRemovedRemotely value)
    roomRemovedRemotely,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatRoomStarted value)? started,
    TResult? Function(LoadMoreRequested value)? loadMoreRequested,
    TResult? Function(SendMessageRequested value)? sendMessageRequested,
    TResult? Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult? Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult? Function(SocketMessageReceived value)? socketMessageReceived,
    TResult? Function(SocketMessageRead value)? socketMessageRead,
    TResult? Function(SocketAckReceived value)? socketAckReceived,
    TResult? Function(TypingStarted value)? typingStarted,
    TResult? Function(TypingStopped value)? typingStopped,
    TResult? Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult? Function(TypingTextChanged value)? typingTextChanged,
    TResult? Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult? Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomStarted value)? started,
    TResult Function(LoadMoreRequested value)? loadMoreRequested,
    TResult Function(SendMessageRequested value)? sendMessageRequested,
    TResult Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult Function(SocketMessageReceived value)? socketMessageReceived,
    TResult Function(SocketMessageRead value)? socketMessageRead,
    TResult Function(SocketAckReceived value)? socketAckReceived,
    TResult Function(TypingStarted value)? typingStarted,
    TResult Function(TypingStopped value)? typingStopped,
    TResult Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult Function(TypingTextChanged value)? typingTextChanged,
    TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class ChatRoomStarted implements ChatRoomEvent {
  const factory ChatRoomStarted(
    final String roomId, {
    final RoomListItemEntity? room,
  }) = _$ChatRoomStartedImpl;

  String get roomId;
  RoomListItemEntity? get room;

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatRoomStartedImplCopyWith<_$ChatRoomStartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadMoreRequestedImplCopyWith<$Res> {
  factory _$$LoadMoreRequestedImplCopyWith(
    _$LoadMoreRequestedImpl value,
    $Res Function(_$LoadMoreRequestedImpl) then,
  ) = __$$LoadMoreRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreRequestedImplCopyWithImpl<$Res>
    extends _$ChatRoomEventCopyWithImpl<$Res, _$LoadMoreRequestedImpl>
    implements _$$LoadMoreRequestedImplCopyWith<$Res> {
  __$$LoadMoreRequestedImplCopyWithImpl(
    _$LoadMoreRequestedImpl _value,
    $Res Function(_$LoadMoreRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadMoreRequestedImpl implements LoadMoreRequested {
  const _$LoadMoreRequestedImpl();

  @override
  String toString() {
    return 'ChatRoomEvent.loadMoreRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadMoreRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, RoomListItemEntity? room) started,
    required TResult Function() loadMoreRequested,
    required TResult Function(String text) sendMessageRequested,
    required TResult Function() deleteRoomRequested,
    required TResult Function() leaveRoomRequested,
    required TResult Function(MessageEntity message) socketMessageReceived,
    required TResult Function(String userId) socketMessageRead,
    required TResult Function(String tempId, Map<String, dynamic> ack)
    socketAckReceived,
    required TResult Function(String userId, String username) typingStarted,
    required TResult Function(String userId) typingStopped,
    required TResult Function(
      String userId,
      UserStatus status,
      DateTime? lastSeen,
    )
    presenceUpdated,
    required TResult Function(String text) typingTextChanged,
    required TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )
    participantsStatusSnapshotReceived,
    required TResult Function() roomRemovedRemotely,
  }) {
    return loadMoreRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, RoomListItemEntity? room)? started,
    TResult? Function()? loadMoreRequested,
    TResult? Function(String text)? sendMessageRequested,
    TResult? Function()? deleteRoomRequested,
    TResult? Function()? leaveRoomRequested,
    TResult? Function(MessageEntity message)? socketMessageReceived,
    TResult? Function(String userId)? socketMessageRead,
    TResult? Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult? Function(String userId, String username)? typingStarted,
    TResult? Function(String userId)? typingStopped,
    TResult? Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult? Function(String text)? typingTextChanged,
    TResult? Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult? Function()? roomRemovedRemotely,
  }) {
    return loadMoreRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, RoomListItemEntity? room)? started,
    TResult Function()? loadMoreRequested,
    TResult Function(String text)? sendMessageRequested,
    TResult Function()? deleteRoomRequested,
    TResult Function()? leaveRoomRequested,
    TResult Function(MessageEntity message)? socketMessageReceived,
    TResult Function(String userId)? socketMessageRead,
    TResult Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult Function(String userId, String username)? typingStarted,
    TResult Function(String userId)? typingStopped,
    TResult Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult Function(String text)? typingTextChanged,
    TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult Function()? roomRemovedRemotely,
    required TResult orElse(),
  }) {
    if (loadMoreRequested != null) {
      return loadMoreRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatRoomStarted value) started,
    required TResult Function(LoadMoreRequested value) loadMoreRequested,
    required TResult Function(SendMessageRequested value) sendMessageRequested,
    required TResult Function(DeleteRoomRequested value) deleteRoomRequested,
    required TResult Function(LeaveRoomRequested value) leaveRoomRequested,
    required TResult Function(SocketMessageReceived value)
    socketMessageReceived,
    required TResult Function(SocketMessageRead value) socketMessageRead,
    required TResult Function(SocketAckReceived value) socketAckReceived,
    required TResult Function(TypingStarted value) typingStarted,
    required TResult Function(TypingStopped value) typingStopped,
    required TResult Function(ChatRoomPresenceUpdated value) presenceUpdated,
    required TResult Function(TypingTextChanged value) typingTextChanged,
    required TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)
    participantsStatusSnapshotReceived,
    required TResult Function(ChatRoomRoomRemovedRemotely value)
    roomRemovedRemotely,
  }) {
    return loadMoreRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatRoomStarted value)? started,
    TResult? Function(LoadMoreRequested value)? loadMoreRequested,
    TResult? Function(SendMessageRequested value)? sendMessageRequested,
    TResult? Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult? Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult? Function(SocketMessageReceived value)? socketMessageReceived,
    TResult? Function(SocketMessageRead value)? socketMessageRead,
    TResult? Function(SocketAckReceived value)? socketAckReceived,
    TResult? Function(TypingStarted value)? typingStarted,
    TResult? Function(TypingStopped value)? typingStopped,
    TResult? Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult? Function(TypingTextChanged value)? typingTextChanged,
    TResult? Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult? Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
  }) {
    return loadMoreRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomStarted value)? started,
    TResult Function(LoadMoreRequested value)? loadMoreRequested,
    TResult Function(SendMessageRequested value)? sendMessageRequested,
    TResult Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult Function(SocketMessageReceived value)? socketMessageReceived,
    TResult Function(SocketMessageRead value)? socketMessageRead,
    TResult Function(SocketAckReceived value)? socketAckReceived,
    TResult Function(TypingStarted value)? typingStarted,
    TResult Function(TypingStopped value)? typingStopped,
    TResult Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult Function(TypingTextChanged value)? typingTextChanged,
    TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
    required TResult orElse(),
  }) {
    if (loadMoreRequested != null) {
      return loadMoreRequested(this);
    }
    return orElse();
  }
}

abstract class LoadMoreRequested implements ChatRoomEvent {
  const factory LoadMoreRequested() = _$LoadMoreRequestedImpl;
}

/// @nodoc
abstract class _$$SendMessageRequestedImplCopyWith<$Res> {
  factory _$$SendMessageRequestedImplCopyWith(
    _$SendMessageRequestedImpl value,
    $Res Function(_$SendMessageRequestedImpl) then,
  ) = __$$SendMessageRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$SendMessageRequestedImplCopyWithImpl<$Res>
    extends _$ChatRoomEventCopyWithImpl<$Res, _$SendMessageRequestedImpl>
    implements _$$SendMessageRequestedImplCopyWith<$Res> {
  __$$SendMessageRequestedImplCopyWithImpl(
    _$SendMessageRequestedImpl _value,
    $Res Function(_$SendMessageRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? text = null}) {
    return _then(
      _$SendMessageRequestedImpl(
        null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SendMessageRequestedImpl implements SendMessageRequested {
  const _$SendMessageRequestedImpl(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'ChatRoomEvent.sendMessageRequested(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendMessageRequestedImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendMessageRequestedImplCopyWith<_$SendMessageRequestedImpl>
  get copyWith =>
      __$$SendMessageRequestedImplCopyWithImpl<_$SendMessageRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, RoomListItemEntity? room) started,
    required TResult Function() loadMoreRequested,
    required TResult Function(String text) sendMessageRequested,
    required TResult Function() deleteRoomRequested,
    required TResult Function() leaveRoomRequested,
    required TResult Function(MessageEntity message) socketMessageReceived,
    required TResult Function(String userId) socketMessageRead,
    required TResult Function(String tempId, Map<String, dynamic> ack)
    socketAckReceived,
    required TResult Function(String userId, String username) typingStarted,
    required TResult Function(String userId) typingStopped,
    required TResult Function(
      String userId,
      UserStatus status,
      DateTime? lastSeen,
    )
    presenceUpdated,
    required TResult Function(String text) typingTextChanged,
    required TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )
    participantsStatusSnapshotReceived,
    required TResult Function() roomRemovedRemotely,
  }) {
    return sendMessageRequested(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, RoomListItemEntity? room)? started,
    TResult? Function()? loadMoreRequested,
    TResult? Function(String text)? sendMessageRequested,
    TResult? Function()? deleteRoomRequested,
    TResult? Function()? leaveRoomRequested,
    TResult? Function(MessageEntity message)? socketMessageReceived,
    TResult? Function(String userId)? socketMessageRead,
    TResult? Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult? Function(String userId, String username)? typingStarted,
    TResult? Function(String userId)? typingStopped,
    TResult? Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult? Function(String text)? typingTextChanged,
    TResult? Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult? Function()? roomRemovedRemotely,
  }) {
    return sendMessageRequested?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, RoomListItemEntity? room)? started,
    TResult Function()? loadMoreRequested,
    TResult Function(String text)? sendMessageRequested,
    TResult Function()? deleteRoomRequested,
    TResult Function()? leaveRoomRequested,
    TResult Function(MessageEntity message)? socketMessageReceived,
    TResult Function(String userId)? socketMessageRead,
    TResult Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult Function(String userId, String username)? typingStarted,
    TResult Function(String userId)? typingStopped,
    TResult Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult Function(String text)? typingTextChanged,
    TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult Function()? roomRemovedRemotely,
    required TResult orElse(),
  }) {
    if (sendMessageRequested != null) {
      return sendMessageRequested(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatRoomStarted value) started,
    required TResult Function(LoadMoreRequested value) loadMoreRequested,
    required TResult Function(SendMessageRequested value) sendMessageRequested,
    required TResult Function(DeleteRoomRequested value) deleteRoomRequested,
    required TResult Function(LeaveRoomRequested value) leaveRoomRequested,
    required TResult Function(SocketMessageReceived value)
    socketMessageReceived,
    required TResult Function(SocketMessageRead value) socketMessageRead,
    required TResult Function(SocketAckReceived value) socketAckReceived,
    required TResult Function(TypingStarted value) typingStarted,
    required TResult Function(TypingStopped value) typingStopped,
    required TResult Function(ChatRoomPresenceUpdated value) presenceUpdated,
    required TResult Function(TypingTextChanged value) typingTextChanged,
    required TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)
    participantsStatusSnapshotReceived,
    required TResult Function(ChatRoomRoomRemovedRemotely value)
    roomRemovedRemotely,
  }) {
    return sendMessageRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatRoomStarted value)? started,
    TResult? Function(LoadMoreRequested value)? loadMoreRequested,
    TResult? Function(SendMessageRequested value)? sendMessageRequested,
    TResult? Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult? Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult? Function(SocketMessageReceived value)? socketMessageReceived,
    TResult? Function(SocketMessageRead value)? socketMessageRead,
    TResult? Function(SocketAckReceived value)? socketAckReceived,
    TResult? Function(TypingStarted value)? typingStarted,
    TResult? Function(TypingStopped value)? typingStopped,
    TResult? Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult? Function(TypingTextChanged value)? typingTextChanged,
    TResult? Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult? Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
  }) {
    return sendMessageRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomStarted value)? started,
    TResult Function(LoadMoreRequested value)? loadMoreRequested,
    TResult Function(SendMessageRequested value)? sendMessageRequested,
    TResult Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult Function(SocketMessageReceived value)? socketMessageReceived,
    TResult Function(SocketMessageRead value)? socketMessageRead,
    TResult Function(SocketAckReceived value)? socketAckReceived,
    TResult Function(TypingStarted value)? typingStarted,
    TResult Function(TypingStopped value)? typingStopped,
    TResult Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult Function(TypingTextChanged value)? typingTextChanged,
    TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
    required TResult orElse(),
  }) {
    if (sendMessageRequested != null) {
      return sendMessageRequested(this);
    }
    return orElse();
  }
}

abstract class SendMessageRequested implements ChatRoomEvent {
  const factory SendMessageRequested(final String text) =
      _$SendMessageRequestedImpl;

  String get text;

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendMessageRequestedImplCopyWith<_$SendMessageRequestedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteRoomRequestedImplCopyWith<$Res> {
  factory _$$DeleteRoomRequestedImplCopyWith(
    _$DeleteRoomRequestedImpl value,
    $Res Function(_$DeleteRoomRequestedImpl) then,
  ) = __$$DeleteRoomRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteRoomRequestedImplCopyWithImpl<$Res>
    extends _$ChatRoomEventCopyWithImpl<$Res, _$DeleteRoomRequestedImpl>
    implements _$$DeleteRoomRequestedImplCopyWith<$Res> {
  __$$DeleteRoomRequestedImplCopyWithImpl(
    _$DeleteRoomRequestedImpl _value,
    $Res Function(_$DeleteRoomRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DeleteRoomRequestedImpl implements DeleteRoomRequested {
  const _$DeleteRoomRequestedImpl();

  @override
  String toString() {
    return 'ChatRoomEvent.deleteRoomRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteRoomRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, RoomListItemEntity? room) started,
    required TResult Function() loadMoreRequested,
    required TResult Function(String text) sendMessageRequested,
    required TResult Function() deleteRoomRequested,
    required TResult Function() leaveRoomRequested,
    required TResult Function(MessageEntity message) socketMessageReceived,
    required TResult Function(String userId) socketMessageRead,
    required TResult Function(String tempId, Map<String, dynamic> ack)
    socketAckReceived,
    required TResult Function(String userId, String username) typingStarted,
    required TResult Function(String userId) typingStopped,
    required TResult Function(
      String userId,
      UserStatus status,
      DateTime? lastSeen,
    )
    presenceUpdated,
    required TResult Function(String text) typingTextChanged,
    required TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )
    participantsStatusSnapshotReceived,
    required TResult Function() roomRemovedRemotely,
  }) {
    return deleteRoomRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, RoomListItemEntity? room)? started,
    TResult? Function()? loadMoreRequested,
    TResult? Function(String text)? sendMessageRequested,
    TResult? Function()? deleteRoomRequested,
    TResult? Function()? leaveRoomRequested,
    TResult? Function(MessageEntity message)? socketMessageReceived,
    TResult? Function(String userId)? socketMessageRead,
    TResult? Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult? Function(String userId, String username)? typingStarted,
    TResult? Function(String userId)? typingStopped,
    TResult? Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult? Function(String text)? typingTextChanged,
    TResult? Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult? Function()? roomRemovedRemotely,
  }) {
    return deleteRoomRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, RoomListItemEntity? room)? started,
    TResult Function()? loadMoreRequested,
    TResult Function(String text)? sendMessageRequested,
    TResult Function()? deleteRoomRequested,
    TResult Function()? leaveRoomRequested,
    TResult Function(MessageEntity message)? socketMessageReceived,
    TResult Function(String userId)? socketMessageRead,
    TResult Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult Function(String userId, String username)? typingStarted,
    TResult Function(String userId)? typingStopped,
    TResult Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult Function(String text)? typingTextChanged,
    TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult Function()? roomRemovedRemotely,
    required TResult orElse(),
  }) {
    if (deleteRoomRequested != null) {
      return deleteRoomRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatRoomStarted value) started,
    required TResult Function(LoadMoreRequested value) loadMoreRequested,
    required TResult Function(SendMessageRequested value) sendMessageRequested,
    required TResult Function(DeleteRoomRequested value) deleteRoomRequested,
    required TResult Function(LeaveRoomRequested value) leaveRoomRequested,
    required TResult Function(SocketMessageReceived value)
    socketMessageReceived,
    required TResult Function(SocketMessageRead value) socketMessageRead,
    required TResult Function(SocketAckReceived value) socketAckReceived,
    required TResult Function(TypingStarted value) typingStarted,
    required TResult Function(TypingStopped value) typingStopped,
    required TResult Function(ChatRoomPresenceUpdated value) presenceUpdated,
    required TResult Function(TypingTextChanged value) typingTextChanged,
    required TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)
    participantsStatusSnapshotReceived,
    required TResult Function(ChatRoomRoomRemovedRemotely value)
    roomRemovedRemotely,
  }) {
    return deleteRoomRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatRoomStarted value)? started,
    TResult? Function(LoadMoreRequested value)? loadMoreRequested,
    TResult? Function(SendMessageRequested value)? sendMessageRequested,
    TResult? Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult? Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult? Function(SocketMessageReceived value)? socketMessageReceived,
    TResult? Function(SocketMessageRead value)? socketMessageRead,
    TResult? Function(SocketAckReceived value)? socketAckReceived,
    TResult? Function(TypingStarted value)? typingStarted,
    TResult? Function(TypingStopped value)? typingStopped,
    TResult? Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult? Function(TypingTextChanged value)? typingTextChanged,
    TResult? Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult? Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
  }) {
    return deleteRoomRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomStarted value)? started,
    TResult Function(LoadMoreRequested value)? loadMoreRequested,
    TResult Function(SendMessageRequested value)? sendMessageRequested,
    TResult Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult Function(SocketMessageReceived value)? socketMessageReceived,
    TResult Function(SocketMessageRead value)? socketMessageRead,
    TResult Function(SocketAckReceived value)? socketAckReceived,
    TResult Function(TypingStarted value)? typingStarted,
    TResult Function(TypingStopped value)? typingStopped,
    TResult Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult Function(TypingTextChanged value)? typingTextChanged,
    TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
    required TResult orElse(),
  }) {
    if (deleteRoomRequested != null) {
      return deleteRoomRequested(this);
    }
    return orElse();
  }
}

abstract class DeleteRoomRequested implements ChatRoomEvent {
  const factory DeleteRoomRequested() = _$DeleteRoomRequestedImpl;
}

/// @nodoc
abstract class _$$LeaveRoomRequestedImplCopyWith<$Res> {
  factory _$$LeaveRoomRequestedImplCopyWith(
    _$LeaveRoomRequestedImpl value,
    $Res Function(_$LeaveRoomRequestedImpl) then,
  ) = __$$LeaveRoomRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LeaveRoomRequestedImplCopyWithImpl<$Res>
    extends _$ChatRoomEventCopyWithImpl<$Res, _$LeaveRoomRequestedImpl>
    implements _$$LeaveRoomRequestedImplCopyWith<$Res> {
  __$$LeaveRoomRequestedImplCopyWithImpl(
    _$LeaveRoomRequestedImpl _value,
    $Res Function(_$LeaveRoomRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LeaveRoomRequestedImpl implements LeaveRoomRequested {
  const _$LeaveRoomRequestedImpl();

  @override
  String toString() {
    return 'ChatRoomEvent.leaveRoomRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LeaveRoomRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, RoomListItemEntity? room) started,
    required TResult Function() loadMoreRequested,
    required TResult Function(String text) sendMessageRequested,
    required TResult Function() deleteRoomRequested,
    required TResult Function() leaveRoomRequested,
    required TResult Function(MessageEntity message) socketMessageReceived,
    required TResult Function(String userId) socketMessageRead,
    required TResult Function(String tempId, Map<String, dynamic> ack)
    socketAckReceived,
    required TResult Function(String userId, String username) typingStarted,
    required TResult Function(String userId) typingStopped,
    required TResult Function(
      String userId,
      UserStatus status,
      DateTime? lastSeen,
    )
    presenceUpdated,
    required TResult Function(String text) typingTextChanged,
    required TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )
    participantsStatusSnapshotReceived,
    required TResult Function() roomRemovedRemotely,
  }) {
    return leaveRoomRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, RoomListItemEntity? room)? started,
    TResult? Function()? loadMoreRequested,
    TResult? Function(String text)? sendMessageRequested,
    TResult? Function()? deleteRoomRequested,
    TResult? Function()? leaveRoomRequested,
    TResult? Function(MessageEntity message)? socketMessageReceived,
    TResult? Function(String userId)? socketMessageRead,
    TResult? Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult? Function(String userId, String username)? typingStarted,
    TResult? Function(String userId)? typingStopped,
    TResult? Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult? Function(String text)? typingTextChanged,
    TResult? Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult? Function()? roomRemovedRemotely,
  }) {
    return leaveRoomRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, RoomListItemEntity? room)? started,
    TResult Function()? loadMoreRequested,
    TResult Function(String text)? sendMessageRequested,
    TResult Function()? deleteRoomRequested,
    TResult Function()? leaveRoomRequested,
    TResult Function(MessageEntity message)? socketMessageReceived,
    TResult Function(String userId)? socketMessageRead,
    TResult Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult Function(String userId, String username)? typingStarted,
    TResult Function(String userId)? typingStopped,
    TResult Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult Function(String text)? typingTextChanged,
    TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult Function()? roomRemovedRemotely,
    required TResult orElse(),
  }) {
    if (leaveRoomRequested != null) {
      return leaveRoomRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatRoomStarted value) started,
    required TResult Function(LoadMoreRequested value) loadMoreRequested,
    required TResult Function(SendMessageRequested value) sendMessageRequested,
    required TResult Function(DeleteRoomRequested value) deleteRoomRequested,
    required TResult Function(LeaveRoomRequested value) leaveRoomRequested,
    required TResult Function(SocketMessageReceived value)
    socketMessageReceived,
    required TResult Function(SocketMessageRead value) socketMessageRead,
    required TResult Function(SocketAckReceived value) socketAckReceived,
    required TResult Function(TypingStarted value) typingStarted,
    required TResult Function(TypingStopped value) typingStopped,
    required TResult Function(ChatRoomPresenceUpdated value) presenceUpdated,
    required TResult Function(TypingTextChanged value) typingTextChanged,
    required TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)
    participantsStatusSnapshotReceived,
    required TResult Function(ChatRoomRoomRemovedRemotely value)
    roomRemovedRemotely,
  }) {
    return leaveRoomRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatRoomStarted value)? started,
    TResult? Function(LoadMoreRequested value)? loadMoreRequested,
    TResult? Function(SendMessageRequested value)? sendMessageRequested,
    TResult? Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult? Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult? Function(SocketMessageReceived value)? socketMessageReceived,
    TResult? Function(SocketMessageRead value)? socketMessageRead,
    TResult? Function(SocketAckReceived value)? socketAckReceived,
    TResult? Function(TypingStarted value)? typingStarted,
    TResult? Function(TypingStopped value)? typingStopped,
    TResult? Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult? Function(TypingTextChanged value)? typingTextChanged,
    TResult? Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult? Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
  }) {
    return leaveRoomRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomStarted value)? started,
    TResult Function(LoadMoreRequested value)? loadMoreRequested,
    TResult Function(SendMessageRequested value)? sendMessageRequested,
    TResult Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult Function(SocketMessageReceived value)? socketMessageReceived,
    TResult Function(SocketMessageRead value)? socketMessageRead,
    TResult Function(SocketAckReceived value)? socketAckReceived,
    TResult Function(TypingStarted value)? typingStarted,
    TResult Function(TypingStopped value)? typingStopped,
    TResult Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult Function(TypingTextChanged value)? typingTextChanged,
    TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
    required TResult orElse(),
  }) {
    if (leaveRoomRequested != null) {
      return leaveRoomRequested(this);
    }
    return orElse();
  }
}

abstract class LeaveRoomRequested implements ChatRoomEvent {
  const factory LeaveRoomRequested() = _$LeaveRoomRequestedImpl;
}

/// @nodoc
abstract class _$$SocketMessageReceivedImplCopyWith<$Res> {
  factory _$$SocketMessageReceivedImplCopyWith(
    _$SocketMessageReceivedImpl value,
    $Res Function(_$SocketMessageReceivedImpl) then,
  ) = __$$SocketMessageReceivedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MessageEntity message});

  $MessageEntityCopyWith<$Res> get message;
}

/// @nodoc
class __$$SocketMessageReceivedImplCopyWithImpl<$Res>
    extends _$ChatRoomEventCopyWithImpl<$Res, _$SocketMessageReceivedImpl>
    implements _$$SocketMessageReceivedImplCopyWith<$Res> {
  __$$SocketMessageReceivedImplCopyWithImpl(
    _$SocketMessageReceivedImpl _value,
    $Res Function(_$SocketMessageReceivedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$SocketMessageReceivedImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as MessageEntity,
      ),
    );
  }

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessageEntityCopyWith<$Res> get message {
    return $MessageEntityCopyWith<$Res>(_value.message, (value) {
      return _then(_value.copyWith(message: value));
    });
  }
}

/// @nodoc

class _$SocketMessageReceivedImpl implements SocketMessageReceived {
  const _$SocketMessageReceivedImpl(this.message);

  @override
  final MessageEntity message;

  @override
  String toString() {
    return 'ChatRoomEvent.socketMessageReceived(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocketMessageReceivedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocketMessageReceivedImplCopyWith<_$SocketMessageReceivedImpl>
  get copyWith =>
      __$$SocketMessageReceivedImplCopyWithImpl<_$SocketMessageReceivedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, RoomListItemEntity? room) started,
    required TResult Function() loadMoreRequested,
    required TResult Function(String text) sendMessageRequested,
    required TResult Function() deleteRoomRequested,
    required TResult Function() leaveRoomRequested,
    required TResult Function(MessageEntity message) socketMessageReceived,
    required TResult Function(String userId) socketMessageRead,
    required TResult Function(String tempId, Map<String, dynamic> ack)
    socketAckReceived,
    required TResult Function(String userId, String username) typingStarted,
    required TResult Function(String userId) typingStopped,
    required TResult Function(
      String userId,
      UserStatus status,
      DateTime? lastSeen,
    )
    presenceUpdated,
    required TResult Function(String text) typingTextChanged,
    required TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )
    participantsStatusSnapshotReceived,
    required TResult Function() roomRemovedRemotely,
  }) {
    return socketMessageReceived(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, RoomListItemEntity? room)? started,
    TResult? Function()? loadMoreRequested,
    TResult? Function(String text)? sendMessageRequested,
    TResult? Function()? deleteRoomRequested,
    TResult? Function()? leaveRoomRequested,
    TResult? Function(MessageEntity message)? socketMessageReceived,
    TResult? Function(String userId)? socketMessageRead,
    TResult? Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult? Function(String userId, String username)? typingStarted,
    TResult? Function(String userId)? typingStopped,
    TResult? Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult? Function(String text)? typingTextChanged,
    TResult? Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult? Function()? roomRemovedRemotely,
  }) {
    return socketMessageReceived?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, RoomListItemEntity? room)? started,
    TResult Function()? loadMoreRequested,
    TResult Function(String text)? sendMessageRequested,
    TResult Function()? deleteRoomRequested,
    TResult Function()? leaveRoomRequested,
    TResult Function(MessageEntity message)? socketMessageReceived,
    TResult Function(String userId)? socketMessageRead,
    TResult Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult Function(String userId, String username)? typingStarted,
    TResult Function(String userId)? typingStopped,
    TResult Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult Function(String text)? typingTextChanged,
    TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult Function()? roomRemovedRemotely,
    required TResult orElse(),
  }) {
    if (socketMessageReceived != null) {
      return socketMessageReceived(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatRoomStarted value) started,
    required TResult Function(LoadMoreRequested value) loadMoreRequested,
    required TResult Function(SendMessageRequested value) sendMessageRequested,
    required TResult Function(DeleteRoomRequested value) deleteRoomRequested,
    required TResult Function(LeaveRoomRequested value) leaveRoomRequested,
    required TResult Function(SocketMessageReceived value)
    socketMessageReceived,
    required TResult Function(SocketMessageRead value) socketMessageRead,
    required TResult Function(SocketAckReceived value) socketAckReceived,
    required TResult Function(TypingStarted value) typingStarted,
    required TResult Function(TypingStopped value) typingStopped,
    required TResult Function(ChatRoomPresenceUpdated value) presenceUpdated,
    required TResult Function(TypingTextChanged value) typingTextChanged,
    required TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)
    participantsStatusSnapshotReceived,
    required TResult Function(ChatRoomRoomRemovedRemotely value)
    roomRemovedRemotely,
  }) {
    return socketMessageReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatRoomStarted value)? started,
    TResult? Function(LoadMoreRequested value)? loadMoreRequested,
    TResult? Function(SendMessageRequested value)? sendMessageRequested,
    TResult? Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult? Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult? Function(SocketMessageReceived value)? socketMessageReceived,
    TResult? Function(SocketMessageRead value)? socketMessageRead,
    TResult? Function(SocketAckReceived value)? socketAckReceived,
    TResult? Function(TypingStarted value)? typingStarted,
    TResult? Function(TypingStopped value)? typingStopped,
    TResult? Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult? Function(TypingTextChanged value)? typingTextChanged,
    TResult? Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult? Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
  }) {
    return socketMessageReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomStarted value)? started,
    TResult Function(LoadMoreRequested value)? loadMoreRequested,
    TResult Function(SendMessageRequested value)? sendMessageRequested,
    TResult Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult Function(SocketMessageReceived value)? socketMessageReceived,
    TResult Function(SocketMessageRead value)? socketMessageRead,
    TResult Function(SocketAckReceived value)? socketAckReceived,
    TResult Function(TypingStarted value)? typingStarted,
    TResult Function(TypingStopped value)? typingStopped,
    TResult Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult Function(TypingTextChanged value)? typingTextChanged,
    TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
    required TResult orElse(),
  }) {
    if (socketMessageReceived != null) {
      return socketMessageReceived(this);
    }
    return orElse();
  }
}

abstract class SocketMessageReceived implements ChatRoomEvent {
  const factory SocketMessageReceived(final MessageEntity message) =
      _$SocketMessageReceivedImpl;

  MessageEntity get message;

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocketMessageReceivedImplCopyWith<_$SocketMessageReceivedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SocketMessageReadImplCopyWith<$Res> {
  factory _$$SocketMessageReadImplCopyWith(
    _$SocketMessageReadImpl value,
    $Res Function(_$SocketMessageReadImpl) then,
  ) = __$$SocketMessageReadImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$SocketMessageReadImplCopyWithImpl<$Res>
    extends _$ChatRoomEventCopyWithImpl<$Res, _$SocketMessageReadImpl>
    implements _$$SocketMessageReadImplCopyWith<$Res> {
  __$$SocketMessageReadImplCopyWithImpl(
    _$SocketMessageReadImpl _value,
    $Res Function(_$SocketMessageReadImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null}) {
    return _then(
      _$SocketMessageReadImpl(
        null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SocketMessageReadImpl implements SocketMessageRead {
  const _$SocketMessageReadImpl(this.userId);

  @override
  final String userId;

  @override
  String toString() {
    return 'ChatRoomEvent.socketMessageRead(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocketMessageReadImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocketMessageReadImplCopyWith<_$SocketMessageReadImpl> get copyWith =>
      __$$SocketMessageReadImplCopyWithImpl<_$SocketMessageReadImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, RoomListItemEntity? room) started,
    required TResult Function() loadMoreRequested,
    required TResult Function(String text) sendMessageRequested,
    required TResult Function() deleteRoomRequested,
    required TResult Function() leaveRoomRequested,
    required TResult Function(MessageEntity message) socketMessageReceived,
    required TResult Function(String userId) socketMessageRead,
    required TResult Function(String tempId, Map<String, dynamic> ack)
    socketAckReceived,
    required TResult Function(String userId, String username) typingStarted,
    required TResult Function(String userId) typingStopped,
    required TResult Function(
      String userId,
      UserStatus status,
      DateTime? lastSeen,
    )
    presenceUpdated,
    required TResult Function(String text) typingTextChanged,
    required TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )
    participantsStatusSnapshotReceived,
    required TResult Function() roomRemovedRemotely,
  }) {
    return socketMessageRead(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, RoomListItemEntity? room)? started,
    TResult? Function()? loadMoreRequested,
    TResult? Function(String text)? sendMessageRequested,
    TResult? Function()? deleteRoomRequested,
    TResult? Function()? leaveRoomRequested,
    TResult? Function(MessageEntity message)? socketMessageReceived,
    TResult? Function(String userId)? socketMessageRead,
    TResult? Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult? Function(String userId, String username)? typingStarted,
    TResult? Function(String userId)? typingStopped,
    TResult? Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult? Function(String text)? typingTextChanged,
    TResult? Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult? Function()? roomRemovedRemotely,
  }) {
    return socketMessageRead?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, RoomListItemEntity? room)? started,
    TResult Function()? loadMoreRequested,
    TResult Function(String text)? sendMessageRequested,
    TResult Function()? deleteRoomRequested,
    TResult Function()? leaveRoomRequested,
    TResult Function(MessageEntity message)? socketMessageReceived,
    TResult Function(String userId)? socketMessageRead,
    TResult Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult Function(String userId, String username)? typingStarted,
    TResult Function(String userId)? typingStopped,
    TResult Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult Function(String text)? typingTextChanged,
    TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult Function()? roomRemovedRemotely,
    required TResult orElse(),
  }) {
    if (socketMessageRead != null) {
      return socketMessageRead(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatRoomStarted value) started,
    required TResult Function(LoadMoreRequested value) loadMoreRequested,
    required TResult Function(SendMessageRequested value) sendMessageRequested,
    required TResult Function(DeleteRoomRequested value) deleteRoomRequested,
    required TResult Function(LeaveRoomRequested value) leaveRoomRequested,
    required TResult Function(SocketMessageReceived value)
    socketMessageReceived,
    required TResult Function(SocketMessageRead value) socketMessageRead,
    required TResult Function(SocketAckReceived value) socketAckReceived,
    required TResult Function(TypingStarted value) typingStarted,
    required TResult Function(TypingStopped value) typingStopped,
    required TResult Function(ChatRoomPresenceUpdated value) presenceUpdated,
    required TResult Function(TypingTextChanged value) typingTextChanged,
    required TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)
    participantsStatusSnapshotReceived,
    required TResult Function(ChatRoomRoomRemovedRemotely value)
    roomRemovedRemotely,
  }) {
    return socketMessageRead(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatRoomStarted value)? started,
    TResult? Function(LoadMoreRequested value)? loadMoreRequested,
    TResult? Function(SendMessageRequested value)? sendMessageRequested,
    TResult? Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult? Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult? Function(SocketMessageReceived value)? socketMessageReceived,
    TResult? Function(SocketMessageRead value)? socketMessageRead,
    TResult? Function(SocketAckReceived value)? socketAckReceived,
    TResult? Function(TypingStarted value)? typingStarted,
    TResult? Function(TypingStopped value)? typingStopped,
    TResult? Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult? Function(TypingTextChanged value)? typingTextChanged,
    TResult? Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult? Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
  }) {
    return socketMessageRead?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomStarted value)? started,
    TResult Function(LoadMoreRequested value)? loadMoreRequested,
    TResult Function(SendMessageRequested value)? sendMessageRequested,
    TResult Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult Function(SocketMessageReceived value)? socketMessageReceived,
    TResult Function(SocketMessageRead value)? socketMessageRead,
    TResult Function(SocketAckReceived value)? socketAckReceived,
    TResult Function(TypingStarted value)? typingStarted,
    TResult Function(TypingStopped value)? typingStopped,
    TResult Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult Function(TypingTextChanged value)? typingTextChanged,
    TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
    required TResult orElse(),
  }) {
    if (socketMessageRead != null) {
      return socketMessageRead(this);
    }
    return orElse();
  }
}

abstract class SocketMessageRead implements ChatRoomEvent {
  const factory SocketMessageRead(final String userId) =
      _$SocketMessageReadImpl;

  String get userId;

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocketMessageReadImplCopyWith<_$SocketMessageReadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SocketAckReceivedImplCopyWith<$Res> {
  factory _$$SocketAckReceivedImplCopyWith(
    _$SocketAckReceivedImpl value,
    $Res Function(_$SocketAckReceivedImpl) then,
  ) = __$$SocketAckReceivedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String tempId, Map<String, dynamic> ack});
}

/// @nodoc
class __$$SocketAckReceivedImplCopyWithImpl<$Res>
    extends _$ChatRoomEventCopyWithImpl<$Res, _$SocketAckReceivedImpl>
    implements _$$SocketAckReceivedImplCopyWith<$Res> {
  __$$SocketAckReceivedImplCopyWithImpl(
    _$SocketAckReceivedImpl _value,
    $Res Function(_$SocketAckReceivedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? tempId = null, Object? ack = null}) {
    return _then(
      _$SocketAckReceivedImpl(
        null == tempId
            ? _value.tempId
            : tempId // ignore: cast_nullable_to_non_nullable
                  as String,
        null == ack
            ? _value._ack
            : ack // ignore: cast_nullable_to_non_nullable
                  as Map<String, dynamic>,
      ),
    );
  }
}

/// @nodoc

class _$SocketAckReceivedImpl implements SocketAckReceived {
  const _$SocketAckReceivedImpl(this.tempId, final Map<String, dynamic> ack)
    : _ack = ack;

  @override
  final String tempId;
  final Map<String, dynamic> _ack;
  @override
  Map<String, dynamic> get ack {
    if (_ack is EqualUnmodifiableMapView) return _ack;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_ack);
  }

  @override
  String toString() {
    return 'ChatRoomEvent.socketAckReceived(tempId: $tempId, ack: $ack)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocketAckReceivedImpl &&
            (identical(other.tempId, tempId) || other.tempId == tempId) &&
            const DeepCollectionEquality().equals(other._ack, _ack));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    tempId,
    const DeepCollectionEquality().hash(_ack),
  );

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocketAckReceivedImplCopyWith<_$SocketAckReceivedImpl> get copyWith =>
      __$$SocketAckReceivedImplCopyWithImpl<_$SocketAckReceivedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, RoomListItemEntity? room) started,
    required TResult Function() loadMoreRequested,
    required TResult Function(String text) sendMessageRequested,
    required TResult Function() deleteRoomRequested,
    required TResult Function() leaveRoomRequested,
    required TResult Function(MessageEntity message) socketMessageReceived,
    required TResult Function(String userId) socketMessageRead,
    required TResult Function(String tempId, Map<String, dynamic> ack)
    socketAckReceived,
    required TResult Function(String userId, String username) typingStarted,
    required TResult Function(String userId) typingStopped,
    required TResult Function(
      String userId,
      UserStatus status,
      DateTime? lastSeen,
    )
    presenceUpdated,
    required TResult Function(String text) typingTextChanged,
    required TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )
    participantsStatusSnapshotReceived,
    required TResult Function() roomRemovedRemotely,
  }) {
    return socketAckReceived(tempId, ack);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, RoomListItemEntity? room)? started,
    TResult? Function()? loadMoreRequested,
    TResult? Function(String text)? sendMessageRequested,
    TResult? Function()? deleteRoomRequested,
    TResult? Function()? leaveRoomRequested,
    TResult? Function(MessageEntity message)? socketMessageReceived,
    TResult? Function(String userId)? socketMessageRead,
    TResult? Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult? Function(String userId, String username)? typingStarted,
    TResult? Function(String userId)? typingStopped,
    TResult? Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult? Function(String text)? typingTextChanged,
    TResult? Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult? Function()? roomRemovedRemotely,
  }) {
    return socketAckReceived?.call(tempId, ack);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, RoomListItemEntity? room)? started,
    TResult Function()? loadMoreRequested,
    TResult Function(String text)? sendMessageRequested,
    TResult Function()? deleteRoomRequested,
    TResult Function()? leaveRoomRequested,
    TResult Function(MessageEntity message)? socketMessageReceived,
    TResult Function(String userId)? socketMessageRead,
    TResult Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult Function(String userId, String username)? typingStarted,
    TResult Function(String userId)? typingStopped,
    TResult Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult Function(String text)? typingTextChanged,
    TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult Function()? roomRemovedRemotely,
    required TResult orElse(),
  }) {
    if (socketAckReceived != null) {
      return socketAckReceived(tempId, ack);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatRoomStarted value) started,
    required TResult Function(LoadMoreRequested value) loadMoreRequested,
    required TResult Function(SendMessageRequested value) sendMessageRequested,
    required TResult Function(DeleteRoomRequested value) deleteRoomRequested,
    required TResult Function(LeaveRoomRequested value) leaveRoomRequested,
    required TResult Function(SocketMessageReceived value)
    socketMessageReceived,
    required TResult Function(SocketMessageRead value) socketMessageRead,
    required TResult Function(SocketAckReceived value) socketAckReceived,
    required TResult Function(TypingStarted value) typingStarted,
    required TResult Function(TypingStopped value) typingStopped,
    required TResult Function(ChatRoomPresenceUpdated value) presenceUpdated,
    required TResult Function(TypingTextChanged value) typingTextChanged,
    required TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)
    participantsStatusSnapshotReceived,
    required TResult Function(ChatRoomRoomRemovedRemotely value)
    roomRemovedRemotely,
  }) {
    return socketAckReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatRoomStarted value)? started,
    TResult? Function(LoadMoreRequested value)? loadMoreRequested,
    TResult? Function(SendMessageRequested value)? sendMessageRequested,
    TResult? Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult? Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult? Function(SocketMessageReceived value)? socketMessageReceived,
    TResult? Function(SocketMessageRead value)? socketMessageRead,
    TResult? Function(SocketAckReceived value)? socketAckReceived,
    TResult? Function(TypingStarted value)? typingStarted,
    TResult? Function(TypingStopped value)? typingStopped,
    TResult? Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult? Function(TypingTextChanged value)? typingTextChanged,
    TResult? Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult? Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
  }) {
    return socketAckReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomStarted value)? started,
    TResult Function(LoadMoreRequested value)? loadMoreRequested,
    TResult Function(SendMessageRequested value)? sendMessageRequested,
    TResult Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult Function(SocketMessageReceived value)? socketMessageReceived,
    TResult Function(SocketMessageRead value)? socketMessageRead,
    TResult Function(SocketAckReceived value)? socketAckReceived,
    TResult Function(TypingStarted value)? typingStarted,
    TResult Function(TypingStopped value)? typingStopped,
    TResult Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult Function(TypingTextChanged value)? typingTextChanged,
    TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
    required TResult orElse(),
  }) {
    if (socketAckReceived != null) {
      return socketAckReceived(this);
    }
    return orElse();
  }
}

abstract class SocketAckReceived implements ChatRoomEvent {
  const factory SocketAckReceived(
    final String tempId,
    final Map<String, dynamic> ack,
  ) = _$SocketAckReceivedImpl;

  String get tempId;
  Map<String, dynamic> get ack;

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocketAckReceivedImplCopyWith<_$SocketAckReceivedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TypingStartedImplCopyWith<$Res> {
  factory _$$TypingStartedImplCopyWith(
    _$TypingStartedImpl value,
    $Res Function(_$TypingStartedImpl) then,
  ) = __$$TypingStartedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, String username});
}

/// @nodoc
class __$$TypingStartedImplCopyWithImpl<$Res>
    extends _$ChatRoomEventCopyWithImpl<$Res, _$TypingStartedImpl>
    implements _$$TypingStartedImplCopyWith<$Res> {
  __$$TypingStartedImplCopyWithImpl(
    _$TypingStartedImpl _value,
    $Res Function(_$TypingStartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null, Object? username = null}) {
    return _then(
      _$TypingStartedImpl(
        null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$TypingStartedImpl implements TypingStarted {
  const _$TypingStartedImpl(this.userId, this.username);

  @override
  final String userId;
  @override
  final String username;

  @override
  String toString() {
    return 'ChatRoomEvent.typingStarted(userId: $userId, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypingStartedImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, username);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TypingStartedImplCopyWith<_$TypingStartedImpl> get copyWith =>
      __$$TypingStartedImplCopyWithImpl<_$TypingStartedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, RoomListItemEntity? room) started,
    required TResult Function() loadMoreRequested,
    required TResult Function(String text) sendMessageRequested,
    required TResult Function() deleteRoomRequested,
    required TResult Function() leaveRoomRequested,
    required TResult Function(MessageEntity message) socketMessageReceived,
    required TResult Function(String userId) socketMessageRead,
    required TResult Function(String tempId, Map<String, dynamic> ack)
    socketAckReceived,
    required TResult Function(String userId, String username) typingStarted,
    required TResult Function(String userId) typingStopped,
    required TResult Function(
      String userId,
      UserStatus status,
      DateTime? lastSeen,
    )
    presenceUpdated,
    required TResult Function(String text) typingTextChanged,
    required TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )
    participantsStatusSnapshotReceived,
    required TResult Function() roomRemovedRemotely,
  }) {
    return typingStarted(userId, username);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, RoomListItemEntity? room)? started,
    TResult? Function()? loadMoreRequested,
    TResult? Function(String text)? sendMessageRequested,
    TResult? Function()? deleteRoomRequested,
    TResult? Function()? leaveRoomRequested,
    TResult? Function(MessageEntity message)? socketMessageReceived,
    TResult? Function(String userId)? socketMessageRead,
    TResult? Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult? Function(String userId, String username)? typingStarted,
    TResult? Function(String userId)? typingStopped,
    TResult? Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult? Function(String text)? typingTextChanged,
    TResult? Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult? Function()? roomRemovedRemotely,
  }) {
    return typingStarted?.call(userId, username);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, RoomListItemEntity? room)? started,
    TResult Function()? loadMoreRequested,
    TResult Function(String text)? sendMessageRequested,
    TResult Function()? deleteRoomRequested,
    TResult Function()? leaveRoomRequested,
    TResult Function(MessageEntity message)? socketMessageReceived,
    TResult Function(String userId)? socketMessageRead,
    TResult Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult Function(String userId, String username)? typingStarted,
    TResult Function(String userId)? typingStopped,
    TResult Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult Function(String text)? typingTextChanged,
    TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult Function()? roomRemovedRemotely,
    required TResult orElse(),
  }) {
    if (typingStarted != null) {
      return typingStarted(userId, username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatRoomStarted value) started,
    required TResult Function(LoadMoreRequested value) loadMoreRequested,
    required TResult Function(SendMessageRequested value) sendMessageRequested,
    required TResult Function(DeleteRoomRequested value) deleteRoomRequested,
    required TResult Function(LeaveRoomRequested value) leaveRoomRequested,
    required TResult Function(SocketMessageReceived value)
    socketMessageReceived,
    required TResult Function(SocketMessageRead value) socketMessageRead,
    required TResult Function(SocketAckReceived value) socketAckReceived,
    required TResult Function(TypingStarted value) typingStarted,
    required TResult Function(TypingStopped value) typingStopped,
    required TResult Function(ChatRoomPresenceUpdated value) presenceUpdated,
    required TResult Function(TypingTextChanged value) typingTextChanged,
    required TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)
    participantsStatusSnapshotReceived,
    required TResult Function(ChatRoomRoomRemovedRemotely value)
    roomRemovedRemotely,
  }) {
    return typingStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatRoomStarted value)? started,
    TResult? Function(LoadMoreRequested value)? loadMoreRequested,
    TResult? Function(SendMessageRequested value)? sendMessageRequested,
    TResult? Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult? Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult? Function(SocketMessageReceived value)? socketMessageReceived,
    TResult? Function(SocketMessageRead value)? socketMessageRead,
    TResult? Function(SocketAckReceived value)? socketAckReceived,
    TResult? Function(TypingStarted value)? typingStarted,
    TResult? Function(TypingStopped value)? typingStopped,
    TResult? Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult? Function(TypingTextChanged value)? typingTextChanged,
    TResult? Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult? Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
  }) {
    return typingStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomStarted value)? started,
    TResult Function(LoadMoreRequested value)? loadMoreRequested,
    TResult Function(SendMessageRequested value)? sendMessageRequested,
    TResult Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult Function(SocketMessageReceived value)? socketMessageReceived,
    TResult Function(SocketMessageRead value)? socketMessageRead,
    TResult Function(SocketAckReceived value)? socketAckReceived,
    TResult Function(TypingStarted value)? typingStarted,
    TResult Function(TypingStopped value)? typingStopped,
    TResult Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult Function(TypingTextChanged value)? typingTextChanged,
    TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
    required TResult orElse(),
  }) {
    if (typingStarted != null) {
      return typingStarted(this);
    }
    return orElse();
  }
}

abstract class TypingStarted implements ChatRoomEvent {
  const factory TypingStarted(final String userId, final String username) =
      _$TypingStartedImpl;

  String get userId;
  String get username;

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TypingStartedImplCopyWith<_$TypingStartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TypingStoppedImplCopyWith<$Res> {
  factory _$$TypingStoppedImplCopyWith(
    _$TypingStoppedImpl value,
    $Res Function(_$TypingStoppedImpl) then,
  ) = __$$TypingStoppedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId});
}

/// @nodoc
class __$$TypingStoppedImplCopyWithImpl<$Res>
    extends _$ChatRoomEventCopyWithImpl<$Res, _$TypingStoppedImpl>
    implements _$$TypingStoppedImplCopyWith<$Res> {
  __$$TypingStoppedImplCopyWithImpl(
    _$TypingStoppedImpl _value,
    $Res Function(_$TypingStoppedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null}) {
    return _then(
      _$TypingStoppedImpl(
        null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$TypingStoppedImpl implements TypingStopped {
  const _$TypingStoppedImpl(this.userId);

  @override
  final String userId;

  @override
  String toString() {
    return 'ChatRoomEvent.typingStopped(userId: $userId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypingStoppedImpl &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TypingStoppedImplCopyWith<_$TypingStoppedImpl> get copyWith =>
      __$$TypingStoppedImplCopyWithImpl<_$TypingStoppedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, RoomListItemEntity? room) started,
    required TResult Function() loadMoreRequested,
    required TResult Function(String text) sendMessageRequested,
    required TResult Function() deleteRoomRequested,
    required TResult Function() leaveRoomRequested,
    required TResult Function(MessageEntity message) socketMessageReceived,
    required TResult Function(String userId) socketMessageRead,
    required TResult Function(String tempId, Map<String, dynamic> ack)
    socketAckReceived,
    required TResult Function(String userId, String username) typingStarted,
    required TResult Function(String userId) typingStopped,
    required TResult Function(
      String userId,
      UserStatus status,
      DateTime? lastSeen,
    )
    presenceUpdated,
    required TResult Function(String text) typingTextChanged,
    required TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )
    participantsStatusSnapshotReceived,
    required TResult Function() roomRemovedRemotely,
  }) {
    return typingStopped(userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, RoomListItemEntity? room)? started,
    TResult? Function()? loadMoreRequested,
    TResult? Function(String text)? sendMessageRequested,
    TResult? Function()? deleteRoomRequested,
    TResult? Function()? leaveRoomRequested,
    TResult? Function(MessageEntity message)? socketMessageReceived,
    TResult? Function(String userId)? socketMessageRead,
    TResult? Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult? Function(String userId, String username)? typingStarted,
    TResult? Function(String userId)? typingStopped,
    TResult? Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult? Function(String text)? typingTextChanged,
    TResult? Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult? Function()? roomRemovedRemotely,
  }) {
    return typingStopped?.call(userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, RoomListItemEntity? room)? started,
    TResult Function()? loadMoreRequested,
    TResult Function(String text)? sendMessageRequested,
    TResult Function()? deleteRoomRequested,
    TResult Function()? leaveRoomRequested,
    TResult Function(MessageEntity message)? socketMessageReceived,
    TResult Function(String userId)? socketMessageRead,
    TResult Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult Function(String userId, String username)? typingStarted,
    TResult Function(String userId)? typingStopped,
    TResult Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult Function(String text)? typingTextChanged,
    TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult Function()? roomRemovedRemotely,
    required TResult orElse(),
  }) {
    if (typingStopped != null) {
      return typingStopped(userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatRoomStarted value) started,
    required TResult Function(LoadMoreRequested value) loadMoreRequested,
    required TResult Function(SendMessageRequested value) sendMessageRequested,
    required TResult Function(DeleteRoomRequested value) deleteRoomRequested,
    required TResult Function(LeaveRoomRequested value) leaveRoomRequested,
    required TResult Function(SocketMessageReceived value)
    socketMessageReceived,
    required TResult Function(SocketMessageRead value) socketMessageRead,
    required TResult Function(SocketAckReceived value) socketAckReceived,
    required TResult Function(TypingStarted value) typingStarted,
    required TResult Function(TypingStopped value) typingStopped,
    required TResult Function(ChatRoomPresenceUpdated value) presenceUpdated,
    required TResult Function(TypingTextChanged value) typingTextChanged,
    required TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)
    participantsStatusSnapshotReceived,
    required TResult Function(ChatRoomRoomRemovedRemotely value)
    roomRemovedRemotely,
  }) {
    return typingStopped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatRoomStarted value)? started,
    TResult? Function(LoadMoreRequested value)? loadMoreRequested,
    TResult? Function(SendMessageRequested value)? sendMessageRequested,
    TResult? Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult? Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult? Function(SocketMessageReceived value)? socketMessageReceived,
    TResult? Function(SocketMessageRead value)? socketMessageRead,
    TResult? Function(SocketAckReceived value)? socketAckReceived,
    TResult? Function(TypingStarted value)? typingStarted,
    TResult? Function(TypingStopped value)? typingStopped,
    TResult? Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult? Function(TypingTextChanged value)? typingTextChanged,
    TResult? Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult? Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
  }) {
    return typingStopped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomStarted value)? started,
    TResult Function(LoadMoreRequested value)? loadMoreRequested,
    TResult Function(SendMessageRequested value)? sendMessageRequested,
    TResult Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult Function(SocketMessageReceived value)? socketMessageReceived,
    TResult Function(SocketMessageRead value)? socketMessageRead,
    TResult Function(SocketAckReceived value)? socketAckReceived,
    TResult Function(TypingStarted value)? typingStarted,
    TResult Function(TypingStopped value)? typingStopped,
    TResult Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult Function(TypingTextChanged value)? typingTextChanged,
    TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
    required TResult orElse(),
  }) {
    if (typingStopped != null) {
      return typingStopped(this);
    }
    return orElse();
  }
}

abstract class TypingStopped implements ChatRoomEvent {
  const factory TypingStopped(final String userId) = _$TypingStoppedImpl;

  String get userId;

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TypingStoppedImplCopyWith<_$TypingStoppedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatRoomPresenceUpdatedImplCopyWith<$Res> {
  factory _$$ChatRoomPresenceUpdatedImplCopyWith(
    _$ChatRoomPresenceUpdatedImpl value,
    $Res Function(_$ChatRoomPresenceUpdatedImpl) then,
  ) = __$$ChatRoomPresenceUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, UserStatus status, DateTime? lastSeen});
}

/// @nodoc
class __$$ChatRoomPresenceUpdatedImplCopyWithImpl<$Res>
    extends _$ChatRoomEventCopyWithImpl<$Res, _$ChatRoomPresenceUpdatedImpl>
    implements _$$ChatRoomPresenceUpdatedImplCopyWith<$Res> {
  __$$ChatRoomPresenceUpdatedImplCopyWithImpl(
    _$ChatRoomPresenceUpdatedImpl _value,
    $Res Function(_$ChatRoomPresenceUpdatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? status = null,
    Object? lastSeen = freezed,
  }) {
    return _then(
      _$ChatRoomPresenceUpdatedImpl(
        null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as UserStatus,
        freezed == lastSeen
            ? _value.lastSeen
            : lastSeen // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$ChatRoomPresenceUpdatedImpl implements ChatRoomPresenceUpdated {
  const _$ChatRoomPresenceUpdatedImpl(this.userId, this.status, this.lastSeen);

  @override
  final String userId;
  @override
  final UserStatus status;
  @override
  final DateTime? lastSeen;

  @override
  String toString() {
    return 'ChatRoomEvent.presenceUpdated(userId: $userId, status: $status, lastSeen: $lastSeen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomPresenceUpdatedImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen));
  }

  @override
  int get hashCode => Object.hash(runtimeType, userId, status, lastSeen);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomPresenceUpdatedImplCopyWith<_$ChatRoomPresenceUpdatedImpl>
  get copyWith =>
      __$$ChatRoomPresenceUpdatedImplCopyWithImpl<
        _$ChatRoomPresenceUpdatedImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, RoomListItemEntity? room) started,
    required TResult Function() loadMoreRequested,
    required TResult Function(String text) sendMessageRequested,
    required TResult Function() deleteRoomRequested,
    required TResult Function() leaveRoomRequested,
    required TResult Function(MessageEntity message) socketMessageReceived,
    required TResult Function(String userId) socketMessageRead,
    required TResult Function(String tempId, Map<String, dynamic> ack)
    socketAckReceived,
    required TResult Function(String userId, String username) typingStarted,
    required TResult Function(String userId) typingStopped,
    required TResult Function(
      String userId,
      UserStatus status,
      DateTime? lastSeen,
    )
    presenceUpdated,
    required TResult Function(String text) typingTextChanged,
    required TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )
    participantsStatusSnapshotReceived,
    required TResult Function() roomRemovedRemotely,
  }) {
    return presenceUpdated(userId, status, lastSeen);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, RoomListItemEntity? room)? started,
    TResult? Function()? loadMoreRequested,
    TResult? Function(String text)? sendMessageRequested,
    TResult? Function()? deleteRoomRequested,
    TResult? Function()? leaveRoomRequested,
    TResult? Function(MessageEntity message)? socketMessageReceived,
    TResult? Function(String userId)? socketMessageRead,
    TResult? Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult? Function(String userId, String username)? typingStarted,
    TResult? Function(String userId)? typingStopped,
    TResult? Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult? Function(String text)? typingTextChanged,
    TResult? Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult? Function()? roomRemovedRemotely,
  }) {
    return presenceUpdated?.call(userId, status, lastSeen);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, RoomListItemEntity? room)? started,
    TResult Function()? loadMoreRequested,
    TResult Function(String text)? sendMessageRequested,
    TResult Function()? deleteRoomRequested,
    TResult Function()? leaveRoomRequested,
    TResult Function(MessageEntity message)? socketMessageReceived,
    TResult Function(String userId)? socketMessageRead,
    TResult Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult Function(String userId, String username)? typingStarted,
    TResult Function(String userId)? typingStopped,
    TResult Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult Function(String text)? typingTextChanged,
    TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult Function()? roomRemovedRemotely,
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
    required TResult Function(ChatRoomStarted value) started,
    required TResult Function(LoadMoreRequested value) loadMoreRequested,
    required TResult Function(SendMessageRequested value) sendMessageRequested,
    required TResult Function(DeleteRoomRequested value) deleteRoomRequested,
    required TResult Function(LeaveRoomRequested value) leaveRoomRequested,
    required TResult Function(SocketMessageReceived value)
    socketMessageReceived,
    required TResult Function(SocketMessageRead value) socketMessageRead,
    required TResult Function(SocketAckReceived value) socketAckReceived,
    required TResult Function(TypingStarted value) typingStarted,
    required TResult Function(TypingStopped value) typingStopped,
    required TResult Function(ChatRoomPresenceUpdated value) presenceUpdated,
    required TResult Function(TypingTextChanged value) typingTextChanged,
    required TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)
    participantsStatusSnapshotReceived,
    required TResult Function(ChatRoomRoomRemovedRemotely value)
    roomRemovedRemotely,
  }) {
    return presenceUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatRoomStarted value)? started,
    TResult? Function(LoadMoreRequested value)? loadMoreRequested,
    TResult? Function(SendMessageRequested value)? sendMessageRequested,
    TResult? Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult? Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult? Function(SocketMessageReceived value)? socketMessageReceived,
    TResult? Function(SocketMessageRead value)? socketMessageRead,
    TResult? Function(SocketAckReceived value)? socketAckReceived,
    TResult? Function(TypingStarted value)? typingStarted,
    TResult? Function(TypingStopped value)? typingStopped,
    TResult? Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult? Function(TypingTextChanged value)? typingTextChanged,
    TResult? Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult? Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
  }) {
    return presenceUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomStarted value)? started,
    TResult Function(LoadMoreRequested value)? loadMoreRequested,
    TResult Function(SendMessageRequested value)? sendMessageRequested,
    TResult Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult Function(SocketMessageReceived value)? socketMessageReceived,
    TResult Function(SocketMessageRead value)? socketMessageRead,
    TResult Function(SocketAckReceived value)? socketAckReceived,
    TResult Function(TypingStarted value)? typingStarted,
    TResult Function(TypingStopped value)? typingStopped,
    TResult Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult Function(TypingTextChanged value)? typingTextChanged,
    TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
    required TResult orElse(),
  }) {
    if (presenceUpdated != null) {
      return presenceUpdated(this);
    }
    return orElse();
  }
}

abstract class ChatRoomPresenceUpdated implements ChatRoomEvent {
  const factory ChatRoomPresenceUpdated(
    final String userId,
    final UserStatus status,
    final DateTime? lastSeen,
  ) = _$ChatRoomPresenceUpdatedImpl;

  String get userId;
  UserStatus get status;
  DateTime? get lastSeen;

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatRoomPresenceUpdatedImplCopyWith<_$ChatRoomPresenceUpdatedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TypingTextChangedImplCopyWith<$Res> {
  factory _$$TypingTextChangedImplCopyWith(
    _$TypingTextChangedImpl value,
    $Res Function(_$TypingTextChangedImpl) then,
  ) = __$$TypingTextChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String text});
}

/// @nodoc
class __$$TypingTextChangedImplCopyWithImpl<$Res>
    extends _$ChatRoomEventCopyWithImpl<$Res, _$TypingTextChangedImpl>
    implements _$$TypingTextChangedImplCopyWith<$Res> {
  __$$TypingTextChangedImplCopyWithImpl(
    _$TypingTextChangedImpl _value,
    $Res Function(_$TypingTextChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? text = null}) {
    return _then(
      _$TypingTextChangedImpl(
        null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$TypingTextChangedImpl implements TypingTextChanged {
  const _$TypingTextChangedImpl(this.text);

  @override
  final String text;

  @override
  String toString() {
    return 'ChatRoomEvent.typingTextChanged(text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TypingTextChangedImpl &&
            (identical(other.text, text) || other.text == text));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TypingTextChangedImplCopyWith<_$TypingTextChangedImpl> get copyWith =>
      __$$TypingTextChangedImplCopyWithImpl<_$TypingTextChangedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, RoomListItemEntity? room) started,
    required TResult Function() loadMoreRequested,
    required TResult Function(String text) sendMessageRequested,
    required TResult Function() deleteRoomRequested,
    required TResult Function() leaveRoomRequested,
    required TResult Function(MessageEntity message) socketMessageReceived,
    required TResult Function(String userId) socketMessageRead,
    required TResult Function(String tempId, Map<String, dynamic> ack)
    socketAckReceived,
    required TResult Function(String userId, String username) typingStarted,
    required TResult Function(String userId) typingStopped,
    required TResult Function(
      String userId,
      UserStatus status,
      DateTime? lastSeen,
    )
    presenceUpdated,
    required TResult Function(String text) typingTextChanged,
    required TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )
    participantsStatusSnapshotReceived,
    required TResult Function() roomRemovedRemotely,
  }) {
    return typingTextChanged(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, RoomListItemEntity? room)? started,
    TResult? Function()? loadMoreRequested,
    TResult? Function(String text)? sendMessageRequested,
    TResult? Function()? deleteRoomRequested,
    TResult? Function()? leaveRoomRequested,
    TResult? Function(MessageEntity message)? socketMessageReceived,
    TResult? Function(String userId)? socketMessageRead,
    TResult? Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult? Function(String userId, String username)? typingStarted,
    TResult? Function(String userId)? typingStopped,
    TResult? Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult? Function(String text)? typingTextChanged,
    TResult? Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult? Function()? roomRemovedRemotely,
  }) {
    return typingTextChanged?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, RoomListItemEntity? room)? started,
    TResult Function()? loadMoreRequested,
    TResult Function(String text)? sendMessageRequested,
    TResult Function()? deleteRoomRequested,
    TResult Function()? leaveRoomRequested,
    TResult Function(MessageEntity message)? socketMessageReceived,
    TResult Function(String userId)? socketMessageRead,
    TResult Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult Function(String userId, String username)? typingStarted,
    TResult Function(String userId)? typingStopped,
    TResult Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult Function(String text)? typingTextChanged,
    TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult Function()? roomRemovedRemotely,
    required TResult orElse(),
  }) {
    if (typingTextChanged != null) {
      return typingTextChanged(text);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatRoomStarted value) started,
    required TResult Function(LoadMoreRequested value) loadMoreRequested,
    required TResult Function(SendMessageRequested value) sendMessageRequested,
    required TResult Function(DeleteRoomRequested value) deleteRoomRequested,
    required TResult Function(LeaveRoomRequested value) leaveRoomRequested,
    required TResult Function(SocketMessageReceived value)
    socketMessageReceived,
    required TResult Function(SocketMessageRead value) socketMessageRead,
    required TResult Function(SocketAckReceived value) socketAckReceived,
    required TResult Function(TypingStarted value) typingStarted,
    required TResult Function(TypingStopped value) typingStopped,
    required TResult Function(ChatRoomPresenceUpdated value) presenceUpdated,
    required TResult Function(TypingTextChanged value) typingTextChanged,
    required TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)
    participantsStatusSnapshotReceived,
    required TResult Function(ChatRoomRoomRemovedRemotely value)
    roomRemovedRemotely,
  }) {
    return typingTextChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatRoomStarted value)? started,
    TResult? Function(LoadMoreRequested value)? loadMoreRequested,
    TResult? Function(SendMessageRequested value)? sendMessageRequested,
    TResult? Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult? Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult? Function(SocketMessageReceived value)? socketMessageReceived,
    TResult? Function(SocketMessageRead value)? socketMessageRead,
    TResult? Function(SocketAckReceived value)? socketAckReceived,
    TResult? Function(TypingStarted value)? typingStarted,
    TResult? Function(TypingStopped value)? typingStopped,
    TResult? Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult? Function(TypingTextChanged value)? typingTextChanged,
    TResult? Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult? Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
  }) {
    return typingTextChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomStarted value)? started,
    TResult Function(LoadMoreRequested value)? loadMoreRequested,
    TResult Function(SendMessageRequested value)? sendMessageRequested,
    TResult Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult Function(SocketMessageReceived value)? socketMessageReceived,
    TResult Function(SocketMessageRead value)? socketMessageRead,
    TResult Function(SocketAckReceived value)? socketAckReceived,
    TResult Function(TypingStarted value)? typingStarted,
    TResult Function(TypingStopped value)? typingStopped,
    TResult Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult Function(TypingTextChanged value)? typingTextChanged,
    TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
    required TResult orElse(),
  }) {
    if (typingTextChanged != null) {
      return typingTextChanged(this);
    }
    return orElse();
  }
}

abstract class TypingTextChanged implements ChatRoomEvent {
  const factory TypingTextChanged(final String text) = _$TypingTextChangedImpl;

  String get text;

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TypingTextChangedImplCopyWith<_$TypingTextChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatRoomParticipantsStatusSnapshotReceivedImplCopyWith<$Res> {
  factory _$$ChatRoomParticipantsStatusSnapshotReceivedImplCopyWith(
    _$ChatRoomParticipantsStatusSnapshotReceivedImpl value,
    $Res Function(_$ChatRoomParticipantsStatusSnapshotReceivedImpl) then,
  ) = __$$ChatRoomParticipantsStatusSnapshotReceivedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    Map<String, UserStatus> statusMap,
    Map<String, DateTime> lastSeenMap,
  });
}

/// @nodoc
class __$$ChatRoomParticipantsStatusSnapshotReceivedImplCopyWithImpl<$Res>
    extends
        _$ChatRoomEventCopyWithImpl<
          $Res,
          _$ChatRoomParticipantsStatusSnapshotReceivedImpl
        >
    implements _$$ChatRoomParticipantsStatusSnapshotReceivedImplCopyWith<$Res> {
  __$$ChatRoomParticipantsStatusSnapshotReceivedImplCopyWithImpl(
    _$ChatRoomParticipantsStatusSnapshotReceivedImpl _value,
    $Res Function(_$ChatRoomParticipantsStatusSnapshotReceivedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? statusMap = null, Object? lastSeenMap = null}) {
    return _then(
      _$ChatRoomParticipantsStatusSnapshotReceivedImpl(
        null == statusMap
            ? _value._statusMap
            : statusMap // ignore: cast_nullable_to_non_nullable
                  as Map<String, UserStatus>,
        null == lastSeenMap
            ? _value._lastSeenMap
            : lastSeenMap // ignore: cast_nullable_to_non_nullable
                  as Map<String, DateTime>,
      ),
    );
  }
}

/// @nodoc

class _$ChatRoomParticipantsStatusSnapshotReceivedImpl
    implements ChatRoomParticipantsStatusSnapshotReceived {
  const _$ChatRoomParticipantsStatusSnapshotReceivedImpl(
    final Map<String, UserStatus> statusMap,
    final Map<String, DateTime> lastSeenMap,
  ) : _statusMap = statusMap,
      _lastSeenMap = lastSeenMap;

  final Map<String, UserStatus> _statusMap;
  @override
  Map<String, UserStatus> get statusMap {
    if (_statusMap is EqualUnmodifiableMapView) return _statusMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_statusMap);
  }

  final Map<String, DateTime> _lastSeenMap;
  @override
  Map<String, DateTime> get lastSeenMap {
    if (_lastSeenMap is EqualUnmodifiableMapView) return _lastSeenMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_lastSeenMap);
  }

  @override
  String toString() {
    return 'ChatRoomEvent.participantsStatusSnapshotReceived(statusMap: $statusMap, lastSeenMap: $lastSeenMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomParticipantsStatusSnapshotReceivedImpl &&
            const DeepCollectionEquality().equals(
              other._statusMap,
              _statusMap,
            ) &&
            const DeepCollectionEquality().equals(
              other._lastSeenMap,
              _lastSeenMap,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_statusMap),
    const DeepCollectionEquality().hash(_lastSeenMap),
  );

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomParticipantsStatusSnapshotReceivedImplCopyWith<
    _$ChatRoomParticipantsStatusSnapshotReceivedImpl
  >
  get copyWith =>
      __$$ChatRoomParticipantsStatusSnapshotReceivedImplCopyWithImpl<
        _$ChatRoomParticipantsStatusSnapshotReceivedImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, RoomListItemEntity? room) started,
    required TResult Function() loadMoreRequested,
    required TResult Function(String text) sendMessageRequested,
    required TResult Function() deleteRoomRequested,
    required TResult Function() leaveRoomRequested,
    required TResult Function(MessageEntity message) socketMessageReceived,
    required TResult Function(String userId) socketMessageRead,
    required TResult Function(String tempId, Map<String, dynamic> ack)
    socketAckReceived,
    required TResult Function(String userId, String username) typingStarted,
    required TResult Function(String userId) typingStopped,
    required TResult Function(
      String userId,
      UserStatus status,
      DateTime? lastSeen,
    )
    presenceUpdated,
    required TResult Function(String text) typingTextChanged,
    required TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )
    participantsStatusSnapshotReceived,
    required TResult Function() roomRemovedRemotely,
  }) {
    return participantsStatusSnapshotReceived(statusMap, lastSeenMap);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, RoomListItemEntity? room)? started,
    TResult? Function()? loadMoreRequested,
    TResult? Function(String text)? sendMessageRequested,
    TResult? Function()? deleteRoomRequested,
    TResult? Function()? leaveRoomRequested,
    TResult? Function(MessageEntity message)? socketMessageReceived,
    TResult? Function(String userId)? socketMessageRead,
    TResult? Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult? Function(String userId, String username)? typingStarted,
    TResult? Function(String userId)? typingStopped,
    TResult? Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult? Function(String text)? typingTextChanged,
    TResult? Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult? Function()? roomRemovedRemotely,
  }) {
    return participantsStatusSnapshotReceived?.call(statusMap, lastSeenMap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, RoomListItemEntity? room)? started,
    TResult Function()? loadMoreRequested,
    TResult Function(String text)? sendMessageRequested,
    TResult Function()? deleteRoomRequested,
    TResult Function()? leaveRoomRequested,
    TResult Function(MessageEntity message)? socketMessageReceived,
    TResult Function(String userId)? socketMessageRead,
    TResult Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult Function(String userId, String username)? typingStarted,
    TResult Function(String userId)? typingStopped,
    TResult Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult Function(String text)? typingTextChanged,
    TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult Function()? roomRemovedRemotely,
    required TResult orElse(),
  }) {
    if (participantsStatusSnapshotReceived != null) {
      return participantsStatusSnapshotReceived(statusMap, lastSeenMap);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatRoomStarted value) started,
    required TResult Function(LoadMoreRequested value) loadMoreRequested,
    required TResult Function(SendMessageRequested value) sendMessageRequested,
    required TResult Function(DeleteRoomRequested value) deleteRoomRequested,
    required TResult Function(LeaveRoomRequested value) leaveRoomRequested,
    required TResult Function(SocketMessageReceived value)
    socketMessageReceived,
    required TResult Function(SocketMessageRead value) socketMessageRead,
    required TResult Function(SocketAckReceived value) socketAckReceived,
    required TResult Function(TypingStarted value) typingStarted,
    required TResult Function(TypingStopped value) typingStopped,
    required TResult Function(ChatRoomPresenceUpdated value) presenceUpdated,
    required TResult Function(TypingTextChanged value) typingTextChanged,
    required TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)
    participantsStatusSnapshotReceived,
    required TResult Function(ChatRoomRoomRemovedRemotely value)
    roomRemovedRemotely,
  }) {
    return participantsStatusSnapshotReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatRoomStarted value)? started,
    TResult? Function(LoadMoreRequested value)? loadMoreRequested,
    TResult? Function(SendMessageRequested value)? sendMessageRequested,
    TResult? Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult? Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult? Function(SocketMessageReceived value)? socketMessageReceived,
    TResult? Function(SocketMessageRead value)? socketMessageRead,
    TResult? Function(SocketAckReceived value)? socketAckReceived,
    TResult? Function(TypingStarted value)? typingStarted,
    TResult? Function(TypingStopped value)? typingStopped,
    TResult? Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult? Function(TypingTextChanged value)? typingTextChanged,
    TResult? Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult? Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
  }) {
    return participantsStatusSnapshotReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomStarted value)? started,
    TResult Function(LoadMoreRequested value)? loadMoreRequested,
    TResult Function(SendMessageRequested value)? sendMessageRequested,
    TResult Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult Function(SocketMessageReceived value)? socketMessageReceived,
    TResult Function(SocketMessageRead value)? socketMessageRead,
    TResult Function(SocketAckReceived value)? socketAckReceived,
    TResult Function(TypingStarted value)? typingStarted,
    TResult Function(TypingStopped value)? typingStopped,
    TResult Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult Function(TypingTextChanged value)? typingTextChanged,
    TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
    required TResult orElse(),
  }) {
    if (participantsStatusSnapshotReceived != null) {
      return participantsStatusSnapshotReceived(this);
    }
    return orElse();
  }
}

abstract class ChatRoomParticipantsStatusSnapshotReceived
    implements ChatRoomEvent {
  const factory ChatRoomParticipantsStatusSnapshotReceived(
    final Map<String, UserStatus> statusMap,
    final Map<String, DateTime> lastSeenMap,
  ) = _$ChatRoomParticipantsStatusSnapshotReceivedImpl;

  Map<String, UserStatus> get statusMap;
  Map<String, DateTime> get lastSeenMap;

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatRoomParticipantsStatusSnapshotReceivedImplCopyWith<
    _$ChatRoomParticipantsStatusSnapshotReceivedImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChatRoomRoomRemovedRemotelyImplCopyWith<$Res> {
  factory _$$ChatRoomRoomRemovedRemotelyImplCopyWith(
    _$ChatRoomRoomRemovedRemotelyImpl value,
    $Res Function(_$ChatRoomRoomRemovedRemotelyImpl) then,
  ) = __$$ChatRoomRoomRemovedRemotelyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ChatRoomRoomRemovedRemotelyImplCopyWithImpl<$Res>
    extends _$ChatRoomEventCopyWithImpl<$Res, _$ChatRoomRoomRemovedRemotelyImpl>
    implements _$$ChatRoomRoomRemovedRemotelyImplCopyWith<$Res> {
  __$$ChatRoomRoomRemovedRemotelyImplCopyWithImpl(
    _$ChatRoomRoomRemovedRemotelyImpl _value,
    $Res Function(_$ChatRoomRoomRemovedRemotelyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRoomEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ChatRoomRoomRemovedRemotelyImpl implements ChatRoomRoomRemovedRemotely {
  const _$ChatRoomRoomRemovedRemotelyImpl();

  @override
  String toString() {
    return 'ChatRoomEvent.roomRemovedRemotely()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomRoomRemovedRemotelyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String roomId, RoomListItemEntity? room) started,
    required TResult Function() loadMoreRequested,
    required TResult Function(String text) sendMessageRequested,
    required TResult Function() deleteRoomRequested,
    required TResult Function() leaveRoomRequested,
    required TResult Function(MessageEntity message) socketMessageReceived,
    required TResult Function(String userId) socketMessageRead,
    required TResult Function(String tempId, Map<String, dynamic> ack)
    socketAckReceived,
    required TResult Function(String userId, String username) typingStarted,
    required TResult Function(String userId) typingStopped,
    required TResult Function(
      String userId,
      UserStatus status,
      DateTime? lastSeen,
    )
    presenceUpdated,
    required TResult Function(String text) typingTextChanged,
    required TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )
    participantsStatusSnapshotReceived,
    required TResult Function() roomRemovedRemotely,
  }) {
    return roomRemovedRemotely();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId, RoomListItemEntity? room)? started,
    TResult? Function()? loadMoreRequested,
    TResult? Function(String text)? sendMessageRequested,
    TResult? Function()? deleteRoomRequested,
    TResult? Function()? leaveRoomRequested,
    TResult? Function(MessageEntity message)? socketMessageReceived,
    TResult? Function(String userId)? socketMessageRead,
    TResult? Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult? Function(String userId, String username)? typingStarted,
    TResult? Function(String userId)? typingStopped,
    TResult? Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult? Function(String text)? typingTextChanged,
    TResult? Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult? Function()? roomRemovedRemotely,
  }) {
    return roomRemovedRemotely?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId, RoomListItemEntity? room)? started,
    TResult Function()? loadMoreRequested,
    TResult Function(String text)? sendMessageRequested,
    TResult Function()? deleteRoomRequested,
    TResult Function()? leaveRoomRequested,
    TResult Function(MessageEntity message)? socketMessageReceived,
    TResult Function(String userId)? socketMessageRead,
    TResult Function(String tempId, Map<String, dynamic> ack)?
    socketAckReceived,
    TResult Function(String userId, String username)? typingStarted,
    TResult Function(String userId)? typingStopped,
    TResult Function(String userId, UserStatus status, DateTime? lastSeen)?
    presenceUpdated,
    TResult Function(String text)? typingTextChanged,
    TResult Function(
      Map<String, UserStatus> statusMap,
      Map<String, DateTime> lastSeenMap,
    )?
    participantsStatusSnapshotReceived,
    TResult Function()? roomRemovedRemotely,
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
    required TResult Function(ChatRoomStarted value) started,
    required TResult Function(LoadMoreRequested value) loadMoreRequested,
    required TResult Function(SendMessageRequested value) sendMessageRequested,
    required TResult Function(DeleteRoomRequested value) deleteRoomRequested,
    required TResult Function(LeaveRoomRequested value) leaveRoomRequested,
    required TResult Function(SocketMessageReceived value)
    socketMessageReceived,
    required TResult Function(SocketMessageRead value) socketMessageRead,
    required TResult Function(SocketAckReceived value) socketAckReceived,
    required TResult Function(TypingStarted value) typingStarted,
    required TResult Function(TypingStopped value) typingStopped,
    required TResult Function(ChatRoomPresenceUpdated value) presenceUpdated,
    required TResult Function(TypingTextChanged value) typingTextChanged,
    required TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)
    participantsStatusSnapshotReceived,
    required TResult Function(ChatRoomRoomRemovedRemotely value)
    roomRemovedRemotely,
  }) {
    return roomRemovedRemotely(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatRoomStarted value)? started,
    TResult? Function(LoadMoreRequested value)? loadMoreRequested,
    TResult? Function(SendMessageRequested value)? sendMessageRequested,
    TResult? Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult? Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult? Function(SocketMessageReceived value)? socketMessageReceived,
    TResult? Function(SocketMessageRead value)? socketMessageRead,
    TResult? Function(SocketAckReceived value)? socketAckReceived,
    TResult? Function(TypingStarted value)? typingStarted,
    TResult? Function(TypingStopped value)? typingStopped,
    TResult? Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult? Function(TypingTextChanged value)? typingTextChanged,
    TResult? Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult? Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
  }) {
    return roomRemovedRemotely?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomStarted value)? started,
    TResult Function(LoadMoreRequested value)? loadMoreRequested,
    TResult Function(SendMessageRequested value)? sendMessageRequested,
    TResult Function(DeleteRoomRequested value)? deleteRoomRequested,
    TResult Function(LeaveRoomRequested value)? leaveRoomRequested,
    TResult Function(SocketMessageReceived value)? socketMessageReceived,
    TResult Function(SocketMessageRead value)? socketMessageRead,
    TResult Function(SocketAckReceived value)? socketAckReceived,
    TResult Function(TypingStarted value)? typingStarted,
    TResult Function(TypingStopped value)? typingStopped,
    TResult Function(ChatRoomPresenceUpdated value)? presenceUpdated,
    TResult Function(TypingTextChanged value)? typingTextChanged,
    TResult Function(ChatRoomParticipantsStatusSnapshotReceived value)?
    participantsStatusSnapshotReceived,
    TResult Function(ChatRoomRoomRemovedRemotely value)? roomRemovedRemotely,
    required TResult orElse(),
  }) {
    if (roomRemovedRemotely != null) {
      return roomRemovedRemotely(this);
    }
    return orElse();
  }
}

abstract class ChatRoomRoomRemovedRemotely implements ChatRoomEvent {
  const factory ChatRoomRoomRemovedRemotely() =
      _$ChatRoomRoomRemovedRemotelyImpl;
}
