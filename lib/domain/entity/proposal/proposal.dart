import 'package:boilerplate/domain/entity/project/project.dart';
import 'package:boilerplate/domain/entity/user/profile_student.dart';

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

class Proposal {
  int id;
  int projectId;
  int studentId;
  String coverLetter;
  int statusFlag;
  int disableFlag;
  Project project;
  String createdAt;
  String? updatedAt;
  String? deletedAt;

  Proposal({
    required this.id,
    required this.projectId,
    required this.studentId,
    required this.coverLetter,
    required this.statusFlag,
    required this.disableFlag,
    required this.project,
    required this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Proposal.fromJson(Map<String, dynamic> json) {
    return Proposal(
      id: json['id'],
      projectId: json['projectId'],
      studentId: json['studentId'],
      coverLetter: json['coverLetter'],
      statusFlag: json['statusFlag'],
      disableFlag: json['disableFlag'],
      project: Project.fromMap(json['project']),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      deletedAt: json['deletedAt'],
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
    data['project'] = this.project.toMap();
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deletedAt'] = this.deletedAt;
    return data;
  }
}
