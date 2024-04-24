// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_submit_proposal_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSubmitProposalParams _$GetSubmitProposalParamsFromJson(
        Map<String, dynamic> json) =>
    GetSubmitProposalParams(
      studentId: json['studentId'] as int,
      statusFlag: json['statusFlag'] as int?,
    );

Map<String, dynamic> _$GetSubmitProposalParamsToJson(
        GetSubmitProposalParams instance) =>
    <String, dynamic>{
      'studentId': instance.studentId,
      'statusFlag': instance.statusFlag,
    };
