import 'package:flutter/material.dart';

class ContactScreen extends StatefulWidget {
  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 237, 237, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 204, 0, 1),
        title: Text(
          "Ghrui Helpline",
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
                      width: 300.0,
                      height: 300.0,
                      alignment: Alignment.center,
                    ),
                  ),
                  SizedBox(
                    height: 80.0,
                  ),
                  Text(
                    "Get Ghuri Help ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25, color: Color.fromRGBO(33, 33, 33, 1)),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "whenever You need",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 25, color: Color.fromRGBO(33, 33, 33, 1)),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        RaisedButton(
                          color: Color.fromRGBO(255, 204, 0, 1),
                          onPressed: () {},
                          child: Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 60,
                                  width: 390,
                                  child: Center(
                                    child: Text(
                                      "Call Ghuri",
                                      style: TextStyle(
                                          fontSize: 25, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
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
