// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:redbus_app/screens/boarding_dropping_screen.dart';

class BusesShowingScreen extends StatelessWidget {
  BusesShowingScreen(
      {Key? key,
      required this.from,
      required this.to,
      required this.pickup,
      required this.dropping,
      required this.finalDate})
      : super(key: key);

  final String from, to;
  List<dynamic> pickup;
  List<dynamic> dropping;
  final String finalDate;

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection(from)
        .where('to', isEqualTo: to)
        .snapshots();

    return MaterialApp(
      title: 'Buses screen',
      theme: ThemeData(backgroundColor: Colors.pink[50]),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              icon: Icon(Icons.arrow_back)),
          backgroundColor: Color(0xFFEE5350),
          title: Text('$from ' + "->" + ' $to'),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _usersStream,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: Text("Loading......",
                      style: TextStyle(color: Colors.blue, fontSize: 15)));
            }

            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                return InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12)),
                    height: 150,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                child: Image.network(
                                    'https://static.vecteezy.com/system/resources/thumbnails/001/500/616/small/building-icon-free-vector.jpg'),
                              ),
                              Text('1 REST STOP',
                                  style: TextStyle(fontSize: 12))
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  data['Time'],
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text('Price: ${data['Amount']} ₹',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ]),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                child: Image.network(
                                    'https://cdn-icons-png.flaticon.com/512/269/269947.png'),
                                height: 25,
                                width: 25,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(data['Name'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(children: [
                            Text('Ac/Sleeper (2+1)',
                                style: TextStyle(fontSize: 12)),
                          ]),
                          SizedBox(
                            height: 5,
                          ),
                          Row(children: [
                            Text(
                                'Return trip redDeal:Unlock min.₹ 100 on return ticket',
                                style:
                                    TextStyle(fontSize: 12, color: Colors.red)),
                          ]),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BoardingScreen(
                            from: from,
                            to: to,
                            id: data['id'],
                            company: data['Name'],
                            time: data['Time'],
                            amount: data['Amount'],
                            pickup: data['Pickup'],
                            dropping: data['Dropping'],
                            finalDate: finalDate),
                      ),
                    );
                  },
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
