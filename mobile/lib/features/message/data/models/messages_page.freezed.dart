// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'messages_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

MessagesPage _$MessagesPageFromJson(Map<String, dynamic> json) {
  return _MessagesPage.fromJson(json);
}

/// @nodoc
mixin _$MessagesPage {
  List<Message> get messages => throw _privateConstructorUsedError;
  String? get nextCursor => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;

  /// Serializes this MessagesPage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessagesPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessagesPageCopyWith<MessagesPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagesPageCopyWith<$Res> {
  factory $MessagesPageCopyWith(
    MessagesPage value,
    $Res Function(MessagesPage) then,
  ) = _$MessagesPageCopyWithImpl<$Res, MessagesPage>;
  @useResult
  $Res call({List<Message> messages, String? nextCursor, bool hasMore});
}

/// @nodoc
class _$MessagesPageCopyWithImpl<$Res, $Val extends MessagesPage>
    implements $MessagesPageCopyWith<$Res> {
  _$MessagesPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessagesPage
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
                      as List<Message>,
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
abstract class _$$MessagesPageImplCopyWith<$Res>
    implements $MessagesPageCopyWith<$Res> {
  factory _$$MessagesPageImplCopyWith(
    _$MessagesPageImpl value,
    $Res Function(_$MessagesPageImpl) then,
  ) = __$$MessagesPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Message> messages, String? nextCursor, bool hasMore});
}

/// @nodoc
class __$$MessagesPageImplCopyWithImpl<$Res>
    extends _$MessagesPageCopyWithImpl<$Res, _$MessagesPageImpl>
    implements _$$MessagesPageImplCopyWith<$Res> {
  __$$MessagesPageImplCopyWithImpl(
    _$MessagesPageImpl _value,
    $Res Function(_$MessagesPageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MessagesPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
    Object? nextCursor = freezed,
    Object? hasMore = null,
  }) {
    return _then(
      _$MessagesPageImpl(
        messages: null == messages
            ? _value._messages
            : messages // ignore: cast_nullable_to_non_nullable
                  as List<Message>,
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
@JsonSerializable()
class _$MessagesPageImpl implements _MessagesPage {
  const _$MessagesPageImpl({
    required final List<Message> messages,
    this.nextCursor,
    required this.hasMore,
  }) : _messages = messages;

  factory _$MessagesPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessagesPageImplFromJson(json);

  final List<Message> _messages;
  @override
  List<Message> get messages {
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
    return 'MessagesPage(messages: $messages, nextCursor: $nextCursor, hasMore: $hasMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessagesPageImpl &&
            const DeepCollectionEquality().equals(other._messages, _messages) &&
            (identical(other.nextCursor, nextCursor) ||
                other.nextCursor == nextCursor) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_messages),
    nextCursor,
    hasMore,
  );

  /// Create a copy of MessagesPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessagesPageImplCopyWith<_$MessagesPageImpl> get copyWith =>
      __$$MessagesPageImplCopyWithImpl<_$MessagesPageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessagesPageImplToJson(this);
  }
}

abstract class _MessagesPage implements MessagesPage {
  const factory _MessagesPage({
    required final List<Message> messages,
    final String? nextCursor,
    required final bool hasMore,
  }) = _$MessagesPageImpl;

  factory _MessagesPage.fromJson(Map<String, dynamic> json) =
      _$MessagesPageImpl.fromJson;

  @override
  List<Message> get messages;
  @override
  String? get nextCursor;
  @override
  bool get hasMore;

  /// Create a copy of MessagesPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessagesPageImplCopyWith<_$MessagesPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
