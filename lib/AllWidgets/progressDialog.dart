import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  String message;
  ProgressDialog({required this.message});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 80,
        width: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6.0),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 40.0,
            ),
            CupertinoActivityIndicator(
              radius: 10,
            ),
            SizedBox(
              width: 30.0,
            ),
            Text(
              message,
              style: TextStyle(color: Colors.black, fontSize: 15.0),
            )
          ],
        ),
      ),
    );
  }
}
