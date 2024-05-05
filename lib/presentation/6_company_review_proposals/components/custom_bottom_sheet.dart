import 'package:flutter/material.dart';

class CustomBottomSheetContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250, // Adjust the height as needed
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Text(
          //   'Bottom Sheet Title',
          //   style: TextStyle(
          //     fontSize: 18.0,
          //     fontWeight: FontWeight.bold,
          //   ),
          // ),
          Text(
            'View proposals',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            'View messages',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            'View hired',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Divider(color: Colors.black, thickness: 1),
          Text(
            'View job posting',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            'Edit posting',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Text(
            'Remove posting',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          Divider(color: Colors.black, thickness: 1),
          Text(
            'Start working on this project',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}
