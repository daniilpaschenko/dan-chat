// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_room_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ChatRoomState {
  String get roomId => throw _privateConstructorUsedError;
  List<MessageEntity> get messages =>
      throw _privateConstructorUsedError; // от старых к новым
  bool get isInitialLoading => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  bool get isSending => throw _privateConstructorUsedError;
  String? get nextCursor => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  String? get errorMessage =>
      throw _privateConstructorUsedError; // userId -> username, кто сейчас печатает (кроме нас самих)
  Map<String, String> get typingUsers => throw _privateConstructorUsedError;
  Map<String, UserStatus> get participantsStatus =>
      throw _privateConstructorUsedError;
  Map<String, DateTime> get participantsLastSeen =>
      throw _privateConstructorUsedError;

  /// Create a copy of ChatRoomState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatRoomStateCopyWith<ChatRoomState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRoomStateCopyWith<$Res> {
  factory $ChatRoomStateCopyWith(
    ChatRoomState value,
    $Res Function(ChatRoomState) then,
  ) = _$ChatRoomStateCopyWithImpl<$Res, ChatRoomState>;
  @useResult
  $Res call({
    String roomId,
    List<MessageEntity> messages,
    bool isInitialLoading,
    bool isLoadingMore,
    bool isSending,
    String? nextCursor,
    bool hasMore,
    String? errorMessage,
    Map<String, String> typingUsers,
    Map<String, UserStatus> participantsStatus,
    Map<String, DateTime> participantsLastSeen,
  });
}

/// @nodoc
class _$ChatRoomStateCopyWithImpl<$Res, $Val extends ChatRoomState>
    implements $ChatRoomStateCopyWith<$Res> {
  _$ChatRoomStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatRoomState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? messages = null,
    Object? isInitialLoading = null,
    Object? isLoadingMore = null,
    Object? isSending = null,
    Object? nextCursor = freezed,
    Object? hasMore = null,
    Object? errorMessage = freezed,
    Object? typingUsers = null,
    Object? participantsStatus = null,
    Object? participantsLastSeen = null,
  }) {
    return _then(
      _value.copyWith(
            roomId: null == roomId
                ? _value.roomId
                : roomId // ignore: cast_nullable_to_non_nullable
                      as String,
            messages: null == messages
                ? _value.messages
                : messages // ignore: cast_nullable_to_non_nullable
                      as List<MessageEntity>,
            isInitialLoading: null == isInitialLoading
                ? _value.isInitialLoading
                : isInitialLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            isLoadingMore: null == isLoadingMore
                ? _value.isLoadingMore
                : isLoadingMore // ignore: cast_nullable_to_non_nullable
                      as bool,
            isSending: null == isSending
                ? _value.isSending
                : isSending // ignore: cast_nullable_to_non_nullable
                      as bool,
            nextCursor: freezed == nextCursor
                ? _value.nextCursor
                : nextCursor // ignore: cast_nullable_to_non_nullable
                      as String?,
            hasMore: null == hasMore
                ? _value.hasMore
                : hasMore // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            typingUsers: null == typingUsers
                ? _value.typingUsers
                : typingUsers // ignore: cast_nullable_to_non_nullable
                      as Map<String, String>,
            participantsStatus: null == participantsStatus
                ? _value.participantsStatus
                : participantsStatus // ignore: cast_nullable_to_non_nullable
                      as Map<String, UserStatus>,
            participantsLastSeen: null == participantsLastSeen
                ? _value.participantsLastSeen
                : participantsLastSeen // ignore: cast_nullable_to_non_nullable
                      as Map<String, DateTime>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatRoomStateImplCopyWith<$Res>
    implements $ChatRoomStateCopyWith<$Res> {
  factory _$$ChatRoomStateImplCopyWith(
    _$ChatRoomStateImpl value,
    $Res Function(_$ChatRoomStateImpl) then,
  ) = __$$ChatRoomStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String roomId,
    List<MessageEntity> messages,
    bool isInitialLoading,
    bool isLoadingMore,
    bool isSending,
    String? nextCursor,
    bool hasMore,
    String? errorMessage,
    Map<String, String> typingUsers,
    Map<String, UserStatus> participantsStatus,
    Map<String, DateTime> participantsLastSeen,
  });
}

/// @nodoc
class __$$ChatRoomStateImplCopyWithImpl<$Res>
    extends _$ChatRoomStateCopyWithImpl<$Res, _$ChatRoomStateImpl>
    implements _$$ChatRoomStateImplCopyWith<$Res> {
  __$$ChatRoomStateImplCopyWithImpl(
    _$ChatRoomStateImpl _value,
    $Res Function(_$ChatRoomStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatRoomState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? roomId = null,
    Object? messages = null,
    Object? isInitialLoading = null,
    Object? isLoadingMore = null,
    Object? isSending = null,
    Object? nextCursor = freezed,
    Object? hasMore = null,
    Object? errorMessage = freezed,
    Object? typingUsers = null,
    Object? participantsStatus = null,
    Object? participantsLastSeen = null,
  }) {
    return _then(
      _$ChatRoomStateImpl(
        roomId: null == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as String,
        messages: null == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                  as List<MessageEntity>,
        isInitialLoading: null == isInitialLoading
            ? _value.isInitialLoading
            : isInitialLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isLoadingMore: null == isLoadingMore
            ? _value.isLoadingMore
            : isLoadingMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        isSending: null == isSending
            ? _value.isSending
            : isSending // ignore: cast_nullable_to_non_nullable
                  as bool,
        nextCursor: freezed == nextCursor
            ? _value.nextCursor
            : nextCursor // ignore: cast_nullable_to_non_nullable
                  as String?,
        hasMore: null == hasMore
            ? _value.hasMore
            : hasMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        typingUsers: null == typingUsers
            ? _value._typingUsers
            : typingUsers // ignore: cast_nullable_to_non_nullable
                  as Map<String, String>,
        participantsStatus: null == participantsStatus
            ? _value._participantsStatus
            : participantsStatus // ignore: cast_nullable_to_non_nullable
                  as Map<String, UserStatus>,
        participantsLastSeen: null == participantsLastSeen
            ? _value._participantsLastSeen
            : participantsLastSeen // ignore: cast_nullable_to_non_nullable
                  as Map<String, DateTime>,
      ),
    );
  }
}

/// @nodoc

class _$ChatRoomStateImpl implements _ChatRoomState {
  const _$ChatRoomStateImpl({
    required this.roomId,
    final List<MessageEntity> messages = const [],
    this.isInitialLoading = false,
    this.isLoadingMore = false,
    this.isSending = false,
    this.nextCursor,
    this.hasMore = true,
    this.errorMessage,
    final Map<String, String> typingUsers = const {},
    final Map<String, UserStatus> participantsStatus = const {},
    final Map<String, DateTime> participantsLastSeen = const {},
  }) : _messages = messages,
       _typingUsers = typingUsers,
       _participantsStatus = participantsStatus,
       _participantsLastSeen = participantsLastSeen;

  @override
  final String roomId;
  final List<MessageEntity> _messages;
  @override
  @JsonKey()
  List<MessageEntity> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  // от старых к новым
  @override
  @JsonKey()
  final bool isInitialLoading;
  @override
  @JsonKey()
  final bool isLoadingMore;
  @override
  @JsonKey()
  final bool isSending;
  @override
  final String? nextCursor;
  @override
  @JsonKey()
  final bool hasMore;
  @override
  final String? errorMessage;
  // userId -> username, кто сейчас печатает (кроме нас самих)
  final Map<String, String> _typingUsers;
  // userId -> username, кто сейчас печатает (кроме нас самих)
  @override
  @JsonKey()
  Map<String, String> get typingUsers {
    if (_typingUsers is EqualUnmodifiableMapView) return _typingUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_typingUsers);
  }

  final Map<String, UserStatus> _participantsStatus;
  @override
  @JsonKey()
  Map<String, UserStatus> get participantsStatus {
    if (_participantsStatus is EqualUnmodifiableMapView)
      return _participantsStatus;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_participantsStatus);
  }

  final Map<String, DateTime> _participantsLastSeen;
  @override
  @JsonKey()
  Map<String, DateTime> get participantsLastSeen {
    if (_participantsLastSeen is EqualUnmodifiableMapView)
      return _participantsLastSeen;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_participantsLastSeen);
  }

  @override
  String toString() {
    return 'ChatRoomState(roomId: $roomId, messages: $messages, isInitialLoading: $isInitialLoading, isLoadingMore: $isLoadingMore, isSending: $isSending, nextCursor: $nextCursor, hasMore: $hasMore, errorMessage: $errorMessage, typingUsers: $typingUsers, participantsStatus: $participantsStatus, participantsLastSeen: $participantsLastSeen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomStateImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId) &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.isInitialLoading, isInitialLoading) ||
                other.isInitialLoading == isInitialLoading) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.isSending, isSending) ||
                other.isSending == isSending) &&
            (identical(other.nextCursor, nextCursor) ||
                other.nextCursor == nextCursor) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            const DeepCollectionEquality().equals(
              other._typingUsers,
              _typingUsers,
            ) &&
            const DeepCollectionEquality().equals(
              other._participantsStatus,
              _participantsStatus,
            ) &&
            const DeepCollectionEquality().equals(
              other._participantsLastSeen,
              _participantsLastSeen,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    roomId,
    const DeepCollectionEquality().hash(_messages),
    isInitialLoading,
    isLoadingMore,
    isSending,
    nextCursor,
    hasMore,
    errorMessage,
    const DeepCollectionEquality().hash(_typingUsers),
    const DeepCollectionEquality().hash(_participantsStatus),
    const DeepCollectionEquality().hash(_participantsLastSeen),
  );

  /// Create a copy of ChatRoomState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRoomStateImplCopyWith<_$ChatRoomStateImpl> get copyWith =>
      __$$ChatRoomStateImplCopyWithImpl<_$ChatRoomStateImpl>(this, _$identity);
}

abstract class _ChatRoomState implements ChatRoomState {
  const factory _ChatRoomState({
    required final String roomId,
    final List<MessageEntity> messages,
    final bool isInitialLoading,
    final bool isLoadingMore,
    final bool isSending,
    final String? nextCursor,
    final bool hasMore,
    final String? errorMessage,
    final Map<String, String> typingUsers,
    final Map<String, UserStatus> participantsStatus,
    final Map<String, DateTime> participantsLastSeen,
  }) = _$ChatRoomStateImpl;

  @override
  String get roomId;
  @override
  List<MessageEntity> get messages; // от старых к новым
  @override
  bool get isInitialLoading;
  @override
  bool get isLoadingMore;
  @override
  bool get isSending;
  @override
  String? get nextCursor;
  @override
  bool get hasMore;
  @override
  String? get errorMessage; // userId -> username, кто сейчас печатает (кроме нас самих)
  @override
  Map<String, String> get typingUsers;
  @override
  Map<String, UserStatus> get participantsStatus;
  @override
  Map<String, DateTime> get participantsLastSeen;

  /// Create a copy of ChatRoomState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatRoomStateImplCopyWith<_$ChatRoomStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
