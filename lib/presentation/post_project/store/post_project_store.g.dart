// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_project_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProjectStore on _ProjectStore, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_ProjectStore.isLoading'))
          .value;

  late final _$fetchProjectsFutureAtom =
      Atom(name: '_ProjectStore.fetchProjectsFuture', context: context);

  @override
  ObservableFuture<ProjectList?> get fetchProjectsFuture {
    _$fetchProjectsFutureAtom.reportRead();
    return super.fetchProjectsFuture;
  }

  @override
  set fetchProjectsFuture(ObservableFuture<ProjectList?> value) {
    _$fetchProjectsFutureAtom.reportWrite(value, super.fetchProjectsFuture, () {
      super.fetchProjectsFuture = value;
    });
  }

  late final _$fetchProjectFutureAtom =
      Atom(name: '_ProjectStore.fetchProjectFuture', context: context);

  @override
  ObservableFuture<Project?> get fetchProjectFuture {
    _$fetchProjectFutureAtom.reportRead();
    return super.fetchProjectFuture;
  }

  @override
  set fetchProjectFuture(ObservableFuture<Project?> value) {
    _$fetchProjectFutureAtom.reportWrite(value, super.fetchProjectFuture, () {
      super.fetchProjectFuture = value;
    });
  }

  late final _$getProjectFutureAtom =
      Atom(name: '_ProjectStore.getProjectFuture', context: context);

  @override
  ObservableFuture<Project?> get getProjectFuture {
    _$getProjectFutureAtom.reportRead();
    return super.getProjectFuture;
  }

  @override
  set getProjectFuture(ObservableFuture<Project?> value) {
    _$getProjectFutureAtom.reportWrite(value, super.getProjectFuture, () {
      super.getProjectFuture = value;
    });
  }

  late final _$updateProjectFutureAtom =
      Atom(name: '_ProjectStore.updateProjectFuture', context: context);

  @override
  ObservableFuture<dynamic> get updateProjectFuture {
    _$updateProjectFutureAtom.reportRead();
    return super.updateProjectFuture;
  }

  @override
  set updateProjectFuture(ObservableFuture<dynamic> value) {
    _$updateProjectFutureAtom.reportWrite(value, super.updateProjectFuture, () {
      super.updateProjectFuture = value;
    });
  }

  late final _$projectListAtom =
      Atom(name: '_ProjectStore.projectList', context: context);

  @override
  ProjectList? get projectList {
    _$projectListAtom.reportRead();
    return super.projectList;
  }

  @override
  set projectList(ProjectList? value) {
    _$projectListAtom.reportWrite(value, super.projectList, () {
      super.projectList = value;
    });
  }

  late final _$apiResponseMessageAtom =
      Atom(name: '_ProjectStore.apiResponseMessage', context: context);

  @override
  String get apiResponseMessage {
    _$apiResponseMessageAtom.reportRead();
    return super.apiResponseMessage;
  }

  @override
  set apiResponseMessage(String value) {
    _$apiResponseMessageAtom.reportWrite(value, super.apiResponseMessage, () {
      super.apiResponseMessage = value;
    });
  }

  late final _$apiResponseSuccessAtom =
      Atom(name: '_ProjectStore.apiResponseSuccess', context: context);

  @override
  bool? get apiResponseSuccess {
    _$apiResponseSuccessAtom.reportRead();
    return super.apiResponseSuccess;
  }

  @override
  set apiResponseSuccess(bool? value) {
    _$apiResponseSuccessAtom.reportWrite(value, super.apiResponseSuccess, () {
      super.apiResponseSuccess = value;
    });
  }

  late final _$successAtom =
      Atom(name: '_ProjectStore.success', context: context);

  @override
  bool? get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool? value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  late final _$deletedAtom =
      Atom(name: '_ProjectStore.deleted', context: context);

  @override
  bool? get deleted {
    _$deletedAtom.reportRead();
    return super.deleted;
  }

  @override
  set deleted(bool? value) {
    _$deletedAtom.reportWrite(value, super.deleted, () {
      super.deleted = value;
    });
  }

  late final _$allProjectListAtom =
      Atom(name: '_ProjectStore.allProjectList', context: context);

  @override
  ProjectList? get allProjectList {
    _$allProjectListAtom.reportRead();
    return super.allProjectList;
  }

  @override
  set allProjectList(ProjectList? value) {
    _$allProjectListAtom.reportWrite(value, super.allProjectList, () {
      super.allProjectList = value;
    });
  }

  late final _$onlyLikeProjectAtom =
      Atom(name: '_ProjectStore.onlyLikeProject', context: context);

  @override
  ProjectList? get onlyLikeProject {
    _$onlyLikeProjectAtom.reportRead();
    return super.onlyLikeProject;
  }

  @override
  set onlyLikeProject(ProjectList? value) {
    _$onlyLikeProjectAtom.reportWrite(value, super.onlyLikeProject, () {
      super.onlyLikeProject = value;
    });
  }

  late final _$manualLoadingAtom =
      Atom(name: '_ProjectStore.manualLoading', context: context);

  @override
  bool get manualLoading {
    _$manualLoadingAtom.reportRead();
    return super.manualLoading;
  }

  @override
  set manualLoading(bool value) {
    _$manualLoadingAtom.reportWrite(value, super.manualLoading, () {
      super.manualLoading = value;
    });
  }

  late final _$showLikedOnlyAtom =
      Atom(name: '_ProjectStore.showLikedOnly', context: context);

  @override
  bool get showLikedOnly {
    _$showLikedOnlyAtom.reportRead();
    return super.showLikedOnly;
  }

  @override
  set showLikedOnly(bool value) {
    _$showLikedOnlyAtom.reportWrite(value, super.showLikedOnly, () {
      super.showLikedOnly = value;
    });
  }

  late final _$globalGetAllProjectParamsAtom =
      Atom(name: '_ProjectStore.globalGetAllProjectParams', context: context);

  @override
  GetAllProjectParams get globalGetAllProjectParams {
    _$globalGetAllProjectParamsAtom.reportRead();
    return super.globalGetAllProjectParams;
  }

  @override
  set globalGetAllProjectParams(GetAllProjectParams value) {
    _$globalGetAllProjectParamsAtom
        .reportWrite(value, super.globalGetAllProjectParams, () {
      super.globalGetAllProjectParams = value;
    });
  }

  late final _$getProjectsAsyncAction =
      AsyncAction('_ProjectStore.getProjects', context: context);

  @override
  Future<dynamic> getProjects() {
    return _$getProjectsAsyncAction.run(() => super.getProjects());
  }

  late final _$insertAsyncAction =
      AsyncAction('_ProjectStore.insert', context: context);

  @override
  Future<dynamic> insert(Project project) {
    return _$insertAsyncAction.run(() => super.insert(project));
  }

  late final _$updateAsyncAction =
      AsyncAction('_ProjectStore.update', context: context);

  @override
  Future<dynamic> update(int id, Project project) {
    return _$updateAsyncAction.run(() => super.update(id, project));
  }

  late final _$getAllProjectsAsyncAction =
      AsyncAction('_ProjectStore.getAllProjects', context: context);

  @override
  Future<dynamic> getAllProjects(GetAllProjectParams param) {
    return _$getAllProjectsAsyncAction.run(() => super.getAllProjects(param));
  }

  late final _$removeAsyncAction =
      AsyncAction('_ProjectStore.remove', context: context);

  @override
  Future<dynamic> remove(int id) {
    return _$removeAsyncAction.run(() => super.remove(id));
  }

  late final _$updateLikeProkectAsyncAction =
      AsyncAction('_ProjectStore.updateLikeProkect', context: context);

  @override
  Future<dynamic> updateLikeProkect(Project project, bool status) {
    return _$updateLikeProkectAsyncAction
        .run(() => super.updateLikeProkect(project, status));
  }

  late final _$_ProjectStoreActionController =
      ActionController(name: '_ProjectStore', context: context);

  @override
  void resetProjectList() {
    final _$actionInfo = _$_ProjectStoreActionController.startAction(
        name: '_ProjectStore.resetProjectList');
    try {
      return super.resetProjectList();
    } finally {
      _$_ProjectStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetSuccess() {
    final _$actionInfo = _$_ProjectStoreActionController.startAction(
        name: '_ProjectStore.resetSuccess');
    try {
      return super.resetSuccess();
    } finally {
      _$_ProjectStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilter(
      int? numberOfStudents, int? projectScopeFlag, int? proposalsLessThan) {
    final _$actionInfo = _$_ProjectStoreActionController.startAction(
        name: '_ProjectStore.setFilter');
    try {
      return super
          .setFilter(numberOfStudents, projectScopeFlag, proposalsLessThan);
    } finally {
      _$_ProjectStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setShowLike(bool isLike) {
    final _$actionInfo = _$_ProjectStoreActionController.startAction(
        name: '_ProjectStore.setShowLike');
    try {
      return super.setShowLike(isLike);
    } finally {
      _$_ProjectStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getLikedProjectList(ProjectList? value) {
    final _$actionInfo = _$_ProjectStoreActionController.startAction(
        name: '_ProjectStore.getLikedProjectList');
    try {
      return super.getLikedProjectList(value);
    } finally {
      _$_ProjectStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fetchProjectsFuture: ${fetchProjectsFuture},
fetchProjectFuture: ${fetchProjectFuture},
getProjectFuture: ${getProjectFuture},
updateProjectFuture: ${updateProjectFuture},
projectList: ${projectList},
apiResponseMessage: ${apiResponseMessage},
apiResponseSuccess: ${apiResponseSuccess},
success: ${success},
deleted: ${deleted},
allProjectList: ${allProjectList},
onlyLikeProject: ${onlyLikeProject},
manualLoading: ${manualLoading},
showLikedOnly: ${showLikedOnly},
globalGetAllProjectParams: ${globalGetAllProjectParams},
isLoading: ${isLoading}
    ''';
  }
}
