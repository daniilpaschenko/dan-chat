// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$RoomListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<RoomListItem> rooms) loaded,
    required TResult Function(String message) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RoomListItem> rooms)? loaded,
    TResult? Function(String message)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RoomListItem> rooms)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoomListInitial value) initial,
    required TResult Function(RoomListLoading value) loading,
    required TResult Function(RoomListLoaded value) loaded,
    required TResult Function(RoomListFailure value) failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RoomListInitial value)? initial,
    TResult? Function(RoomListLoading value)? loading,
    TResult? Function(RoomListLoaded value)? loaded,
    TResult? Function(RoomListFailure value)? failure,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomListInitial value)? initial,
    TResult Function(RoomListLoading value)? loading,
    TResult Function(RoomListLoaded value)? loaded,
    TResult Function(RoomListFailure value)? failure,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomListStateCopyWith<$Res> {
  factory $RoomListStateCopyWith(
    RoomListState value,
    $Res Function(RoomListState) then,
  ) = _$RoomListStateCopyWithImpl<$Res, RoomListState>;
}

/// @nodoc
class _$RoomListStateCopyWithImpl<$Res, $Val extends RoomListState>
    implements $RoomListStateCopyWith<$Res> {
  _$RoomListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoomListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$RoomListInitialImplCopyWith<$Res> {
  factory _$$RoomListInitialImplCopyWith(
    _$RoomListInitialImpl value,
    $Res Function(_$RoomListInitialImpl) then,
  ) = __$$RoomListInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RoomListInitialImplCopyWithImpl<$Res>
    extends _$RoomListStateCopyWithImpl<$Res, _$RoomListInitialImpl>
    implements _$$RoomListInitialImplCopyWith<$Res> {
  __$$RoomListInitialImplCopyWithImpl(
    _$RoomListInitialImpl _value,
    $Res Function(_$RoomListInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RoomListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RoomListInitialImpl implements RoomListInitial {
  const _$RoomListInitialImpl();

  @override
  String toString() {
    return 'RoomListState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RoomListInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<RoomListItem> rooms) loaded,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RoomListItem> rooms)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RoomListItem> rooms)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoomListInitial value) initial,
    required TResult Function(RoomListLoading value) loading,
    required TResult Function(RoomListLoaded value) loaded,
    required TResult Function(RoomListFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RoomListInitial value)? initial,
    TResult? Function(RoomListLoading value)? loading,
    TResult? Function(RoomListLoaded value)? loaded,
    TResult? Function(RoomListFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomListInitial value)? initial,
    TResult Function(RoomListLoading value)? loading,
    TResult Function(RoomListLoaded value)? loaded,
    TResult Function(RoomListFailure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class RoomListInitial implements RoomListState {
  const factory RoomListInitial() = _$RoomListInitialImpl;
}

/// @nodoc
abstract class _$$RoomListLoadingImplCopyWith<$Res> {
  factory _$$RoomListLoadingImplCopyWith(
    _$RoomListLoadingImpl value,
    $Res Function(_$RoomListLoadingImpl) then,
  ) = __$$RoomListLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RoomListLoadingImplCopyWithImpl<$Res>
    extends _$RoomListStateCopyWithImpl<$Res, _$RoomListLoadingImpl>
    implements _$$RoomListLoadingImplCopyWith<$Res> {
  __$$RoomListLoadingImplCopyWithImpl(
    _$RoomListLoadingImpl _value,
    $Res Function(_$RoomListLoadingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RoomListState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$RoomListLoadingImpl implements RoomListLoading {
  const _$RoomListLoadingImpl();

  @override
  String toString() {
    return 'RoomListState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RoomListLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<RoomListItem> rooms) loaded,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RoomListItem> rooms)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RoomListItem> rooms)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoomListInitial value) initial,
    required TResult Function(RoomListLoading value) loading,
    required TResult Function(RoomListLoaded value) loaded,
    required TResult Function(RoomListFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RoomListInitial value)? initial,
    TResult? Function(RoomListLoading value)? loading,
    TResult? Function(RoomListLoaded value)? loaded,
    TResult? Function(RoomListFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomListInitial value)? initial,
    TResult Function(RoomListLoading value)? loading,
    TResult Function(RoomListLoaded value)? loaded,
    TResult Function(RoomListFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class RoomListLoading implements RoomListState {
  const factory RoomListLoading() = _$RoomListLoadingImpl;
}

/// @nodoc
abstract class _$$RoomListLoadedImplCopyWith<$Res> {
  factory _$$RoomListLoadedImplCopyWith(
    _$RoomListLoadedImpl value,
    $Res Function(_$RoomListLoadedImpl) then,
  ) = __$$RoomListLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<RoomListItem> rooms});
}

/// @nodoc
class __$$RoomListLoadedImplCopyWithImpl<$Res>
    extends _$RoomListStateCopyWithImpl<$Res, _$RoomListLoadedImpl>
    implements _$$RoomListLoadedImplCopyWith<$Res> {
  __$$RoomListLoadedImplCopyWithImpl(
    _$RoomListLoadedImpl _value,
    $Res Function(_$RoomListLoadedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RoomListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? rooms = null}) {
    return _then(
      _$RoomListLoadedImpl(
        null == rooms
            ? _value._rooms
            : rooms // ignore: cast_nullable_to_non_nullable
                  as List<RoomListItem>,
      ),
    );
  }
}

/// @nodoc

class _$RoomListLoadedImpl implements RoomListLoaded {
  const _$RoomListLoadedImpl(final List<RoomListItem> rooms) : _rooms = rooms;

  final List<RoomListItem> _rooms;
  @override
  List<RoomListItem> get rooms {
    if (_rooms is EqualUnmodifiableListView) return _rooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rooms);
  }

  @override
  String toString() {
    return 'RoomListState.loaded(rooms: $rooms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomListLoadedImpl &&
            const DeepCollectionEquality().equals(other._rooms, _rooms));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_rooms));

  /// Create a copy of RoomListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomListLoadedImplCopyWith<_$RoomListLoadedImpl> get copyWith =>
      __$$RoomListLoadedImplCopyWithImpl<_$RoomListLoadedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<RoomListItem> rooms) loaded,
    required TResult Function(String message) failure,
  }) {
    return loaded(rooms);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RoomListItem> rooms)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return loaded?.call(rooms);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RoomListItem> rooms)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(rooms);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoomListInitial value) initial,
    required TResult Function(RoomListLoading value) loading,
    required TResult Function(RoomListLoaded value) loaded,
    required TResult Function(RoomListFailure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RoomListInitial value)? initial,
    TResult? Function(RoomListLoading value)? loading,
    TResult? Function(RoomListLoaded value)? loaded,
    TResult? Function(RoomListFailure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomListInitial value)? initial,
    TResult Function(RoomListLoading value)? loading,
    TResult Function(RoomListLoaded value)? loaded,
    TResult Function(RoomListFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class RoomListLoaded implements RoomListState {
  const factory RoomListLoaded(final List<RoomListItem> rooms) =
      _$RoomListLoadedImpl;

  List<RoomListItem> get rooms;

  /// Create a copy of RoomListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoomListLoadedImplCopyWith<_$RoomListLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RoomListFailureImplCopyWith<$Res> {
  factory _$$RoomListFailureImplCopyWith(
    _$RoomListFailureImpl value,
    $Res Function(_$RoomListFailureImpl) then,
  ) = __$$RoomListFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$RoomListFailureImplCopyWithImpl<$Res>
    extends _$RoomListStateCopyWithImpl<$Res, _$RoomListFailureImpl>
    implements _$$RoomListFailureImplCopyWith<$Res> {
  __$$RoomListFailureImplCopyWithImpl(
    _$RoomListFailureImpl _value,
    $Res Function(_$RoomListFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RoomListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$RoomListFailureImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$RoomListFailureImpl implements RoomListFailure {
  const _$RoomListFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'RoomListState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomListFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of RoomListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomListFailureImplCopyWith<_$RoomListFailureImpl> get copyWith =>
      __$$RoomListFailureImplCopyWithImpl<_$RoomListFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<RoomListItem> rooms) loaded,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<RoomListItem> rooms)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<RoomListItem> rooms)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(RoomListInitial value) initial,
    required TResult Function(RoomListLoading value) loading,
    required TResult Function(RoomListLoaded value) loaded,
    required TResult Function(RoomListFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(RoomListInitial value)? initial,
    TResult? Function(RoomListLoading value)? loading,
    TResult? Function(RoomListLoaded value)? loaded,
    TResult? Function(RoomListFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(RoomListInitial value)? initial,
    TResult Function(RoomListLoading value)? loading,
    TResult Function(RoomListLoaded value)? loaded,
    TResult Function(RoomListFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class RoomListFailure implements RoomListState {
  const factory RoomListFailure(final String message) = _$RoomListFailureImpl;

  String get message;

  /// Create a copy of RoomListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoomListFailureImplCopyWith<_$RoomListFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
