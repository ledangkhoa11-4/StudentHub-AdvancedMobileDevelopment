import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:boilerplate/presentation/app_bar/Bottom_bar.dart';
import 'package:boilerplate/presentation/Project_dashboard_student/Project_student/Project_student.dart';
import 'package:boilerplate/presentation/Project_dashboard_student/Project_student/Dashboard_student.dart';

class ProjectDashboard extends StatefulWidget {
  @override
  State<ProjectDashboard> createState() => _ProjectDashboardState();
}

class _ProjectDashboardState extends State<ProjectDashboard> {
  int _selectedIndex = 0;

  // Danh sách các màn hình hoặc chức năng tương ứng với mỗi item trong bottom navigation bar
  static List<Widget> _widgetOptions = <Widget>[
    Dashboard(),
    Project(),
    Container(
      child: Center(
        child: Text('Item 3 Content'),
      ),
    ),
    Container(
      child: Center(
        child: Text('Item 4 Content'),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UserAppBar.buildAppBar(context),
      body: _widgetOptions[_selectedIndex], // Hiển thị nội dung của màn hình tương ứng với item được chọn
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
