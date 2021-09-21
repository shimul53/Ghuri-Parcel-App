import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:ghuri_parcel_app/AllScreens/loginScreen.dart';
import 'package:ghuri_parcel_app/Models/checkOtp_model.dart';
import 'package:ghuri_parcel_app/configApi.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class OTPScreen extends StatefulWidget {
  static const String idScreen = "otp";

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  CheckOtpRequestModel? checkOtpRequestModel;
  TextEditingController otpPin1Controller = TextEditingController();
  TextEditingController otpPin2Controller = TextEditingController();
  TextEditingController otpPin3Controller = TextEditingController();
  TextEditingController otpPin4Controller = TextEditingController();
  TextEditingController otpPin5Controller = TextEditingController();
  TextEditingController otpPin6Controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 70.0,
            left: 10.0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (BuildContext context) => LoginScreen()),
                    (Route<dynamic> route) => false);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(22.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(255, 204, 0, 1),
                      blurRadius: 6.0,
                      spreadRadius: 0.5,
                      offset: Offset(
                        0.7,
                        0.7,
                      ),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  backgroundColor: Color.fromRGBO(255, 204, 0, 1),
                  child: Icon(
                    Icons.arrow_back_ios_rounded,
                    color: Colors.black,
                  ),
                  radius: 20.0,
                ),
              ),
            ),
          ),
          Positioned(
            top: 100.0,
            left: 20.0,
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  "GHURI PARCEL",
                  style: TextStyle(
                      color: Color.fromRGBO(33, 33, 33, 1), fontSize: 30),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "please input your 6 digit verification code",
                  style: TextStyle(
                      color: Color.fromRGBO(180, 180, 180, 1), fontSize: 18),
                ),
                SizedBox(
                  height: 25,
                ),
                Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _textFieldOTP(
                          first: true,
                          last: false,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        _textFieldOTP(first: false, last: false),
                        SizedBox(
                          width: 10,
                        ),
                        _textFieldOTP(first: false, last: false),
                        SizedBox(
                          width: 10,
                        ),
                        _textFieldOTP(first: false, last: false),
                        SizedBox(
                          width: 10,
                        ),
                        _textFieldOTP(first: false, last: false),
                        SizedBox(
                          width: 10,
                        ),
                        _textFieldOTP(first: false, last: true),
                      ]),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 330,
                  child: ElevatedButton(
                    onPressed: () {
                      // checkOtp(_textFieldOTP.toString(), context);

                      // Navigator.pushNamedAndRemoveUntil(
                      //     context, LoginScreen.idScreen, (route) => false);
                    },
                    style: ButtonStyle(
                      shadowColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(255, 204, 0, 1)),
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromRGBO(255, 204, 0, 1)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(14.0),
                      child: Text(
                        'SUBMIT',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Resend OTP Code",
                  style: TextStyle(
                      color: Color.fromRGBO(204, 0, 0, 1), fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _textFieldOTP({
    bool? first,
    last,
  }) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 0.6,
        child: TextField(
          autofocus: true,
          onSubmitted: (String verificationCode) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Verification Code"),
                    content: Text('Code entered is $verificationCode'),
                  );
                });
          },
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
          },
          showCursor: true,
          cursorColor: Color.fromRGBO(33, 33, 33, 1),
          readOnly: false,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 12),
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 2, color: Color.fromRGBO(255, 204, 0, 1)),
                borderRadius: BorderRadius.circular(0)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 2, color: Color.fromRGBO(255, 204, 0, 1)),
                borderRadius: BorderRadius.circular(0)),
          ),
        ),
      ),
    );
  }
}

checkOtp(String otpNumber, BuildContext context) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String url = API.checkOtpUrl;

  var response = await http.post(Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(<String, dynamic>{
        "otp": otpNumber,
      }));
  print(response.body);
  var jsonResponse;
  if (response.statusCode == 200) {
    jsonResponse = json.decode(response.body);
    print(response.body);
    if (response.body != null) {
      print(response.body);

      sharedPreferences.setString("token", jsonResponse['token']);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => LoginScreen()),
          (Route<dynamic> route) => false);
    } else {
      throw Exception('Failed to load');
    }
  }
}
