import 'package:boilerplate/core/extensions/cap_extension.dart';
import 'package:boilerplate/core/stores/form/form_student_profile_store.dart';
import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/user/tech_stack.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TechStackWiget extends StatefulWidget {
  final FormStudentProfileStore formStore;

  const TechStackWiget({super.key, required this.formStore});

  @override
  State<TechStackWiget> createState() => _TechStackWigetState();
}

class _TechStackWigetState extends State<TechStackWiget> {
  TechStack? selectedValue;
  final textEditingController = new TextEditingController();
  final UserStore _userStore = getIt<UserStore>();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserStore _userStore = getIt<UserStore>();

    return Observer(builder: (context) {
      if (_userStore.user!.student != null &&
          _userStore.user!.student!.id != null &&
          _userStore.techstacks != null) {
        Future.delayed(Duration.zero, () async {
          setState(() {
            selectedValue = _userStore.techstacks!.firstWhere(
                (element) =>
                    element.id == _userStore.user!.student!.stechStackId,
                orElse: null);
            if (selectedValue != null) {
              widget.formStore.setTechStackId(selectedValue!.id);
            }
          });
        });
      }
      return (Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // _userStore.techstacks!= null ? startEditMode() : SizedBox.shrink()
          Text(
            "Your Techstack:",
            style: Theme.of(context).textTheme.labelLarge,
          ),
          SizedBox(
            height: 10,
          ),
          DropdownButtonHideUnderline(
              child: DropdownButtonFormField2<TechStack>(
            isExpanded: true,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            hint: Text(
              'Select your Techstack',
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).hintColor,
              ),
            ),
            decoration: InputDecoration(
              errorText: widget.formStore.formErrorStore.techStack,
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
              errorStyle: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: Colors.red, fontSize: 12),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.red)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.grey)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.grey)),
            ),
            items: _userStore.techstacks != null
                ? _userStore.techstacks!
                    .map((item) => DropdownMenuItem<TechStack>(
                          value: item,
                          child: Text(
                            item.name,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList()
                : [],
            value: selectedValue,
            onChanged: (value) {
              if (value != null) {
                widget.formStore.setTechStackId(value.id);
              }
              setState(() {
                selectedValue = value;
              });
            },
            buttonStyleData: const ButtonStyleData(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 20,
              width: 200,
            ),
            dropdownStyleData: const DropdownStyleData(
              maxHeight: 300,
            ),
            menuItemStyleData: const MenuItemStyleData(
              height: 40,
            ),
            dropdownSearchData: DropdownSearchData(
              searchMatchFn: (item, searchValue) {
                return item.value != null
                    ? item.value!.name.allInCaps.contains(searchValue.allInCaps)
                    : true;
              },
              searchController: textEditingController,
              searchInnerWidgetHeight: 50,
              searchInnerWidget: Container(
                height: 50,
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 4,
                  right: 8,
                  left: 8,
                ),
                child: TextFormField(
                  expands: true,
                  maxLines: null,
                  controller: textEditingController,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    hintText: 'Search for an item...',
                    hintStyle: const TextStyle(fontSize: 12),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),
              ),
            ),
            onMenuStateChange: (isOpen) {
              if (!isOpen) {
                textEditingController.clear();
              }
            },
          ))
        ],
      ));
    });
  }

  Widget startEditMode() {
    return SizedBox.shrink();
  }
}
