// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_project_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProjectStore on _ProjectStore, Store {
  Computed<bool>? _$loadingComputed;

  @override
  bool get loading => (_$loadingComputed ??=
          Computed<bool>(() => super.loading, name: '_ProjectStore.loading'))
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

  late final _$successAtom =
      Atom(name: '_ProjectStore.success', context: context);

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
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

  @override
  String toString() {
    return '''
fetchProjectsFuture: ${fetchProjectsFuture},
projectList: ${projectList},
success: ${success},
loading: ${loading}
    ''';
  }
}
