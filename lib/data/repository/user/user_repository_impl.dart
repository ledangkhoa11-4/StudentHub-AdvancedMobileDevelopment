import 'dart:async';

import 'package:boilerplate/data/network/apis/users/user_api.dart';
import 'package:boilerplate/domain/repository/user/user_repository.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:boilerplate/domain/usecase/user/get_me_usecase.dart';
import 'package:boilerplate/domain/usecase/user/signup_usecase.dart';

import '../../../domain/entity/user/user.dart';
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
}
