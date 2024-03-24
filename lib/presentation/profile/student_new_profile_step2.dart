import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/profile/project.dart';
import 'package:boilerplate/presentation/profile/student_profile_stepper.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/material.dart';

class StudentNewProfileStep2 extends StatefulWidget {
  @override
  State<StudentNewProfileStep2> createState() => _StudentNewProfileStep2State();
}

class _StudentNewProfileStep2State extends State<StudentNewProfileStep2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppBar.buildAppBar(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              StudentFormStepper(activeStep: 1),
              Center(
                  child: Text(
                "Experiences",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontSize: 18),
              )),
              SizedBox(height: 10),
              Center(
                  child: Text(
                      "Tell us about your self and you will be on your \nway connect with real-world project",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 14))),
              ProjectWidget(),
              SizedBox(
                height: 20,
              ),
              RoundedButtonWidget(
                buttonText: "Continue",
                buttonColor: Theme.of(context).colorScheme.primary,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.studentProfileCV);
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
