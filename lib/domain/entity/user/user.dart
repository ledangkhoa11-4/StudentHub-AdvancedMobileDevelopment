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
  dynamic student;
  dynamic company;

  User({this.id, this.fullname, this.roles, this.student, this.company});

  factory User.fromMap(Map<String, dynamic> json) {
    List<dynamic> rolesObj = json["roles"];
    final roles =
        rolesObj.map((e) => int.tryParse(e.toString()) ?? -1).toList();

    return User(
      id: json["id"],
      fullname: json["fullname"],
      roles: roles,
      student: json["student"],
      company: json["company"],
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
