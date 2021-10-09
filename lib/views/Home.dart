import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:my_balance/models/entry.dart';
import 'package:my_balance/widgets/Item.dart';
import 'package:my_balance/widgets/NewItemButton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  var items = [];
  
  Home() {
    items = [];
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
                          return (widget.items.length == 0
                              ? Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 70,
                                    vertical: 150,
                                  ),
                                  child: Text(
                                    "Não há registros de entrada ou saída",
                                    style: TextStyle(
                                      color: Color(0xFF868686),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                )
                              : Item(item: item));
                        },
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
                    NewItemButton(
                      name: "Nova entrada",
                      route: "/new_entry",
                      icon: Icons.add_circle_outline_outlined,
                      items: widget.items,
                    ),
                    NewItemButton(
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
