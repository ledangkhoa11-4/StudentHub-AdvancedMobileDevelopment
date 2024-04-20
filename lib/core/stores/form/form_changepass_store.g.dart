// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_changepass_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormChangeStore on _FormChangeStore, Store {
  Computed<bool>? _$canLoginComputed;

  @override
  bool get canLogin =>
      (_$canLoginComputed ??= Computed<bool>(() => super.canLogin,
              name: '_FormChangeStore.canLogin'))
          .value;
  Computed<bool>? _$canRegisterComputed;

  @override
  bool get canRegister =>
      (_$canRegisterComputed ??= Computed<bool>(() => super.canRegister,
              name: '_FormChangeStore.canRegister'))
          .value;

  late final _$passwordAtom =
      Atom(name: '_FormChangeStore.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$NewPasswordAtom =
      Atom(name: '_FormChangeStore.NewPassword', context: context);

  @override
  String get NewPassword {
    _$NewPasswordAtom.reportRead();
    return super.NewPassword;
  }

  @override
  set NewPassword(String value) {
    _$NewPasswordAtom.reportWrite(value, super.NewPassword, () {
      super.NewPassword = value;
    });
  }

  late final _$successAtom =
      Atom(name: '_FormChangeStore.success', context: context);

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

  late final _$_FormChangeStoreActionController =
      ActionController(name: '_FormChangeStore', context: context);

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_FormChangeStoreActionController.startAction(
        name: '_FormChangeStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_FormChangeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNewPassword(String value) {
    final _$actionInfo = _$_FormChangeStoreActionController.startAction(
        name: '_FormChangeStore.setNewPassword');
    try {
      return super.setNewPassword(value);
    } finally {
      _$_FormChangeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_FormChangeStoreActionController.startAction(
        name: '_FormChangeStore.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_FormChangeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateNewPassword(String value) {
    final _$actionInfo = _$_FormChangeStoreActionController.startAction(
        name: '_FormChangeStore.validateNewPassword');
    try {
      return super.validateNewPassword(value);
    } finally {
      _$_FormChangeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
password: ${password},
NewPassword: ${NewPassword},
success: ${success},
canLogin: ${canLogin},
canRegister: ${canRegister}
    ''';
  }
}

mixin _$FormErrorStore on _FormErrorStore, Store {
  Computed<bool>? _$hasErrorsInpasswordComputed;

  @override
  bool get hasErrorsInpassword => (_$hasErrorsInpasswordComputed ??=
          Computed<bool>(() => super.hasErrorsInpassword,
              name: '_FormErrorStore.hasErrorsInpassword'))
      .value;
  Computed<bool>? _$hasErrorsInnewpasswordComputed;

  @override
  bool get hasErrorsInnewpassword => (_$hasErrorsInnewpasswordComputed ??=
          Computed<bool>(() => super.hasErrorsInnewpassword,
              name: '_FormErrorStore.hasErrorsInnewpassword'))
      .value;

  late final _$passwordAtom =
      Atom(name: '_FormErrorStore.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$NewPasswordAtom =
      Atom(name: '_FormErrorStore.NewPassword', context: context);

  @override
  String? get NewPassword {
    _$NewPasswordAtom.reportRead();
    return super.NewPassword;
  }

  @override
  set NewPassword(String? value) {
    _$NewPasswordAtom.reportWrite(value, super.NewPassword, () {
      super.NewPassword = value;
    });
  }

  @override
  String toString() {
    return '''
password: ${password},
NewPassword: ${NewPassword},
hasErrorsInpassword: ${hasErrorsInpassword},
hasErrorsInnewpassword: ${hasErrorsInnewpassword}
    ''';
  }
}
