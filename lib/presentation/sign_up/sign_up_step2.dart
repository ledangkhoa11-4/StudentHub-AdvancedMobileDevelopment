import 'package:boilerplate/core/extensions/cap_extension.dart';
import 'package:boilerplate/core/stores/form/form_signin_store.dart';
import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/core/widgets/textfield_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/home/store/theme/theme_store.dart';
import 'package:boilerplate/presentation/login/login.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/post/store/post_store.dart';
import 'package:boilerplate/presentation/toast/toast.dart';
import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpStep2 extends StatefulWidget {
  final String selectedOption;

  SignUpStep2({required this.selectedOption});

  @override
  _SignUpStep2State createState() => _SignUpStep2State();
}

class _SignUpStep2State extends State<SignUpStep2> {
  final UserStore _userStore = getIt<UserStore>();
  final ThemeStore _themeStore = getIt<ThemeStore>();
  final FormSigninStore _formStore = getIt<FormSigninStore>();

  bool _agreeToTerms = false;
  TextEditingController _fullnameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var anotherOption =
        widget.selectedOption == "company" ? "student" : "company";

    return Scaffold(
      appBar: UserAppBar.buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Observer(
              builder: (context) => Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 24),
                  Center(
                    child: Text(
                      'Sign up as ${widget.selectedOption.toTitleCase()}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextFieldWidget(
                    hint: "Fullname",
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    icon: BootstrapIcons.alphabet,
                    iconColor:
                        _themeStore.darkMode ? Colors.white70 : Colors.black54,
                    textController: _fullnameController,
                    errorText: _formStore.formErrorStore.fullname,
                    onChanged: (value) {
                      _formStore.setFullname(_fullnameController.text);
                    },
                  ),
                  TextFieldWidget(
                    hint: "Email",
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    icon: BootstrapIcons.envelope_at_fill,
                    iconColor:
                        _themeStore.darkMode ? Colors.white70 : Colors.black54,
                    textController: _emailController,
                    errorText: _formStore.formErrorStore.email,
                    onChanged: (value) {
                      _formStore.setEmail(_emailController.text);
                    },
                  ),
                  TextFieldWidget(
                    hint: "Password",
                    inputType: TextInputType.visiblePassword,
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    icon: BootstrapIcons.shield_lock_fill,
                    iconColor:
                        _themeStore.darkMode ? Colors.white70 : Colors.black54,
                    textController: _passwordController,
                    errorText: _formStore.formErrorStore.password,
                    onChanged: (value) {
                      _formStore.setPassword(_passwordController.text);
                    },
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        value: _agreeToTerms,
                        onChanged: (value) {
                          setState(() {
                            _agreeToTerms = value!;
                          });
                        },
                      ),
                      Expanded(
                        child: Text(
                          'Yes, I understand and agree to StudentHub',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  RoundedButtonWidget(
                    buttonText: "Create my account",
                    buttonColor: Theme.of(context).colorScheme.primary,
                    textColor: Colors.white,
                    onPressed: () {
                      _formStore.validateAll();
                      if (_formStore.formErrorStore.email != null ||
                          _formStore.formErrorStore.fullname != null ||
                          _formStore.formErrorStore.password != null) {
                        ToastHelper.error(
                            "One or more fields are incorrect, please type again");
                        return;
                      }
                      if (_agreeToTerms == false) {
                        ToastHelper.error("Please agree to the terms");
                        return;
                      }
                      DeviceUtils.hideKeyboard(context);
                      final role = widget.selectedOption == "student" ? 0 : 1;
                      _userStore.signup(
                          _fullnameController.text,
                          _emailController.text,
                          _passwordController.text,
                          role);
                    },
                  ),
                  SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Looking for a project? ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,
                        ),
                      ),
                      InkWell(
                        child: Text(
                          'Apply as ${anotherOption}',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            decoration: TextDecoration.underline,
                            fontSize: 13,
                          ),
                        ),
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) =>
                                    SignUpStep2(selectedOption: anotherOption)),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Observer(
            builder: (context) {
              return _userStore.signupSuccess == true
                  ? navigate(context, _userStore.signupMessage)
                  : _showErrorMessage(_userStore.signupSuccess != null
                      ? _userStore.signupMessage
                      : "");
            },
          ),
          Observer(
            builder: (context) {
              return Visibility(
                visible: _userStore.isSignin,
                child: CustomProgressIndicatorWidget(),
              );
            },
          )
        ]),
      ),
    );
  }

  _showErrorMessage(String message) {
    if (message.isNotEmpty) {
      ToastHelper.error(message);
    }
    _userStore.resetSigninState();
    return SizedBox.shrink();
  }

  Widget navigate(BuildContext context, String message) {
    if (message.isNotEmpty) {
      ToastHelper.success(message, length: Toast.LENGTH_LONG);
    }
    _userStore.resetSigninState();
    Future.delayed(Duration(milliseconds: 0), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => LoginScreen()),
          (Route<dynamic> route) => false);
    });

    return Container();
  }

  @override
  void dispose() {
    _fullnameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
