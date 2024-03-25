import 'package:flutter/material.dart';

class ScheduleBottomSheet extends StatefulWidget {
  @override
  _ScheduleBottomSheetState createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  late String title; // Variable to store title
  late DateTime startTime; // Variable to store start time
  late DateTime endTime; // Variable to store end time

  @override
  void initState() {
    super.initState();
    title = '';
    startTime = DateTime.now();
    endTime = DateTime.now();
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
            'Schedule Interview',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16.0),
          Text('Title:'),
          TextField(
            decoration: InputDecoration(
              // labelText: 'Title',
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
          Text('Start Time:'),
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
          Text('End Time:'),
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
                      startTime = DateTime(
                        endTime.year,
                        endTime.month,
                        endTime.day,
                        endTime.hour,
                        endTime.minute,
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
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (endTime.isAfter(startTime)) {
                    Navigator.pop(context); // Close the bottom sheet
                  } else {
                    // Show an error message if end time is not after start time
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('End time must be after start time'),
                      ),
                    );
                  }
                },
                child: Text('Send Invite'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
