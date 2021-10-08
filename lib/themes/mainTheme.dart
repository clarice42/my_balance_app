import 'package:flutter/material.dart';

const brightness = Brightness.light;
const primaryColor = const Color(0xFF000000);
const backgroundColor = const Color(0xFF000000);
const accentColor = const Color(0xFFA328D6);

ThemeData mainTheme() {
  return ThemeData(
    primarySwatch: MaterialColor(
      0xFFA328D6,
      <int, Color>{
        50: Color(0xFFA328D6),
        100: Color(0xFFA328D6),
        200: Color(0xFFA328D6),
        300: Color(0xFFA328D6),
        400: Color(0xFFA328D6),
        500: Color(0xFFA328D6),
        600: Color(0xFFA328D6),
        700: Color(0xFFA328D6),
        800: Color(0xFFA328D6),
        900: Color(0xFFA328D6)
      },
    ),
    fontFamily: "Raleway",
    brightness: brightness,
    textTheme: TextTheme(
      bodyText2: TextStyle(color: primaryColor),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: accentColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
      ),
    ),
    inputDecorationTheme: new InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      labelStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: accentColor,
          width: 2,
        ),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
    ),
    primaryColor: primaryColor,
    accentColor: accentColor,
    scaffoldBackgroundColor: backgroundColor,
  );
}
