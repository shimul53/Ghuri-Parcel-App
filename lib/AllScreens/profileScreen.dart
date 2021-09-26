import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghuri_parcel_app/Models/addParcel_model.dart';
import 'package:ghuri_parcel_app/Models/registration_model.dart';
import 'package:ghuri_parcel_app/configApi.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

int? _merchantId;
String? _bearerToken;

class ProfileScreen extends StatefulWidget {
  static const String idScreen = "profileScreen";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Future<RegistrationRequestModel>? futureData;
  getItem() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _merchantId = (sharedPreferences.getInt(API.merchantId) ?? '') as int?;
      _bearerToken = (sharedPreferences.getString(API.token) ?? '');
      futureData = parcelList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 237, 237, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "My Profile",
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: FutureBuilder<RegistrationRequestModel>(
                  future: futureData,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        children: [
                          Center(
                            child: Image(
                              image: AssetImage("images/ghuri.png"),
                              width: 130.0,
                              height: 130.0,
                              alignment: Alignment.center,
                            ),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Text(
                            "${snapshot.data!.merchantName}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromRGBO(33, 33, 33, 1)),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "${snapshot.data!.phone}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(121, 121, 121, 1)),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "${snapshot.data!.email}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromRGBO(180, 180, 180, 1)),
                          ),
                          SizedBox(
                            height: 30.0,
                          ),
                          Text(
                            "${snapshot.data!.shopName}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromRGBO(121, 121, 121, 1)),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "${snapshot.data!.shopID}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 25,
                                color: Color.fromRGBO(33, 33, 33, 1)),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: Column(
                              children: [
                                Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Merchant City: ",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      ),
                                      Text(
                                        "${snapshot.data!.city}",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: Column(
                              children: [
                                Center(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Merchant Area: ",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      ),
                                      Text(
                                        "${snapshot.data!.area}",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30),
                            child: Column(
                              children: [
                                Center(
                                  child: Row(
                                    //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Merchant Address: ",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: 50.0,
                                      ),
                                      Container(
                                        width: 150,
                                        child: Text(
                                          "${snapshot.data!.address}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    return CircularProgressIndicator();
                  }),
            ),
          ),
        ],
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
    throw Exception('Unexpected error occured!');
  }
}
