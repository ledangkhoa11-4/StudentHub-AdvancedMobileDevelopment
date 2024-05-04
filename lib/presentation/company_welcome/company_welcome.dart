import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/6_company_review_proposals/dashboard.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';

class CompanyWelcome extends StatefulWidget {
  @override
  State<CompanyWelcome> createState() => _CompanyWelcomeState();
}

class _CompanyWelcomeState extends State<CompanyWelcome> {
  final UserStore _userStore = getIt<UserStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppBar.buildAppBar(context, disableSettingAccount: true),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            BootstrapIcons.ui_checks,
            size: 50,
            color: Colors.green,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
              AppLocalizations.of(context).translate('welcome') + ''' ${_userStore.user?.fullname}!, '''+ AppLocalizations.of(context).translate('welcome_text_1'),
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.65,
            child: RoundedButtonWidget(
              buttonText: AppLocalizations.of(context).translate('get_started'),
              buttonColor: Theme.of(context).colorScheme.primary,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => DashBoardCompany()),
                    (Route<dynamic> route) => false);
              },
            ),
          )
        ],
      )),
    );
  }
}
