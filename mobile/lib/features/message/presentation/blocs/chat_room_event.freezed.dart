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
    required TResult Function(String roomId) started,
    required TResult Function() loadMoreRequested,
    required TResult Function(String text) sendMessageRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId)? started,
    TResult? Function()? loadMoreRequested,
    TResult? Function(String text)? sendMessageRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId)? started,
    TResult Function()? loadMoreRequested,
    TResult Function(String text)? sendMessageRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatRoomStarted value) started,
    required TResult Function(LoadMoreRequested value) loadMoreRequested,
    required TResult Function(SendMessageRequested value) sendMessageRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatRoomStarted value)? started,
    TResult? Function(LoadMoreRequested value)? loadMoreRequested,
    TResult? Function(SendMessageRequested value)? sendMessageRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomStarted value)? started,
    TResult Function(LoadMoreRequested value)? loadMoreRequested,
    TResult Function(SendMessageRequested value)? sendMessageRequested,
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
  $Res call({String roomId});
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
  $Res call({Object? roomId = null}) {
    return _then(
      _$ChatRoomStartedImpl(
        null == roomId
            ? _value.roomId
            : roomId // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ChatRoomStartedImpl implements ChatRoomStarted {
  const _$ChatRoomStartedImpl(this.roomId);

  @override
  final String roomId;

  @override
  String toString() {
    return 'ChatRoomEvent.started(roomId: $roomId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRoomStartedImpl &&
            (identical(other.roomId, roomId) || other.roomId == roomId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, roomId);

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
    required TResult Function(String roomId) started,
    required TResult Function() loadMoreRequested,
    required TResult Function(String text) sendMessageRequested,
  }) {
    return started(roomId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId)? started,
    TResult? Function()? loadMoreRequested,
    TResult? Function(String text)? sendMessageRequested,
  }) {
    return started?.call(roomId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId)? started,
    TResult Function()? loadMoreRequested,
    TResult Function(String text)? sendMessageRequested,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(roomId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ChatRoomStarted value) started,
    required TResult Function(LoadMoreRequested value) loadMoreRequested,
    required TResult Function(SendMessageRequested value) sendMessageRequested,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatRoomStarted value)? started,
    TResult? Function(LoadMoreRequested value)? loadMoreRequested,
    TResult? Function(SendMessageRequested value)? sendMessageRequested,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomStarted value)? started,
    TResult Function(LoadMoreRequested value)? loadMoreRequested,
    TResult Function(SendMessageRequested value)? sendMessageRequested,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class ChatRoomStarted implements ChatRoomEvent {
  const factory ChatRoomStarted(final String roomId) = _$ChatRoomStartedImpl;

  String get roomId;

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
    required TResult Function(String roomId) started,
    required TResult Function() loadMoreRequested,
    required TResult Function(String text) sendMessageRequested,
  }) {
    return loadMoreRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId)? started,
    TResult? Function()? loadMoreRequested,
    TResult? Function(String text)? sendMessageRequested,
  }) {
    return loadMoreRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId)? started,
    TResult Function()? loadMoreRequested,
    TResult Function(String text)? sendMessageRequested,
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
  }) {
    return loadMoreRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatRoomStarted value)? started,
    TResult? Function(LoadMoreRequested value)? loadMoreRequested,
    TResult? Function(SendMessageRequested value)? sendMessageRequested,
  }) {
    return loadMoreRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomStarted value)? started,
    TResult Function(LoadMoreRequested value)? loadMoreRequested,
    TResult Function(SendMessageRequested value)? sendMessageRequested,
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
    required TResult Function(String roomId) started,
    required TResult Function() loadMoreRequested,
    required TResult Function(String text) sendMessageRequested,
  }) {
    return sendMessageRequested(text);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String roomId)? started,
    TResult? Function()? loadMoreRequested,
    TResult? Function(String text)? sendMessageRequested,
  }) {
    return sendMessageRequested?.call(text);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String roomId)? started,
    TResult Function()? loadMoreRequested,
    TResult Function(String text)? sendMessageRequested,
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
  }) {
    return sendMessageRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ChatRoomStarted value)? started,
    TResult? Function(LoadMoreRequested value)? loadMoreRequested,
    TResult? Function(SendMessageRequested value)? sendMessageRequested,
  }) {
    return sendMessageRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ChatRoomStarted value)? started,
    TResult Function(LoadMoreRequested value)? loadMoreRequested,
    TResult Function(SendMessageRequested value)? sendMessageRequested,
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
