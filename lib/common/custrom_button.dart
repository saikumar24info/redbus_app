// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final GestureTapCallback onPressed;
  const CustomButton({Key? key, required this.child, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFFEE5350),
        ),
        child: child,
        onPressed: onPressed,
      ),
    );
  }
}
