import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:luminexa_mobile/screens/systemPage.dart';
import 'package:luminexa_mobile/widgets/authWidgets/authWidgets.dart';
import 'package:luminexa_mobile/widgets/buttonWidget/buttonWidget.dart';

class setSchedulePage extends StatefulWidget {
  const setSchedulePage({super.key});
  @override
  State<setSchedulePage> createState() => _setSchedulePageState();
}

class _setSchedulePageState extends State<setSchedulePage> {
  final scheduleName = TextEditingController();
  TimeOfDay time = TimeOfDay(hour: 12, minute: 0);

  void showtime() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        time = value!;
      });
    });
  }

  void showDate() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(3000));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Set schedule",
          style: TextStyle(
              fontFamily: "Raleway", fontWeight: FontWeight.bold, fontSize: 24),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return setSchedulePage();
                },
              ),
            );
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return systemPage();
                },
              ),
            );
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Text(
                    "Title of the schedule",
                    style: TextStyle(fontFamily: "RalewayBold", fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            sytledTextField(
              isPass: false,
              controller: scheduleName,
              label: "Schedule Name",
              hintText: "Schedule Name",
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Text(
                    "Time",
                    style: TextStyle(fontFamily: "RalewayBold", fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              time.format(context),
            ),
            ElevatedButton(
              onPressed: showtime,
              child: Text("Press"),
            ),
            SizedBox(
              height: 50,
            ),
            Text("Date"),
            ElevatedButton(
              onPressed: showDate,
              child: Text("Press"),
            ),
          ],
        ),
      ),
    );
  }
}