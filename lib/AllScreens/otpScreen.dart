import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class OTPScreen extends StatefulWidget {
  static const String idScreen = "otp";

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
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
              onTap: () {},
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
            left: 10.0,
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
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _textFieldOTP(first: true, last: false),
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
                    onPressed: () {},
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

  Widget _textFieldOTP({bool? first, last}) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 0.6,
        child: TextField(
          autofocus: true,
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
