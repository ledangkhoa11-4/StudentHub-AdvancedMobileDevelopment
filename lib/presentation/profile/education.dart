import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class EducationWidget extends StatefulWidget {
  @override
  State<EducationWidget> createState() => _EducationWidgetState();
}

class _EducationWidgetState extends State<EducationWidget> {
  final _formKey = GlobalKey<FormBuilderState>();
  final List<Widget> fields = [];
  String savedValue = '';

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
                "Education:",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              IconButton.outlined(
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey)),
                  onPressed: () {
                    setState(() {
                      fields.add(NewTextField(
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
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            label: Text('School name'),
                            errorStyle: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                    fontSize: 10),
                            floatingLabelAlignment:
                                FloatingLabelAlignment.center,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey, strokeAlign: 0))),
                      ),
                      FormBuilderTextField(
                        name: 'schoolyear',
                        validator: FormBuilderValidators.required(),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.zero,
                            label: Text('School year'),
                            errorStyle: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                    fontSize: 10),
                            floatingLabelAlignment:
                                FloatingLabelAlignment.center,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey))),
                      )
                    ],
                  ),
                ),
                ...fields,
              ],
            ),
          ),
        ]));
  }
}

class NewTextField extends StatelessWidget {
  const NewTextField({
    super.key,
    required this.schoolname,
    required this.schoolyear,
    required this.onDelete,
  });
  final String schoolname;
  final String schoolyear;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
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
                        label: Text('School name'),
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
                  FormBuilderTextField(
                    name: schoolyear,
                    validator: FormBuilderValidators.required(),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        label: Text('School year'),
                        errorStyle: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                                color: Theme.of(context).colorScheme.error,
                                fontSize: 10),
                        floatingLabelAlignment: FloatingLabelAlignment.center,
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
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
  }
}
