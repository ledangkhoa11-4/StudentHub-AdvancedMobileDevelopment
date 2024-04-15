import 'package:boilerplate/core/stores/form/form_student_profile_store.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/user/experience.dart';
import 'package:boilerplate/domain/entity/user/skillset.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class ProjectSkillsetWidget extends StatefulWidget {
  final FormStudentProfileStore formStore;
  final Key key4;
  final String? error;
  final int formIndex;

  const ProjectSkillsetWidget(
      {super.key,
      required this.key4,
      required this.formStore,
      this.error,
      required this.formIndex});

  @override
  State<ProjectSkillsetWidget> createState() => _SkillsetWidgetState();
}

class _SkillsetWidgetState extends State<ProjectSkillsetWidget> {
  final UserStore _userStore = getIt<UserStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return (Column(
          key: widget.key4,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            MultiSelectDropDown<Skillset>(
                hint: "Select your skillset",
                fieldBackgroundColor: Colors.transparent,
                borderColor: widget.error == null ? Colors.grey : Colors.red,
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
                selectedOptionIcon: Icon(
                  Icons.check_circle,
                  size: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
                onOptionSelected: (List<ValueItem<Skillset>> selectedOptions) {
                  List<Skillset> selected = selectedOptions
                      .where((element) => element.value != null)
                      .map((e) => e.value!)
                      .toList();

                  widget.formStore.setExperienceAtIndex(
                      Experience(
                        title: widget
                            .formStore.experiences[widget.formIndex]!.title,
                        startMonth: widget.formStore
                            .experiences[widget.formIndex]!.startMonth,
                        endMonth: widget
                            .formStore.experiences[widget.formIndex]!.endMonth,
                        description: widget.formStore
                            .experiences[widget.formIndex]!.description,
                        skillSets: selected,
                      ),
                      widget.formIndex);
                },
                options: _userStore.skillSets != null
                    ? _userStore.skillSets!
                        .map((e) => ValueItem(label: e.name, value: e))
                        .toList()
                    : [])
          ]));
    });
  }
}
