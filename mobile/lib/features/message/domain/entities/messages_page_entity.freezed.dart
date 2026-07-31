// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messages_page_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MessagesPageEntity {
  List<MessageEntity> get messages => throw _privateConstructorUsedError;
  String? get nextCursor => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;

  /// Create a copy of MessagesPageEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessagesPageEntityCopyWith<MessagesPageEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagesPageEntityCopyWith<$Res> {
  factory $MessagesPageEntityCopyWith(
    MessagesPageEntity value,
    $Res Function(MessagesPageEntity) then,
  ) = _$MessagesPageEntityCopyWithImpl<$Res, MessagesPageEntity>;
  @useResult
  $Res call({List<MessageEntity> messages, String? nextCursor, bool hasMore});
}

/// @nodoc
class _$MessagesPageEntityCopyWithImpl<$Res, $Val extends MessagesPageEntity>
    implements $MessagesPageEntityCopyWith<$Res> {
  _$MessagesPageEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessagesPageEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? nextCursor = freezed,
    Object? hasMore = null,
  }) {
    return _then(
      _value.copyWith(
            messages: null == messages
                ? _value.messages
                : messages // ignore: cast_nullable_to_non_nullable
                      as List<MessageEntity>,
            nextCursor: freezed == nextCursor
                ? _value.nextCursor
                : nextCursor // ignore: cast_nullable_to_non_nullable
                      as String?,
            hasMore: null == hasMore
                ? _value.hasMore
                : hasMore // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MessagesPageEntityImplCopyWith<$Res>
    implements $MessagesPageEntityCopyWith<$Res> {
  factory _$$MessagesPageEntityImplCopyWith(
    _$MessagesPageEntityImpl value,
    $Res Function(_$MessagesPageEntityImpl) then,
  ) = __$$MessagesPageEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MessageEntity> messages, String? nextCursor, bool hasMore});
}

/// @nodoc
class __$$MessagesPageEntityImplCopyWithImpl<$Res>
    extends _$MessagesPageEntityCopyWithImpl<$Res, _$MessagesPageEntityImpl>
    implements _$$MessagesPageEntityImplCopyWith<$Res> {
  __$$MessagesPageEntityImplCopyWithImpl(
    _$MessagesPageEntityImpl _value,
    $Res Function(_$MessagesPageEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MessagesPageEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? nextCursor = freezed,
    Object? hasMore = null,
  }) {
    return _then(
      _$MessagesPageEntityImpl(
        messages: null == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                  as List<MessageEntity>,
        nextCursor: freezed == nextCursor
            ? _value.nextCursor
            : nextCursor // ignore: cast_nullable_to_non_nullable
                  as String?,
        hasMore: null == hasMore
            ? _value.hasMore
            : hasMore // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$MessagesPageEntityImpl implements _MessagesPageEntity {
  const _$MessagesPageEntityImpl({
    required final List<MessageEntity> messages,
    this.nextCursor,
    required this.hasMore,
  }) : _messages = messages;

  final List<MessageEntity> _messages;
  @override
  List<MessageEntity> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  @override
  final String? nextCursor;
  @override
  final bool hasMore;

  @override
  String toString() {
    return 'MessagesPageEntity(messages: $messages, nextCursor: $nextCursor, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessagesPageEntityImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.nextCursor, nextCursor) ||
                other.nextCursor == nextCursor) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_messages),
    nextCursor,
    hasMore,
  );

  /// Create a copy of MessagesPageEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessagesPageEntityImplCopyWith<_$MessagesPageEntityImpl> get copyWith =>
      __$$MessagesPageEntityImplCopyWithImpl<_$MessagesPageEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _MessagesPageEntity implements MessagesPageEntity {
  const factory _MessagesPageEntity({
    required final List<MessageEntity> messages,
    final String? nextCursor,
    required final bool hasMore,
  }) = _$MessagesPageEntityImpl;

  @override
  List<MessageEntity> get messages;
  @override
  String? get nextCursor;
  @override
  bool get hasMore;

  /// Create a copy of MessagesPageEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessagesPageEntityImplCopyWith<_$MessagesPageEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
