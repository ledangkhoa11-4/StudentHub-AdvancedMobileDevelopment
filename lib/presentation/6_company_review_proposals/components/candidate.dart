import 'package:flutter/material.dart';

class Candidate extends StatefulWidget {
  @override
  _CandidateState createState() => _CandidateState();
}

class _CandidateState extends State<Candidate> {
  bool isOfferSent = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      // constraints: BoxConstraints.expand(height: 20),
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.account_circle),
                  iconSize: 94.0,
                  onPressed: () {},
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hung Le',
                      style: TextStyle(fontSize: 22.0),
                    ),
                    SizedBox(height: 12.0),
                    Text('4th year student', style: TextStyle(fontSize: 18.0)),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Fullstack Engineer'),
                Text('Excellent'),
              ],
            ),
            SizedBox(height: 14.0),
            Text(
                'I have gone through your project and it seem like a great project. I will commit for your project...',
                style:
                    TextStyle(fontStyle: FontStyle.italic, color: Colors.grey)),
            SizedBox(height: 14.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: () {}, child: Text('Message')),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Center(child: Text("Hired offer")),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Center(
                                child: Text(
                                  "Do you really want to send hired offer for student to do this project?",
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                    child: Text("Cancel"),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        isOfferSent = true;
                                      });
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                    },
                                    child: Text("Send"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Text(isOfferSent ? 'Sent hired offer' : 'Hire'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
