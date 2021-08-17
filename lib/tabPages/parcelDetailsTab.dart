import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParcelDetailsTab extends StatefulWidget {
  const ParcelDetailsTab({Key? key}) : super(key: key);

  @override
  _ParcelDetailsTabState createState() => _ParcelDetailsTabState();
}

class _ParcelDetailsTabState extends State<ParcelDetailsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 237, 237, 1),
      body: Container(
        height: 190,
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
                      width: 160,
                    ),
                    Image.asset(
                      "images/search_ico.png",
                      height: 20,
                      width: 20,
                      color: Color.fromRGBO(33, 33, 33, 1),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1)),
                          child: SizedBox(
                            height: 40,
                            width: 107,
                            child: Center(
                              child: Row(
                                children: [
                                  Center(
                                    child: TextButton(
                                        onPressed: () {
                                          showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(),
                                            firstDate: DateTime(2019),
                                            lastDate: DateTime(2500),
                                          ).then((value) => null);
                                        },
                                        child: Center(
                                          child: Text(
                                            "2021-08-17",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 12.0,
                                            ),
                                          ),
                                        )),
                                  ),
                                  Image.asset(
                                    "images/calendar_deselect.png",
                                    height: 12,
                                    width: 12,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1)),
                          child: SizedBox(
                            height: 40,
                            width: 107,
                            child: Center(
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Center(
                                    child: Text(
                                      "2021-08-17",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    "images/calendar_deselect.png",
                                    height: 12,
                                    width: 12,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                          shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 1)),
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
    );
  }
}
