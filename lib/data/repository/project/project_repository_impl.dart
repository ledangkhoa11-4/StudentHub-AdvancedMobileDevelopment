import 'dart:async';

import 'package:boilerplate/data/network/apis/projects/project_api.dart';
import 'package:boilerplate/domain/entity/project/project.dart';
import 'package:boilerplate/domain/entity/project/project_list.dart';
import 'package:boilerplate/domain/entity/proposal/proposal.dart';
import 'package:boilerplate/domain/repository/project/project_repository.dart';
import 'package:boilerplate/domain/usecase/project/get_all_project_usecase.dart';
import 'package:boilerplate/domain/usecase/project/get_submit_proposal_usecase.dart';
import 'package:boilerplate/domain/usecase/project/insert_project_usecase.dart';
import 'package:boilerplate/domain/usecase/project/update_favorite_project_usecase.dart';
import 'package:boilerplate/domain/usecase/project/update_project_usecase.dart';

class ProjectRepositoryImpl extends ProjectRepository {

  // api objects
  final ProjectApi _projectApi;

  // constructor
  ProjectRepositoryImpl(this._projectApi);

  // Project: -----------------------------------------------------------------
  @override
  Future<ProjectList> getProjects() async {
    // check to see if projects are present in database, then fetch from database
    // else make a network call to get all projects, store them into database for
    // later use
    return await _projectApi.getProjects().then((projectsList) {
      return projectsList;
    }).catchError((error) => throw error);
  }

  @override
  Future<List<Project>> findProjectById(int id) async {
    return [];
  }

  @override
  Future<Project> insert(InsertProjectParams params) async {
    return await _projectApi.insert(params).then((res) {
      return res;
    }).catchError((error) {
      throw error;
    });
  }

  @override
  Future<dynamic> update(UpdateProjectParams params) async {
    return await _projectApi.update(params).then((res) {
      return res;
    }).catchError((error) {
      throw error;
    });
  }

  // @override
  // Future<int> delete(Project project) => _projectDataSource
  //     .update(project)
  //     .then((id) => id)
  //     .catchError((error) => throw error);

  @override
  Future<dynamic> remove(int id) async {
    return await _projectApi.remove(id);
  }

  @override
  Future<ProjectList> getAllProject(GetAllProjectParams params) async {
    return await _projectApi.getAllProject(params).then((projectsList) {
      return projectsList;
    }).catchError((error) => throw error);
  }

  @override
  Future<dynamic> updateFavorite(UpdateFavoriteProjectParams params) async {
    return await _projectApi.updateFavorite(params).then((res) {
      return res;
    }).catchError((error) {
      throw error;
    });
  }

  @override
  Future<List<Proposal>> getSubmitProposal(GetSubmitProposalParams params) async {
    return await _projectApi.getSubmitProposal(params).then((res) {
      return res;
    }).catchError((error) {
      throw error;
    });
  }

   @override
  Future<ProjectList> getFavoriteProjects() async {
    return await _projectApi.getFavoriteProjects().then((projectsList) {
      return projectsList;
    }).catchError((error) => throw error);
  }

}
