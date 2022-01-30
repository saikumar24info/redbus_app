// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:redbus_app/common/custrom_button.dart';
import 'package:redbus_app/screens/home_Screen/buses_screen.dart';
import 'package:redbus_app/screens/home_Screen/search_screen1.dart';
import 'package:redbus_app/screens/home_Screen/search_screen2.dart';
import '../../main.dart';
import 'package:intl/intl.dart';

class BusHomeScreen extends StatefulWidget {
  final String from;
  final String to;
  const BusHomeScreen({Key? key, required this.from, required this.to})
      : super(key: key);

  @override
  _BusHomeScreenState createState() => _BusHomeScreenState(from, to);
}

class _BusHomeScreenState extends State<BusHomeScreen> {
  _BusHomeScreenState(this.from, this.to);

  final _formKey = GlobalKey<FormState>();
  var _fromController = TextEditingController();
  final _toController = TextEditingController();
  var date;
  String from;
  String to;
  String finalDate = '';
  List<String> month = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];
  @override
  void initState() {
    var now = DateTime.now();
    finalDate = DateFormat.yMMMMd().format(now);
    setState(() {
      _fromController.text = from;
      _toController.text = to;
    });
  }

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 0)),
      lastDate: DateTime.now().add(Duration(days: 20)),
    );
    if (selected != null && selected != selectedDate)
      setState(() {
        selectedDate = selected;
        finalDate = month[selectedDate.month - 1] +
            " ${selectedDate.day}, ${selectedDate.year}";
      });
  }

  Widget build(BuildContext context) {
    void _onItemTapped(int index) {}
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BusScreen',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[50],
        // primaryColor: Color(0xFFEE5350),
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  icon: Icon(Icons.home_outlined,
                      size: 35, color: Colors.black45)),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/mybooking');
                  },
                  icon: Icon(Icons.menu, color: Colors.black45)),
              title: Text(
                'My Bookings',
                style: TextStyle(color: Colors.black45),
              ),
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.headphones, color: Colors.black45),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/help',
                  );
                },
              ),
              title: Text('Help'),
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.person, color: Colors.black45),
                onPressed: () {
                  Navigator.pushNamed(context, '/account');
                },
              ),
              title: Text('MyAccount'),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                color: Color(0xFFEE5350),
                height: 350,
              ),
              Column(
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
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: CircleAvatar(
                            backgroundColor: Color(0xFFEE5350),
                            backgroundImage: NetworkImage(
                                // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJZiGVwdXRcOMSinjoVPb1GehiOZdevGqK5gF-2igFSA0IJXQvz40mGNpaL5sWOkIbh5c&usqp=CAU'
                                'https://zenprospect-production.s3.amazonaws.com/uploads/pictures/613f38ca18c9ea00015cc2c4/picture')),
                      ),
                    ],
                  ),
                  Stack(children: [
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
                              readOnly: true,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '*This field is required';
                                } else {
                                  return null;
                                }
                              },
                              controller: _fromController,
                              onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SearchScreen1(to: to),
                                  )),
                              decoration: InputDecoration(
                                hintText: 'from',
                                prefixIcon: Opacity(
                                    opacity: 0,
                                    child: Icon(Icons.directions_bus)),
                              ),
                            ),
                            Stack(children: [
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return '*This field is required';
                                  } else {
                                    return null;
                                  }
                                },
                                readOnly: true,
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          SearchScreen2(from: from),
                                    )),
                                controller: _toController,
                                onChanged: (value) => to = value,
                                decoration: InputDecoration(
                                  hintText: 'to',
                                  prefixIcon: Opacity(
                                      opacity: 0,
                                      child: Icon(Icons.directions_bus)),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 275,
                                child: Container(
                                  child: Icon(Icons.directions_bus),
                                ),
                              ),
                            ]),
                            Stack(children: [
                              GestureDetector(
                                onTap: () {
                                  _selectDate(context);
                                },
                                child: AbsorbPointer(
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.today),
                                      hintText: '$finalDate',
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 1,
                                right: 264,
                                child: Container(
                                  child: IconButton(
                                    onPressed: () {
                                      _selectDate(context);
                                    },
                                    icon: Icon(Icons.today),
                                  ),
                                ),
                              ),
                            ]),
                            SizedBox(
                              width: 330,
                              child: CustomButton(
                                child: Text('SEARCH'),
                                onPressed: () {
                                  print(finalDate);
                                  if (_formKey.currentState!.validate()) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            BusesShowingScreen(
                                                from: from,
                                                to: to,
                                                dropping: [],
                                                pickup: [],
                                                finalDate: finalDate),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 35,
                      right: 298,
                      child: Container(
                        child: Icon(Icons.directions_bus),
                      ),
                    ),
                  ]),
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
                              Navigator.pushNamed(context, '/ryde');
                            },
                            child: Card(
                              elevation: 8,
                              shadowColor: Colors.grey[30],
                              child: Container(
                                margin: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                height: 60,
                                width: 100,
                                child: ListTile(
                                  title: Text(
                                    ' rYde',
                                    style: TextStyle(
                                        color: Color(0xFFEF5350), fontSize: 20),
                                  ),
                                  subtitle: Text(
                                    'Cab/Bus Hire',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 11),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/redrail');
                            },
                            child: Card(
                              elevation: 8,
                              shadowColor: Colors.grey[30],
                              child: Container(
                                margin: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
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
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/rPool');
                            },
                            child: Card(
                              elevation: 8,
                              shadowColor: Colors.grey[30],
                              child: Container(
                                margin: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
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
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            color: Color(0xFFEE5350),
                            height: 140,
                            width: 240,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Image.network(
                                  'https://st.redbus.in/Images/INDOFFER/GOLDENTICKET/DY/1.png'),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 150,
                            width: 250,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Image.network(
                                  'https://st.redbus.in/Images/ind/cowin_cert.png'),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 150,
                            width: 250,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Image.network(
                                  'https://st.redbus.in/Images/ind/COVID-19guidelines.png'),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 150,
                            width: 250,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Image.network(
                                  'https://st.redbus.in/Images/home/cards_flexi_image.png'),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 150,
                            width: 250,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Image.network(
                                  'https://s3.rdbuz.com/Images/safety/home/safetyhomecard.png'),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: 150,
                            width: 250,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Image.network(
                                  'https://st.redbus.in/Images/corona/800x300.png'),
                            ),
                          ),
                        ],
                      ),
                    ),
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
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.indigo[400],
                            ),
                            height: 130,
                            width: 300,
                            child: ListTile(
                              leading: Container(
                                child: Image.network(
                                    'https://st.redbus.in/Images/INDOFFER/GOLDENTICKET/274x147.png'),
                                height: 100,
                                width: 70,
                              ),
                              title: Text(
                                '\nChances to win 1gm gold+Rs 50 assured cashback\nvalid till: Jan 16\n',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                '\nUse Code :GOLDENTICKET',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.lightBlue[50],
                            ),
                            height: 130,
                            width: 300,
                            child: ListTile(
                              leading: SizedBox(
                                height: 180,
                                width: 100,
                                child: Image.network(
                                    'https://st.redbus.in/Images/INDOFFER/Nonatak/new/80x80.png'),
                              ),
                              title: Text(
                                '\nSave Upto Rs 250 on bus tickets\nvalid till 31 Jan\n ',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                'USE CODE:FIRST',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.indigo[400],
                            ),
                            height: 130,
                            width: 300,
                            child: ListTile(
                              leading: SizedBox(
                                height: 180,
                                width: 100,
                                child: Image.network(
                                    'https://st.redbus.in/Images/INDOFFER/WINTER/274X147.png'),
                              ),
                              title: Text(
                                '\nGet 10% off up to Rs 150 on Gujarat routes\nvalid till: 16 Jan\n ',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                'USE CODE:WINTER10',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: 150,
                            width: 250,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Image.network(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1exqjGjndyxTddgvaZ-Myry1qAPUlw1wov6zlfdw5nrqi6QWv-msJTO5c8ChPtHD5-fA&usqp=CAU'),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: 150,
                            width: 250,
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: Image.network(
                                  'https://cdn.grabon.in/gograbon/images/web-images/uploads/1618579554027/redbus-coupons.jpg'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
