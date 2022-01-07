// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Help screen',
      home: Scaffold(
          body: Column(
        children: [
          SafeArea(
            child: Container(
              width: 150,
              height: 150,
              child: Image.network(''),
            ),
          ),
          TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                prefix: Text('+91'),
                prefixIcon: Icon(Icons.arrow_drop_down)),
            maxLength: 10,
          ),
          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: 'Enter referral code(optional)',
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'SEND OTP(SMS)',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          Text('OR',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
        ],
      )),
    );
  }
}
