import 'package:boilerplate/core/stores/form/form_student_profile_store.dart';
import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/profile/file_picker.dart';
import 'package:boilerplate/presentation/profile/student_profile_stepper.dart';
import 'package:boilerplate/presentation/toast/toast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StudentNewProfileStep3 extends StatefulWidget {
  final FormStudentProfileStore formStore;

  StudentNewProfileStep3({Key? key, required this.formStore}) : super(key: key);
  @override
  State<StudentNewProfileStep3> createState() => _StudentNewProfileStep3State();
}

class _StudentNewProfileStep3State extends State<StudentNewProfileStep3> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppBar.buildAppBar(context),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Observer(builder: (context) {
                return Column(
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
                      formStore: widget.formStore,
                      label: "Resume / CV: ",
                      name: "resume",
                      allowedExtensions: ['pdf'],
                      onPicked: onPicked,
                      onLoading: onLoading,
                      finishLoading: finishLoading,
                      onRemove: onRemove,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FilePickerWidget(
                      formStore: widget.formStore,
                      label: "Transcript:",
                      name: "transcript",
                      allowedExtensions: ['pdf'],
                      onPicked: onPicked,
                      onLoading: onLoading,
                      finishLoading: finishLoading,
                      onRemove: onRemove,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RoundedButtonWidget(
                      buttonText: "Finish",
                      buttonColor: Theme.of(context).colorScheme.primary,
                      textColor: Colors.white,
                      onPressed: () {
                        if (widget.formStore.resume == null || widget.formStore.transcript == null) {
                          ToastHelper.error("Please attatch your resume and transcript");
                        } else {
                          print(widget.formStore.experiences[0]!.title);
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                );
              }),
            ),
          ),
          Visibility(
            visible: loading,
            child: CustomProgressIndicatorWidget(),
          ),
        ],
      ),
    );
  }

  void onPicked(PlatformFile file, String name) {
    widget.formStore.setFile(name, file);
  }

  void onRemove(String name) {
    widget.formStore.setFile(name, null);
  }

  void onLoading() {
    setState(() {
      loading = true;
    });
  }

  void finishLoading() {
    setState(() {
      loading = false;
    });
  }
}
