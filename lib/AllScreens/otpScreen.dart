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
            top: 200.0,
            left: 10.0,
            child: Column(
              children: [
                otpField(context),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget otpField(BuildContext context) {
  return OTPTextField(
    length: 6,
    width: MediaQuery.of(context).size.width - 34,
    fieldWidth: 30,
    otpFieldStyle: OtpFieldStyle(
        backgroundColor: Colors.white,
        focusBorderColor: Color.fromRGBO(255, 204, 0, 1),
        borderColor: Color.fromRGBO(255, 204, 0, 1)),
    style: TextStyle(
        fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
    textFieldAlignment: MainAxisAlignment.spaceAround,
    fieldStyle: FieldStyle.underline,
    onCompleted: (pin) {
      print("Completed: " + pin);
    },
  );
}
