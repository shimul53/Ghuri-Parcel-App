import 'package:flutter/material.dart';
import 'package:ghuri_parcel_app/AllScreens/loginScreen.dart';
import 'package:ghuri_parcel_app/AllScreens/mainScreen.dart';
import 'package:ghuri_parcel_app/configApi.dart';
import 'package:ghuri_parcel_app/homeScreen.dart';
import 'package:ghuri_parcel_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const String idScreen = "splash";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString(API.token);
    if (token != null) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainScreen()));
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("images/ghuri.png"),
              width: 200.0,
              height: 150.0,
              alignment: Alignment.center,
            ),
          ],
        )),
      ),
    );
  }
}
