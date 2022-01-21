// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:redbus_app/phone_authentication/phone_login_screen.dart';
import 'package:redbus_app/screens/details_screen.dart';
import 'package:redbus_app/screens/help_screen.dart';
import 'package:redbus_app/screens/home_Screen/buses_screen.dart';
import 'package:redbus_app/screens/home_Screen/home_screen.dart';
import 'package:redbus_app/screens/home_Screen/ryde_screen.dart';
import 'package:redbus_app/screens/my_account.dart';
import 'package:redbus_app/screens/my_bookings_screen.dart';
import 'package:redbus_app/screens/rail_screen.dart';
import 'package:redbus_app/screens/rpool_screen.dart';
import 'package:redbus_app/screens/seats_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'red bus',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => BusHomeScreen(),
        '/ryde': (context) => RyderScreen(),
        '/redrail': (context) => RailScreen(),
        '/rPool': (context) => RpoolScreen(),
        '/mybooking': (context) => MyBookingsScreen(),
        '/help': (context) => HelpScreen(),
        '/account': (context) => MyAccountScreen(),
        '/mobile': (context) => MobileLoginScreen(),
      },
      home: BusHomeScreen(),
    );
  }
}
