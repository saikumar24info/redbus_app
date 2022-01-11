// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({Key? key}) : super(key: key);

  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.blueGrey[50],
      ),
      title: 'MyAccount',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFEE5350),
          title: Text(
            'My Account',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: 120,
              child: Card(
                child: ListTile(
                  title: Text('\nsign up or Login to manage your trips'),
                  subtitle: Row(
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text('LOGIN'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('SIGN UP'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        onPressed: () => _signOut(),
                        child: Text('SIGN OUT'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                children: [
                  _customListTile(
                    'My Bookings',
                    () {},
                  ),
                  _customListTile(
                    'Wallet',
                    () {},
                  ),
                  _customListTile(
                    'Refer & Earn',
                    () {},
                  ),
                  _customListTile(
                    'Offers',
                    () {},
                  ),
                  _customListTile(
                    'COWIN VAX CERTIFICATE',
                    () {},
                  ),
                  _customListTile(
                    'Help',
                    () {},
                  ),
                  _customListTile(
                    'Call Support',
                    () {},
                  ),
                  _customListTile(
                    'About Us',
                    () {},
                  ),
                  _customListTile(
                    'Settings',
                    () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _customListTile(String title, GestureTapCallback onTap) {
    return Container(
      height: 50,
      child: Card(
        elevation: 0,
        margin: EdgeInsets.all(2),
        child: GestureDetector(
          child: ListTile(
            leading: Text(title),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signOut() async {
    CircularProgressIndicator();

    await _auth.signOut();
  }
}
