import 'package:boilerplate/di/service_locator.dart';
import 'package:boilerplate/presentation/app_bar/app_bar.dart';
import 'package:boilerplate/presentation/login/login.dart';
import 'package:boilerplate/presentation/login/store/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Switchaccount extends StatefulWidget {
  @override
  State<Switchaccount> createState() => _SwitchaccountState();
}

class _SwitchaccountState extends State<Switchaccount> {
  final UserStore _userStore = getIt<UserStore>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: UserAppBar.buildAppBar(context, disableSettingAccount: true),
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
                      ExpansionTile(
                        title: Row(
                          children: [
                            Icon(Icons.person, color: Colors.black, size: 50.0),
                            SizedBox(width: 5),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Username1",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  "Company",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              ],
                            ),
                          ],
                        ),
                        children: [
                          // Add more widgets for additional account details
                          _buildAccountTile("Username1", "Company"),
                          SizedBox(height: 10),
                          _buildAccountTile("Username2", "Company2"),
                          SizedBox(height: 10),
                        ],
                      ),
                      Divider(
                        thickness: 1, // Độ dày của đường thẳng
                        color: Colors.black, // Màu sắc của đường thẳng
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 15),
                          Icon(Icons.person_outline,
                              color: Colors.black, size: 50.0),
                          SizedBox(width: 5),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Profiles",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 60),
                        height: 1,
                        color: Colors.black,
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 15),
                          Icon(Icons.settings, color: Colors.black, size: 50.0),
                          SizedBox(width: 5),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Settings",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 60),
                        height: 1,
                        color: Colors.black,
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 15),
                          Icon(
                            Icons.logout,
                            color: Colors.black,
                            size: 50.0,
                          ),
                          SizedBox(width: 5),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                child: Text(
                                  "Log out",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                onTap: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()),
                                      (Route<dynamic> route) => false);
                                  _userStore.logout();
                                },
                              )
                            ],
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 60),
                        height: 1,
                        color: Colors.black,
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(bottom: 50, right: 30.0),
              child: Text(
                'Already have an account',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ));
  }
}

Widget _buildAccountTile(String username, String company) {
  return Container(
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(color: Colors.black),
      ),
    ),
    margin: EdgeInsets.only(left: 50, right: 20),
    child: Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.only(left: 50),
          leading: Icon(Icons.person, color: Colors.black, size: 50.0),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                username,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                company,
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
        // Add more ListTile widgets for additional account details
      ],
    ),
  );
}
