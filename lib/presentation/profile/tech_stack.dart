import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class TechStackWiget extends StatefulWidget {
  @override
  State<TechStackWiget> createState() => _TechStackWigetState();
}

class _TechStackWigetState extends State<TechStackWiget> {
  final List<String> techstacks = [
    'Software Engineer',
    'Frontend Developer',
    'Backend Developer',
    'Full Stack Developer',
    'Mobile App Developer',
    'DevOps Engineer',
    'Data Scientist',
    'Machine Learning Engineer',
    'Game Developer',
    'Embedded Systems Developer',
    'QA Engineer/Test Automation Engineer',
    'Cloud Engineer',
    'Security Engineer',
    'Blockchain Developer',
    'UI/UX Designer'
  ];

  String? selectedValue;
  final textEditingController = new TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Your Techstack:",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        SizedBox(
          height: 10,
        ),
        DropdownButtonHideUnderline(
            child: DropdownButtonFormField2(
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
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            errorStyle: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.red, fontSize: 10),
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
          items: techstacks
              .map((item) => DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          value: selectedValue,
          validator: (value) {
            print(value);
            if (value == null) {
              return 'Please select gender.';
            }
            return null;
          },
          onChanged: (value) {
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
  }
}
