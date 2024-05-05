// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_proposal_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProposalParam _$UpdateProposalParamFromJson(Map<String, dynamic> json) =>
    UpdateProposalParam(
      projectId: json['projectId'] as int,
      studentId: json['studentId'] as int,
      coverLetter: json['coverLetter'] as String,
      statusFlag: json['statusFlag'] as int,
      disableFlag: json['disableFlag'] as int,
    );

Map<String, dynamic> _$UpdateProposalParamToJson(
        UpdateProposalParam instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'studentId': instance.studentId,
      'coverLetter': instance.coverLetter,
      'statusFlag': instance.statusFlag,
      'disableFlag': instance.disableFlag,
    };
