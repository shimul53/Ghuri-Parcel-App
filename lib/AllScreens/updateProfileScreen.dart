import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ghuri_parcel_app/Models/dropdownItemInfo.dart';
import 'package:ghuri_parcel_app/Models/registration_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../configApi.dart';

int? _merchantId;
String? _bearerToken;

class UpdateProfileScreen extends StatefulWidget {
  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  TextEditingController merchantNameTextEditingController =
      TextEditingController();

  TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController shopNameTextEditingController = TextEditingController();

  TextEditingController shopLinkTextEditingController = TextEditingController();

  TextEditingController addressTextEditingController = TextEditingController();

  TextEditingController cityTextEditingController = new TextEditingController();
  TextEditingController areaTextEditingController = new TextEditingController();

  Future<RegistrationRequestModel>? futureData;

  getItem() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _merchantId = (sharedPreferences.getInt(API.merchantId) ?? '') as int?;
      _bearerToken = (sharedPreferences.getString(API.token) ?? '');
      futureData = parcelList();
    });
  }

  bool _isAreaVisible = false;
  showArea() {
    if (cityTextEditingController.text == "Dhaka") {
      setState(() {
        _isAreaVisible = true;
      });
    } else {
      setState(() {
        _isAreaVisible = false;
      });
    }
  }

  String? _area;

  area() {
    if (cityTextEditingController.text == "Dhaka") {
      setState(() {
        _area = areaTextEditingController.text;
      });
    } else {
      setState(() {
        _area = cityTextEditingController.text;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getItem();
    futureData = parcelList();
    showArea();
    area();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Update Profile",
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
        child: FutureBuilder<RegistrationRequestModel>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          children: [
                            Text(
                              "Update your Merchant Profile",
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
                            TextField(
                              cursorColor: Color.fromRGBO(255, 204, 0, 1),
                              controller: merchantNameTextEditingController =
                                  TextEditingController(
                                      text: snapshot.data!.merchantName),
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
                                labelText: "Merchant Name",
                                labelStyle: TextStyle(
                                    fontSize: 14.0, color: Colors.black87),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10.0,
                                ),
                              ),
                              style: TextStyle(fontSize: 14.0),
                            ),
                            TextField(
                              controller: emailTextEditingController =
                                  TextEditingController(
                                      text: snapshot.data!.email),
                              keyboardType: TextInputType.emailAddress,
                              cursorColor: Color.fromRGBO(255, 204, 0, 1),
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
                                  "images/message.png",
                                  scale: 3,
                                ),
                                labelText: "Email",
                                labelStyle: TextStyle(
                                    fontSize: 14.0, color: Colors.black87),
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
                              controller: shopNameTextEditingController =
                                  TextEditingController(
                                      text: snapshot.data!.shopName),
                              cursorColor: Color.fromRGBO(255, 204, 0, 1),
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
                                  "images/bag.png",
                                  scale: 3,
                                ),
                                labelText: "Shop Name",
                                labelStyle: TextStyle(
                                    fontSize: 14.0, color: Colors.black87),
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
                              controller: shopLinkTextEditingController =
                                  TextEditingController(
                                      text: snapshot.data!.shopUrl),
                              cursorColor: Color.fromRGBO(255, 204, 0, 1),
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
                                  "images/link.png",
                                  scale: 3,
                                ),
                                labelText: "Shop URL",
                                labelStyle: TextStyle(
                                    fontSize: 14.0, color: Colors.black87),
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
                                      cursorColor:
                                          Color.fromRGBO(255, 204, 0, 1),
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  255, 204, 0, 1)),
                                        ),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  255, 204, 0, 1)),
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
                                            cityTextEditingController.text =
                                                value;
                                            showArea();
                                            area();
                                          },
                                          itemBuilder: (BuildContext context) {
                                            return items
                                                .map<PopupMenuItem<String>>(
                                                    (String value) {
                                              return new PopupMenuItem(
                                                  child: new Text(value),
                                                  value: value);
                                            }).toList();
                                          },
                                        ),
                                        labelText: "City",
                                        labelStyle: TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.black87),
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
                            //if (cityTextEditingController.value.toString() == "Dhaka")
                            Visibility(
                              visible: _isAreaVisible,
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Container(
                                      child: TextField(
                                        controller: areaTextEditingController,
                                        cursorColor:
                                            Color.fromRGBO(255, 204, 0, 1),
                                        keyboardType: TextInputType.name,
                                        decoration: InputDecoration(
                                          focusedBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    255, 204, 0, 1)),
                                          ),
                                          border: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    255, 204, 0, 1)),
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
                                              areaTextEditingController.text =
                                                  value;
                                              area();
                                            },
                                            itemBuilder:
                                                (BuildContext context) {
                                              return areaItems
                                                  .map<PopupMenuItem<String>>(
                                                      (String value) {
                                                return new PopupMenuItem(
                                                    child: new Text(value),
                                                    value: value);
                                              }).toList();
                                            },
                                          ),
                                          labelText: "Area",
                                          labelStyle: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.black87),
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
                            ),
                            TextField(
                              controller: addressTextEditingController =
                                  TextEditingController(
                                      text: snapshot.data!.address),
                              cursorColor: Color.fromRGBO(255, 204, 0, 1),
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(255, 204, 0, 1)),
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
                                labelStyle: TextStyle(
                                    fontSize: 14.0, color: Colors.black87),
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
                                child: Text("Update",
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
                              setState(() {
                                futureData = updateProfile(
                                    merchantNameTextEditingController.text
                                        .toString(),
                                    shopNameTextEditingController.text
                                        .toString(),
                                    shopLinkTextEditingController.text
                                        .toString(),
                                    cityTextEditingController.text.toString(),
                                    _area.toString(),
                                    addressTextEditingController.text
                                        .toString(),
                                    emailTextEditingController.text.toString());

                                parcelList();
                                getItem();
                              });
                            }),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
              }
              return Padding(
                padding: const EdgeInsets.only(top: 300),
                child: Center(child: CircularProgressIndicator()),
              );
            }),
      ),
    );
  }
}

Future<RegistrationRequestModel> parcelList() async {
  String url = API.baseUrl +
      "v1/merchant/$_merchantId?type=1&role=1&department=2&id=$_merchantId";

  var response = await http.get(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $_bearerToken',
    },
  );
  var jsonResponse;
  if (response.statusCode == 200) {
    jsonResponse = json.decode(response.body);

    return RegistrationRequestModel.fromJson(jsonResponse["merchant"]);
  } else {
    throw Exception('Failed to load data');
  }
}

Future<RegistrationRequestModel> updateProfile(
  String merchantName,
  String shopName,
  String shopUrl,
  String city,
  String area,
  String address,
  String email,
) async {
  String url = API.baseUrl + "v1/merchant/update";
  var response = await http.put(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $_bearerToken',
    },
    body: jsonEncode(<String, String>{
      'merchantName': merchantName,
      'shopName': shopName,
      'shopUrl': shopUrl,
      'city': city,
      'area': area,
      'address': address,
      'email': email,
    }),
  );

  if (response.statusCode == 200) {
    return RegistrationRequestModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to update data');
  }
}
