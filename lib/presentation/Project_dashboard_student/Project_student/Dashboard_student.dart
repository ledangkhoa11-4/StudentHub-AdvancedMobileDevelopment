import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String selectedCategory = 'Working';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 20), 
                    Padding(
                      padding: EdgeInsets.only(left: 10), 
                      child: Row(
                        children: [
                          Text(
                            'Your Projects',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Table(
                        border: TableBorder.all(),
                        children: [
                          TableRow(
                            children: [
                              buildCategoryCell('All projects'),
                              buildCategoryCell('Working'),
                              buildCategoryCell('Archived'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    getContentWidget(selectedCategory),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget buildCategoryCell(String category) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = category;
        });
      },
      child: Container(
        color: selectedCategory == category ? Colors.blue : Colors.white,
        padding: EdgeInsets.all(8),
        child: Text(
          category,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget getContentWidget(String selectedCategory) {
    switch (selectedCategory) {
      case 'All projects':
        return buildAllProjectsContent();
      case 'Working':
        return buildWorkingContent();
      case 'Archived':
        return buildArchivedContent();
      default:
        return Container(); 
    }
  }

Widget buildAllProjectsContent() {
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          margin: EdgeInsets.all(10), 
          decoration: BoxDecoration(
            color: Colors.white, 
            border: Border.all(color: Colors.black), 
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10), 
            child: Align(
              alignment: Alignment.topLeft, 
              child: Text(
                'Active proposal (0)',
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10), 
          decoration: BoxDecoration(
            color: Colors.white, 
            border: Border.all(color: Colors.black), 
          ),
            child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Submitted proposal (0)',
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20), 
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Senior frontend developer (Fintech)',
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25), 
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Submitted 3 days ago',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 25), 
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Students are looking for',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 35), 
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '- Clear expectation about your project or deliverables',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10), 
                child: Divider(
                  height: 1,
                  color: Colors.black,
                  thickness: 2,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 20), 
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Senior frontend developer (Fintech)',
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25), 
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Submitted 3 days ago',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 25), 
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Students are looking for',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 35), 
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    '- Clear expectation about your project or deliverables',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),

        ),
      ],
    ),
  );
}




Widget buildWorkingContent() {
  return SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, 
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10), 
          child: Text(
            'Senior frontend developer (Fintech)',
            style: TextStyle(
              color: Colors.green, 
              fontWeight: FontWeight.bold, 
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(left: 10), 
          child: Text(
            'Time: 1-3 months, 6 students',
            style: TextStyle(
              color: Colors.grey, 
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(left: 25), 
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Students are looking for',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 35), 
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              '- Clear expectation about your project or deliverables',
              style: TextStyle(fontSize: 14),
            ),
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10), 
          child: Divider(
            height: 1,
            color: Colors.black,
            thickness: 2,
          ),
        ),
        SizedBox(height: 20),
      ],
    ),
  );
}



  Widget buildArchivedContent() {

    return Container(
      color: Colors.purple,
      height: 200,
      child: Center(
        child: Text(
          'Archived content',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

