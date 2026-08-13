// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

SystemData _$SystemDataFromJson(Map<String, dynamic> json) {
  return _SystemData.fromJson(json);
}

/// @nodoc
mixin _$SystemData {
  SystemAction get action => throw _privateConstructorUsedError;
  PartialUser get target => throw _privateConstructorUsedError;

  /// Serializes this SystemData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SystemData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SystemDataCopyWith<SystemData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SystemDataCopyWith<$Res> {
  factory $SystemDataCopyWith(
    SystemData value,
    $Res Function(SystemData) then,
  ) = _$SystemDataCopyWithImpl<$Res, SystemData>;
  @useResult
  $Res call({SystemAction action, PartialUser target});

  $PartialUserCopyWith<$Res> get target;
}

/// @nodoc
class _$SystemDataCopyWithImpl<$Res, $Val extends SystemData>
    implements $SystemDataCopyWith<$Res> {
  _$SystemDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SystemData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? action = null, Object? target = null}) {
    return _then(
      _value.copyWith(
            action: null == action
                ? _value.action
                : action // ignore: cast_nullable_to_non_nullable
                      as SystemAction,
            target: null == target
                ? _value.target
                : target // ignore: cast_nullable_to_non_nullable
                      as PartialUser,
          )
          as $Val,
    );
  }

  /// Create a copy of SystemData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PartialUserCopyWith<$Res> get target {
    return $PartialUserCopyWith<$Res>(_value.target, (value) {
      return _then(_value.copyWith(target: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SystemDataImplCopyWith<$Res>
    implements $SystemDataCopyWith<$Res> {
  factory _$$SystemDataImplCopyWith(
    _$SystemDataImpl value,
    $Res Function(_$SystemDataImpl) then,
  ) = __$$SystemDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SystemAction action, PartialUser target});

  @override
  $PartialUserCopyWith<$Res> get target;
}

/// @nodoc
class __$$SystemDataImplCopyWithImpl<$Res>
    extends _$SystemDataCopyWithImpl<$Res, _$SystemDataImpl>
    implements _$$SystemDataImplCopyWith<$Res> {
  __$$SystemDataImplCopyWithImpl(
    _$SystemDataImpl _value,
    $Res Function(_$SystemDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SystemData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? action = null, Object? target = null}) {
    return _then(
      _$SystemDataImpl(
        action: null == action
            ? _value.action
            : action // ignore: cast_nullable_to_non_nullable
                  as SystemAction,
        target: null == target
            ? _value.target
            : target // ignore: cast_nullable_to_non_nullable
                  as PartialUser,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SystemDataImpl implements _SystemData {
  const _$SystemDataImpl({required this.action, required this.target});

  factory _$SystemDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SystemDataImplFromJson(json);

  @override
  final SystemAction action;
  @override
  final PartialUser target;

  @override
  String toString() {
    return 'SystemData(action: $action, target: $target)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SystemDataImpl &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.target, target) || other.target == target));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, action, target);

  /// Create a copy of SystemData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SystemDataImplCopyWith<_$SystemDataImpl> get copyWith =>
      __$$SystemDataImplCopyWithImpl<_$SystemDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SystemDataImplToJson(this);
  }
}

abstract class _SystemData implements SystemData {
  const factory _SystemData({
    required final SystemAction action,
    required final PartialUser target,
  }) = _$SystemDataImpl;

  factory _SystemData.fromJson(Map<String, dynamic> json) =
      _$SystemDataImpl.fromJson;

  @override
  SystemAction get action;
  @override
  PartialUser get target;

  /// Create a copy of SystemData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SystemDataImplCopyWith<_$SystemDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Attachment _$AttachmentFromJson(Map<String, dynamic> json) {
  return _Attachment.fromJson(json);
}

/// @nodoc
mixin _$Attachment {
  String get url => throw _privateConstructorUsedError;
  AttachmentType get type => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;

  /// Serializes this Attachment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Attachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AttachmentCopyWith<Attachment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttachmentCopyWith<$Res> {
  factory $AttachmentCopyWith(
    Attachment value,
    $Res Function(Attachment) then,
  ) = _$AttachmentCopyWithImpl<$Res, Attachment>;
  @useResult
  $Res call({String url, AttachmentType type, String? name, int? size});
}

/// @nodoc
class _$AttachmentCopyWithImpl<$Res, $Val extends Attachment>
    implements $AttachmentCopyWith<$Res> {
  _$AttachmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Attachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? type = null,
    Object? name = freezed,
    Object? size = freezed,
  }) {
    return _then(
      _value.copyWith(
            url: null == url
                ? _value.url
                : url // ignore: cast_nullable_to_non_nullable
                      as String,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as AttachmentType,
            name: freezed == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String?,
            size: freezed == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as int?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AttachmentImplCopyWith<$Res>
    implements $AttachmentCopyWith<$Res> {
  factory _$$AttachmentImplCopyWith(
    _$AttachmentImpl value,
    $Res Function(_$AttachmentImpl) then,
  ) = __$$AttachmentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url, AttachmentType type, String? name, int? size});
}

/// @nodoc
class __$$AttachmentImplCopyWithImpl<$Res>
    extends _$AttachmentCopyWithImpl<$Res, _$AttachmentImpl>
    implements _$$AttachmentImplCopyWith<$Res> {
  __$$AttachmentImplCopyWithImpl(
    _$AttachmentImpl _value,
    $Res Function(_$AttachmentImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Attachment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? type = null,
    Object? name = freezed,
    Object? size = freezed,
  }) {
    return _then(
      _$AttachmentImpl(
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as AttachmentType,
        name: freezed == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String?,
        size: freezed == size
            ? _value.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AttachmentImpl implements _Attachment {
  const _$AttachmentImpl({
    required this.url,
    this.type = AttachmentType.file,
    this.name,
    this.size,
  });

  factory _$AttachmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$AttachmentImplFromJson(json);

  @override
  final String url;
  @override
  @JsonKey()
  final AttachmentType type;
  @override
  final String? name;
  @override
  final int? size;

  @override
  String toString() {
    return 'Attachment(url: $url, type: $type, name: $name, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AttachmentImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.size, size) || other.size == size));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, type, name, size);

  /// Create a copy of Attachment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AttachmentImplCopyWith<_$AttachmentImpl> get copyWith =>
      __$$AttachmentImplCopyWithImpl<_$AttachmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AttachmentImplToJson(this);
  }
}

abstract class _Attachment implements Attachment {
  const factory _Attachment({
    required final String url,
    final AttachmentType type,
    final String? name,
    final int? size,
  }) = _$AttachmentImpl;

  factory _Attachment.fromJson(Map<String, dynamic> json) =
      _$AttachmentImpl.fromJson;

  @override
  String get url;
  @override
  AttachmentType get type;
  @override
  String? get name;
  @override
  int? get size;

  /// Create a copy of Attachment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AttachmentImplCopyWith<_$AttachmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  String get id => throw _privateConstructorUsedError;
  String get room => throw _privateConstructorUsedError;
  PartialUser get sender =>
      throw _privateConstructorUsedError; // populate('sender', 'username avatarUrl') — всегда объект
  String get text => throw _privateConstructorUsedError;
  List<Attachment> get attachments => throw _privateConstructorUsedError;
  List<String> get readBy => throw _privateConstructorUsedError;
  DateTime? get editedAt => throw _privateConstructorUsedError;
  bool get isDeleted => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  MessageType get type => throw _privateConstructorUsedError;
  SystemData? get systemData => throw _privateConstructorUsedError;

  /// Serializes this Message to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call({
    String id,
    String room,
    PartialUser sender,
    String text,
    List<Attachment> attachments,
    List<String> readBy,
    DateTime? editedAt,
    bool isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    MessageType type,
    SystemData? systemData,
  });

  $PartialUserCopyWith<$Res> get sender;
  $SystemDataCopyWith<$Res>? get systemData;
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? room = null,
    Object? sender = null,
    Object? text = null,
    Object? attachments = null,
    Object? readBy = null,
    Object? editedAt = freezed,
    Object? isDeleted = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? type = null,
    Object? systemData = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            room: null == room
                ? _value.room
                : room // ignore: cast_nullable_to_non_nullable
                      as String,
            sender: null == sender
                ? _value.sender
                : sender // ignore: cast_nullable_to_non_nullable
                      as PartialUser,
            text: null == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String,
            attachments: null == attachments
                ? _value.attachments
                : attachments // ignore: cast_nullable_to_non_nullable
                      as List<Attachment>,
            readBy: null == readBy
                ? _value.readBy
                : readBy // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            editedAt: freezed == editedAt
                ? _value.editedAt
                : editedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            isDeleted: null == isDeleted
                ? _value.isDeleted
                : isDeleted // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            updatedAt: freezed == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            type: null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as MessageType,
            systemData: freezed == systemData
                ? _value.systemData
                : systemData // ignore: cast_nullable_to_non_nullable
                      as SystemData?,
          )
          as $Val,
    );
  }

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PartialUserCopyWith<$Res> get sender {
    return $PartialUserCopyWith<$Res>(_value.sender, (value) {
      return _then(_value.copyWith(sender: value) as $Val);
    });
  }

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SystemDataCopyWith<$Res>? get systemData {
    if (_value.systemData == null) {
      return null;
    }

    return $SystemDataCopyWith<$Res>(_value.systemData!, (value) {
      return _then(_value.copyWith(systemData: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageImplCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$MessageImplCopyWith(
    _$MessageImpl value,
    $Res Function(_$MessageImpl) then,
  ) = __$$MessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String room,
    PartialUser sender,
    String text,
    List<Attachment> attachments,
    List<String> readBy,
    DateTime? editedAt,
    bool isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    MessageType type,
    SystemData? systemData,
  });

  @override
  $PartialUserCopyWith<$Res> get sender;
  @override
  $SystemDataCopyWith<$Res>? get systemData;
}

/// @nodoc
class __$$MessageImplCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$MessageImpl>
    implements _$$MessageImplCopyWith<$Res> {
  __$$MessageImplCopyWithImpl(
    _$MessageImpl _value,
    $Res Function(_$MessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? room = null,
    Object? sender = null,
    Object? text = null,
    Object? attachments = null,
    Object? readBy = null,
    Object? editedAt = freezed,
    Object? isDeleted = null,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? type = null,
    Object? systemData = freezed,
  }) {
    return _then(
      _$MessageImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        room: null == room
            ? _value.room
            : room // ignore: cast_nullable_to_non_nullable
                  as String,
        sender: null == sender
            ? _value.sender
            : sender // ignore: cast_nullable_to_non_nullable
                  as PartialUser,
        text: null == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String,
        attachments: null == attachments
            ? _value._attachments
            : attachments // ignore: cast_nullable_to_non_nullable
                  as List<Attachment>,
        readBy: null == readBy
            ? _value._readBy
            : readBy // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        editedAt: freezed == editedAt
            ? _value.editedAt
            : editedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        isDeleted: null == isDeleted
            ? _value.isDeleted
            : isDeleted // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        updatedAt: freezed == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        type: null == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as MessageType,
        systemData: freezed == systemData
            ? _value.systemData
            : systemData // ignore: cast_nullable_to_non_nullable
                  as SystemData?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageImpl implements _Message {
  const _$MessageImpl({
    required this.id,
    required this.room,
    required this.sender,
    this.text = '',
    final List<Attachment> attachments = const [],
    final List<String> readBy = const [],
    this.editedAt,
    this.isDeleted = false,
    this.createdAt,
    this.updatedAt,
    this.type = MessageType.text,
    this.systemData,
  }) : _attachments = attachments,
       _readBy = readBy;

  factory _$MessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageImplFromJson(json);

  @override
  final String id;
  @override
  final String room;
  @override
  final PartialUser sender;
  // populate('sender', 'username avatarUrl') — всегда объект
  @override
  @JsonKey()
  final String text;
  final List<Attachment> _attachments;
  @override
  @JsonKey()
  List<Attachment> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  final List<String> _readBy;
  @override
  @JsonKey()
  List<String> get readBy {
    if (_readBy is EqualUnmodifiableListView) return _readBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_readBy);
  }

  @override
  final DateTime? editedAt;
  @override
  @JsonKey()
  final bool isDeleted;
  @override
  final DateTime? createdAt;
  @override
  final DateTime? updatedAt;
  @override
  @JsonKey()
  final MessageType type;
  @override
  final SystemData? systemData;

  @override
  String toString() {
    return 'Message(id: $id, room: $room, sender: $sender, text: $text, attachments: $attachments, readBy: $readBy, editedAt: $editedAt, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt, type: $type, systemData: $systemData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.room, room) || other.room == room) &&
            (identical(other.sender, sender) || other.sender == sender) &&
            (identical(other.text, text) || other.text == text) &&
            const DeepCollectionEquality().equals(
              other._attachments,
              _attachments,
            ) &&
            const DeepCollectionEquality().equals(other._readBy, _readBy) &&
            (identical(other.editedAt, editedAt) ||
                other.editedAt == editedAt) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.systemData, systemData) ||
                other.systemData == systemData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    room,
    sender,
    text,
    const DeepCollectionEquality().hash(_attachments),
    const DeepCollectionEquality().hash(_readBy),
    editedAt,
    isDeleted,
    createdAt,
    updatedAt,
    type,
    systemData,
  );

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      __$$MessageImplCopyWithImpl<_$MessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageImplToJson(this);
  }
}

abstract class _Message implements Message {
  const factory _Message({
    required final String id,
    required final String room,
    required final PartialUser sender,
    final String text,
    final List<Attachment> attachments,
    final List<String> readBy,
    final DateTime? editedAt,
    final bool isDeleted,
    final DateTime? createdAt,
    final DateTime? updatedAt,
    final MessageType type,
    final SystemData? systemData,
  }) = _$MessageImpl;

  factory _Message.fromJson(Map<String, dynamic> json) = _$MessageImpl.fromJson;

  @override
  String get id;
  @override
  String get room;
  @override
  PartialUser get sender; // populate('sender', 'username avatarUrl') — всегда объект
  @override
  String get text;
  @override
  List<Attachment> get attachments;
  @override
  List<String> get readBy;
  @override
  DateTime? get editedAt;
  @override
  bool get isDeleted;
  @override
  DateTime? get createdAt;
  @override
  DateTime? get updatedAt;
  @override
  MessageType get type;
  @override
  SystemData? get systemData;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
