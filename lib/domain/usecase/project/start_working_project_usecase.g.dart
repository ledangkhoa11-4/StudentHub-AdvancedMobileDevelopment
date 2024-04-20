// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_working_project_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartWorkingProjectParams _$StartWorkingProjectParamsFromJson(
        Map<String, dynamic> json) =>
    StartWorkingProjectParams(
      id: json['id'] as int,
      companyId: json['companyId'] as int,
      projectScopeFlag: json['projectScopeFlag'] as int,
      typeFlag: json['typeFlag'] as int?,
      title: json['title'] as String,
      description: json['description'] as String,
      numberOfStudents: json['numberOfStudents'] as int,
    );

Map<String, dynamic> _$StartWorkingProjectParamsToJson(
        StartWorkingProjectParams instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companyId': instance.companyId,
      'projectScopeFlag': instance.projectScopeFlag,
      'typeFlag': instance.typeFlag,
      'title': instance.title,
      'description': instance.description,
      'numberOfStudents': instance.numberOfStudents,
    };
