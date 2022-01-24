// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:redbus_app/common/radio_button.dart';
import 'package:redbus_app/common/radio_button2.dart';
import 'package:redbus_app/screens/seats_screen.dart';

class BoardingScreen extends StatelessWidget {
  BoardingScreen({
    Key? key,
    required this.from,
    required this.to,
    required this.id,
    required this.company,
    required this.time,
    this.amount,
    required this.pickup,
    required this.dropping,
  }) : super(key: key);
  final String from, to, id, company, time;
  final amount;
  final List<dynamic> pickup;
  final List<dynamic> dropping;

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
                indicatorColor: Colors.white,
                tabs: [Text('BOARDING\n${from}'), Text('DROPPING\n${to}')]),
          ),
          body: TabBarView(
            children: [
              Tab(
                child: ListTile(
                  title: RadioButtonWidget(
                    from: from,
                    id: id,
                    pickup: pickup,
                  ),
                ),
              ),
              Tab(
                child: RadioButton2(
                  from: to,
                  id: id,
                  dropping: dropping,
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SeatsScreen(
                          from: from,
                          to: to,
                          id: id,
                          company: company,
                          time: time,
                          amount: amount),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}
