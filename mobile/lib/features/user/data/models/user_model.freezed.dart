// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  String? get avatarPublicId => throw _privateConstructorUsedError;
  UserStatus get status => throw _privateConstructorUsedError;
  DateTime? get lastSeen => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this User to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call({
    String id,
    String username,
    String email,
    String? avatarUrl,
    String? avatarPublicId,
    UserStatus status,
    DateTime? lastSeen,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? avatarUrl = freezed,
    Object? avatarPublicId = freezed,
    Object? status = null,
    Object? lastSeen = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            email: null == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            avatarPublicId: freezed == avatarPublicId
                ? _value.avatarPublicId
                : avatarPublicId // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as UserStatus,
            lastSeen: freezed == lastSeen
                ? _value.lastSeen
                : lastSeen // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
    _$UserImpl value,
    $Res Function(_$UserImpl) then,
  ) = __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String username,
    String email,
    String? avatarUrl,
    String? avatarPublicId,
    UserStatus status,
    DateTime? lastSeen,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
    : super(_value, _then);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? email = null,
    Object? avatarUrl = freezed,
    Object? avatarPublicId = freezed,
    Object? status = null,
    Object? lastSeen = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$UserImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        email: null == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatarPublicId: freezed == avatarPublicId
            ? _value.avatarPublicId
            : avatarPublicId // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as UserStatus,
        lastSeen: freezed == lastSeen
            ? _value.lastSeen
            : lastSeen // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl({
    required this.id,
    required this.username,
    required this.email,
    this.avatarUrl,
    this.avatarPublicId,
    this.status = UserStatus.offline,
    this.lastSeen,
    this.createdAt,
    this.updatedAt,
  });

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  final String email;
  @override
  final String? avatarUrl;
  @override
  final String? avatarPublicId;
  @override
  @JsonKey()
  final UserStatus status;
  @override
  final DateTime? lastSeen;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email, avatarUrl: $avatarUrl, avatarPublicId: $avatarPublicId, status: $status, lastSeen: $lastSeen, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.avatarPublicId, avatarPublicId) ||
                other.avatarPublicId == avatarPublicId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    username,
    email,
    avatarUrl,
    avatarPublicId,
    status,
    lastSeen,
    createdAt,
    updatedAt,
  );

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(this);
  }
}

abstract class _User implements User {
  const factory _User({
    required final String id,
    required final String username,
    required final String email,
    final String? avatarUrl,
    final String? avatarPublicId,
    final UserStatus status,
    final DateTime? lastSeen,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  String get email;
  @override
  String? get avatarUrl;
  @override
  String? get avatarPublicId;
  @override
  UserStatus get status;
  @override
  DateTime? get lastSeen;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PartialUser _$PartialUserFromJson(Map<String, dynamic> json) {
  return _PartialUser.fromJson(json);
}

/// @nodoc
mixin _$PartialUser {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  UserStatus? get status => throw _privateConstructorUsedError;
  DateTime? get lastSeen => throw _privateConstructorUsedError;

  /// Serializes this PartialUser to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PartialUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PartialUserCopyWith<PartialUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PartialUserCopyWith<$Res> {
  factory $PartialUserCopyWith(
    PartialUser value,
    $Res Function(PartialUser) then,
  ) = _$PartialUserCopyWithImpl<$Res, PartialUser>;
  @useResult
  $Res call({
    String id,
    String username,
    String? avatarUrl,
    UserStatus? status,
    DateTime? lastSeen,
  });
}

/// @nodoc
class _$PartialUserCopyWithImpl<$Res, $Val extends PartialUser>
    implements $PartialUserCopyWith<$Res> {
  _$PartialUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PartialUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? avatarUrl = freezed,
    Object? status = freezed,
    Object? lastSeen = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            username: null == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as UserStatus?,
            lastSeen: freezed == lastSeen
                ? _value.lastSeen
                : lastSeen // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PartialUserImplCopyWith<$Res>
    implements $PartialUserCopyWith<$Res> {
  factory _$$PartialUserImplCopyWith(
    _$PartialUserImpl value,
    $Res Function(_$PartialUserImpl) then,
  ) = __$$PartialUserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String username,
    String? avatarUrl,
    UserStatus? status,
    DateTime? lastSeen,
  });
}

/// @nodoc
class __$$PartialUserImplCopyWithImpl<$Res>
    extends _$PartialUserCopyWithImpl<$Res, _$PartialUserImpl>
    implements _$$PartialUserImplCopyWith<$Res> {
  __$$PartialUserImplCopyWithImpl(
    _$PartialUserImpl _value,
    $Res Function(_$PartialUserImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PartialUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? avatarUrl = freezed,
    Object? status = freezed,
    Object? lastSeen = freezed,
  }) {
    return _then(
      _$PartialUserImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        username: null == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as UserStatus?,
        lastSeen: freezed == lastSeen
            ? _value.lastSeen
            : lastSeen // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PartialUserImpl implements _PartialUser {
  const _$PartialUserImpl({
    required this.id,
    required this.username,
    this.avatarUrl,
    this.status,
    this.lastSeen,
  });

  factory _$PartialUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$PartialUserImplFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  final String? avatarUrl;
  @override
  final UserStatus? status;
  @override
  final DateTime? lastSeen;

  @override
  String toString() {
    return 'PartialUser(id: $id, username: $username, avatarUrl: $avatarUrl, status: $status, lastSeen: $lastSeen)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PartialUserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, username, avatarUrl, status, lastSeen);

  /// Create a copy of PartialUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PartialUserImplCopyWith<_$PartialUserImpl> get copyWith =>
      __$$PartialUserImplCopyWithImpl<_$PartialUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PartialUserImplToJson(this);
  }
}

abstract class _PartialUser implements PartialUser {
  const factory _PartialUser({
    required final String id,
    required final String username,
    final String? avatarUrl,
    final UserStatus? status,
    final DateTime? lastSeen,
  }) = _$PartialUserImpl;

  factory _PartialUser.fromJson(Map<String, dynamic> json) =
      _$PartialUserImpl.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  String? get avatarUrl;
  @override
  UserStatus? get status;
  @override
  DateTime? get lastSeen;

  /// Create a copy of PartialUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PartialUserImplCopyWith<_$PartialUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
