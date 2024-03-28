import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class SkillsetWidget extends StatefulWidget {
  @override
  State<SkillsetWidget> createState() => _SkillsetWidgetState();
}

class _SkillsetWidgetState extends State<SkillsetWidget> {
  final List<String> skillsets = [
    "React.js",
    "Angular",
    "Vue.js",
    "Flutter",
    "React Native",
    "Xamarin",
    "Electron",
    "Qt",
    ".NET Core",
    "Node.js"
  ];

  @override
  Widget build(BuildContext context) {
    return (Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Your Skillset:",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          SizedBox(
            height: 10,
          ),
          MultiSelectDropDown(
              hint: "Select your skillset",
              fieldBackgroundColor: Colors.transparent,
              borderColor: Colors.grey,
              borderWidth: 1,
              hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).hintColor,
              ),
              selectionType: SelectionType.multi,
              chipConfig: ChipConfig(
                  wrapType: WrapType.wrap,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  runSpacing: 0,
                  spacing: 4,
                  labelStyle: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 10, color: Colors.white)),
              dropdownHeight: 300,
              optionTextStyle: const TextStyle(fontSize: 14),
              selectedOptionIcon:  Icon(Icons.check_circle, size: 20, color: Theme.of(context).colorScheme.primary,),
              onOptionSelected: (List<ValueItem> selectedOptions) {},
              options: generateOptions())
        ]));
  }

  List<ValueItem> generateOptions() {
    List<ValueItem> options = [];
    for (int i = 0; i < skillsets.length; i++) {
      options.add(ValueItem(label: skillsets[i], value: i.toString()));
    }
    return options;
  }
}
