import 'package:flutter/material.dart';

class SubmitScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Submit Screen'),
      // ),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Cover letter',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0)),
              SizedBox(
                height: 16.0,
              ),
              Text(
                'Describe why do you fit to this project',
              ),
              SizedBox(height: 10), // Add some space
              TextField(
                maxLines: 5, // Set the maximum number of lines
                decoration: InputDecoration(
                  hintText: 'Enter your cover letter here',
                  hintStyle: TextStyle(
                      fontStyle: FontStyle.italic, color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20), // Add some space
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Submit proposal'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
