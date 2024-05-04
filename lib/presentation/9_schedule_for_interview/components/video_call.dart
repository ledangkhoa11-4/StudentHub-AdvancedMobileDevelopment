import 'package:flutter/material.dart';
import 'package:boilerplate/utils/locale/app_localization.dart';

class VideoCall extends StatefulWidget {
  @override
  _VideoCallState createState() => _VideoCallState();
}

class _VideoCallState extends State<VideoCall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('vd_call')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context).translate('vd_call_scr'),
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
              child: Text(AppLocalizations.of(context).translate('end_call')),
            ),
          ],
        ),
      ),
    );
  }
}
