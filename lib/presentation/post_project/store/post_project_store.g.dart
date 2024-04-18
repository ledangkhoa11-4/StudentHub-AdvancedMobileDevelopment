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
  String toString() {
    return '''
fetchProjectsFuture: ${fetchProjectsFuture},
fetchProjectFuture: ${fetchProjectFuture},
getProjectFuture: ${getProjectFuture},
projectList: ${projectList},
apiResponseMessage: ${apiResponseMessage},
apiResponseSuccess: ${apiResponseSuccess},
success: ${success},
allProjectList: ${allProjectList},
isLoading: ${isLoading}
    ''';
  }
}
