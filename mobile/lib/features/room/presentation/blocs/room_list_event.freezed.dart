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
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function()? refreshRequested,
    TResult? Function(String roomId)? roomOpened,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function()? refreshRequested,
    TResult Function(String roomId)? roomOpened,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadRequested value) loadRequested,
    required TResult Function(RefreshRequested value) refreshRequested,
    required TResult Function(RoomOpened value) roomOpened,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadRequested value)? loadRequested,
    TResult? Function(RefreshRequested value)? refreshRequested,
    TResult? Function(RoomOpened value)? roomOpened,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadRequested value)? loadRequested,
    TResult Function(RefreshRequested value)? refreshRequested,
    TResult Function(RoomOpened value)? roomOpened,
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
  }) {
    return loadRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function()? refreshRequested,
    TResult? Function(String roomId)? roomOpened,
  }) {
    return loadRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function()? refreshRequested,
    TResult Function(String roomId)? roomOpened,
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
  }) {
    return loadRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadRequested value)? loadRequested,
    TResult? Function(RefreshRequested value)? refreshRequested,
    TResult? Function(RoomOpened value)? roomOpened,
  }) {
    return loadRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadRequested value)? loadRequested,
    TResult Function(RefreshRequested value)? refreshRequested,
    TResult Function(RoomOpened value)? roomOpened,
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
  }) {
    return refreshRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function()? refreshRequested,
    TResult? Function(String roomId)? roomOpened,
  }) {
    return refreshRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function()? refreshRequested,
    TResult Function(String roomId)? roomOpened,
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
  }) {
    return refreshRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadRequested value)? loadRequested,
    TResult? Function(RefreshRequested value)? refreshRequested,
    TResult? Function(RoomOpened value)? roomOpened,
  }) {
    return refreshRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadRequested value)? loadRequested,
    TResult Function(RefreshRequested value)? refreshRequested,
    TResult Function(RoomOpened value)? roomOpened,
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
  }) {
    return roomOpened(roomId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadRequested,
    TResult? Function()? refreshRequested,
    TResult? Function(String roomId)? roomOpened,
  }) {
    return roomOpened?.call(roomId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadRequested,
    TResult Function()? refreshRequested,
    TResult Function(String roomId)? roomOpened,
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
  }) {
    return roomOpened(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadRequested value)? loadRequested,
    TResult? Function(RefreshRequested value)? refreshRequested,
    TResult? Function(RoomOpened value)? roomOpened,
  }) {
    return roomOpened?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadRequested value)? loadRequested,
    TResult Function(RefreshRequested value)? refreshRequested,
    TResult Function(RoomOpened value)? roomOpened,
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
