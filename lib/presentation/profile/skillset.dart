import 'package:boilerplate/core/stores/form/form_student_profile_store.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/user/skillset.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class SkillsetWidget extends StatefulWidget {
  final FormStudentProfileStore formStore;

  const SkillsetWidget({super.key, required this.formStore});

  @override
  State<SkillsetWidget> createState() => _SkillsetWidgetState();
}

class _SkillsetWidgetState extends State<SkillsetWidget> {
  final UserStore _userStore = getIt<UserStore>();

  List<ValueItem<int>> selectedOptions = [];
  List<ValueItem<int>> optionsList = [];
  bool isBind = false;
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (_userStore.skillSets != null) {
        Future.delayed(Duration.zero, () async {
          setState(() {
            optionsList = _userStore.skillSets!
                .map((e) => ValueItem(label: e.name, value: e.id))
                .toList();
          });
        });
      }
      if (!isBind &&
          _userStore.user!.student != null &&
          _userStore.user!.student!.id != null &&
          _userStore.skillSets != null) {
        Future.delayed(Duration.zero, () async {
          setState(() {
            isBind = true;
            selectedOptions = optionsList
                .where((option) => _userStore.user!.student!.skillSets!
                    .any((element) => element.id == option.value))
                .toList();
            if (selectedOptions.length > 0) {
              widget.formStore
                  .setSkillsets(selectedOptions.map((e) => e.value!).toList());
            }
          });
        });
      }
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
            MultiSelectDropDown<int>(
                hint: "Select your skillset",
                fieldBackgroundColor: Colors.transparent,
                borderColor: widget.formStore.formErrorStore.skillset == null
                    ? Colors.grey
                    : Colors.red,
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
                selectedOptions: selectedOptions,
                selectedOptionIcon: Icon(
                  Icons.check_circle,
                  size: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onOptionSelected: (List<ValueItem<int>> selectedOptions) {
                  List<int> selected = selectedOptions
                      .where((element) => element.value != null)
                      .map((e) => e.value!)
                      .toList();
                  if (selected.length > 0 ||
                      widget.formStore.skillSets.length > 0) {
                    widget.formStore.setSkillsets(selected);
                  }
                },
                options: optionsList)
          ]));
    });
  }
}
