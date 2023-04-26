import 'package:flutter/material.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/iconButtonWidget.dart';
import 'package:luminexa_mobile/widgets/listsWidget/toggleListTileWidget.dart';

class schedulePage extends StatefulWidget {
  const schedulePage({super.key});

  @override
  State<schedulePage> createState() => _schedulePageState();
}

class _schedulePageState extends State<schedulePage> {
  final List title = [
    "Turn off the light in the hallway",
    "Turn on the lights in the room",
    "Sun set schedule",
    "Sun set schedule",
    "Sun set schedule",
    "Sun set schedule",
    "Sun set schedule"
  ];
  final List status = ["off", "on", "off", "off", "off", "off", "off"];
  final List time = [
    "6:00 AM, Once",
    "7:00 PM, Daily",
    "5:30 PM , Daily",
    "5:30 PM , Daily",
    "5:30 PM , Daily",
    "5:30 PM , Daily",
    "5:30 PM , Daily"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 30),
                    child: Row(
                      children: [
                        Text(
                          "Upcoming schedule",
                          style: TextStyle(
                              fontFamily: "RalewayBold",
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  toggleListTile(
                    title: title[1],
                    subTitle: time[1],
                    status: status[1],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 30),
                    child: Row(
                      children: [
                        Text(
                          "Schedules",
                          style: TextStyle(
                              fontFamily: "RalewayBold",
                              fontSize: 18,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    physics: ScrollPhysics(parent: null),
                    shrinkWrap: true,
                    itemCount: title.length,
                    itemBuilder: (BuildContext context, int index) {
                      return toggleListTile(
                        title: title[index],
                        subTitle: time[index],
                        status: status[index],
                      );
                    },
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 60,
                decoration: BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                      offset: Offset(0, -30),
                      color: Colors.grey,
                      spreadRadius: -5,
                      blurRadius: 50)
                ]),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                width: MediaQuery.of(context).size.width,
                child: iconButton(
                  innerText: "Set new schedule",
                  iconName: Icon(Icons.alarm_add),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}