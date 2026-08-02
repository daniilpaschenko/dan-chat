// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SearchEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) queryChanged,
    required TResult Function(String userId, UserStatus status) presenceUpdated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? queryChanged,
    TResult? Function(String userId, UserStatus status)? presenceUpdated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? queryChanged,
    TResult Function(String userId, UserStatus status)? presenceUpdated,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QueryChanged value) queryChanged,
    required TResult Function(SearchPresenceUpdated value) presenceUpdated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueryChanged value)? queryChanged,
    TResult? Function(SearchPresenceUpdated value)? presenceUpdated,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueryChanged value)? queryChanged,
    TResult Function(SearchPresenceUpdated value)? presenceUpdated,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchEventCopyWith<$Res> {
  factory $SearchEventCopyWith(
    SearchEvent value,
    $Res Function(SearchEvent) then,
  ) = _$SearchEventCopyWithImpl<$Res, SearchEvent>;
}

/// @nodoc
class _$SearchEventCopyWithImpl<$Res, $Val extends SearchEvent>
    implements $SearchEventCopyWith<$Res> {
  _$SearchEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$QueryChangedImplCopyWith<$Res> {
  factory _$$QueryChangedImplCopyWith(
    _$QueryChangedImpl value,
    $Res Function(_$QueryChangedImpl) then,
  ) = __$$QueryChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$QueryChangedImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$QueryChangedImpl>
    implements _$$QueryChangedImplCopyWith<$Res> {
  __$$QueryChangedImplCopyWithImpl(
    _$QueryChangedImpl _value,
    $Res Function(_$QueryChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? query = null}) {
    return _then(
      _$QueryChangedImpl(
        null == query
            ? _value.query
            : query // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$QueryChangedImpl implements QueryChanged {
  const _$QueryChangedImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'SearchEvent.queryChanged(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueryChangedImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QueryChangedImplCopyWith<_$QueryChangedImpl> get copyWith =>
      __$$QueryChangedImplCopyWithImpl<_$QueryChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) queryChanged,
    required TResult Function(String userId, UserStatus status) presenceUpdated,
  }) {
    return queryChanged(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? queryChanged,
    TResult? Function(String userId, UserStatus status)? presenceUpdated,
  }) {
    return queryChanged?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? queryChanged,
    TResult Function(String userId, UserStatus status)? presenceUpdated,
    required TResult orElse(),
  }) {
    if (queryChanged != null) {
      return queryChanged(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QueryChanged value) queryChanged,
    required TResult Function(SearchPresenceUpdated value) presenceUpdated,
  }) {
    return queryChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueryChanged value)? queryChanged,
    TResult? Function(SearchPresenceUpdated value)? presenceUpdated,
  }) {
    return queryChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueryChanged value)? queryChanged,
    TResult Function(SearchPresenceUpdated value)? presenceUpdated,
    required TResult orElse(),
  }) {
    if (queryChanged != null) {
      return queryChanged(this);
    }
    return orElse();
  }
}

abstract class QueryChanged implements SearchEvent {
  const factory QueryChanged(final String query) = _$QueryChangedImpl;

  String get query;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QueryChangedImplCopyWith<_$QueryChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchPresenceUpdatedImplCopyWith<$Res> {
  factory _$$SearchPresenceUpdatedImplCopyWith(
    _$SearchPresenceUpdatedImpl value,
    $Res Function(_$SearchPresenceUpdatedImpl) then,
  ) = __$$SearchPresenceUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String userId, UserStatus status});
}

/// @nodoc
class __$$SearchPresenceUpdatedImplCopyWithImpl<$Res>
    extends _$SearchEventCopyWithImpl<$Res, _$SearchPresenceUpdatedImpl>
    implements _$$SearchPresenceUpdatedImplCopyWith<$Res> {
  __$$SearchPresenceUpdatedImplCopyWithImpl(
    _$SearchPresenceUpdatedImpl _value,
    $Res Function(_$SearchPresenceUpdatedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? userId = null, Object? status = freezed}) {
    return _then(
      _$SearchPresenceUpdatedImpl(
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as String,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as UserStatus,
      ),
    );
  }
}

/// @nodoc

class _$SearchPresenceUpdatedImpl implements SearchPresenceUpdated {
  const _$SearchPresenceUpdatedImpl({
    required this.userId,
    required this.status,
  });

  @override
  final String userId;
  @override
  final UserStatus status;

  @override
  String toString() {
    return 'SearchEvent.presenceUpdated(userId: $userId, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchPresenceUpdatedImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            const DeepCollectionEquality().equals(other.status, status));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    userId,
    const DeepCollectionEquality().hash(status),
  );

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchPresenceUpdatedImplCopyWith<_$SearchPresenceUpdatedImpl>
  get copyWith =>
      __$$SearchPresenceUpdatedImplCopyWithImpl<_$SearchPresenceUpdatedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) queryChanged,
    required TResult Function(String userId, UserStatus status) presenceUpdated,
  }) {
    return presenceUpdated(userId, status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? queryChanged,
    TResult? Function(String userId, UserStatus status)? presenceUpdated,
  }) {
    return presenceUpdated?.call(userId, status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? queryChanged,
    TResult Function(String userId, UserStatus status)? presenceUpdated,
    required TResult orElse(),
  }) {
    if (presenceUpdated != null) {
      return presenceUpdated(userId, status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QueryChanged value) queryChanged,
    required TResult Function(SearchPresenceUpdated value) presenceUpdated,
  }) {
    return presenceUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueryChanged value)? queryChanged,
    TResult? Function(SearchPresenceUpdated value)? presenceUpdated,
  }) {
    return presenceUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueryChanged value)? queryChanged,
    TResult Function(SearchPresenceUpdated value)? presenceUpdated,
    required TResult orElse(),
  }) {
    if (presenceUpdated != null) {
      return presenceUpdated(this);
    }
    return orElse();
  }
}

abstract class SearchPresenceUpdated implements SearchEvent {
  const factory SearchPresenceUpdated({
    required final String userId,
    required final UserStatus status,
  }) = _$SearchPresenceUpdatedImpl;

  String get userId;
  UserStatus get status;

  /// Create a copy of SearchEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchPresenceUpdatedImplCopyWith<_$SearchPresenceUpdatedImpl>
  get copyWith => throw _privateConstructorUsedError;
}
