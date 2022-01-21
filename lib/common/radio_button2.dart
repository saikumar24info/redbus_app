import 'package:flutter/material.dart';

class RadioButtonWidget2 extends StatefulWidget {
  final String var2;

  const RadioButtonWidget2({Key? key, required this.var2}) : super(key: key);

  @override
  _RadioButtonWidget2State createState() => _RadioButtonWidget2State(this.var2);
}

class _RadioButtonWidget2State extends State<RadioButtonWidget2> {
  final String var2;
  var radioItem2;

  _RadioButtonWidget2State(this.var2);

  Widget build(BuildContext context) {
    return Center(
      child: RadioListTile(
        groupValue: radioItem2,
        title: Text('Kurnool Bus Station'),
        value: 'Item 2',
        onChanged: (val) {
          setState(() {
            radioItem2 = val;
          });
        },
      ),
    );
  }
}
