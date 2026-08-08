// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_group_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CreateGroupEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) queryChanged,
    required TResult Function(PartialUserEntity user) userToggled,
    required TResult Function(String name) createRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? queryChanged,
    TResult? Function(PartialUserEntity user)? userToggled,
    TResult? Function(String name)? createRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? queryChanged,
    TResult Function(PartialUserEntity user)? userToggled,
    TResult Function(String name)? createRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QueryChanged value) queryChanged,
    required TResult Function(UserToggled value) userToggled,
    required TResult Function(CreateRequested value) createRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueryChanged value)? queryChanged,
    TResult? Function(UserToggled value)? userToggled,
    TResult? Function(CreateRequested value)? createRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueryChanged value)? queryChanged,
    TResult Function(UserToggled value)? userToggled,
    TResult Function(CreateRequested value)? createRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateGroupEventCopyWith<$Res> {
  factory $CreateGroupEventCopyWith(
    CreateGroupEvent value,
    $Res Function(CreateGroupEvent) then,
  ) = _$CreateGroupEventCopyWithImpl<$Res, CreateGroupEvent>;
}

/// @nodoc
class _$CreateGroupEventCopyWithImpl<$Res, $Val extends CreateGroupEvent>
    implements $CreateGroupEventCopyWith<$Res> {
  _$CreateGroupEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CreateGroupEvent
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
    extends _$CreateGroupEventCopyWithImpl<$Res, _$QueryChangedImpl>
    implements _$$QueryChangedImplCopyWith<$Res> {
  __$$QueryChangedImplCopyWithImpl(
    _$QueryChangedImpl _value,
    $Res Function(_$QueryChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateGroupEvent
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
    return 'CreateGroupEvent.queryChanged(query: $query)';
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

  /// Create a copy of CreateGroupEvent
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
    required TResult Function(PartialUserEntity user) userToggled,
    required TResult Function(String name) createRequested,
  }) {
    return queryChanged(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? queryChanged,
    TResult? Function(PartialUserEntity user)? userToggled,
    TResult? Function(String name)? createRequested,
  }) {
    return queryChanged?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? queryChanged,
    TResult Function(PartialUserEntity user)? userToggled,
    TResult Function(String name)? createRequested,
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
    required TResult Function(UserToggled value) userToggled,
    required TResult Function(CreateRequested value) createRequested,
  }) {
    return queryChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueryChanged value)? queryChanged,
    TResult? Function(UserToggled value)? userToggled,
    TResult? Function(CreateRequested value)? createRequested,
  }) {
    return queryChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueryChanged value)? queryChanged,
    TResult Function(UserToggled value)? userToggled,
    TResult Function(CreateRequested value)? createRequested,
    required TResult orElse(),
  }) {
    if (queryChanged != null) {
      return queryChanged(this);
    }
    return orElse();
  }
}

abstract class QueryChanged implements CreateGroupEvent {
  const factory QueryChanged(final String query) = _$QueryChangedImpl;

  String get query;

  /// Create a copy of CreateGroupEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QueryChangedImplCopyWith<_$QueryChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UserToggledImplCopyWith<$Res> {
  factory _$$UserToggledImplCopyWith(
    _$UserToggledImpl value,
    $Res Function(_$UserToggledImpl) then,
  ) = __$$UserToggledImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PartialUserEntity user});

  $PartialUserEntityCopyWith<$Res> get user;
}

/// @nodoc
class __$$UserToggledImplCopyWithImpl<$Res>
    extends _$CreateGroupEventCopyWithImpl<$Res, _$UserToggledImpl>
    implements _$$UserToggledImplCopyWith<$Res> {
  __$$UserToggledImplCopyWithImpl(
    _$UserToggledImpl _value,
    $Res Function(_$UserToggledImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateGroupEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null}) {
    return _then(
      _$UserToggledImpl(
        null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as PartialUserEntity,
      ),
    );
  }

  /// Create a copy of CreateGroupEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PartialUserEntityCopyWith<$Res> get user {
    return $PartialUserEntityCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$UserToggledImpl implements UserToggled {
  const _$UserToggledImpl(this.user);

  @override
  final PartialUserEntity user;

  @override
  String toString() {
    return 'CreateGroupEvent.userToggled(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserToggledImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of CreateGroupEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserToggledImplCopyWith<_$UserToggledImpl> get copyWith =>
      __$$UserToggledImplCopyWithImpl<_$UserToggledImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) queryChanged,
    required TResult Function(PartialUserEntity user) userToggled,
    required TResult Function(String name) createRequested,
  }) {
    return userToggled(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? queryChanged,
    TResult? Function(PartialUserEntity user)? userToggled,
    TResult? Function(String name)? createRequested,
  }) {
    return userToggled?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? queryChanged,
    TResult Function(PartialUserEntity user)? userToggled,
    TResult Function(String name)? createRequested,
    required TResult orElse(),
  }) {
    if (userToggled != null) {
      return userToggled(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QueryChanged value) queryChanged,
    required TResult Function(UserToggled value) userToggled,
    required TResult Function(CreateRequested value) createRequested,
  }) {
    return userToggled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueryChanged value)? queryChanged,
    TResult? Function(UserToggled value)? userToggled,
    TResult? Function(CreateRequested value)? createRequested,
  }) {
    return userToggled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueryChanged value)? queryChanged,
    TResult Function(UserToggled value)? userToggled,
    TResult Function(CreateRequested value)? createRequested,
    required TResult orElse(),
  }) {
    if (userToggled != null) {
      return userToggled(this);
    }
    return orElse();
  }
}

abstract class UserToggled implements CreateGroupEvent {
  const factory UserToggled(final PartialUserEntity user) = _$UserToggledImpl;

  PartialUserEntity get user;

  /// Create a copy of CreateGroupEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserToggledImplCopyWith<_$UserToggledImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateRequestedImplCopyWith<$Res> {
  factory _$$CreateRequestedImplCopyWith(
    _$CreateRequestedImpl value,
    $Res Function(_$CreateRequestedImpl) then,
  ) = __$$CreateRequestedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$CreateRequestedImplCopyWithImpl<$Res>
    extends _$CreateGroupEventCopyWithImpl<$Res, _$CreateRequestedImpl>
    implements _$$CreateRequestedImplCopyWith<$Res> {
  __$$CreateRequestedImplCopyWithImpl(
    _$CreateRequestedImpl _value,
    $Res Function(_$CreateRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CreateGroupEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null}) {
    return _then(
      _$CreateRequestedImpl(
        null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$CreateRequestedImpl implements CreateRequested {
  const _$CreateRequestedImpl(this.name);

  @override
  final String name;

  @override
  String toString() {
    return 'CreateGroupEvent.createRequested(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateRequestedImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of CreateGroupEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateRequestedImplCopyWith<_$CreateRequestedImpl> get copyWith =>
      __$$CreateRequestedImplCopyWithImpl<_$CreateRequestedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) queryChanged,
    required TResult Function(PartialUserEntity user) userToggled,
    required TResult Function(String name) createRequested,
  }) {
    return createRequested(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? queryChanged,
    TResult? Function(PartialUserEntity user)? userToggled,
    TResult? Function(String name)? createRequested,
  }) {
    return createRequested?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? queryChanged,
    TResult Function(PartialUserEntity user)? userToggled,
    TResult Function(String name)? createRequested,
    required TResult orElse(),
  }) {
    if (createRequested != null) {
      return createRequested(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QueryChanged value) queryChanged,
    required TResult Function(UserToggled value) userToggled,
    required TResult Function(CreateRequested value) createRequested,
  }) {
    return createRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueryChanged value)? queryChanged,
    TResult? Function(UserToggled value)? userToggled,
    TResult? Function(CreateRequested value)? createRequested,
  }) {
    return createRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueryChanged value)? queryChanged,
    TResult Function(UserToggled value)? userToggled,
    TResult Function(CreateRequested value)? createRequested,
    required TResult orElse(),
  }) {
    if (createRequested != null) {
      return createRequested(this);
    }
    return orElse();
  }
}

abstract class CreateRequested implements CreateGroupEvent {
  const factory CreateRequested(final String name) = _$CreateRequestedImpl;

  String get name;

  /// Create a copy of CreateGroupEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateRequestedImplCopyWith<_$CreateRequestedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
