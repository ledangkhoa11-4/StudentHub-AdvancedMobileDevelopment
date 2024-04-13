import 'dart:async';
import 'dart:convert';

import 'package:boilerplate/core/data/network/dio/dio_client.dart';
import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/data/network/rest_client.dart';
import 'package:boilerplate/domain/entity/user/profile_company.dart';
import 'package:boilerplate/domain/entity/user/user.dart';
import 'package:boilerplate/domain/usecase/user/create_update_company_profile_usercase.dart';
import 'package:boilerplate/domain/usecase/user/get_me_usecase.dart';
import 'package:boilerplate/domain/usecase/user/login_usecase.dart';
import 'package:boilerplate/domain/usecase/user/signup_usecase.dart';

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

  Future<ProfileCompany?> createCompanyProfile(CreateUpdateCompanyProfileParams param) async {
    try {
      final res = await _dioClient.dio.post(Endpoints.createCompanyProfile, data: param);
      final result = jsonDecode(res.toString());
      return ProfileCompany.fromMap(result["result"]);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

   Future<ProfileCompany?> updateCompanyProfile(CreateUpdateCompanyProfileParams param) async {
    try {
      final res = await _dioClient.dio.put(Endpoints.createCompanyProfile+"/${param.uid}", data: param);
      final result = jsonDecode(res.toString());
      return ProfileCompany.fromMap(result["result"]);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }
}
