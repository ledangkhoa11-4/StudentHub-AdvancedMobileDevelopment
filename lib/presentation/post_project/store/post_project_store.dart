import 'dart:convert';

import 'package:boilerplate/core/stores/error/error_store.dart';
import 'package:boilerplate/domain/entity/project/project.dart'; // Import Project entity
import 'package:boilerplate/domain/usecase/project/get_all_project_usecase.dart';
import 'package:boilerplate/domain/usecase/project/get_project_usecase.dart';
import 'package:boilerplate/domain/usecase/project/insert_project_usecase.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/entity/project/project_list.dart';
import '../../../domain/repository/project/project_repository.dart'; // Import ProjectRepository
// import '../../../domain/usecase/project/get_project_usecase.dart';
import '../../../utils/dio/dio_error_util.dart'; // Import GetProjectUseCase

part 'post_project_store.g.dart';

class ProjectStore = _ProjectStore with _$ProjectStore;

abstract class _ProjectStore with Store {
  // constructor:---------------------------------------------------------------
  _ProjectStore(
      this._getProjectUseCase,
      this._insertProjectUseCase,
      this.errorStore,
      this._projectRepository,
      this._getAllProjectUseCase); // Add _projectRepository

  // use cases:-----------------------------------------------------------------
  final GetProjectUseCase _getProjectUseCase;
  final InsertProjectUseCase _insertProjectUseCase;

  // stores:--------------------------------------------------------------------
  // store for handling errors
  final ErrorStore errorStore;

  // Repository for inserting projects
  final ProjectRepository _projectRepository;

  // store variables:-----------------------------------------------------------
  static ObservableFuture<ProjectList?> emptyProjectResponse =
      ObservableFuture.value(null);

  static ObservableFuture<Project?> _emptyProjectResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<ProjectList?> fetchProjectsFuture =
      ObservableFuture<ProjectList?>(emptyProjectResponse);

  @observable
  ObservableFuture<Project?> fetchProjectFuture =
      ObservableFuture<Project?>(_emptyProjectResponse);

  @observable
  ObservableFuture<Project?> getProjectFuture = _emptyProjectResponse;

  @observable
  ProjectList? projectList;

  @observable
  String apiResponseMessage = "";

  @observable
  bool? apiResponseSuccess = null;

  @observable
  bool? success = null;

/* KHOA */
  @observable
  ProjectList? allProjectList;

  @observable
  bool manualLoading = false;

  final GetAllProjectUseCase _getAllProjectUseCase;

/* KHOA */
  @computed
  bool get isLoading =>
      fetchProjectsFuture.status == FutureStatus.pending ||
      fetchProjectFuture.status == FutureStatus.pending ||
      getProjectFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future getProjects() async {
    final future = _getProjectUseCase.call(params: null);
    fetchProjectsFuture = ObservableFuture(future);

    await future.then((projectList) {
      this.projectList = projectList;
      // print('==projectList: ');
      // print(projectList[0].companyId.toString() + " - " + projectList[0].title);
    }).catchError((error) {
      print('---------------------------------');
      print(error);
      errorStore.errorMessage = DioErrorUtil.handleError(error);
    });
  }

  @action
  void resetProjectList() {
    this.projectList = null;
  }

  @action
  void resetSuccess() {
    this.success = null;
    this.errorStore.errorMessage = "";
  }

  // insert a project
  @action
  Future insert(Project project) async {
    final InsertProjectParams params = InsertProjectParams(
        companyId: project.companyId,
        projectScopeFlag: project.projectScopeFlag,
        typeFlag: project.typeFlag,
        title: project.title,
        description: project.description,
        numberOfStudents: project.numberOfStudents);
    try {
      final future = _insertProjectUseCase.call(params: params);
      getProjectFuture = ObservableFuture(future as Future<Project>);

      await future.then((value) async {
        if (value != null) {
          print(value);
          this.success = true;
        }
      }).catchError((e) {
        print(e);
      });
    } catch (error) {
      this.success = false;
      if (error is DioException) {
        // Handle DioException
        errorStore.errorMessage = DioErrorUtil.handleError(error);
      } else {
        // Handle other types of errors
        errorStore.errorMessage = 'An error occurred: $error';
      }
    }
  }

  @action
  Future getAllProjects(GetAllProjectParams params) async {
    final future = _getAllProjectUseCase.call(params: params);
    fetchProjectsFuture = ObservableFuture(future);

    await future.then((projectList) {
      this.allProjectList = projectList;
      this.apiResponseSuccess = true;
    }).catchError((e) {
      this.allProjectList = ProjectList(projects: []);
      String message = e.response.toString();
      final response = jsonDecode(message);
      this.apiResponseSuccess = false;
      this.apiResponseMessage = response["errorDetails"].toString();
    });
    this.manualLoading = false;
  }

  resetApiResponse() {
    this.apiResponseMessage = "";
    this.apiResponseSuccess = null;
  }
}
