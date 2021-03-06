// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:redbus_app/main.dart';
import 'package:redbus_app/screens/loading_screen.dart';

class DetailsScreen extends StatefulWidget {
  final String from, to, company, time, finalDate;
  final int amount;
  final List<String> savedSeats;
  DetailsScreen(
      {Key? key,
      required this.from,
      required this.to,
      required this.company,
      required this.amount,
      required this.time,
      required this.finalDate,
      required this.savedSeats})
      : super(key: key);

  @override
  _DetailsScreenState createState() =>
      _DetailsScreenState(from, to, company, amount, time, finalDate);
}

class _DetailsScreenState extends State<DetailsScreen> {
  final String from, to, company, time, finalDate;
  final int amount;
  String age = '';
  final List<String> savedSeats = [];
  _DetailsScreenState(
    this.from,
    this.to,
    this.company,
    this.amount,
    this.time,
    this.finalDate,
  );
  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 5), child: Text("Loading")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  final _formKey = GlobalKey<FormState>();
  String phoneno = '';
  var _insurance;
  var _selectGender;
  var _radioValue;
  String emailid = '';
  String address = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[100],
        primarySwatch: Colors.red,
      ),
      title: 'Details screen',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFFEE5350),
          title: Text(from + " --> " + to),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
            child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 2,
              ),
              Text(
                'Contact Information',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    height: 245,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Email ID',
                          style: TextStyle(color: Colors.black45),
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "*Required emailid";
                            }
                            if (!value.contains('@')) {
                              return "*Enter correct emailid";
                            }
                          },
                        ),
                        ListTile(
                          leading: Text('+91'),
                          title: TextFormField(
                            keyboardType: TextInputType.phone,
                            onChanged: (value) {
                              phoneno = value;
                            },
                            validator: (value) {
                              if (value!.length != 10) {
                                return '*Enter correct phone number';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(hintText: 'Phone'),
                          ),
                        ),
                        ListTile(
                          leading: Text('Address:'),
                          title: TextFormField(
                            onChanged: (value) {
                              address = value;
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return '*Enter address';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Passenger Information',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    height: 350,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Contact Information',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text('SeatNo 1'),
                          ],
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty ||
                                value.length <= 3 ||
                                value.contains('#') ||
                                value.contains('@') ||
                                value.contains('%') ||
                                value.contains('&') ||
                                value.contains('^') ||
                                value.contains('*') ||
                                value.contains('?') ||
                                value.contains('!') ||
                                value.contains(RegExp(r'[0-9]'))) {
                              return "*Required valid username";
                            }
                            return null;
                          },
                          decoration: InputDecoration(hintText: 'Name'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          maxLength: 2,
                          keyboardType: TextInputType.phone,
                          onChanged: (value) {
                            age = value;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "*Required this field";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(hintText: 'Age'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Gender'),
                        ListTile(
                          leading: Radio<String>(
                            value: 'Male',
                            groupValue: _selectGender,
                            onChanged: (value) {
                              setState(() {
                                _selectGender = value!;
                              });
                            },
                          ),
                          title: const Text('Male'),
                        ),
                        ListTile(
                          leading: Radio<String>(
                            value: 'FeMale',
                            groupValue: _selectGender,
                            onChanged: (value) {
                              setState(() {
                                _selectGender = value!;
                              });
                            },
                          ),
                          title: const Text('FeMale'),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text('Add Passenger'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 25,
                              width: 100,
                              child: Image.network(
                                  'https://www.icicilombard.com/gi/newsletters/Rest_Assured/images/icici_logo.png'),
                            ),
                            Text(
                              'Travel Insurance',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Text(
                              'T&C Apply',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Divider(
                          thickness: 1,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://cdn1.vectorstock.com/i/1000x1000/93/85/luggage-icon-suitcases-and-bags-travel-baggage-vector-19669385.jpg'),
                                  backgroundColor: Colors.brown,
                                ),
                                Text(
                                  'Upto 5,000',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.green),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'In the event of\nloss of luggage',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 10),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX22409428.jpg'),
                                  backgroundColor: Colors.brown,
                                ),
                                Text(
                                  'Upto 1,00,000',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.green),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'In the event of accidental\nhospitaisation',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 10),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      'https://img.freepik.com/free-vector/man-with-broken-leg-sitting-wheelchair_107173-15078.jpg?size=338&ext=jpg'),
                                  backgroundColor: Colors.brown,
                                ),
                                Text(
                                  'Upto 6,00,000',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.green),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'In case of death\n/PTD/PPD',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 10),
                                ),
                              ],
                            ),
                          ],
                        ),
                        ListTile(
                          title: Text(
                            'Yes, Protect my trip at 15\n(1 Passenger)',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          leading: Radio(
                            groupValue: _insurance,
                            value: 'yes',
                            onChanged: (value) {
                              setState(() {
                                _insurance = value;
                              });
                            },
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'No, I would like to proceed without insurance',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          leading: Radio(
                            groupValue: _insurance,
                            value: 'No',
                            onChanged: (value) {
                              setState(() {
                                _insurance = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        flutterLocalNotificationsPlugin.show(
                            0,
                            "RedBus",
                            "Booking Successful!",
                            NotificationDetails(
                                android: AndroidNotificationDetails(
                                    channel.id, channel.name,
                                    importance: Importance.high,
                                    color: Colors.blue,
                                    playSound: true,
                                    icon: '@mipmap/ic_launcher')));
                        Future.delayed(Duration(seconds: 5));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoadingScreen(),
                            ));
                      } catch (e) {
                        print(e.toString());
                      }
                    }
                  },
                  child: Text('PROCEED'),
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
