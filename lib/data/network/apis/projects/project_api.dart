import 'dart:async';

import 'package:boilerplate/core/data/network/dio/dio_client.dart';
import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/data/network/rest_client.dart';
import 'package:boilerplate/domain/entity/project/project_list.dart';

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
      final res = await _dioClient.dio.get(Endpoints.postProject);
      return ProjectList.fromJson(res.data);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  /// Company posts a project
  Future<ProjectList> insert() async {
    try {
      final res = await _dioClient.dio.post(Endpoints.postProject);
      return ProjectList.fromJson(res.data);
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
