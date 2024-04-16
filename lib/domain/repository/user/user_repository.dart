import 'dart:async';

import 'package:boilerplate/domain/entity/user/profile_company.dart';
import 'package:boilerplate/domain/entity/user/profile_student.dart';
import 'package:boilerplate/domain/entity/user/skillset.dart';
import 'package:boilerplate/domain/entity/user/tech_stack.dart';
import 'package:boilerplate/domain/usecase/user/create_educatuon_usecase.dart';
import 'package:boilerplate/domain/usecase/user/create_experience_usecase.dart';
import 'package:boilerplate/domain/usecase/user/create_language_usecase.dart';
import 'package:boilerplate/domain/usecase/user/create_update_company_profile_usercase.dart';
import 'package:boilerplate/domain/usecase/user/create_update_student_profile_usercase.dart';
import 'package:boilerplate/domain/usecase/user/get_me_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_skillset_usecase.dart';
import 'package:boilerplate/domain/usecase/user/get_techstack_usecase.dart';
import 'package:boilerplate/domain/usecase/user/login_usecase.dart';
import 'package:boilerplate/domain/usecase/user/signup_usecase.dart';
import 'package:dio/dio.dart';

import '../../entity/user/user.dart';

abstract class UserRepository {
  Future<dynamic> login(LoginParams params);

  Future<dynamic> signup(SignupParam params);

  Future<User?> getMe(GetMeParam params);

  Future<void> saveIsLoggedIn(bool value);

  Future<void> saveAuthToken(String value);

  Future<void> saveCurrentProfile(int value);

  Future<List<TechStack>?> getTechstack(GetTechStackParams params);

  Future<List<Skillset>?> getSkillSet(GetSkillSetParams params);

  Future<ProfileCompany?> createUpdateCompanyProfile(CreateUpdateCompanyProfileParams params);

  Future<ProfileStudent?> createUpdateStudentProfile(CreateUpdateStudentProfileParams params);

  Future<dynamic> uploadResume(FormData params);

  Future<dynamic> uploadTranscript(FormData params);

  Future<dynamic> createLanguages(CreateLanguageParams params);

  Future<dynamic> createEducations(CreateEducationsParams params);

  Future<dynamic> createExperiences(CreateExperiencesParams params);

  Future<bool> get isLoggedIn;
}
