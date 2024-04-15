import 'package:boilerplate/core/stores/form/form_student_profile_store.dart';
import 'package:boilerplate/domain/entity/user/experience.dart';
import 'package:boilerplate/presentation/profile/date_range_picker.dart';
import 'package:boilerplate/presentation/profile/project_skillset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

class ProjectWidget extends StatefulWidget {
  final FormStudentProfileStore formStore;

  const ProjectWidget({super.key, required this.formStore});
  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  final _formKey = GlobalKey<FormBuilderState>();
  final List<NewTextField> fields = [];
  String savedValue = '';
  final DateFormat formatter = DateFormat('MM-yyyy');

  @override
  void initState() {
    savedValue = _formKey.currentState?.value.toString() ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return (Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Projects:",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                IconButton.outlined(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.grey)),
                    onPressed: () {
                      var uuid = Uuid();
                      final id = uuid.v4();
                      final index = widget.formStore.experiences.length;
                      widget.formStore.setAddExperience(Experience(
                          title: "",
                          description: "",
                          startMonth: "",
                          endMonth: "",
                          skillSets: []));
                      setState(() {
                        fields.add(NewTextField(
                          id: id,
                          formIndex: index,
                          formKey: _formKey,
                          formStore: widget.formStore,
                          key1: UniqueKey(),
                          key2: UniqueKey(),
                          key3: UniqueKey(),
                          key4: UniqueKey(),
                          name1: UniqueKey().toString(),
                          name2: UniqueKey().toString(),
                          name3: UniqueKey().toString(),
                          onDelete: () {
                            setState(() {
                              final element = fields
                                  .firstWhere((element) => element.id == id);
                              fields.remove(element);
                              _formKey.currentState!.save();
                              if (widget.formStore.formErrorStore.experiences !=
                                      null &&
                                  widget.formStore.formErrorStore.experiences!
                                          .length >=
                                      index + 1) {
                                widget.formStore.setRemoveExperience(index);
                              }
                            });
                          },
                        ));
                      });
                    },
                    icon: Icon(
                      Icons.add,
                    ))
              ],
            ),
            FormBuilder(
              key: _formKey,
              clearValueOnUnregister: true,
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  ...fields,
                ],
              ),
            ),
          ]));
    });
  }
}

class NewTextField extends StatelessWidget {
  const NewTextField(
      {super.key,
      required this.id,
      required this.formIndex,
      required this.formStore,
      required this.key1,
      required this.key2,
      required this.key3,
      required this.key4,
      required this.name1,
      required this.name2,
      required this.name3,
      required this.onDelete,
      required this.formKey});

  final String id;
  final formIndex;
  final FormStudentProfileStore formStore;
  final Key key1;
  final Key key2;
  final Key key3;
  final Key key4;
  final String name1;
  final String name2;
  final String name3;
  final VoidCallback onDelete;
  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('MM-yyyy');

    return Padding(
      key: key,
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: Observer(builder: (context) {
              return Container(
                margin: EdgeInsets.only(top: 10),
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.grey)),
                child: Column(
                  children: [
                    FormBuilderTextField(
                      key: key1,
                      name: name1,
                      validator: FormBuilderValidators.required(),
                      onChanged: (value) {
                        formStore.setExperienceAtIndex(
                            Experience(
                              title: value ?? "",
                              startMonth:
                                  formStore.experiences[formIndex]!.startMonth,
                              endMonth:
                                  formStore.experiences[formIndex]!.endMonth,
                              description:
                                  formStore.experiences[formIndex]!.description,
                              skillSets:
                                  formStore.experiences[formIndex]!.skillSets,
                            ),
                            formIndex);
                      },
                      decoration: InputDecoration(
                          errorText:
                              formStore.formErrorStore.experiences != null &&
                                      formStore.formErrorStore.experiences!
                                              .length >=
                                          formIndex + 1 &&
                                      formStore
                                          .formErrorStore
                                          .experiences![formIndex]
                                          .title
                                          .isNotEmpty
                                  ? "errors"
                                  : null,
                          contentPadding: EdgeInsets.zero,
                          label: Text('Project name'),
                          errorStyle: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.error,
                                  fontSize: 0),
                          floatingLabelAlignment: FloatingLabelAlignment.center,
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey, strokeAlign: 0))),
                    ),
                    CustomDateRangePicker(
                      key: key2,
                      name: name2,
                      label: "Date",
                      error: formStore.formErrorStore.experiences != null &&
                              formStore.formErrorStore.experiences!.length >=
                                  formIndex + 1 &&
                              (!formStore.formErrorStore.experiences![formIndex]
                                      .startMonth.isEmpty ||
                                  !formStore.formErrorStore
                                      .experiences![formIndex].endMonth.isEmpty)
                          ? "error"
                          : null,
                      onSubmit: ({required range}) {
                        if (range != null &&
                            range.startDate != null &&
                            range.endDate != null) {
                          formStore.setExperienceAtIndex(
                              Experience(
                                title: formStore.experiences[formIndex]!.title,
                                startMonth:
                                    '${formatter.format(range!.startDate!)}',
                                endMonth:
                                    '${formatter.format(range!.endDate!)}',
                                description: formStore
                                    .experiences[formIndex]!.description,
                                skillSets:
                                    formStore.experiences[formIndex]!.skillSets,
                              ),
                              formIndex);
                          formKey.currentState!.patchValue({
                            '${name2}':
                                '${formatter.format(range!.startDate!)} - ${formatter.format(range!.endDate!)}'
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    FormBuilderTextField(
                      key: key3,
                      name: name3,
                      validator: FormBuilderValidators.required(),
                      maxLines: 4,
                      minLines: 1,
                      onChanged: (value) {
                        formStore.setExperienceAtIndex(
                            Experience(
                              title: formStore.experiences[formIndex]!.title,
                              startMonth:
                                  formStore.experiences[formIndex]!.startMonth,
                              endMonth:
                                  formStore.experiences[formIndex]!.endMonth,
                              description: value ?? "",
                              skillSets:
                                  formStore.experiences[formIndex]!.skillSets,
                            ),
                            formIndex);
                      },
                      decoration: InputDecoration(
                          errorText:
                              formStore.formErrorStore.experiences != null &&
                                      formStore.formErrorStore.experiences!
                                              .length >=
                                          formIndex + 1 &&
                                      formStore
                                          .formErrorStore
                                          .experiences![formIndex]
                                          .description
                                          .isNotEmpty
                                  ? "errors"
                                  : null,
                          contentPadding: EdgeInsets.all(10),
                          label: Text('Description'),
                          errorStyle: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(
                                  color: Theme.of(context).colorScheme.error,
                                  fontSize: 0),
                          floatingLabelAlignment: FloatingLabelAlignment.center,
                          errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.red,
                                strokeAlign: 0,
                              )),
                          focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.red,
                                strokeAlign: 0,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                strokeAlign: 0,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                  color: Colors.grey, strokeAlign: 0))),
                    ),
                    ProjectSkillsetWidget(
                      key4: key4,
                      formStore: formStore,
                      formIndex: formIndex,
                      error: formStore.formErrorStore.experiences != null &&
                              formStore.formErrorStore.experiences!.length >=
                                  formIndex + 1 &&
                              formStore.formErrorStore.experiences![formIndex]
                                      .skillSets.length <=
                                  0
                          ? "errors"
                          : null,
                    )
                  ],
                ),
              );
            }),
          ),
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: () {
              onDelete();
            },
          ),
        ],
      ),
    );
  }
}
