import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:boilerplate/presentation/Project_dashboard_company/dashboard_company/Proposalitem_company.dart';

class Proposal extends StatefulWidget {
  @override
  State<Proposal> createState() => _ProposalState();
}

class _ProposalState extends State<Proposal> {
  String selectedCategory = 'Detail';
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
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'Senior frontend developer (Fintech)',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.green, 
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Table for categories
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Table(
                        border: TableBorder.all(),
                        children: [
                          TableRow(
                            children: [
                              buildCategoryCell('Proposal'),
                              buildCategoryCell('Detail'),
                              buildCategoryCell('Message'),
                              buildCategoryCell('Hired'),
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
     floatingActionButton: Padding(
        padding: const EdgeInsets.all(10),
        child: Align(
          alignment: Alignment.bottomRight,
          child: ElevatedButton(
            onPressed: () {
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.black), 
                borderRadius: BorderRadius.zero, 
              ),
            ),
            child: Text(
              'Post job',
              style: TextStyle(
                color: Colors.black, 
              ),
            ),
          ),
        ),
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
      case 'Proposal':
        return buildProposalContent();
      case 'Detail':
        return buildDetailContent();
      case 'Message':
        return buildMessageContent();
      case 'Hired':
      return buildHiredContent();
      default:
        return Container(); 
    }
  }


  

Widget buildProposalContent() {
  return SingleChildScrollView(
    padding: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Widget gốc
        ProposalItem(),
        SizedBox(height: 20), // Khoảng cách giữa các thành phần
        // Đường thẳng ở giữa
        Container(
          height: 2,
          width: double.infinity,
          color: Colors.black,
        ),
        SizedBox(height: 20), // Khoảng cách giữa các thành phần
        // Widget nhân bản
        ProposalItem(),
        SizedBox(height: 20), // Khoảng cách giữa các thành phần
        // Đường thẳng ở giữa
        Container(
          height: 2,
          width: double.infinity,
          color: Colors.black,
        ),
        SizedBox(height: 20),
      ],
    ),
  );
}




Widget buildDetailContent() {
  return SingleChildScrollView(
    padding: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider( 
          thickness: 1, 
          color: Colors.black, 
          indent: 10, 
          endIndent: 10, 
        ),
        SizedBox(height: 20),
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
        SizedBox(height: 20),
        Divider( 
          thickness: 1, 
          color: Colors.black, 
          indent: 10, 
          endIndent: 10, 
        ),
        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.access_alarm,
              size: 50,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Project scope',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20), // Di chuyển văn bản sang trái 10 đơn vị
                  child: Text(
                    '- 3 to 6 month',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            
          ],
        ),

        SizedBox(height: 20),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.escalator_warning,
              size: 50,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Student required:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 20), // Di chuyển văn bản sang trái 10 đơn vị
                  child: Text(
                    '- 6 students',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
            
          ],
        ),
      ],
    ),
  );
}


  Widget buildMessageContent() {
      // Replace this with your content widget for "Archived"
      return Container(
        color: Colors.purple,
        height: 200,
        child: Center(
          child: Text(
            'Message content',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      );
    }
    Widget buildHiredContent() {
      // Replace this with your content widget for "Archived"
      return Container(
        color: Colors.purple,
        height: 200,
        child: Center(
          child: Text(
            'Hired content',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      );
    }
}



