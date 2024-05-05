import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/presentation/profile/education.dart';
import 'package:boilerplate/presentation/profile/language.dart';
import 'package:boilerplate/presentation/profile/skillset.dart';
import 'package:boilerplate/presentation/profile/student_profile_stepper.dart';
import 'package:boilerplate/presentation/profile/tech_stack.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/material.dart';

class StudentNewProfile extends StatefulWidget {
  @override
  State<StudentNewProfile> createState() => _StudentNewProfileState();
}

class _StudentNewProfileState extends State<StudentNewProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              TechStackWiget(),
              SizedBox(
                height: 20,
              ),
              SkillsetWidget(),
              SizedBox(
                height: 20,
              ),
              LanguageWidget(),
              EducationWidget(),
              SizedBox(
                height: 20,
              ),
              RoundedButtonWidget(
                buttonText: "Continue",
                buttonColor: Theme.of(context).colorScheme.primary,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.studentProfileExperience);

                },
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
