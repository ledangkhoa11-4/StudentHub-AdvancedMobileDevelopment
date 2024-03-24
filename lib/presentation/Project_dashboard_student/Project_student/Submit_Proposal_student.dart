import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SubmitProposal extends StatefulWidget {
  @override
  State<SubmitProposal> createState() => _SubmitProposalState();
}
class _SubmitProposalState extends State<SubmitProposal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppBar.buildAppBar(context),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10), 
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10), 
                      child: Text(
                        'Cover letter',
                        style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10), 
                      child: Text(
                        'Describe why do you fit to this project',
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: MediaQuery.of(context).size.width, 
                      height: 200, 
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none, 
                          contentPadding: EdgeInsets.all(10), 
                          hintText: 'Enter your cover letter here', 
                        ),
                        maxLines: null, 
                        expands: true, 
                      ),
                    ),
                    SizedBox(height: 20), 
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Xử lý sự kiện khi nhấn nút thứ nhất
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, 
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), 
                              side: BorderSide(color: Colors.black), 
                            ),
                          ),
                          child: Text('Button 1'), 
                        ),
                        SizedBox(width: 50), 
                        ElevatedButton(
                          onPressed: () {
                           
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, 
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), 
                              side: BorderSide(color: Colors.black), 
                            ),
                          ),
                          child: Text('Button 2'), 
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
