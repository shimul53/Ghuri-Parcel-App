import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ghuri_parcel_app/AllScreens/otpScreen.dart';
import 'package:ghuri_parcel_app/Models/dropdownItemInfo.dart';
import 'package:ghuri_parcel_app/Models/registration_model.dart';
import 'package:ghuri_parcel_app/configApi.dart';
import 'package:http/http.dart' as http;

import 'package:ghuri_parcel_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginScreen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String idScreen = "register";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool _isLoading = false;
  var errorMsg;

  RegistrationRequestModel? registrationRequestModel;

  TextEditingController firstNameTextEditingController =
      TextEditingController();

  TextEditingController lastNameTextEditingController = TextEditingController();

  TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController phoneTextEditingController = TextEditingController();

  TextEditingController passwordTextEditingController = TextEditingController();

  TextEditingController confirmPasswordTextEditingController =
      TextEditingController();

  TextEditingController shopNameTextEditingController = TextEditingController();

  TextEditingController shopLinkTextEditingController = TextEditingController();

  TextEditingController addressTextEditingController = TextEditingController();

  TextEditingController areaTextEditingController = TextEditingController();

  final TextEditingController cityTextEditingController =
      new TextEditingController();

  @override
  void initState() {
    super.initState();
    registrationRequestModel = new RegistrationRequestModel(
      city: '',
      password: '',
      merchantName: '',
      email: '',
      phone: '',
      address: '',
      area: '',
      shopName: '',
      shopUrl: '',
      msisdn: '',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(color: Colors.black, fontSize: 18.0),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, LoginScreen.idScreen, (route) => false);
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
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Text(
                      "Welcome to Merchant Sign Up",
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
                height: 1.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: TextField(
                              cursorColor: Color.fromRGBO(255, 204, 0, 1),
                              controller: firstNameTextEditingController,
                              onSubmitted: (input) => registrationRequestModel!
                                  .merchantName = input,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(255, 204, 0, 1)),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(255, 204, 0, 1)),
                                ),
                                prefixIcon: Image.asset(
                                  "images/customer_deselect.png",
                                  scale: 3,
                                ),
                                labelText: "First Name",
                                labelStyle: TextStyle(
                                    fontSize: 14.0, color: Colors.black87),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10.0,
                                ),
                              ),
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            child: TextField(
                              cursorColor: Color.fromRGBO(255, 204, 0, 1),
                              controller: lastNameTextEditingController,
                              onSubmitted: (input) => registrationRequestModel!
                                  .merchantName = input,
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(255, 204, 0, 1)),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(255, 204, 0, 1)),
                                ),
                                prefixIcon: Image.asset(
                                  "images/customer_deselect.png",
                                  scale: 3,
                                ),
                                labelText: "Last Name",
                                labelStyle: TextStyle(
                                    fontSize: 14.0, color: Colors.black87),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10.0,
                                ),
                              ),
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      onSubmitted: (input) =>
                          registrationRequestModel!.email = input,
                      cursorColor: Color.fromRGBO(255, 204, 0, 1),
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
                          "images/message.png",
                          scale: 3,
                        ),
                        labelText: "Email",
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
                      controller: phoneTextEditingController,
                      keyboardType: TextInputType.phone,
                      onSubmitted: (input) =>
                          registrationRequestModel!.phone = input,
                      cursorColor: Color.fromRGBO(255, 204, 0, 1),
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
                          "images/deselect_Call.png",
                          scale: 3,
                        ),
                        labelText: "Mobile",
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
                      cursorColor: Color.fromRGBO(255, 204, 0, 1),
                      onSubmitted: (input) =>
                          registrationRequestModel!.password = input,
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
                      height: 1.0,
                    ),
                    TextField(
                      controller: confirmPasswordTextEditingController,
                      cursorColor: Color.fromRGBO(255, 204, 0, 1),
                      onSubmitted: (input) =>
                          registrationRequestModel!.password = input,
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
                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: shopNameTextEditingController,
                      cursorColor: Color.fromRGBO(255, 204, 0, 1),
                      onSubmitted: (input) =>
                          registrationRequestModel!.shopName = input,
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
                          "images/bag.png",
                          scale: 3,
                        ),
                        labelText: "Shop Name",
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
                      controller: shopLinkTextEditingController,
                      cursorColor: Color.fromRGBO(255, 204, 0, 1),
                      onSubmitted: (input) =>
                          registrationRequestModel!.shopUrl = input,
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
                          "images/link.png",
                          scale: 3,
                        ),
                        labelText: "Shop Online Link (optional)",
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
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: TextField(
                              controller: cityTextEditingController,
                              onSubmitted: (input) =>
                                  registrationRequestModel!.city = input,
                              cursorColor: Color.fromRGBO(255, 204, 0, 1),
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(255, 204, 0, 1)),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(255, 204, 0, 1)),
                                ),
                                prefixIcon: Image.asset(
                                  "images/deselect_building.png",
                                  scale: 3,
                                ),
                                suffixIcon: PopupMenuButton<String>(
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                  ),
                                  onSelected: (String value) {
                                    cityTextEditingController.text = value;
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return items.map<PopupMenuItem<String>>(
                                        (String value) {
                                      return new PopupMenuItem(
                                          child: new Text(value), value: value);
                                    }).toList();
                                  },
                                ),
                                labelText: "City",
                                labelStyle: TextStyle(
                                    fontSize: 14.0, color: Colors.black87),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10.0,
                                ),
                              ),
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: addressTextEditingController,
                      onSubmitted: (input) =>
                          registrationRequestModel!.address = input,
                      cursorColor: Color.fromRGBO(255, 204, 0, 1),
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(255, 204, 0, 1)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(255, 204, 0, 1),
                          ),
                        ),
                        prefixIcon: Image.asset(
                          "images/address_deselect.png",
                          scale: 3,
                        ),
                        labelText: "Address",
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
                      controller: areaTextEditingController,
                      onSubmitted: (input) =>
                          registrationRequestModel!.area = input,
                      cursorColor: Color.fromRGBO(255, 204, 0, 1),
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(255, 204, 0, 1)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(255, 204, 0, 1),
                          ),
                        ),
                        prefixIcon: Image.asset(
                          "images/area_deselect.png",
                          scale: 3,
                        ),
                        labelText: "Area",
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
                      height: 10.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: <Widget>[
                          Checkbox(
                            value: true,
                            onChanged: (status) {},
                            activeColor: Color.fromRGBO(255, 204, 0, 1),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 195,
                            child: Text(
                              "I agree the terms and condition of GHURI Parcel ",

                              maxLines: 2,
                              // overflow: TextOverflow.ellipsis,
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
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
                        child: Text("SIGN UP",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    onPressed: () {
                      if (firstNameTextEditingController.text.length < 3) {
                        displayToastMessage(
                            "Name must be atleast 3 Characters", context);
                      } else if (lastNameTextEditingController.text.length <
                          3) {
                        displayToastMessage(
                            "Name must be atleast 3 Characters", context);
                      } else if (!emailTextEditingController.text
                          .contains("@")) {
                        displayToastMessage(
                            " Email address is not valid", context);
                      } else if (phoneTextEditingController.text.isEmpty) {
                        displayToastMessage(
                            "Phone number is mandatory", context);
                      } else if (passwordTextEditingController.text.length <
                          6) {
                        displayToastMessage(
                            "Password must be atleast 6 Characters", context);
                      } else if (passwordTextEditingController.text.length !=
                          confirmPasswordTextEditingController.text.length) {
                        displayToastMessage(
                            "Password must be atleast 6 Characters", context);
                      } else {
                        print("clicked");
                        registerNewUser(
                          firstNameTextEditingController.text.toString(),
                          lastNameTextEditingController.text.toString(),
                          emailTextEditingController.text.toString(),
                          phoneTextEditingController.text.toString(),
                          shopNameTextEditingController.text.toString(),
                          shopLinkTextEditingController.text.toString(),
                          cityTextEditingController.text.toString(),
                          areaTextEditingController.text.toString(),
                          addressTextEditingController.text.toString(),
                          passwordTextEditingController.text.toString(),
                          context,
                        );
                      }
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

registerNewUser(
    String firstName,
    String lastName,
    String email,
    String phone,
    String shopName,
    String shopUrl,
    String city,
    String address,
    String password,
    String area,
    BuildContext context) async {
  String url = API.registrationUrl;

  var response = await http.post(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      'merchantName': firstName + " " + lastName,
      'email': email,
      'phone': phone,
      'shopName': shopName,
      'shopUrl': shopUrl,
      'city': city,
      'area': area,
      'address': address,
      'password': password,
      "userType": 1,
      "userRole": 1,
    }),
  );
  String sendOtpUrl = API.sendOTP;
  var otpResponse = await http.post(
    Uri.parse(sendOtpUrl),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode(<String, dynamic>{
      "msisdn": "88" + phone,
    }),
  );

  if (response.statusCode == 200 && otpResponse.statusCode == 200) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (BuildContext context) => OTPScreen()),
        (Route<dynamic> route) => false);
  } else {
    throw Exception('Failed to load data');
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
