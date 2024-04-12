import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/user/user.dart';
import 'package:boilerplate/presentation/home/store/language/language_store.dart';
import 'package:boilerplate/presentation/home/store/theme/theme_store.dart';
import 'package:boilerplate/presentation/login/login.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/profile/company_new_profile.dart';
import 'package:boilerplate/presentation/profile/student_new_profile.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:material_dialog/material_dialog.dart';

class Account {
  final String name;
  final String nickname;

  Account({required this.name, required this.nickname});
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
                  nickname: e == UserRole.COMPANY.value ? "Company" : "Student",
                )) ??
            [])
        .toList();
    if (_userStore.user?.roles != null && _userStore.user!.roles!.length < 2) {
      if (_userStore.user!.roles!.first == UserRole.COMPANY.value) {
        accounts.add(Account(name: "Create student profile", nickname: ""));
      } else {
        accounts.add(Account(name: "Create company profile", nickname: ""));
      }
    }
    _selectedAccount = accounts[0];

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
      onTap: () {},
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
                        _selectedAccount = newValue!;
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
                            Icon(Icons.account_circle, size: 35),
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
              ListTile(
                leading: Icon(BootstrapIcons.box_arrow_left),
                title: Text(AppLocalizations.of(context).translate('logout'), style: TextStyle(fontSize: 16),),
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
