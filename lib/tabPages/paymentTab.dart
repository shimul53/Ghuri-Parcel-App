import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghuri_parcel_app/AllWidgets/progressDialog.dart';
import 'package:ghuri_parcel_app/Models/payment_model.dart';
import 'package:ghuri_parcel_app/configApi.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

int? _merchantId;
String? _bearerToken;

class PaymentTab extends StatefulWidget {
  const PaymentTab({Key? key}) : super(key: key);

  @override
  _PaymentTabState createState() => _PaymentTabState();
}

class _PaymentTabState extends State<PaymentTab> {
  Future<List<PaymentRequestModel>?>? futureData;
  getListItem() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _merchantId = (sharedPreferences.getInt(API.merchantId));
      _bearerToken = (sharedPreferences.getString(API.token) ?? '');
      futureData = parcelList(context);
    });
  }

  @override
  void initState() {
    super.initState();
    getListItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(237, 237, 237, 1),
        appBar: AppBar(
          toolbarHeight: 80,
          backgroundColor: Colors.white,
          title: Text(
            "Payment",
            style: TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: FutureBuilder<List<PaymentRequestModel>?>(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<PaymentRequestModel>? data = snapshot.data;

                  return ListView.builder(
                      itemCount: data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              top: 20.0, bottom: 20.0, left: 20.0, right: 20.0),
                          child: Container(
                            height: 120,
                            padding:
                                EdgeInsets.only(left: 10, right: 10, top: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                                bottomLeft: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, right: 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            "Date: ${data[index].paidDateTime}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                      Card(
                                        color: Color.fromRGBO(255, 204, 0, 1),
                                        child: SizedBox(
                                          height: 30,
                                          width: 80,
                                          child: Center(
                                            child: Text(
                                              "${data[index].paidAmount}TK",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            "Transaction Id: ${data[index].paidTrxID}",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color.fromRGBO(
                                                    121, 121, 121, 1)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      });
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }

                return Container();
              },
            )),
          ],
        ));
  }
}

Future<List<PaymentRequestModel>?> parcelList(context) async {
  showDialog(
      context: context,
      builder: (BuildContext context) => ProgressDialog(
            message: "Please wait...",
          ));
  String url = API.baseUrl + "v1/parcel/merchant/payment_history/$_merchantId";
  print(url);
  var response = await http.get(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $_bearerToken',
    },
  );
  Navigator.pop(context);

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = json.decode(response.body);

    List<dynamic> data = jsonResponse["paymentHistory"];

    return data.map((data) => new PaymentRequestModel.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

getProgressDialog() {
  return Dialog(
    child: new Container(
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Row(
          children: [
            SizedBox(
              width: 20.0,
            ),
            CupertinoActivityIndicator(
              radius: 10,
            ),
            SizedBox(
              width: 30.0,
            ),
            Text(
              "Please wait...",
              style: TextStyle(color: Colors.black, fontSize: 15.0),
            )
          ],
        ),
      ),
    ),
  );
}
