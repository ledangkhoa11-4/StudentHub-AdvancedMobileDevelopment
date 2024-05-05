import 'package:boilerplate/core/stores/form/form_student_profile_store.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/user/experience.dart';
import 'package:boilerplate/domain/entity/user/skillset.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import '../../utils/locale/app_localization.dart';
class ProjectSkillsetWidget extends StatefulWidget {
  final FormStudentProfileStore formStore;
  final Key key4;
  final String? error;
  final int formIndex;
  final List<Skillset> selectedSkillsets;

  const ProjectSkillsetWidget(
      {super.key,
      required this.key4,
      required this.formStore,
      this.error,
      required this.formIndex,
      required this.selectedSkillsets});

  @override
  State<ProjectSkillsetWidget> createState() => _SkillsetWidgetState();
}

class _SkillsetWidgetState extends State<ProjectSkillsetWidget> {
  final UserStore _userStore = getIt<UserStore>();

  List<ValueItem<Skillset>> selectedOptions = [];
  List<ValueItem<Skillset>> optionsList = [];
  bool isBind = false;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (_userStore.skillSets != null && optionsList.length == 0) {
        Future.delayed(Duration.zero, () async {
          setState(() {
            optionsList = _userStore.skillSets!
                .map((e) => ValueItem(label: e.name, value: e))
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
          });
          setState(() {
            selectedOptions = optionsList
                .where((option) => widget.selectedSkillsets
                    .any((element) => element.id == option.value!.id))
                .toList();
            if (selectedOptions.length > 0) {
              widget.formStore.setExperienceAtIndex(
                  Experience(
                    title:
                        widget.formStore.experiences[widget.formIndex]!.title,
                    startMonth: widget
                        .formStore.experiences[widget.formIndex]!.startMonth,
                    endMonth: widget
                        .formStore.experiences[widget.formIndex]!.endMonth,
                    description: widget
                        .formStore.experiences[widget.formIndex]!.description,
                    skillSets: widget.selectedSkillsets,
                  ),
                  widget.formIndex);
            }
          });
        });
      }
      return (Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            MultiSelectDropDown<Skillset>(
              key: widget.key4,
              hint: AppLocalizations.of(context).translate('sel_skill'),
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
                      title:
                          widget.formStore.experiences[widget.formIndex]!.title,
                      startMonth: widget
                          .formStore.experiences[widget.formIndex]!.startMonth,
                      endMonth: widget
                          .formStore.experiences[widget.formIndex]!.endMonth,
                      description: widget
                          .formStore.experiences[widget.formIndex]!.description,
                      skillSets: selected,
                    ),
                    widget.formIndex);
              },
              options: optionsList,
              selectedOptions: selectedOptions,
            )
          ]));
    });
  }
}
