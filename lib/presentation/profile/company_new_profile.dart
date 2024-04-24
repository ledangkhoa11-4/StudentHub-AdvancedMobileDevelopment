import 'package:boilerplate/core/widgets/progress_indicator_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/profile/company_profile_form.dart';
import 'package:boilerplate/presentation/toast/toast.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';

class CompanyNewProfile extends StatefulWidget {
  @override
  State<CompanyNewProfile> createState() => _CompanyNewProfileState();
}

class _CompanyNewProfileState extends State<CompanyNewProfile> {
  final UserStore _userStore = getIt<UserStore>();
  late final bool isEdit;

  @override
  void initState() {
    isEdit = _userStore.user?.company?.id != null;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppBar.buildAppBar(context,
          disableSettingAccount: true,
          titleWidget: isEdit
              ? Text(AppLocalizations.of(context).translate('Edit_comp_prof'))
              : Text(AppLocalizations.of(context).translate('create_comp_prof'))),
      body: Stack(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Center(
                      child: Text(
                    AppLocalizations.of(context).translate('wellcome'),
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(fontSize: 18),
                  )),
                  SizedBox(height: 10),
                  Center(
                      child: Text(
                          AppLocalizations.of(context).translate('company_new_profile_text_1'),
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .displaySmall
                              ?.copyWith(fontSize: 14))),
                  CompanyProfileForm(),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ),
          Observer(
            builder: (context) {
              return Visibility(
                visible: _userStore.isLoading,
                child: CustomProgressIndicatorWidget(),
              );
            },
          ),
          Observer(
            builder: (context) {
              return _userStore.apiResponseSuccess == true
                  ? navigate(context)
                  : _showErrorMessage(_userStore.siginMessage);
            },
          ),
        ],
      ),
    );
  }

  Widget navigate(BuildContext context) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (_userStore.isCreateProfile == true) {
        Navigator.of(context).pushNamed(Routes.companyWelcome);
        _userStore.resetCreateProfileState();
      } else {
        ToastHelper.success(AppLocalizations.of(context).translate('update_profile_suc'));
        Navigator.of(context).pop();
      }
      _userStore.resetApiResponse();
    });

    return Container();
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(String message) {
    if (message.isNotEmpty) {
      ToastHelper.error(message);
    }
    _userStore.resetLoginState();
    return SizedBox.shrink();
  }
}
