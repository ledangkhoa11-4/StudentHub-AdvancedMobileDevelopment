import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LanguageWidget extends StatefulWidget {
  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
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
                "Fluent Language:",
                style: Theme.of(context).textTheme.labelLarge,
              ),
              IconButton.outlined(
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.grey)),
                  onPressed: () {
                    setState(() {
                      fields.add(NewTextField(
                        name: 'name_${fields.length}',
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
          Transform.translate(
            offset: Offset(0, -20),
            child: FormBuilder(
              key: _formKey,
              clearValueOnUnregister: true,
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: 'name',
                    validator: FormBuilderValidators.required(),
                    decoration: InputDecoration(
                        label: Text('Language'),
                        errorStyle: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                                color: Theme.of(context).colorScheme.error,
                                fontSize: 10),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                  ),
                  ...fields,
                ],
              ),
            ),
          )
        ]));
  }
}

class NewTextField extends StatelessWidget {
  const NewTextField({
    super.key,
    required this.name,
    required this.onDelete,
  });
  final String name;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: FormBuilderTextField(
              name: name,
              validator: FormBuilderValidators.minLength(4),
              decoration: InputDecoration(
                  label: Text('Language'),
                  errorStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.error, fontSize: 10),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
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
