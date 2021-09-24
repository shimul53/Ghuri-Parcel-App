import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ghuri_parcel_app/AllScreens/parcelItemDetailsScreen.dart';
import 'package:ghuri_parcel_app/Models/addParcel_model.dart';
import 'package:ghuri_parcel_app/configApi.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

String? _parcelTrackId;
int? _merchantId;
String? _bearerToken;
String? _firstDate;
String _firstDateValue = "";
DateTime? _selectedDate;

String? _firstDateInput;
String? _lastDateInput;

class ParcelListView extends StatefulWidget {
  const ParcelListView({Key? key}) : super(key: key);

  @override
  _ParcelListViewState createState() => _ParcelListViewState();
}

class _ParcelListViewState extends State<ParcelListView> {
  DateTime? firstDate;
  DateTime? lastDate;

  final dateFormat = DateFormat('yyyy-MM-dd');
  _firstDate() {
    if (firstDate == null) {
      setState(() {
        _firstDateInput = dateFormat.format(DateTime.now());
      });
    } else {
      setState(() {
        _firstDateInput = dateFormat.format(firstDate!);
      });
    }
    return _firstDateInput;
  }

  _lastDate() {
    if (lastDate == null) {
      setState(() {
        _lastDateInput = dateFormat.format(DateTime.now());
      });
    } else {
      setState(() {
        _lastDateInput = dateFormat.format(lastDate!);
      });
    }
    return _lastDateInput;
  }

  getDashboardItem() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _parcelTrackId = (sharedPreferences.getString(API.parcelTrackId) ?? '');
    });
  }

  Future<List<AddParcelRequestModel>?>? futureData;
  @override
  void initState() {
    super.initState();
    getDashboardItem();
    futureData = parcelList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: FutureBuilder<List<AddParcelRequestModel>?>(
      future: futureData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<AddParcelRequestModel>? data = snapshot.data;

          return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (BuildContext context, int index) {
                print("${data[index].customerName}");
                return TextButton(
                  onPressed: () {
                    Navigator.push(
                        (context),
                        MaterialPageRoute(
                            builder: (context) => ParcelItemDetailsScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 10.0, right: 10.0),
                    child: Container(
                      height: 200,
                      padding: EdgeInsets.only(left: 10, right: 10, top: 10),
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
                        padding:
                            const EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "TrackID: ${data[index].trackId}",
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
                                        data[index].parcelStatus == 0
                                            ? "Pending"
                                            : data[index].parcelStatus == 1
                                                ? "On Pickup"
                                                : data[index].parcelStatus == 2
                                                    ? "Picked Up"
                                                    : data[index]
                                                                .parcelStatus ==
                                                            3
                                                        ? "In Hub"
                                                        : data[index]
                                                                    .parcelStatus ==
                                                                4
                                                            ? "On Delivery"
                                                            : "Delivered",
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
                                      "Invoice Number: ${data[index].invoiceNumber}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color:
                                              Color.fromRGBO(121, 121, 121, 1)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          "images/calendar_deselect.png",
                                          height: 20,
                                          width: 20,
                                          color: Color.fromRGBO(204, 0, 0, 1),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "${data[index].pickupDate}",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color:
                                                  Color.fromRGBO(204, 0, 0, 1)),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      "${data[index].customerPayableAmount}tk",
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Color.fromRGBO(204, 0, 0, 1)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Name: ${data[index].customerName}",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                    Text(
                                      "Delivery: ${data[index].ghuriCharge}",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              Color.fromRGBO(121, 121, 121, 1)),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Mobile: ${data[index].customerNumber}",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    ),
                                    Text(
                                      data[index].productType == 1
                                          ? "GLASS"
                                              "/"
                                              "${data[index].productWeight}kg"
                                          : data[index].productType == 2
                                              ? "WOODEN"
                                                  "/"
                                                  "${data[index].productWeight}kg"
                                              : data[index].productType == 3
                                                  ? "METAL"
                                                      "/"
                                                      "${data[index].productWeight}kg"
                                                  : data[index].productType == 4
                                                      ? "DRESS"
                                                          "/"
                                                          "${data[index].productWeight}kg"
                                                      : data[index]
                                                                  .productType ==
                                                              5
                                                          ? "COSMETIC"
                                                              "/"
                                                              "${data[index].productWeight}kg"
                                                          : data[index]
                                                                      .productType ==
                                                                  6
                                                              ? "JEWELLERY"
                                                                  "/"
                                                                  "${data[index].productWeight}kg"
                                                              : data[index]
                                                                          .productType ==
                                                                      7
                                                                  ? "BOOK"
                                                                      "/"
                                                                      "${data[index].productWeight}kg"
                                                                  : data[index]
                                                                              .productType ==
                                                                          8
                                                                      ? "DOCUMENT"
                                                                          "/"
                                                                          "${data[index].productWeight}kg"
                                                                      : "0",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
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
    ));
  }
}

Future<List<AddParcelRequestModel>?> parcelList() async {
  String url =
      // "https://dev.api.ghuriparcel.com/v1/parcel/list?merchant_id=35&start_date=2021-09-22T00:00:01Z&end_date=2021-09-23T23:59:59Z&id=35&department=2";
      API.parcelList +
          "$_merchantId" +
          "&" +
          "start_date=$_firstDateInput" "T00:00:01Z" +
          "&" +
          "end_date=$_lastDateInput" "T23:59:59Z" +
          "&" "id=$_merchantId&department=2";
  print(url);
  var response = await http.get(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      'Authorization':
          'Basic UjJoMWNtbEZlSEJ5WlhOTVZFUTpVMk55WldOMFMwVlpaMmgxY21sRldGQlNSVk5UVEZSRQ==',
    },
  );

  Map<String, dynamic> jsonResponse = json.decode(response.body);
  print(jsonResponse);
  List<dynamic> data = jsonResponse["parcels"];
  print(data);
  return data.map((data) => new AddParcelRequestModel.fromJson(data)).toList();
  // return jsonResponse.map((data) => new AddParcelRequestModel.fromJson(data))
  //     .toList();

  // if (response.statusCode == 200) {
  //   List jsonResponse = json.decode(response.body);
  //
  //   print(jsonResponse);
  //   return jsonResponse
  //       .map((data) => new AddParcelRequestModel.fromJson(data))
  //       .toList();
  // } else {
  //   throw Exception('Unexpected error occured!');
  // }
}
