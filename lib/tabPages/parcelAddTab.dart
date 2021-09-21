import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:ghuri_parcel_app/Models/addParcel_model.dart';
import 'package:ghuri_parcel_app/Models/dropdownItemInfo.dart';
import 'package:ghuri_parcel_app/Models/registration_model.dart';
import 'package:ghuri_parcel_app/configApi.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

String? _merchantAddress;
int? _merchantId;
String? _shopId;
String? _bearerToken;

class ParcelAddTab extends StatefulWidget {
  const ParcelAddTab({Key? key}) : super(key: key);

  @override
  _ParcelAddTabState createState() => _ParcelAddTabState();
}

class _ParcelAddTabState extends State<ParcelAddTab> {
  DateTime? selectDate;

  AddParcelRequestModel? parcelRequestModel;

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

  TextEditingController areaTextEditingController = TextEditingController();
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
  RegistrationRequestModel? registrationRequestModel;

  final dateFormat = DateFormat('yyyy-MM-dd');

  clearInputData() {
    invoiceNumberTextEditingController.clear();
    pickupDateTextEditingController.clear();
    customerNameTextEditingController.clear();
    customerNumberTextEditingController.clear();
    alternativeCustomerNumberTextEditingController.clear();
    cityTextEditingController.clear();
    areaTextEditingController.clear();
    addressTextEditingController.clear();
    paymentTextEditingController.clear();
    payableAmountTextEditingController.clear();
    deliveryTypeTextEditingController.clear();
    productWeightTextEditingController.clear();
    productTypeTextEditingController.clear();
    instructionTextEditingController.clear();
  }

  int _payable = 0;
  payable(String value) {
    if (value == payableAmountTextEditingController.text)
      setState(() {
        _payable = int.parse(payableAmountTextEditingController.text);
      });
  }

  bool _isAreaVisible = false;
  showArea() {
    if (cityTextEditingController.text == "Dhaka") {
      setState(() {
        _isAreaVisible = true;
      });
    } else {
      setState(() {
        _isAreaVisible = false;
      });
    }
  }

  String? _area;

  area() {
    if (cityTextEditingController.text == "Dhaka") {
      setState(() {
        _area = areaTextEditingController.text;
      });
    } else {
      setState(() {
        _area = cityTextEditingController.text;
      });
    }
  }

  bool _isPayment = false;
  paymentStatus() {
    if (paymentTextEditingController.text == "Unpaid") {
      setState(() {
        _isPayment = false;
      });
    } else if (paymentTextEditingController.text == "Paid") {
      setState(() {
        _isPayment = true;
      });
    }
  }

  int _productWeight = 0;
  productWeight(String value) {
    if (value == "1 kg") {
      setState(() {
        _productWeight = 1;
      });
    } else if (value == "2 kg") {
      setState(() {
        _productWeight = 2;
      });
    } else if (value == "3 kg") {
      setState(() {
        _productWeight = 3;
      });
    } else if (value == "4 kg") {
      setState(() {
        _productWeight = 4;
      });
    } else if (value == "5 kg") {
      setState(() {
        _productWeight = 5;
      });
    } else if (value == "6 kg") {
      setState(() {
        _productWeight = 6;
      });
    } else if (value == "7 kg") {
      setState(() {
        _productWeight = 7;
      });
    } else if (value == "8 kg") {
      setState(() {
        _productWeight = 8;
      });
    } else if (value == "9 kg") {
      setState(() {
        _productWeight = 9;
      });
    } else if (value == "10 kg") {
      setState(() {
        _productWeight = 10;
      });
    }
  }

  int _deliveryType = 0;
  deliveryType(String value) {
    if (value == "Next Day Delivery") {
      setState(() {
        _deliveryType = 1;
      });
    } else if (value == "Same Day Delivery") {
      setState(() {
        _deliveryType = 2;
      });
    }
  }

  int _productType = 0;

  productType(String value) {
    if (value == "GLASS") {
      setState(() {
        _productType = 1;
      });
    } else if (value == "WOODEN") {
      setState(() {
        _productType = 2;
      });
    } else if (value == "METAL") {
      setState(() {
        _productType = 3;
      });
    } else if (value == "DRESS") {
      setState(() {
        _productType = 4;
      });
    } else if (value == "COSMETIC") {
      setState(() {
        _productType = 5;
      });
    } else if (value == "JEWELLERY") {
      setState(() {
        _productType = 6;
      });
    } else if (value == "BOOK") {
      setState(() {
        _productType = 7;
      });
    } else if (value == "DOCUMENT") {
      setState(() {
        _productType = 8;
      });
    }
  }

  getDashboardItem() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _merchantAddress =
          (sharedPreferences.getString(API.merchantAddress) ?? '');
      _merchantId = (sharedPreferences.getInt(API.merchantId) ?? '') as int?;
      _shopId = (sharedPreferences.getString(API.shopId) ?? '');
      _bearerToken = (sharedPreferences.getString(API.token) ?? '');
    });
  }

  // @override
  // void initState() {
  //   pickupDateTextEditingController.text = "";
  //   super.initState();
  // }
  @override
  void initState() {
    super.initState();
    getDashboardItem();
    parcelRequestModel = new AddParcelRequestModel();
    registrationRequestModel = new RegistrationRequestModel(
        city: '',
        password: '',
        merchantName: '',
        email: '',
        phone: '',
        address: '',
        area: '',
        shopName: '',
        shopUrl: '',
        msisdn: '');
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
                                    showArea();
                                    area();
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
                    //if (cityTextEditingController.value.toString() == "Dhaka")
                    Visibility(
                      visible: _isAreaVisible,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              child: TextField(
                                controller: areaTextEditingController,
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
                                      areaTextEditingController.text = value;
                                      area();
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return areaItems
                                          .map<PopupMenuItem<String>>(
                                              (String value) {
                                        return new PopupMenuItem(
                                            child: new Text(value),
                                            value: value);
                                      }).toList();
                                    },
                                  ),
                                  labelText: "Area",
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
                                    paymentStatus();
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
                    //payableAmountTextEditingController
                    TextField(
                      controller: payableAmountTextEditingController,
                      onSubmitted: (String value) {
                        payableAmountTextEditingController.text = value;
                        payable(value);
                      },
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
                                    deliveryType(value);
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
                                    productWeight(value);
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
                                    productType(value);
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
                    onPressed: () {
                      parcelRegister(
                          invoiceNumberTextEditingController.text.toString(),
                          pickupDateTextEditingController.text.toString(),
                          customerNameTextEditingController.text.toString(),
                          customerNumberTextEditingController.text.toString(),
                          alternativeCustomerNumberTextEditingController.text
                              .toString(),
                          _area.toString(),
                          areaTextEditingController.text.toString(),
                          addressTextEditingController.text.toString(),
                          _isPayment,
                          _payable.toInt(),
                          _deliveryType.toInt(),
                          _productWeight.toInt(),
                          _productType.toInt(),
                          instructionTextEditingController.text.toString());

                      clearInputData();
                    }),
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

parcelRegister(
  String invoiceNumber,
  String pickupDate,
  String customerName,
  String customerNumber,
  String alternativeNumber,
  String customerCity,
  String customerArea,
  String deliveryAddress,
  bool payable,
  int customerPayableAmount,
  int deliveryType,
  int productWeight,
  int productType,
  String instruction,
) async {
  String url = API.parcelRegisterUrl + "$_merchantId";

  var parcelData = jsonEncode(<String, dynamic>{
    "merchantID": _merchantId,
    'shopID': _shopId,
    'invoiceNumber': invoiceNumber,
    'customerName': customerName,
    'customerNumber': customerNumber,
    'alternativeNumber': alternativeNumber,
    'customerArea': customerCity,
    'pickupDate': pickupDate,
    'pickupAddress': _merchantAddress,
    'deliveryAddress': deliveryAddress,
    'deliveryType': deliveryType,
    'productType': productType,
    'productWeight': productWeight,
    "paymentDetails": {
      'payable': payable,
      'customerPayableAmount': customerPayableAmount,
    },
    'instruction': instruction,
  });
  print(parcelData);

  var response = await http.post(
    Uri.parse(url),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $_bearerToken',
    },
    body: parcelData,
  );

  var jsonResponse;
  if (response.statusCode == 200) {
    jsonResponse = json.decode(response.body);

    print(jsonResponse);
  } else {
    throw Exception('Failed to load data');
  }
}
