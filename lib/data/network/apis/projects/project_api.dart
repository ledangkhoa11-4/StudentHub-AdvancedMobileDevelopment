import 'dart:async';
import 'dart:convert';

import 'package:boilerplate/core/data/network/dio/dio_client.dart';
import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/data/network/rest_client.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/project/project.dart';
import 'package:boilerplate/domain/entity/project/project_list.dart';
import 'package:boilerplate/domain/entity/proposal/proposal.dart';
import 'package:boilerplate/domain/usecase/project/get_all_project_usecase.dart';
import 'package:boilerplate/domain/usecase/project/get_submit_proposal_usecase.dart';
import 'package:boilerplate/domain/usecase/project/insert_project_usecase.dart';
import 'package:boilerplate/domain/usecase/project/update_favorite_project_usecase.dart';
import 'package:boilerplate/domain/usecase/project/update_project_usecase.dart';
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

  Future<ProjectList> getFavoriteProjects() async {
    try {
      final UserStore _userStore = getIt<UserStore>();
      final res = await _dioClient.dio.get(Endpoints.getFavoriteProject
          .replaceAll(":studentId", "${_userStore.user!.student!.id}"));
      List<dynamic> projectObj = res.data["result"];
      final projectList = projectObj
          .map((project) {
            project["project"]["isFavorite"] = true;
            return Project.fromMap(project["project"]);
          })
          .toList();
      return ProjectList(projects: projectList);
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

  Future<dynamic> update(UpdateProjectParams params) async {
    try {
      final res = await _dioClient.dio.patch(
          Endpoints.patchProject
              .replaceFirst(":projectId", params.id.toString()),
          data: params);

      return res;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<ProjectList> getAllProject(GetAllProjectParams params) async {
    var query = "?";
    if (params.title != null) query += "&title=${params.title}";
    if (params.projectScopeFlag != null)
      query += "&projectScopeFlag=${params.projectScopeFlag}";
    if (params.numberOfStudents != null)
      query += "&numberOfStudents=${params.numberOfStudents}";
    if (params.proposalsLessThan != null)
      query += "&proposalsLessThan=${params.proposalsLessThan}";
    query += "&page=${params.page ?? 1}";
    query += "&perPage=${params.perPage ?? 10}";
    try {
      final res = await _dioClient.dio.get(Endpoints.getAllProject + query);
      final result = jsonDecode(res.toString());

      return ProjectList.fromJson(result["result"]);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<dynamic> remove(int id) async {
    try {
      final res = await _dioClient.dio.delete(
        Endpoints.patchProject.replaceFirst(":projectId", id.toString()),
      );

      return res;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<dynamic> updateFavorite(UpdateFavoriteProjectParams params) async {
    try {
      final UserStore _userStore = getIt<UserStore>();
      final res = await _dioClient.dio.patch(
          Endpoints.patchFavorite.replaceFirst(
              ":studentId", _userStore.user!.student!.id.toString()),
          data: params);
      return res;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<List<Proposal>> getSubmitProposal(
      GetSubmitProposalParams params) async {
    var query = "?";
    if (params.statusFlag != null) query += "&statusFlag=${params.statusFlag}";
    try {
      final res = await _dioClient.dio.get(Endpoints.getSubmitProposal
              .replaceFirst(":studentId", params.studentId.toString()) +
          query);
      final result = jsonDecode(res.toString());

      List<dynamic> proposalObj =
          result["result"] != null ? result["result"] : [];
      return proposalObj.map((e) => Proposal.fromJson(e)).toList();
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
