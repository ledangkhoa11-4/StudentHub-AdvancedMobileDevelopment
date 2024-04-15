class Project {
  int companyId;
  int projectScopeFlag;
  int typeFlag;
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

  factory Project.fromMap(Map<String, dynamic> json) => Project(
        companyId: json["companyId"],
        projectScopeFlag: json["projectScopeFlag"],
        typeFlag: json["typeFlag"],
        id: json["id"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        deletedAt: json["deletedAt"],
        title: json["title"],
        description: json["description"],
        numberOfStudents: json["numberOfStudents"],
        countProposals: json["countProposals"] ?? 0,
        countMessages: json["countMessages"] ?? 0,
        countHired: json["countHired"] ?? 0,
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
