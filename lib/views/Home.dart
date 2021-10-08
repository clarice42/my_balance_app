import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_balance/models/entry.dart';
import 'package:my_balance/widgets/NewEntryButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  var items = [];
  double sum = 0;

  Home() {
    items = [];
    sum = 0;
    // items.add(Entry(name: "Despesa 1", value: "23.99", negative: true));
    // items.add(Entry(name: "Lucro 1", value: "43.89", negative: false));
    // items.add(Entry(name: "Despesa 2", value: "2.99", negative: true));
  }

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future load() async {
    var prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('data');

    if (data != null) {
      Iterable decoded = jsonDecode(data);
      List<Entry> result = decoded.map((x) => Entry.fromJson(x)).toList();

      setState(() {
        widget.items = result;
      });
    }
  }

  _HomeState() {
    load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Olá, Usuário",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: Icon(
              Icons.logout_outlined,
              size: 28,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 20,
            ),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 400,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: widget.items.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          final item = widget.items[index];
                          return Padding(
                            padding: const EdgeInsets.only(
                              bottom: 0,
                              top: 18,
                              right: 12,
                              left: 12,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item.name,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  item.value,
                                  style: TextStyle(
                                    color: item.negative
                                        ? Colors.red
                                        : Colors.green,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Text(
                        widget.sum.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    NewEntryButton(
                      name: "Nova entrada",
                      route: "/new_entry",
                      icon: Icons.add_circle_outline_outlined,
                      items: widget.items,
                    ),
                    NewEntryButton(
                      name: "Nova saída",
                      route: "/",
                      icon: Icons.remove_circle_outline_outlined,
                      items: widget.items,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
