// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading => (_$isLoadingComputed ??=
          Computed<bool>(() => super.isLoading, name: '_UserStore.isLoading'))
      .value;
  Computed<bool>? _$isSigninComputed;

  @override
  bool get isSignin => (_$isSigninComputed ??=
          Computed<bool>(() => super.isSignin, name: '_UserStore.isSignin'))
      .value;

  late final _$userAtom = Atom(name: '_UserStore.user', context: context);

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$techstacksAtom =
      Atom(name: '_UserStore.techstacks', context: context);

  @override
  List<TechStack>? get techstacks {
    _$techstacksAtom.reportRead();
    return super.techstacks;
  }

  @override
  set techstacks(List<TechStack>? value) {
    _$techstacksAtom.reportWrite(value, super.techstacks, () {
      super.techstacks = value;
    });
  }

  late final _$skillSetsAtom =
      Atom(name: '_UserStore.skillSets', context: context);

  @override
  List<Skillset>? get skillSets {
    _$skillSetsAtom.reportRead();
    return super.skillSets;
  }

  @override
  set skillSets(List<Skillset>? value) {
    _$skillSetsAtom.reportWrite(value, super.skillSets, () {
      super.skillSets = value;
    });
  }

  late final _$currentRoleAtom =
      Atom(name: '_UserStore.currentRole', context: context);

  @override
  int? get currentRole {
    _$currentRoleAtom.reportRead();
    return super.currentRole;
  }

  @override
  set currentRole(int? value) {
    _$currentRoleAtom.reportWrite(value, super.currentRole, () {
      super.currentRole = value;
    });
  }

  late final _$successAtom = Atom(name: '_UserStore.success', context: context);

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

  late final _$signupSuccessAtom =
      Atom(name: '_UserStore.signupSuccess', context: context);

  @override
  bool? get signupSuccess {
    _$signupSuccessAtom.reportRead();
    return super.signupSuccess;
  }

  @override
  set signupSuccess(bool? value) {
    _$signupSuccessAtom.reportWrite(value, super.signupSuccess, () {
      super.signupSuccess = value;
    });
  }

  late final _$getMeSuccessAtom =
      Atom(name: '_UserStore.getMeSuccess', context: context);

  @override
  bool? get getMeSuccess {
    _$getMeSuccessAtom.reportRead();
    return super.getMeSuccess;
  }

  @override
  set getMeSuccess(bool? value) {
    _$getMeSuccessAtom.reportWrite(value, super.getMeSuccess, () {
      super.getMeSuccess = value;
    });
  }

  late final _$signupMessageAtom =
      Atom(name: '_UserStore.signupMessage', context: context);

  @override
  String get signupMessage {
    _$signupMessageAtom.reportRead();
    return super.signupMessage;
  }

  @override
  set signupMessage(String value) {
    _$signupMessageAtom.reportWrite(value, super.signupMessage, () {
      super.signupMessage = value;
    });
  }

  late final _$siginMessageAtom =
      Atom(name: '_UserStore.siginMessage', context: context);

  @override
  String get siginMessage {
    _$siginMessageAtom.reportRead();
    return super.siginMessage;
  }

  @override
  set siginMessage(String value) {
    _$siginMessageAtom.reportWrite(value, super.siginMessage, () {
      super.siginMessage = value;
    });
  }

  late final _$apiResponseMessageAtom =
      Atom(name: '_UserStore.apiResponseMessage', context: context);

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
      Atom(name: '_UserStore.apiResponseSuccess', context: context);

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

  late final _$isCreateProfileAtom =
      Atom(name: '_UserStore.isCreateProfile', context: context);

  @override
  bool? get isCreateProfile {
    _$isCreateProfileAtom.reportRead();
    return super.isCreateProfile;
  }

  @override
  set isCreateProfile(bool? value) {
    _$isCreateProfileAtom.reportWrite(value, super.isCreateProfile, () {
      super.isCreateProfile = value;
    });
  }

  late final _$loginFutureAtom =
      Atom(name: '_UserStore.loginFuture', context: context);

  @override
  ObservableFuture<dynamic> get loginFuture {
    _$loginFutureAtom.reportRead();
    return super.loginFuture;
  }

  @override
  set loginFuture(ObservableFuture<dynamic> value) {
    _$loginFutureAtom.reportWrite(value, super.loginFuture, () {
      super.loginFuture = value;
    });
  }

  late final _$signinFutureAtom =
      Atom(name: '_UserStore.signinFuture', context: context);

  @override
  ObservableFuture<dynamic> get signinFuture {
    _$signinFutureAtom.reportRead();
    return super.signinFuture;
  }

  @override
  set signinFuture(ObservableFuture<dynamic> value) {
    _$signinFutureAtom.reportWrite(value, super.signinFuture, () {
      super.signinFuture = value;
    });
  }

  late final _$getMeFutureAtom =
      Atom(name: '_UserStore.getMeFuture', context: context);

  @override
  ObservableFuture<dynamic> get getMeFuture {
    _$getMeFutureAtom.reportRead();
    return super.getMeFuture;
  }

  @override
  set getMeFuture(ObservableFuture<dynamic> value) {
    _$getMeFutureAtom.reportWrite(value, super.getMeFuture, () {
      super.getMeFuture = value;
    });
  }

  late final _$getAllTechStackFutureAtom =
      Atom(name: '_UserStore.getAllTechStackFuture', context: context);

  @override
  ObservableFuture<dynamic> get getAllTechStackFuture {
    _$getAllTechStackFutureAtom.reportRead();
    return super.getAllTechStackFuture;
  }

  @override
  set getAllTechStackFuture(ObservableFuture<dynamic> value) {
    _$getAllTechStackFutureAtom.reportWrite(value, super.getAllTechStackFuture,
        () {
      super.getAllTechStackFuture = value;
    });
  }

  late final _$createCompanyProfileFutureAtom =
      Atom(name: '_UserStore.createCompanyProfileFuture', context: context);

  @override
  ObservableFuture<dynamic> get createCompanyProfileFuture {
    _$createCompanyProfileFutureAtom.reportRead();
    return super.createCompanyProfileFuture;
  }

  @override
  set createCompanyProfileFuture(ObservableFuture<dynamic> value) {
    _$createCompanyProfileFutureAtom
        .reportWrite(value, super.createCompanyProfileFuture, () {
      super.createCompanyProfileFuture = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('_UserStore.login', context: context);

  @override
  Future<dynamic> login(String email, String password) {
    return _$loginAsyncAction.run(() => super.login(email, password));
  }

  late final _$signupAsyncAction =
      AsyncAction('_UserStore.signup', context: context);

  @override
  Future<dynamic> signup(
      String fullname, String email, String password, int role) {
    return _$signupAsyncAction
        .run(() => super.signup(fullname, email, password, role));
  }

  late final _$getMeAsyncAction =
      AsyncAction('_UserStore.getMe', context: context);

  @override
  Future<dynamic> getMe() {
    return _$getMeAsyncAction.run(() => super.getMe());
  }

  late final _$createUpdateCompanyProfileAsyncAction =
      AsyncAction('_UserStore.createUpdateCompanyProfile', context: context);

  @override
  Future<dynamic> createUpdateCompanyProfile(
      CreateUpdateCompanyProfileParams param) {
    return _$createUpdateCompanyProfileAsyncAction
        .run(() => super.createUpdateCompanyProfile(param));
  }

  late final _$getAllTechStackAsyncAction =
      AsyncAction('_UserStore.getAllTechStack', context: context);

  @override
  Future<dynamic> getAllTechStack() {
    return _$getAllTechStackAsyncAction.run(() => super.getAllTechStack());
  }

  late final _$getAllSkillsetAsyncAction =
      AsyncAction('_UserStore.getAllSkillset', context: context);

  @override
  Future<dynamic> getAllSkillset() {
    return _$getAllSkillsetAsyncAction.run(() => super.getAllSkillset());
  }

  @override
  String toString() {
    return '''
user: ${user},
techstacks: ${techstacks},
skillSets: ${skillSets},
currentRole: ${currentRole},
success: ${success},
signupSuccess: ${signupSuccess},
getMeSuccess: ${getMeSuccess},
signupMessage: ${signupMessage},
siginMessage: ${siginMessage},
apiResponseMessage: ${apiResponseMessage},
apiResponseSuccess: ${apiResponseSuccess},
isCreateProfile: ${isCreateProfile},
loginFuture: ${loginFuture},
signinFuture: ${signinFuture},
getMeFuture: ${getMeFuture},
getAllTechStackFuture: ${getAllTechStackFuture},
createCompanyProfileFuture: ${createCompanyProfileFuture},
isLoading: ${isLoading},
isSignin: ${isSignin}
    ''';
  }
}
