// import 'package:boilerplate/presentation/9_schedule_for_interview/components/models.dart';
import 'dart:math';

import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/domain/entity/interview/interview.dart';
import 'package:boilerplate/presentation/home/store/theme/theme_store.dart';
import 'package:boilerplate/presentation/toast/toast.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';
import 'package:moment_dart/moment_dart.dart';

class ScheduleBottomSheet extends StatefulWidget {
  final Function(String, DateTime, DateTime) onMeetingCreated;
  final Interview? interviewEdit;
  ScheduleBottomSheet({required this.onMeetingCreated, this.interviewEdit});
  @override
  _ScheduleBottomSheetState createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  late String title;
  late DateTime startTime;
  late DateTime endTime;
  TextEditingController _titleController = TextEditingController();
  final ThemeStore _themeStore = getIt<ThemeStore>();

  @override
  void initState() {
    super.initState();
    title = widget.interviewEdit != null ? widget.interviewEdit!.title : '';
    _titleController.text =
        widget.interviewEdit != null ? widget.interviewEdit!.title : '';
    startTime = widget.interviewEdit != null
        ? Moment(widget.interviewEdit!.startTime).toLocal()
        : DateTime.now();
    endTime = widget.interviewEdit != null
        ? Moment(widget.interviewEdit!.endTime).toLocal()
        : DateTime.now().add(Duration(hours: 1));
  }

  void _handleScheduleMeeting() {
    if (endTime.isAfter(startTime) && !title.isEmpty) {
      widget.onMeetingCreated(title, startTime, endTime);
      Navigator.pop(context); // Close the bottom sheet
    } else if (title.isEmpty) {
      ToastHelper.error("Title must not be empty");
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(AppLocalizations.of(context).translate('err')),
            content:
                Text(AppLocalizations.of(context).translate('end_time_alert')),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text(AppLocalizations.of(context).translate('ok')),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Set width to full width
      padding: EdgeInsets.only(
        top: 16.0,
        left: 16,
        right: 16,
        bottom: max(MediaQuery.of(context).viewInsets.bottom, 16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            widget.interviewEdit != null
                ? AppLocalizations.of(context).translate('resche_inter')
                : AppLocalizations.of(context).translate('sche_inter'),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Text(AppLocalizations.of(context).translate('Title') + ': ',
              style: Theme.of(context).textTheme.labelSmall),
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              // labelText: 'Title',
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)),
              focusedErrorBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              errorBorder:
                  OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
            ),
            onChanged: (value) {
              setState(() {
                title = value; // Update title when user types
              });
            },
          ),
          SizedBox(height: 16.0),
          Text(AppLocalizations.of(context).translate('start_time'),
              style: Theme.of(context).textTheme.labelSmall),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                BootstrapIcons.calendar2_date, // Calendar icon
                color: _themeStore.darkMode ? Colors.white : Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: startTime,
                    firstDate: startTime.isBefore(DateTime.now())
                        ? startTime
                        : DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null) {
                    setState(() {
                      startTime = picked;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.onBackground,
                ),
                child: Text(
                  '${startTime.year}-${startTime.month}-${startTime.day}',
                ),
              ),
              SizedBox(width: 8.0),
              Icon(
                BootstrapIcons.clock_history, // Calendar icon
                color: _themeStore.darkMode ? Colors.white : Colors.black,
              ),
              SizedBox(width: 8.0),
              ElevatedButton(
                onPressed: () async {
                  final TimeOfDay? timePicked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(startTime),
                  );
                  if (timePicked != null) {
                    setState(() {
                      startTime = DateTime(
                        startTime.year,
                        startTime.month,
                        startTime.day,
                        timePicked.hour,
                        timePicked.minute,
                      );
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.onBackground,
                ),
                child: Text(
                    '${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}'),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Text(AppLocalizations.of(context).translate('end_time'),
              style: Theme.of(context).textTheme.labelSmall),
          SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                BootstrapIcons.calendar2_date, // Calendar icon
                color: _themeStore.darkMode ? Colors.white : Colors.black,
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: endTime,
                    firstDate: endTime.isBefore(DateTime.now())
                        ? endTime
                        : DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null) {
                    setState(() {
                      endTime = picked;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.onBackground,
                ),
                child: Text(
                  '${endTime.year}-${endTime.month}-${endTime.day}',
                ),
              ),
              SizedBox(width: 8.0),
              Icon(
                BootstrapIcons.clock_history, // Calendar icon
                color: _themeStore.darkMode ? Colors.white : Colors.black,
              ),
              SizedBox(width: 8.0),
              ElevatedButton(
                onPressed: () async {
                  final TimeOfDay? timePicked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(endTime),
                  );
                  if (timePicked != null) {
                    setState(() {
                      endTime = DateTime(
                        endTime.year,
                        endTime.month,
                        endTime.day,
                        timePicked.hour,
                        timePicked.minute,
                      );
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.onBackground,
                ),
                child: Text(
                    '${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}'),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Close the bottom sheet
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _themeStore.darkMode
                      ? const Color.fromARGB(255, 102, 90, 90)
                      : Colors.white,
                ),
                child: Text(AppLocalizations.of(context).translate('cancel')),
              ),
              ElevatedButton(
                onPressed: _handleScheduleMeeting,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _themeStore.darkMode
                      ? const Color.fromARGB(255, 102, 90, 90)
                      : Colors.white,
                ),
                child: Text(AppLocalizations.of(context).translate('send_i')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
