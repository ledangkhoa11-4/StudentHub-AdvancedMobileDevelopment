import 'package:boilerplate/presentation/company_welcome/company_welcome.dart';
import 'package:boilerplate/presentation/home/home.dart';
import 'package:boilerplate/presentation/login/login.dart';
import 'package:boilerplate/presentation/profile/student_new_profile_step2.dart';
import 'package:boilerplate/presentation/profile/student_new_profile_step3.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/post';
  static const String companyWelcome = '/company_welcome';
  static const String studentProfileExperience = '/profile/student_new_profile_step2';
  static const String studentProfileCV = '/profile/student_new_profile_step3';

  static final routes = <String, WidgetBuilder>{
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
    companyWelcome: (BuildContext context) => CompanyWelcome(),
    studentProfileExperience: (BuildContext context) => StudentNewProfileStep2(),
    studentProfileCV: (BuildContext context) => StudentNewProfileStep3(),
  };
}
