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

  late final _$transcriptFileAtom =
      Atom(name: '_UserStore.transcriptFile', context: context);

  @override
  String get transcriptFile {
    _$transcriptFileAtom.reportRead();
    return super.transcriptFile;
  }

  @override
  set transcriptFile(String value) {
    _$transcriptFileAtom.reportWrite(value, super.transcriptFile, () {
      super.transcriptFile = value;
    });
  }

  late final _$resumeFileAtom =
      Atom(name: '_UserStore.resumeFile', context: context);

  @override
  String get resumeFile {
    _$resumeFileAtom.reportRead();
    return super.resumeFile;
  }

  @override
  set resumeFile(String value) {
    _$resumeFileAtom.reportWrite(value, super.resumeFile, () {
      super.resumeFile = value;
    });
  }

  late final _$studentTranscriptFileAtom =
      Atom(name: '_UserStore.studentTranscriptFile', context: context);

  @override
  String get studentTranscriptFile {
    _$studentTranscriptFileAtom.reportRead();
    return super.studentTranscriptFile;
  }

  @override
  set studentTranscriptFile(String value) {
    _$studentTranscriptFileAtom.reportWrite(value, super.studentTranscriptFile,
        () {
      super.studentTranscriptFile = value;
    });
  }

  late final _$studentResumeFileAtom =
      Atom(name: '_UserStore.studentResumeFile', context: context);

  @override
  String get studentResumeFile {
    _$studentResumeFileAtom.reportRead();
    return super.studentResumeFile;
  }

  @override
  set studentResumeFile(String value) {
    _$studentResumeFileAtom.reportWrite(value, super.studentResumeFile, () {
      super.studentResumeFile = value;
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

  late final _$forgotSuccessAtom =
      Atom(name: '_UserStore.forgotSuccess', context: context);

  @override
  bool? get forgotSuccess {
    _$forgotSuccessAtom.reportRead();
    return super.forgotSuccess;
  }

  @override
  set forgotSuccess(bool? value) {
    _$forgotSuccessAtom.reportWrite(value, super.forgotSuccess, () {
      super.forgotSuccess = value;
    });
  }

  late final _$changeSuccessAtom =
      Atom(name: '_UserStore.changeSuccess', context: context);

  @override
  bool? get changeSuccess {
    _$changeSuccessAtom.reportRead();
    return super.changeSuccess;
  }

  @override
  set changeSuccess(bool? value) {
    _$changeSuccessAtom.reportWrite(value, super.changeSuccess, () {
      super.changeSuccess = value;
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

  late final _$forgotMessageAtom =
      Atom(name: '_UserStore.forgotMessage', context: context);

  @override
  String get forgotMessage {
    _$forgotMessageAtom.reportRead();
    return super.forgotMessage;
  }

  @override
  set forgotMessage(String value) {
    _$forgotMessageAtom.reportWrite(value, super.forgotMessage, () {
      super.forgotMessage = value;
    });
  }

  late final _$changeMessageAtom =
      Atom(name: '_UserStore.changeMessage', context: context);

  @override
  String get changeMessage {
    _$changeMessageAtom.reportRead();
    return super.changeMessage;
  }

  @override
  set changeMessage(String value) {
    _$changeMessageAtom.reportWrite(value, super.changeMessage, () {
      super.changeMessage = value;
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

  late final _$onFinishStudentProfileAtom =
      Atom(name: '_UserStore.onFinishStudentProfile', context: context);

  @override
  bool? get onFinishStudentProfile {
    _$onFinishStudentProfileAtom.reportRead();
    return super.onFinishStudentProfile;
  }

  @override
  set onFinishStudentProfile(bool? value) {
    _$onFinishStudentProfileAtom
        .reportWrite(value, super.onFinishStudentProfile, () {
      super.onFinishStudentProfile = value;
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

  late final _$profileStudentAtom =
      Atom(name: '_UserStore.profileStudent', context: context);

  @override
  ProfileStudent? get profileStudent {
    _$profileStudentAtom.reportRead();
    return super.profileStudent;
  }

  @override
  set profileStudent(ProfileStudent? value) {
    _$profileStudentAtom.reportWrite(value, super.profileStudent, () {
      super.profileStudent = value;
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

  late final _$uploadResumeFutureAtom =
      Atom(name: '_UserStore.uploadResumeFuture', context: context);

  @override
  ObservableFuture<dynamic> get uploadResumeFuture {
    _$uploadResumeFutureAtom.reportRead();
    return super.uploadResumeFuture;
  }

  @override
  set uploadResumeFuture(ObservableFuture<dynamic> value) {
    _$uploadResumeFutureAtom.reportWrite(value, super.uploadResumeFuture, () {
      super.uploadResumeFuture = value;
    });
  }

  late final _$uploadTranscriptFutureAtom =
      Atom(name: '_UserStore.uploadTranscriptFuture', context: context);

  @override
  ObservableFuture<dynamic> get uploadTranscriptFuture {
    _$uploadTranscriptFutureAtom.reportRead();
    return super.uploadTranscriptFuture;
  }

  @override
  set uploadTranscriptFuture(ObservableFuture<dynamic> value) {
    _$uploadTranscriptFutureAtom
        .reportWrite(value, super.uploadTranscriptFuture, () {
      super.uploadTranscriptFuture = value;
    });
  }

  late final _$createLanguageFutureAtom =
      Atom(name: '_UserStore.createLanguageFuture', context: context);

  @override
  ObservableFuture<dynamic> get createLanguageFuture {
    _$createLanguageFutureAtom.reportRead();
    return super.createLanguageFuture;
  }

  @override
  set createLanguageFuture(ObservableFuture<dynamic> value) {
    _$createLanguageFutureAtom.reportWrite(value, super.createLanguageFuture,
        () {
      super.createLanguageFuture = value;
    });
  }

  late final _$createEducationFutureAtom =
      Atom(name: '_UserStore.createEducationFuture', context: context);

  @override
  ObservableFuture<dynamic> get createEducationFuture {
    _$createEducationFutureAtom.reportRead();
    return super.createEducationFuture;
  }

  @override
  set createEducationFuture(ObservableFuture<dynamic> value) {
    _$createEducationFutureAtom.reportWrite(value, super.createEducationFuture,
        () {
      super.createEducationFuture = value;
    });
  }

  late final _$createExperienceFutureAtom =
      Atom(name: '_UserStore.createExperienceFuture', context: context);

  @override
  ObservableFuture<dynamic> get createExperienceFuture {
    _$createExperienceFutureAtom.reportRead();
    return super.createExperienceFuture;
  }

  @override
  set createExperienceFuture(ObservableFuture<dynamic> value) {
    _$createExperienceFutureAtom
        .reportWrite(value, super.createExperienceFuture, () {
      super.createExperienceFuture = value;
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

  late final _$forgotFutureAtom =
      Atom(name: '_UserStore.forgotFuture', context: context);

  @override
  ObservableFuture<dynamic> get forgotFuture {
    _$forgotFutureAtom.reportRead();
    return super.forgotFuture;
  }

  @override
  set forgotFuture(ObservableFuture<dynamic> value) {
    _$forgotFutureAtom.reportWrite(value, super.forgotFuture, () {
      super.forgotFuture = value;
    });
  }

  late final _$changeFutureAtom =
      Atom(name: '_UserStore.changeFuture', context: context);

  @override
  ObservableFuture<dynamic> get changeFuture {
    _$changeFutureAtom.reportRead();
    return super.changeFuture;
  }

  @override
  set changeFuture(ObservableFuture<dynamic> value) {
    _$changeFutureAtom.reportWrite(value, super.changeFuture, () {
      super.changeFuture = value;
    });
  }

  late final _$apiCallingFeatureAtom =
      Atom(name: '_UserStore.apiCallingFeature', context: context);

  @override
  ObservableFuture<dynamic> get apiCallingFeature {
    _$apiCallingFeatureAtom.reportRead();
    return super.apiCallingFeature;
  }

  @override
  set apiCallingFeature(ObservableFuture<dynamic> value) {
    _$apiCallingFeatureAtom.reportWrite(value, super.apiCallingFeature, () {
      super.apiCallingFeature = value;
    });
  }

  late final _$apiStudentProfileResponseAtom =
      Atom(name: '_UserStore.apiStudentProfileResponse', context: context);

  @override
  ObservableFuture<dynamic> get apiStudentProfileResponse {
    _$apiStudentProfileResponseAtom.reportRead();
    return super.apiStudentProfileResponse;
  }

  @override
  set apiStudentProfileResponse(ObservableFuture<dynamic> value) {
    _$apiStudentProfileResponseAtom
        .reportWrite(value, super.apiStudentProfileResponse, () {
      super.apiStudentProfileResponse = value;
    });
  }

  late final _$apiUpdateProfileAtom =
      Atom(name: '_UserStore.apiUpdateProfile', context: context);

  @override
  ObservableFuture<dynamic> get apiUpdateProfile {
    _$apiUpdateProfileAtom.reportRead();
    return super.apiUpdateProfile;
  }

  @override
  set apiUpdateProfile(ObservableFuture<dynamic> value) {
    _$apiUpdateProfileAtom.reportWrite(value, super.apiUpdateProfile, () {
      super.apiUpdateProfile = value;
    });
  }

  late final _$currentChatProjectIdAtom =
      Atom(name: '_UserStore.currentChatProjectId', context: context);

  @override
  int? get currentChatProjectId {
    _$currentChatProjectIdAtom.reportRead();
    return super.currentChatProjectId;
  }

  @override
  set currentChatProjectId(int? value) {
    _$currentChatProjectIdAtom.reportWrite(value, super.currentChatProjectId,
        () {
      super.currentChatProjectId = value;
    });
  }

  late final _$currentChatUserIdAtom =
      Atom(name: '_UserStore.currentChatUserId', context: context);

  @override
  int? get currentChatUserId {
    _$currentChatUserIdAtom.reportRead();
    return super.currentChatUserId;
  }

  @override
  set currentChatUserId(int? value) {
    _$currentChatUserIdAtom.reportWrite(value, super.currentChatUserId, () {
      super.currentChatUserId = value;
    });
  }

  late final _$currentChatAtom =
      Atom(name: '_UserStore.currentChat', context: context);

  @override
  List<ChatEntity> get currentChat {
    _$currentChatAtom.reportRead();
    return super.currentChat;
  }

  @override
  set currentChat(List<ChatEntity> value) {
    _$currentChatAtom.reportWrite(value, super.currentChat, () {
      super.currentChat = value;
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

  late final _$forgotAsyncAction =
      AsyncAction('_UserStore.forgot', context: context);

  @override
  Future<dynamic> forgot(String email) {
    return _$forgotAsyncAction.run(() => super.forgot(email));
  }

  late final _$changeAsyncAction =
      AsyncAction('_UserStore.change', context: context);

  @override
  Future<dynamic> change(String oldPassword, String newPassword) {
    return _$changeAsyncAction
        .run(() => super.change(oldPassword, newPassword));
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

  late final _$uploadResumeAsyncAction =
      AsyncAction('_UserStore.uploadResume', context: context);

  @override
  Future<dynamic> uploadResume(PlatformFile file) {
    return _$uploadResumeAsyncAction.run(() => super.uploadResume(file));
  }

  late final _$uploadTranscriptAsyncAction =
      AsyncAction('_UserStore.uploadTranscript', context: context);

  @override
  Future<dynamic> uploadTranscript(PlatformFile file) {
    return _$uploadTranscriptAsyncAction
        .run(() => super.uploadTranscript(file));
  }

  late final _$createLanguagesAsyncAction =
      AsyncAction('_UserStore.createLanguages', context: context);

  @override
  Future<dynamic> createLanguages(List<ProfileLanguage?> languages) {
    return _$createLanguagesAsyncAction
        .run(() => super.createLanguages(languages));
  }

  late final _$createEducationsAsyncAction =
      AsyncAction('_UserStore.createEducations', context: context);

  @override
  Future<dynamic> createEducations(List<Education?> educations) {
    return _$createEducationsAsyncAction
        .run(() => super.createEducations(educations));
  }

  late final _$createExperiencesAsyncAction =
      AsyncAction('_UserStore.createExperiences', context: context);

  @override
  Future<dynamic> createExperiences(List<Experience?> experiences) {
    return _$createExperiencesAsyncAction
        .run(() => super.createExperiences(experiences));
  }

  late final _$createUpdateStudentProfileAsyncAction =
      AsyncAction('_UserStore.createUpdateStudentProfile', context: context);

  @override
  Future<dynamic> createUpdateStudentProfile(
      CreateUpdateStudentProfileParams param) {
    return _$createUpdateStudentProfileAsyncAction
        .run(() => super.createUpdateStudentProfile(param));
  }

  late final _$bulkCreateUpdateStudentProfileAsyncAction = AsyncAction(
      '_UserStore.bulkCreateUpdateStudentProfile',
      context: context);

  @override
  Future<dynamic> bulkCreateUpdateStudentProfile(
      FormStudent.FormStudentProfileStore formStore) {
    return _$bulkCreateUpdateStudentProfileAsyncAction
        .run(() => super.bulkCreateUpdateStudentProfile(formStore));
  }

  late final _$getTranscriptFileAsyncAction =
      AsyncAction('_UserStore.getTranscriptFile', context: context);

  @override
  Future<dynamic> getTranscriptFile() {
    return _$getTranscriptFileAsyncAction.run(() => super.getTranscriptFile());
  }

  late final _$getResumeFileAsyncAction =
      AsyncAction('_UserStore.getResumeFile', context: context);

  @override
  Future<dynamic> getResumeFile() {
    return _$getResumeFileAsyncAction.run(() => super.getResumeFile());
  }

  late final _$getStudentTranscriptFileAsyncAction =
      AsyncAction('_UserStore.getStudentTranscriptFile', context: context);

  @override
  Future<dynamic> getStudentTranscriptFile() {
    return _$getStudentTranscriptFileAsyncAction
        .run(() => super.getStudentTranscriptFile());
  }

  late final _$getStudentResumeFileAsyncAction =
      AsyncAction('_UserStore.getStudentResumeFile', context: context);

  @override
  Future<dynamic> getStudentResumeFile() {
    return _$getStudentResumeFileAsyncAction
        .run(() => super.getStudentResumeFile());
  }

  late final _$submitProposalAsyncAction =
      AsyncAction('_UserStore.submitProposal', context: context);

  @override
  Future<dynamic> submitProposal(int projectId, String coverLetter) {
    return _$submitProposalAsyncAction
        .run(() => super.submitProposal(projectId, coverLetter));
  }

  late final _$getStudentProfileAsyncAction =
      AsyncAction('_UserStore.getStudentProfile', context: context);

  @override
  Future<dynamic> getStudentProfile(int student_id) {
    return _$getStudentProfileAsyncAction
        .run(() => super.getStudentProfile(student_id));
  }

  late final _$getCurrentChatAsyncAction =
      AsyncAction('_UserStore.getCurrentChat', context: context);

  @override
  Future<dynamic> getCurrentChat() {
    return _$getCurrentChatAsyncAction.run(() => super.getCurrentChat());
  }

  late final _$_UserStoreActionController =
      ActionController(name: '_UserStore', context: context);

  @override
  void setCurrentChat(int? projectId, int? userId) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setCurrentChat');
    try {
      return super.setCurrentChat(projectId, userId);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCurrentChat(ChatEntity chat) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.addCurrentChat');
    try {
      return super.addCurrentChat(chat);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
transcriptFile: ${transcriptFile},
resumeFile: ${resumeFile},
studentTranscriptFile: ${studentTranscriptFile},
studentResumeFile: ${studentResumeFile},
techstacks: ${techstacks},
skillSets: ${skillSets},
currentRole: ${currentRole},
success: ${success},
signupSuccess: ${signupSuccess},
forgotSuccess: ${forgotSuccess},
changeSuccess: ${changeSuccess},
getMeSuccess: ${getMeSuccess},
signupMessage: ${signupMessage},
forgotMessage: ${forgotMessage},
changeMessage: ${changeMessage},
siginMessage: ${siginMessage},
apiResponseMessage: ${apiResponseMessage},
apiResponseSuccess: ${apiResponseSuccess},
onFinishStudentProfile: ${onFinishStudentProfile},
isCreateProfile: ${isCreateProfile},
profileStudent: ${profileStudent},
loginFuture: ${loginFuture},
signinFuture: ${signinFuture},
getMeFuture: ${getMeFuture},
uploadResumeFuture: ${uploadResumeFuture},
uploadTranscriptFuture: ${uploadTranscriptFuture},
createLanguageFuture: ${createLanguageFuture},
createEducationFuture: ${createEducationFuture},
createExperienceFuture: ${createExperienceFuture},
getAllTechStackFuture: ${getAllTechStackFuture},
createCompanyProfileFuture: ${createCompanyProfileFuture},
forgotFuture: ${forgotFuture},
changeFuture: ${changeFuture},
apiCallingFeature: ${apiCallingFeature},
apiStudentProfileResponse: ${apiStudentProfileResponse},
apiUpdateProfile: ${apiUpdateProfile},
currentChatProjectId: ${currentChatProjectId},
currentChatUserId: ${currentChatUserId},
currentChat: ${currentChat},
isLoading: ${isLoading},
isSignin: ${isSignin}
    ''';
  }
}
