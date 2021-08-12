import 'package:flutter/material.dart';
import 'package:ghuri_parcel_app/AllScreens/loginScreen.dart';
import 'package:ghuri_parcel_app/homeScreen.dart';

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
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
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
