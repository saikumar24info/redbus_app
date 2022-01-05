// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:redbus_app/common/custom_tile.dart';


class BusesShowingScreen extends StatefulWidget {
  const BusesShowingScreen({Key? key}) : super(key: key);

  @override
  _BusesShowingScreenState createState() => _BusesShowingScreenState();
}

class _BusesShowingScreenState extends State<BusesShowingScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                border: Border.all(),
                borderRadius: BorderRadius.circular(25.0),
              ),
              height: MediaQuery.of(context).size.height * 0.4,
            ),
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: Image.network(
                        'https://cdn-icons-png.flaticon.com/128/741/741411.png'),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'from',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        '⇄',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        'to',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 65,
                  ),
                  SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: CustomList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
