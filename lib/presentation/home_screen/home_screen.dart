import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: UserAppBar.buildAppBar(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Center(
                  child: Text(
                "Build your product with high-skilled student",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge
                    ?.copyWith(fontSize: 16),
              )),
              SizedBox(height: 30),
              Center(
                  child: Text(
                      "Find and onboard best-skilled  student for your product Student works to gain experience & skills form real-world projects",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 14)
                  )
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 170.0,  // Đặt chiều rộng của container là 100
                    height: 30.0,  // Đặt chiều cao của container là 50
                    child: ElevatedButton(
                      onPressed: () {
                        // Xử lý khi nút bấm được nhấn
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: Text(
                        "Company",
                        style: TextStyle(color: Colors.black), // Đặt màu văn bản là màu trắng
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 170.0,  // Đặt chiều rộng của container là 100
                    height: 30.0,  // Đặt chiều cao của container là 50
                    child: ElevatedButton(
                      onPressed: () {
                        // Xử lý khi nút bấm được nhấn
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0),
                          side: BorderSide(color: Colors.black),
                        ),
                      ),
                      child: Text(
                        "Student",
                        style: TextStyle(color: Colors.black), // Đặt màu văn bản là màu trắng
                      ),
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 30),
              Center(
                  child: Text(
                      "StudentHub is university market place to connect high-skilled student and company on a real-world project",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall
                          ?.copyWith(fontSize: 14)
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}