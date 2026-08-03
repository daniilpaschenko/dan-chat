// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AttachmentImpl _$$AttachmentImplFromJson(Map<String, dynamic> json) =>
    _$AttachmentImpl(
      url: json['url'] as String,
      type:
          $enumDecodeNullable(_$AttachmentTypeEnumMap, json['type']) ??
          AttachmentType.file,
      name: json['name'] as String?,
      size: (json['size'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AttachmentImplToJson(_$AttachmentImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'type': _$AttachmentTypeEnumMap[instance.type]!,
      'name': instance.name,
      'size': instance.size,
    };

const _$AttachmentTypeEnumMap = {
  AttachmentType.image: 'image',
  AttachmentType.file: 'file',
};

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      id: json['id'] as String,
      room: json['room'] as String,
      sender: PartialUser.fromJson(json['sender'] as Map<String, dynamic>),
      text: json['text'] as String? ?? '',
      attachments:
          (json['attachments'] as List<dynamic>?)
              ?.map((e) => Attachment.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      readBy:
          (json['readBy'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      editedAt: json['editedAt'] == null
          ? null
          : DateTime.parse(json['editedAt'] as String),
      isDeleted: json['isDeleted'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'room': instance.room,
      'sender': instance.sender,
      'text': instance.text,
      'attachments': instance.attachments,
      'readBy': instance.readBy,
      'editedAt': instance.editedAt?.toIso8601String(),
      'isDeleted': instance.isDeleted,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
