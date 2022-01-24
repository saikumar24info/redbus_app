import 'package:flutter/material.dart';

class RadioButtonWidget extends StatefulWidget {
  final String from, id;
  final List<dynamic> pickup;

  RadioButtonWidget(
      {Key? key, required this.from, required this.id, required this.pickup})
      : super(key: key);

  @override
  _RadioButtonWidgetState createState() =>
      _RadioButtonWidgetState(from, id, pickup);
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  _RadioButtonWidgetState(this.from, this.id, this.pickup);
  final String from, id;
  final List<dynamic> pickup;
  var radioItem;

  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: pickup.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(pickup[index]),
        leading: Radio<dynamic>(
          value: pickup[index],
          groupValue: radioItem,
          onChanged: (value) {
            setState(() {
              radioItem = value;
            });
          },
        ),
      ),
    );
  }
}
