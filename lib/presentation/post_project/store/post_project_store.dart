import 'dart:convert';

import 'package:boilerplate/core/stores/error/error_store.dart';
import 'package:boilerplate/domain/entity/project/project.dart'; // Import Project entity
import 'package:boilerplate/domain/entity/proposal/proposal.dart';
import 'package:boilerplate/domain/usecase/project/get_all_project_usecase.dart';
import 'package:boilerplate/domain/usecase/project/get_favorite_project_usecase.dart';
import 'package:boilerplate/domain/usecase/project/get_project_usecase.dart';
import 'package:boilerplate/domain/usecase/project/get_submit_proposal_usecase.dart';
import 'package:boilerplate/domain/usecase/project/insert_project_usecase.dart';
import 'package:boilerplate/domain/usecase/project/update_favorite_project_usecase.dart';
import 'package:boilerplate/domain/usecase/project/update_project_usecase.dart';
import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/entity/project/project_list.dart';
import '../../../domain/repository/project/project_repository.dart'; // Import ProjectRepository
// import '../../../domain/usecase/project/get_project_usecase.dart';
import '../../../domain/usecase/project/remove_project_usecase.dart';
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
      this._getAllProjectUseCase,
      this._updateProjectUseCase,
      this._removeProjectUseCase,
      this._updateFavoriteProjectUseCase,
      this._getSubmitProposalUseCase,
      this._getFavoriteProjectUseCase) {
    _setupValidations();
  } // Add _projectRepository

  late List<ReactionDisposer> _disposers;
  void _setupValidations() {
    _disposers = [
      reaction((_) => globalGetAllProjectParams, getAllProjects),
    ];
  }

  // use cases:-----------------------------------------------------------------
  final GetProjectUseCase _getProjectUseCase;
  final GetFavoriteProjectUseCase _getFavoriteProjectUseCase;
  final InsertProjectUseCase _insertProjectUseCase;
  final UpdateProjectUseCase _updateProjectUseCase;
  final UpdateFavoriteProjectUseCase _updateFavoriteProjectUseCase;
  final RemoveProjectUseCase _removeProjectUseCase;
  final GetSubmitProposalUseCase _getSubmitProposalUseCase;

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

  static ObservableFuture<dynamic> _emptyDynamicResponse =
      ObservableFuture.value(null);

  static ObservableFuture<List<Proposal>?> _emptyFetchProposalResponse =
      ObservableFuture.value(null);

  @observable
  ObservableFuture<ProjectList?> fetchProjectsFuture =
      ObservableFuture<ProjectList?>(emptyProjectResponse);

  @observable
  ObservableFuture<List<Proposal>?> fetchSubmitProposal =
      _emptyFetchProposalResponse;

  @observable
  ObservableFuture<Project?> fetchProjectFuture =
      ObservableFuture<Project?>(_emptyProjectResponse);

  @observable
  ObservableFuture<Project?> getProjectFuture = _emptyProjectResponse;

  @observable
  ObservableFuture<dynamic> updateProjectFuture = _emptyDynamicResponse;

  @observable
  ProjectList? projectList;

  @observable
  String apiResponseMessage = "";

  @observable
  bool? apiResponseSuccess = null;

  @observable
  bool? success = null;

  @observable
  bool? deleted = null;

  @observable
  int? slideToIndex = null;

/* KHOA */
  @observable
  ProjectList? allProjectList;

  @observable
  ObservableList<Proposal>? submitProposals;

  @observable
  ProjectList? onlyLikeProject;

  @observable
  bool manualLoading = false;

  @observable
  bool showLikedOnly = false;

  final GetAllProjectUseCase _getAllProjectUseCase;

  @observable
  GetAllProjectParams globalGetAllProjectParams =
      GetAllProjectParams(page: 1, perPage: 10);

/* KHOA */
  @computed
  bool get isLoading =>
      fetchProjectsFuture.status == FutureStatus.pending ||
      fetchProjectFuture.status == FutureStatus.pending ||
      getProjectFuture.status == FutureStatus.pending ||
      updateProjectFuture.status == FutureStatus.pending ||
      fetchSubmitProposal.status == FutureStatus.pending;

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
    this.manualLoading = false;
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
  Future update(int id, Project project) async {
    final UpdateProjectParams params = UpdateProjectParams(
        id: id,
        companyId: project.companyId,
        projectScopeFlag: project.projectScopeFlag,
        typeFlag: project.typeFlag,
        title: project.title,
        description: project.description,
        numberOfStudents: project.numberOfStudents);
    try {
      final future = _updateProjectUseCase.call(params: params);
      updateProjectFuture = ObservableFuture(future);
      await future.then((value) async {
        if (value != null) {
          print(value);
          this.success = true;
        }
      }).catchError((e) {
        print(e);
        print(e.response);
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
  Future getAllProjects(GetAllProjectParams param,
      {bool reload = false}) async {
    final future = _getAllProjectUseCase.call(params: param);
    fetchProjectsFuture = ObservableFuture(future);

    await future.then((projectList) {
      final totalProject = this.allProjectList == null || reload
          ? projectList.projects
          : [...this.allProjectList!.projects!, ...projectList.projects!];
      this.allProjectList = ProjectList(projects: totalProject);
      this.apiResponseSuccess = true;
    }).catchError((e) {
      final List<Project> totalProject = this.allProjectList == null || reload
          ? []
          : this.allProjectList!.projects!;

      this.allProjectList = ProjectList(projects: totalProject);
      String message = e.response.toString();
      final response = jsonDecode(message);
      this.apiResponseSuccess = false;
      this.apiResponseMessage = response["errorDetails"].toString();
    });
    this.manualLoading = false;
  }

  @action
  void getMoreProject() {
    this.globalGetAllProjectParams = GetAllProjectParams(
        title: this.globalGetAllProjectParams.title,
        projectScopeFlag: this.globalGetAllProjectParams.projectScopeFlag,
        numberOfStudents: this.globalGetAllProjectParams.numberOfStudents,
        proposalsLessThan: this.globalGetAllProjectParams.proposalsLessThan,
        page: this.globalGetAllProjectParams.page != null
            ? this.globalGetAllProjectParams.page! + 1
            : 1,
        perPage: this.globalGetAllProjectParams.perPage);
  }

  @action
  void reloadProjectList() {
    this.globalGetAllProjectParams.page = 1;
    this.globalGetAllProjectParams.perPage =
        this.globalGetAllProjectParams.page != null &&
                this.globalGetAllProjectParams.perPage != null
            ? this.globalGetAllProjectParams.page! *
                this.globalGetAllProjectParams.perPage!
            : 10;
  }

  @action
  Future remove(int id) async {
    try {
      final future = _removeProjectUseCase.remove(id: id);
      updateProjectFuture = ObservableFuture(future);
      // print('=========================');
      // print(updateProjectFuture);
      await future.then((_) {
        this.deleted = true;
      }).catchError((e) {
        print(e.toString());
        this.deleted = false;
      });
    } catch (error) {
      print(error);
      this.deleted = false;
    }
  }

  void setSearch(String value) {
    this.allProjectList = ProjectList(projects: []);
    this.showLikedOnly = false;
    this.globalGetAllProjectParams = GetAllProjectParams(
        title: !value.isEmpty ? value : null,
        numberOfStudents:
            !value.isEmpty ? globalGetAllProjectParams.numberOfStudents : null,
        projectScopeFlag:
            !value.isEmpty ? globalGetAllProjectParams.projectScopeFlag : null,
        proposalsLessThan:
            !value.isEmpty ? globalGetAllProjectParams.proposalsLessThan : null,
        page: 1,
        perPage: 10);
  }

  @action
  void setFilter(
      int? numberOfStudents, int? projectScopeFlag, int? proposalsLessThan) {
    this.allProjectList = ProjectList(projects: []);
    this.showLikedOnly = false;
    this.globalGetAllProjectParams = GetAllProjectParams(
        title: globalGetAllProjectParams.title,
        numberOfStudents: numberOfStudents,
        projectScopeFlag: projectScopeFlag,
        proposalsLessThan: proposalsLessThan,
        page: 1,
        perPage: 10);
  }

  @action
  void setShowLike(bool isLike) {
    print(isLike);
    this.showLikedOnly = isLike;
  }

  @action
  Future getLikedProjectList() async {
    final future = _getFavoriteProjectUseCase.call(params: null);
    fetchProjectsFuture = ObservableFuture(future);

    await future.then((projectList) {
      this.onlyLikeProject = projectList;
      this.apiResponseSuccess = true;
    }).catchError((e) {
      this.onlyLikeProject = ProjectList(projects: []);
      String message = e.response.toString();
      final response = jsonDecode(message);
      this.apiResponseSuccess = false;
      this.apiResponseMessage = response["errorDetails"].toString();
    });
  }

  @action
  Future updateLikeProkect(Project project, bool status) async {
    final UpdateFavoriteProjectParams params = UpdateFavoriteProjectParams(
        projectId: project.id!, disableFlag: status == true ? 0 : 1);

    final updatedProject = project..isFavorite = status;
    final updated = ProjectList(
        projects: this
            .allProjectList!
            .projects!
            .map((e) => e.id == project.id ? updatedProject : e)
            .toList());

    if (status) {
      final addedProject = [...this.onlyLikeProject!.projects!, updatedProject];
      this.onlyLikeProject = ProjectList(projects: addedProject);
    } else {
      final updated2 = ProjectList(
          projects: this
              .onlyLikeProject!
              .projects!
              .where((e) => e.id == project.id && !status ? false : true)
              .toList());
      this.onlyLikeProject = updated2;
    }

    this.allProjectList = updated;
    try {
      final future = _updateFavoriteProjectUseCase.call(params: params);
      await future.then((value) async {
        if (value != null) {
          //do nothing
        }
      }).catchError((e) {
        final reverseProject = project..isFavorite = !status;
        final reverted = ProjectList(
            projects: this
                .allProjectList!
                .projects!
                .map((e) => e.id == project.id ? reverseProject : e)
                .toList());
        this.allProjectList = reverted;
      });
    } catch (error) {
      final reverseProject = project..isFavorite = !status;
      final reverted = ProjectList(
          projects: this
              .allProjectList!
              .projects!
              .map((e) => e.id == project.id ? reverseProject : e)
              .toList());
      if (status) {
        final updated2 = ProjectList(
            projects: this
                .onlyLikeProject!
                .projects!
                .where((e) => e.id != project.id)
                .toList());
        this.onlyLikeProject = updated2;
      } else {
        final reverted2 = [...this.onlyLikeProject!.projects!, reverseProject];
        this.onlyLikeProject = ProjectList(projects: reverted2);
      }

      this.allProjectList = reverted;
    }
  }

  @action
  Future getSubmitProposal(GetSubmitProposalParams param) async {
    final future = _getSubmitProposalUseCase.call(params: param);
    fetchSubmitProposal = ObservableFuture(future);

    await future.then((projectList) {
      this.submitProposals = ObservableList.of(projectList);
      this.apiResponseSuccess = true;
    }).catchError((e) {
      this.submitProposals = ObservableList.of([]);
      String message = e.response.toString();
      final response = jsonDecode(message);
      this.apiResponseSuccess = false;
      this.apiResponseMessage = response["errorDetails"].toString();
    });
    this.manualLoading = false;
  }

  @action
  void setProjectList(ProjectList projectList) {
    this.projectList = projectList;
  }

  setSlideToIndex(int? value) {
    this.slideToIndex = value;
  }

  resetApiResponse() {
    this.apiResponseMessage = "";
    this.apiResponseSuccess = null;
  }

  resetDeleted() {
    this.deleted = null;
  }

  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
