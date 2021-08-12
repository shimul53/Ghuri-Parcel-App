import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ghuri_parcel_app/AllScreens/otpScreen.dart';
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

  final TextEditingController cityTextEditingController =
      new TextEditingController();

  var items = [
    'Bagerhat',
    'Bandarban',
    'Barguna',
    'Barisal',
    'Bhola',
    'Bogra',
    'Brahmanbaria',
    'Chandpur',
    'Chapainawabganj',
    'Chattogram',
    'Chuadanga',
    'Comilla',
    "Cox's Bazar",
    'Dhaka',
    'Dinajpur',
    'Faridpur',
    'Feni',
    'Gaibandha',
    'Gazipur',
    'Gopalganj',
    'Habiganj',
    'Jamalpur ',
    'Jessore',
    'Jhalokati',
    'Jhenaidah',
    'Joypurhat',
    'Khagrachhari',
    'Khulna',
    'Kishoreganj',
    'Kurigram',
    'Kushtia',
    'Lakshmipur',
    'Lalmanirhat',
    'Madaripur ',
    'Magura',
    'Manikganj',
    'Meherpur',
    'Moulvibazar',
    'Munshiganj',
    'Mymensingh',
    'Naogaon',
    'Narail',
    'Naryanganj',
    'Narsingdi',
    'Natore',
    'Netrakona',
    'Nilphamari ',
    'Noakhali',
    'Pabna',
    'Panchagarh',
    'Patuakhali',
    'Pirojpur',
    'Rajbari',
    'Rajshahi',
    'Rangamati',
    'Rangpur',
    'Satkhira',
    'Shariatpur',
    'Sherpur ',
    'Sirajgan',
    'Sunamganj',
    'Sylhet',
    'Tangail',
    'Thakurgaon',
  ];

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
                padding: const EdgeInsets.only(left: 30.0),
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
                child: RaisedButton(
                    color: Color.fromRGBO(255, 204, 0, 1),
                    textColor: Colors.black,
                    child: Container(
                      height: 50.0,
                      child: Center(
                        child: Text("SIGN UP",
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
                        registerNewUser();
                        Navigator.pushNamedAndRemoveUntil(
                            context, OTPScreen.idScreen, (route) => false);
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

  Future registerNewUser() async {
    var apiURL = "http://dev.api.ghuriparcel.com/v1/merchant/register/";
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    Map userDataMap = {
      "merchantName": firstNameTextEditingController.text.trim() +
          " " +
          lastNameTextEditingController.text.trim(),
      "email": emailTextEditingController.text.trim(),
      "phone": phoneTextEditingController.text.trim(),
      "shopName": shopNameTextEditingController.text.trim(),
      "shopUrl": shopLinkTextEditingController.text.trim(),
      "city": cityTextEditingController.text.trim(),
      "address": addressTextEditingController.text.trim(),
      "password": passwordTextEditingController.text.trim(),
    };
    var jsonResponse = null;

    print("JSON DATA: ${userDataMap}");
    http.Response response =
        await http.post(Uri.parse(apiURL), body: userDataMap);

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      print(jsonResponse);
      if (jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => OTPScreen()),
            (Route<dynamic> route) => false);
      } else {
        setState(() {
          _isLoading = false;
        });
        errorMsg = response.body;
        print("The error message is: ${response.body}");
      }
    }

    var data = jsonDecode(response.body);
    print("DATA: ${data}");

    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (BuildContext context) {
    //       return ProgressDialog(
    //         message: "Registering, Please wait...",
    //       );
    //     });

    // final User? firebaseUser = (await _firebaseAuth
    //         .createUserWithEmailAndPassword(
    //             email: emailTextEditingController.text,
    //             password: passwordTextEditingController.text)
    //         .catchError((errMsg) {
    //   Navigator.pop(context);
    //   displayToastMessage("Error:" + errMsg.toString(), context);
    // }))
    //     .user;
    // if (firebaseUser != null) {
    //   Map userDataMap = {
    //     "first_name": firstNameTextEditingController.text.trim(),
    //     "last_name": lastNameTextEditingController.text.trim(),
    //     "email": emailTextEditingController.text.trim(),
    //     "phone": phoneTextEditingController.text.trim(),
    //     "shop_name": shopNameTextEditingController.text.trim(),
    //     "shop_link": shopLinkTextEditingController.text.trim(),
    //     "city": cityTextEditingController.text.trim(),
    //     "address": addressTextEditingController.text.trim(),
    //   };
    //   userRef.child(firebaseUser.uid).set(userDataMap);
    //   displayToastMessage(" Your has been created Successfully", context);
    // Navigator.pushNamedAndRemoveUntil(
    //     context, MainScreen.idScreen, (route) => false);
//     } else {
//       Navigator.pop(context);
//       displayToastMessage(" New user account has not been created", context);
//     }
  }
}

displayToastMessage(String message, BuildContext context) {
  Fluttertoast.showToast(msg: message);
}
