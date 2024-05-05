import 'package:another_flushbar/flushbar_helper.dart';
import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/core/stores/form/form_changepass_store.dart';
// import 'package:boilerplate/core/widgets/app_icon_widget.dart';
import 'package:boilerplate/core/widgets/empty_app_bar_widget.dart';
import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/core/widgets/textfield_widget.dart';
import 'package:boilerplate/data/sharedpref/constants/preferences.dart';
import 'package:boilerplate/presentation/5_browse_project_flow/student_dashboard.dart';
import 'package:boilerplate/presentation/6_company_review_proposals/dashboard.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/auth_widget/auth_widget.dart';
import 'package:boilerplate/presentation/home/store/theme/theme_store.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/sign_up/sign_up_step1.dart';
import 'package:boilerplate/presentation/toast/toast.dart';
import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../di/service_locator.dart';

class ChangeScreen extends StatefulWidget {
  @override
  _ChangeScreenState createState() => _ChangeScreenState();
}

class _ChangeScreenState extends State<ChangeScreen> {
  //text controllers:-----------------------------------------------------------
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _newpasswordController = TextEditingController();

  //stores:---------------------------------------------------------------------
  final ThemeStore _themeStore = getIt<ThemeStore>();
  final FormChangeStore _formStore = getIt<FormChangeStore>();
  final UserStore _userStore = getIt<UserStore>();

  //focus node:-----------------------------------------------------------------
  late FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: UserAppBar.buildAppBar(context),
      body: _buildBody(),
    );
  }

  // body methods:--------------------------------------------------------------
  Widget _buildBody() {
    return Material(
      child: Stack(
        children: <Widget>[
          MediaQuery.of(context).orientation == Orientation.landscape
              ? Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: _buildLeftSide(),
                    ),
                    Expanded(
                      flex: 1,
                      child: _buildRightSide(),
                    ),
                  ],
                )
              : Align(
                  alignment: Alignment.topLeft,
                  child: _buildRightSide(),
                ),
          Observer(
            builder: (context) {
              return _userStore.changeSuccess == true
                  ? navigate(context, _userStore.changeMessage)
                  : _showErrorMessage(_userStore.changeMessage);
            },
          ),
          Observer(
            builder: (context) {
              return Visibility(
                visible: _userStore.isLoading,
                child: CustomProgressIndicatorWidget(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLeftSide() {
    return SizedBox.expand(
      child: Image.asset(
        Assets.carBackground,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildRightSide() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 24.0),
            Text(
              'Change Password with StudentHub',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            // AppIconWidget(image: 'assets/icons/ic_appicon.png'),
            SizedBox(height: 24.0),
            _buildPasswordField(),
            _buildnewPasswordField(),
            SizedBox(height: 24.0),
            _buildChangeInButton(),
          ],
        ),
      ),
    );
  }



  Widget _buildPasswordField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint:"Enter Old Password",
          padding: EdgeInsets.only(top: 16.0),
          icon: Icons.lock,
          iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _passwordController,
          focusNode: _passwordFocusNode,
          errorText: _formStore.formErrorStore.password,
          onChanged: (value) {
            _formStore.setPassword(_passwordController.text);
          },
        );
      },
    );
  }

  Widget _buildnewPasswordField() {
    return Observer(
      builder: (context) {
        return TextFieldWidget(
          hint:"Enter New Password",
          padding: EdgeInsets.only(top: 16.0),
          icon: Icons.lock,
          iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
          textController: _newpasswordController,
          //focusNode: _passwordFocusNode,
          errorText: _formStore.formErrorStore.NewPassword,
          onChanged: (value) {
            _formStore.setNewPassword(_newpasswordController.text);
          },
        );
      },
    );
  }



  Widget _buildChangeInButton() {
  return RoundedButtonWidget(
    buttonText: "Change Password",
    buttonColor: Theme.of(context).colorScheme.primary,
    textColor: Colors.white,
    onPressed: () async {
      _formStore.validateAll();
      if (_formStore.formErrorStore.password == null &&
          _formStore.formErrorStore.NewPassword == null && _passwordController.text != _newpasswordController.text) {
        DeviceUtils.hideKeyboard(context);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Confirm'),
              content: Text('Are you sure you want to change your password?'),
              actionsPadding: EdgeInsets.symmetric(horizontal: 16),
              contentPadding: EdgeInsets.fromLTRB(24, 20, 24, 20), 
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0), 
              ),
              backgroundColor: Color(0xFFE8ECEC),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await _userStore.change(_passwordController.text, _newpasswordController.text);
                  },
                  child: Text('Confirm'),
                ),
              ],
            );
          },
        );
      } else if(_passwordController.text == _newpasswordController.text){
        _showErrorMessage('The new password must not be the same as the old password');
      }else{
        _showErrorMessage("Please fill in all fields ");
      }
    },
  );
}


  Widget navigate(BuildContext context, String message) {
    if (message.isNotEmpty) {
      ToastHelper.success(message);
    }
    Future.delayed(Duration(milliseconds: 0), () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => AuthWidget()),
      );
      _userStore.resetchangeState();
    });

    return Container();
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    if (message.isNotEmpty) {
      ToastHelper.error(message);
    }
    _userStore.resetchangeState();
    return SizedBox.shrink();
  }


  // dispose:-------------------------------------------------------------------
  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _passwordController.dispose();
    _newpasswordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }
}
