import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:ghuri_parcel_app/AllScreens/listviewItem.dart';
import 'package:ghuri_parcel_app/AllScreens/parcelDetailsSearchScreen.dart';
import 'package:ghuri_parcel_app/AllScreens/parcelItemDetailsScreen.dart';
import 'package:ghuri_parcel_app/Models/addParcel_model.dart';
import 'package:ghuri_parcel_app/configApi.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

int? _merchantId;
String? _bearerToken;
String? _firstDate;
String _firstDateValue = "";
DateTime? _selectedDate;

String? _firstDateInput;
String? _lastDateInput;

class ParcelDetailsTab extends StatefulWidget {
  @override
  _ParcelDetailsTabState createState() => _ParcelDetailsTabState();
}

class _ParcelDetailsTabState extends State<ParcelDetailsTab>
    with AutomaticKeepAliveClientMixin<ParcelDetailsTab> {
  int? selectedIndex;

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

  getListItem() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _merchantId = (sharedPreferences.getInt(API.merchantId));
      _bearerToken = (sharedPreferences.getString(API.token) ?? '');
    });
  }

  Future<List<AddParcelRequestModel>?>? futureData;

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _firstDate();
    _lastDate();
    getListItem();
    //searchParcel();
  }

  bool _isSearchItemVisible = false;
  searchParcel() {
    if (_firstDateInput != null ||
        _lastDateInput != null ||
        _merchantId != null) {
      setState(() {
        _isSearchItemVisible = true;
        _firstDate();
        _lastDate();
        getListItem();
        parcelList();
        futureData = parcelList();
      });
    } else {
      setState(() {
        _isSearchItemVisible = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 237, 237, 1),
      body: Column(
        children: [
          Container(
            height: 200,
            color: Colors.white,
            padding: EdgeInsets.only(
              top: 80.0,
              left: 20.0,
              right: 20.0,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Search Parcel",
                          style: TextStyle(
                              color: Color.fromRGBO(33, 33, 33, 1),
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 140,
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                (context),
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ParcelDetailsSearchScreen()));
                          },
                          icon: Image.asset(
                            "images/search_ico.png",
                            height: 20,
                            width: 20,
                            color: Color.fromRGBO(33, 33, 33, 1),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Card(
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1)),
                              child: SizedBox(
                                height: 40,
                                width: 107,
                                child: Center(
                                  child: OutlineButton(
                                    onPressed: () {
                                      showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2019),
                                          lastDate: DateTime(2500),
                                          builder: (BuildContext context,
                                              Widget? child) {
                                            return Theme(
                                              data: ThemeData.dark(),
                                              child: child!,
                                            );
                                          }).then((value) {
                                        setState(() {
                                          firstDate = value;
                                        });
                                      });
                                    },
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(10.0)),
                                    child: Row(
                                      children: [
                                        Center(
                                          child: Center(
                                            child: Text(
                                              _firstDate(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Image.asset(
                                          "images/calendar_deselect.png",
                                          height: 10,
                                          width: 10,
                                          color: Colors.black,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1)),
                              child: SizedBox(
                                height: 40,
                                width: 107,
                                child: Center(
                                  child: OutlineButton(
                                    onPressed: () {
                                      showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2019),
                                          lastDate: DateTime(2500),
                                          builder: (BuildContext context,
                                              Widget? child) {
                                            return Theme(
                                              data: ThemeData.dark(),
                                              child: child!,
                                            );
                                          }).then((value) {
                                        setState(() {
                                          lastDate = value;
                                        });
                                      });
                                    },
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(10.0)),
                                    child: Row(
                                      children: [
                                        Center(
                                          child: Center(
                                            child: Text(
                                              _lastDate(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Image.asset(
                                          "images/calendar_deselect.png",
                                          height: 10,
                                          width: 10,
                                          color: Colors.black,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 1)),
                              color: Color.fromRGBO(33, 33, 33, 1),
                              child: SizedBox(
                                height: 40,
                                width: 107,
                                child: Center(
                                  child: FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        _firstDate();
                                        _lastDate();
                                        searchParcel();
                                        parcelList();
                                      });
                                    },
                                    child: Text(
                                      "Search",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
              child: FutureBuilder<List<AddParcelRequestModel>?>(
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
                                                            color: Colors.white,
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
                                                              bottomRight:
                                                                  Radius
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
                                                                          style: TextStyle(
                                                                              fontSize: 16,
                                                                              color: Colors.black),
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
                                                                          style: TextStyle(
                                                                              fontSize: 16,
                                                                              color: Color.fromRGBO(121, 121, 121, 1)),
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
                                                                          style: TextStyle(
                                                                              fontSize: 12,
                                                                              color: Color.fromRGBO(121, 121, 121, 1)),
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
                                                                          style: TextStyle(
                                                                              fontSize: 15,
                                                                              color: Color.fromRGBO(204, 0, 0, 1)),
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
                                                                          style: TextStyle(
                                                                              fontSize: 12,
                                                                              color: Color.fromRGBO(121, 121, 121, 1)),
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
                                                                          style: TextStyle(
                                                                              fontSize: 12,
                                                                              color: Color.fromRGBO(121, 121, 121, 1)),
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
                                                                          style: TextStyle(
                                                                              fontSize: 12,
                                                                              color: Color.fromRGBO(33, 33, 33, 1)),
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
                                                                          style: TextStyle(
                                                                              fontSize: 12,
                                                                              color: Color.fromRGBO(33, 33, 33, 1)),
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
                                                                          style: TextStyle(
                                                                              fontSize: 12,
                                                                              color: Color.fromRGBO(33, 33, 33, 1)),
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
                                                            color: Colors.white,
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
                                                              bottomRight:
                                                                  Radius
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
                                                                      size: 30,
                                                                      color: data[index].parcelStatus == 0 ||
                                                                              data[index].parcelStatus ==
                                                                                  1 ||
                                                                              data[index].parcelStatus ==
                                                                                  2 ||
                                                                              data[index].parcelStatus ==
                                                                                  3 ||
                                                                              data[index].parcelStatus ==
                                                                                  4 ||
                                                                              data[index].parcelStatus ==
                                                                                  5
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
                                                                      width: 30,
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
                                                                      size: 30,
                                                                      color: data[index].parcelStatus == 1 ||
                                                                              data[index].parcelStatus ==
                                                                                  2 ||
                                                                              data[index].parcelStatus ==
                                                                                  3 ||
                                                                              data[index].parcelStatus ==
                                                                                  4 ||
                                                                              data[index].parcelStatus ==
                                                                                  5
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
                                                                      width: 30,
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
                                                                      size: 30,
                                                                      color: data[index].parcelStatus == 2 ||
                                                                              data[index].parcelStatus ==
                                                                                  3 ||
                                                                              data[index].parcelStatus ==
                                                                                  4 ||
                                                                              data[index].parcelStatus ==
                                                                                  5
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
                                                                      width: 30,
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
                                                                      size: 30,
                                                                      color: data[index].parcelStatus == 3 ||
                                                                              data[index].parcelStatus ==
                                                                                  4 ||
                                                                              data[index].parcelStatus ==
                                                                                  5
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
                                                                      width: 30,
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
                                                                      size: 30,
                                                                      color: data[index].parcelStatus == 4 ||
                                                                              data[index].parcelStatus ==
                                                                                  5
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
                                                                      width: 30,
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
                                                                child:
                                                                    GlowButton(
                                                                        height:
                                                                            50,
                                                                        borderRadius:
                                                                            new BorderRadius.circular(
                                                                                24.0),
                                                                        color: Color.fromRGBO(
                                                                            255,
                                                                            204,
                                                                            0,
                                                                            1),
                                                                        glowColor: Color.fromRGBO(
                                                                            255,
                                                                            204,
                                                                            0,
                                                                            1),
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
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
                                                                        onPressed:
                                                                            () {
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
                                                                child:
                                                                    GlowButton(
                                                                        color: Colors
                                                                            .white,
                                                                        height:
                                                                            50,
                                                                        borderRadius:
                                                                            new BorderRadius.circular(
                                                                                24.0),
                                                                        glowColor:
                                                                            Colors
                                                                                .grey,
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              Center(
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
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
                                                                        onPressed:
                                                                            () {
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
                                                  : data[index].parcelStatus ==
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
                                                    : data[index].productType ==
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
                                                                        : data[index].productType ==
                                                                                8
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
          )),
        ],
      ),
    );
  }
}

Future<List<AddParcelRequestModel>?> parcelList() async {
  String url = API.parcelList +
      "$_merchantId" +
      "&" +
      "start_date=$_firstDateInput" "T00:00:01Z" +
      "&" +
      "end_date=$_lastDateInput" "T23:59:59Z" +
      "&" "id=$_merchantId&department=2";

  var response = await http.get(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $_bearerToken',
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
