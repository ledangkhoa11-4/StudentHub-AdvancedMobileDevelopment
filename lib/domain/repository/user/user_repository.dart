import 'dart:async';

import 'package:boilerplate/domain/entity/chat/chat.dart';
import 'package:boilerplate/domain/entity/notification/notification.dart';
import 'package:boilerplate/domain/entity/user/profile_company.dart';
import 'package:boilerplate/domain/usecase/user/change_usecase.dart';
import 'package:boilerplate/domain/entity/user/profile_student.dart';
import 'package:boilerplate/domain/entity/user/skillset.dart';
import 'package:boilerplate/domain/entity/user/tech_stack.dart';
import 'package:boilerplate/domain/usecase/user/check_room_available_usercase.dart';
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
import 'package:boilerplate/domain/usecase/user/login_usecase.dart';
import 'package:boilerplate/domain/usecase/user/signup_usecase.dart';
import 'package:boilerplate/domain/usecase/user/forgot_usecase.dart';
import 'package:boilerplate/domain/usecase/user/submit_proposal_usecase.dart';
import 'package:boilerplate/domain/usecase/user/update_proposal_usecase.dart';
import 'package:dio/dio.dart';

import '../../entity/user/user.dart';
import '../../usecase/user/get_student_profile_usecase.dart';

abstract class UserRepository {
  Future<dynamic> login(LoginParams params);

  Future<dynamic> signup(SignupParam params);

  Future<dynamic> forgot(ForgotParams params);

  Future<dynamic> change(ChangeParams params);

  Future<User?> getMe(GetMeParam params);

  Future<void> saveIsLoggedIn(bool value);

  Future<void> saveAuthToken(String value);

  Future<void> saveCurrentProfile(int value);

  Future<List<TechStack>?> getTechstack(GetTechStackParams params);

  Future<List<Skillset>?> getSkillSet(GetSkillSetParams params);

  Future<ProfileCompany?> createUpdateCompanyProfile(
      CreateUpdateCompanyProfileParams params);

  Future<ProfileStudent?> createUpdateStudentProfile(
      CreateUpdateStudentProfileParams params);

  Future<dynamic> uploadResume(FormData params);

  Future<dynamic> uploadTranscript(FormData params);

  Future<dynamic> createLanguages(CreateLanguageParams params);

  Future<dynamic> createEducations(CreateEducationsParams params);

  Future<dynamic> createExperiences(CreateExperiencesParams params);

  Future<String?> getProfileFile(GetProfileFileParams params);

  Future<dynamic> submitProposal(SubmitProposalParams params);

  Future<bool> get isLoggedIn;

  Future<ProfileStudent> getStudentProfile(GetStudentProfileParams params);

  Future<dynamic> updateProposal(UpdateProposalParam params);

  Future<dynamic> updateProposalById(
      int proposalId, UpdateProposalParam params);

  Future<List<ChatEntity>> getAllChatByProjectId(ProjectIdParam params);
  Future<List<ChatEntity>> getAllWithUserIdChatByProjectId(
      ProjectUserIdParam params);

  Future<List<ChatEntity>> getAllChat();

  Future<bool> checkRoomAvailability(CheckRoomAvailabilityParams params);

  Future<List<AppNotification>> getAllNotification();

}
