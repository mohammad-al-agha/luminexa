import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:luminexa_mobile/screens/ledPage.dart';
import 'package:luminexa_mobile/screens/modePage.dart';
import 'package:luminexa_mobile/screens/notificationPage.dart';
import 'package:luminexa_mobile/screens/schedulePage.dart';
import 'package:luminexa_mobile/screens/settingsPage.dart';

class systemPage extends StatefulWidget {
  const systemPage({super.key});

  @override
  State<systemPage> createState() => _systemPageState();
}

class _systemPageState extends State<systemPage> {
  @override
  int currentIndex = 0;
  void navigateTab(index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List pages = [
    ledsPage(),
    schedulePage(),
    modePage(),
    notificationsPage()
  ];
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: GNav(
              onTabChange: (value) => navigateTab(value),
              backgroundColor: Colors.green,
              tabBackgroundColor: Color.fromARGB(255, 255, 255, 255),
              color: Colors.white,
              gap: 10,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              tabs: [
                GButton(
                  icon: Icons.lightbulb,
                  iconSize: 20,
                  text: "LEDs",
                  textStyle: TextStyle(fontSize: 12, fontFamily: "RalewayBold"),
                ),
                GButton(
                  icon: Icons.schedule,
                  iconSize: 20,
                  text: "Schedules",
                  textStyle: TextStyle(fontSize: 12, fontFamily: "RalewayBold"),
                ),
                GButton(
                  icon: Icons.list,
                  iconSize: 20,
                  text: "Modes",
                  textStyle: TextStyle(fontSize: 12, fontFamily: "RalewayBold"),
                ),
                GButton(
                  icon: Icons.notifications,
                  iconSize: 20,
                  text: "Notifications",
                  textStyle: TextStyle(fontSize: 12, fontFamily: "RalewayBold"),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Text(
            "Kitchen",
            style: TextStyle(
                fontFamily: "Raleway",
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return settingsPage();
                    },
                  ),
                );
              },
              icon: Icon(Icons.settings),
            )
          ],
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: pages[currentIndex]);
  }
}