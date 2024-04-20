// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_project_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllProjectParams _$GetAllProjectParamsFromJson(Map<String, dynamic> json) =>
    GetAllProjectParams(
      title: json['title'] as String?,
      projectScopeFlag: json['projectScopeFlag'] as int?,
      numberOfStudents: json['numberOfStudents'] as int?,
      proposalsLessThan: json['proposalsLessThan'] as int?,
    );

Map<String, dynamic> _$GetAllProjectParamsToJson(
        GetAllProjectParams instance) =>
    <String, dynamic>{
      'title': instance.title,
      'projectScopeFlag': instance.projectScopeFlag,
      'numberOfStudents': instance.numberOfStudents,
      'proposalsLessThan': instance.proposalsLessThan,
    };
