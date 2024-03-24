import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:boilerplate/presentation/Project_dashboard_student/Project_student/Submit_Proposal_student.dart';

class Proposal extends StatefulWidget {
  @override
  State<Proposal> createState() => _ProposalState();
}

class _ProposalState extends State<Proposal> {
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
                    buildDetailContent(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
        
      floatingActionButton: Container(
        alignment: Alignment.bottomCenter, // Đặt nút ở dưới cùng và giữa
        padding: const EdgeInsets.only(bottom: 20), // Khoảng cách giữa nút và bottom edge
        child: Padding(
          padding: const EdgeInsets.only(left: 25),
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Xử lý sự kiện khi nhấn nút thứ nhất
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Màu nền của nút
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black), // Viền đen vuông
                      borderRadius: BorderRadius.circular(0), // Không bo tròn
                    ),
                    minimumSize: Size(100, 0), // Đặt độ dài nút thành 100
                  ),
                  child: SizedBox(
                    width: 100,
                    height: 50, 
                    child: Center(
                      child: Text(
                        'Saved',
                        style: TextStyle(
                          color: Colors.black, // Đặt màu chữ là màu xanh lá
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 30), 
                ElevatedButton(
                  onPressed: () {
                    // Xử lý sự kiện khi nhấn nút thứ hai
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // Màu nền của nút
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black), // Viền đen vuông
                      borderRadius: BorderRadius.circular(0), // Không bo tròn
                    ),
                  ),
                  child: SizedBox(
                    width: 100,
                    height: 50, 
                    child: Center(
                      child: Text(
                        'Apply Now',
                        style: TextStyle(
                          color: Colors.black, // Đặt màu chữ là màu xanh lá
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget buildDetailContent() {
    return SingleChildScrollView(
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
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Senior frontend developer (Fintech)',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black, 
              ),
            ),
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
          Padding(
            padding: const EdgeInsets.only(left: 10), // Di chuyển cả icon và văn bản sang trái 10 đơn vị
            child: Row(
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
                      margin: EdgeInsets.only(left: 10), // Di chuyển văn bản "- 3 to 6 month" sang trái 10 đơn vị
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
          ),


          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10), // Di chuyển cả icon và văn bản sang trái 10 đơn vị
            child: Row(
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
                      margin: EdgeInsets.only(left: 10), // Di chuyển văn bản "- 6 students" sang trái 10 đơn vị
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
          ),

        ],
      ),
    );
  }
}



