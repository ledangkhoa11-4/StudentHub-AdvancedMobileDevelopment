import 'package:flutter/material.dart';
import 'package:boilerplate/presentation/9_schedule_for_interview/components/models.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';

class ReScheduleBottomSheet extends StatefulWidget {
  final Meeting meeting;
  final Function(Meeting) onMeetingSchedule;

  ReScheduleBottomSheet({
    required this.meeting,
    required this.onMeetingSchedule,
  });

  @override
  _ReScheduleBottomSheetState createState() => _ReScheduleBottomSheetState();
}

class _ReScheduleBottomSheetState extends State<ReScheduleBottomSheet> {
  late DateTime startTime;
  late DateTime endTime;
  late String title;
  TextEditingController _titleController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.meeting.title);
    title = widget.meeting.title;
    startTime = widget.meeting.startTime;
    endTime = widget.meeting.endTime;
  }

  void _handleScheduleMeeting() {
    if (endTime.isAfter(startTime)) {
      Meeting updatedMeeting = Meeting(
        title: title,
        dateSent: widget.meeting.dateSent,
        timeSent: widget.meeting.timeSent,
        isCancelled: widget.meeting.isCancelled,
        startTime: startTime,
        endTime: endTime,
      );
      widget.onMeetingSchedule(updatedMeeting);
      Navigator.pop(context); // Close the bottom sheet
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(AppLocalizations.of(context).translate('err')),
            content: Text(AppLocalizations.of(context).translate('end_time_alert')),
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
      padding: EdgeInsets.all(16.0),
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            AppLocalizations.of(context).translate('sche_inter'),
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Text(AppLocalizations.of(context).translate('Title') + ':'),
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
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
          Text(AppLocalizations.of(context).translate('start_time')),
          SizedBox(height: 8.0),
          Row(
            children: [
              ElevatedButton(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: startTime,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null) {
                    setState(() {
                      startTime = picked;
                    });
                  }
                },
                child: Text(
                  '${startTime.year}-${startTime.month}-${startTime.day}',
                ),
              ),
              SizedBox(width: 8.0),
              Icon(
                Icons.calendar_today, // Calendar icon
                color: Theme.of(context).primaryColor,
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
                child: Text(
                    '${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}'),
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Text(AppLocalizations.of(context).translate('end_time')),
          SizedBox(height: 8.0),
          Row(
            children: [
              ElevatedButton(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: endTime,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2101),
                  );
                  if (picked != null) {
                    setState(() {
                      endTime = picked;
                    });
                  }
                },
                child: Text(
                  '${endTime.year}-${endTime.month}-${endTime.day}',
                ),
              ),
              SizedBox(width: 8.0),
              Icon(
                Icons.calendar_today, // Calendar icon
                color: Theme.of(context).primaryColor,
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
                child: Text(AppLocalizations.of(context).translate('cancel')),
              ),
              ElevatedButton(
                onPressed: _handleScheduleMeeting,
                child: Text(AppLocalizations.of(context).translate('save')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
