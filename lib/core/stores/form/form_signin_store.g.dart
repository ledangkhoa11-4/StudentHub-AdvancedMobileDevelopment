// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_signin_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormSigninStore on _FormSigninStore, Store {
  late final _$fullnameAtom =
      Atom(name: '_FormSigninStore.fullname', context: context);

  @override
  String get fullname {
    _$fullnameAtom.reportRead();
    return super.fullname;
  }

  @override
  set fullname(String value) {
    _$fullnameAtom.reportWrite(value, super.fullname, () {
      super.fullname = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_FormSigninStore.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_FormSigninStore.password', context: context);

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

  late final _$_FormSigninStoreActionController =
      ActionController(name: '_FormSigninStore', context: context);

  @override
  void setFullname(String value) {
    final _$actionInfo = _$_FormSigninStoreActionController.startAction(
        name: '_FormSigninStore.setFullname');
    try {
      return super.setFullname(value);
    } finally {
      _$_FormSigninStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_FormSigninStoreActionController.startAction(
        name: '_FormSigninStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_FormSigninStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_FormSigninStoreActionController.startAction(
        name: '_FormSigninStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_FormSigninStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateFullname(String value) {
    final _$actionInfo = _$_FormSigninStoreActionController.startAction(
        name: '_FormSigninStore.validateFullname');
    try {
      return super.validateFullname(value);
    } finally {
      _$_FormSigninStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateEmail(String value) {
    final _$actionInfo = _$_FormSigninStoreActionController.startAction(
        name: '_FormSigninStore.validateEmail');
    try {
      return super.validateEmail(value);
    } finally {
      _$_FormSigninStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_FormSigninStoreActionController.startAction(
        name: '_FormSigninStore.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_FormSigninStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fullname: ${fullname},
email: ${email},
password: ${password}
    ''';
  }
}

mixin _$FormErrorStore on _FormErrorStore, Store {
  late final _$fullnameAtom =
      Atom(name: '_FormErrorStore.fullname', context: context);

  @override
  String? get fullname {
    _$fullnameAtom.reportRead();
    return super.fullname;
  }

  @override
  set fullname(String? value) {
    _$fullnameAtom.reportWrite(value, super.fullname, () {
      super.fullname = value;
    });
  }

  late final _$emailAtom =
      Atom(name: '_FormErrorStore.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

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

  @override
  String toString() {
    return '''
fullname: ${fullname},
email: ${email},
password: ${password}
    ''';
  }
}
