import 'package:boilerplate/core/stores/form/form_company_profile_store.dart';
import 'package:boilerplate/core/stores/form/form_store.dart';
import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/core/widgets/textfield_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/company_welcome/company_welcome.dart';
import 'package:boilerplate/presentation/home/store/theme/theme_store.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

List<String> options = [
  "It's just me",
  "2-9 employees",
  "10-99 employees",
  "100-1000 employees",
  "More than 1000 employees"
];

class CompanyProfileForm extends StatefulWidget {
  @override
  State<CompanyProfileForm> createState() => _CompanyProfileFormState();
}

class _CompanyProfileFormState extends State<CompanyProfileForm> {
  final ThemeStore _themeStore = getIt<ThemeStore>();
  final FormCompanyProfileStore _formStore = getIt<FormCompanyProfileStore>();
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  String currentOption = options[0];

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
          for (var option in options)
            InkWell(
              onTap: () {
                setState(() {
                  currentOption = option;
                });
              },
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                dense: true,
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                title: Text(option),
                leading: Radio(
                  value: option,
                  groupValue: currentOption,
                  onChanged: ((value) {
                    setState(() {
                      currentOption = value.toString();
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
            buttonText: "Continue",
            buttonColor: Theme.of(context).colorScheme.primary,
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.companyWelcome);
            },
          )
        ],
      ),
    );
  }
}
