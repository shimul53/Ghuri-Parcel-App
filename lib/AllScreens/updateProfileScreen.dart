import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatefulWidget {
  @override
  _UpdateProfileScreenState createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  TextEditingController merchantNameTextEditingController =
      TextEditingController();

  TextEditingController emailTextEditingController = TextEditingController();

  TextEditingController shopNameTextEditingController = TextEditingController();

  TextEditingController shopLinkTextEditingController = TextEditingController();

  TextEditingController addressTextEditingController = TextEditingController();

  final TextEditingController cityTextEditingController =
      new TextEditingController();

  var items = [
    'Bagerhat',
    'Bandarban',
    'Barguna',
    'Barisal',
    'Bhola',
    'Bogra',
    'Brahmanbaria',
    'Chandpur',
    'Chapainawabganj',
    'Chattogram',
    'Chuadanga',
    'Comilla',
    "Cox's Bazar",
    'Dhaka',
    'Dinajpur',
    'Faridpur',
    'Feni',
    'Gaibandha',
    'Gazipur',
    'Gopalganj',
    'Habiganj',
    'Jamalpur ',
    'Jessore',
    'Jhalokati',
    'Jhenaidah',
    'Joypurhat',
    'Khagrachhari',
    'Khulna',
    'Kishoreganj',
    'Kurigram',
    'Kushtia',
    'Lakshmipur',
    'Lalmanirhat',
    'Madaripur ',
    'Magura',
    'Manikganj',
    'Meherpur',
    'Moulvibazar',
    'Munshiganj',
    'Mymensingh',
    'Naogaon',
    'Narail',
    'Naryanganj',
    'Narsingdi',
    'Natore',
    'Netrakona',
    'Nilphamari ',
    'Noakhali',
    'Pabna',
    'Panchagarh',
    'Patuakhali',
    'Pirojpur',
    'Rajbari',
    'Rajshahi',
    'Rangamati',
    'Rangpur',
    'Satkhira',
    'Shariatpur',
    'Sherpur ',
    'Sirajgan',
    'Sunamganj',
    'Sylhet',
    'Tangail',
    'Thakurgaon',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Update Profile",
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
      backgroundColor: Color.fromRGBO(237, 237, 237, 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Text(
                      "Update your Merchant Profile",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      cursorColor: Color.fromRGBO(255, 204, 0, 1),
                      controller: merchantNameTextEditingController,
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(255, 204, 0, 1)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(255, 204, 0, 1)),
                        ),
                        prefixIcon: Image.asset(
                          "images/customer_deselect.png",
                          scale: 3,
                        ),
                        labelText: "Merchant Name",
                        labelStyle:
                            TextStyle(fontSize: 14.0, color: Colors.black87),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    TextField(
                      controller: emailTextEditingController,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Color.fromRGBO(255, 204, 0, 1),
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(255, 204, 0, 1)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(255, 204, 0, 1)),
                        ),
                        prefixIcon: Image.asset(
                          "images/message.png",
                          scale: 3,
                        ),
                        labelText: "Email",
                        labelStyle:
                            TextStyle(fontSize: 14.0, color: Colors.black87),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: shopNameTextEditingController,
                      cursorColor: Color.fromRGBO(255, 204, 0, 1),
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(255, 204, 0, 1)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(255, 204, 0, 1)),
                        ),
                        prefixIcon: Image.asset(
                          "images/bag.png",
                          scale: 3,
                        ),
                        labelText: "Shop Name",
                        labelStyle:
                            TextStyle(fontSize: 14.0, color: Colors.black87),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: shopLinkTextEditingController,
                      cursorColor: Color.fromRGBO(255, 204, 0, 1),
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(255, 204, 0, 1)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(255, 204, 0, 1)),
                        ),
                        prefixIcon: Image.asset(
                          "images/link.png",
                          scale: 3,
                        ),
                        labelText: "Shop URL",
                        labelStyle:
                            TextStyle(fontSize: 14.0, color: Colors.black87),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: TextField(
                              controller: cityTextEditingController,
                              cursorColor: Color.fromRGBO(255, 204, 0, 1),
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(255, 204, 0, 1)),
                                ),
                                border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Color.fromRGBO(255, 204, 0, 1)),
                                ),
                                prefixIcon: Image.asset(
                                  "images/deselect_building.png",
                                  scale: 3,
                                ),
                                suffixIcon: PopupMenuButton<String>(
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                  ),
                                  onSelected: (String value) {
                                    cityTextEditingController.text = value;
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return items.map<PopupMenuItem<String>>(
                                        (String value) {
                                      return new PopupMenuItem(
                                          child: new Text(value), value: value);
                                    }).toList();
                                  },
                                ),
                                labelText: "City",
                                labelStyle: TextStyle(
                                    fontSize: 14.0, color: Colors.black87),
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10.0,
                                ),
                              ),
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.0,
                    ),
                    TextField(
                      controller: addressTextEditingController,
                      cursorColor: Color.fromRGBO(255, 204, 0, 1),
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Color.fromRGBO(255, 204, 0, 1)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromRGBO(255, 204, 0, 1),
                          ),
                        ),
                        prefixIcon: Image.asset(
                          "images/address_deselect.png",
                          scale: 3,
                        ),
                        labelText: "Address",
                        labelStyle:
                            TextStyle(fontSize: 14.0, color: Colors.black87),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10.0,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: RaisedButton(
                    color: Color.fromRGBO(255, 204, 0, 1),
                    textColor: Colors.black,
                    child: Container(
                      height: 50.0,
                      child: Center(
                        child: Text("Update",
                            style: TextStyle(
                              fontSize: 16.0,
                            )),
                      ),
                    ),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(24.0),
                    ),
                    splashColor: Color.fromRGBO(255, 204, 0, 1),
                    elevation: 10,
                    onPressed: () {}),
              ),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
