// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:redbus_app/common/custom_tile.dart';
import 'package:redbus_app/common/data.dart';

class BusesShowingScreen extends StatefulWidget {
  const BusesShowingScreen({Key? key}) : super(key: key);

  @override
  _BusesShowingScreenState createState() => _BusesShowingScreenState();
}

class _BusesShowingScreenState extends State<BusesShowingScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buses screen',
      theme: ThemeData(backgroundColor: Colors.pink[50]),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
              title: Text(
                'Hyderabad-Vijayawada',
                style: TextStyle(color: Colors.black),
              ),
              actions: [ 
               SizedBox(height: 30,),
                Text('6 Jan',textAlign: TextAlign.center, style: TextStyle(color: Colors.black),)],
              backgroundColor: Colors.white70,
              pinned: true,
              snap: false,
              floating: false,
              expandedHeight: 100.0,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int i) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 100,
                    child: ListTile(
                      title: Row(children: [
                        Container(
                            width: 30,
                            height: 30,
                            color: Colors.yellow,
                            child: Image.network(
                                'https://cdn-icons-png.flaticon.com/128/269/269947.png')),
                        SizedBox(
                          width: 10,
                        ),
                        Text('${data[i].busName}'),
                      ]),
                      trailing: Text('₹ ${data[i].amount}'),
                      subtitle: Row(children: [
                        Text('${data[i].time}'),
                        Text('\nA/c Seater / Sleeper (2+1)'),
                      ]),
                    ),
                  );
                },
                childCount: data.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
