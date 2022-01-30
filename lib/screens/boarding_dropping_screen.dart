// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:redbus_app/common/radio_button.dart';
import 'package:redbus_app/common/radio_button2.dart';
import 'package:redbus_app/screens/seats_screen.dart';

class BoardingScreen extends StatefulWidget {
  final String from, to, id, company, time, finalDate;
  final amount;
  final List<dynamic> pickup;
  final List<dynamic> dropping;
  const BoardingScreen(
      {Key? key,
      required this.from,
      required this.to,
      required this.id,
      required this.company,
      required this.time,
      this.amount,
      required this.pickup,
      required this.dropping,
      required this.finalDate})
      : super(key: key);

  @override
  _BoardingScreenState createState() => _BoardingScreenState(
      from, to, id, company, time, amount, pickup, dropping, finalDate);
}

class _BoardingScreenState extends State<BoardingScreen> {
  final String from, to, id, company, time, finalDate;
  final amount;
  final List<dynamic> pickup;
  final List<dynamic> dropping;
  var radioItem;
  var radioItem1;

  _BoardingScreenState(this.from, this.to, this.id, this.company, this.time,
      this.amount, this.pickup, this.dropping, this.finalDate);
  @override
  Widget build(BuildContext context) {
    var _result;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey[100],
        primarySwatch: Colors.red,
      ),
      title: 'Boarding-Dropping',
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back)),
            backgroundColor: Colors.red,
            title: Text('$from --> $to'),
            bottom: TabBar(
                indicatorWeight: 3.0,
                indicatorColor: Colors.white,
                tabs: [Text('BOARDING\n${from}'), Text('DROPPING\n${to}')]),
          ),
          body: TabBarView(
            children: [
              Tab(
                child: ListView.builder(
                  itemCount: pickup.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(pickup[index]),
                    leading: Radio<dynamic>(
                      value: pickup[index],
                      groupValue: radioItem,
                      onChanged: (value) {
                        setState(() {
                          radioItem = value;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Tab(
                child: ListView.builder(
                  itemCount: dropping.length,
                  itemBuilder: (context, index) => ListTile(
                      title: Text(dropping[index]),
                      leading: Radio<dynamic>(
                        value: dropping[index],
                        groupValue: radioItem1,
                        onChanged: (value) {
                          setState(() {
                            radioItem1 = value;
                          });
                        },
                      )),
                ),
              ),
            ],
          ),
          floatingActionButton: SizedBox(
            height: 50,
            width: 330,
            child: ElevatedButton(
                child: Text('PROCEED'),
                onPressed: () {
                  print(finalDate);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SeatsScreen(
                        from: from,
                        to: to,
                        id: id,
                        company: company,
                        time: time,
                        amount: amount,
                        finalDate: finalDate,
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
