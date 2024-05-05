import 'package:boilerplate/core/stores/form/form_post_project_store.dart';
import 'package:boilerplate/presentation/app_bar/switch_account_screen.dart';
import 'package:boilerplate/presentation/post_project/components/post_project_step2.dart';
import 'package:boilerplate/presentation/post_project/components/post_project_step3.dart';
import 'package:boilerplate/presentation/post_project/components/post_project_step4.dart';
import 'package:boilerplate/presentation/post_project/post_project.dart';
import 'package:boilerplate/presentation/company_welcome/company_welcome.dart';
import 'package:boilerplate/presentation/home/home.dart';
import 'package:boilerplate/presentation/login/login.dart';
import 'package:boilerplate/presentation/profile/student_new_profile_step2.dart';
import 'package:boilerplate/presentation/profile/student_new_profile_step3.dart';
import 'package:boilerplate/presentation/profile/swicth_account.dart';
import 'package:boilerplate/presentation/sign_up/sign_up_step1.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/post';
  static const String companyWelcome = '/company_welcome';
  static const String studentProfileExperience =
      '/profile/student_new_profile_step2';
  static const String studentProfileCV = '/profile/student_new_profile_step3';
  static const String signupStep1 = '/sign_up/sign_up_step1';
  static const String postProject = '/post_project/post_project';
  static const String postProjectStep2 =
      '/post_project/components/post_project_step2';
  static const String postProjectStep3 =
      '/post_project/components/post_project_step3';
  static const String postProjectStep4 =
      '/post_project/components/post_project_step4';
  static const String switchAccount = '/app_bar/switch_account_screen';

  static final routes = <String, WidgetBuilder>{
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
    companyWelcome: (BuildContext context) => CompanyWelcome(),
    studentProfileExperience: (BuildContext context) =>
        StudentNewProfileStep2(),
    studentProfileCV: (BuildContext context) => StudentNewProfileStep3(),
    signupStep1: (BuildContext context) => SignUpStep1(),
    postProject: (BuildContext context) => PostProject(),
    switchAccount: (BuildContext context) => SwitchAccountScreen(),
    postProjectStep2: (BuildContext context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      final FormPostProjectStore formStore = args['formStore'];
      return PostProjectStep2(formStore: formStore);
    },
    postProjectStep3: (BuildContext context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      final FormPostProjectStore formStore = args['formStore'];
      return PostProjectStep3(formStore: formStore);
    },
    postProjectStep4: (BuildContext context) {
      final args =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      final FormPostProjectStore formStore = args['formStore'];
      return PostProjectStep4(formStore: formStore);
    },
  };
}
