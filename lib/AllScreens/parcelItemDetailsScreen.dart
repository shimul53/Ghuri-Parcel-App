import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_glow/flutter_glow.dart';

class ParcelItemDetailsScreen extends StatefulWidget {
  @override
  _ParcelItemDetailsScreenState createState() =>
      _ParcelItemDetailsScreenState();
}

class _ParcelItemDetailsScreenState extends State<ParcelItemDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 237, 237, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Parcel Details",
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
              child: Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                      child: Container(
                        height: 245,
                        padding: EdgeInsets.only(left: 30, right: 20, top: 10),
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
                                            fontSize: 16, color: Colors.black),
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
                                height: 5,
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Product Type: GLASS / 2 kg",
                                        style: TextStyle(
                                            fontSize: 12,
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
                                      Text(
                                        "Price: 1000tk",
                                        style: TextStyle(
                                            fontSize: 15,
                                            color:
                                                Color.fromRGBO(204, 0, 0, 1)),
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
                                        "Ghuri Charge: 70 tk",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(
                                                180, 180, 180, 1)),
                                      ),
                                      SizedBox(
                                        width: 125,
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
                                        "Receivable Amount: 930 tk",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(
                                                180, 180, 180, 1)),
                                      ),
                                      SizedBox(
                                        width: 125,
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
                                        "Name: Shimul Tamo",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Color.fromRGBO(33, 33, 33, 1)),
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
                                        "Mobile: 01752438061",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Color.fromRGBO(33, 33, 33, 1)),
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
                                        "Address: Mirpur 1,Dhaka",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Color.fromRGBO(33, 33, 33, 1)),
                                      ),
                                      SizedBox(
                                        width: 125,
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
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                      child: Container(
                        height: 300,
                        padding: EdgeInsets.only(left: 30, right: 20, top: 10),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    Icons.check_circle,
                                    size: 30,
                                    color: Color.fromRGBO(255, 204, 0, 1),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Pending',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '8 Aug 2021 12:00 PM',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color.fromRGBO(
                                                      180, 180, 180, 1)),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    Icons.check_circle,
                                    size: 30,
                                    color: Color.fromRGBO(180, 180, 180, 1),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'On Pickup',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'waiting...',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color.fromRGBO(
                                                      180, 180, 180, 1)),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    Icons.check_circle,
                                    size: 30,
                                    color: Color.fromRGBO(180, 180, 180, 1),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'Picked Up',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'waiting...',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color.fromRGBO(
                                                      180, 180, 180, 1)),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    Icons.check_circle,
                                    size: 30,
                                    color: Color.fromRGBO(180, 180, 180, 1),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'In Hub',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'waiting...',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color.fromRGBO(
                                                      180, 180, 180, 1)),
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
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Icon(
                                    Icons.check_circle,
                                    size: 30,
                                    color: Color.fromRGBO(180, 180, 180, 1),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'On Delivery',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              'waiting...',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Color.fromRGBO(
                                                      180, 180, 180, 1)),
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
                              padding: const EdgeInsets.all(8.0),
                              child: GlowButton(
                                  height: 50,
                                  borderRadius: new BorderRadius.circular(24.0),
                                  color: Color.fromRGBO(255, 204, 0, 1),
                                  glowColor: Color.fromRGBO(255, 204, 0, 1),
                                  child: Container(
                                    height: 50.0,
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                  onPressed: () {}),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GlowButton(
                                  color: Colors.white,
                                  height: 50,
                                  borderRadius: new BorderRadius.circular(24.0),
                                  glowColor: Colors.grey,
                                  child: Container(
                                    height: 50.0,
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                  onPressed: () {}),
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
    );
  }
}
