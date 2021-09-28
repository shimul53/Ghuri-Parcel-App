import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:ghuri_parcel_app/Models/addParcel_model.dart';
import 'package:ghuri_parcel_app/configApi.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

String? _trackId;
String? _parcel_trackId;
String? _customer_name;
String? _customer_number;
String? _invoice_number;

class ParcelDetailsSearchScreen extends StatefulWidget {
  @override
  _ParcelDetailsSearchScreenState createState() =>
      _ParcelDetailsSearchScreenState();
}

class _ParcelDetailsSearchScreenState extends State<ParcelDetailsSearchScreen> {
  Future<List<AddParcelRequestModel>>? futureData;
  final TextEditingController searchTypeTextEditingController =
      new TextEditingController();
  final TextEditingController searchTextEditingController =
      new TextEditingController();
  var items = [
    "Track ID",
    "Invoice",
    "Name",
    "Number",
  ];

  searchListItem() {
    if (searchTypeTextEditingController.text == "Track ID") {
      setState(() {
        _parcel_trackId = "track_Id";
        _trackId = searchTextEditingController.text;
        futureData = parcelList();
      });
    } else if (searchTypeTextEditingController.text == "Invoice") {
      setState(() {
        _parcel_trackId = "invoice_number";
        _trackId = searchTextEditingController.text;
        futureData = parcelList();
      });
    } else if (searchTypeTextEditingController.text == "Name") {
      setState(() {
        _parcel_trackId = "customer_name";
        _trackId = searchTextEditingController.text;
        futureData = parcelList();
      });
    } else if (searchTypeTextEditingController.text == "Number") {
      setState(() {
        _parcel_trackId = "customer_number";
        _trackId = searchTextEditingController.text;
        futureData = parcelList();
      });
    } else {
      setState(() {
        _trackId = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 237, 237, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Search Parcel",
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
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
            ),
            child: Center(
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          child: TextField(
                            controller: searchTypeTextEditingController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 10, bottom: 15, top: 20, right: 20),
                              hintText: "Search...",
                              suffixIcon: PopupMenuButton<String>(
                                icon: const Icon(
                                  Icons.arrow_drop_down,
                                ),
                                onSelected: (String value) {
                                  searchTypeTextEditingController.text = value;
                                },
                                itemBuilder: (BuildContext context) {
                                  return items.map<PopupMenuItem<String>>(
                                      (String value) {
                                    return new PopupMenuItem(
                                        child: new Text(value), value: value);
                                  }).toList();
                                },
                              ),
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.0,
                              ),
                            ),
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          child: TextField(
                            controller: searchTextEditingController,
                            keyboardType: TextInputType.name,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              contentPadding: EdgeInsets.only(
                                  left: 15, bottom: 15, top: 20, right: 20),
                            ),
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                          left: 10,
                          right: 10,
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              parcelList();
                              searchListItem();
                            });
                          },
                          icon: Image.asset(
                            "images/search_ico.png",
                            height: 30,
                            width: 30,
                            color: Color.fromRGBO(33, 33, 33, 1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<AddParcelRequestModel>>(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<AddParcelRequestModel>? data = snapshot.data;
                  return ListView.builder(
                      itemCount: data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return TextButton(
                          onPressed: () {
                            Navigator.push(
                                (context),
                                MaterialPageRoute(
                                    builder: (context) => Scaffold(
                                          backgroundColor:
                                              Color.fromRGBO(237, 237, 237, 1),
                                          appBar: AppBar(
                                            backgroundColor: Colors.white,
                                            title: Text(
                                              "Parcel Details",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.black),
                                            ),
                                            leading: IconButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              icon: Icon(
                                                Icons.arrow_back_ios_rounded,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          body: Column(
                                            children: [
                                              Expanded(
                                                child: SingleChildScrollView(
                                                  child: Container(
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 10.0,
                                                                  bottom: 10.0,
                                                                  left: 10.0,
                                                                  right: 10.0),
                                                          child: Container(
                                                            height: 245,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 30,
                                                                    right: 20,
                                                                    top: 10),
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        20.0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        20.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        20.0),
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 10),
                                                              child: Column(
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Column(
                                                                        children: [
                                                                          Text(
                                                                            "TrackID: ${data[index].trackId}",
                                                                            style:
                                                                                TextStyle(fontSize: 16, color: Colors.black),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Column(
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "Invoice Number: ${data[index].invoiceNumber}",
                                                                            style:
                                                                                TextStyle(fontSize: 16, color: Color.fromRGBO(121, 121, 121, 1)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Column(
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "Product Type: ${data[index].productType == 1 ? "GLASS"
                                                                                "/"
                                                                                "${data[index].productWeight}kg" : data[index].productType == 2 ? "WOODEN"
                                                                                "/"
                                                                                "${data[index].productWeight}kg" : data[index].productType == 3 ? "METAL"
                                                                                "/"
                                                                                "${data[index].productWeight}kg" : data[index].productType == 4 ? "DRESS"
                                                                                "/"
                                                                                "${data[index].productWeight}kg" : data[index].productType == 5 ? "COSMETIC"
                                                                                "/"
                                                                                "${data[index].productWeight}kg" : data[index].productType == 6 ? "JEWELLERY"
                                                                                "/"
                                                                                "${data[index].productWeight}kg" : data[index].productType == 7 ? "BOOK"
                                                                                "/"
                                                                                "${data[index].productWeight}kg" : data[index].productType == 8 ? "DOCUMENT"
                                                                                "/"
                                                                                "${data[index].productWeight}kg" : "0"}",
                                                                            style:
                                                                                TextStyle(fontSize: 12, color: Color.fromRGBO(121, 121, 121, 1)),
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
                                                                        children: [
                                                                          Text(
                                                                            "Price: ${data[index].customerPayableAmount}",
                                                                            style:
                                                                                TextStyle(fontSize: 15, color: Color.fromRGBO(204, 0, 0, 1)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Column(
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "Ghuri Charge: ${data[index].ghuriCharge}",
                                                                            style:
                                                                                TextStyle(fontSize: 12, color: Color.fromRGBO(121, 121, 121, 1)),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                125,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Column(
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "Receivable Amount: ${data[index].receivableAmount}",
                                                                            style:
                                                                                TextStyle(fontSize: 12, color: Color.fromRGBO(121, 121, 121, 1)),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                125,
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
                                                                        children: [
                                                                          Text(
                                                                            "Name: ${data[index].customerName}",
                                                                            style:
                                                                                TextStyle(fontSize: 12, color: Color.fromRGBO(33, 33, 33, 1)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Column(
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "Mobile: ${data[index].customerNumber}",
                                                                            style:
                                                                                TextStyle(fontSize: 12, color: Color.fromRGBO(33, 33, 33, 1)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 5,
                                                                  ),
                                                                  Column(
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          Text(
                                                                            "Address:${data[index].deliveryAddress} , ${data[index].customerArea}",
                                                                            style:
                                                                                TextStyle(fontSize: 12, color: Color.fromRGBO(33, 33, 33, 1)),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                125,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  top: 10.0,
                                                                  bottom: 10.0,
                                                                  left: 10.0,
                                                                  right: 10.0),
                                                          child: Container(
                                                            height: 350,
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 30,
                                                                    right: 20,
                                                                    top: 10),
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20.0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        20.0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        20.0),
                                                                bottomRight: Radius
                                                                    .circular(
                                                                        20.0),
                                                              ),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 10),
                                                              child: Column(
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: <
                                                                        Widget>[
                                                                      Icon(
                                                                        Icons
                                                                            .check_circle,
                                                                        size:
                                                                            30,
                                                                        color: data[index].parcelStatus == 0 || data[index].parcelStatus == 1 || data[index].parcelStatus == 2 || data[index].parcelStatus == 3 || data[index].parcelStatus == 4 || data[index].parcelStatus == 5
                                                                            ? Color.fromRGBO(
                                                                                255,
                                                                                204,
                                                                                0,
                                                                                1)
                                                                            : Color.fromRGBO(
                                                                                180,
                                                                                180,
                                                                                180,
                                                                                1),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            30,
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  'Pending',
                                                                                  style: TextStyle(fontSize: 15, color: Colors.black),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  '8 Aug 2021 12:00 PM',
                                                                                  style: TextStyle(fontSize: 12, color: Color.fromRGBO(121, 121, 121, 1)),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 30,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: <
                                                                        Widget>[
                                                                      Icon(
                                                                        Icons
                                                                            .check_circle,
                                                                        size:
                                                                            30,
                                                                        color: data[index].parcelStatus == 1 || data[index].parcelStatus == 2 || data[index].parcelStatus == 3 || data[index].parcelStatus == 4 || data[index].parcelStatus == 5
                                                                            ? Color.fromRGBO(
                                                                                255,
                                                                                204,
                                                                                0,
                                                                                1)
                                                                            : Color.fromRGBO(
                                                                                180,
                                                                                180,
                                                                                180,
                                                                                1),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            30,
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  'On Pickup',
                                                                                  style: TextStyle(fontSize: 15, color: Colors.black),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  'waiting...',
                                                                                  style: TextStyle(fontSize: 12, color: Color.fromRGBO(121, 121, 121, 1)),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 30,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: <
                                                                        Widget>[
                                                                      Icon(
                                                                        Icons
                                                                            .check_circle,
                                                                        size:
                                                                            30,
                                                                        color: data[index].parcelStatus == 2 || data[index].parcelStatus == 3 || data[index].parcelStatus == 4 || data[index].parcelStatus == 5
                                                                            ? Color.fromRGBO(
                                                                                255,
                                                                                204,
                                                                                0,
                                                                                1)
                                                                            : Color.fromRGBO(
                                                                                180,
                                                                                180,
                                                                                180,
                                                                                1),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            30,
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  'Picked Up',
                                                                                  style: TextStyle(fontSize: 15, color: Colors.black),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  'waiting...',
                                                                                  style: TextStyle(fontSize: 12, color: Color.fromRGBO(121, 121, 121, 1)),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 30,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: <
                                                                        Widget>[
                                                                      Icon(
                                                                        Icons
                                                                            .check_circle,
                                                                        size:
                                                                            30,
                                                                        color: data[index].parcelStatus == 3 || data[index].parcelStatus == 4 || data[index].parcelStatus == 5
                                                                            ? Color.fromRGBO(
                                                                                255,
                                                                                204,
                                                                                0,
                                                                                1)
                                                                            : Color.fromRGBO(
                                                                                180,
                                                                                180,
                                                                                180,
                                                                                1),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            30,
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  'In Hub',
                                                                                  style: TextStyle(fontSize: 15, color: Colors.black),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  'waiting...',
                                                                                  style: TextStyle(fontSize: 12, color: Color.fromRGBO(121, 121, 121, 1)),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 30,
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: <
                                                                        Widget>[
                                                                      Icon(
                                                                        Icons
                                                                            .check_circle,
                                                                        size:
                                                                            30,
                                                                        color: data[index].parcelStatus == 4 || data[index].parcelStatus == 5
                                                                            ? Color.fromRGBO(
                                                                                255,
                                                                                204,
                                                                                0,
                                                                                1)
                                                                            : Color.fromRGBO(
                                                                                180,
                                                                                180,
                                                                                180,
                                                                                1),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            30,
                                                                      ),
                                                                      Expanded(
                                                                        child:
                                                                            Column(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  'On Delivery',
                                                                                  style: TextStyle(fontSize: 15, color: Colors.black),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              children: [
                                                                                Text(
                                                                                  'waiting...',
                                                                                  style: TextStyle(fontSize: 12, color: Color.fromRGBO(121, 121, 121, 1)),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                          child: Row(
                                                            children: <Widget>[
                                                              Expanded(
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: GlowButton(
                                                                      height: 50,
                                                                      borderRadius: new BorderRadius.circular(24.0),
                                                                      color: Color.fromRGBO(255, 204, 0, 1),
                                                                      glowColor: Color.fromRGBO(255, 204, 0, 1),
                                                                      child: Container(
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Column(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Image.asset(
                                                                                    "images/deselect_Call.png",
                                                                                    height: 20,
                                                                                    width: 20,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(
                                                                                width: 10,
                                                                              ),
                                                                              Column(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text("Pick Up Man",
                                                                                      style: TextStyle(
                                                                                        fontSize: 16.0,
                                                                                      )),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      // shape: new RoundedRectangleBorder(
                                                                      //   borderRadius:
                                                                      //       new BorderRadius.circular(24.0),
                                                                      // ),
                                                                      // splashColor: Color.fromRGBO(255, 204, 0, 1),
                                                                      // elevation: 10,
                                                                      onPressed: () {
                                                                        _launchCaller();
                                                                      }),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          8.0),
                                                                  child: GlowButton(
                                                                      color: Colors.white,
                                                                      height: 50,
                                                                      borderRadius: new BorderRadius.circular(24.0),
                                                                      glowColor: Colors.grey,
                                                                      child: Container(
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            Center(
                                                                          child:
                                                                              Row(
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Column(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Image.asset(
                                                                                    "images/deselect_Call.png",
                                                                                    height: 20,
                                                                                    width: 20,
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(
                                                                                width: 10,
                                                                              ),
                                                                              Column(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Text("Delivery Man",
                                                                                      style: TextStyle(
                                                                                        fontSize: 16.0,
                                                                                      )),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      onPressed: () {
                                                                        _launchCaller();
                                                                      }),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 50,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 10.0, left: 10.0, right: 10.0),
                            child: Container(
                              height: 200,
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
                                                    : data[index]
                                                                .parcelStatus ==
                                                            1
                                                        ? "On Pickup"
                                                        : data[index]
                                                                    .parcelStatus ==
                                                                2
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
                                                  color: Color.fromRGBO(
                                                      121, 121, 121, 1)),
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
                                                  color: Color.fromRGBO(
                                                      204, 0, 0, 1),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "${data[index].pickupDate}",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color.fromRGBO(
                                                          204, 0, 0, 1)),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              "${data[index].customerPayableAmount}tk",
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Color.fromRGBO(
                                                      204, 0, 0, 1)),
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
                                                  fontSize: 14,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "Delivery: ${data[index].ghuriCharge}",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color.fromRGBO(
                                                      121, 121, 121, 1)),
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
                                                  fontSize: 14,
                                                  color: Colors.black),
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
                                                      : data[index]
                                                                  .productType ==
                                                              3
                                                          ? "METAL"
                                                              "/"
                                                              "${data[index].productWeight}kg"
                                                          : data[index]
                                                                      .productType ==
                                                                  4
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
                                                                      : data[index].productType ==
                                                                              7
                                                                          ? "BOOK"
                                                                              "/"
                                                                              "${data[index].productWeight}kg"
                                                                          : data[index].productType == 8
                                                                              ? "DOCUMENT"
                                                                                  "/"
                                                                                  "${data[index].productWeight}kg"
                                                                              : "0",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black),
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
            ),
          ),
        ],
      ),
    );
  }
}

Future<List<AddParcelRequestModel>> parcelList() async {
  String url = API.baseUrl +
      "v1/parcel/search?department=1&id=1&tag=$_parcel_trackId&value=$_trackId";

  var response = await http.get(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${API.bearerToken}',
    },
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> jsonResponse = json.decode(response.body);
    List<dynamic> data = jsonResponse["parcels"];

    return data
        .map((data) => new AddParcelRequestModel.fromJson(data))
        .toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}

_launchCaller() async {
  const url = "tel:";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
