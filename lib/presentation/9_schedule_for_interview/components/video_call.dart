import 'package:flutter/material.dart';

class VideoCall extends StatefulWidget {
  @override
  _VideoCallState createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Call'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Video Call Screen',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Icon(
              Icons.videocam,
              size: 100.0,
              color: Colors.blue,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Implement end call functionality here
              },
              child: Text('End Call'),
            ),
          ],
        ),
      ),
    );
  }
}
