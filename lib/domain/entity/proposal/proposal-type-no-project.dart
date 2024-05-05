import 'package:boilerplate/domain/entity/user/profile_student_has_fullname.dart';

enum ProposalType { WAITING, ACTIVE, OFFER, HIRED }

extension ProposalTypeExtension on ProposalType {
  int get value {
    switch (this) {
      case ProposalType.WAITING:
        return 0;
      case ProposalType.ACTIVE:
        return 1;
      case ProposalType.OFFER:
        return 2;
      case ProposalType.HIRED:
        return 3;
      default:
        return -1;
    }
  }
}

class ProposalNoProjectVariable {
  int id;
  int projectId;
  int studentId;
  String coverLetter;
  int statusFlag;
  int disableFlag;
  String createdAt;
  String? updatedAt;
  String? deletedAt;
  ProfileStudentHasFullName student;

  ProposalNoProjectVariable({
    required this.id,
    required this.projectId,
    required this.studentId,
    required this.coverLetter,
    required this.statusFlag,
    required this.disableFlag,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
    required this.student,
  });

  factory ProposalNoProjectVariable.fromJson(Map<String, dynamic> json) {
    return ProposalNoProjectVariable(
      id: json['id'],
      projectId: json['projectId'],
      studentId: json['studentId'],
      coverLetter: json['coverLetter'],
      statusFlag: json['statusFlag'],
      disableFlag: json['disableFlag'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      deletedAt: json['deletedAt'],
      student: ProfileStudentHasFullName.fromMap(json['student']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['projectId'] = this.projectId;
    data['studentId'] = this.studentId;
    data['coverLetter'] = this.coverLetter;
    data['statusFlag'] = this.statusFlag;
    data['disableFlag'] = this.disableFlag;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    data['student'] = this.student;
    return data;
  }
}
