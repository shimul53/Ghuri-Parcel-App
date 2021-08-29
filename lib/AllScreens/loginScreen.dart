import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_glow/flutter_glow.dart';
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghuri_parcel_app/AllScreens/mainScreen.dart';
import 'package:ghuri_parcel_app/AllScreens/otpScreen.dart';
import 'package:ghuri_parcel_app/AllScreens/registrationScreen.dart';
import 'package:ghuri_parcel_app/AllWidgets/customElevationColor.dart';
import 'package:ghuri_parcel_app/Models/login_model.dart';
import 'package:ghuri_parcel_app/api/api_service.dart';
import 'package:ghuri_parcel_app/configApi.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class LoginScreen extends StatefulWidget {
  static const String idScreen = "login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();

  LoginRequestModel? requestModel;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // requestModel = new LoginRequestModel(phoneOrEmail: '', password: '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 85.0,
              ),
              Image(
                image: AssetImage("images/ghuri_parcel_icon.png"),
                width: 220.0,
                height: 200.0,
                alignment: Alignment.center,
              ),
              SizedBox(
                height: 1.0,
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      cursorColor: Color.fromRGBO(255, 204, 0, 1),
                      controller: emailTextEditingController,
                      onSubmitted: (input) =>
                          requestModel!.phoneOrEmail = input,
                      keyboardType: TextInputType.emailAddress,
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
                          "images/customer_deselect.png",
                          scale: 3,
                        ),
                        labelText: "Mobile/Email",
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
                      height: 1.0,
                    ),
                    TextField(
                      controller: passwordTextEditingController,
                      onSubmitted: (input) => requestModel!.password = input,
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
                        suffixIcon: Image.asset(
                          "images/password_show.png",
                          scale: 3,
                        ),
                        prefixIcon: Image.asset(
                          "images/password.png",
                          scale: 3,
                        ),
                        labelText: "Password",
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
                      height: 50.0,
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(context,
                            RegistrationScreen.idScreen, (route) => false);
                      },
                      child: Text(
                        "Create a new Account",
                        style: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(
                              180,
                              180,
                              180,
                              1,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: GlowButton(
                  height: 50,
                  width: 400,
                  borderRadius: new BorderRadius.circular(24.0),
                  color: Color.fromRGBO(255, 204, 0, 1),
                  glowColor: Color.fromRGBO(255, 204, 0, 1),
                  child: Container(
                    height: 50.0,
                    child: Center(
                      child: Text("LOGIN",
                          style: TextStyle(
                            fontSize: 16.0,
                          )),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _isLoading = true;
                    });
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (BuildContext context) => MainScreen()),
                        (Route<dynamic> route) => false);

                    // loginAttempt(emailTextEditingController.text.toString(),
                    //     passwordTextEditingController.text.toString(), context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

loginAttempt(String userName, String password, BuildContext context) async {
  print(userName);
  print(password);
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  String url = API.loginUrl;

  var response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      'phoneOrEmail': userName,
      'password': password,
      "userType": 1,
      "userRole": 1,
    }),
  );
  var jsonResponse;
  if (response.statusCode == 200) {
    jsonResponse = json.decode(response.body);
    print(response.body);
    if (response.body != null) {
      print("successful");
      if (response.body.isNotEmpty) {
        print("logged in successfully");
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => MainScreen()),
            (Route<dynamic> route) => false);
      } else {
        print("failed try again");
      }
    }
  } else {
    throw Exception('Failed to load album');
  }
}
