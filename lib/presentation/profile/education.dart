import 'package:boilerplate/core/stores/form/form_student_profile_store.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/user/education.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:boilerplate/presentation/profile/date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:uuid/uuid.dart';

class EducationWidget extends StatefulWidget {
  final FormStudentProfileStore formStore;

  const EducationWidget({super.key, required this.formStore});

  @override
  State<EducationWidget> createState() => _EducationWidgetState();
}

class _EducationWidgetState extends State<EducationWidget> {
  final _formKey = GlobalKey<FormBuilderState>();
  final List<NewTextField> fields = [];
  String savedValue = '';
  final DateFormat formatter = DateFormat('MMM, yyyy');
  bool isBind = false;
  final UserStore _userStore = getIt<UserStore>();

  @override
  void initState() {
    savedValue = _formKey.currentState?.value.toString() ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (!isBind &&
          _userStore.user!.student != null &&
          _userStore.user!.student!.educations != null) {
        Future.delayed(Duration.zero, () async {
          setState(() {
            isBind = true;
          });
          setState(() {
            isBind = true;
            final needMore = _userStore.user!.student!.educations!.length - 1;
            if (_userStore.user!.student!.educations!.length > 0) {
              widget.formStore.setEducationAtIndex(
                  Education(
                    schoolName:
                        _userStore.user!.student!.educations![0].schoolName,
                    startYear:
                        _userStore.user!.student!.educations![0].startYear,
                    endYear: _userStore.user!.student!.educations![0].endYear,
                  ),
                  0);
            }
            for (int i = 1; i <= needMore; i++) {
              var uuid = Uuid();
              final id = uuid.v4();
              final index = widget.formStore.educations.length;
              widget.formStore.setAddEducation(Education(
                  schoolName:
                      _userStore.user!.student!.educations![i].schoolName,
                  startYear: _userStore.user!.student!.educations![i].startYear,
                  endYear: _userStore.user!.student!.educations![i].endYear));
              setState(() {
                fields.add(NewTextField(
                  formKey: _formKey,
                  id: id,
                  formIndex: index,
                  formstore: widget.formStore,
                  initialValue1:
                      _userStore.user!.student!.educations![i].schoolName,
                  initialValue2:
                      '${_userStore.user!.student!.educations![i].startYear} - ${_userStore.user!.student!.educations![i].endYear}',
                  key1: UniqueKey(),
                  key2: UniqueKey(),
                  name1: UniqueKey().toString(),
                  name2: UniqueKey().toString(),
                  onDelete: () {
                    setState(() {
                      final element =
                          fields.firstWhere((element) => element.id == id);
                      fields.remove(element);
                      _formKey.currentState!.save();
                      widget.formStore.setRemoveEducation(index);
                    });
                  },
                ));
              });
            }
          });
        });
      }

      return (Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Education:",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                IconButton.outlined(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.grey)),
                    onPressed: () {
                      var uuid = Uuid();
                      final id = uuid.v4();
                      final index = widget.formStore.educations.length;
                      widget.formStore.setAddEducation(
                          Education(schoolName: "", startYear: 0, endYear: 0));
                      setState(() {
                        fields.add(NewTextField(
                          formKey: _formKey,
                          id: id,
                          formIndex: index,
                          formstore: widget.formStore,
                          initialValue1: "",
                          initialValue2: "",
                          key1: UniqueKey(),
                          key2: UniqueKey(),
                          name1: UniqueKey().toString(),
                          name2: UniqueKey().toString(),
                          onDelete: () {
                            setState(() {
                              final element = fields
                                  .firstWhere((element) => element.id == id);
                              fields.remove(element);
                              _formKey.currentState!.save();
                              widget.formStore.setRemoveEducation(index);
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
                  Container(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey)),
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'schoolname',
                          validator: FormBuilderValidators.required(),
                          initialValue: _userStore
                              .user!.student!.educations![0].schoolName,
                          onChanged: (value) {
                            widget.formStore.setEducationAtIndex(
                                Education(
                                  schoolName: value ?? "",
                                  startYear:
                                      widget.formStore.educations[0]!.startYear,
                                  endYear:
                                      widget.formStore.educations[0]!.endYear,
                                ),
                                0);
                          },
                          decoration: InputDecoration(
                              errorText:
                                  widget.formStore.formErrorStore.educations !=
                                              null &&
                                          widget
                                              .formStore
                                              .formErrorStore
                                              .educations![0]
                                              .schoolName
                                              .isNotEmpty
                                      ? widget.formStore.formErrorStore
                                          .educations![0].schoolName
                                      : null,
                              contentPadding: EdgeInsets.zero,
                              label: Text('School name'),
                              errorStyle: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.error,
                                      fontSize: 0),
                              floatingLabelAlignment:
                                  FloatingLabelAlignment.center,
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, strokeAlign: 0))),
                        ),
                        CustomDateRangePicker(
                          key: UniqueKey(),
                          name: 'schoolYear',
                          label: "School Year",
                          initialValue:
                              '${_userStore.user!.student!.educations![0].startYear} - ${_userStore.user!.student!.educations![0].endYear}',
                          error: widget.formStore.formErrorStore.educations !=
                                      null &&
                                  (widget.formStore.formErrorStore
                                              .educations![0].startYear ==
                                          1 ||
                                      widget.formStore.formErrorStore
                                              .educations![0].endYear ==
                                          1)
                              ? "error"
                              : null,
                          onSubmit: ({required range}) {
                            if (range.startDate != null &&
                                range.endDate != null) {
                              widget.formStore.setEducationAtIndex(
                                  Education(
                                      schoolName: widget
                                          .formStore.educations[0]!.schoolName,
                                      startYear: range.startDate!.year,
                                      endYear: range.endDate!.year),
                                  0);
                              _formKey.currentState!.patchValue({
                                'schoolYear':
                                    '${range.startDate!.year} - ${range.endDate!.year}'
                              });
                            }
                          },
                        )
                      ],
                    ),
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
      required this.formstore,
      required this.initialValue1,
      required this.initialValue2,
      required this.onDelete,
      required this.key1,
      required this.key2,
      required this.name1,
      required this.name2,
      required this.formKey});

  final String id;
  final int formIndex;
  final Key key1;
  final Key key2;
  final String name1;
  final String name2;
  final FormStudentProfileStore formstore;
  final VoidCallback onDelete;
  final GlobalKey<FormBuilderState> formKey;
  final String initialValue1;
  final String initialValue2;

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('yyyy');

    return Observer(builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Row(
          children: [
            Expanded(
              child: Container(
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
                      initialValue: initialValue1,
                      onChanged: (value) {
                        formstore.setEducationAtIndex(
                            Education(
                              schoolName: value ?? "",
                              startYear:
                                  formstore.educations[formIndex]!.startYear,
                              endYear: formstore.educations[formIndex]!.endYear,
                            ),
                            formIndex);
                      },
                      decoration: InputDecoration(
                          errorText: formstore.formErrorStore.educations !=
                                      null &&
                                  formstore.formErrorStore.educations!.length >=
                                      formIndex + 1 &&
                                  formstore
                                      .formErrorStore
                                      .educations![formIndex]
                                      .schoolName
                                      .isNotEmpty
                              ? formstore.formErrorStore.educations![formIndex]
                                  .schoolName
                              : null,
                          contentPadding: EdgeInsets.zero,
                          label: Text('School name'),
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
                      label: "School year",
                      initialValue: initialValue2,
                      key: key2,
                      name: name2,
                      error: formstore.formErrorStore.educations != null &&
                              formstore.formErrorStore.educations!.length >=
                                  formIndex + 1 &&
                              (formstore.formErrorStore.educations![formIndex]
                                          .startYear ==
                                      1 ||
                                  formstore.formErrorStore
                                          .educations![formIndex].endYear ==
                                      1)
                          ? "error"
                          : null,
                      onSubmit: ({required range}) {
                        if (range.startDate != null && range.endDate != null) {
                          formstore.setEducationAtIndex(
                              Education(
                                  schoolName: formstore
                                      .educations[formIndex]!.schoolName,
                                  startYear: range.startDate!.year,
                                  endYear: range.endDate!.year),
                              formIndex);
                          formKey.currentState!.patchValue({
                            '${name2}':
                                '${formatter.format(range.startDate!)} - ${formatter.format(range.endDate!)}'
                          });
                        }
                      },
                    )
                  ],
                ),
              ),
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
    });
  }
}
