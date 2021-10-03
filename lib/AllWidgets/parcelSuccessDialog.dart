import 'package:flutter/material.dart';
import 'package:ghuri_parcel_app/configApi.dart';
import 'package:shared_preferences/shared_preferences.dart';

String? _tracking_id;

class ParcelSuccessDialog extends StatefulWidget {
  @override
  _ParcelSuccessDialogState createState() => _ParcelSuccessDialogState();
}

class _ParcelSuccessDialogState extends State<ParcelSuccessDialog> {
  getTrackingId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      _tracking_id = (sharedPreferences.getString(API.parcelTrackId) ?? '');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTrackingId();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      backgroundColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.all(5.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 16.0,
            ),
            Text(
              "Success",
              style: TextStyle(
                fontSize: 22.0,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Text(
                    "Parcel Added Successfully.",
                    style: TextStyle(
                        fontSize: 16, color: Color.fromRGBO(121, 121, 121, 1)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Your Parcel tracking ID is: $_tracking_id",
                    style: TextStyle(
                        fontSize: 14, color: Color.fromRGBO(33, 33, 33, 1)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Please share this track id with customer.",
                    style: TextStyle(
                        fontSize: 14, color: Color.fromRGBO(121, 121, 121, 1)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RaisedButton(
                color: Color.fromRGBO(255, 204, 0, 1),
                textColor: Colors.black,
                child: Container(
                  height: 50.0,
                  child: Center(
                    child: Text("OK",
                        style: TextStyle(
                          fontSize: 16.0,
                        )),
                  ),
                ),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                splashColor: Color.fromRGBO(255, 204, 0, 1),
                elevation: 10,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
