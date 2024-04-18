enum ProjectScope {
  LessThanOneMonth,
  OneToThreeMonth,
  ThreeToSixMonth,
  MoreThanSixMonth
}

extension ProjectScopeType on ProjectScope {
  int get value {
    switch (this) {
      case ProjectScope.LessThanOneMonth:
        return 0;
      case ProjectScope.OneToThreeMonth:
        return 1;
      case ProjectScope.ThreeToSixMonth:
        return 2;
      case ProjectScope.MoreThanSixMonth:
        return 3;
      default:
        return -1;
    }
  }

  String get nameFormatted {
    switch (this) {
      case ProjectScope.LessThanOneMonth:
        return "Less Than 1 Month";
      case ProjectScope.OneToThreeMonth:
        return "1 to 3 Months";
      case ProjectScope.ThreeToSixMonth:
        return "3 to 6 Months";
      case ProjectScope.MoreThanSixMonth:
        return "More Than 6 Months";
      default:
        return "";
    }
  }

  static String fromValue(int value) {
    switch (value) {
      case 0:
        return "Less Than 1 Month";
      case 1:
        return "1 to 3 Months";
      case 2:
        return "3 to 6 Months";
      case 3:
        return "More Than 6 Months";
      default:
        return "";
    }
  }
}

class Project {
  int companyId;
  int projectScopeFlag;
  int? typeFlag;
  int? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String title;
  String description;
  int numberOfStudents;
  int countProposals;
  int countMessages;
  int countHired;

  Project({
    required this.companyId,
    required this.projectScopeFlag,
    required this.typeFlag,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    required this.title,
    required this.description,
    required this.numberOfStudents,
    this.countProposals = 0,
    this.countMessages = 0,
    this.countHired = 0,
  });

  // factory Project.fromMap(Map<String, dynamic> json) => Project(
  //       companyId: int.parse(json["companyId"]),
  //       projectScopeFlag: int.parse(json["projectScopeFlag"]),
  //       typeFlag: int.parse(json["typeFlag"]),
  //       id: int.parse(json["id"]),
  //       createdAt: json["createdAt"],
  //       updatedAt: json["updatedAt"],
  //       deletedAt: json["deletedAt"],
  //       title: json["title"],
  //       description: json["description"],
  //       numberOfStudents: int.parse(json["numberOfStudents"]),
  //       countProposals: json["countProposals"],
  //       countMessages: json["countMessages"],
  //       countHired: json["countHired"],
  //     );

  factory Project.fromMap(Map<String, dynamic> json) => Project(
        companyId:
            int.parse(json["companyId"].toString()), // Safely parse to int
        projectScopeFlag: int.parse(
            json["projectScopeFlag"].toString()), // Safely parse to int
        typeFlag:
            int.tryParse(json["typeFlag"].toString()), // Safely parse to int
        id: json["id"] != null
            ? int.parse(json["id"].toString())
            : null, // Nullable int parsed from string
        createdAt: json["createdAt"] as String?, // Nullable String
        updatedAt: json["updatedAt"] as String?, // Nullable String
        deletedAt: json["deletedAt"] as String?, // Nullable String
        title: json["title"] as String, // Assuming the value is always a String
        description: json["description"]
            as String, // Assuming the value is always a String
        numberOfStudents: int.parse(
            json["numberOfStudents"].toString()), // Safely parse to int
        countProposals: json.containsKey("countProposals")
            ? int.parse(json["countProposals"].toString())
            : 0,
        countMessages: json.containsKey("countMessages")
            ? int.parse(json["countMessages"].toString())
            : 0,
        countHired: json.containsKey("countHired")
            ? int.parse(json["countHired"].toString())
            : 0,
      );

  Map<String, dynamic> toMap() => {
        "companyId": companyId,
        "projectScopeFlag": projectScopeFlag,
        "typeFlag": typeFlag,
        "id": id,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "deletedAt": deletedAt,
        "title": title,
        "description": description,
        "numberOfStudents": numberOfStudents,
        "countProposals": countProposals,
        "countMessages": countMessages,
        "countHired": countHired,
      };
}
