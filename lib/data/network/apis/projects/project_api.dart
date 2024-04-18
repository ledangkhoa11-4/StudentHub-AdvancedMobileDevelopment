import 'dart:async';
import 'dart:convert';

import 'package:boilerplate/core/data/network/dio/dio_client.dart';
import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/data/network/rest_client.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/project/project.dart';
import 'package:boilerplate/domain/entity/project/project_list.dart';
import 'package:boilerplate/domain/usecase/project/get_all_project_usecase.dart';
import 'package:boilerplate/domain/usecase/project/insert_project_usecase.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';

class ProjectApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  ProjectApi(this._dioClient, this._restClient);

  /// Returns list of projects in response
  Future<ProjectList> getProjects() async {
    try {
      final UserStore _userStore = getIt<UserStore>();

      final res = await _dioClient.dio.get(Endpoints.getCompanyProject +
          "/${_userStore.user!.company!.id.toString()}");

      // print("ttttttttttttttttttttttttttttt");
      return ProjectList.fromJson(res.data['result']);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  /// Company posts a project
  Future<Project> insert(InsertProjectParams params) async {
    try {
      final res =
          await _dioClient.dio.post(Endpoints.postProject, data: params);
      final result = jsonDecode(res.toString());
      return Project.fromMap(result["result"]);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<ProjectList> getAllProject(GetAllProjectParams params) async {
    try {
      final res =
          await _dioClient.dio.get(Endpoints.getAllProject, data: params);
      final result = jsonDecode(res.toString());

      return ProjectList.fromJson(result["result"]);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  /// sample api call with default rest client
//  Future<ProjectsList> getProjects() {
//
//    return _restClient
//        .get(Endpoints.getProjects)
//        .then((dynamic res) => ProjectsList.fromJson(res))
//        .catchError((error) => throw NetworkException(message: error));
//  }
}
