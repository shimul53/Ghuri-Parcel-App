import 'package:flutter/material.dart';
import 'package:ghuri_parcel_app/Models/dropdownItemInfo.dart';
import 'package:intl/intl.dart';

class ParcelAddTab extends StatefulWidget {
  const ParcelAddTab({Key? key}) : super(key: key);

  @override
  _ParcelAddTabState createState() => _ParcelAddTabState();
}

class _ParcelAddTabState extends State<ParcelAddTab> {
  DateTime? selectDate;

  TextEditingController invoiceNumberTextEditingController =
      TextEditingController();

  TextEditingController pickupDateTextEditingController =
      TextEditingController();

  TextEditingController customerNameTextEditingController =
      TextEditingController();

  TextEditingController customerNumberTextEditingController =
      TextEditingController();
  TextEditingController alternativeCustomerNumberTextEditingController =
      TextEditingController();
  final TextEditingController cityTextEditingController =
      new TextEditingController();
  TextEditingController addressTextEditingController = TextEditingController();

  TextEditingController paymentTextEditingController = TextEditingController();

  TextEditingController payableAmountTextEditingController =
      TextEditingController();
  TextEditingController deliveryTypeTextEditingController =
      TextEditingController();

  TextEditingController productWeightTextEditingController =
      TextEditingController();
  TextEditingController productTypeTextEditingController =
      TextEditingController();

  TextEditingController instructionTextEditingController =
      TextEditingController();

  final dateFormat = DateFormat('yyyy-MM-dd');

  @override
  void initState() {
    pickupDateTextEditingController.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Parcel",
          style: TextStyle(color: Colors.black, fontSize: 18.0),
        ),
        backgroundColor: Colors.white,
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
                      "Customer Info:",
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
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: TextField(
                              cursorColor: Color.fromRGBO(255, 204, 0, 1),
                              controller: invoiceNumberTextEditingController,
                              keyboardType: TextInputType.number,
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
                                  "images/invoice_deselect.png",
                                  scale: 3,
                                ),
                                labelText: "Invoice Number",
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
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Container(
                            child: TextField(
                              controller: pickupDateTextEditingController,
                              readOnly: true,
                              onTap: () {
                                showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2019),
                                    lastDate: DateTime(2500),
                                    builder:
                                        (BuildContext context, Widget? child) {
                                      return Theme(
                                        data: ThemeData.dark(),
                                        child: child!,
                                      );
                                    }).then((value) {
                                  setState(() {
                                    pickupDateTextEditingController.text =
                                        dateFormat.format(value!);
                                  });
                                });
                              },
                              cursorColor: Color.fromRGBO(255, 204, 0, 1),
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
                                  "images/calendar_deselect.png",
                                  scale: 3,
                                ),
                                labelText: "Pick Up Date",
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
                    TextField(
                      controller: customerNameTextEditingController,
                      keyboardType: TextInputType.name,
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
                          "images/customer_deselect.png",
                          scale: 3,
                        ),
                        labelText: "Customer Name",
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
                      controller: customerNumberTextEditingController,
                      keyboardType: TextInputType.phone,
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
                          "images/deselect_Call.png",
                          scale: 3,
                        ),
                        labelText: "Customer Number",
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
                      controller:
                          alternativeCustomerNumberTextEditingController,
                      cursorColor: Color.fromRGBO(255, 204, 0, 1),
                      obscureText: true,
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
                          "images/deselect_Call.png",
                          scale: 3,
                        ),
                        labelText: "Alternative Number (if any)",
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
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Row(
                        children: [
                          Text(
                            "Delivery info:",
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
                          borderSide:
                              BorderSide(color: Color.fromRGBO(255, 204, 0, 1)),
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
                    SizedBox(
                      height: 30.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Row(
                        children: [
                          Text(
                            "Payment Info",
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
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: TextField(
                              controller: paymentTextEditingController,
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
                                  "images/payment_deselect.png",
                                  scale: 3,
                                ),
                                suffixIcon: PopupMenuButton<String>(
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                  ),
                                  onSelected: (String value) {
                                    paymentTextEditingController.text = value;
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return paymentItems
                                        .map<PopupMenuItem<String>>(
                                            (String value) {
                                      return new PopupMenuItem(
                                          child: new Text(value), value: value);
                                    }).toList();
                                  },
                                ),
                                labelText: "Payment",
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
                      controller: payableAmountTextEditingController,
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
                          "images/payment_deselect.png",
                          scale: 3,
                        ),
                        labelText: "Payable Amount",
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
                              controller: deliveryTypeTextEditingController,
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
                                  "images/parcel_deselect.png",
                                  scale: 3,
                                ),
                                suffixIcon: PopupMenuButton<String>(
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                  ),
                                  onSelected: (String value) {
                                    deliveryTypeTextEditingController.text =
                                        value;
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return deliveryTypeItems
                                        .map<PopupMenuItem<String>>(
                                            (String value) {
                                      return new PopupMenuItem(
                                          child: new Text(value), value: value);
                                    }).toList();
                                  },
                                ),
                                labelText: "Delivery Type",
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
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: TextField(
                              controller: productWeightTextEditingController,
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
                                  "images/parcel_deselect.png",
                                  scale: 3,
                                ),
                                suffixIcon: PopupMenuButton<String>(
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                  ),
                                  onSelected: (String value) {
                                    productWeightTextEditingController.text =
                                        value;
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return productWeightTypeItems
                                        .map<PopupMenuItem<String>>(
                                            (String value) {
                                      return new PopupMenuItem(
                                          child: new Text(value), value: value);
                                    }).toList();
                                  },
                                ),
                                labelText: "Product Weight",
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
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: TextField(
                              controller: productTypeTextEditingController,
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
                                  "images/parcel_deselect.png",
                                  scale: 3,
                                ),
                                suffixIcon: PopupMenuButton<String>(
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                  ),
                                  onSelected: (String value) {
                                    productTypeTextEditingController.text =
                                        value;
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return productTypeItems
                                        .map<PopupMenuItem<String>>(
                                            (String value) {
                                      return new PopupMenuItem(
                                          child: new Text(value), value: value);
                                    }).toList();
                                  },
                                ),
                                labelText: "Product Type",
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
                      height: 10.0,
                    ),
                    TextField(
                      controller: instructionTextEditingController,
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
                          "images/instructions_deselect.png",
                          scale: 3,
                        ),
                        labelText: "Instruction (optional)",
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
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: RaisedButton(
                    color: Color.fromRGBO(255, 204, 0, 1),
                    textColor: Colors.black,
                    child: Container(
                      height: 50.0,
                      child: Center(
                        child: Text("Add Parcel",
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
