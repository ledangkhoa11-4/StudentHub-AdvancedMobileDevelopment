import 'package:boilerplate/core/stores/form/form_student_profile_store.dart';
import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/profile/education.dart';
import 'package:boilerplate/presentation/profile/language.dart';
import 'package:boilerplate/presentation/profile/skillset.dart';
import 'package:boilerplate/presentation/profile/student_new_profile_step2.dart';
import 'package:boilerplate/presentation/profile/student_profile_stepper.dart';
import 'package:boilerplate/presentation/profile/tech_stack.dart';
import 'package:boilerplate/presentation/toast/toast.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StudentNewProfile extends StatefulWidget {
  @override
  State<StudentNewProfile> createState() => _StudentNewProfileState();
}

class _StudentNewProfileState extends State<StudentNewProfile> {
  final UserStore _userStore = getIt<UserStore>();
  final FormStudentProfileStore _formStore = getIt<FormStudentProfileStore>();
  late final bool isEdit;

  @override
  void didChangeDependencies() {
    _userStore.getAllTechStack();
    _userStore.getAllSkillset();
    super.didChangeDependencies();
  }

  @override
  void initState() {
    isEdit = _userStore.user?.student?.id != null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppBar.buildAppBar(context,
          titleWidget: isEdit
              ? Text("Edit student profile")
              : Text("Create new profile"),
          disableSettingAccount: true),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  StudentFormStepper(activeStep: 0),
                  Center(
                      child: Text(
                    "Welcome to StudentHub",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(fontSize: 18),
                  )),
                  SizedBox(height: 10),
                  Center(
                      child: Text(
                          "Tell us about your self and you will be on your way connect with real-world project",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(fontSize: 14))),
                  SizedBox(height: 20),
                  TechStackWiget(
                    formStore: _formStore,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SkillsetWidget(formStore: _formStore),
                  SizedBox(
                    height: 20,
                  ),
                  LanguageWidget(formStore: _formStore),
                  SizedBox(
                    height: 20,
                  ),
                  EducationWidget(formStore: _formStore),
                  SizedBox(
                    height: 20,
                  ),
                  RoundedButtonWidget(
                    buttonText: "Continue",
                    buttonColor: Theme.of(context).colorScheme.primary,
                    textColor: Colors.white,
                    onPressed: () {
                      _formStore.validateAll();
                      if (_formStore.formErrorStore.hasErrorsInStep1 == true) {
                        ToastHelper.error("Please fill all fields");
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StudentNewProfileStep2(
                              formStore: _formStore,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  
  
}
