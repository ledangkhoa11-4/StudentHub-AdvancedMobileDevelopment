import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/user/user.dart';
import 'package:boilerplate/presentation/Change_pass/changepass.dart';
import 'package:boilerplate/presentation/auth_widget/auth_widget.dart';
import 'package:boilerplate/presentation/forgot_password/forgot_password.dart';
import 'package:boilerplate/presentation/home/store/language/language_store.dart';
import 'package:boilerplate/presentation/home/store/theme/theme_store.dart';
import 'package:boilerplate/presentation/login/login.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/navigation_bar/navigation_bar.dart';
import 'package:boilerplate/presentation/profile/company_new_profile.dart';
import 'package:boilerplate/presentation/profile/review_student_profile.dart';
import 'package:boilerplate/presentation/profile/student_new_profile.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_dialog/material_dialog.dart';
import '../video_call/home.dart';

class Account {
  final int value;
  final String name;
  final String nickname;
  final ClipRRect avatar;

  Account(
      {required this.name,
      required this.nickname,
      required this.value,
      required this.avatar});
}

class SwitchAccountScreen extends StatefulWidget {
  @override
  _SwitchAccountScreenState createState() => _SwitchAccountScreenState();
}

class _SwitchAccountScreenState extends State<SwitchAccountScreen> {
  late Account _selectedAccount;
  late String _fullname;
  final ThemeStore _themeStore = getIt<ThemeStore>();
  final LanguageStore _languageStore = getIt<LanguageStore>();
  final UserStore _userStore = getIt<UserStore>();

  late List<Account> accounts;

  @override
  void initState() {
    _fullname = _userStore?.user?.fullname ?? "";
    accounts = (_userStore?.user?.roles?.map((e) => Account(
                  name: _fullname,
                  value: e,
                  avatar: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      width: 40,
                      e == UserRole.COMPANY.value
                          ? Assets.companyAvatar
                          : Assets.studentAvatar,
                      fit: BoxFit.cover,
                    ),
                  ),
                  nickname: e == UserRole.COMPANY.value ? "Company" : "Student",
                )) ??
            [])
        .toList();
    if (_userStore.user?.roles != null && _userStore.user!.roles!.length < 2) {
      if (_userStore.user!.roles!.first == UserRole.COMPANY.value) {
        accounts.add(Account(
          name: "Create student profile",
          nickname: "",
          value: -1,
          avatar: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              width: 40,
              Assets.studentAvatar,
              fit: BoxFit.cover,
            ),
          ),
        ));
      } else {
        accounts.add(Account(
          name: "Create company profile",
          nickname: "",
          value: -1,
          avatar: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              width: 40,
              Assets.companyAvatar,
              fit: BoxFit.cover,
            ),
          ),
        ));
      }
    }
    final currentProfile = getIt<SharedPreferenceHelper>().currentProfile;
    _selectedAccount = accounts.firstWhere(
        (element) => element.value == currentProfile,
        orElse: () => accounts[0]);

    super.initState();
  }

  Widget _buildThemeButton() {
    return Observer(
      builder: (context) {
        return ListTile(
          leading: Icon(
            _themeStore.darkMode
                ? BootstrapIcons.sun_fill
                : BootstrapIcons.moon_stars_fill,
            size: 24,
          ),
          title: Text(
            _themeStore.darkMode
                ? AppLocalizations.of(context).translate('light_theme')
                : AppLocalizations.of(context).translate('dark_theme'),
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          onTap: () {
            _themeStore.changeBrightnessToDark(!_themeStore.darkMode);
          },
        );
      },
    );
  }

  Widget _buildLanguageButton() {
    return ListTile(
      leading: Icon(BootstrapIcons.translate),
      title: Text(AppLocalizations.of(context).translate('language'),
          style: TextStyle(
            fontSize: 16,
          )),
      onTap: () {
        _buildLanguageDialog();
      },
    );
  }

  Widget _buildProfileButton() {
    return ListTile(
      leading: Icon(BootstrapIcons.person_lines_fill),
      title: Text(AppLocalizations.of(context).translate('profile'),
          style: TextStyle(
            fontSize: 16,
          )),
      onTap: () {
        final currentProfile = getIt<SharedPreferenceHelper>().currentProfile;
        if (currentProfile == UserRole.COMPANY.value) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CompanyNewProfile()));
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (context) => HomePage()));
        }

        if (currentProfile == UserRole.STUDENT.value) {
          if (_userStore.user!.student != null) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ReviewStudentProfile()));
          } else {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => StudentNewProfile()));
          }
        }
      },
    );
  }

  Widget _buildChangePassButton() {
    return ListTile(
      leading: Icon(BootstrapIcons.person_lines_fill),
      title: Text("Change Password",
          style: TextStyle(
            fontSize: 16,
          )),
      onTap: () {
        final currentProfile = getIt<SharedPreferenceHelper>().currentProfile;
        print(currentProfile);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ChangeScreen()));
        /*if (currentProfile == UserRole.COMPANY.value) {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CompanyNewProfile()));
        }*/
      },
    );
  }

  _buildLanguageDialog() {
    _showDialog<String>(
      context: context,
      child: MaterialDialog(
        borderRadius: 5.0,
        enableFullWidth: true,
        title: Text(
          AppLocalizations.of(context).translate('home_tv_choose_language'),
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
        headerColor: Theme.of(context).primaryColor,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        closeButtonColor: Colors.white,
        enableCloseButton: true,
        enableBackButton: false,
        onCloseButtonClicked: () {
          Navigator.of(context).pop();
        },
        children: _languageStore.supportedLanguages
            .map(
              (object) => ListTile(
                dense: true,
                contentPadding: EdgeInsets.all(0.0),
                title: Text(
                  object.language!,
                  style: TextStyle(
                    color: _languageStore.locale == object.locale
                        ? Theme.of(context).colorScheme.primary
                        : _themeStore.darkMode
                            ? Colors.white
                            : Colors.black,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  // change user language based on selected locale
                  _languageStore.changeLanguage(object.locale!);
                },
              ),
            )
            .toList(),
      ),
    );
  }

  _showDialog<T>({required BuildContext context, required Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T? value) {
      // The value passed to Navigator.pop() or null.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account settings'),
      ),
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 70,
                child: DropdownButton<Account>(
                  isExpanded: true,
                  value: _selectedAccount,
                  onChanged: (Account? newValue) {
                    setState(() {
                      if (newValue?.nickname != "") {
                        if (_selectedAccount != newValue) {
                          _selectedAccount = newValue!;
                          getIt<SharedPreferenceHelper>()
                              .saveCurrentProfile(newValue.value);

                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => AuthWidget()),
                              (Route<dynamic> route) => false);
                          UserNavigationBar.bottomNavIndex = 0;
                        }
                      } else {
                        if (newValue!.name!.contains("student")) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => StudentNewProfile()));
                        } else {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => CompanyNewProfile()));
                        }
                      }
                    });
                  },
                  items: accounts.map((Account account) {
                    return DropdownMenuItem<Account>(
                      value: account,
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          children: [
                            account.avatar,
                            SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  account.name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                !account.nickname.isEmpty
                                    ? Text(
                                        account.nickname,
                                        style: TextStyle(fontSize: 10),
                                      )
                                    : SizedBox(),
                              ],
                            ),
                            SizedBox(width: 15),
                            if (account == _selectedAccount) Icon(Icons.check),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              _buildProfileButton(),
              _buildThemeButton(),
              _buildLanguageButton(),
              _buildChangePassButton(),
              ListTile(
                leading: Icon(BootstrapIcons.box_arrow_left),
                title: Text(
                  AppLocalizations.of(context).translate('logout'),
                  style: TextStyle(fontSize: 16),
                ),
                onTap: () {
                  _userStore.logout();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                      (Route<dynamic> route) => false);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
