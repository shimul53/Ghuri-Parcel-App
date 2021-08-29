import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  static const String idScreen = "profileScreen";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
              child: Column(
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
                    "Shimul Tamo",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25, color: Color.fromRGBO(33, 33, 33, 1)),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "01752438061",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16, color: Color.fromRGBO(121, 121, 121, 1)),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "shimul@gmail.com",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25, color: Color.fromRGBO(180, 180, 180, 1)),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Text(
                    "01 Tech E-School",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16, color: Color.fromRGBO(121, 121, 121, 1)),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "SI868365",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25, color: Color.fromRGBO(33, 33, 33, 1)),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Merchant City: ",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                              Text(
                                "Mirpur",
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Merchant Area: ",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black),
                              ),
                              Text(
                                "Mirpur",
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
                                  "5 Salimuddin Market road,Paikpara",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
