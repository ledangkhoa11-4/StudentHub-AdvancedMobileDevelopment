import 'package:boilerplate/presentation/9_schedule_for_interview/components/video_call.dart';
import 'package:flutter/material.dart';
import 'package:boilerplate/presentation/9_schedule_for_interview/components/models.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';

class MeetingObj extends StatefulWidget {
  final Meeting meeting;
  final VoidCallback onReschedule; // Callback for re-scheduling
  final VoidCallback onCancel;

  MeetingObj(
      {required this.meeting,
      required this.onReschedule,
      required this.onCancel});

  @override
  _MeetingObjState createState() => _MeetingObjState();
}

class _MeetingObjState extends State<MeetingObj> {
  bool _isCancelled = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      margin: EdgeInsets.only(bottom: 8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(2.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.meeting.title}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            AppLocalizations.of(context).translate('start_time') +' ${widget.meeting.startTime.day}/${widget.meeting.startTime.month}/${widget.meeting.startTime.year} ${widget.meeting.startTime.hour.toString().padLeft(2, '0')}:${widget.meeting.startTime.minute.toString().padLeft(2, '0')}',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 4),
          Text(
            AppLocalizations.of(context).translate('end_time')+ ' ${widget.meeting.endTime.day}/${widget.meeting.endTime.month}/${widget.meeting.endTime.year} ${widget.meeting.endTime.hour.toString().padLeft(2, '0')}:${widget.meeting.endTime.minute.toString().padLeft(2, '0')}',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              children: [
                if (!_isCancelled)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VideoCall()),
                          );
                        },
                        child: Text(AppLocalizations.of(context).translate('join')),
                      ),
                      PopupMenuButton<String>(
                        onSelected: (value) {
                          if (value == 're-schedule') {
                            widget.onReschedule();
                          } else {
                            setState(() {
                              _isCancelled = true;
                            });
                            widget.onCancel();
                          }
                        },
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          PopupMenuItem<String>(
                            value: 're-schedule',
                            child: Text(AppLocalizations.of(context).translate('re_schedule_meeting')),
                          ),
                          PopupMenuItem<String>(
                            value: 'cancel',
                            child: Text(AppLocalizations.of(context).translate('cancel_meeting')),
                          ),
                        ],
                        icon: Icon(Icons.more_vert),
                      ),
                    ],
                  ),
                if (_isCancelled)
                  Text(
                    AppLocalizations.of(context).translate('meeting_cancel'),
                    style: TextStyle(
                      color: Colors.red,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
