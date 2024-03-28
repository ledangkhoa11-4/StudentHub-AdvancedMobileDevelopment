import 'package:boilerplate/presentation/9_schedule_for_interview/components/meeting_obj.dart';
import 'package:boilerplate/presentation/9_schedule_for_interview/components/re_schedule_bottom_sheet.dart';
import 'package:boilerplate/presentation/9_schedule_for_interview/components/shedule_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'chat_message_obj.dart';
import 'models.dart';

class ChatScreen extends StatefulWidget {
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final List<dynamic> _messages = [];
  final ScrollController _scrollController = ScrollController();
  final FocusNode focusNode = FocusNode();
  bool _isInitialScroll = true;

  @override
  void initState() {
    super.initState();
    _loadSampleData();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom(); // Scroll to the bottom after the widget is built
    });
  }

  void _scrollToBottom() {
    if (_isInitialScroll && _scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
      _isInitialScroll = false; // Update the flag
    }
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  void _loadSampleData() {
    List<dynamic> sampleData = [
      ChatMessage(
        userName: 'User1',
        timeSent: '10:00 AM',
        dateSent: '2024-03-21',
        content: 'Hello there!',
      ),
      ChatMessage(
        userName: 'User 2',
        timeSent: '10:05 AM',
        dateSent: '2024-03-21',
        content: 'Hi! How are you?',
      ),
      Meeting(
          title: "Interview meeting",
          timeSent: '10:00 AM',
          dateSent: '2024-03-21',
          startTime: DateTime(2024, 3, 26, 9, 0),
          endTime: DateTime(2024, 3, 26, 9, 0),
          isCancelled: false),
      // ChatMessage(
      //   userName: 'User1',
      //   timeSent: '10:10 AM',
      //   dateSent: '2024-03-22',
      //   content: 'I\'m good, thanks!',
      // ),
      // ChatMessage(
      //   userName: 'User2',
      //   timeSent: '10:10 AM',
      //   dateSent: '2024-03-22',
      //   content: 'Oke!',
      // ),
      // ChatMessage(
      //   userName: 'User2',
      //   timeSent: '10:10 AM',
      //   dateSent: '2024-03-22',
      //   content: 'Oke!',
      // ),
      // ChatMessage(
      //   userName: 'User2',
      //   timeSent: '10:10 AM',
      //   dateSent: '2024-03-22',
      //   content: 'Oke!',
      // ),
      // ChatMessage(
      //   userName: 'User2',
      //   timeSent: '10:10 AM',
      //   dateSent: '2024-03-22',
      //   content: 'Oke!',
      // ),
      // ChatMessage(
      //   userName: 'User2',
      //   timeSent: '10:10 AM',
      //   dateSent: '2024-03-23',
      //   content: 'Oke!',
      // ),
      // ChatMessage(
      //   userName: 'User2',
      //   timeSent: '10:10 AM',
      //   dateSent: '2024-03-23',
      //   content: 'Oke!',
      // ),
      // ChatMessage(
      //   userName: 'User2',
      //   timeSent: '10:10 AM',
      //   dateSent: '2024-03-23',
      //   content: 'Oke!',
      // ),
    ];

    setState(() {
      _messages.addAll(sampleData);
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    });
  }

  Widget _buildTextComposer() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Row(
        children: <Widget>[
          GestureDetector(
            onTap: _showScheduleBottomSheet,
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                Icons.calendar_today, // Calendar icon
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Flexible(
            child: TextField(
              controller: _textController,
              focusNode: focusNode,
              onSubmitted: _handleSubmitted,
              onTap: _scrollToBottom,
              decoration: InputDecoration(
                hintText: "Send a message",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }

  void _handleSubmitted(String text) {
    if (text.isNotEmpty) {
      DateTime now = DateTime.now();
      String formattedDate =
          '${now.year}-${_addLeadingZero(now.month)}-${_addLeadingZero(now.day)}';
      String formattedTime =
          '${_addLeadingZero(now.hour)}:${_addLeadingZero(now.minute)}';

      ChatMessage newMessage = ChatMessage(
        userName: 'You',
        timeSent: formattedTime,
        dateSent: formattedDate,
        content: text,
      );

      setState(() {
        _messages.insert(_messages.length, newMessage);
      });
    }
    _textController.clear();
    FocusScope.of(context).unfocus(); // Close the keyboard
  }

  String _addLeadingZero(int number) {
    return number.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  // Check if we should display the date label
                  bool shouldDisplayDate = index == 0 ||
                      _messages[index].dateSent !=
                          _messages[index - 1].dateSent;
                  return Column(children: [
                    if (shouldDisplayDate)
                      ListTile(
                        title: Center(
                          child: Text(_messages[index].dateSent),
                        ),
                      ),
                    if (_messages[index] is ChatMessage)
                      ChatMessageObj(_messages[index])
                    else
                      MeetingObj(
                        meeting: _messages[index],
                        onReschedule: () =>
                            _showReScheduleBottomSheet(_messages[index]),
                        onCancel: () => _cancelMeeting(_messages[index]),
                      )
                  ]);
                },
                childCount: _messages.length,
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(height: 1.0),
                  _buildTextComposer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showScheduleBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ScheduleBottomSheet(
          onMeetingCreated:
              (String title, DateTime startTime, DateTime endTime) {
            _handleMeetingCreation(title, startTime, endTime);
          },
        );
      },
    );
  }

  void _handleMeetingCreation(
      String title, DateTime startTime, DateTime endTime) {
    DateTime now = DateTime.now();
    String formattedDate =
        '${now.year}-${_addLeadingZero(now.month)}-${_addLeadingZero(now.day)}';
    String formattedTime =
        '${_addLeadingZero(now.hour)}:${_addLeadingZero(now.minute)}';

    // Create a Meeting object with the provided startTime and endTime
    Meeting newMeeting = Meeting(
      title: title,
      dateSent: formattedDate,
      timeSent: formattedTime,
      isCancelled: false,
      startTime: startTime,
      endTime: endTime,
    );

    setState(() {
      _messages.add(newMeeting);
    });
  }

  void _showReScheduleBottomSheet(Meeting meeting) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ReScheduleBottomSheet(
          meeting: meeting,
          onMeetingSchedule: (updatedMeeting) {
            _handleMeetingReScheduled(updatedMeeting);
          },
        );
      },
    );
  }

  void _handleMeetingReScheduled(Meeting updatedMeeting) {
    setState(() {
      for (int i = 0; i < _messages.length; i++) {
        if (_messages[i] is Meeting &&
            _messages[i].dateSent == updatedMeeting.dateSent) {
          _messages[i] = updatedMeeting;
          print(updatedMeeting.endTime);
          break;
        }
      }
    });
  }

  void _cancelMeeting(Meeting meeting) {
    setState(() {
      meeting.isCancelled = true;
    });
  }
}
