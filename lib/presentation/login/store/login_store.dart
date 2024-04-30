import 'dart:convert';
import 'dart:io';

import 'package:boilerplate/core/stores/error/error_store.dart';
import 'package:boilerplate/core/stores/form/form_store.dart';
import 'package:boilerplate/core/stores/form/form_student_profile_store.dart'
    as FormStudent;
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/chat/chat.dart';
import 'package:boilerplate/domain/entity/chat/chatUser.dart';
import 'package:boilerplate/domain/entity/project/project_list.dart';
import 'package:boilerplate/domain/entity/proposal/proposal-type-no-project.dart';
import 'package:boilerplate/domain/entity/user/education.dart';
import 'package:boilerplate/domain/entity/user/experience.dart';
import 'package:boilerplate/domain/entity/user/language.dart';
import 'package:boilerplate/domain/entity/user/profile_student.dart';
import 'package:boilerplate/domain/entity/user/skillset.dart';
import 'package:boilerplate/domain/entity/user/tech_stack.dart';
import 'package:boilerplate/domain/usecase/project/get_submit_proposal_usecase.dart';
import 'package:boilerplate/domain/usecase/user/create_educatuon_usecase.dart';
import 'package:boilerplate/domain/usecase/user/create_experience_usecase.dart';
import 'package:boilerplate/domain/usecase/user/create_language_usecase.dart';
import 'package:boilerplate/domain/usecase/user/create_update_company_profile_usercase.dart';
import 'package:boilerplate/domain/usecase/user/create_update_student_profile_usercase.dart';
import 'package:boilerplate/domain/usecase/user/get_all_chat_by_projectid_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_all_chat_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_all_chat_with_userId_in_projectid_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_me_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_profile_file_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_skillset_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_techstack_usecase.dart';
import 'package:boilerplate/domain/usecase/user/is_logged_in_usecase.dart';
import 'package:boilerplate/domain/usecase/user/save_auth_token_usercase.dart';
import 'package:boilerplate/domain/usecase/user/save_current_profile_usecase.dart';
import 'package:boilerplate/domain/usecase/user/save_login_in_status_usecase.dart';
import 'package:boilerplate/domain/usecase/user/signup_usecase.dart';
import 'package:boilerplate/domain/usecase/user/forgot_usecase.dart';
import 'package:boilerplate/domain/usecase/user/change_usecase.dart';
import 'package:boilerplate/domain/usecase/user/submit_proposal_usecase.dart';
import 'package:boilerplate/domain/usecase/user/update_proposal_usecase.dart';
import 'package:boilerplate/domain/usecase/user/upload_resume_usecase.dart';
import 'package:boilerplate/domain/usecase/user/upload_transcript_usecase.dart';
import 'package:boilerplate/presentation/post_project/store/post_project_store.dart';
import 'package:boilerplate/utils/socket/socket.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/entity/user/user.dart';
import '../../../domain/usecase/user/get_student_profile_usecase.dart';
import '../../../domain/usecase/user/login_usecase.dart';

part 'login_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  // constructor:---------------------------------------------------------------
  _UserStore(
      this._isLoggedInUseCase,
      this._saveLoginStatusUseCase,
      this._saveAuthTokenUseCase,
      this._saveCurrentProfileUseCase,
      this._loginUseCase,
      this._changeUseCase,
      this._forgotUseCase,
      this._signupUseCase,
      this.formErrorStore,
      this.errorStore,
      this._getMeUseCase,
      this._createCompanyProfileUseCase,
      this._getAllTechStackUseCase,
      this._getAllSkillSetUseCase,
      this._uploadResumeUseCase,
      this._uploadTranscriptUseCase,
      this._createLanguageUseCase,
      this._createEducationUseCase,
      this._createExperiencesUseCase,
      this._createStudentProfileUseCase,
      this._getProfileFileUseCase,
      this._submitProposalUseCase,
      this._getStudentProfileUseCase,
      this._updateProposalUseCase,
      this._getAllChatUseCase,
      this._getAllChatByProjectUseCase,
      this._getAllChatWithUserInProjectUseCase) {
    // setting up disposers
    _setupDisposers();

    // checking if user is logged in
    _isLoggedInUseCase.call(params: null).then((value) async {
      isLoggedIn = value;
    });
  }

  // use cases:-----------------------------------------------------------------
  final IsLoggedInUseCase _isLoggedInUseCase;
  final SaveLoginStatusUseCase _saveLoginStatusUseCase;
  final SaveAuthTokenUseCase _saveAuthTokenUseCase;
  final SaveCurrentProfileUseCase _saveCurrentProfileUseCase;
  final LoginUseCase _loginUseCase;
  final ChangeUseCase _changeUseCase;
  final ForgotUseCase _forgotUseCase;
  final SignupUseCase _signupUseCase;
  final GetMeUseCase _getMeUseCase;
  final CreateUpdateCompanyProfileUseCase _createCompanyProfileUseCase;
  final GetTechStackUseCase _getAllTechStackUseCase;
  final GetSkillSetUseCase _getAllSkillSetUseCase;
  final UploadResumeUseCase _uploadResumeUseCase;
  final UploadTranscriptUseCase _uploadTranscriptUseCase;
  final CreateLanguageUseCase _createLanguageUseCase;
  final CreateEducationUseCase _createEducationUseCase;
  final CreateExperiencesUseCase _createExperiencesUseCase;
  final CreateUpdateStudentProfileUseCase _createStudentProfileUseCase;
  final GetProfileFileUseCase _getProfileFileUseCase;
  final SubmitProposalUseCase _submitProposalUseCase;
  final GetStudentProfileUseCase _getStudentProfileUseCase;
  final UpdateProposalUseCase _updateProposalUseCase;
  final GetAllChatByProjectUseCase _getAllChatByProjectUseCase;
  final GetAllChatUseCase _getAllChatUseCase;
  final GetAllChatWithUserInProjectUseCase _getAllChatWithUserInProjectUseCase;

  // stores:--------------------------------------------------------------------
  // for handling form errors
  final FormErrorStore formErrorStore;

  // store for handling error messages
  final ErrorStore errorStore;

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupDisposers() {
    _disposers = [
      reaction((_) => success, (_) => success = false, delay: 200),
      reaction((_) => changeSuccess, (_) => changeSuccess = false, delay: 200),
      reaction((_) => [apiResponseMessage, apiResponseSuccess], (_) {
        apiResponseSuccess = null;
        apiResponseMessage = "";
      }, delay: 200),
      reaction((_) => [currentChatProjectId, currentChatUserId],
          (_) => getCurrentChat()),
      reaction((_) => currentChatProjectId, (_) => getChatListByProjectId()),
      reaction((_) => currentChat, (_) => getAllChatList(loading: false)),
    ];
  }

  // empty responses:-----------------------------------------------------------
  static ObservableFuture<User?> emptyLoginResponse =
      ObservableFuture.value(null);

  // store variables:-----------------------------------------------------------
  bool isLoggedIn = false;

  @observable
  User? user = null;

  @observable
  String transcriptFile = "";

  @observable
  String resumeFile = "";

  @observable
  String studentTranscriptFile = "";

  @observable
  String studentResumeFile = "";

  @observable
  List<TechStack>? techstacks = null;

  @observable
  List<Skillset>? skillSets = null;

  @observable
  int? currentRole = null;

  @observable
  bool? success = null;

  @observable
  bool? signupSuccess = null;

  @observable
  bool? forgotSuccess = null;

  @observable
  bool? changeSuccess = null;

  @observable
  bool? getMeSuccess = null;

  @observable
  String signupMessage = "";

  @observable
  String forgotMessage = "";

  @observable
  String changeMessage = "";

  @observable
  String siginMessage = "";

  @observable
  String apiResponseMessage = "";

  @observable
  bool? apiResponseSuccess = null;

  @observable
  bool? onFinishStudentProfile = null;

  @observable
  bool? isCreateProfile = null;

  // [PHONG] --------------------------------------------------
  @observable
  ProfileStudent? profileStudent = null;
  bool? apiStudentResponseSuccess = null;

  @observable
  ObservableFuture<dynamic> loginFuture = emptyLoginResponse;

  @observable
  ObservableFuture<dynamic> signinFuture = emptyLoginResponse;

  @observable
  ObservableFuture<dynamic> getMeFuture = emptyLoginResponse;

  @observable
  ObservableFuture<dynamic> uploadResumeFuture = emptyLoginResponse;

  @observable
  ObservableFuture<dynamic> uploadTranscriptFuture = emptyLoginResponse;

  @observable
  ObservableFuture<dynamic> createLanguageFuture = emptyLoginResponse;

  @observable
  ObservableFuture<dynamic> createEducationFuture = emptyLoginResponse;

  @observable
  ObservableFuture<dynamic> createExperienceFuture = emptyLoginResponse;

  @observable
  ObservableFuture<dynamic> getAllTechStackFuture = emptyLoginResponse;

  @observable
  ObservableFuture<dynamic> createCompanyProfileFuture = emptyLoginResponse;

  @observable
  ObservableFuture<dynamic> forgotFuture = emptyLoginResponse;

  @observable
  ObservableFuture<dynamic> changeFuture = emptyLoginResponse;
  ObservableFuture<dynamic> createStudentProfileFuture = emptyLoginResponse;

  @observable
  ObservableFuture<dynamic> apiCallingFeature = emptyLoginResponse;

  @observable
  ObservableFuture<dynamic> apiStudentProfileResponse = emptyLoginResponse;

  @observable
  ObservableFuture<dynamic> apiUpdateProfile = emptyLoginResponse;

  @observable
  int? currentChatProjectId = null;

  @observable
  int? currentChatUserId = null;

  @observable
  List<ChatEntity> currentChat = [];

  @observable
  List<ChatEntity> chatList = [];

  @observable
  List<ChatEntity>? allChatList;

  @computed
  bool get isLoading =>
      loginFuture.status == FutureStatus.pending ||
      getMeFuture.status == FutureStatus.pending ||
      createCompanyProfileFuture.status == FutureStatus.pending ||
      forgotFuture.status == FutureStatus.pending ||
      changeFuture.status == FutureStatus.pending ||
      getAllTechStackFuture.status == FutureStatus.pending ||
      uploadResumeFuture.status == FutureStatus.pending ||
      uploadTranscriptFuture.status == FutureStatus.pending ||
      createEducationFuture.status == FutureStatus.pending ||
      createExperienceFuture.status == FutureStatus.pending ||
      createLanguageFuture.status == FutureStatus.pending ||
      apiCallingFeature.status == FutureStatus.pending ||
      apiStudentProfileResponse.status == FutureStatus.pending;

  @computed
  bool get isSignin => signinFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------
  @action
  Future login(String email, String password) async {
    final LoginParams loginParams =
        LoginParams(email: email, password: password);
    final future = _loginUseCase.call(params: loginParams);
    loginFuture = ObservableFuture(future);

    await future.then((value) async {
      if (value != null) {
        String message = value.toString();
        final response = jsonDecode(message);
        final token = response["result"]["token"].toString();
        await _saveAuthTokenUseCase.call(params: token);
        await _saveLoginStatusUseCase.call(params: true);
        this.isLoggedIn = true;
        this.success = true;
        this.siginMessage = "";
      }
    }).catchError((e) {
      String message = e.response.toString();
      final response = jsonDecode(message);
      this.isLoggedIn = false;
      this.success = false;
      this.siginMessage = response["errorDetails"].toString();
    });
  }

  @action
  Future signup(
      String fullname, String email, String password, int role) async {
    final SignupParam signupParam = SignupParam(
        fullname: fullname, email: email, password: password, role: role);
    final future = _signupUseCase.call(params: signupParam);
    signinFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value != null) {
        String message = value.toString();
        final response = jsonDecode(message);
        this.signupMessage = response["result"]["message"].toString();
        this.signupSuccess = true;
      }
    }).catchError((e) {
      String message = e.response.toString();
      final response = jsonDecode(message);
      this.signupSuccess = false;
      this.signupMessage = response["errorDetails"].first.toString();
    });
  }

  @action
  Future forgot(String email) async {
    final ForgotParams signupParam = ForgotParams(email: email);
    final future = _forgotUseCase.call(params: signupParam);
    forgotFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value != null) {
        String message = value.toString();
        final response = jsonDecode(message);
        this.forgotMessage = response["result"]["message"].toString();
        this.forgotSuccess = true;
      }
    }).catchError((e) {
      print(e.response);
      String message = e.response.toString();
      final response = jsonDecode(message);
      this.forgotSuccess = false;
      this.forgotMessage = response["errorDetails"].toString();
    });
  }

  @action
  Future change(String oldPassword, String newPassword) async {
    final ChangeParams changeParam =
        ChangeParams(oldPassword: oldPassword, newPassword: newPassword);
    final future = _changeUseCase.call(params: changeParam);
    changeFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value != null) {
        this.changeMessage = "Changed Password successfully";
        this.changeSuccess = true;
      }
    }).catchError((e) {
      String message = e.response.toString();
      final response = jsonDecode(message);
      this.changeSuccess = false;
      this.changeMessage = response["errorDetails"].toString();
    });
  }

  @action
  Future getMe() async {
    final GetMeParam getMeParam = GetMeParam();
    final future = _getMeUseCase.call(params: getMeParam);
    getMeFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value != null) {
        final currentProfile = getIt<SharedPreferenceHelper>().currentProfile;
        if (currentProfile == null) {
          getIt<SharedPreferenceHelper>()
              .saveCurrentProfile(value.roles!.first);
        }
        this.user = value;
        this.getMeSuccess = true;
      }
    }).catchError((e) {
      this.getMeSuccess = false;
      print(e);
    });
  }

  @action
  Future createUpdateCompanyProfile(
      CreateUpdateCompanyProfileParams param) async {
    final future = _createCompanyProfileUseCase.call(params: param);
    createCompanyProfileFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value != null) {
        if (param.uid == null) {
          this.isCreateProfile = true;
          this.getMe();
        }
        this.user!.setCompanyProfile(value);
        this.apiResponseSuccess = true;
      }
    }).catchError((e) {
      String message = e.response.toString();
      final response = jsonDecode(message);
      this.apiResponseSuccess = false;
      this.apiResponseMessage = response["errorDetails"].toString();
    });
  }

  @action
  Future getAllTechStack() async {
    if (this.techstacks == null) {
      final prms = GetTechStackParams();
      final future = _getAllTechStackUseCase.call(params: prms);
      getAllTechStackFuture = ObservableFuture(future);
      await future.then((value) async {
        if (value != null) {
          print(value);
          this.techstacks = value;
          this.apiResponseSuccess = true;
        }
      }).catchError((e) {
        String message = e.response.toString();
        final response = jsonDecode(message);
        this.apiResponseSuccess = false;
        this.apiResponseMessage = response["errorDetails"].toString();
      });
    }
  }

  @action
  Future getAllSkillset() async {
    if (this.skillSets == null) {
      final prms = GetSkillSetParams();
      final future = _getAllSkillSetUseCase.call(params: prms);
      getAllTechStackFuture = ObservableFuture(future);
      await future.then((value) async {
        if (value != null) {
          print(value);
          this.skillSets = value;
          this.apiResponseSuccess = true;
        }
      }).catchError((e) {
        String message = e.response.toString();
        final response = jsonDecode(message);
        this.apiResponseSuccess = false;
        this.apiResponseMessage = response["errorDetails"].toString();
      });
    }
  }

  @action
  Future uploadResume(PlatformFile file) async {
    FormData? formData = null;
    if (file.path != null) {
      formData =
          FormData.fromMap({"file": await MultipartFile.fromFile(file.path!)});
    } else {
      if (file.bytes != null) {
        formData = FormData.fromMap({
          "file": await MultipartFile.fromBytes(file.bytes!,
              filename: file.name,
              contentType: MediaType('application', 'pdf')),
        });
      }
    }
    if (formData == null) {
      return;
    }
    final future = _uploadResumeUseCase.call(params: formData);
    uploadResumeFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value != null) {
        print(value);
        print("++++++++++++++++++++++++++");
      }
    }).catchError((e) {
      print(e.response);
      print("2---------------");
      String message = e.response.toString();
      final response = jsonDecode(message);
      this.apiResponseSuccess = false;
      this.apiResponseMessage = response["errorDetails"].toString();
    });
  }

  @action
  Future uploadTranscript(PlatformFile file) async {
    FormData? formData = null;
    if (file.path != null) {
      formData =
          FormData.fromMap({"file": await MultipartFile.fromFile(file.path!)});
    } else {
      if (file.bytes != null) {
        formData = FormData.fromMap({
          "file": await MultipartFile.fromBytes(file.bytes!,
              filename: file.name,
              contentType: MediaType('application', 'pdf')),
        });
      }
    }
    if (formData == null) {
      return;
    }
    final future = _uploadTranscriptUseCase.call(params: formData);
    uploadResumeFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value != null) {
        print(value);
        print("++++++++++++++++++++++++++");
      }
    }).catchError((e) {
      print(e.response);
      print("3---------------");
      String message = e.response.toString();
      final response = jsonDecode(message);
      this.apiResponseSuccess = false;
      this.apiResponseMessage = response["errorDetails"].toString();
    });
  }

  @action
  Future createLanguages(List<ProfileLanguage?> languages) async {
    List<LanguageParams> param = languages
        .where((element) => element != null)
        .map((e) =>
            LanguageParams(languageName: e!.languageName, level: e.level))
        .toList();

    final CreateLanguageParams params = CreateLanguageParams(languages: param);
    final future = _createLanguageUseCase.call(params: params);
    createLanguageFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value != null) {
        print(value);
        print("++++++++++++++++++++++++++");
      }
    }).catchError((e) {
      print(e.response);
      print("4---------------");
      String message = e.response.toString();
      final response = jsonDecode(message);
      this.apiResponseSuccess = false;
      this.apiResponseMessage = response["errorDetails"].toString();
    });
  }

  @action
  Future createEducations(List<Education?> educations) async {
    List<EducationParam> param = educations
        .where((element) => element != null)
        .map((e) => EducationParam(
            schoolName: e!.schoolName,
            startYear: e.startYear,
            endYear: e.endYear))
        .toList();

    final CreateEducationsParams params =
        CreateEducationsParams(education: param);

    final future = _createEducationUseCase.call(params: params);
    createEducationFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value != null) {
        print(value);
        print("++++++++++++++++++++++++++");
      }
    }).catchError((e) {
      print(e.response);
      print("5---------------");
      String message = e.response.toString();
      final response = jsonDecode(message);
      this.apiResponseSuccess = false;
      this.apiResponseMessage = response["errorDetails"].toString();
    });
  }

  @action
  Future createExperiences(List<Experience?> experiences) async {
    List<ExperienceParam> param = experiences
        .where((element) => element != null)
        .map((e) => ExperienceParam(
            title: e!.title,
            startMonth: e.startMonth,
            endMonth: e.endMonth,
            description: e.description,
            skillSets: e.skillSets.map((e) => e.id).toList()))
        .toList();

    final CreateExperiencesParams params =
        CreateExperiencesParams(experience: param);

    final future = _createExperiencesUseCase.call(params: params);
    createExperienceFuture = ObservableFuture(future);

    await future.then((value) async {
      if (value != null) {
        print(value);
        print("++++++++++++++++++++++++++");
      }
    }).catchError((e) {
      print(e.response);
      print("6---------------");
      String message = e.response.toString();
      final response = jsonDecode(message);
      this.apiResponseSuccess = false;
      this.apiResponseMessage = response["errorDetails"].toString();
    });
  }

  @action
  Future createUpdateStudentProfile(
      CreateUpdateStudentProfileParams param) async {
    final future = _createStudentProfileUseCase.call(params: param);
    createStudentProfileFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value != null) {
        if (param.uid == null) {
          this.user!.setStudentProfile(value);
        } else {}
        this.apiResponseSuccess = true;
      }
    }).catchError((e) {
      print("1---------------");
      print(e);
      String message = e.response.toString();
      final response = jsonDecode(message);
      this.apiResponseSuccess = false;
      this.apiResponseMessage = response["errorDetails"].toString();
    });
  }

  @action
  Future bulkCreateUpdateStudentProfile(
      FormStudent.FormStudentProfileStore formStore) async {
    int? studentId = null;
    if (this.user!.student != null) {
      studentId = this.user!.student!.id;
    }
    final CreateUpdateStudentProfileParams prms =
        CreateUpdateStudentProfileParams(
            uid: studentId,
            techStackId: formStore.techStackId,
            skillSets: formStore.skillSets);

    if (studentId != null) {
      await Future.wait([
        this.createUpdateStudentProfile(prms),
        this.createLanguages(formStore.languages),
        this.createEducations(formStore.educations),
        this.createExperiences(formStore.experiences),
        this.uploadResume(formStore.resume!),
        this.uploadTranscript(formStore.transcript!),
      ]).then((value) {
        print(value);
        print("++++++++++++++++++++++++");
      }).catchError((e) {
        print(e);
      });
    } else {
      this.isCreateProfile = true;

      await Future.wait([
        this.createUpdateStudentProfile(prms),
      ]).then((value) async {
        await Future.wait([
          this.createLanguages(formStore.languages),
          this.createEducations(formStore.educations),
          this.createExperiences(formStore.experiences),
          this.uploadResume(formStore.resume!),
          this.uploadTranscript(formStore.transcript!),
        ]);

        this.onFinishStudentProfile = true;
      }).catchError((e) {
        print(e);
      });
    }
  }

  @action
  Future getTranscriptFile() async {
    if (this.transcriptFile.isEmpty) {
      GetProfileFileParams param = GetProfileFileParams(
          studentId: this.user!.student!.id!, type: "transcript");
      final future = _getProfileFileUseCase.call(params: param);
      apiCallingFeature = ObservableFuture(future);
      await future.then((value) async {
        if (value != null) {
          this.transcriptFile = value;
          this.apiResponseSuccess = true;
        }
      }).catchError((e) {
        print("---------------");
        print(e);
        String message = e.response.toString();
        final response = jsonDecode(message);
        this.apiResponseSuccess = false;
        this.apiResponseMessage = response["errorDetails"].toString();
      });
    }
  }

  @action
  Future getResumeFile() async {
    if (this.resumeFile.isEmpty) {
      GetProfileFileParams param = GetProfileFileParams(
          studentId: this.user!.student!.id!, type: "resume");
      final future = _getProfileFileUseCase.call(params: param);
      apiCallingFeature = ObservableFuture(future);
      await future.then((value) async {
        if (value != null) {
          this.resumeFile = value;
          this.apiResponseSuccess = true;
        }
      }).catchError((e) {
        print("---------------");
        print(e);
        String message = e.response.toString();
        final response = jsonDecode(message);
        this.apiResponseSuccess = false;
        this.apiResponseMessage = response["errorDetails"].toString();
      });
    }
  }

  // [PHONG] -----------------------------------------------------------
  @action
  Future getTranscriptFileByStudentId(int studentId) async {
    // if (this.transcriptFile.isEmpty) {
    GetProfileFileParams param =
        GetProfileFileParams(studentId: studentId, type: "transcript");
    final future = _getProfileFileUseCase.call(params: param);
    apiCallingFeature = ObservableFuture(future);
    await future.then((value) async {
      if (value != null) {
        this.studentTranscriptFile = value;
        this.apiResponseSuccess = true;
      }
    }).catchError((e) {
      print("---------------");
      print(e);
      String message = e.response.toString();
      final response = jsonDecode(message);
      this.apiResponseSuccess = false;
      this.apiResponseMessage = response["errorDetails"].toString();
    });
    // }
  }

  @action
  Future getResumeFileByStudentId(int studentId) async {
    // if (this.resumeFile.isEmpty) {
    GetProfileFileParams param =
        GetProfileFileParams(studentId: studentId, type: "resume");
    final future = _getProfileFileUseCase.call(params: param);
    apiCallingFeature = ObservableFuture(future);
    await future.then((value) async {
      if (value != null) {
        this.studentResumeFile = value;
        this.apiResponseSuccess = true;
      }
    }).catchError((e) {
      print("---------------");
      print(e);
      String message = e.response.toString();
      final response = jsonDecode(message);
      this.apiResponseSuccess = false;
      this.apiResponseMessage = response["errorDetails"].toString();
    });
    // }
  }

  // ----------------------------------------------------------------------------

  @action
  Future submitProposal(int projectId, String coverLetter) async {
    SubmitProposalParams param = SubmitProposalParams(
        studentId: this.user!.student!.id!,
        projectId: projectId,
        coverLetter: coverLetter);
    final future = _submitProposalUseCase.call(params: param);
    apiCallingFeature = ObservableFuture(future);
    await future.then((value) async {
      if (value != null) {
        final projectStore = getIt<ProjectStore>();
        final GetSubmitProposalParams prms =
            GetSubmitProposalParams(studentId: this.user!.student!.id!);
        projectStore.getSubmitProposal(prms);
        this.apiResponseSuccess = true;
      }
    }).catchError((e) {
      print("---------------");
      print(e);
      String message = e.response.toString();
      final response = jsonDecode(message);
      this.apiResponseSuccess = false;
      this.apiResponseMessage = response["errorDetails"].toString();
    });
  }

  // [PHONG] ---------------------------------------------------------------
  // @action
  // Future getStudentProfile(int student_id) async {
  //   final GetStudentProfileParams getStudentProfileParams =
  //       GetStudentProfileParams(studentId: student_id);
  //   final future =
  //       _getStudentProfileUseCase.call(params: getStudentProfileParams);
  //   apiStudentProfileResponse = ObservableFuture(future);

  //   await future.then((value) async {
  //     if (value != null) {
  //       // print("============================");
  //       // print(value);
  //       // resetProfileStudent();
  //       this.profileStudent = value;
  //       apiStudentResponseSuccess = true;
  //       // print(value.toMap());
  //     }
  //   }).catchError((e) {
  //     this.profileStudent = null;
  //     this.apiStudentResponseSuccess = false;
  //     print(e);
  //   });

  //   return null;
  // }

  // Future<dynamic> updateProposal(UpdateProposalParam params) async {
  //   final future = _updateProposalUseCase.call(params: params);
  //   apiUpdateProfile = ObservableFuture(future);
  // }

  Future<dynamic> updateProposalById(
      int proposalId, UpdateProposalParam params) async {
    final projectStore = getIt<ProjectStore>();

    final future = _updateProposalUseCase.updateProposalById(
        proposalId: proposalId, params: params);
    apiCallingFeature = ObservableFuture(future);
    await future.then((value) {
      if (projectStore.projectList != null) {
        final assignProjects = projectStore.projectList!.projects!.map((pj) {
          if (pj.id == params.projectId) {
            final newProposal = pj.proposals.map((proposal) {
              if (proposal.id == proposalId) {
                proposal.statusFlag = params.statusFlag;
              }
              return proposal;
            }).toList();

            pj.proposals = newProposal;
          }
          return pj;
        }).toList();
        projectStore.setProjectList(ProjectList(projects: assignProjects));
      }
      this.apiResponseSuccess = true;
      this.apiResponseMessage = params.statusFlag == ProposalType.OFFER.value
          ? "Offer message has been sent to student"
          : params.statusFlag == ProposalType.HIRED.value
              ? "Congratulations, you have joined to the project"
              : "Update successfully";
    }).catchError((e) {
      this.apiStudentResponseSuccess = false;
      this.apiResponseMessage = "Error";
      print(e);
    });
  }

  // ----------------------------------------------------------------------------

  @action
  void setCurrentChat(int? projectId, int? userId) {
    this.currentChatProjectId = projectId;
    this.currentChatUserId = userId;
  }

  dynamic messageHandler(data) {
    try {
      final senderId = data["notification"]["senderId"];
      if (senderId != this.user!.id) {
        final newChat = ChatEntity(
            id: data["notification"]["messageId"],
            createdAt: DateTime.now(),
            content: data["notification"]["message"]["content"],
            sender: ChatUser(id: data["notification"]["senderId"], fullname: ""),
            receiver:
                ChatUser(id: this.user!.id!, fullname: this.user!.fullname!));
        this.addCurrentChat(newChat);
      }
    } catch (e) {
      print("SOCKET ERROR ${e}");
    }
  }

  dynamic interviewHandler(data) {
    this.getCurrentChat(loading: false);
  }

  @action
  Future getCurrentChat({bool loading = true}) async {
    if (this.currentChatProjectId != null && this.currentChatUserId != null) {
      getIt<SharedPreferenceHelper>().authToken.then((value) {
        if (value != null) {
          final socket = SocketService.socket;
          if (socket?.io.options?['query'] == null) {
            SocketService.connectWithQuery(this.currentChatProjectId!, value);
          }
          if (socket != null) {
            socket.off('RECEIVE_MESSAGE', messageHandler);
            socket.off('RECEIVE_INTERVIEW', interviewHandler);
            socket.on('RECEIVE_MESSAGE', messageHandler);
            socket.on('RECEIVE_INTERVIEW', interviewHandler);
          }
        }
      });

      final future = _getAllChatWithUserInProjectUseCase.call(
          params: ProjectUserIdParam(
              projectId: this.currentChatProjectId!,
              userId: this.currentChatUserId!));
      if (loading) {
        apiCallingFeature = ObservableFuture(future);
      }
      await future.then((value) async {
        this.currentChat = value;
        this.apiResponseSuccess = true;
      }).catchError((e) {
        print("---------------");
        print(e);
        String message = e.response.toString();
        final response = jsonDecode(message);
        this.apiResponseSuccess = false;
        this.apiResponseMessage = response["errorDetails"].toString();
      });
    } else {
      this.currentChat = [];
      final socket = SocketService.socket;
      if (socket != null) {
        socket.off("RECEIVE_MESSAGE", messageHandler);
        socket.off('RECEIVE_INTERVIEW', interviewHandler);
      }
    }
  }

  dynamic messageProjectHandler(data) {
    this.getChatListByProjectId(loading: false);
  }

  @action
  Future getChatListByProjectId({bool loading = true}) async {
    if (this.currentChatProjectId != null) {
      if (loading) {
        getIt<SharedPreferenceHelper>().authToken.then((value) {
          if (value != null) {
            SocketService.connectWithQuery(this.currentChatProjectId!, value);
            final socket = SocketService.socket;
            if (socket != null) {
              socket.on('RECEIVE_MESSAGE', messageProjectHandler);
              socket.on('RECEIVE_INTERVIEW', messageProjectHandler);
            }
          }
        });
      }

      final future = _getAllChatByProjectUseCase.call(
          params: ProjectIdParam(projectId: this.currentChatProjectId!));
      if (loading) {
        apiCallingFeature = ObservableFuture(future);
      }
      await future.then((value) async {
        this.chatList = value;
      }).catchError((e) {
        print("---------------");
        print(e);
        String message = e.response.toString();
        final response = jsonDecode(message);
        this.apiResponseSuccess = false;
        this.apiResponseMessage = response["errorDetails"].toString();
      });
    } else {
      this.chatList = [];
      final socket = SocketService.socket;
      if (socket != null) {
        socket.off("RECEIVE_MESSAGE", messageProjectHandler);
        socket.off("RECEIVE_INTERVIEW", messageProjectHandler);
      }
    }
  }

  @action
  Future getAllChatList({bool loading = true}) async {
    final future = _getAllChatUseCase.call(params: null);
    if (loading) {
      apiCallingFeature = ObservableFuture(future);
    }
    await future.then((value) async {
      this.allChatList = value;
    }).catchError((e) {
      print("---------------");
      print(e);
      String message = e.response.toString();
      final response = jsonDecode(message);
      this.apiResponseSuccess = false;
      this.apiResponseMessage = response["errorDetails"].toString();
    });
  }

  @action
  void addCurrentChat(ChatEntity chat) {
    final newChat = List.of(this.currentChat);
    newChat.add(chat);
    this.currentChat = newChat;
  }

  logout() async {
    final projectStore = getIt<ProjectStore>();

    this.user = null;
    this.allChatList = null;
    this.transcriptFile = "";
    this.resumeFile = "";
    this.isLoggedIn = false;
    projectStore.projectList = null;
    projectStore.allProjectList = null;

    await _saveLoginStatusUseCase.call(params: false);
    getIt<SharedPreferenceHelper>().removeAuthToken();
    getIt<SharedPreferenceHelper>().removeCurrentProfile();
    if (SocketService.socket != null) {
      SocketService.socket!.dispose();
    }
  }

  resetSigninState() {
    this.signupSuccess = null;
    this.signupMessage = "";
  }

  resetForgotPasswordState() {
    this.forgotSuccess = null;
    this.forgotMessage = "";
  }

  resetchangeState() {
    this.changeMessage = "";
    this.changeSuccess = null;
  }

  resetLoginState() {
    this.siginMessage = "";
    this.success = null;
  }

  resetGetMeSuccessState() {
    this.getMeSuccess = null;
  }

  resetApiResponse() {
    this.apiResponseMessage = "";
    this.apiResponseSuccess = null;
  }

  resetFinishProfile() {
    this.onFinishStudentProfile = null;
  }

  resetCreateProfileState() {
    this.isCreateProfile = null;
  }

  resetProfileStudent() {
    this.profileStudent = null;
    this.apiStudentResponseSuccess = null;
  }

  resetStudentFile() {
    this.studentResumeFile = '';
    this.studentTranscriptFile = '';
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
