import 'package:boilerplate/domain/entity/user/profile_company.dart';
import 'package:boilerplate/domain/entity/user/profile_student.dart';

enum UserRole { STUDENT, COMPANY, ADMIN, MANAGER }

extension UserTypeExtension on UserRole {
  int get value {
    switch (this) {
      case UserRole.STUDENT:
        return 0;
      case UserRole.COMPANY:
        return 1;
      case UserRole.ADMIN:
        return 2;
      case UserRole.MANAGER:
        return 3;
      default:
        return -1;
    }
  }
}

class User {
  int? id;
  String? fullname;
  List<int>? roles;
  ProfileStudent? student;
  ProfileCompany? company;

  User({this.id, this.fullname, this.roles, this.student, this.company});

  void setCompanyProfile(ProfileCompany? newProfile) {
    this.company = newProfile;
  }

  void setStudentProfile(ProfileStudent? newProfile) {
    this.student = newProfile;
  }

  factory User.fromMap(Map<String, dynamic> json) {
    List<dynamic> rolesObj = json["roles"] != null ? json["roles"] : [];
    final roles =
        rolesObj.map((e) => int.tryParse(e.toString()) ?? -1).toList();

    return User(
      id: json["id"],
      fullname: json["fullname"],
      roles: roles,
      student: json["student"] != null
          ? ProfileStudent.fromMap(json["student"])
          : null,
      company: json["company"] != null
          ? ProfileCompany.fromMap(json["company"])
          : null,
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "fullname": fullname,
        "roles": roles,
        "student": student,
        "company": company,
      };
}
