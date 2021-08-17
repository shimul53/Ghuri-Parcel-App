import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DashboardHomeTab extends StatefulWidget {
  @override
  _DashboardHomeTabState createState() => _DashboardHomeTabState();
}

class _DashboardHomeTabState extends State<DashboardHomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 237, 237, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(
                top: 80.0, left: 20.0, right: 20.0, bottom: 20.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Dashboard",
                          style: TextStyle(
                            color: Color.fromRGBO(33, 33, 33, 1),
                            fontSize: 20.0,
                          ),
                        ),
                        SizedBox(
                          width: 200,
                        ),
                        CircleAvatar(
                          backgroundColor: Color.fromRGBO(255, 204, 0, 1),
                          child: Image(
                            image: AssetImage("images/ghuri.png"),
                            height: 45,
                            width: 45,
                          ),
                          radius: 25.0,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Hello,',
                      style: TextStyle(
                        color: Color.fromRGBO(33, 33, 33, 1),
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Shimul Tamo",
                      style: TextStyle(
                        color: Color.fromRGBO(87, 87, 87, 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Expanded(
              child: Container(
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                    bottomRight: Radius.circular(20.0),
                  ),
                ),
                child: Row(
                  children: [
                    Text("Parcel Statistics"),
                    SizedBox(
                      width: 100,
                    ),
                    // Card(
                    //   color: Color.fromRGBO(255, 204, 0, 1),
                    //   child: Padding(
                    //     padding: EdgeInsets.all(10.0),
                    //     child: Text(
                    //       "All",
                    //       textAlign: TextAlign.center,
                    //       style: TextStyle(
                    //         color: Colors.black,
                    //         fontSize: 20.0,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    Card(
                      color: Color.fromRGBO(255, 204, 0, 1),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 30,
                          width: 50,
                          child: Text("All",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                              )),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
