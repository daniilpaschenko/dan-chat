// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ParticipantImpl _$$ParticipantImplFromJson(Map<String, dynamic> json) =>
    _$ParticipantImpl(
      user: PartialUser.fromJson(json['user'] as Map<String, dynamic>),
      role:
          $enumDecodeNullable(_$ParticipantRoleEnumMap, json['role']) ??
          ParticipantRole.member,
      joinedAt: json['joinedAt'] == null
          ? null
          : DateTime.parse(json['joinedAt'] as String),
    );

Map<String, dynamic> _$$ParticipantImplToJson(_$ParticipantImpl instance) =>
    <String, dynamic>{
      'user': instance.user,
      'role': _$ParticipantRoleEnumMap[instance.role]!,
      'joinedAt': instance.joinedAt?.toIso8601String(),
    };

const _$ParticipantRoleEnumMap = {
  ParticipantRole.owner: 'owner',
  ParticipantRole.admin: 'admin',
  ParticipantRole.member: 'member',
};

_$LastMessageImpl _$$LastMessageImplFromJson(Map<String, dynamic> json) =>
    _$LastMessageImpl(
      text: json['text'] as String?,
      sender: json['sender'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      readBy:
          (json['readBy'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      type:
          $enumDecodeNullable(_$LastMessageTypeDtoEnumMap, json['type']) ??
          LastMessageTypeDto.text,
      systemAction: $enumDecodeNullable(
        _$LastMessageSystemActionDtoEnumMap,
        json['systemAction'],
      ),
      systemActorUsername: json['systemActorUsername'] as String?,
      systemTargetUsername: json['systemTargetUsername'] as String?,
    );

Map<String, dynamic> _$$LastMessageImplToJson(
  _$LastMessageImpl instance,
) => <String, dynamic>{
  'text': instance.text,
  'sender': instance.sender,
  'createdAt': instance.createdAt?.toIso8601String(),
  'readBy': instance.readBy,
  'type': _$LastMessageTypeDtoEnumMap[instance.type]!,
  'systemAction': _$LastMessageSystemActionDtoEnumMap[instance.systemAction],
  'systemActorUsername': instance.systemActorUsername,
  'systemTargetUsername': instance.systemTargetUsername,
};

const _$LastMessageTypeDtoEnumMap = {
  LastMessageTypeDto.text: 'text',
  LastMessageTypeDto.system: 'system',
};

const _$LastMessageSystemActionDtoEnumMap = {
  LastMessageSystemActionDto.participantAdded: 'participant_added',
  LastMessageSystemActionDto.participantRemoved: 'participant_removed',
  LastMessageSystemActionDto.participantLeft: 'participant_left',
  LastMessageSystemActionDto.participantPromoted: 'participant_promoted',
  LastMessageSystemActionDto.participantDemoted: 'participant_demoted',
};

_$RoomImpl _$$RoomImplFromJson(Map<String, dynamic> json) => _$RoomImpl(
  id: json['id'] as String,
  type: $enumDecode(_$RoomTypeEnumMap, json['type']),
  name: json['name'] as String?,
  avatarUrl: json['avatarUrl'] as String?,
  participants: (json['participants'] as List<dynamic>)
      .map((e) => Participant.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdBy: json['createdBy'] as String,
  lastMessage: json['lastMessage'] == null
      ? null
      : LastMessage.fromJson(json['lastMessage'] as Map<String, dynamic>),
  unreadCount:
      (json['unreadCount'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ) ??
      const {},
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$$RoomImplToJson(_$RoomImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$RoomTypeEnumMap[instance.type]!,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'participants': instance.participants,
      'createdBy': instance.createdBy,
      'lastMessage': instance.lastMessage,
      'unreadCount': instance.unreadCount,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

const _$RoomTypeEnumMap = {RoomType.direct: 'direct', RoomType.group: 'group'};

_$RoomListItemImpl _$$RoomListItemImplFromJson(Map<String, dynamic> json) =>
    _$RoomListItemImpl(
      id: json['id'] as String,
      type: $enumDecode(_$RoomTypeEnumMap, json['type']),
      name: json['name'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      participants: (json['participants'] as List<dynamic>)
          .map((e) => Participant.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdBy: json['createdBy'] as String,
      lastMessage: json['lastMessage'] == null
          ? null
          : LastMessage.fromJson(json['lastMessage'] as Map<String, dynamic>),
      unreadCount: (json['unreadCount'] as num?)?.toInt() ?? 0,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$RoomListItemImplToJson(_$RoomListItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$RoomTypeEnumMap[instance.type]!,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'participants': instance.participants,
      'createdBy': instance.createdBy,
      'lastMessage': instance.lastMessage,
      'unreadCount': instance.unreadCount,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
