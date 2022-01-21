import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RadioButtonWidget extends StatefulWidget {
  final String from, id;

  const RadioButtonWidget({Key? key, required this.from, required this.id})
      : super(key: key);

  @override
  _RadioButtonWidgetState createState() => _RadioButtonWidgetState(from, id);
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  _RadioButtonWidgetState(this.from, this.id);
  final String from, id;

  var radioItem;
  List<String> list = [
    'Miyapur',
    'KPHB',
    'SR nagar',
    'Lakdikapul',
    'Hayatnagar'
  ];
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        title: Text(list[0]),
        leading: Radio(
           value: 'MGBS',
          groupValue: radioItem,
          onChanged: (value) {
            radioItem = value;
          },
         
        ),
      ),
      ListTile(
        title: Text(list[1]),
        leading: Radio(
              value: 'KPHB',
          groupValue: radioItem,
          onChanged: (value) {
            radioItem = value;
          },
      
        ),
      ),

      ListTile(
        title: Text(list[2]),
        leading: Radio(
           value: 'SR nagar',
          groupValue: radioItem,
          onChanged: (value) {
            radioItem = value;
          },
         
        ),
      ),
      ListTile(
        title: Text(list[3]),
        leading: Radio(
           value: 'Lakdikapul',
          groupValue: radioItem,
          onChanged: (value) {
            radioItem = value;
          },
         
        ),
      ),
      ListTile(
        title: Text(list[4]),
        leading: Radio(
           value: 'Hayatnagar',
          groupValue: radioItem,
          onChanged: (value) {
            radioItem = value;
          },
         
        ),
      ),
      
    ]);
  }
}
