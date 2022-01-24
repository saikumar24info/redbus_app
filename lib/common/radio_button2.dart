import 'package:flutter/material.dart';

class RadioButton2 extends StatefulWidget {
  String from;

  String id;

  final List<dynamic> dropping;

  RadioButton2({
    Key? key,
    required this.from,
    required this.id,
    required this.dropping,
  }) : super(key: key);

  @override
  _RadioButton2State createState() => _RadioButton2State(from, id, dropping);
}

class _RadioButton2State extends State<RadioButton2> {
  final String from, id;
  var radioItem1;

  final List<dynamic> dropping;

  // var radioItem;
  // List<String> list = [
  //   'Miyapur',
  //   'KPHB',
  //   'SR nagar',
  //   'Lakdikapul',
  //   'Hayatnagar'
  // ];

  _RadioButton2State(this.from, this.id, this.dropping);
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dropping.length,
      itemBuilder: (context, index) => ListTile(
          title: Text(dropping[index]),
          leading: Radio<dynamic>(
            value: dropping[index],
            groupValue: radioItem1,
            onChanged: (value) {
              setState(() {
                radioItem1 = value;
              });
            },
          )),
    );
  }
}
