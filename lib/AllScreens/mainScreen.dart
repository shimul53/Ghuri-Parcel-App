import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ghuri_parcel_app/tabPages/dashboardHomeTab.dart';
import 'package:ghuri_parcel_app/tabPages/parcelAddTab.dart';
import 'package:ghuri_parcel_app/tabPages/parcelDetailsTab.dart';
import 'package:ghuri_parcel_app/tabPages/paymentTab.dart';
import 'package:ghuri_parcel_app/tabPages/profileTab.dart';

class MainScreen extends StatefulWidget {
  static const String idScreen = "mainScreen";
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;

  void onItemClicked(int index) {
    setState(() {
      selectedIndex = index;
      tabController!.index = selectedIndex;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 237, 237, 1),
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          DashboardHomeTab(),
          ParcelDetailsTab(),
          ParcelAddTab(),
          PaymentTab(),
          ProfileTab(),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: new Image.asset(
                'images/dashbord_deselect.png',
                color: Color.fromRGBO(255, 204, 0, 1),
                height: 30,
                width: 30,
              ),
              icon: Image.asset(
                "images/dashbord_deselect.png",
                height: 30,
                width: 30,
              ),
              label: "Dashboard",
            ),
            BottomNavigationBarItem(
              activeIcon: new Image.asset(
                'images/parcel_deselect.png',
                color: Color.fromRGBO(255, 204, 0, 1),
                height: 30,
                width: 30,
              ),
              icon: Image.asset(
                "images/parcel_deselect.png",
                height: 30,
                width: 30,
              ),
              label: "Parcel",
            ),
            BottomNavigationBarItem(
              activeIcon: new Image.asset(
                'images/plus_selected.png',
                color: Color.fromRGBO(255, 204, 0, 1),
                height: 30,
                width: 30,
              ),
              icon: Image.asset(
                "images/plus_selected.png",
                height: 30,
                width: 30,
                color: Color.fromRGBO(127, 141, 132, 1),
              ),
              label: "Add",
            ),
            BottomNavigationBarItem(
              activeIcon: new Image.asset(
                'images/payment_deselect.png',
                color: Color.fromRGBO(255, 204, 0, 1),
                height: 30,
                width: 30,
              ),
              icon: Image.asset(
                "images/payment_deselect.png",
                height: 30,
                width: 30,
              ),
              label: "Payment",
            ),
            BottomNavigationBarItem(
              activeIcon: new Image.asset(
                'images/profile_deselect.png',
                color: Color.fromRGBO(255, 204, 0, 1),
                height: 30,
                width: 30,
              ),
              icon: Image.asset(
                "images/profile_deselect.png",
                height: 30,
                width: 30,
              ),
              label: "Profile",
            ),
          ],
          unselectedItemColor: Color.fromRGBO(121, 121, 121, 1),
          selectedItemColor: Color.fromRGBO(33, 33, 33, 1),
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: TextStyle(
              fontSize: 12.0, color: Color.fromRGBO(121, 121, 121, 1)),
          showUnselectedLabels: true,
          currentIndex: selectedIndex,
          onTap: onItemClicked,
        ),
      ),
    );
  }
}
