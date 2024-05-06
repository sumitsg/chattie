import 'package:chattie/common/utils/custom_color.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  // ThemeData.light();

  CustomTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      textTheme: TextTheme(
        // headline1: const TextStyle(color: Colors.black),
        // headline2: const TextStyle(color: Colors.black),
        // headline3: const TextStyle(color: Colors.black87),
        // bodyText1: TextStyle(
        //   color: Colors.grey.shade600,
        // ),
        displayLarge: const TextStyle(color: Colors.black),
        displayMedium: const TextStyle(color: Colors.black),
        displaySmall: const TextStyle(color: Colors.black87),
        bodyLarge: TextStyle(
          color: Colors.grey.shade600,
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.blueGrey.shade800,
        selectedItemColor: Colors.blue.shade500,
      ),
      // highlightColor: Colors.grey.shade600,
      cardColor: Colors.grey.shade300,
      primaryColor: const Color(0XFF337ab7),
      backgroundColor: Colors.grey.shade100,
      colorScheme: ColorScheme.light(
        background: Colors.grey.shade100,
        primary: const Color(0XFF337ab7),
      ),
      chipTheme: ChipThemeData(backgroundColor: Colors.grey.shade400),
      iconTheme: const IconThemeData(color: Colors.black),
      inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.blueGrey.shade800,
          )),
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.blueGrey.shade900,
          ))),
      appBarTheme: const AppBarTheme(
          backgroundColor: CustomColors.whitef6,
          actionsIconTheme: IconThemeData(color: Colors.black)),
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'SFPro',
    );
  }

  // ThemeData.dark();
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.blueGrey.shade800,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.blue.shade500,
      ),

      textTheme: const TextTheme(
        // headline1: const TextStyle(color: Colors.white),
        // headline2: const TextStyle(color: Colors.grey),
        // headline3: const TextStyle(color: Color.fromARGB(255, 236, 236, 236)),
        // bodyText1: const TextStyle(
        //   color: Colors.grey,
        // ),
        displayLarge: TextStyle(color: Colors.white),
        displayMedium: TextStyle(color: Colors.grey),
        displaySmall: TextStyle(color: Color.fromARGB(255, 236, 236, 236)),
        bodyLarge: TextStyle(
          color: Colors.grey,
        ),
      ),
      cardColor: Colors.grey.shade900,
      primaryColor: const Color(0XFF337ab7),
      backgroundColor: Colors.grey.shade900,
      colorScheme: ColorScheme.dark(
        background: Colors.grey.shade900,
        primary: const Color(0XFF337ab7),
      ),
      chipTheme: const ChipThemeData(backgroundColor: CustomColors.black09),
      //color for scrollbar
      // highlightColor: Colors.white,
      iconTheme: const IconThemeData(color: Colors.white),
      inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
          border: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          ))),
      appBarTheme: const AppBarTheme(backgroundColor: CustomColors.black09),
      scaffoldBackgroundColor: CustomColors.black09,
      fontFamily: 'SFPro',
    );
  }

  static Color getTextColor(BuildContext context) {
    return Theme.of(context).iconTheme.color ?? Colors.white;
  }

  static Color getColorScreen(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    return isLightTheme ? Colors.grey.shade100 : CustomColors.black09;
  }

  static Color getColorCard(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    return isLightTheme ? Colors.white : Colors.grey.shade900;
  }

  static bool isLightTheme(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }

  static LinearGradient getGredintColor(BuildContext context) {
    bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    return isLightTheme
        ? LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).scaffoldBackgroundColor,
              Theme.of(context).scaffoldBackgroundColor,
              CustomColors.homeBackground2,
              CustomColors.homeBackground2,
              CustomColors.homeBackground2,
            ],
          )
        : LinearGradient(
            colors: [
              Theme.of(context).scaffoldBackgroundColor,
              Theme.of(context).scaffoldBackgroundColor,
            ],
          );
  }
}
