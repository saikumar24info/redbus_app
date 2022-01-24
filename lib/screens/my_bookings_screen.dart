// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyBookingsScreen extends StatefulWidget {
  const MyBookingsScreen({Key? key}) : super(key: key);

  @override
  _MyBookingsScreenState createState() => _MyBookingsScreenState();
}

class _MyBookingsScreenState extends State<MyBookingsScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          backgroundColor: Colors.brown,
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: Colors.blue[25]),
      title: 'bookings screen',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFEE5350),
          title: Text('My Bookings'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Card(
              elevation: 10,
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Looks empty, no trips found',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFEE5350),
                        ),
                      ),
                      Text(
                        'Please login to see all your bookings.',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 500,
            ),
            Container(
              color: Color(0xFFEE5350),
              height: 50,
              width: 360,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('LOGIN'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
