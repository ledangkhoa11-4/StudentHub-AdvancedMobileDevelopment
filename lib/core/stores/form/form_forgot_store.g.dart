// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_forgot_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormForgotStore on _FormForgotStore, Store {
  Computed<bool>? _$canForgetPasswordComputed;

  @override
  bool get canForgetPassword => (_$canForgetPasswordComputed ??= Computed<bool>(
          () => super.canForgetPassword,
          name: '_FormForgotStore.canForgetPassword'))
      .value;

  late final _$userEmailAtom =
      Atom(name: '_FormForgotStore.userEmail', context: context);

  @override
  String get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  late final _$successAtom =
      Atom(name: '_FormForgotStore.success', context: context);

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

  late final _$_FormForgotStoreActionController =
      ActionController(name: '_FormForgotStore', context: context);

  @override
  void setUserId(String value) {
    final _$actionInfo = _$_FormForgotStoreActionController.startAction(
        name: '_FormForgotStore.setUserId');
    try {
      return super.setUserId(value);
    } finally {
      _$_FormForgotStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUserEmail(String value) {
    final _$actionInfo = _$_FormForgotStoreActionController.startAction(
        name: '_FormForgotStore.validateUserEmail');
    try {
      return super.validateUserEmail(value);
    } finally {
      _$_FormForgotStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userEmail: ${userEmail},
success: ${success},
canForgetPassword: ${canForgetPassword}
    ''';
  }
}

mixin _$FormErrorStore on _FormErrorStore, Store {
  Computed<bool>? _$hasErrorsInLoginComputed;

  @override
  bool get hasErrorsInLogin => (_$hasErrorsInLoginComputed ??= Computed<bool>(
          () => super.hasErrorsInLogin,
          name: '_FormErrorStore.hasErrorsInLogin'))
      .value;

  late final _$userEmailAtom =
      Atom(name: '_FormErrorStore.userEmail', context: context);

  @override
  String? get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String? value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  @override
  String toString() {
    return '''
userEmail: ${userEmail},
hasErrorsInLogin: ${hasErrorsInLogin}
    ''';
  }
}
