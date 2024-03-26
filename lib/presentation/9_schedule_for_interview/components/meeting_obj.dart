import 'package:boilerplate/presentation/9_schedule_for_interview/components/models.dart';
import 'package:flutter/material.dart';

class MeetingObj extends StatelessWidget {
  final Meeting meeting;

  MeetingObj(this.meeting);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.only(
          bottom: 8.0), // Add margin to separate meeting entries
      decoration: BoxDecoration(
        border:
            Border.all(color: Colors.grey), // Add a border around the container
        borderRadius: BorderRadius.circular(
            2.0), // Add border radius if you like rounded corners
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Catch up meeting',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Start time: ${meeting.startTime.day}/${meeting.startTime.month}/${meeting.startTime.year} ${meeting.startTime.hour.toString().padLeft(2, '0')}:${meeting.startTime.minute.toString().padLeft(2, '0')}',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'End time: ${meeting.endTime.day}/${meeting.endTime.month}/${meeting.endTime.year} ${meeting.endTime.hour.toString().padLeft(2, '0')}:${meeting.endTime.minute.toString().padLeft(2, '0')}',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 12), // Add space before the button
          Align(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisSize: MainAxisSize
                  .min, // This makes the Row only as wide as its children
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add your join meeting logic here
                  },
                  child: Text('Join'),
                ),
                IconButton(
                  onPressed: () {
                    // Add your icon button logic here
                  },
                  icon: Icon(Icons
                      .more_vert), // "..." icon can be represented as more_vert
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
