import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghuri_parcel_app/AllScreens/mainScreen.dart';
import 'package:ghuri_parcel_app/AllScreens/otpScreen.dart';
import 'package:ghuri_parcel_app/AllScreens/registrationScreen.dart';
import 'package:ghuri_parcel_app/AllWidgets/customElevationColor.dart';
import 'package:ghuri_parcel_app/Models/login_model.dart';
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

  signIn(String email, String password, String phone) async {
    String url = "https://api.ghuriparcel.com/v1/merchant/login";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {"email": email, "password": password, "phone": phone};
    var jsonResponse = null;
    var res = await http.post(Uri.parse(url), body: data);
    //check api status
    if (res.statusCode == 200) {
      jsonResponse = json.decode(res.body);
      print("Response status: ${res.statusCode}");
      print("Response status: ${res.body}");
      print(jsonResponse);
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['data']['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => OTPScreen()),
            (Route<dynamic> route) => false);
      } else {
        setState(() {
          _isLoading = false;
        });
        print("Response status: ${res.body}");
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestModel = new LoginRequestModel();
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
                      onSubmitted: (input) => requestModel!.email = input,
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
                        Navigator.pushNamedAndRemoveUntil(
                            context, MainScreen.idScreen, (route) => false);
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
                child: RaisedButton(
                  color: Color.fromRGBO(255, 204, 0, 1),
                  textColor: Colors.black,
                  child: Container(
                    height: 50.0,
                    child: Center(
                      child: Text("LOGIN",
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
                    print("Login pressed");
                    setState(() {
                      _isLoading = true;
                    });
                    signIn(
                        emailTextEditingController.text,
                        passwordTextEditingController.text,
                        phoneTextEditingController.text);
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
