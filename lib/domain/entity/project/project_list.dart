import 'project.dart';

class ProjectList {
  List<Project>? projects;

  ProjectList({
    this.projects,
  });

  factory ProjectList.fromJson(List<dynamic> json) {
    List<Project> projects = <Project>[];
    // print("JSONNNNNNNNNNNNNNNNNNNNNNNNNNNNNN");
    // print(json);
    projects = json.map((project) => Project.fromMap(project)).toList();

    return ProjectList(
      projects: projects,
    );
  }

  int get length => projects?.length ?? 0;

  Project operator [](int index) => projects![index];
}
