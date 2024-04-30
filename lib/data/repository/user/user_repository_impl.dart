import 'dart:async';

import 'package:boilerplate/data/network/apis/users/user_api.dart';
import 'package:boilerplate/domain/entity/chat/chat.dart';
import 'package:boilerplate/domain/entity/user/profile_company.dart';
import 'package:boilerplate/domain/entity/user/profile_student.dart';
import 'package:boilerplate/domain/entity/user/skillset.dart';
import 'package:boilerplate/domain/entity/user/tech_stack.dart';
import 'package:boilerplate/domain/repository/user/user_repository.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:boilerplate/domain/usecase/user/change_usecase.dart';
import 'package:boilerplate/domain/usecase/user/create_educatuon_usecase.dart';
import 'package:boilerplate/domain/usecase/user/create_experience_usecase.dart';
import 'package:boilerplate/domain/usecase/user/create_language_usecase.dart';
import 'package:boilerplate/domain/usecase/user/create_update_company_profile_usercase.dart';
import 'package:boilerplate/domain/usecase/user/create_update_student_profile_usercase.dart';
import 'package:boilerplate/domain/usecase/user/get_all_chat_by_projectid_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_all_chat_with_userId_in_projectid_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_me_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_profile_file_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_skillset_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_techstack_usecase.dart';
import 'package:boilerplate/domain/usecase/user/signup_usecase.dart';
import 'package:boilerplate/domain/usecase/user/forgot_usecase.dart';
import 'package:boilerplate/domain/usecase/user/submit_proposal_usecase.dart';
import 'package:boilerplate/domain/usecase/user/update_proposal_usecase.dart';
import 'package:dio/dio.dart';

import '../../../domain/entity/user/user.dart';
import '../../../domain/usecase/user/get_student_profile_usecase.dart';
import '../../../domain/usecase/user/login_usecase.dart';

class UserRepositoryImpl extends UserRepository {
  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;
  final UserApi _userApi;

  // constructor
  UserRepositoryImpl(this._sharedPrefsHelper, this._userApi);

  // Login:---------------------------------------------------------------------
  @override
  Future<dynamic> login(LoginParams params) async {
    return await _userApi.login(params).then((res) {
      return res;
    }).catchError((error) => throw error);
  }

  @override
  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  @override
  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;

  @override
  Future<dynamic> signup(SignupParam params) async {
    return await _userApi.signup(params).then((res) {
      return res;
    }).catchError((error) => throw error);
  }

  @override
  Future<dynamic> forgot(ForgotParams params) async {
    return await _userApi.forgot(params).then((res) {
      return res;
    }).catchError((error) => throw error);
  }

  @override
  Future<dynamic> change(ChangeParams params) async {
    return await _userApi.change(params).then((res) {
      return res;
    }).catchError((error) => throw error);
  }

  @override
  Future<void> saveAuthToken(String value) =>
      _sharedPrefsHelper.saveAuthToken(value);

  @override
  Future<User?> getMe(GetMeParam params) async {
    return await _userApi.getMe(params).then((res) {
      return res;
    }).catchError((error) => throw error);
  }

  @override
  Future<void> saveCurrentProfile(int value) =>
      _sharedPrefsHelper.saveCurrentProfile(value);

  @override
  Future<ProfileCompany?> createUpdateCompanyProfile(
      CreateUpdateCompanyProfileParams params) async {
    if (params.uid != null) {
      return await _userApi.updateCompanyProfile(params).then((res) {
        return res;
      }).catchError((error) => throw error);
    } else {
      return await _userApi.createCompanyProfile(params).then((res) {
        return res;
      }).catchError((error) => throw error);
    }
  }

  @override
  Future<List<TechStack>?> getTechstack(GetTechStackParams params) async {
    return await _userApi.getTechstack(params).then((res) {
      return res;
    }).catchError((error) => throw error);
  }

  @override
  Future<List<Skillset>?> getSkillSet(GetSkillSetParams params) async {
    return await _userApi.getSkillset(params).then((res) {
      return res;
    }).catchError((error) => throw error);
  }

  @override
  Future<dynamic> uploadResume(FormData params) async {
    return await _userApi.uploadResume(params).then((res) {
      return res;
    }).catchError((error) => throw error);
  }

  @override
  Future<dynamic> uploadTranscript(FormData params) async {
    return await _userApi.uploadTranscript(params).then((res) {
      return res;
    }).catchError((error) => throw error);
  }

  @override
  Future<dynamic> createLanguages(CreateLanguageParams params) async {
    return await _userApi.createLanguages(params).then((res) {
      return res;
    }).catchError((error) => throw error);
  }

  @override
  Future<dynamic> createEducations(CreateEducationsParams params) async {
    return await _userApi.createEducations(params).then((res) {
      return res;
    }).catchError((error) => throw error);
  }

  @override
  Future<dynamic> createExperiences(CreateExperiencesParams params) async {
    return await _userApi.createExperiences(params).then((res) {
      return res;
    }).catchError((error) => throw error);
  }

  @override
  Future<ProfileStudent?> createUpdateStudentProfile(
      CreateUpdateStudentProfileParams params) async {
    if (params.uid != null) {
      return await _userApi.updateStudentProfile(params).then((res) {
        return res;
      }).catchError((error) => throw error);
    } else {
      return await _userApi.createStudentProfile(params).then((res) {
        return res;
      }).catchError((error) => throw error);
    }
  }

  @override
  Future<String?> getProfileFile(GetProfileFileParams params) async {
    return await _userApi.getResumeFile(params).then((res) {
      return res;
    }).catchError((error) => throw error);
  }

  @override
  Future<dynamic> submitProposal(SubmitProposalParams params) async {
    return await _userApi.submitProposal(params).then((res) {
      return res;
    }).catchError((error) => throw error);
  }

  @override
  Future<ProfileStudent> getStudentProfile(
      GetStudentProfileParams params) async {
    return await _userApi.getProfileStudent(params).then((res) {
      return res;
    }).catchError((error) => throw error);
  }

  @override
  Future<dynamic> updateProposal(UpdateProposalParam params) async {
    return await _userApi.updateProposal(params).then((res) {
      return res;
    }).catchError((error) => throw error);
  }

  @override
  Future<dynamic> updateProposalById(
      int proposalId, UpdateProposalParam params) async {
    return await _userApi.updateProposalById(proposalId, params).then((res) {
      return res;
    }).catchError((error) => throw error);
  }

  @override
  Future<List<ChatEntity>> getAllChat() async {
    return await _userApi.getAllChat().then((res) {
      return res;
    }).catchError((error) => throw error);
  }

  @override
  Future<List<ChatEntity>> getAllChatByProjectId(ProjectIdParam params) async {
    return await _userApi.getAllChatByProjectId(params).then((res) {
      return res;
    }).catchError((error) => throw error);
  }

  @override
  Future<List<ChatEntity>> getAllWithUserIdChatByProjectId(
      ProjectUserIdParam params) async {
    return await _userApi.getAllChatWithUserInProject(params).then((res) {
      return res;
    }).catchError((error) => throw error);
  }
}
