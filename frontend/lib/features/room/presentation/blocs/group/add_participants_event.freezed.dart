// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_participants_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AddParticipantsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) queryChanged,
    required TResult Function(PartialUserEntity user) userToggled,
    required TResult Function() submitRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? queryChanged,
    TResult? Function(PartialUserEntity user)? userToggled,
    TResult? Function()? submitRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? queryChanged,
    TResult Function(PartialUserEntity user)? userToggled,
    TResult Function()? submitRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddParticipantsQueryChanged value) queryChanged,
    required TResult Function(AddParticipantsUserToggled value) userToggled,
    required TResult Function(AddParticipantsSubmitRequested value)
    submitRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddParticipantsQueryChanged value)? queryChanged,
    TResult? Function(AddParticipantsUserToggled value)? userToggled,
    TResult? Function(AddParticipantsSubmitRequested value)? submitRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddParticipantsQueryChanged value)? queryChanged,
    TResult Function(AddParticipantsUserToggled value)? userToggled,
    TResult Function(AddParticipantsSubmitRequested value)? submitRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddParticipantsEventCopyWith<$Res> {
  factory $AddParticipantsEventCopyWith(
    AddParticipantsEvent value,
    $Res Function(AddParticipantsEvent) then,
  ) = _$AddParticipantsEventCopyWithImpl<$Res, AddParticipantsEvent>;
}

/// @nodoc
class _$AddParticipantsEventCopyWithImpl<
  $Res,
  $Val extends AddParticipantsEvent
>
    implements $AddParticipantsEventCopyWith<$Res> {
  _$AddParticipantsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddParticipantsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AddParticipantsQueryChangedImplCopyWith<$Res> {
  factory _$$AddParticipantsQueryChangedImplCopyWith(
    _$AddParticipantsQueryChangedImpl value,
    $Res Function(_$AddParticipantsQueryChangedImpl) then,
  ) = __$$AddParticipantsQueryChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$AddParticipantsQueryChangedImplCopyWithImpl<$Res>
    extends
        _$AddParticipantsEventCopyWithImpl<
          $Res,
          _$AddParticipantsQueryChangedImpl
        >
    implements _$$AddParticipantsQueryChangedImplCopyWith<$Res> {
  __$$AddParticipantsQueryChangedImplCopyWithImpl(
    _$AddParticipantsQueryChangedImpl _value,
    $Res Function(_$AddParticipantsQueryChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddParticipantsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? query = null}) {
    return _then(
      _$AddParticipantsQueryChangedImpl(
        null == query
            ? _value.query
            : query // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$AddParticipantsQueryChangedImpl implements AddParticipantsQueryChanged {
  const _$AddParticipantsQueryChangedImpl(this.query);

  @override
  final String query;

  @override
  String toString() {
    return 'AddParticipantsEvent.queryChanged(query: $query)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddParticipantsQueryChangedImpl &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  /// Create a copy of AddParticipantsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddParticipantsQueryChangedImplCopyWith<_$AddParticipantsQueryChangedImpl>
  get copyWith =>
      __$$AddParticipantsQueryChangedImplCopyWithImpl<
        _$AddParticipantsQueryChangedImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) queryChanged,
    required TResult Function(PartialUserEntity user) userToggled,
    required TResult Function() submitRequested,
  }) {
    return queryChanged(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? queryChanged,
    TResult? Function(PartialUserEntity user)? userToggled,
    TResult? Function()? submitRequested,
  }) {
    return queryChanged?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? queryChanged,
    TResult Function(PartialUserEntity user)? userToggled,
    TResult Function()? submitRequested,
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
    required TResult Function(AddParticipantsQueryChanged value) queryChanged,
    required TResult Function(AddParticipantsUserToggled value) userToggled,
    required TResult Function(AddParticipantsSubmitRequested value)
    submitRequested,
  }) {
    return queryChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddParticipantsQueryChanged value)? queryChanged,
    TResult? Function(AddParticipantsUserToggled value)? userToggled,
    TResult? Function(AddParticipantsSubmitRequested value)? submitRequested,
  }) {
    return queryChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddParticipantsQueryChanged value)? queryChanged,
    TResult Function(AddParticipantsUserToggled value)? userToggled,
    TResult Function(AddParticipantsSubmitRequested value)? submitRequested,
    required TResult orElse(),
  }) {
    if (queryChanged != null) {
      return queryChanged(this);
    }
    return orElse();
  }
}

abstract class AddParticipantsQueryChanged implements AddParticipantsEvent {
  const factory AddParticipantsQueryChanged(final String query) =
      _$AddParticipantsQueryChangedImpl;

  String get query;

  /// Create a copy of AddParticipantsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddParticipantsQueryChangedImplCopyWith<_$AddParticipantsQueryChangedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddParticipantsUserToggledImplCopyWith<$Res> {
  factory _$$AddParticipantsUserToggledImplCopyWith(
    _$AddParticipantsUserToggledImpl value,
    $Res Function(_$AddParticipantsUserToggledImpl) then,
  ) = __$$AddParticipantsUserToggledImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PartialUserEntity user});

  $PartialUserEntityCopyWith<$Res> get user;
}

/// @nodoc
class __$$AddParticipantsUserToggledImplCopyWithImpl<$Res>
    extends
        _$AddParticipantsEventCopyWithImpl<
          $Res,
          _$AddParticipantsUserToggledImpl
        >
    implements _$$AddParticipantsUserToggledImplCopyWith<$Res> {
  __$$AddParticipantsUserToggledImplCopyWithImpl(
    _$AddParticipantsUserToggledImpl _value,
    $Res Function(_$AddParticipantsUserToggledImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddParticipantsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? user = null}) {
    return _then(
      _$AddParticipantsUserToggledImpl(
        null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as PartialUserEntity,
      ),
    );
  }

  /// Create a copy of AddParticipantsEvent
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

class _$AddParticipantsUserToggledImpl implements AddParticipantsUserToggled {
  const _$AddParticipantsUserToggledImpl(this.user);

  @override
  final PartialUserEntity user;

  @override
  String toString() {
    return 'AddParticipantsEvent.userToggled(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddParticipantsUserToggledImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of AddParticipantsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddParticipantsUserToggledImplCopyWith<_$AddParticipantsUserToggledImpl>
  get copyWith =>
      __$$AddParticipantsUserToggledImplCopyWithImpl<
        _$AddParticipantsUserToggledImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) queryChanged,
    required TResult Function(PartialUserEntity user) userToggled,
    required TResult Function() submitRequested,
  }) {
    return userToggled(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? queryChanged,
    TResult? Function(PartialUserEntity user)? userToggled,
    TResult? Function()? submitRequested,
  }) {
    return userToggled?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? queryChanged,
    TResult Function(PartialUserEntity user)? userToggled,
    TResult Function()? submitRequested,
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
    required TResult Function(AddParticipantsQueryChanged value) queryChanged,
    required TResult Function(AddParticipantsUserToggled value) userToggled,
    required TResult Function(AddParticipantsSubmitRequested value)
    submitRequested,
  }) {
    return userToggled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddParticipantsQueryChanged value)? queryChanged,
    TResult? Function(AddParticipantsUserToggled value)? userToggled,
    TResult? Function(AddParticipantsSubmitRequested value)? submitRequested,
  }) {
    return userToggled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddParticipantsQueryChanged value)? queryChanged,
    TResult Function(AddParticipantsUserToggled value)? userToggled,
    TResult Function(AddParticipantsSubmitRequested value)? submitRequested,
    required TResult orElse(),
  }) {
    if (userToggled != null) {
      return userToggled(this);
    }
    return orElse();
  }
}

abstract class AddParticipantsUserToggled implements AddParticipantsEvent {
  const factory AddParticipantsUserToggled(final PartialUserEntity user) =
      _$AddParticipantsUserToggledImpl;

  PartialUserEntity get user;

  /// Create a copy of AddParticipantsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddParticipantsUserToggledImplCopyWith<_$AddParticipantsUserToggledImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddParticipantsSubmitRequestedImplCopyWith<$Res> {
  factory _$$AddParticipantsSubmitRequestedImplCopyWith(
    _$AddParticipantsSubmitRequestedImpl value,
    $Res Function(_$AddParticipantsSubmitRequestedImpl) then,
  ) = __$$AddParticipantsSubmitRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddParticipantsSubmitRequestedImplCopyWithImpl<$Res>
    extends
        _$AddParticipantsEventCopyWithImpl<
          $Res,
          _$AddParticipantsSubmitRequestedImpl
        >
    implements _$$AddParticipantsSubmitRequestedImplCopyWith<$Res> {
  __$$AddParticipantsSubmitRequestedImplCopyWithImpl(
    _$AddParticipantsSubmitRequestedImpl _value,
    $Res Function(_$AddParticipantsSubmitRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddParticipantsEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AddParticipantsSubmitRequestedImpl
    implements AddParticipantsSubmitRequested {
  const _$AddParticipantsSubmitRequestedImpl();

  @override
  String toString() {
    return 'AddParticipantsEvent.submitRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddParticipantsSubmitRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String query) queryChanged,
    required TResult Function(PartialUserEntity user) userToggled,
    required TResult Function() submitRequested,
  }) {
    return submitRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String query)? queryChanged,
    TResult? Function(PartialUserEntity user)? userToggled,
    TResult? Function()? submitRequested,
  }) {
    return submitRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String query)? queryChanged,
    TResult Function(PartialUserEntity user)? userToggled,
    TResult Function()? submitRequested,
    required TResult orElse(),
  }) {
    if (submitRequested != null) {
      return submitRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddParticipantsQueryChanged value) queryChanged,
    required TResult Function(AddParticipantsUserToggled value) userToggled,
    required TResult Function(AddParticipantsSubmitRequested value)
    submitRequested,
  }) {
    return submitRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddParticipantsQueryChanged value)? queryChanged,
    TResult? Function(AddParticipantsUserToggled value)? userToggled,
    TResult? Function(AddParticipantsSubmitRequested value)? submitRequested,
  }) {
    return submitRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddParticipantsQueryChanged value)? queryChanged,
    TResult Function(AddParticipantsUserToggled value)? userToggled,
    TResult Function(AddParticipantsSubmitRequested value)? submitRequested,
    required TResult orElse(),
  }) {
    if (submitRequested != null) {
      return submitRequested(this);
    }
    return orElse();
  }
}

abstract class AddParticipantsSubmitRequested implements AddParticipantsEvent {
  const factory AddParticipantsSubmitRequested() =
      _$AddParticipantsSubmitRequestedImpl;
}
