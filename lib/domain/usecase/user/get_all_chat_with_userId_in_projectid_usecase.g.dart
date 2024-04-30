// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_chat_with_userId_in_projectid_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectUserIdParam _$ProjectUserIdParamFromJson(Map<String, dynamic> json) =>
    ProjectUserIdParam(
      projectId: json['projectId'] as int,
      userId: json['userId'] as int,
    );

Map<String, dynamic> _$ProjectUserIdParamToJson(ProjectUserIdParam instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'userId': instance.userId,
    };
