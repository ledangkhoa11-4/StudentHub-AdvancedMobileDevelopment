// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_proposal_usecase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubmitProposalParams _$SubmitProposalParamsFromJson(
        Map<String, dynamic> json) =>
    SubmitProposalParams(
      studentId: json['studentId'] as int,
      projectId: json['projectId'] as int,
      coverLetter: json['coverLetter'] as String,
    );

Map<String, dynamic> _$SubmitProposalParamsToJson(
        SubmitProposalParams instance) =>
    <String, dynamic>{
      'studentId': instance.studentId,
      'projectId': instance.projectId,
      'coverLetter': instance.coverLetter,
    };
