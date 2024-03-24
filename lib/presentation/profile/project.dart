import 'package:boilerplate/presentation/profile/date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:intl/intl.dart';

class ProjectWidget extends StatefulWidget {
  @override
  State<ProjectWidget> createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget> {
  final _formKey = GlobalKey<FormBuilderState>();
  final List<Widget> fields = [];
  String savedValue = '';
  final DateFormat formatter = DateFormat('MMM, yyyy');

  @override
  void initState() {
    savedValue = _formKey.currentState?.value.toString() ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    setState(() {
                      fields.add(NewTextField(
                        formKey: _formKey,
                        schoolname: 'schoolname_${fields.length}',
                        schoolyear: 'schoolyear_${fields.length}',
                        onDelete: () {
                          setState(() {
                            fields.removeAt(fields.length - 1);
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
  }
}

class NewTextField extends StatelessWidget {
  const NewTextField(
      {super.key,
      required this.schoolname,
      required this.schoolyear,
      required this.onDelete,
      required this.formKey});
  final String schoolname;
  final String schoolyear;
  final VoidCallback onDelete;
  final GlobalKey<FormBuilderState> formKey;

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('MMM, yyyy');

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
                    name: schoolname,
                    validator: FormBuilderValidators.required(),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        label: Text('Project name'),
                        errorStyle: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                                color: Theme.of(context).colorScheme.error,
                                fontSize: 10),
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey, strokeAlign: 0))),
                  ),
                  CustomDateRangePicker(
                    label: "Date",
                    name: schoolyear,
                    onSubmit: ({required range}) {
                      if (range != null &&
                          range.startDate != null &&
                          range.endDate != null) {
                        formKey.currentState!.patchValue({
                          '${schoolyear}':
                              '${formatter.format(range!.startDate!)} - ${formatter.format(range!.endDate!)}'
                        });
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FormBuilderTextField(
                    name: schoolname,
                    validator: FormBuilderValidators.required(),
                    maxLines: 4,
                    minLines: 1,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        label: Text('Description'),
                        errorStyle: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                                color: Theme.of(context).colorScheme.error,
                                fontSize: 10),
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.grey, strokeAlign: 0)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey, strokeAlign: 0))),
                  ),
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
  }
}
