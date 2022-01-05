// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:redbus_app/common/custrom_button.dart';
import 'package:redbus_app/screens/buses_screen.dart';

class BusHomeScreen extends StatefulWidget {
  const BusHomeScreen({Key? key}) : super(key: key);

  @override
  _BusHomeScreenState createState() => _BusHomeScreenState();
}

class _BusHomeScreenState extends State<BusHomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fromController = TextEditingController();
  final _toController = TextEditingController();
  var date;
  String from = '';
  String to = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BusScreen',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              color: Colors.redAccent,
              height: 350,
            ),
            SizedBox(
              height: 350,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: [
                      Text(
                        '       Bus tickets',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                      SizedBox(
                        width: 150,
                      ),
                      CircleAvatar(
                          backgroundColor: Colors.red,
                          backgroundImage: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJZiGVwdXRcOMSinjoVPb1GehiOZdevGqK5gF-2igFSA0IJXQvz40mGNpaL5sWOkIbh5c&usqp=CAU')),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(14.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _fromController,
                            onChanged: (value) => from = value,
                            decoration: InputDecoration(
                              hintText: 'From',
                              prefixIcon: Icon(Icons.directions_bus),
                            ),
                          ),
                          SizedBox(
                            height: 05,
                          ),
                          TextFormField(
                            controller: _toController,
                            onChanged: (value) => to = value,
                            decoration: InputDecoration(
                                hintText: 'To',
                                prefixIcon: Icon(Icons.directions_bus)),
                          ),
                          TextFormField(
                            controller: date,
                            onChanged: (value) => date = value,
                            decoration: InputDecoration(
                              hintText: 'Wed, 5 Jan',
                              prefixIcon: Icon(Icons.today),
                              suffixIcon: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'TODAY\t',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          color: Colors.blueAccent[200]),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'TOMORROW\t',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          color: Colors.blueAccent[200]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 330,
                            child: CustomButton(
                              child: Text('SEARCH'),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BusesShowingScreen()));
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'YOU CAN ALSO BOOK',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              print("Container clicked");
                            },
                            child: Container(
                              color: Colors.white,
                              height: 60,
                              width: 100,
                              child: ListTile(
                                title: Text(
                                  ' rYde',
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 24),
                                ),
                                subtitle: Text(
                                  'cab/bus or hire',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              print("Container clicked");
                            },
                            child: Container(
                              color: Colors.white,
                              height: 60,
                              width: 100,
                              child: ListTile(
                                title: Image.network(
                                  'https://st.redbus.in/Images/redrail/rail_logo.png',
                                ),
                                subtitle: Text(
                                  ' redRail',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              print("Container clicked");
                            },
                            child: Container(
                              color: Colors.white,
                              height: 60,
                              width: 100,
                              child: ListTile(
                                title: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTN1j_JRZFC8Wod_zbEkXuyqe2-iePdY319SCdthV_Y3IUnfmZLy3ilknz_tU7uSVd6QWs&usqp=CAU'),
                                ),
                                subtitle: Text(
                                  '     rPool',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            color: Colors.red,
                            height: 120,
                            width: 200,
                            child: ListTile(
                              title: Container(
                                height: 75,
                                width: 75,
                                child: Image.network(
                                    'https://st.redbus.in/Images/INDOFFER/GOLDENTICKET/274x147.png'),
                              ),
                              subtitle: Text('You can also win 1gm gold !*',
                                  style: TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 14,
                                  )),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            color: Colors.green[50],
                            height: 120,
                            width: 200,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.red,
                                backgroundImage: NetworkImage(
                                    'https://media.istockphoto.com/vectors/medical-syringe-vaccine-isolated-icon-vector-id1281043587?k=20&m=1281043587&s=612x612&w=0&h=dxMht4BcKp9fXypnkvlOJZJLIVwsHvOTzBOjtxoPumU='),
                              ),
                              title: Text(
                                'Share your vaccination status with redBus and get 50 in your redBus wallet\nshare now ',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            color: Colors.blue[50],
                            height: 120,
                            width: 200,
                            child: ListTile(
                              leading: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Image.network(
                                  'https://media.istockphoto.com/vectors/newspaper-flat-icon-news-color-icons-in-trendy-flat-style-publication-vector-id1178385248',
                                ),
                                height: 50,
                                width: 50,
                              ),
                              title: Text(
                                'COVID-19\nTravel Guidelines\nCheck the latest travel guidelines issued by state governments.',
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            color: Colors.white,
                            height: 120,
                            width: 200,
                            child: ListTile(
                              leading: Container(
                                child: Image.network(
                                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSIizD68JNYhdMFQTbIZh-Kk0kbnPbQB3Fkw&usqp=CAU'),
                                height: 50,
                                width: 50,
                              ),
                              subtitle: Column(children: [
                                Text(
                                  'redBus values the safety and well-being of our customers\n',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                  width: 100,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text(
                                      'KnowMore',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'OFFERS',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          SizedBox(
                            width: 230,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'ViewAll',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Get best deals with great discounts and offers',
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            color: Colors.pink[100],
                            height: 120,
                            width: 200,
                            child: ListTile(
                              leading: Container(
                                child: Image.network(
                                    'https://st.redbus.in/Images/INDOFFER/GOLDENTICKET/274x147.png'),
                                height: 55,
                                width: 55,
                              ),
                              subtitle: Column(children: [
                                Text(
                                  'Chances to win 1gm gold+Rs 50 assured cashback\nvalid till Jun 16',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 100,
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'CondApply*',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            color: Colors.amber[200],
                            height: 120,
                            width: 200,
                            child: ListTile(
                              leading: CircleAvatar(
                                  child: Image.network(
                                      'https://previews.123rf.com/images/arcady31/arcady311606/arcady31160600002/59113161-special-offer-red-star-icon.jpg')),
                              title: Text(
                                'Use promo code to reduce your price by 20 ₹ ',
                              ),
                              subtitle: Text(
                                'PROMO CODE:Info123',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            color: Colors.blue[100],
                            height: 120,
                            width: 200,
                            child: ListTile(
                              leading: Container(
                                child: Image.network(
                                    'https://st.redbus.in/Images/INDOFFER/GOLDENTICKET/274x147.png'),
                                height: 55,
                                width: 55,
                              ),
                              subtitle: Column(children: [
                                Text(
                                  'Save upto Rs 250 on bus tickets\ntill: 31 Jan\n',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 100,
                                  child: Text(
                                    'Use Code:FIRST',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
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
