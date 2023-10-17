import 'package:flutter/material.dart';

class MyTheme {
  //main heading and other text
  static Color darkThemeText = const Color(0xFFFAF8FB);

  // dark theme colors
  static ThemeData darkTheme(BuildContext context) => ThemeData(
      canvasColor: const Color(0xFF010101), //background color

      //use for container on settings page
      cardColor: const Color.fromARGB(192, 9, 9, 10), 

      //color for buttons
      buttonTheme: const ButtonThemeData(
          colorScheme:
              ColorScheme.dark(primary: Color.fromARGB(255, 32, 102, 207))),
      
      //appbar
      appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF010101),
          elevation: 0.0,
          actionsIconTheme:
              IconThemeData(color: Color(0xFFFAF8FB), opacity: 1.0)),
      
      // theme use in icons
      iconTheme: const IconThemeData(color: Color(0xFFFAF8FB), opacity: 0.8));
}
