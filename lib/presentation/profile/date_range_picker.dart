import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CustomDateRangePicker extends StatefulWidget {
  const CustomDateRangePicker(
      {this.error,
      this.selectedRange = null,
      required this.label,
      required this.key,
      this.initialValue = "",
      required this.name,
      required this.onSubmit});

  final Key key;
  final String label;
  final String name;
  final Function({required PickerDateRange range}) onSubmit;
  final PickerDateRange? selectedRange;
  final String? error;
  final String initialValue;

  @override
  State<CustomDateRangePicker> createState() => _CustomDateRangePickerState();
}

class _CustomDateRangePickerState extends State<CustomDateRangePicker> {
  final DateTime _date = DateTime.now();
  DateRangePickerController _controller = DateRangePickerController();
  bool allowViewNavigation = true;

  @override
  void initState() {
    _controller.view = DateRangePickerView.year;
    print(widget.selectedRange);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return (FormBuilderTextField(
      key: widget.key,
      readOnly: true,
      name: widget.name,
      validator: FormBuilderValidators.required(),
      initialValue: widget.initialValue,
      onTap: () async {
        final DateTime? result = await showDialog<DateTime>(
            context: context,
            builder: (BuildContext context) {
              return Center(
                child: Theme(
                    data: theme,
                    child: SfDateRangePicker(
                      extendableRangeSelectionDirection:
                          ExtendableRangeSelectionDirection.both,
                      enablePastDates: true,
                      initialSelectedRange: widget.selectedRange,
                      minDate: DateTime(1950, 1, 1),
                      maxDate: DateTime(2050, 1, 1),
                      selectionTextStyle: TextStyle(color: Colors.white),
                      enableMultiView: true,
                      allowViewNavigation: false,
                      selectionMode:
                          DateRangePickerSelectionMode.extendableRange,
                      controller: _controller,
                      navigationDirection:
                          DateRangePickerNavigationDirection.vertical,
                      showActionButtons: true,
                      onCancel: () => Navigator.pop(context),
                      onSubmit: (obj) {
                        if (obj is PickerDateRange) {
                          widget.onSubmit(range: obj);
                        }
                        Navigator.pop(context);
                      },
                    )),
              );
            });
      },
      decoration: InputDecoration(
        errorText: widget.error,
          contentPadding: EdgeInsets.zero,
          label: Text(widget.label),
          errorStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Theme.of(context).colorScheme.error, fontSize: 0),
          floatingLabelAlignment: FloatingLabelAlignment.center,
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey))),
    ));
  }
}
