// Dart imports:

// Flutter imports:
import 'package:flutter/material.dart';
import './video_conference.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// Users who use the same conferenceID can in the same conference.
  var conferenceDTextCtrl = TextEditingController(text: 'video_conference_id');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  controller: conferenceDTextCtrl,
                  decoration: const InputDecoration(
                      labelText: 'join a conference by id'),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return VideoConferencePage(
                          conferenceID: conferenceDTextCtrl.text.trim(),
                        );
                      }),
                    );
                  },
                  child: const Text('join'))
            ],
          ),
        ),
      ),
    );
  }
}
