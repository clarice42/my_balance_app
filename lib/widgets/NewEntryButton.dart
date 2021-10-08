import 'package:flutter/material.dart';

class NewEntryButton extends StatelessWidget {
  final String name;
  final String route;
  final IconData icon;

  const NewEntryButton(
      {required this.name, required this.route, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 150,
      child: ElevatedButton(
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  size: 25,
                ),
                Container(                  
                  width: 70,
                  child: Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
