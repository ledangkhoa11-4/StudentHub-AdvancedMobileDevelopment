import 'dart:async';

import 'package:boilerplate/domain/usecase/user/get_me_usecase.dart';
import 'package:boilerplate/domain/usecase/user/login_usecase.dart';
import 'package:boilerplate/domain/usecase/user/signup_usecase.dart';

import '../../entity/user/user.dart';

abstract class UserRepository {
  Future<dynamic> login(LoginParams params);

  Future<dynamic> signup(SignupParam params);

  Future<User?> getMe(GetMeParam params);

  Future<void> saveIsLoggedIn(bool value);

  Future<void> saveAuthToken(String value);

  Future<void> saveCurrentProfile(int value);

  Future<bool> get isLoggedIn;
}
