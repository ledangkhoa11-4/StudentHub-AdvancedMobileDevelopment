import 'package:boilerplate/core/stores/form/form_student_profile_store.dart';
import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/profile/project.dart';
import 'package:boilerplate/presentation/profile/student_new_profile_step3.dart';
import 'package:boilerplate/presentation/profile/student_profile_stepper.dart';
import 'package:boilerplate/presentation/toast/toast.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/material.dart';

class StudentNewProfileStep2 extends StatefulWidget {
  final FormStudentProfileStore formStore;

  StudentNewProfileStep2({Key? key, required this.formStore}) : super(key: key);
  @override
  State<StudentNewProfileStep2> createState() => _StudentNewProfileStep2State();
}

class _StudentNewProfileStep2State extends State<StudentNewProfileStep2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppBar.buildAppBar(context, disableSettingAccount: true),
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
              ProjectWidget(
                formStore: widget.formStore,
              ),
              SizedBox(
                height: 20,
              ),
              RoundedButtonWidget(
                buttonText: "Continue",
                buttonColor: Theme.of(context).colorScheme.primary,
                textColor: Colors.white,
                onPressed: () {
                  widget.formStore.validateAll();
                  if (widget.formStore.formErrorStore.hasErrorsInStep2 ==
                      true) {
                        widget.formStore.formErrorStore.experiences!.forEach((e) => print(e.title));
                    ToastHelper.error("Please fill all fields");
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StudentNewProfileStep3(
                          formStore: widget.formStore,
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
    );
  }
}
