// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'room_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ParticipantEntity {
  PartialUserEntity get user => throw _privateConstructorUsedError;
  ParticipantRole get role => throw _privateConstructorUsedError;
  DateTime? get joinedAt => throw _privateConstructorUsedError;

  /// Create a copy of ParticipantEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParticipantEntityCopyWith<ParticipantEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParticipantEntityCopyWith<$Res> {
  factory $ParticipantEntityCopyWith(
    ParticipantEntity value,
    $Res Function(ParticipantEntity) then,
  ) = _$ParticipantEntityCopyWithImpl<$Res, ParticipantEntity>;
  @useResult
  $Res call({PartialUserEntity user, ParticipantRole role, DateTime? joinedAt});

  $PartialUserEntityCopyWith<$Res> get user;
}

/// @nodoc
class _$ParticipantEntityCopyWithImpl<$Res, $Val extends ParticipantEntity>
    implements $ParticipantEntityCopyWith<$Res> {
  _$ParticipantEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ParticipantEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? role = null,
    Object? joinedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            user: null == user
                ? _value.user
                : user // ignore: cast_nullable_to_non_nullable
                      as PartialUserEntity,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as ParticipantRole,
            joinedAt: freezed == joinedAt
                ? _value.joinedAt
                : joinedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }

  /// Create a copy of ParticipantEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PartialUserEntityCopyWith<$Res> get user {
    return $PartialUserEntityCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ParticipantEntityImplCopyWith<$Res>
    implements $ParticipantEntityCopyWith<$Res> {
  factory _$$ParticipantEntityImplCopyWith(
    _$ParticipantEntityImpl value,
    $Res Function(_$ParticipantEntityImpl) then,
  ) = __$$ParticipantEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PartialUserEntity user, ParticipantRole role, DateTime? joinedAt});

  @override
  $PartialUserEntityCopyWith<$Res> get user;
}

/// @nodoc
class __$$ParticipantEntityImplCopyWithImpl<$Res>
    extends _$ParticipantEntityCopyWithImpl<$Res, _$ParticipantEntityImpl>
    implements _$$ParticipantEntityImplCopyWith<$Res> {
  __$$ParticipantEntityImplCopyWithImpl(
    _$ParticipantEntityImpl _value,
    $Res Function(_$ParticipantEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ParticipantEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? role = null,
    Object? joinedAt = freezed,
  }) {
    return _then(
      _$ParticipantEntityImpl(
        user: null == user
            ? _value.user
            : user // ignore: cast_nullable_to_non_nullable
                  as PartialUserEntity,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as ParticipantRole,
        joinedAt: freezed == joinedAt
            ? _value.joinedAt
            : joinedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$ParticipantEntityImpl implements _ParticipantEntity {
  const _$ParticipantEntityImpl({
    required this.user,
    this.role = ParticipantRole.member,
    this.joinedAt,
  });

  @override
  final PartialUserEntity user;
  @override
  @JsonKey()
  final ParticipantRole role;
  @override
  final DateTime? joinedAt;

  @override
  String toString() {
    return 'ParticipantEntity(user: $user, role: $role, joinedAt: $joinedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParticipantEntityImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, role, joinedAt);

  /// Create a copy of ParticipantEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParticipantEntityImplCopyWith<_$ParticipantEntityImpl> get copyWith =>
      __$$ParticipantEntityImplCopyWithImpl<_$ParticipantEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _ParticipantEntity implements ParticipantEntity {
  const factory _ParticipantEntity({
    required final PartialUserEntity user,
    final ParticipantRole role,
    final DateTime? joinedAt,
  }) = _$ParticipantEntityImpl;

  @override
  PartialUserEntity get user;
  @override
  ParticipantRole get role;
  @override
  DateTime? get joinedAt;

  /// Create a copy of ParticipantEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParticipantEntityImplCopyWith<_$ParticipantEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LastMessageEntity {
  String? get text => throw _privateConstructorUsedError;
  String? get sender => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Create a copy of LastMessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LastMessageEntityCopyWith<LastMessageEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LastMessageEntityCopyWith<$Res> {
  factory $LastMessageEntityCopyWith(
    LastMessageEntity value,
    $Res Function(LastMessageEntity) then,
  ) = _$LastMessageEntityCopyWithImpl<$Res, LastMessageEntity>;
  @useResult
  $Res call({String? text, String? sender, DateTime? createdAt});
}

/// @nodoc
class _$LastMessageEntityCopyWithImpl<$Res, $Val extends LastMessageEntity>
    implements $LastMessageEntityCopyWith<$Res> {
  _$LastMessageEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LastMessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? sender = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            text: freezed == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String?,
            sender: freezed == sender
                ? _value.sender
                : sender // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$LastMessageEntityImplCopyWith<$Res>
    implements $LastMessageEntityCopyWith<$Res> {
  factory _$$LastMessageEntityImplCopyWith(
    _$LastMessageEntityImpl value,
    $Res Function(_$LastMessageEntityImpl) then,
  ) = __$$LastMessageEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? text, String? sender, DateTime? createdAt});
}

/// @nodoc
class __$$LastMessageEntityImplCopyWithImpl<$Res>
    extends _$LastMessageEntityCopyWithImpl<$Res, _$LastMessageEntityImpl>
    implements _$$LastMessageEntityImplCopyWith<$Res> {
  __$$LastMessageEntityImplCopyWithImpl(
    _$LastMessageEntityImpl _value,
    $Res Function(_$LastMessageEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of LastMessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? text = freezed,
    Object? sender = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$LastMessageEntityImpl(
        text: freezed == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String?,
        sender: freezed == sender
            ? _value.sender
            : sender // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc

class _$LastMessageEntityImpl implements _LastMessageEntity {
  const _$LastMessageEntityImpl({this.text, this.sender, this.createdAt});

  @override
  final String? text;
  @override
  final String? sender;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'LastMessageEntity(text: $text, sender: $sender, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LastMessageEntityImpl &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, text, sender, createdAt);

  /// Create a copy of LastMessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LastMessageEntityImplCopyWith<_$LastMessageEntityImpl> get copyWith =>
      __$$LastMessageEntityImplCopyWithImpl<_$LastMessageEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _LastMessageEntity implements LastMessageEntity {
  const factory _LastMessageEntity({
    final String? text,
    final String? sender,
    final DateTime? createdAt,
  }) = _$LastMessageEntityImpl;

  @override
  String? get text;
  @override
  String? get sender;
  @override
  DateTime? get createdAt;

  /// Create a copy of LastMessageEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LastMessageEntityImplCopyWith<_$LastMessageEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RoomEntity {
  String get id => throw _privateConstructorUsedError;
  RoomType get type => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  List<ParticipantEntity> get participants =>
      throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  LastMessageEntity? get lastMessage => throw _privateConstructorUsedError;
  Map<String, int> get unreadCount => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of RoomEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoomEntityCopyWith<RoomEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomEntityCopyWith<$Res> {
  factory $RoomEntityCopyWith(
    RoomEntity value,
    $Res Function(RoomEntity) then,
  ) = _$RoomEntityCopyWithImpl<$Res, RoomEntity>;
  @useResult
  $Res call({
    String id,
    RoomType type,
    String? name,
    String? avatarUrl,
    List<ParticipantEntity> participants,
    String createdBy,
    LastMessageEntity? lastMessage,
    Map<String, int> unreadCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  });

  $LastMessageEntityCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class _$RoomEntityCopyWithImpl<$Res, $Val extends RoomEntity>
    implements $RoomEntityCopyWith<$Res> {
  _$RoomEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoomEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = freezed,
    Object? avatarUrl = freezed,
    Object? participants = null,
    Object? createdBy = null,
    Object? lastMessage = freezed,
    Object? unreadCount = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as RoomType,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            participants: null == participants
                ? _value.participants
                : participants // ignore: cast_nullable_to_non_nullable
                      as List<ParticipantEntity>,
            createdBy: null == createdBy
                ? _value.createdBy
                : createdBy // ignore: cast_nullable_to_non_nullable
                      as String,
            lastMessage: freezed == lastMessage
                ? _value.lastMessage
                : lastMessage // ignore: cast_nullable_to_non_nullable
                      as LastMessageEntity?,
            unreadCount: null == unreadCount
                ? _value.unreadCount
                : unreadCount // ignore: cast_nullable_to_non_nullable
                      as Map<String, int>,
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

  /// Create a copy of RoomEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LastMessageEntityCopyWith<$Res>? get lastMessage {
    if (_value.lastMessage == null) {
      return null;
    }

    return $LastMessageEntityCopyWith<$Res>(_value.lastMessage!, (value) {
      return _then(_value.copyWith(lastMessage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RoomEntityImplCopyWith<$Res>
    implements $RoomEntityCopyWith<$Res> {
  factory _$$RoomEntityImplCopyWith(
    _$RoomEntityImpl value,
    $Res Function(_$RoomEntityImpl) then,
  ) = __$$RoomEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    RoomType type,
    String? name,
    String? avatarUrl,
    List<ParticipantEntity> participants,
    String createdBy,
    LastMessageEntity? lastMessage,
    Map<String, int> unreadCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  });

  @override
  $LastMessageEntityCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class __$$RoomEntityImplCopyWithImpl<$Res>
    extends _$RoomEntityCopyWithImpl<$Res, _$RoomEntityImpl>
    implements _$$RoomEntityImplCopyWith<$Res> {
  __$$RoomEntityImplCopyWithImpl(
    _$RoomEntityImpl _value,
    $Res Function(_$RoomEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RoomEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = freezed,
    Object? avatarUrl = freezed,
    Object? participants = null,
    Object? createdBy = null,
    Object? lastMessage = freezed,
    Object? unreadCount = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$RoomEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as RoomType,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        participants: null == participants
            ? _value._participants
            : participants // ignore: cast_nullable_to_non_nullable
                  as List<ParticipantEntity>,
        createdBy: null == createdBy
            ? _value.createdBy
            : createdBy // ignore: cast_nullable_to_non_nullable
                  as String,
        lastMessage: freezed == lastMessage
            ? _value.lastMessage
            : lastMessage // ignore: cast_nullable_to_non_nullable
                  as LastMessageEntity?,
        unreadCount: null == unreadCount
            ? _value._unreadCount
            : unreadCount // ignore: cast_nullable_to_non_nullable
                  as Map<String, int>,
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

class _$RoomEntityImpl implements _RoomEntity {
  const _$RoomEntityImpl({
    required this.id,
    required this.type,
    this.name,
    this.avatarUrl,
    required final List<ParticipantEntity> participants,
    required this.createdBy,
    this.lastMessage,
    final Map<String, int> unreadCount = const {},
    this.createdAt,
    this.updatedAt,
  }) : _participants = participants,
       _unreadCount = unreadCount;

  @override
  final String id;
  @override
  final RoomType type;
  @override
  final String? name;
  @override
  final String? avatarUrl;
  final List<ParticipantEntity> _participants;
  @override
  List<ParticipantEntity> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  final String createdBy;
  @override
  final LastMessageEntity? lastMessage;
  final Map<String, int> _unreadCount;
  @override
  @JsonKey()
  Map<String, int> get unreadCount {
    if (_unreadCount is EqualUnmodifiableMapView) return _unreadCount;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_unreadCount);
  }

  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'RoomEntity(id: $id, type: $type, name: $name, avatarUrl: $avatarUrl, participants: $participants, createdBy: $createdBy, lastMessage: $lastMessage, unreadCount: $unreadCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            const DeepCollectionEquality().equals(
              other._participants,
              _participants,
            ) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            const DeepCollectionEquality().equals(
              other._unreadCount,
              _unreadCount,
            ) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    type,
    name,
    avatarUrl,
    const DeepCollectionEquality().hash(_participants),
    createdBy,
    lastMessage,
    const DeepCollectionEquality().hash(_unreadCount),
    createdAt,
    updatedAt,
  );

  /// Create a copy of RoomEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomEntityImplCopyWith<_$RoomEntityImpl> get copyWith =>
      __$$RoomEntityImplCopyWithImpl<_$RoomEntityImpl>(this, _$identity);
}

abstract class _RoomEntity implements RoomEntity {
  const factory _RoomEntity({
    required final String id,
    required final RoomType type,
    final String? name,
    final String? avatarUrl,
    required final List<ParticipantEntity> participants,
    required final String createdBy,
    final LastMessageEntity? lastMessage,
    final Map<String, int> unreadCount,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$RoomEntityImpl;

  @override
  String get id;
  @override
  RoomType get type;
  @override
  String? get name;
  @override
  String? get avatarUrl;
  @override
  List<ParticipantEntity> get participants;
  @override
  String get createdBy;
  @override
  LastMessageEntity? get lastMessage;
  @override
  Map<String, int> get unreadCount;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of RoomEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoomEntityImplCopyWith<_$RoomEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RoomListItemEntity {
  String get id => throw _privateConstructorUsedError;
  RoomType get type => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  List<ParticipantEntity> get participants =>
      throw _privateConstructorUsedError;
  String get createdBy => throw _privateConstructorUsedError;
  LastMessageEntity? get lastMessage => throw _privateConstructorUsedError;
  int get unreadCount => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of RoomListItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RoomListItemEntityCopyWith<RoomListItemEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoomListItemEntityCopyWith<$Res> {
  factory $RoomListItemEntityCopyWith(
    RoomListItemEntity value,
    $Res Function(RoomListItemEntity) then,
  ) = _$RoomListItemEntityCopyWithImpl<$Res, RoomListItemEntity>;
  @useResult
  $Res call({
    String id,
    RoomType type,
    String? name,
    String? avatarUrl,
    List<ParticipantEntity> participants,
    String createdBy,
    LastMessageEntity? lastMessage,
    int unreadCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  });

  $LastMessageEntityCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class _$RoomListItemEntityCopyWithImpl<$Res, $Val extends RoomListItemEntity>
    implements $RoomListItemEntityCopyWith<$Res> {
  _$RoomListItemEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RoomListItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = freezed,
    Object? avatarUrl = freezed,
    Object? participants = null,
    Object? createdBy = null,
    Object? lastMessage = freezed,
    Object? unreadCount = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as RoomType,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            avatarUrl: freezed == avatarUrl
                ? _value.avatarUrl
                : avatarUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            participants: null == participants
                ? _value.participants
                : participants // ignore: cast_nullable_to_non_nullable
                      as List<ParticipantEntity>,
            createdBy: null == createdBy
                ? _value.createdBy
                : createdBy // ignore: cast_nullable_to_non_nullable
                      as String,
            lastMessage: freezed == lastMessage
                ? _value.lastMessage
                : lastMessage // ignore: cast_nullable_to_non_nullable
                      as LastMessageEntity?,
            unreadCount: null == unreadCount
                ? _value.unreadCount
                : unreadCount // ignore: cast_nullable_to_non_nullable
                      as int,
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

  /// Create a copy of RoomListItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LastMessageEntityCopyWith<$Res>? get lastMessage {
    if (_value.lastMessage == null) {
      return null;
    }

    return $LastMessageEntityCopyWith<$Res>(_value.lastMessage!, (value) {
      return _then(_value.copyWith(lastMessage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RoomListItemEntityImplCopyWith<$Res>
    implements $RoomListItemEntityCopyWith<$Res> {
  factory _$$RoomListItemEntityImplCopyWith(
    _$RoomListItemEntityImpl value,
    $Res Function(_$RoomListItemEntityImpl) then,
  ) = __$$RoomListItemEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    RoomType type,
    String? name,
    String? avatarUrl,
    List<ParticipantEntity> participants,
    String createdBy,
    LastMessageEntity? lastMessage,
    int unreadCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  });

  @override
  $LastMessageEntityCopyWith<$Res>? get lastMessage;
}

/// @nodoc
class __$$RoomListItemEntityImplCopyWithImpl<$Res>
    extends _$RoomListItemEntityCopyWithImpl<$Res, _$RoomListItemEntityImpl>
    implements _$$RoomListItemEntityImplCopyWith<$Res> {
  __$$RoomListItemEntityImplCopyWithImpl(
    _$RoomListItemEntityImpl _value,
    $Res Function(_$RoomListItemEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RoomListItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? name = freezed,
    Object? avatarUrl = freezed,
    Object? participants = null,
    Object? createdBy = null,
    Object? lastMessage = freezed,
    Object? unreadCount = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(
      _$RoomListItemEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as RoomType,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatarUrl: freezed == avatarUrl
            ? _value.avatarUrl
            : avatarUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        participants: null == participants
            ? _value._participants
            : participants // ignore: cast_nullable_to_non_nullable
                  as List<ParticipantEntity>,
        createdBy: null == createdBy
            ? _value.createdBy
            : createdBy // ignore: cast_nullable_to_non_nullable
                  as String,
        lastMessage: freezed == lastMessage
            ? _value.lastMessage
            : lastMessage // ignore: cast_nullable_to_non_nullable
                  as LastMessageEntity?,
        unreadCount: null == unreadCount
            ? _value.unreadCount
            : unreadCount // ignore: cast_nullable_to_non_nullable
                  as int,
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

class _$RoomListItemEntityImpl implements _RoomListItemEntity {
  const _$RoomListItemEntityImpl({
    required this.id,
    required this.type,
    this.name,
    this.avatarUrl,
    required final List<ParticipantEntity> participants,
    required this.createdBy,
    this.lastMessage,
    this.unreadCount = 0,
    this.createdAt,
    this.updatedAt,
  }) : _participants = participants;

  @override
  final String id;
  @override
  final RoomType type;
  @override
  final String? name;
  @override
  final String? avatarUrl;
  final List<ParticipantEntity> _participants;
  @override
  List<ParticipantEntity> get participants {
    if (_participants is EqualUnmodifiableListView) return _participants;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participants);
  }

  @override
  final String createdBy;
  @override
  final LastMessageEntity? lastMessage;
  @override
  @JsonKey()
  final int unreadCount;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'RoomListItemEntity(id: $id, type: $type, name: $name, avatarUrl: $avatarUrl, participants: $participants, createdBy: $createdBy, lastMessage: $lastMessage, unreadCount: $unreadCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RoomListItemEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            const DeepCollectionEquality().equals(
              other._participants,
              _participants,
            ) &&
            (identical(other.createdBy, createdBy) ||
                other.createdBy == createdBy) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    type,
    name,
    avatarUrl,
    const DeepCollectionEquality().hash(_participants),
    createdBy,
    lastMessage,
    unreadCount,
    createdAt,
    updatedAt,
  );

  /// Create a copy of RoomListItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RoomListItemEntityImplCopyWith<_$RoomListItemEntityImpl> get copyWith =>
      __$$RoomListItemEntityImplCopyWithImpl<_$RoomListItemEntityImpl>(
        this,
        _$identity,
      );
}

abstract class _RoomListItemEntity implements RoomListItemEntity {
  const factory _RoomListItemEntity({
    required final String id,
    required final RoomType type,
    final String? name,
    final String? avatarUrl,
    required final List<ParticipantEntity> participants,
    required final String createdBy,
    final LastMessageEntity? lastMessage,
    final int unreadCount,
    final DateTime? createdAt,
    final DateTime? updatedAt,
  }) = _$RoomListItemEntityImpl;

  @override
  String get id;
  @override
  RoomType get type;
  @override
  String? get name;
  @override
  String? get avatarUrl;
  @override
  List<ParticipantEntity> get participants;
  @override
  String get createdBy;
  @override
  LastMessageEntity? get lastMessage;
  @override
  int get unreadCount;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;

  /// Create a copy of RoomListItemEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RoomListItemEntityImplCopyWith<_$RoomListItemEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
