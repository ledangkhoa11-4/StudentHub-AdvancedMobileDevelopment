import 'package:boilerplate/core/stores/form/form_student_profile_store.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/user/language.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:uuid/uuid.dart';

class LanguageWidget extends StatefulWidget {
  final FormStudentProfileStore formStore;

  const LanguageWidget({super.key, required this.formStore});

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  final _formKey = GlobalKey<FormBuilderState>();
  final List<NewTextField> fields = [];
  String savedValue = '';
  final UserStore _userStore = getIt<UserStore>();
  bool isBind = false;

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
          _userStore.user!.student!.languages != null) {
        Future.delayed(Duration.zero, () async {
          setState(() {
            isBind = true;
          });
          setState(() {
            isBind = true;
            final needMore = _userStore.user!.student!.languages!.length - 1;
            if (_userStore.user!.student!.languages!.length > 0) {
              widget.formStore.setLanguageAtIndex(
                  ProfileLanguage(
                      languageName:
                          _userStore.user!.student!.languages![0].languageName,
                      level: _userStore.user!.student!.languages![0].level),
                  0);
            }
            for (int i = 1; i <= needMore; i++) {
              var uuid = Uuid();
              final id = uuid.v4();
              final index = widget.formStore.languages.length;
              widget.formStore.setAddLanguage(ProfileLanguage(
                  languageName:
                      _userStore.user!.student!.languages![i].languageName,
                  level: _userStore.user!.student!.languages![i].level));
              fields.add(NewTextField(
                id: id,
                formIndex: index,
                formstore: widget.formStore,
                initialValue1:
                    _userStore.user!.student!.languages![i].languageName,
                initialValue2: _userStore.user!.student!.languages![i].level,
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
                    widget.formStore.setRemoveLanguage(index);
                  });
                },
              ));
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
                  "Fluent Language:",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                IconButton.outlined(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.grey)),
                    onPressed: () {
                      var uuid = Uuid();
                      final id = uuid.v4();
                      final index = widget.formStore.languages.length;
                      widget.formStore.setAddLanguage(
                          ProfileLanguage(languageName: "", level: ""));
                      setState(() {
                        fields.add(NewTextField(
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
                              widget.formStore.setRemoveLanguage(index);
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: FormBuilderTextField(
                            name: 'language1',
                            initialValue: _userStore
                                .user?.student?.languages?[0].languageName,
                            onChanged: (value) {
                              widget.formStore.setLanguageAtIndex(
                                  ProfileLanguage(
                                      languageName: value ?? "",
                                      level:
                                          widget.formStore.languages[0]!.level),
                                  0);
                            },
                            decoration: InputDecoration(
                                errorText:
                                    widget.formStore.formErrorStore.languages !=
                                                null &&
                                            widget
                                                .formStore
                                                .formErrorStore
                                                .languages![0]
                                                .languageName
                                                .isNotEmpty
                                        ? widget.formStore.formErrorStore
                                            .languages![0].languageName
                                        : null,
                                contentPadding: EdgeInsets.zero,
                                label: Text('Language'),
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
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 1,
                          child: FormBuilderTextField(
                            name: 'level1',
                            initialValue:
                                _userStore.user?.student?.languages?[0].level,
                            onChanged: (value) {
                              widget.formStore.setLanguageAtIndex(
                                  ProfileLanguage(
                                      languageName: widget
                                          .formStore.languages[0]!.languageName,
                                      level: value ?? ""),
                                  0);
                            },
                            decoration: InputDecoration(
                                errorText:
                                    widget.formStore.formErrorStore.languages !=
                                                null &&
                                            widget.formStore.formErrorStore
                                                .languages![0].level.isNotEmpty
                                        ? widget.formStore.formErrorStore
                                            .languages![0].level
                                        : null,
                                contentPadding: EdgeInsets.zero,
                                label: Text('Level'),
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
                        ),
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
      required this.initialValue1,
      required this.initialValue2,
      required this.formstore,
      required this.onDelete,
      required this.key1,
      required this.key2,
      required this.name1,
      required this.name2});
  final String id;
  final int formIndex;
  final Key key1;
  final Key key2;
  final String name1;
  final String name2;
  final FormStudentProfileStore formstore;
  final VoidCallback onDelete;
  final String initialValue1;
  final String initialValue2;

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Observer(builder: (context) {
                      return FormBuilderTextField(
                        key: key1,
                        name: name1,
                        validator: FormBuilderValidators.required(),
                        initialValue: initialValue1,
                        onChanged: (value) {
                          formstore.setLanguageAtIndex(
                              ProfileLanguage(
                                  languageName: value ?? "",
                                  level: formstore.languages[formIndex]!.level),
                              formIndex);
                        },
                        decoration: InputDecoration(
                            errorText:
                                formstore.formErrorStore.languages != null &&
                                        formstore.formErrorStore.languages!
                                                .length >=
                                            formIndex + 1 &&
                                        formstore
                                            .formErrorStore
                                            .languages![formIndex]
                                            .languageName
                                            .isNotEmpty
                                    ? formstore.formErrorStore
                                        .languages![formIndex].languageName
                                    : null,
                            contentPadding: EdgeInsets.zero,
                            label: Text('Language'),
                            errorStyle: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                    fontSize: 0),
                            floatingLabelAlignment:
                                FloatingLabelAlignment.center,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey, strokeAlign: 0))),
                      );
                    }),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: Observer(builder: (context) {
                      return FormBuilderTextField(
                        key: key2,
                        name: name2,
                        validator: FormBuilderValidators.required(),
                        initialValue: initialValue2,
                        onChanged: (value) {
                          formstore.setLanguageAtIndex(
                              ProfileLanguage(
                                  languageName:
                                      formstore.languages[formIndex]!.level,
                                  level: value ?? ""),
                              formIndex);
                        },
                        decoration: InputDecoration(
                            errorText:
                                formstore.formErrorStore.languages != null &&
                                        formstore.formErrorStore.languages!
                                                .length >=
                                            formIndex + 1 &&
                                        formstore
                                            .formErrorStore
                                            .languages![formIndex]
                                            .level
                                            .isNotEmpty
                                    ? formstore.formErrorStore
                                        .languages![formIndex].level
                                    : null,
                            contentPadding: EdgeInsets.zero,
                            label: Text('Level'),
                            errorStyle: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: Theme.of(context).colorScheme.error,
                                    fontSize: 0),
                            floatingLabelAlignment:
                                FloatingLabelAlignment.center,
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.grey, strokeAlign: 0))),
                      );
                    }),
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
