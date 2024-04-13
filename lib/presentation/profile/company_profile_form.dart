import 'package:boilerplate/core/stores/form/form_company_profile_store.dart';
import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/core/widgets/textfield_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/user/profile_company.dart';
import 'package:boilerplate/domain/usecase/user/create_update_company_profile_usercase.dart';
import 'package:boilerplate/presentation/home/store/theme/theme_store.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/toast/toast.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../utils/locale/app_localization.dart';

class CompanyProfileForm extends StatefulWidget {
  @override
  State<CompanyProfileForm> createState() => _CompanyProfileFormState();
}

class _CompanyProfileFormState extends State<CompanyProfileForm> {
  final ThemeStore _themeStore = getIt<ThemeStore>();
  final UserStore _userStore = getIt<UserStore>();
  final FormCompanyProfileStore _formStore = getIt<FormCompanyProfileStore>();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  int currentOption = CompanySizeList[0].value;

  late final bool isEdit;

  @override
  void initState() {
    isEdit = _userStore.user?.company?.id != null;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_userStore.user?.company != null) {
      _formStore.setCompanyName(_userStore.user!.company!.companyName);
      _companyNameController.text = _userStore.user!.company!.companyName;

      _formStore.setWebsite(_userStore.user!.company!.website);
      _websiteController.text = _userStore.user!.company!.website;

      _formStore.setDescription(_userStore.user!.company!.description);
      _descController.text = _userStore.user!.company!.description;

      currentOption = _userStore.user!.company!.size;

      print(_userStore.user!.company!.id);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          Text(
            "How many people are in your company?",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          SizedBox(
            height: 10,
          ),
          for (var option in CompanySizeList)
            InkWell(
              onTap: () {
                setState(() {
                  currentOption = option.value;
                });
              },
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                title: Text(option.title),
                leading: Radio(
                  value: option.value,
                  groupValue: currentOption,
                  onChanged: ((value) {
                    setState(() {
                      currentOption = value ?? -1;
                    });
                  }),
                ),
              ),
            ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Company Name",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          TextFieldWidget(
            hint: "Your company name",
            padding: EdgeInsets.only(top: 15, bottom: 15),
            icon: Icons.work,
            iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
            textController: _companyNameController,
            errorText: _formStore.formErrorStore.companyName,
            onChanged: (value) {
              _formStore.setCompanyName(_companyNameController.text);
            },
          ),
          Text(
            "Website",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          TextFieldWidget(
            hint: "Your website url",
            padding: EdgeInsets.only(top: 15, bottom: 15),
            icon: BootstrapIcons.globe,
            iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
            textController: _websiteController,
            errorText: _formStore.formErrorStore.website,
            onChanged: (value) {
              _formStore.setWebsite(_websiteController.text);
            },
          ),
          Text(
            "Description",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          TextFieldWidget(
            hint: "Some things about your work",
            inputType: TextInputType.multiline,
            padding: EdgeInsets.only(top: 15, bottom: 15),
            icon: BootstrapIcons.info_circle,
            iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
            textController: _descController,
            errorText: _formStore.formErrorStore.description,
            onChanged: (value) {
              _formStore.setDescription(_descController.text);
            },
          ),
          RoundedButtonWidget(
            buttonText: isEdit ? "Update" : "Continue",
            buttonColor: Theme.of(context).colorScheme.primary,
            textColor: Colors.white,
            onPressed: () {
              _formStore.validateAll();
              if (_formStore.formErrorStore.companyName == null &&
                  _formStore.formErrorStore.description == null &&
                  _formStore.formErrorStore.description == null) {
                _userStore.createUpdateCompanyProfile(
                    CreateUpdateCompanyProfileParams(
                        uid: _userStore.user?.company?.id ?? null,
                        companyName: _formStore.companyName,
                        website: _formStore.website,
                        description: _formStore.website,
                        size: currentOption));
              } else {
                ToastHelper.error(AppLocalizations.of(context)
                    .translate('login_error_fill_fields'));
              }
            },
          )
        ],
      ),
    );
  }
}
