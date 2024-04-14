import 'dart:async';

import '../../entity/project/project.dart';
import '../../entity/project/project_list.dart';

abstract class ProjectRepository {
  Future<ProjectList> getProjects();

  Future<List<Project>> findProjectById(int id);

  Future<int> insert(Project post);

  Future<int> update(Project post);

  Future<int> delete(Project post);
}
