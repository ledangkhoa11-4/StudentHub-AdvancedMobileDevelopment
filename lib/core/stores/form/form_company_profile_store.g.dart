// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_company_profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormCompanyProfileStore on _FormCompanyProfileStore, Store {
  late final _$companyNameAtom =
      Atom(name: '_FormCompanyProfileStore.companyName', context: context);

  @override
  String get companyName {
    _$companyNameAtom.reportRead();
    return super.companyName;
  }

  @override
  set companyName(String value) {
    _$companyNameAtom.reportWrite(value, super.companyName, () {
      super.companyName = value;
    });
  }

  late final _$websiteAtom =
      Atom(name: '_FormCompanyProfileStore.website', context: context);

  @override
  String get website {
    _$websiteAtom.reportRead();
    return super.website;
  }

  @override
  set website(String value) {
    _$websiteAtom.reportWrite(value, super.website, () {
      super.website = value;
    });
  }

  late final _$descriptionAtom =
      Atom(name: '_FormCompanyProfileStore.description', context: context);

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

  late final _$_FormCompanyProfileStoreActionController =
      ActionController(name: '_FormCompanyProfileStore', context: context);

  @override
  void setCompanyName(String value) {
    final _$actionInfo = _$_FormCompanyProfileStoreActionController.startAction(
        name: '_FormCompanyProfileStore.setCompanyName');
    try {
      return super.setCompanyName(value);
    } finally {
      _$_FormCompanyProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setWebsite(String value) {
    final _$actionInfo = _$_FormCompanyProfileStoreActionController.startAction(
        name: '_FormCompanyProfileStore.setWebsite');
    try {
      return super.setWebsite(value);
    } finally {
      _$_FormCompanyProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_FormCompanyProfileStoreActionController.startAction(
        name: '_FormCompanyProfileStore.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_FormCompanyProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateCompanyName(String value) {
    final _$actionInfo = _$_FormCompanyProfileStoreActionController.startAction(
        name: '_FormCompanyProfileStore.validateCompanyName');
    try {
      return super.validateCompanyName(value);
    } finally {
      _$_FormCompanyProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateWebsite(String value) {
    final _$actionInfo = _$_FormCompanyProfileStoreActionController.startAction(
        name: '_FormCompanyProfileStore.validateWebsite');
    try {
      return super.validateWebsite(value);
    } finally {
      _$_FormCompanyProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateDescription(String value) {
    final _$actionInfo = _$_FormCompanyProfileStoreActionController.startAction(
        name: '_FormCompanyProfileStore.validateDescription');
    try {
      return super.validateDescription(value);
    } finally {
      _$_FormCompanyProfileStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
companyName: ${companyName},
website: ${website},
description: ${description}
    ''';
  }
}

mixin _$FormErrorStore on _FormErrorStore, Store {
  late final _$companyNameAtom =
      Atom(name: '_FormErrorStore.companyName', context: context);

  @override
  String? get companyName {
    _$companyNameAtom.reportRead();
    return super.companyName;
  }

  @override
  set companyName(String? value) {
    _$companyNameAtom.reportWrite(value, super.companyName, () {
      super.companyName = value;
    });
  }

  late final _$websiteAtom =
      Atom(name: '_FormErrorStore.website', context: context);

  @override
  String? get website {
    _$websiteAtom.reportRead();
    return super.website;
  }

  @override
  set website(String? value) {
    _$websiteAtom.reportWrite(value, super.website, () {
      super.website = value;
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
companyName: ${companyName},
website: ${website},
description: ${description}
    ''';
  }
}
