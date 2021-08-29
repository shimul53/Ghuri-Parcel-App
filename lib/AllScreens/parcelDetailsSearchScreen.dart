import 'package:flutter/material.dart';

class ParcelDetailsSearchScreen extends StatefulWidget {
  @override
  _ParcelDetailsSearchScreenState createState() =>
      _ParcelDetailsSearchScreenState();
}

class _ParcelDetailsSearchScreenState extends State<ParcelDetailsSearchScreen> {
  final TextEditingController searchTextEditingController =
      new TextEditingController();
  var items = [
    "Track ID",
    "Invoice",
    "Name",
    "Number",
  ];

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
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
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
                          controller: searchTextEditingController,
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
                                searchTextEditingController.text = value;
                              },
                              itemBuilder: (BuildContext context) {
                                return items
                                    .map<PopupMenuItem<String>>((String value) {
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
                        onPressed: () {},
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
      ),
    );
  }
}
