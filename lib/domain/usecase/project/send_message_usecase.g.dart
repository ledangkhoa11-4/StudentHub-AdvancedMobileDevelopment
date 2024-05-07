// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMessageParams _$SendMessageParamsFromJson(Map<String, dynamic> json) =>
    SendMessageParams(
      projectId: json['projectId'] as int,
      receiverId: json['receiverId'] as int,
      senderId: json['senderId'] as int,
      content: json['content'] as String,
      messageFlag: json['messageFlag'] as int,
    );

Map<String, dynamic> _$SendMessageParamsToJson(SendMessageParams instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'receiverId': instance.receiverId,
      'senderId': instance.senderId,
      'content': instance.content,
      'messageFlag': instance.messageFlag,
    };
