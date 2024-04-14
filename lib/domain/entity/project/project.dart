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
      };
}
