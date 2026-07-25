// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Failure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidCredentials,
    required TResult Function() emailAlreadyInUse,
    required TResult Function(String message) validation,
    required TResult Function() network,
    required TResult Function() sessionExpired,
    required TResult Function(String message) unexpected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalidCredentials,
    TResult? Function()? emailAlreadyInUse,
    TResult? Function(String message)? validation,
    TResult? Function()? network,
    TResult? Function()? sessionExpired,
    TResult? Function(String message)? unexpected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidCredentials,
    TResult Function()? emailAlreadyInUse,
    TResult Function(String message)? validation,
    TResult Function()? network,
    TResult Function()? sessionExpired,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidCredentialsFailure value)
    invalidCredentials,
    required TResult Function(EmailAlreadyInUseFailure value) emailAlreadyInUse,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(NetworkFailure value)? network,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InvalidCredentialsFailureImplCopyWith<$Res> {
  factory _$$InvalidCredentialsFailureImplCopyWith(
    _$InvalidCredentialsFailureImpl value,
    $Res Function(_$InvalidCredentialsFailureImpl) then,
  ) = __$$InvalidCredentialsFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InvalidCredentialsFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$InvalidCredentialsFailureImpl>
    implements _$$InvalidCredentialsFailureImplCopyWith<$Res> {
  __$$InvalidCredentialsFailureImplCopyWithImpl(
    _$InvalidCredentialsFailureImpl _value,
    $Res Function(_$InvalidCredentialsFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InvalidCredentialsFailureImpl implements InvalidCredentialsFailure {
  const _$InvalidCredentialsFailureImpl();

  @override
  String toString() {
    return 'Failure.invalidCredentials()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidCredentialsFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidCredentials,
    required TResult Function() emailAlreadyInUse,
    required TResult Function(String message) validation,
    required TResult Function() network,
    required TResult Function() sessionExpired,
    required TResult Function(String message) unexpected,
  }) {
    return invalidCredentials();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalidCredentials,
    TResult? Function()? emailAlreadyInUse,
    TResult? Function(String message)? validation,
    TResult? Function()? network,
    TResult? Function()? sessionExpired,
    TResult? Function(String message)? unexpected,
  }) {
    return invalidCredentials?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidCredentials,
    TResult Function()? emailAlreadyInUse,
    TResult Function(String message)? validation,
    TResult Function()? network,
    TResult Function()? sessionExpired,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) {
    if (invalidCredentials != null) {
      return invalidCredentials();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidCredentialsFailure value)
    invalidCredentials,
    required TResult Function(EmailAlreadyInUseFailure value) emailAlreadyInUse,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return invalidCredentials(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return invalidCredentials?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(NetworkFailure value)? network,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (invalidCredentials != null) {
      return invalidCredentials(this);
    }
    return orElse();
  }
}

abstract class InvalidCredentialsFailure implements Failure {
  const factory InvalidCredentialsFailure() = _$InvalidCredentialsFailureImpl;
}

/// @nodoc
abstract class _$$EmailAlreadyInUseFailureImplCopyWith<$Res> {
  factory _$$EmailAlreadyInUseFailureImplCopyWith(
    _$EmailAlreadyInUseFailureImpl value,
    $Res Function(_$EmailAlreadyInUseFailureImpl) then,
  ) = __$$EmailAlreadyInUseFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EmailAlreadyInUseFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$EmailAlreadyInUseFailureImpl>
    implements _$$EmailAlreadyInUseFailureImplCopyWith<$Res> {
  __$$EmailAlreadyInUseFailureImplCopyWithImpl(
    _$EmailAlreadyInUseFailureImpl _value,
    $Res Function(_$EmailAlreadyInUseFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EmailAlreadyInUseFailureImpl implements EmailAlreadyInUseFailure {
  const _$EmailAlreadyInUseFailureImpl();

  @override
  String toString() {
    return 'Failure.emailAlreadyInUse()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EmailAlreadyInUseFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidCredentials,
    required TResult Function() emailAlreadyInUse,
    required TResult Function(String message) validation,
    required TResult Function() network,
    required TResult Function() sessionExpired,
    required TResult Function(String message) unexpected,
  }) {
    return emailAlreadyInUse();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalidCredentials,
    TResult? Function()? emailAlreadyInUse,
    TResult? Function(String message)? validation,
    TResult? Function()? network,
    TResult? Function()? sessionExpired,
    TResult? Function(String message)? unexpected,
  }) {
    return emailAlreadyInUse?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidCredentials,
    TResult Function()? emailAlreadyInUse,
    TResult Function(String message)? validation,
    TResult Function()? network,
    TResult Function()? sessionExpired,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) {
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidCredentialsFailure value)
    invalidCredentials,
    required TResult Function(EmailAlreadyInUseFailure value) emailAlreadyInUse,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return emailAlreadyInUse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return emailAlreadyInUse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(NetworkFailure value)? network,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse(this);
    }
    return orElse();
  }
}

abstract class EmailAlreadyInUseFailure implements Failure {
  const factory EmailAlreadyInUseFailure() = _$EmailAlreadyInUseFailureImpl;
}

/// @nodoc
abstract class _$$ValidationFailureImplCopyWith<$Res> {
  factory _$$ValidationFailureImplCopyWith(
    _$ValidationFailureImpl value,
    $Res Function(_$ValidationFailureImpl) then,
  ) = __$$ValidationFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ValidationFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ValidationFailureImpl>
    implements _$$ValidationFailureImplCopyWith<$Res> {
  __$$ValidationFailureImplCopyWithImpl(
    _$ValidationFailureImpl _value,
    $Res Function(_$ValidationFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ValidationFailureImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ValidationFailureImpl implements ValidationFailure {
  const _$ValidationFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.validation(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationFailureImplCopyWith<_$ValidationFailureImpl> get copyWith =>
      __$$ValidationFailureImplCopyWithImpl<_$ValidationFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidCredentials,
    required TResult Function() emailAlreadyInUse,
    required TResult Function(String message) validation,
    required TResult Function() network,
    required TResult Function() sessionExpired,
    required TResult Function(String message) unexpected,
  }) {
    return validation(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalidCredentials,
    TResult? Function()? emailAlreadyInUse,
    TResult? Function(String message)? validation,
    TResult? Function()? network,
    TResult? Function()? sessionExpired,
    TResult? Function(String message)? unexpected,
  }) {
    return validation?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidCredentials,
    TResult Function()? emailAlreadyInUse,
    TResult Function(String message)? validation,
    TResult Function()? network,
    TResult Function()? sessionExpired,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidCredentialsFailure value)
    invalidCredentials,
    required TResult Function(EmailAlreadyInUseFailure value) emailAlreadyInUse,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return validation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return validation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(NetworkFailure value)? network,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (validation != null) {
      return validation(this);
    }
    return orElse();
  }
}

abstract class ValidationFailure implements Failure {
  const factory ValidationFailure(final String message) =
      _$ValidationFailureImpl;

  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationFailureImplCopyWith<_$ValidationFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkFailureImplCopyWith<$Res> {
  factory _$$NetworkFailureImplCopyWith(
    _$NetworkFailureImpl value,
    $Res Function(_$NetworkFailureImpl) then,
  ) = __$$NetworkFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NetworkFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NetworkFailureImpl>
    implements _$$NetworkFailureImplCopyWith<$Res> {
  __$$NetworkFailureImplCopyWithImpl(
    _$NetworkFailureImpl _value,
    $Res Function(_$NetworkFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NetworkFailureImpl implements NetworkFailure {
  const _$NetworkFailureImpl();

  @override
  String toString() {
    return 'Failure.network()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NetworkFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidCredentials,
    required TResult Function() emailAlreadyInUse,
    required TResult Function(String message) validation,
    required TResult Function() network,
    required TResult Function() sessionExpired,
    required TResult Function(String message) unexpected,
  }) {
    return network();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalidCredentials,
    TResult? Function()? emailAlreadyInUse,
    TResult? Function(String message)? validation,
    TResult? Function()? network,
    TResult? Function()? sessionExpired,
    TResult? Function(String message)? unexpected,
  }) {
    return network?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidCredentials,
    TResult Function()? emailAlreadyInUse,
    TResult Function(String message)? validation,
    TResult Function()? network,
    TResult Function()? sessionExpired,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidCredentialsFailure value)
    invalidCredentials,
    required TResult Function(EmailAlreadyInUseFailure value) emailAlreadyInUse,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(NetworkFailure value)? network,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkFailure implements Failure {
  const factory NetworkFailure() = _$NetworkFailureImpl;
}

/// @nodoc
abstract class _$$SessionExpiredFailureImplCopyWith<$Res> {
  factory _$$SessionExpiredFailureImplCopyWith(
    _$SessionExpiredFailureImpl value,
    $Res Function(_$SessionExpiredFailureImpl) then,
  ) = __$$SessionExpiredFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SessionExpiredFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$SessionExpiredFailureImpl>
    implements _$$SessionExpiredFailureImplCopyWith<$Res> {
  __$$SessionExpiredFailureImplCopyWithImpl(
    _$SessionExpiredFailureImpl _value,
    $Res Function(_$SessionExpiredFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SessionExpiredFailureImpl implements SessionExpiredFailure {
  const _$SessionExpiredFailureImpl();

  @override
  String toString() {
    return 'Failure.sessionExpired()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionExpiredFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidCredentials,
    required TResult Function() emailAlreadyInUse,
    required TResult Function(String message) validation,
    required TResult Function() network,
    required TResult Function() sessionExpired,
    required TResult Function(String message) unexpected,
  }) {
    return sessionExpired();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalidCredentials,
    TResult? Function()? emailAlreadyInUse,
    TResult? Function(String message)? validation,
    TResult? Function()? network,
    TResult? Function()? sessionExpired,
    TResult? Function(String message)? unexpected,
  }) {
    return sessionExpired?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidCredentials,
    TResult Function()? emailAlreadyInUse,
    TResult Function(String message)? validation,
    TResult Function()? network,
    TResult Function()? sessionExpired,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) {
    if (sessionExpired != null) {
      return sessionExpired();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidCredentialsFailure value)
    invalidCredentials,
    required TResult Function(EmailAlreadyInUseFailure value) emailAlreadyInUse,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return sessionExpired(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return sessionExpired?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(NetworkFailure value)? network,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (sessionExpired != null) {
      return sessionExpired(this);
    }
    return orElse();
  }
}

abstract class SessionExpiredFailure implements Failure {
  const factory SessionExpiredFailure() = _$SessionExpiredFailureImpl;
}

/// @nodoc
abstract class _$$UnexpectedFailureImplCopyWith<$Res> {
  factory _$$UnexpectedFailureImplCopyWith(
    _$UnexpectedFailureImpl value,
    $Res Function(_$UnexpectedFailureImpl) then,
  ) = __$$UnexpectedFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnexpectedFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnexpectedFailureImpl>
    implements _$$UnexpectedFailureImplCopyWith<$Res> {
  __$$UnexpectedFailureImplCopyWithImpl(
    _$UnexpectedFailureImpl _value,
    $Res Function(_$UnexpectedFailureImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$UnexpectedFailureImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$UnexpectedFailureImpl implements UnexpectedFailure {
  const _$UnexpectedFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.unexpected(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnexpectedFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnexpectedFailureImplCopyWith<_$UnexpectedFailureImpl> get copyWith =>
      __$$UnexpectedFailureImplCopyWithImpl<_$UnexpectedFailureImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() invalidCredentials,
    required TResult Function() emailAlreadyInUse,
    required TResult Function(String message) validation,
    required TResult Function() network,
    required TResult Function() sessionExpired,
    required TResult Function(String message) unexpected,
  }) {
    return unexpected(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? invalidCredentials,
    TResult? Function()? emailAlreadyInUse,
    TResult? Function(String message)? validation,
    TResult? Function()? network,
    TResult? Function()? sessionExpired,
    TResult? Function(String message)? unexpected,
  }) {
    return unexpected?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? invalidCredentials,
    TResult Function()? emailAlreadyInUse,
    TResult Function(String message)? validation,
    TResult Function()? network,
    TResult Function()? sessionExpired,
    TResult Function(String message)? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidCredentialsFailure value)
    invalidCredentials,
    required TResult Function(EmailAlreadyInUseFailure value) emailAlreadyInUse,
    required TResult Function(ValidationFailure value) validation,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(SessionExpiredFailure value) sessionExpired,
    required TResult Function(UnexpectedFailure value) unexpected,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult? Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult? Function(ValidationFailure value)? validation,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(SessionExpiredFailure value)? sessionExpired,
    TResult? Function(UnexpectedFailure value)? unexpected,
  }) {
    return unexpected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidCredentialsFailure value)? invalidCredentials,
    TResult Function(EmailAlreadyInUseFailure value)? emailAlreadyInUse,
    TResult Function(ValidationFailure value)? validation,
    TResult Function(NetworkFailure value)? network,
    TResult Function(SessionExpiredFailure value)? sessionExpired,
    TResult Function(UnexpectedFailure value)? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class UnexpectedFailure implements Failure {
  const factory UnexpectedFailure(final String message) =
      _$UnexpectedFailureImpl;

  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnexpectedFailureImplCopyWith<_$UnexpectedFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
