// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessagesPageImpl _$$MessagesPageImplFromJson(Map<String, dynamic> json) =>
    _$MessagesPageImpl(
      messages: (json['messages'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextCursor: json['nextCursor'] as String?,
      hasMore: json['hasMore'] as bool,
    );

Map<String, dynamic> _$$MessagesPageImplToJson(_$MessagesPageImpl instance) =>
    <String, dynamic>{
      'messages': instance.messages,
      'nextCursor': instance.nextCursor,
      'hasMore': instance.hasMore,
    };
