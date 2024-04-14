// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_post_project_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormPostProjectStore on _FormPostProjectStore, Store {
  late final _$companyIdAtom =
      Atom(name: '_FormPostProjectStore.companyId', context: context);

  @override
  int get companyId {
    _$companyIdAtom.reportRead();
    return super.companyId;
  }

  @override
  set companyId(int value) {
    _$companyIdAtom.reportWrite(value, super.companyId, () {
      super.companyId = value;
    });
  }

  late final _$projectScopeFlagAtom =
      Atom(name: '_FormPostProjectStore.projectScopeFlag', context: context);

  @override
  int get projectScopeFlag {
    _$projectScopeFlagAtom.reportRead();
    return super.projectScopeFlag;
  }

  @override
  set projectScopeFlag(int value) {
    _$projectScopeFlagAtom.reportWrite(value, super.projectScopeFlag, () {
      super.projectScopeFlag = value;
    });
  }

  late final _$typeFlagAtom =
      Atom(name: '_FormPostProjectStore.typeFlag', context: context);

  @override
  int get typeFlag {
    _$typeFlagAtom.reportRead();
    return super.typeFlag;
  }

  @override
  set typeFlag(int value) {
    _$typeFlagAtom.reportWrite(value, super.typeFlag, () {
      super.typeFlag = value;
    });
  }

  late final _$titleAtom =
      Atom(name: '_FormPostProjectStore.title', context: context);

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$durationAtom =
      Atom(name: '_FormPostProjectStore.duration', context: context);

  @override
  String get duration {
    _$durationAtom.reportRead();
    return super.duration;
  }

  @override
  set duration(String value) {
    _$durationAtom.reportWrite(value, super.duration, () {
      super.duration = value;
    });
  }

  late final _$numberOfStudentsAtom =
      Atom(name: '_FormPostProjectStore.numberOfStudents', context: context);

  @override
  int get numberOfStudents {
    _$numberOfStudentsAtom.reportRead();
    return super.numberOfStudents;
  }

  @override
  set numberOfStudents(int value) {
    _$numberOfStudentsAtom.reportWrite(value, super.numberOfStudents, () {
      super.numberOfStudents = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_FormPostProjectStore.description', context: context);

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  late final _$_FormPostProjectStoreActionController =
      ActionController(name: '_FormPostProjectStore', context: context);

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_FormPostProjectStoreActionController.startAction(
        name: '_FormPostProjectStore.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_FormPostProjectStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDuration(String value) {
    final _$actionInfo = _$_FormPostProjectStoreActionController.startAction(
        name: '_FormPostProjectStore.setDuration');
    try {
      return super.setDuration(value);
    } finally {
      _$_FormPostProjectStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumberStudents(int value) {
    final _$actionInfo = _$_FormPostProjectStoreActionController.startAction(
        name: '_FormPostProjectStore.setNumberStudents');
    try {
      return super.setNumberStudents(value);
    } finally {
      _$_FormPostProjectStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_FormPostProjectStoreActionController.startAction(
        name: '_FormPostProjectStore.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_FormPostProjectStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateTitle(String value) {
    final _$actionInfo = _$_FormPostProjectStoreActionController.startAction(
        name: '_FormPostProjectStore.validateTitle');
    try {
      return super.validateTitle(value);
    } finally {
      _$_FormPostProjectStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateDuration(String value) {
    final _$actionInfo = _$_FormPostProjectStoreActionController.startAction(
        name: '_FormPostProjectStore.validateDuration');
    try {
      return super.validateDuration(value);
    } finally {
      _$_FormPostProjectStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateNumberStudents(int value) {
    final _$actionInfo = _$_FormPostProjectStoreActionController.startAction(
        name: '_FormPostProjectStore.validateNumberStudents');
    try {
      return super.validateNumberStudents(value);
    } finally {
      _$_FormPostProjectStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateDescription(String value) {
    final _$actionInfo = _$_FormPostProjectStoreActionController.startAction(
        name: '_FormPostProjectStore.validateDescription');
    try {
      return super.validateDescription(value);
    } finally {
      _$_FormPostProjectStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
companyId: ${companyId},
projectScopeFlag: ${projectScopeFlag},
typeFlag: ${typeFlag},
title: ${title},
duration: ${duration},
numberOfStudents: ${numberOfStudents},
description: ${description}
    ''';
  }
}

mixin _$FormErrorStore on _FormErrorStore, Store {
  late final _$titleAtom =
      Atom(name: '_FormErrorStore.title', context: context);

  @override
  String? get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String? value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  late final _$durationAtom =
      Atom(name: '_FormErrorStore.duration', context: context);

  @override
  String? get duration {
    _$durationAtom.reportRead();
    return super.duration;
  }

  @override
  set duration(String? value) {
    _$durationAtom.reportWrite(value, super.duration, () {
      super.duration = value;
    });
  }

  late final _$numberStudentsAtom =
      Atom(name: '_FormErrorStore.numberStudents', context: context);

  @override
  String? get numberStudents {
    _$numberStudentsAtom.reportRead();
    return super.numberStudents;
  }

  @override
  set numberStudents(String? value) {
    _$numberStudentsAtom.reportWrite(value, super.numberStudents, () {
      super.numberStudents = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_FormErrorStore.description', context: context);

  @override
  String? get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String? value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  @override
  String toString() {
    return '''
title: ${title},
duration: ${duration},
numberStudents: ${numberStudents},
description: ${description}
    ''';
  }
}
