// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insert_project_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InsertProjectParams _$InsertProjectParamsFromJson(Map<String, dynamic> json) =>
    InsertProjectParams(
      companyId: json['companyId'] as int,
      projectScopeFlag: json['projectScopeFlag'] as int,
      typeFlag: json['typeFlag'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      numberOfStudents: json['numberOfStudents'] as int,
    );

Map<String, dynamic> _$InsertProjectParamsToJson(
        InsertProjectParams instance) =>
    <String, dynamic>{
      'companyId': instance.companyId,
      'projectScopeFlag': instance.projectScopeFlag,
      'typeFlag': instance.typeFlag,
      'title': instance.title,
      'description': instance.description,
      'numberOfStudents': instance.numberOfStudents,
    };
