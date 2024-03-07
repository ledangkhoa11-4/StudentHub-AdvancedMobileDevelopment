import 'package:boilerplate/core/widgets/textfield_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/home/store/theme/theme_store.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:text_area/text_area.dart';

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
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  String currentOption = options[0];

  @override
  Widget build(BuildContext context) {
    return Column(
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
          // focusNode: _passwordFocusNode,
          errorText: "",
          onChanged: (value) {
            // _formStore.setPassword(_passwordController.text);
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
          // focusNode: _passwordFocusNode,
          errorText: "",
          onChanged: (value) {
            // _formStore.setPassword(_passwordController.text);
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
          textController: _websiteController,
          // focusNode: _passwordFocusNode,
          errorText: "Please",
          onChanged: (value) {
            // _formStore.setPassword(_passwordController.text);
          },
        ),
      ],
    );
  }
}
