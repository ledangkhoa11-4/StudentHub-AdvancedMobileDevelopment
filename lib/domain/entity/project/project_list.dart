import 'project.dart';

class ProjectList {
  final List<Project>? projects;

  ProjectList({
    this.projects,
  });

  factory ProjectList.fromJson(List<dynamic> json) {
    List<Project> projects = <Project>[];
    projects = json.map((project) => Project.fromMap(project)).toList();

    return ProjectList(
      projects: projects,
    );
  }

  int get length => projects?.length ?? 0;

  Project operator [](int index) => projects![index];
}
