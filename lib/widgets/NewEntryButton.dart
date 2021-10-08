import 'package:flutter/material.dart';
import 'package:my_balance/views/NewEntry.dart';

class NewEntryButton extends StatelessWidget {
  final String name;
  final String route;
  final IconData icon;
  final List items;

  const NewEntryButton({
    required this.name,
    required this.route,
    required this.icon,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 150,
      child: ElevatedButton(
        onPressed: () {
          route == "/new_entry"
              ? Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => NewEntry(
                      items: items,
                      isNegative: false,
                    ),
                  ),
                )
              : Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => NewEntry(
                      items: items,
                      isNegative: true,
                    ),
                  ),
                );
        },
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
