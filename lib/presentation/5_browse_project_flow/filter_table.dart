import 'dart:math';

import 'package:boilerplate/core/stores/form/form_store.dart';
import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/core/widgets/textfield_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/project/project.dart';
import 'package:boilerplate/presentation/home/store/theme/theme_store.dart';
import 'package:boilerplate/presentation/post_project/store/post_project_store.dart';
import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';

class InitialFilter {
  final int? projectLength;
  final int? studentsNeeded;
  final int? proposalsLessThan;

  InitialFilter(
      {this.projectLength, this.studentsNeeded, this.proposalsLessThan});
}

class FilterTable extends StatefulWidget {
  final void Function(
      int? projectLength, int? studentsNeeded, int? proposalsLessThan) onFilter;

  const FilterTable({
    Key? key,
    required this.onFilter,
  }) : super(key: key);

  @override
  _FilterTableState createState() => _FilterTableState();
}

class _FilterTableState extends State<FilterTable> {
  final ThemeStore _themeStore = getIt<ThemeStore>();

  int? _projectLength = null;
  TextEditingController _studentsNeededController = TextEditingController();
  TextEditingController _proposalsLessThanController = TextEditingController();

  @override
  void initState() {
    final ProjectStore formStore = getIt<ProjectStore>();

    _projectLength = formStore.globalGetAllProjectParams.projectScopeFlag;
    _studentsNeededController.text =
        formStore.globalGetAllProjectParams.numberOfStudents != null
            ? formStore.globalGetAllProjectParams.numberOfStudents.toString()
            : "";
    _proposalsLessThanController.text =
        formStore.globalGetAllProjectParams.proposalsLessThan != null
            ? formStore.globalGetAllProjectParams.proposalsLessThan.toString()
            : "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            bottom: max(MediaQuery.of(context).viewInsets.bottom, 16),
            top: 16,
            left: 16,
            right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Project Length filter
            ListTile(
              title: Text(
                AppLocalizations.of(context).translate('project_Length'),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              contentPadding: EdgeInsets.zero,
              subtitle: Column(
                children: <Widget>[
                  RadioListTile<int>(
                    title: Text(
                      AppLocalizations.of(context).translate('Less_one_month'),
                    ),
                    value: ProjectScope.LessThanOneMonth.value,
                    toggleable: true,
                    groupValue: _projectLength,
                    onChanged: (newValue) {
                      setState(() {
                        _projectLength = newValue;
                      });
                    },
                  ),
                  RadioListTile<int>(
                    title: Text(
                      AppLocalizations.of(context).translate('1_3_month'),
                    ),
                    toggleable: true,
                    value: ProjectScope.OneToThreeMonth.value,
                    groupValue: _projectLength,
                    onChanged: (newValue) {
                      setState(() {
                        _projectLength = newValue;
                      });
                    },
                  ),
                  RadioListTile<int>(
                    title: Text(
                      AppLocalizations.of(context).translate('3_6_month'),
                    ),
                    toggleable: true,
                    value: ProjectScope.ThreeToSixMonth.value,
                    groupValue: _projectLength,
                    onChanged: (newValue) {
                      setState(() {
                        _projectLength = newValue;
                      });
                    },
                  ),
                  RadioListTile<int>(
                    title: Text(AppLocalizations.of(context).translate('more_6_month'),),
                    toggleable: true,
                    value: ProjectScope.MoreThanSixMonth.value,
                    groupValue: _projectLength,
                    onChanged: (newValue) {
                      setState(() {
                        _projectLength = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
            // Students Needed filter
            TextFieldWidget(
              hint: AppLocalizations.of(context).translate('s_need_more'),
              icon: BootstrapIcons.person_badge,
              iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
              textController: _studentsNeededController,
              inputType: TextInputType.number,
              errorText: null,
              onChanged: (value) {},
            ),
            SizedBox(
              height: 20,
            ),
            TextFieldWidget(
              hint: AppLocalizations.of(context).translate('pro_less'),
              icon: BootstrapIcons.file_text,
              iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
              textController: _proposalsLessThanController,
              inputType: TextInputType.number,
              errorText: null,
              onChanged: (value) {},
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    _clearFilters();
                  },
                  child: Text(AppLocalizations.of(context).translate('clear_f')),
                ),
                RoundedButtonWidget(
                  buttonText: AppLocalizations.of(context).translate('apply'),
                  buttonColor: Theme.of(context).colorScheme.primary,
                  textColor: Colors.white,
                  onPressed: () {
                    DeviceUtils.hideKeyboard(context);
                    widget.onFilter(
                        _projectLength,
                        int.tryParse(_studentsNeededController.text),
                        int.tryParse(_proposalsLessThanController.text));
                    Navigator.pop(context);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _clearFilters() {
    setState(() {
      _projectLength = null;
      _studentsNeededController.text = "";
      _proposalsLessThanController.text = "";
    });
  }
}
