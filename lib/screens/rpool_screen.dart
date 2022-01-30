// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class RpoolScreen extends StatefulWidget {
  const RpoolScreen({Key? key}) : super(key: key);

  @override
  _RpoolScreenState createState() => _RpoolScreenState();
}

class _RpoolScreenState extends State<RpoolScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'rpool',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFEE5350),
          actions: [
            Padding(
              padding: EdgeInsets.all(5),
              child: Container(
                height: 50,
                width: 50,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://zenprospect-production.s3.amazonaws.com/uploads/pictures/613f38ca18c9ea00015cc2c4/picture'),
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Stack(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.82,
                color: Color(0xFFEE5350),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(children: [
                      Text(
                        'Communicating with City',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Container(
                        child: Image.network(
                            'https://media.istockphoto.com/vectors/red-car-isolated-on-white-background-vector-id924943756?k=20&m=924943756&s=612x612&w=0&h=LOg8WajXdF53Ghau8QJrykA0LpX9FOmxkZPaP7jpMXY='),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Share your rides on rPool,',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Bikepool & Carpool for Professionals',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Intra-City services currently live in BANGALORE,\n       HYDERABAD, and NEW DELHI-NCR\nOutstation services currently live across India',
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  SizedBox(height: 5),
                  Container(
                    height: 70,
                    width: 150,
                    child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxO0WN_YFmzmUGxHUbjxh5c7PZpcu2tffpSw&usqp=CAU'),
                  )
                ]),
              ),
            ]),
            Text(
              'How it works',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            Row(
              children: [
                Text(
                  '        Activate',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                SizedBox(width: 5),
                Text(
                  'acccount',
                  style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
