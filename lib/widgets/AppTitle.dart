import 'package:flutter/material.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "MeuBalanço",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
            fontSize: 32,
            fontFamily: "Ruluko",
          ),
        ),
        SizedBox(
          height: 37,
        ),
      ],
    );
  }
}
