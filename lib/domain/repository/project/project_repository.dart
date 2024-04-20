import 'dart:async';

import 'package:boilerplate/domain/usecase/project/get_all_project_usecase.dart';
import 'package:boilerplate/domain/usecase/project/insert_project_usecase.dart';
import 'package:boilerplate/domain/usecase/project/start_working_project_usecase.dart';
import 'package:boilerplate/domain/usecase/project/update_project_usecase.dart';

import '../../entity/project/project.dart';
import '../../entity/project/project_list.dart';

abstract class ProjectRepository {
  Future<ProjectList> getProjects();

  Future<List<Project>> findProjectById(int id);

  Future<Project> insert(InsertProjectParams post);

  Future<dynamic> update(UpdateProjectParams params);

  Future<dynamic> remove(int id);

  Future<dynamic> startWorkingProject(StartWorkingProjectParams params);

  Future<ProjectList> getAllProject(GetAllProjectParams params);
}
