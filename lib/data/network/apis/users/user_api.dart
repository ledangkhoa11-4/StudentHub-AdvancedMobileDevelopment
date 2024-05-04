import 'dart:async';
import 'dart:convert';

import 'package:boilerplate/core/data/network/dio/dio_client.dart';
import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/data/network/rest_client.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/chat/chat.dart';
import 'package:boilerplate/domain/entity/user/profile_company.dart';
import 'package:boilerplate/domain/entity/user/profile_student.dart';
import 'package:boilerplate/domain/entity/user/skillset.dart';
import 'package:boilerplate/domain/entity/user/tech_stack.dart';
import 'package:boilerplate/domain/entity/user/user.dart';
import 'package:boilerplate/domain/usecase/user/check_room_available_usercase.dart';
import 'package:boilerplate/domain/usecase/user/create_educatuon_usecase.dart';
import 'package:boilerplate/domain/usecase/user/create_experience_usecase.dart';
import 'package:boilerplate/domain/usecase/user/create_language_usecase.dart';
import 'package:boilerplate/domain/usecase/user/create_update_company_profile_usercase.dart';
import 'package:boilerplate/domain/usecase/user/create_update_student_profile_usercase.dart';
import 'package:boilerplate/domain/usecase/user/forgot_usecase.dart';
import 'package:boilerplate/domain/usecase/user/change_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_all_chat_by_projectid_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_all_chat_with_userId_in_projectid_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_me_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_profile_file_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_skillset_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_student_profile_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_techstack_usecase.dart';
import 'package:boilerplate/domain/usecase/user/login_usecase.dart';
import 'package:boilerplate/domain/usecase/user/signup_usecase.dart';
import 'package:boilerplate/domain/usecase/user/submit_proposal_usecase.dart';
import 'package:boilerplate/domain/usecase/user/update_proposal_usecase.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:dio/dio.dart';

class UserApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  UserApi(this._dioClient, this._restClient);

  /// Returns list of post in response
  Future<dynamic> signup(SignupParam param) async {
    try {
      final res = await _dioClient.dio.post(Endpoints.signup, data: param);
      return res;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<dynamic> login(LoginParams param) async {
    try {
      final res = await _dioClient.dio.post(Endpoints.signin, data: param);
      return res;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<dynamic> forgot(ForgotParams param) async {
    try {
      final res = await _dioClient.dio.post(Endpoints.forgot, data: param);
      return res;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<dynamic> change(ChangeParams param) async {
    try {
      final res = await _dioClient.dio.put(Endpoints.change, data: param);
      return res;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<User?> getMe(GetMeParam param) async {
    try {
      final res = await _dioClient.dio.get(Endpoints.getMe);
      final result = jsonDecode(res.toString());
      return User.fromMap(result["result"]);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<ProfileCompany?> createCompanyProfile(
      CreateUpdateCompanyProfileParams param) async {
    try {
      final res = await _dioClient.dio
          .post(Endpoints.createCompanyProfile, data: param);
      final result = jsonDecode(res.toString());
      return ProfileCompany.fromMap(result["result"]);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<ProfileCompany?> updateCompanyProfile(
      CreateUpdateCompanyProfileParams param) async {
    try {
      final res = await _dioClient.dio
          .put(Endpoints.createCompanyProfile + "/${param.uid}", data: param);
      final result = jsonDecode(res.toString());
      return ProfileCompany.fromMap(result["result"]);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<List<TechStack>?> getTechstack(GetTechStackParams param) async {
    try {
      final res = await _dioClient.dio.get(Endpoints.getAllTechstack);
      final result = jsonDecode(res.toString());
      List<dynamic> techStackObj = result["result"];
      return techStackObj
          .map((techstack) => TechStack.fromJson(techstack))
          .toList();
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<List<Skillset>?> getSkillset(GetSkillSetParams param) async {
    try {
      final res = await _dioClient.dio.get(Endpoints.getAllSkillset);
      final result = jsonDecode(res.toString());
      List<dynamic> techStackObj = result["result"];
      return techStackObj
          .map((techstack) => Skillset.fromJson(techstack))
          .toList();
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<dynamic> uploadResume(FormData param) async {
    try {
      final UserStore _userStore = getIt<UserStore>();
      if (_userStore.user == null || _userStore.user!.student == null) {
        print("-------------- Not have profile student -------------------");
        return;
      }

      final res = await _dioClient.dioMultipart.put(
          Endpoints.uploadResume
              .replaceFirst(":studentId", '${_userStore.user!.student!.id}'),
          data: param);
      return res;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<dynamic> uploadTranscript(FormData param) async {
    try {
      final UserStore _userStore = getIt<UserStore>();
      if (_userStore.user == null || _userStore.user!.student == null) {
        print("-------------- Not have profile student -------------------");
        return;
      }

      final res = await _dioClient.dioMultipart.put(
          Endpoints.uploadTranscript
              .replaceFirst(":studentId", '${_userStore.user!.student!.id}'),
          data: param);
      return res;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<dynamic> createLanguages(CreateLanguageParams param) async {
    try {
      final UserStore _userStore = getIt<UserStore>();
      if (_userStore.user == null || _userStore.user!.student == null) {
        print("-------------- Not have profile student -------------------");
        return;
      }

      final res = await _dioClient.dio.put(
          Endpoints.createLanguage
              .replaceFirst(":studentId", '${_userStore.user!.student!.id}'),
          data: param);
      return res;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<dynamic> createEducations(CreateEducationsParams param) async {
    try {
      final UserStore _userStore = getIt<UserStore>();
      if (_userStore.user == null || _userStore.user!.student == null) {
        print("-------------- Not have profile student -------------------");
        return;
      }

      final res = await _dioClient.dio.put(
          Endpoints.createEducation
              .replaceFirst(":studentId", '${_userStore.user!.student!.id}'),
          data: param);
      return res;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<dynamic> createExperiences(CreateExperiencesParams param) async {
    try {
      final UserStore _userStore = getIt<UserStore>();
      if (_userStore.user == null || _userStore.user!.student == null) {
        print("-------------- Not have profile student -------------------");
        return;
      }

      final res = await _dioClient.dio.put(
          Endpoints.createExperience
              .replaceFirst(":studentId", '${_userStore.user!.student!.id}'),
          data: param);
      return res;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<ProfileStudent?> createStudentProfile(
      CreateUpdateStudentProfileParams param) async {
    try {
      final res = await _dioClient.dio
          .post(Endpoints.createStudentProfile, data: param);
      final result = jsonDecode(res.toString());
      return ProfileStudent.fromMap(result["result"]);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<ProfileStudent?> updateStudentProfile(
      CreateUpdateStudentProfileParams param) async {
    try {
      final res = await _dioClient.dio
          .put(Endpoints.createStudentProfile + "/${param.uid}", data: param);
      final result = jsonDecode(res.toString());
      return ProfileStudent.fromMap(result["result"]);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<String?> getResumeFile(GetProfileFileParams param) async {
    try {
      if (param.type == "resume") {
        final res = await _dioClient.dio.get(
            Endpoints.getResumeFile
                .replaceFirst(":studentId", '${param.studentId}'),
            data: param);
        final result = jsonDecode(res.toString());
        return result["result"];
      }

      if (param.type == "transcript") {
        final res = await _dioClient.dio.get(
            Endpoints.getTranscriptFile
                .replaceFirst(":studentId", '${param.studentId}'),
            data: param);
        final result = jsonDecode(res.toString());
        return result["result"];
      }

      return null;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<dynamic> submitProposal(SubmitProposalParams param) async {
    try {
      final res =
          await _dioClient.dio.post(Endpoints.submitProposal, data: param);
      return res;
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<ProfileStudent> getProfileStudent(
      GetStudentProfileParams param) async {
    try {
      final res = await _dioClient.dio.get(
          Endpoints.getStudentProfile
              .replaceFirst(":studentId", param.studentId.toString()),
          data: param);

      final result = jsonDecode(res.toString());
      return ProfileStudent.fromMap(result["result"]);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<dynamic> updateProposal(UpdateProposalParam param) async {
    // try {
    //   final res = await _dioClient.dio.patch(
    //       Endpoints.updateProposal
    //           .replaceFirst(":proposalId", param.proposalId.toString()),
    //       data: param);

    //   final result = jsonDecode(res.toString());
    //   print("222222222222222222222222222222222");
    //   print(result);
    //   // return ProfileStudent.fromMap(result["result"]);
    // } catch (e) {
    //   print("updateProposal api ---------------------------");
    //   print(e.toString());
    //   throw e;
    // }
  }

  Future<dynamic> updateProposalById(
      int proposalId, UpdateProposalParam param) async {
    try {
      final res = await _dioClient.dio.patch(
          Endpoints.updateProposal
              .replaceFirst(":proposalId", proposalId.toString()),
          data: param);
      return res;
      //final result = jsonDecode(res.toString());
      // print("222222222222222222222222222222222");
      // print(result);
      // return ProfileStudent.fromMap(result["result"]);
    } catch (e) {
      print("updateProposal api ---------------------------");
      print(e.toString());
      throw e;
    }
  }

  Future<List<ChatEntity>> getAllChatByProjectId(ProjectIdParam param) async {
    try {
      final res = await _dioClient.dio.get(Endpoints.getAllChatByProjectId
          .replaceFirst(":projectId", "${param.projectId}"));
           final result = jsonDecode(res.toString());
      List<dynamic> chatObj = result["result"];
      return chatObj
          .map((chat) => ChatEntity.fromMap(chat))
          .toList();
    } catch (e) {
      print("---------------------------");
      print(e.toString());
      throw e;
    }
  }

  Future<List<ChatEntity>> getAllChatWithUserInProject(ProjectUserIdParam param) async {
    try {
      final res = await _dioClient.dio.get(Endpoints.getAllChatWithUserInProject
          .replaceFirst(":projectId", "${param.projectId}").replaceFirst(":userId", "${param.userId}"));
           final result = jsonDecode(res.toString());
      List<dynamic> chatObj = result["result"];
      return chatObj
          .map((chat) => ChatEntity.fromMap(chat))
          .toList();
    } catch (e) {
      print("---------------------------");
      print(e.toString());
      throw e;
    }
  }

   Future<List<ChatEntity>> getAllChat() async {
    try {
      final res = await _dioClient.dio.get(Endpoints.getAllChat);
           final result = jsonDecode(res.toString());
      List<dynamic> chatObj = result["result"];
      return chatObj
          .map((chat) => ChatEntity.fromMap(chat))
          .toList();
    } catch (e) {
      print("---------------------------");
      print(e.toString());
      throw e;
    }
  }

  Future<bool> checkRoomAvailability(CheckRoomAvailabilityParams params) async {
    try {
      var query = "?&meeting_room_code=${params.meeting_room_code}&meeting_room_id=${params.meeting_room_id}";
      final res = await _dioClient.dio.get(Endpoints.checkRoomAvailability + query);
           final result = jsonDecode(res.toString());
      return result["result"] as bool;
    } catch (e) {
      print("---------------------------");
      print(e.toString());
      throw e;
    }
  }
  
}
