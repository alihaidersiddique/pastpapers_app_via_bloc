import 'package:flutter/material.dart';

Widget buildCourseWidget(
  String icon,
  String text,
  VoidCallback onPress,
) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: ElevatedButton.icon(
      onPressed: onPress,
      icon: Image.asset(
        icon,
        height: 40,
      ),
      label: Text(
        text,
        style: const TextStyle(
          fontSize: 30.0,
          color: Colors.black,
          fontWeight: FontWeight.w400,
        ),
      ),
      style: ElevatedButton.styleFrom(
        splashFactory: InkRipple.splashFactory,
        alignment: Alignment.centerLeft,
        backgroundColor: Colors.white,
        elevation: 4.0,
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 15.0,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    ),
  );
}
