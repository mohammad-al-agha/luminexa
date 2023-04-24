import 'package:flutter/material.dart';

class iconButton extends StatelessWidget {
  final String innerText;
  final Widget iconName;

  const iconButton({
    super.key,
    required this.innerText,
    required this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color.fromARGB(255, 63, 139, 0),
                  style: BorderStyle.solid,
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: iconName,
                  color: Color.fromARGB(255, 63, 139, 0),
                ),
                Text(
                  innerText,
                  style: TextStyle(
                      color: Color.fromARGB(255, 63, 139, 0),
                      fontFamily: "Raleway",
                      fontSize: 17,
                      fontWeight: FontWeight.w600),
                ),
              ],
            )));
  }
}
