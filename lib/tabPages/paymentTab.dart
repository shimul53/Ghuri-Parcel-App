import 'package:flutter/material.dart';

class PaymentTab extends StatefulWidget {
  const PaymentTab({Key? key}) : super(key: key);

  @override
  _PaymentTabState createState() => _PaymentTabState();
}

class _PaymentTabState extends State<PaymentTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 237, 237, 1),
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        title: Text(
          "Payment",
          style: TextStyle(
              fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
