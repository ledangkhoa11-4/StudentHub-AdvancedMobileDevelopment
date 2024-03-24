import 'package:flutter/material.dart';

class Project extends StatefulWidget {
  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(10), // Lề 10 mỗi bên cho SingleChildScrollView
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10), 
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50, 
                              child: TextField(
                                style: TextStyle(color: Colors.black), 
                                decoration: InputDecoration(
                                  labelText: 'Search', 
                                  prefixIcon: Icon(Icons.search), 
                                  border: OutlineInputBorder( 
                                    borderSide: BorderSide(color: Colors.black), 
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  fillColor: Colors.white, 
                                  filled: true, 
                                ),
                              ),
                            ),
                          ),
                          IconButton( 
                            icon: Icon(Icons.favorite), 
                            onPressed: () {
                            },
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: double.infinity, 
                      height: 1, 
                      color: Colors.black, 
                      margin: EdgeInsets.symmetric(vertical: 10), 
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5),
                              Text(
                                'Created 3 days ago',
                                style: TextStyle(fontSize: 12, color: Colors.black),
                              ),
                              Text(
                                'Senior frontend developer (Fintech)',
                                style: TextStyle(fontSize: 16,color: Colors.green, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Time: 1-3 months, 6 students needed',
                                style: TextStyle(fontSize: 12, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                          
                          },
                          child: Icon(
                            Icons.favorite_border,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Students are looking for',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(
                            '- Clear expectation about your project or deliverables $index',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Proposals: Less than 5',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: double.infinity, 
                      height: 1, 
                      color: Colors.black, 
                      margin: EdgeInsets.symmetric(vertical: 10), 
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5),
                              Text(
                                'Created 3 days ago',
                                style: TextStyle(fontSize: 12, color: Colors.black),
                              ),
                              Text(
                                'Senior frontend developer (Fintech)',
                                style: TextStyle(fontSize: 16,color: Colors.green, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Time: 1-3 months, 6 students needed',
                                style: TextStyle(fontSize: 12, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                          
                          },
                          child: Icon(
                            Icons.favorite_border,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Students are looking for',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(
                            '- Clear expectation about your project or deliverables $index',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Proposals: Less than 5',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: double.infinity, 
                      height: 1, 
                      color: Colors.black, 
                      margin: EdgeInsets.symmetric(vertical: 10), 
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 5),
                              Text(
                                'Created 3 days ago',
                                style: TextStyle(fontSize: 12, color: Colors.black),
                              ),
                              Text(
                                'Senior frontend developer (Fintech)',
                                style: TextStyle(fontSize: 16,color: Colors.green, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'Time: 1-3 months, 6 students needed',
                                style: TextStyle(fontSize: 12, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        InkWell(
                          onTap: () {
                          
                          },
                          child: Icon(
                            Icons.favorite_border,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Students are looking for',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) {
                          return Text(
                            '- Clear expectation about your project or deliverables $index',
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Proposals: Less than 5',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: double.infinity, 
                      height: 1, 
                      color: Colors.black, 
                      margin: EdgeInsets.symmetric(vertical: 10),
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
