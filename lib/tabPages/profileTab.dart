import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ghuri_parcel_app/AllScreens/changePasswordScreen.dart';
import 'package:ghuri_parcel_app/AllScreens/contactScreen.dart';
import 'package:ghuri_parcel_app/AllScreens/loginScreen.dart';
import 'package:ghuri_parcel_app/AllScreens/privacyPolicyScreen.dart';
import 'package:ghuri_parcel_app/AllScreens/profileScreen.dart';
import 'package:ghuri_parcel_app/AllScreens/refundPolicyScreen.dart';
import 'package:ghuri_parcel_app/AllScreens/termsConditionScreen.dart';
import 'package:ghuri_parcel_app/AllScreens/updateProfileScreen.dart';
import 'package:ghuri_parcel_app/Models/addParcel_model.dart';
import 'package:ghuri_parcel_app/Models/registration_model.dart';
import 'package:ghuri_parcel_app/configApi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileTab extends StatefulWidget {
  const ProfileTab({Key? key}) : super(key: key);

  @override
  _ProfileTabState createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  SharedPreferences? sharedPreferences;
  @override
  void initState() {
    super.initState();
    loginStatus();
  }

  loginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences!.getString("token") == null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
          (Route<dynamic> route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 70.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Text(
                    "Profile",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.0,
            ),

            //quick help
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Text(
                    "Quick Help",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  OutlineButton(
                    onPressed: () {
                      Navigator.push(
                          (context),
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()));
                    },
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 400,
                            child: Row(
                              children: [
                                Text(
                                  "My Profile",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  width: 242,
                                ),
                                Icon(Icons.keyboard_arrow_right_rounded),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  OutlineButton(
                    onPressed: () {
                      Navigator.push(
                          (context),
                          MaterialPageRoute(
                              builder: (context) => UpdateProfileScreen()));
                    },
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 400,
                            child: Row(
                              children: [
                                Text(
                                  "Update Profile",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  width: 220,
                                ),
                                Icon(Icons.keyboard_arrow_right_rounded),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  OutlineButton(
                    onPressed: () {
                      Navigator.push(
                          (context),
                          MaterialPageRoute(
                              builder: (context) => ChangePasswordScreen()));
                    },
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 400,
                            child: Row(
                              children: [
                                Text(
                                  "Change Password",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  width: 200,
                                ),
                                Icon(Icons.keyboard_arrow_right_rounded),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 20.0,
            ),
            //help and support
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  Text(
                    "Help & Support",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  OutlineButton(
                    onPressed: () {
                      Navigator.push(
                          (context),
                          MaterialPageRoute(
                              builder: (context) => ContactScreen()));
                    },
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 400,
                            child: Row(
                              children: [
                                Text(
                                  "Contact Us",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  width: 240,
                                ),
                                Icon(Icons.keyboard_arrow_right_rounded),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  OutlineButton(
                    onPressed: () {
                      Navigator.push(
                          (context),
                          MaterialPageRoute(
                              builder: (context) => TermsConditionScreen()));
                    },
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 400,
                            child: Row(
                              children: [
                                Text(
                                  "Terms & Conditions",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  width: 190,
                                ),
                                Icon(Icons.keyboard_arrow_right_rounded),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  OutlineButton(
                    onPressed: () {
                      Navigator.push(
                          (context),
                          MaterialPageRoute(
                              builder: (context) => PrivacyPolicyScreen()));
                    },
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 400,
                            child: Row(
                              children: [
                                Text(
                                  "Privacy Policy",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  width: 220,
                                ),
                                Icon(Icons.keyboard_arrow_right_rounded),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  OutlineButton(
                    onPressed: () {
                      Navigator.push(
                          (context),
                          MaterialPageRoute(
                              builder: (context) => RefundPolicyScreen()));
                    },
                    child: Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 50,
                            width: 400,
                            child: Row(
                              children: [
                                Text(
                                  "Refund Policy",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  width: 220,
                                ),
                                Icon(Icons.keyboard_arrow_right_rounded),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      sharedPreferences!.remove("token");
                      sharedPreferences!.commit();

                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (BuildContext context) => LoginScreen()),
                          (Route<dynamic> route) => false);
                    },
                    child: Text(
                      "Sign Out",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromRGBO(204, 0, 0, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
