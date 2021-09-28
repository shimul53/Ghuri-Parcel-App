import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ghuri_parcel_app/AllScreens/loginScreen.dart';
import 'package:ghuri_parcel_app/Models/registration_model.dart';
import 'package:ghuri_parcel_app/configApi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

String? _bearerToken;

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  getItem() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _bearerToken = (sharedPreferences.getString(API.token) ?? '');
    });
  }

  TextEditingController oldPasswordTextEditingController =
      TextEditingController();

  TextEditingController newPasswordTextEditingController =
      TextEditingController();

  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Change Password",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(237, 237, 237, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Text(
                      "Update Your Password",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextField(
                      controller: oldPasswordTextEditingController,
                      cursorColor: Color.fromRGBO(255, 204, 0, 1),
                      obscureText: true,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(255, 204, 0, 1)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(255, 204, 0, 1)),
                        ),
                        prefixIcon: Image.asset(
                          "images/password.png",
                          scale: 3,
                        ),
                        labelText: "Old Password",
                        labelStyle:
                            TextStyle(fontSize: 14.0, color: Colors.black87),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextField(
                      controller: newPasswordTextEditingController,
                      cursorColor: Color.fromRGBO(255, 204, 0, 1),
                      obscureText: true,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(255, 204, 0, 1)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(255, 204, 0, 1)),
                        ),
                        prefixIcon: Image.asset(
                          "images/password.png",
                          scale: 3,
                        ),
                        labelText: "New Password",
                        labelStyle:
                            TextStyle(fontSize: 14.0, color: Colors.black87),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    TextField(
                      controller: confirmPasswordTextEditingController,
                      cursorColor: Color.fromRGBO(255, 204, 0, 1),
                      obscureText: true,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(255, 204, 0, 1)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(255, 204, 0, 1)),
                        ),
                        prefixIcon: Image.asset(
                          "images/password.png",
                          scale: 3,
                        ),
                        labelText: "Confirm Password",
                        labelStyle:
                            TextStyle(fontSize: 14.0, color: Colors.black87),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: RaisedButton(
                    color: Color.fromRGBO(255, 204, 0, 1),
                    textColor: Colors.black,
                    child: Container(
                      height: 50.0,
                      child: Center(
                        child: Text("Change Password",
                            style: TextStyle(
                              fontSize: 16.0,
                            )),
                      ),
                    ),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(24.0),
                    ),
                    splashColor: Color.fromRGBO(255, 204, 0, 1),
                    elevation: 10,
                    onPressed: () {
                      updateProfile(
                        oldPasswordTextEditingController.text.toString(),
                        newPasswordTextEditingController.text.toString(),
                        confirmPasswordTextEditingController.text.toString(),
                        context,
                      );
                    }),
              ),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Future<RegistrationRequestModel> updateProfile(String oldPassword,
    String password, String confirmPassword, BuildContext context) async {
  String url = API.baseUrl + "v1/merchant/password_change";
  print(url);
  var response = await http.put(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $_bearerToken',
    },
    body: jsonEncode(<String, String>{
      'oldPassword': oldPassword,
      'password': password,
      'confirmPassword': confirmPassword,
    }),
  );

  if (response.statusCode == 200) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
        (Route<dynamic> route) => false);
    return RegistrationRequestModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to update data');
  }
}
