// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
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

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
  print(message.data);
  flutterLocalNotificationsPlugin.show(
      message.data.hashCode,
      message.data['title'],
      message.data['body'],
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
        ),
      ));
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Notifications',
  importance: Importance.high,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  getToken();
  runApp(
    MyApp(),
  );
}

getToken() async {
  String? token = await FirebaseMessaging.instance.getToken();
  print("token: $token");
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mionap/ic_launcher');
    var initializeSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                icon: android.smallIcon,
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('A new onMessageOpenApp event was published');
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text('Welcome'),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text('you can book here'),
                    ],
                  ),
                ),
              );
            });
      }
    });
  }

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
        '/home': (context) => BusHomeScreen(from: '', to: ''),
        '/ryde': (context) => RyderScreen(),
        '/redrail': (context) => RailScreen(),
        '/rPool': (context) => RpoolScreen(),
        '/mybooking': (context) => MyBookingsScreen(),
        '/help': (context) => HelpScreen(),
        '/account': (context) => MyAccountScreen(),
        '/mobile': (context) => MobileLoginScreen(),
      },
      home: BusHomeScreen(from: '', to: ''),
    );
  }
}
