import 'package:flutter/material.dart';
import 'package:my_balance/themes/mainTheme.dart';
import 'package:my_balance/views/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Balance App",
      debugShowCheckedModeBanner: false,
      theme: mainTheme(),
      initialRoute: "/",
      routes: {
        "/": (context) => Login(),
        // "/login": (context) => Login(),
        // "/register": (context) => Register(),
      },
    );
  }
}
