import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/profile/file_picker.dart';
import 'package:boilerplate/presentation/profile/student_profile_stepper.dart';
import 'package:flutter/material.dart';

class StudentNewProfileStep3 extends StatefulWidget {
  @override
  State<StudentNewProfileStep3> createState() => _StudentNewProfileStep3State();
}

class _StudentNewProfileStep3State extends State<StudentNewProfileStep3> {
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
              StudentFormStepper(activeStep: 2),
              Center(
                  child: Text(
                "CV & Transcript",
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
              SizedBox(
                height: 20,
              ),
              FilePickerWidget(
                name: "Resume / CV: ",
                allowedExtensions: ['pdf'],
              ),
              SizedBox(
                height: 20,
              ),
              FilePickerWidget(
                name: "Transcript:",
                allowedExtensions: ['pdf'],
              ),
               SizedBox(
                height: 20,
              ),
              RoundedButtonWidget(
                buttonText: "Finish",
                buttonColor: Theme.of(context).colorScheme.primary,
                textColor: Colors.white,
                onPressed: () {},
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
