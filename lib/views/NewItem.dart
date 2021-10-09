import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:my_balance/models/entry.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewItem extends StatefulWidget {
  final List items;
  final bool isNegative;

  NewItem({
    required this.items,
    required this.isNegative,
  });

  @override
  _NewItemState createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _valueController = TextEditingController();
  final _nameController = TextEditingController();

  void add() {
    var now = new DateTime.now();
    var formatter = new DateFormat("dd/MM");
    String formattedDate = formatter.format(now);
    //print(formattedDate);

    if (_valueController.text.isEmpty || _nameController.text.isEmpty) return;

    setState(() {
      widget.items.add(
        Entry(
          name: _nameController.text,
          value: _valueController.text,
          negative: widget.isNegative ? true : false,
          date: formattedDate,
        ),
      );
      _valueController.text = "";
      _nameController.text = "";

      save();
    });
  }

  save() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('data', jsonEncode(widget.items));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.isNegative ? "Nova saída" : "Nova entrada",
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 0,
              horizontal: 25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  controller: _valueController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Valor",
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Descrição",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 46,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      SystemChannels.textInput.invokeMethod('TextInput.hide');
                      add();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/', (Route<dynamic> route) => false);
                    },
                    child: Text(
                      widget.isNegative ? "Salvar saída" : "Salvar entrada",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
