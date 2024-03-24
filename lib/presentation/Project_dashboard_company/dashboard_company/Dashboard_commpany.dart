import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String selectedCategory = 'All projects';

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Your Projects',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 60), 
                        ElevatedButton(
                          onPressed: () {
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                            side: MaterialStateProperty.all<BorderSide>(BorderSide(color: Colors.black)), 
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0), 
                              ),
                            ),
                          ),
                          child: Text(
                            'Post a Project',
                            style: TextStyle(fontSize: 14,color: Colors.black)
                          ),
                        ),
                      ],
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
                              buildCategoryCell('All projects'),
                              buildCategoryCell('Working'),
                              buildCategoryCell('Archived'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Display content based on selected category
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(2, (index) {
        return Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Senior frontend developer (Fintech)',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Created 3 days ago',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      _showPopup(context); // Gọi hàm hiển thị popup khi nhấp vào icon
                    },
                    child: Icon(
                      Icons.pending_outlined,
                      color: Colors.black,
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
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Proposals',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '8',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Messages',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '2',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          'Hired',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20), 
              Divider( 
                height: 1,
                color: Colors.black,
                thickness: 1,
              ),
            ],
          ),
        );
      }),
    ),
  );
}




  Widget buildWorkingContent() {
    // Replace this with your content widget for "Working"
    return Container(
      color: Colors.orange,
      height: 200,
      child: Center(
        child: Text(
          'Working content',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }

  Widget buildArchivedContent() {
    // Replace this with your content widget for "Archived"
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


void _showPopup(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(0),
      ),
    ),
    builder: (BuildContext context) {
      return Container(
        color: Colors.white, // Đặt màu nền là trắng
        // Nội dung của popup ở đây
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: Text('View proposals'),
              onTap: () {
                // Thực hiện hành động khi chọn Option 1
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('View messages'),
              onTap: () {
                // Thực hiện hành động khi chọn Option 2
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('View hired'),
              onTap: () {
                // Thực hiện hành động khi chọn Option 2
                Navigator.pop(context);
              },
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.black,
            ),
            ListTile(
              title: Text('View job posting'),
              onTap: () {
                // Thực hiện hành động khi chọn Option 1
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Edit posting'),
              onTap: () {
                // Thực hiện hành động khi chọn Option 2
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Remove posting'),
              onTap: () {
                // Thực hiện hành động khi chọn Option 2
                Navigator.pop(context);
              },
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Colors.black,
            ),
            ListTile(
              title: Text('Start working this project'),
              onTap: () {
                // Thực hiện hành động khi chọn Option 1
                Navigator.pop(context);
              },
            ),
            // Thêm các option khác nếu cần
          ],
        ),
      );
    },
  );
}
