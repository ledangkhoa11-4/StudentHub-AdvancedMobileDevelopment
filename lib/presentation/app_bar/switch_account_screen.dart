import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/home/store/language/language_store.dart';
import 'package:boilerplate/presentation/home/store/theme/theme_store.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
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

  final ThemeStore _themeStore = getIt<ThemeStore>();
  final LanguageStore _languageStore = getIt<LanguageStore>();

  Widget _buildThemeButton() {
    return Observer(
      builder: (context) {
        return TextButton.icon(
          onPressed: () {
            _themeStore.changeBrightnessToDark(!_themeStore.darkMode);
          },
          icon: Icon(
            _themeStore.darkMode ? Icons.brightness_5 : Icons.brightness_3,
            color: null,
          ),
          label: Text(
            _themeStore.darkMode ? "Light Theme" : "Dark Theme",
          ),
        );
      },
    );
  }

  Widget _buildLanguageButton() {
    return TextButton.icon(
      onPressed: () {
        _buildLanguageDialog();
      },
      icon: Icon(
        Icons.language,
      ),
      label: Text(
        'Language',
      ),
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
  void initState() {
    super.initState();
    // Initialize selected account
    _selectedAccount = accounts[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Switch Account'),
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
                      _selectedAccount = newValue!;
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
                              children: [
                                Text(
                                  account.name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(account.nickname),
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
              _buildThemeButton(),
              _buildLanguageButton(),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text(AppLocalizations.of(context).translate('logout')),
                onTap: () {
                  // Handle logout
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<Account> accounts = [
  Account(
    name: 'Phong Tran',
    nickname: 'Student',
  ),
  Account(
    name: 'Phong Tran',
    nickname: 'Company',
  ),
];
