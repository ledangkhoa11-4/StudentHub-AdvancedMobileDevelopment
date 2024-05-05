import 'package:boilerplate/core/stores/form/form_student_profile_store.dart';
import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/user/user.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/auth_widget/auth_widget.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/profile/file_picker.dart';
import 'package:boilerplate/presentation/profile/student_profile_stepper.dart';
import 'package:boilerplate/presentation/toast/toast.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../utils/locale/app_localization.dart';

class StudentNewProfileStep3 extends StatefulWidget {
  final FormStudentProfileStore formStore;

  StudentNewProfileStep3({Key? key, required this.formStore}) : super(key: key);
  @override
  State<StudentNewProfileStep3> createState() => _StudentNewProfileStep3State();
}

class _StudentNewProfileStep3State extends State<StudentNewProfileStep3> {
  bool loading = false;
  final _userStore = getIt<UserStore>();

  @override
  void initState() {
    _userStore.resetApiResponse();

    super.initState();
  }

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
                      AppLocalizations.of(context).translate('CV_Trans'),
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontSize: 18),
                    )),
                    SizedBox(height: 10),
                    Center(
                        child: Text(
                            AppLocalizations.of(context).translate('tel_us_about'),
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
                      label: AppLocalizations.of(context).translate('resume_cv'),
                      name: "resume" ,
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
                      label: AppLocalizations.of(context).translate('trans'),
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
                      buttonText: AppLocalizations.of(context).translate('Finish'),
                      buttonColor: Theme.of(context).colorScheme.primary,
                      textColor: Colors.white,
                      onPressed: () {
                        if (widget.formStore.resume == null ||
                            widget.formStore.transcript == null) {
                          ToastHelper.error(
                              AppLocalizations.of(context).translate('pls_att_re_trans'));
                        } else {
                          _userStore
                              .bulkCreateUpdateStudentProfile(widget.formStore);
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
          Observer(builder: (context) {
            return Visibility(
              visible: loading || _userStore.isLoading,
              child: CustomProgressIndicatorWidget(),
            );
          }),
          Observer(
            builder: (context) {
              return !_userStore.isLoading &&
                      _userStore.onFinishStudentProfile == true
                  ? navigate(context)
                  : SizedBox.shrink();
            },
          ),
          Observer(
            builder: (context) {
              return !_userStore.isLoading &&
                      _userStore.onFinishStudentProfile == false
                  ? _showErrorMessage(_userStore.apiResponseMessage)
                  : SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }

  Widget navigate(BuildContext context) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (_userStore.isCreateProfile == true) {
        getIt<SharedPreferenceHelper>()
            .saveCurrentProfile(UserRole.STUDENT.value);
        _userStore.resetCreateProfileState();
        ToastHelper.success(AppLocalizations.of(context).translate('create_prof_suc'));
      }
      ToastHelper.success(AppLocalizations.of(context).translate('update_prof_suc'));

      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => AuthWidget()),
          (Route<dynamic> route) => false);
      _userStore.resetApiResponse();
    });

    return Container();
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    print(message);

    if (message.isNotEmpty) {
      ToastHelper.error(message);
    }

    Future.delayed(Duration(milliseconds: 0), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => AuthWidget()),
          (Route<dynamic> route) => false);
    });

    _userStore.resetApiResponse();
    return SizedBox.shrink();
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
