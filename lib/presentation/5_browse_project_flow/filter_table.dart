import 'dart:math';

import 'package:boilerplate/core/widgets/rounded_button_widget.dart';
import 'package:boilerplate/core/widgets/textfield_widget.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/home/store/theme/theme_store.dart';
import 'package:boilerplate/utils/device/device_utils.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FilterTable extends StatefulWidget {
  final void Function(
      String projectLength, int studentsNeeded, int proposalsLessThan) onFilter;

  const FilterTable({Key? key, required this.onFilter}) : super(key: key);

  @override
  _FilterTableState createState() => _FilterTableState();
}

class _FilterTableState extends State<FilterTable> {
  final ThemeStore _themeStore = getIt<ThemeStore>();

  String _projectLength = '';
  int _studentsNeeded = 0;
  int _proposalsLessThan = 0;
  TextEditingController _studentsNeededController = TextEditingController();
  TextEditingController _proposalsLessThanController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            title: Text('Project Length', style: TextStyle(fontWeight: FontWeight.bold),),
            contentPadding: EdgeInsets.zero,
            subtitle: Column(
              children: <Widget>[
                RadioListTile<String>(
                  title: Text('Less than one month'),
                  value: 'Less than one month',
                  groupValue: _projectLength,
                  onChanged: (newValue) {
                    setState(() {
                      _projectLength = newValue!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text('1-3 months'),
                  value: '1-3 months',
                  groupValue: _projectLength,
                  onChanged: (newValue) {
                    setState(() {
                      _projectLength = newValue!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text('4-6 months'),
                  value: '4-6 months',
                  groupValue: _projectLength,
                  onChanged: (newValue) {
                    setState(() {
                      _projectLength = newValue!;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: Text('More than 6 months'),
                  value: 'More than 6 months',
                  groupValue: _projectLength,
                  onChanged: (newValue) {
                    setState(() {
                      _projectLength = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
          // Students Needed filter
          TextFieldWidget(
            hint: "Students need more",
            icon: BootstrapIcons.person_badge,
            iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
            textController: _studentsNeededController,
            inputType: TextInputType.number,
            errorText: null,
            onChanged: (value) {},
          ),
          SizedBox(height: 20,),
          TextFieldWidget(
            hint: "Proposals less than",
            icon: BootstrapIcons.file_text,
            iconColor: _themeStore.darkMode ? Colors.white70 : Colors.black54,
            textController: _studentsNeededController,
            inputType: TextInputType.number,
            errorText: null,
            onChanged: (value) {},
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  _clearFilters();
                },
                child: Text('Clear Filters'),
              ),
              RoundedButtonWidget(
                    buttonText: "Apply",
                    buttonColor: Theme.of(context).colorScheme.primary,
                    textColor: Colors.white,
                    onPressed: () {
                      DeviceUtils.hideKeyboard(context);
                    
                    },
                  ),
            ],
          )
        ],
      ),
    );
  }

  void _clearFilters() {
    setState(() {
      _projectLength = '';
      _studentsNeeded = 0;
      _proposalsLessThan = 0;
    });
  }
}
