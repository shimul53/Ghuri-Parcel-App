import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ghuri_parcel_app/AllScreens/parcelDetailsSearchScreen.dart';
import 'package:ghuri_parcel_app/AllScreens/parcelItemDetailsScreen.dart';
import 'package:intl/intl.dart';

class ParcelDetailsTab extends StatefulWidget {
  const ParcelDetailsTab({Key? key}) : super(key: key);

  @override
  _ParcelDetailsTabState createState() => _ParcelDetailsTabState();
}

class _ParcelDetailsTabState extends State<ParcelDetailsTab> {
  DateTime? firstDate;
  DateTime? lastDate;

  final dateFormat = DateFormat('yyyy-MM-dd');
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
                                      ;
                                    },
                                    shape: new RoundedRectangleBorder(
                                        borderRadius:
                                            new BorderRadius.circular(10.0)),
                                    child: Row(
                                      children: [
                                        Center(
                                          child: Center(
                                            child: Text(
                                              (firstDate == null)
                                                  ? dateFormat
                                                      .format(DateTime.now())
                                                  : dateFormat
                                                      .format(firstDate!),
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
                                              (lastDate == null)
                                                  ? dateFormat
                                                      .format(DateTime.now())
                                                  : dateFormat
                                                      .format(lastDate!),
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
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            (context),
                            MaterialPageRoute(
                                builder: (context) =>
                                    ParcelItemDetailsScreen()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 30.0, bottom: 10.0, left: 5.0, right: 5.0),
                        child: Container(
                          height: 200,
                          padding: EdgeInsets.only(left: 10, right: 5, top: 10),
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
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "TrackID: GP759044",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 120,
                                    ),
                                    Card(
                                      color: Color.fromRGBO(255, 204, 0, 1),
                                      child: SizedBox(
                                        height: 30,
                                        width: 80,
                                        child: Center(
                                          child: Text(
                                            "Pending",
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
                                          "Invoice Number: 01",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color.fromRGBO(
                                                  180, 180, 180, 1)),
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
                                          "2021-08-08",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color:
                                                  Color.fromRGBO(204, 0, 0, 1)),
                                        ),
                                        SizedBox(
                                          width: 190,
                                        ),
                                        Text(
                                          "1000tk",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color:
                                                  Color.fromRGBO(204, 0, 0, 1)),
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
                                      children: [
                                        Text(
                                          "Name: Shimul Tamo",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: 125,
                                        ),
                                        Text(
                                          "Delivery: 70tk",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color.fromRGBO(
                                                  180, 180, 180, 1)),
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
                                      children: [
                                        Text(
                                          "Mobile: 01752438061",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: 125,
                                        ),
                                        Text(
                                          "GLASS/2 kg",
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
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            (context),
                            MaterialPageRoute(
                                builder: (context) =>
                                    ParcelItemDetailsScreen()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
                        child: Container(
                          height: 200,
                          padding: EdgeInsets.only(left: 10, right: 5, top: 10),
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
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "TrackID: GP759044",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 120,
                                    ),
                                    Card(
                                      color: Color.fromRGBO(255, 204, 0, 1),
                                      child: SizedBox(
                                        height: 30,
                                        width: 80,
                                        child: Center(
                                          child: Text(
                                            "Pending",
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
                                          "Invoice Number: 01",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color.fromRGBO(
                                                  180, 180, 180, 1)),
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
                                          "2021-08-08",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color:
                                                  Color.fromRGBO(204, 0, 0, 1)),
                                        ),
                                        SizedBox(
                                          width: 190,
                                        ),
                                        Text(
                                          "1000tk",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color:
                                                  Color.fromRGBO(204, 0, 0, 1)),
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
                                      children: [
                                        Text(
                                          "Name: Shimul Tamo",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: 125,
                                        ),
                                        Text(
                                          "Delivery: 70tk",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color.fromRGBO(
                                                  180, 180, 180, 1)),
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
                                      children: [
                                        Text(
                                          "Mobile: 01752438061",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: 125,
                                        ),
                                        Text(
                                          "GLASS/2 kg",
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
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            (context),
                            MaterialPageRoute(
                                builder: (context) =>
                                    ParcelItemDetailsScreen()));
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10.0, left: 5.0, right: 5.0),
                        child: Container(
                          height: 200,
                          padding: EdgeInsets.only(left: 10, right: 5, top: 10),
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
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "TrackID: GP759044",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 120,
                                    ),
                                    Card(
                                      color: Color.fromRGBO(255, 204, 0, 1),
                                      child: SizedBox(
                                        height: 30,
                                        width: 80,
                                        child: Center(
                                          child: Text(
                                            "Pending",
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
                                          "Invoice Number: 01",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Color.fromRGBO(
                                                  180, 180, 180, 1)),
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
                                          "2021-08-08",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color:
                                                  Color.fromRGBO(204, 0, 0, 1)),
                                        ),
                                        SizedBox(
                                          width: 190,
                                        ),
                                        Text(
                                          "1000tk",
                                          style: TextStyle(
                                              fontSize: 15,
                                              color:
                                                  Color.fromRGBO(204, 0, 0, 1)),
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
                                      children: [
                                        Text(
                                          "Name: Shimul Tamo",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: 125,
                                        ),
                                        Text(
                                          "Delivery: 70tk",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Color.fromRGBO(
                                                  180, 180, 180, 1)),
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
                                      children: [
                                        Text(
                                          "Mobile: 01752438061",
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black),
                                        ),
                                        SizedBox(
                                          width: 125,
                                        ),
                                        Text(
                                          "GLASS/2 kg",
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
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
